@interface GKEntitlements
- (BOOL)_shouldBypasAuthenticationForConnection:(id)a3;
- (BOOL)hasAnyEntitlement;
- (BOOL)hasAnyPrivateEntitlement;
- (BOOL)hasEntitlements:(unint64_t)a3;
- (GKEntitlements)initWithConnection:(id)a3;
- (id)description;
- (id)grandfatheredEntitlementsForSpoofedApps;
- (unint64_t)_entitlementForName:(id)a3;
- (unint64_t)_valuesForEntitlement:(id)a3 forConnection:(id)a4;
@end

@implementation GKEntitlements

- (id)description
{
  v26.receiver = self;
  v26.super_class = (Class)GKEntitlements;
  v3 = [(GKEntitlements *)&v26 description];
  unint64_t entitlements = self->_entitlements;
  v5 = "Account";
  if ((entitlements & 1) == 0) {
    v5 = "";
  }
  v6 = "Profile";
  if ((entitlements & 2) == 0) {
    v6 = "";
  }
  v7 = "Friends";
  if ((entitlements & 4) == 0) {
    v7 = "";
  }
  v8 = "Games";
  if ((entitlements & 0x10) == 0) {
    v8 = "";
  }
  v9 = "GameStats";
  if ((entitlements & 0x20) == 0) {
    v9 = "";
  }
  v10 = "Challenges";
  if ((entitlements & 0x40) == 0) {
    v10 = "";
  }
  v11 = "Multiplayer";
  if ((entitlements & 0x80) == 0) {
    v11 = "";
  }
  v12 = "TurnBasedMultiplayer";
  if ((entitlements & 0x100) == 0) {
    v12 = "";
  }
  v13 = "Media";
  if ((entitlements & 0x400) == 0) {
    v13 = "";
  }
  v14 = "BypassAuthentication";
  if ((entitlements & (unint64_t)&_mh_execute_header) == 0) {
    v14 = "";
  }
  v15 = "AccountPrivate";
  if ((entitlements & 0x10000) == 0) {
    v15 = "";
  }
  v16 = "ProfilePrivate";
  if ((entitlements & 0x20000) == 0) {
    v16 = "";
  }
  v17 = "FriendsPrivate";
  if ((entitlements & 0x40000) == 0) {
    v17 = "";
  }
  v18 = "GamesPrivate";
  if ((entitlements & 0x100000) == 0) {
    v18 = "";
  }
  v19 = "GameStatsPrivate";
  if ((entitlements & 0x200000) == 0) {
    v19 = "";
  }
  v20 = "ChallengesPrivate";
  if ((entitlements & 0x400000) == 0) {
    v20 = "";
  }
  v21 = "MultiplayerPrivate";
  if ((entitlements & 0x800000) == 0) {
    v21 = "";
  }
  v22 = "TurnBasedMultiplayerPrivate";
  if ((entitlements & 0x1000000) == 0) {
    v22 = "";
  }
  if ((entitlements & 0x4000000) != 0) {
    v23 = "MediaPrivate";
  }
  else {
    v23 = "";
  }
  objc_msgSend(v3, "stringByAppendingFormat:", @" -- (%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s)", v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
    v21,
    v22,
  v24 = v23);

  return v24;
}

- (GKEntitlements)initWithConnection:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GKEntitlements;
  v5 = [(GKEntitlements *)&v19 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_25;
  }
  unint64_t v7 = [(GKEntitlements *)v5 _valuesForEntitlement:@"com.apple.private.game-center" forConnection:v4];
  v6->_unint64_t entitlements = [(GKEntitlements *)v6 _valuesForEntitlement:@"com.apple.developer.game-center" forConnection:v4] | (v7 << 16) | v7;
  v8 = [v4 valueForEntitlement:@"com.apple.private.game-center.bypass-authentication"];
  if (([v8 BOOLValue] & 1) != 0
    || [(GKEntitlements *)v6 _shouldBypasAuthenticationForConnection:v4])
  {
    v6->_entitlements |= (unint64_t)&_mh_execute_header;
  }
  v9 = [v4 valueForEntitlement:@"com.apple.accounts.appleaccount.fullaccess"];
  if ([v9 BOOLValue])
  {

LABEL_8:
    v6->_entitlements |= 0x200000000uLL;
    goto LABEL_9;
  }
  v10 = [v4 valueForEntitlement:@"com.apple.private.game-center.credential"];
  unsigned int v11 = [v10 BOOLValue];

  if (v11) {
    goto LABEL_8;
  }
LABEL_9:
  if (![(GKEntitlements *)v6 hasEntitlements:1527])
  {
    if (![(GKEntitlements *)v6 hasAnyPrivateEntitlement])
    {
      if (!os_log_GKGeneral) {
        id v12 = (id)GKOSLoggers();
      }
      v13 = os_log_GKDeveloper;
      if (os_log_type_enabled(os_log_GKDeveloper, OS_LOG_TYPE_ERROR)) {
        sub_1000B5BAC(v13);
      }
      if (!os_log_GKGeneral) {
        id v14 = (id)GKOSLoggers();
      }
      v15 = (void *)os_log_GKError;
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_1000B5AF0(v15, (uint64_t)v4);
      }
      v16 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        id v17 = (id)GKOSLoggers();
        v16 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_1000B5A34(v16, (uint64_t)v4);
      }
    }
    v6->_entitlements |= 0x5F7uLL;
  }

LABEL_25:
  return v6;
}

- (unint64_t)_valuesForEntitlement:(id)a3 forConnection:(id)a4
{
  v5 = [a4 valueForEntitlement:a3];
  if (objc_opt_respondsToSelector())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      unint64_t v9 = 0;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v6);
          }
          v9 |= -[GKEntitlements _entitlementForName:](self, "_entitlementForName:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
    else
    {
      unint64_t v9 = 0;
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    unint64_t v9 = [(GKEntitlements *)self _entitlementForName:v5];
  }
  else if ([v5 BOOLValue])
  {
    unint64_t v9 = 1527;
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (unint64_t)_entitlementForName:(id)a3
{
  uint64_t v3 = qword_1003296A8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1003296A8, &stru_1002D8C58);
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)qword_1003296A0, v4);

  return (unint64_t)Value;
}

- (BOOL)hasAnyPrivateEntitlement
{
  return (self->_entitlements & 0xFFFFFFFFFFFF0000) != 0;
}

- (BOOL)hasEntitlements:(unint64_t)a3
{
  return (a3 & ~self->_entitlements) == 0;
}

- (BOOL)hasAnyEntitlement
{
  return self->_entitlements != 0;
}

- (id)grandfatheredEntitlementsForSpoofedApps
{
  *((void *)self + 1) |= 0x105F705F7uLL;
  return self;
}

- (BOOL)_shouldBypasAuthenticationForConnection:(id)a3
{
  return 0;
}

@end