PROJECT = rabbitmq_auth_backend_amqp

DEPS = amqp_client rabbit
TEST_DEPS = rabbitmq_java_client

DEP_PLUGINS = rabbit_common/mk/rabbitmq-plugin.mk

# FIXME: Use erlang.mk patched for RabbitMQ, while waiting for PRs to be
# reviewed and merged.

ERLANG_MK_REPO = https://github.com/rabbitmq/erlang.mk.git
ERLANG_MK_COMMIT = rabbitmq-tmp

include rabbitmq-components.mk
include erlang.mk

# --------------------------------------------------------------------
# Testing.
# --------------------------------------------------------------------

WITH_BROKER_TEST_MAKEVARS := \
	RABBITMQ_CONFIG_FILE=$(CURDIR)/etc/rabbit-test
WITH_BROKER_TEST_SCRIPTS := \
	$(CURDIR)/test/test.sh

.PHONY: clean-compiled-examples

clean:: clean-compiled-examples

clean-compiled-examples:
	$(gen_verbose) rm -rf test/build
