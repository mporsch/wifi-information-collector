#ifndef __UTIL_H
#define __UTIL_H

#include "collector.h"

int nl80211_init(struct nl80211_state *state);
void nl80211_cleanup(struct nl80211_state *state);
int phy_lookup(char *name);
int error_handler(struct sockaddr_nl *nla, struct nlmsgerr *err,
		  void *arg);
int finish_handler(struct nl_msg *msg, void *arg);
int ack_handler(struct nl_msg *msg, void *arg);
int handle_cmd(struct nl80211_state *state, signed long long devidx,
	       enum id_input idby, enum command_identify_by command_idby,
	       const struct cmd *cmd);

#endif
