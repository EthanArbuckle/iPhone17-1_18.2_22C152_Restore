@interface WBSCloudHistoryPushAgent
- (BOOL)_hasAcknowledgedPushNotifications;
- (BOOL)_hasUnacknowledgedPushNotifications;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (WBSCloudHistoryPushAgent)init;
- (id)_pushTopic;
- (id)_userDefaults;
- (void)_setHasAcknowlegedPushNotifications:(BOOL)a3;
- (void)_setHasUnacknowledgedPushNotifications:(BOOL)a3;
- (void)acknowledgePendingPushNotifications;
- (void)clearAcknowledgedPushNotifications;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)getPushNotifications:(id)a3;
- (void)queryMemoryFootprint:(id)a3;
@end

@implementation WBSCloudHistoryPushAgent

- (WBSCloudHistoryPushAgent)init
{
  v15.receiver = self;
  v15.super_class = (Class)WBSCloudHistoryPushAgent;
  v2 = [(WBSCloudHistoryPushAgent *)&v15 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.WBSCloudHistoryPushAgent.State", 0);
    pushNotificationStateQueue = v2->_pushNotificationStateQueue;
    v2->_pushNotificationStateQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.SafariCloudHistoryPushAgent"];
    xpcListener = v2->_xpcListener;
    v2->_xpcListener = (NSXPCListener *)v5;

    [(NSXPCListener *)v2->_xpcListener setDelegate:v2];
    [(NSXPCListener *)v2->_xpcListener resume];
    id v7 = objc_alloc(MEMORY[0x1E4F4E1E8]);
    uint64_t v8 = *MEMORY[0x1E4F4E1D0];
    uint64_t v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
    uint64_t v11 = [v7 initWithEnvironmentName:v8 namedDelegatePort:@"com.apple.aps.SafariCloudHistoryPushAgent" queue:v9];
    pushConnection = v2->_pushConnection;
    v2->_pushConnection = (APSConnection *)v11;

    [(APSConnection *)v2->_pushConnection setDelegate:v2];
    v13 = v2;
  }

  return v2;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(WBSCloudHistoryPushAgent *)self _pushTopic];
  v7[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [(APSConnection *)self->_pushConnection _setEnabledTopics:v6];
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1A1C8];
  v6 = objc_msgSend(a4, "userInfo", a3);
  id v7 = [v5 notificationFromRemoteNotificationDictionary:v6];

  if (!v7)
  {
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    id v10 = "Ignoring push notification because notification is nil";
    goto LABEL_12;
  }
  id v8 = [v7 containerIdentifier];
  if (![v8 isEqualToString:@"com.apple.SafariShared.History"])
  {
    char v11 = [v8 isEqualToString:@"com.apple.SafariShared.WBSCloudHistoryStore"];

    if (v11) {
      goto LABEL_7;
    }
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    id v10 = "Ignoring push notification because it is not about history";
LABEL_12:
    _os_log_impl(&dword_1A6B5F000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    goto LABEL_13;
  }

LABEL_7:
  v12 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6B5F000, v12, OS_LOG_TYPE_DEFAULT, "Received CloudHistory related push notification", buf, 2u);
  }
  pushNotificationStateQueue = self->_pushNotificationStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__WBSCloudHistoryPushAgent_connection_didReceiveIncomingMessage___block_invoke;
  block[3] = &unk_1E5C8CA70;
  block[4] = self;
  dispatch_async(pushNotificationStateQueue, block);
LABEL_13:
}

void __65__WBSCloudHistoryPushAgent_connection_didReceiveIncomingMessage___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setHasUnacknowledgedPushNotifications:1];
  id v1 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v1 postNotificationName:@"com.apple.SafariShared.CloudHistory.PushReceived" object:0];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.private.safari.can-use-history-push-agent"];
  char v7 = [v6 BOOLValue];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC2AE78];
    [v5 setExportedInterface:v8];

    [v5 setExportedObject:self];
    [v5 resume];
  }
  else
  {
    uint64_t v9 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WBSCloudHistoryPushAgent listener:shouldAcceptNewConnection:](v11, [v5 processIdentifier], v9);
    }
  }
  return v7;
}

- (void)getPushNotifications:(id)a3
{
  id v4 = a3;
  pushNotificationStateQueue = self->_pushNotificationStateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __49__WBSCloudHistoryPushAgent_getPushNotifications___block_invoke;
  v7[3] = &unk_1E5C8C660;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(pushNotificationStateQueue, v7);
}

uint64_t __49__WBSCloudHistoryPushAgent_getPushNotifications___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) _hasUnacknowledgedPushNotifications];
  uint64_t v4 = [*(id *)(a1 + 32) _hasAcknowledgedPushNotifications];
  id v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  return v5(v2, v3, v4);
}

- (void)queryMemoryFootprint:(id)a3
{
  uint64_t v3 = (void (**)(id, void *, id))a3;
  id v6 = 0;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F97ED8]) initWithError:&v6];
  id v5 = v6;
  v3[2](v3, v4, v5);
}

- (void)acknowledgePendingPushNotifications
{
  pushNotificationStateQueue = self->_pushNotificationStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__WBSCloudHistoryPushAgent_acknowledgePendingPushNotifications__block_invoke;
  block[3] = &unk_1E5C8CA70;
  block[4] = self;
  dispatch_async(pushNotificationStateQueue, block);
}

uint64_t __63__WBSCloudHistoryPushAgent_acknowledgePendingPushNotifications__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _hasUnacknowledgedPushNotifications];
  if (result)
  {
    [*(id *)(a1 + 32) _setHasUnacknowledgedPushNotifications:0];
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _setHasAcknowlegedPushNotifications:1];
  }
  return result;
}

- (void)clearAcknowledgedPushNotifications
{
  pushNotificationStateQueue = self->_pushNotificationStateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__WBSCloudHistoryPushAgent_clearAcknowledgedPushNotifications__block_invoke;
  block[3] = &unk_1E5C8CA70;
  block[4] = self;
  dispatch_async(pushNotificationStateQueue, block);
}

uint64_t __62__WBSCloudHistoryPushAgent_clearAcknowledgedPushNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setHasAcknowlegedPushNotifications:0];
}

- (id)_pushTopic
{
  return (id)[NSString stringWithFormat:@"%@%@", @"com.apple.icloud-container.", @"com.apple.mobilesafari"];
}

- (id)_userDefaults
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.SafariCloudHistoryPushAgent"];
  return v2;
}

- (BOOL)_hasUnacknowledgedPushNotifications
{
  uint64_t v2 = [(WBSCloudHistoryPushAgent *)self _userDefaults];
  char v3 = [v2 BOOLForKey:@"UnacknowledgedPushNotifications"];

  return v3;
}

- (void)_setHasUnacknowledgedPushNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WBSCloudHistoryPushAgent *)self _userDefaults];
  [v4 setBool:v3 forKey:@"UnacknowledgedPushNotifications"];
}

- (BOOL)_hasAcknowledgedPushNotifications
{
  uint64_t v2 = [(WBSCloudHistoryPushAgent *)self _userDefaults];
  char v3 = [v2 BOOLForKey:@"AcknowledgedPushNotifications"];

  return v3;
}

- (void)_setHasAcknowlegedPushNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(WBSCloudHistoryPushAgent *)self _userDefaults];
  [v4 setBool:v3 forKey:@"AcknowledgedPushNotifications"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushNotificationStateQueue, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Connection to history push agent by %d was denied: Missing entitlement", buf, 8u);
}

@end