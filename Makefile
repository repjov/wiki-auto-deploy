enviroment = develop
path = ~/.ssh/id_rsa
user = root

ifeq ($(enviroment),develop)
	playbook = "playbook_dev.yml"
endif
ifeq ($(enviroment),production)
	playbook = "playbook_prod.yml"
endif
ifeq ($(enviroment),inside)
	playbook = "playbook_ci.yml"
endif

deploy:
	ansible-playbook \
		--connection=ssh \
		--timeout=30 \
		--extra-vars="ansible_ssh_user='$(user)'" \
		--extra-vars="ansible_ssh_private_key_file='$(path)'" \
		--ask-vault-pass \
		--limit="all" \
		--inventory-file=inventory \
		$(playbook)