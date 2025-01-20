@interface NNMKSyncSessionController
- (BOOL)deviceInStandalone;
- (NNMKSyncSessionController)init;
- (NSDate)lastSyncDueToMailboxesMismatchRequestTime;
- (NSMutableDictionary)notificationPayloadAcks;
- (NSMutableDictionary)standaloneStateByAccountId;
- (NSMutableDictionary)syncingAccountIdentityByUsername;
- (NSMutableSet)messageIdsToIgnoreStatusUpdates;
- (double)accountAuthRequestLastRequestTime;
- (unint64_t)standaloneStateForAccountId:(id)a3;
- (void)deleteStandaloneStateForAccountId:(id)a3;
- (void)setAccountAuthRequestLastRequestTime:(double)a3;
- (void)setDeviceInStandalone:(BOOL)a3;
- (void)setLastSyncDueToMailboxesMismatchRequestTime:(id)a3;
- (void)setMessageIdsToIgnoreStatusUpdates:(id)a3;
- (void)setNotificationPayloadAcks:(id)a3;
- (void)setStandaloneStateByAccountId:(id)a3;
- (void)setSyncingAccountIdentityByUsername:(id)a3;
- (void)updateStandaloneState:(unint64_t)a3 forAccountId:(id)a4;
@end

@implementation NNMKSyncSessionController

- (NNMKSyncSessionController)init
{
  v16.receiver = self;
  v16.super_class = (Class)NNMKSyncSessionController;
  v2 = [(NNMKSyncSessionController *)&v16 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    messageIdsToIgnoreStatusUpdates = v2->_messageIdsToIgnoreStatusUpdates;
    v2->_messageIdsToIgnoreStatusUpdates = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    notificationPayloadAcks = v2->_notificationPayloadAcks;
    v2->_notificationPayloadAcks = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    syncingAccountIdentityByUsername = v2->_syncingAccountIdentityByUsername;
    v2->_syncingAccountIdentityByUsername = v7;

    v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v10 = [v9 objectForKey:@"kSessionControllerStandaloneState"];
    uint64_t v11 = [v10 mutableCopy];
    standaloneStateByAccountId = v2->_standaloneStateByAccountId;
    v2->_standaloneStateByAccountId = (NSMutableDictionary *)v11;

    if (!v2->_standaloneStateByAccountId)
    {
      v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v14 = v2->_standaloneStateByAccountId;
      v2->_standaloneStateByAccountId = v13;
    }
  }
  return v2;
}

- (unint64_t)standaloneStateForAccountId:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_standaloneStateByAccountId objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)updateStandaloneState:(unint64_t)a3 forAccountId:(id)a4
{
  v6 = NSNumber;
  id v7 = a4;
  v8 = [v6 numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)self->_standaloneStateByAccountId setObject:v8 forKeyedSubscript:v7];

  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v9 setObject:self->_standaloneStateByAccountId forKey:@"kSessionControllerStandaloneState"];
}

- (void)deleteStandaloneStateForAccountId:(id)a3
{
  if (a3)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_standaloneStateByAccountId, "removeObjectForKey:");
    id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v4 setObject:self->_standaloneStateByAccountId forKey:@"kSessionControllerStandaloneState"];
  }
}

- (NSMutableSet)messageIdsToIgnoreStatusUpdates
{
  return self->_messageIdsToIgnoreStatusUpdates;
}

- (void)setMessageIdsToIgnoreStatusUpdates:(id)a3
{
}

- (NSMutableDictionary)notificationPayloadAcks
{
  return self->_notificationPayloadAcks;
}

- (void)setNotificationPayloadAcks:(id)a3
{
}

- (NSMutableDictionary)syncingAccountIdentityByUsername
{
  return self->_syncingAccountIdentityByUsername;
}

- (void)setSyncingAccountIdentityByUsername:(id)a3
{
}

- (NSMutableDictionary)standaloneStateByAccountId
{
  return self->_standaloneStateByAccountId;
}

- (void)setStandaloneStateByAccountId:(id)a3
{
}

- (double)accountAuthRequestLastRequestTime
{
  return self->_accountAuthRequestLastRequestTime;
}

- (void)setAccountAuthRequestLastRequestTime:(double)a3
{
  self->_accountAuthRequestLastRequestTime = a3;
}

- (NSDate)lastSyncDueToMailboxesMismatchRequestTime
{
  return self->_lastSyncDueToMailboxesMismatchRequestTime;
}

- (void)setLastSyncDueToMailboxesMismatchRequestTime:(id)a3
{
}

- (BOOL)deviceInStandalone
{
  return self->_deviceInStandalone;
}

- (void)setDeviceInStandalone:(BOOL)a3
{
  self->_deviceInStandalone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSyncDueToMailboxesMismatchRequestTime, 0);
  objc_storeStrong((id *)&self->_standaloneStateByAccountId, 0);
  objc_storeStrong((id *)&self->_syncingAccountIdentityByUsername, 0);
  objc_storeStrong((id *)&self->_notificationPayloadAcks, 0);
  objc_storeStrong((id *)&self->_messageIdsToIgnoreStatusUpdates, 0);
}

@end