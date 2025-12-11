REMOTE_HOST ?= user@example.com
REMOTE_PATH ?= /var/www/cinema
REMOTE ?= origin
BRANCH ?= main

.PHONY: push ssh-remote-git-pull deploy

push:
	git push $(REMOTE) $(BRANCH)

ssh-remote-git-pull:
	ssh $(REMOTE_HOST) 'set -e; cd $(REMOTE_PATH) && git pull $(REMOTE) $(BRANCH)'

deploy: push ssh-remote-git-pull
