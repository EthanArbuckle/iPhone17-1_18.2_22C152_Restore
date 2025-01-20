@interface KmlPeerToPeerConnection
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
@end

@implementation KmlPeerToPeerConnection

- (void)dealloc
{
  [(IDSService *)self->_idsService removeDelegate:self];
  idsService = self->_idsService;
  self->_idsService = 0;

  [(NWPathEvaluator *)self->_pathEvaluator removeObserver:self forKeyPath:@"path"];
  v4.receiver = self;
  v4.super_class = (Class)KmlPeerToPeerConnection;
  [(KmlPeerToPeerConnection *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = a3;
  p2pConnectionQueue = self->_p2pConnectionQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1003588E4;
  v10[3] = &unk_10040D1A0;
  id v11 = v7;
  v12 = self;
  id v9 = v7;
  dispatch_async(p2pConnectionQueue, v10);
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  p2pConnectionQueue = self->_p2pConnectionQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100359EB8;
  v17[3] = &unk_100419A98;
  id v18 = v11;
  id v19 = v12;
  id v20 = v10;
  v21 = self;
  id v14 = v10;
  id v15 = v12;
  id v16 = v11;
  dispatch_async(p2pConnectionQueue, v17);
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  p2pConnectionQueue = self->_p2pConnectionQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10035A044;
  v17[3] = &unk_100419A98;
  void v17[4] = self;
  id v18 = v11;
  id v19 = v10;
  id v20 = v12;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(p2pConnectionQueue, v17);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  id v10 = a5;
  id v11 = a7;
  p2pConnectionQueue = self->_p2pConnectionQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10035A2D0;
  v15[3] = &unk_1004199D0;
  BOOL v19 = a6;
  id v16 = v10;
  v17 = self;
  id v18 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(p2pConnectionQueue, v15);
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  p2pConnectionQueue = self->_p2pConnectionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10035A42C;
  block[3] = &unk_10040B880;
  block[4] = self;
  dispatch_async(p2pConnectionQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeIDSId, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
  objc_storeStrong((id *)&self->_remoteIdentifiersSet, 0);
  objc_storeStrong((id *)&self->_remoteAndOurIdentifierMap, 0);
  objc_storeStrong((id *)&self->_sendUuidStringToIdentifiersMap, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_p2pConnectionQueue, 0);

  objc_storeStrong((id *)&self->_idsService, 0);
}

@end