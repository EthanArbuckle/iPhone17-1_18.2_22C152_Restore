@interface ICHostedSharedListeningConnectionController
- (ICHostedSharedListeningConnectionController)initWithConnection:(id)a3 bundleID:(id)a4;
- (ICSharedListeningConnectionController)connectionController;
- (NSString)bundleID;
- (NSXPCConnection)xpcConnection;
- (void)connectionController:(id)a3 connectionDidEndWithError:(id)a4;
- (void)connectionController:(id)a3 connectionDidReceiveMessage:(id)a4;
- (void)connectionController:(id)a3 didEncounterFatalError:(id)a4;
- (void)connectionControllerConnectionDidStart:(id)a3;
- (void)populateSessionIdentifier:(id)a3 identity:(id)a4;
- (void)sendMessageData:(id)a3;
- (void)setConnectionController:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation ICHostedSharedListeningConnectionController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_connectionController, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setConnectionController:(id)a3
{
}

- (ICSharedListeningConnectionController)connectionController
{
  return self->_connectionController;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)connectionControllerConnectionDidStart:(id)a3
{
  id v12 = [(ICHostedSharedListeningConnectionController *)self xpcConnection];
  v4 = [v12 remoteObjectProxyWithErrorHandler:&stru_100004270];
  v5 = [(ICHostedSharedListeningConnectionController *)self connectionController];
  v6 = [v5 sessionIdentifier];
  v7 = [(ICHostedSharedListeningConnectionController *)self connectionController];
  v8 = [v7 sessionToken];
  v9 = [(ICHostedSharedListeningConnectionController *)self connectionController];
  v10 = [v9 inviteURL];
  v11 = [v10 absoluteString];
  [v4 receiveStartWithSessionIdentifier:v6 sessionToken:v8 inviteURLString:v11];
}

- (void)connectionController:(id)a3 didEncounterFatalError:(id)a4
{
  id v5 = a4;
  id v7 = [(ICHostedSharedListeningConnectionController *)self xpcConnection];
  v6 = [v7 remoteObjectProxyWithErrorHandler:&stru_100004250];
  [v6 receiveFatalError:v5];
}

- (void)connectionController:(id)a3 connectionDidReceiveMessage:(id)a4
{
  id v5 = a4;
  id v8 = [(ICHostedSharedListeningConnectionController *)self xpcConnection];
  v6 = [v8 remoteObjectProxyWithErrorHandler:&stru_100004230];
  id v7 = [v5 data];

  [v6 receiveMessageData:v7];
}

- (void)connectionController:(id)a3 connectionDidEndWithError:(id)a4
{
  id v5 = a4;
  id v7 = [(ICHostedSharedListeningConnectionController *)self xpcConnection];
  v6 = [v7 remoteObjectProxyWithErrorHandler:&stru_100004210];
  [v6 receiveConnectionError:v5];
}

- (void)sendMessageData:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  id v5 = (void *)qword_100008BF0;
  uint64_t v13 = qword_100008BF0;
  if (!qword_100008BF0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100001F6C;
    v9[3] = &unk_1000042D8;
    v9[4] = &v10;
    sub_100001F6C((uint64_t)v9);
    id v5 = (void *)v11[3];
  }
  v6 = v5;
  _Block_object_dispose(&v10, 8);
  id v7 = [[v6 alloc] initWithData:v4];
  id v8 = [(ICHostedSharedListeningConnectionController *)self connectionController];
  [v8 sendMessage:v7];
}

- (void)stop
{
  id v2 = [(ICHostedSharedListeningConnectionController *)self connectionController];
  [v2 stop];
}

- (void)start
{
  v3 = sub_1000022F4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][H] <%p> Will start connection controller.", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(ICHostedSharedListeningConnectionController *)self connectionController];
  [v4 start];
}

- (void)populateSessionIdentifier:(id)a3 identity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ICHostedSharedListeningConnectionController *)self connectionController];

  if (!v8)
  {
    v9 = sub_1000022F4();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[ICSharedListeningConnectionController][H] <%p> Populating with session identifier %@.", buf, 0x16u);
    }

    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    uint64_t v10 = (void *)qword_100008BE0;
    uint64_t v18 = qword_100008BE0;
    if (!qword_100008BE0)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100002590;
      v20 = &unk_1000042D8;
      v21 = &v15;
      sub_100002590((uint64_t)buf);
      uint64_t v10 = (void *)v16[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v15, 8);
    uint64_t v12 = [(ICHostedSharedListeningConnectionController *)self bundleID];
    uint64_t v13 = [v11 sharedListeningConnectionWithSessionIdentifier:v6 identity:v7 bundleID:v12];
    [(ICHostedSharedListeningConnectionController *)self setConnectionController:v13];

    v14 = [(ICHostedSharedListeningConnectionController *)self connectionController];
    [v14 setDelegate:self];
  }
}

- (ICHostedSharedListeningConnectionController)initWithConnection:(id)a3 bundleID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICHostedSharedListeningConnectionController;
  v9 = [(ICHostedSharedListeningConnectionController *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xpcConnection, a3);
    objc_storeStrong((id *)&v10->_bundleID, a4);
  }

  return v10;
}

@end