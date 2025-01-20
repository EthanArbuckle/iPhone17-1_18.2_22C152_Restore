@interface NEAgentAppPushExtension
- (NSXPCInterface)driverInterface;
- (NSXPCInterface)managerInterface;
- (void)didReceiveIncomingCallWithUserInfo:(id)a3;
- (void)didReceivePushToTalkMessageWithUserInfo:(id)a3;
- (void)handleAppsUninstalled:(id)a3;
- (void)handleAppsUpdateBegins:(id)a3;
- (void)handleAppsUpdateEnding:(id)a3;
- (void)handleAppsUpdateEnds:(id)a3;
- (void)handleCancel;
- (void)sendExtensionFailed;
- (void)sendOutgoingCallMessage:(id)a3 andMessageID:(id)a4;
- (void)sendTimerEvent;
- (void)setProviderConfiguration:(id)a3;
- (void)startConnectionWithProviderConfig:(id)a3;
- (void)stopWithReason:(int)a3;
@end

@implementation NEAgentAppPushExtension

- (void)sendExtensionFailed
{
  v2 = [(NEAgentAppPushExtension *)self managerObjectFactory];
  id v3 = [v2 managerObject];

  [v3 sendExtensionFailed];
}

- (void)sendTimerEvent
{
  id v2 = [(NEAgentAppPushExtension *)self sessionContext];
  [v2 sendTimerEvent];
}

- (void)sendOutgoingCallMessage:(id)a3 andMessageID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(NEAgentAppPushExtension *)self sessionContext];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100004A7C;
  v10[3] = &unk_10000C350;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 sendOutgoingCallMessage:v7 completionHandler:v10];
}

- (void)setProviderConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(NEAgentAppPushExtension *)self sessionContext];
  [v5 setProviderConfiguration:v4];
}

- (void)stopWithReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(NEAgentAppPushExtension *)self sessionContext];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004CF4;
  v6[3] = &unk_10000C420;
  v6[4] = self;
  [v5 stopWithReason:v3 completionHandler:v6];
}

- (void)startConnectionWithProviderConfig:(id)a3
{
  id v4 = a3;
  id v5 = [(NEAgentAppPushExtension *)self sessionContext];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004E74;
  v6[3] = &unk_10000C328;
  v6[4] = self;
  [v5 startConnectionWithProviderConfig:v4 completionHandler:v6];
}

- (void)didReceivePushToTalkMessageWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ received PushToTalk message with user info %@", (uint8_t *)&v9, 0x16u);
  }

  if (self)
  {
    id v6 = v4;
    id v7 = [(NEAgentAppPushExtension *)self managerObjectFactory];
    v8 = [v7 managerObject];

    [v8 reportPushToTalkMessage:v6];
  }
}

- (void)didReceiveIncomingCallWithUserInfo:(id)a3
{
  id v4 = a3;
  id v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412546;
    v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ received incoming call with user info %@", (uint8_t *)&v9, 0x16u);
  }

  if (self)
  {
    id v6 = v4;
    id v7 = [(NEAgentAppPushExtension *)self managerObjectFactory];
    v8 = [v7 managerObject];

    [v8 reportIncomingCall:v6];
  }
}

- (void)handleAppsUpdateEnds:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEAgentAppPushExtension *)self extensionIdentifier];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(NEAgentAppPushExtension *)self extensionIdentifier];
    unsigned int v8 = [v4 containsObject:v7];

    if (v8)
    {
      int v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = [(NEAgentAppPushExtension *)self extensionIdentifier];
        int v11 = 138412546;
        id v12 = self;
        __int16 v13 = 2112;
        v14 = v10;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ update for extension [%@] completed", (uint8_t *)&v11, 0x16u);
      }
      sub_100005318(self, 2);
    }
  }
}

- (void)handleAppsUpdateEnding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEAgentAppPushExtension *)self extensionIdentifier];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(NEAgentAppPushExtension *)self extensionIdentifier];
    unsigned int v8 = [v4 containsObject:v7];

    if (v8)
    {
      int v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = [(NEAgentAppPushExtension *)self extensionIdentifier];
        int v11 = 138412546;
        id v12 = self;
        __int16 v13 = 2112;
        v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ update for extension [%@] is in progress", (uint8_t *)&v11, 0x16u);
      }
      sub_100005318(self, 1);
    }
  }
}

- (void)handleAppsUpdateBegins:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEAgentAppPushExtension *)self extensionIdentifier];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(NEAgentAppPushExtension *)self extensionIdentifier];
    unsigned int v8 = [v4 containsObject:v7];

    if (v8)
    {
      int v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = [(NEAgentAppPushExtension *)self extensionIdentifier];
        int v11 = 138412546;
        id v12 = self;
        __int16 v13 = 2112;
        v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ update for extension [%@] started", (uint8_t *)&v11, 0x16u);
      }
      sub_100005318(self, 1);
    }
  }
}

- (void)handleAppsUninstalled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEAgentAppPushExtension *)self extensionIdentifier];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(NEAgentAppPushExtension *)self extensionIdentifier];
    unsigned int v8 = [v4 containsObject:v7];

    if (v8)
    {
      int v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = [(NEAgentAppPushExtension *)self extensionIdentifier];
        int v11 = 138412546;
        id v12 = self;
        __int16 v13 = 2112;
        v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ extension [%@] was uninstalled", (uint8_t *)&v11, 0x16u);
      }
      sub_100005318(self, 0);
    }
  }
}

- (void)handleCancel
{
}

- (NSXPCInterface)driverInterface
{
  if (qword_1000121E0 != -1) {
    dispatch_once(&qword_1000121E0, &stru_10000C300);
  }
  id v2 = (void *)qword_1000121D8;

  return (NSXPCInterface *)v2;
}

- (NSXPCInterface)managerInterface
{
  if (qword_1000121D0 != -1) {
    dispatch_once(&qword_1000121D0, &stru_10000C2E0);
  }
  id v2 = (void *)qword_1000121C8;

  return (NSXPCInterface *)v2;
}

@end