@interface NEAppPushPlugin
- (id)managerInterface;
- (id)remotePluginInterface;
- (void)handleProviderError:(id)a3;
- (void)handleProviderError:(id)a3 forMessageID:(id)a4;
- (void)handleProviderInstallationStatus:(int64_t)a3;
- (void)handleProviderStopped;
- (void)reportIncomingCall:(id)a3;
- (void)reportPushToTalkMessage:(id)a3;
- (void)sendExtensionFailed;
@end

@implementation NEAppPushPlugin

- (void)handleProviderInstallationStatus:(int64_t)a3
{
  v5 = [(NEPlugin *)self delegateQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100016194;
  v6[3] = &unk_1000C6B78;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (void)handleProviderStopped
{
  v3 = [(NEPlugin *)self delegateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016270;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)sendExtensionFailed
{
  v3 = [(NEPlugin *)self delegateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001634C;
  block[3] = &unk_1000C6C60;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)reportPushToTalkMessage:(id)a3
{
  id v4 = a3;
  v5 = [(NEPlugin *)self delegateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016454;
  v7[3] = &unk_1000C6C38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)reportIncomingCall:(id)a3
{
  id v4 = a3;
  v5 = [(NEPlugin *)self delegateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001655C;
  v7[3] = &unk_1000C6C38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleProviderError:(id)a3 forMessageID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NEPlugin *)self delegateQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016688;
  block[3] = &unk_1000C6958;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)handleProviderError:(id)a3
{
  id v4 = a3;
  v5 = [(NEPlugin *)self delegateQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016794;
  v7[3] = &unk_1000C6C38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (id)managerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NEAppPushPluginManager];
}

- (id)remotePluginInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NEAppPushPluginDriver];
}

@end