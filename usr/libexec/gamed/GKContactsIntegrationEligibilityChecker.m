@interface GKContactsIntegrationEligibilityChecker
- (BOOL)isEligibleAllowingIneligibility:(unint64_t)a3 usingSettings:(id)a4 localPlayerInternal:(id)a5 isConnectionManagerReady:(BOOL)a6 loggingEnabled:(BOOL)a7 withContext:(id)a8;
- (BOOL)isEligibleAllowingIneligibility:(unint64_t)a3 usingSettings:(id)a4 localPlayerInternal:(id)a5 isConnectionManagerReady:(BOOL)a6 withContext:(id)a7;
- (unint64_t)currentIneligibilityUsingSettings:(id)a3 localPlayerInternal:(id)a4 isConnectionManagerReady:(BOOL)a5 loggingEnabled:(BOOL)a6 withContext:(id)a7;
@end

@implementation GKContactsIntegrationEligibilityChecker

- (BOOL)isEligibleAllowingIneligibility:(unint64_t)a3 usingSettings:(id)a4 localPlayerInternal:(id)a5 isConnectionManagerReady:(BOOL)a6 withContext:(id)a7
{
  BOOL v7 = a6;
  v12 = os_log_GKContacts;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  LOBYTE(v7) = [(GKContactsIntegrationEligibilityChecker *)self isEligibleAllowingIneligibility:a3 usingSettings:v15 localPlayerInternal:v14 isConnectionManagerReady:v7 loggingEnabled:os_log_is_debug_enabled(v12) withContext:v13];

  return v7;
}

- (BOOL)isEligibleAllowingIneligibility:(unint64_t)a3 usingSettings:(id)a4 localPlayerInternal:(id)a5 isConnectionManagerReady:(BOOL)a6 loggingEnabled:(BOOL)a7 withContext:(id)a8
{
  return ([(GKContactsIntegrationEligibilityChecker *)self currentIneligibilityUsingSettings:a4 localPlayerInternal:a5 isConnectionManagerReady:a6 loggingEnabled:a7 withContext:a8] | a3) == a3;
}

- (unint64_t)currentIneligibilityUsingSettings:(id)a3 localPlayerInternal:(id)a4 isConnectionManagerReady:(BOOL)a5 loggingEnabled:(BOOL)a6 withContext:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  if (v8)
  {
    id v14 = +[NSMutableString string];
    if (v11)
    {
LABEL_3:
      unint64_t v15 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    id v14 = 0;
    if (v11) {
      goto LABEL_3;
    }
  }
  [v14 appendString:@"MissingSettings, "];
  unint64_t v15 = 1;
LABEL_6:
  if (([v11 allowUpdates] & 1) == 0)
  {
    [v14 appendString:@"NotAllowedInSettings, "];
    v15 |= 0x10uLL;
  }
  if (v12)
  {
    if ([v12 hasAcknowledgedLatestGDPR]) {
      goto LABEL_13;
    }
    CFStringRef v16 = @"HasNotAcceptedGDPR, ";
    uint64_t v17 = 32;
  }
  else
  {
    CFStringRef v16 = @"NoPrimaryPlayer, ";
    uint64_t v17 = 2;
  }
  [v14 appendString:v16];
  v15 |= v17;
LABEL_13:
  if (!a5)
  {
    [v14 appendString:@"IDSMissingAccount, "];
    v15 |= 4uLL;
  }
  if (([v11 allowUpdatesWithoutFriends] & 1) == 0)
  {
    v18 = +[GKFriendListEntryCacheObject _gkFetchRequest];
    id v19 = [v13 _gkCountObjectsFromRequest:v18];

    if (!v19)
    {
      [v14 appendString:@"NoFriends, "];
      v15 |= 8uLL;
    }
  }
  if ([v14 length])
  {
    if (!os_log_GKGeneral) {
      id v20 = (id)GKOSLoggers();
    }
    v21 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_1001370FC((uint64_t)v14, v21);
    }
  }

  return v15;
}

@end