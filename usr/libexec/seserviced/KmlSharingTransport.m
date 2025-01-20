@interface KmlSharingTransport
- (KmlSharingTransport)init;
- (void)dealloc;
- (void)handleConnectionSetupResult:(id)a3;
- (void)handleIncomingMessage:(id)a3 fromRemoteIdsIdentifier:(id)a4;
- (void)handleIncomingTestData:(id)a3 fromRemoteIdsIdentifier:(id)a4;
- (void)handleSendMessageResult:(id)a3 forMessageIdentifier:(id)a4;
@end

@implementation KmlSharingTransport

- (KmlSharingTransport)init
{
  v24.receiver = self;
  v24.super_class = (Class)KmlSharingTransport;
  v6 = [(KmlSharingTransport *)&v24 init];
  if (v6)
  {
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlSharingTransport init]", 78, @"KSTransport: let's init", v2, v3, v4, v5, (uint64_t)v24.receiver);
    uint64_t v7 = +[NSMutableDictionary dictionary];
    sharingIdToDelegateMap = v6->_sharingIdToDelegateMap;
    v6->_sharingIdToDelegateMap = (NSMutableDictionary *)v7;

    uint64_t v9 = +[NSMutableSet set];
    checkConnectionClientSet = v6->_checkConnectionClientSet;
    v6->_checkConnectionClientSet = (NSMutableSet *)v9;

    uint64_t v11 = sub_1003584EC((uint64_t)KmlPeerToPeerConnection, v6);
    connection = v6->_connection;
    v6->_connection = (KmlPeerToPeerConnection *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.sesd.kml.keyShareTransport", v13);
    keyTransportQueue = v6->_keyTransportQueue;
    v6->_keyTransportQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = sub_10032872C();
    sharingManager = v6->_sharingManager;
    v6->_sharingManager = (KmlSharingManager *)v16;

    id crossPlatformTestMessageHandler = v6->_crossPlatformTestMessageHandler;
    v6->_id crossPlatformTestMessageHandler = 0;

    sub_10031DD24((uint64_t)v6);
    KmlLogFunc2(OS_LOG_TYPE_INFO, (uint64_t)"-[KmlSharingTransport init]", 87, @"KSTransport: ready to roll", v19, v20, v21, v22, (uint64_t)v24.receiver);
  }
  return v6;
}

- (void)dealloc
{
  [(NSMutableDictionary *)self->_sharingIdToDelegateMap removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)KmlSharingTransport;
  [(KmlSharingTransport *)&v3 dealloc];
}

- (void)handleConnectionSetupResult:(id)a3
{
  id v4 = a3;
  keyTransportQueue = self->_keyTransportQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031ED68;
  v7[3] = &unk_10040D1A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(keyTransportQueue, v7);
}

- (void)handleSendMessageResult:(id)a3 forMessageIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  keyTransportQueue = self->_keyTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031EF68;
  block[3] = &unk_10040D2C0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(keyTransportQueue, block);
}

- (void)handleIncomingTestData:(id)a3 fromRemoteIdsIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  keyTransportQueue = self->_keyTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031F088;
  block[3] = &unk_10040D2C0;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(keyTransportQueue, block);
}

- (void)handleIncomingMessage:(id)a3 fromRemoteIdsIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  keyTransportQueue = self->_keyTransportQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031F200;
  block[3] = &unk_10040D2C0;
  id v12 = v7;
  id v13 = v6;
  id v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(keyTransportQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_crossPlatformTestMessageHandler, 0);
  objc_storeStrong((id *)&self->_keyTransportQueue, 0);
  objc_storeStrong((id *)&self->_checkConnectionClientSet, 0);
  objc_storeStrong((id *)&self->_sharingIdToDelegateMap, 0);
  objc_storeStrong((id *)&self->_sharingManager, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end