@interface NDCredentialStorage
- (NDCredentialStorage)initWithDelegate:(id)a3 forBundleID:(id)a4;
- (NDCredentialStorageDelegate)delegate;
- (NSString)bundleID;
- (id)allCredentials;
- (id)credentialsForProtectionSpace:(id)a3;
- (id)defaultCredentialForProtectionSpace:(id)a3;
- (void)populateWithInitialCredentials;
- (void)removeCredential:(id)a3 forProtectionSpace:(id)a4;
- (void)reset;
- (void)setBundleID:(id)a3;
- (void)setCredential:(id)a3 forProtectionSpace:(id)a4;
- (void)setDefaultCredential:(id)a3 forProtectionSpace:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NDCredentialStorage

- (NDCredentialStorage)initWithDelegate:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NDCredentialStorage;
  v8 = [(NDCredentialStorage *)&v19 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_bundleID, a4);
    uint64_t v10 = +[NSMutableDictionary dictionary];
    cachedCredentials = v9->_cachedCredentials;
    v9->_cachedCredentials = (NSMutableDictionary *)v10;

    uint64_t v12 = +[NSMutableDictionary dictionary];
    cachedDefaultCredentialUsers = v9->_cachedDefaultCredentialUsers;
    v9->_cachedDefaultCredentialUsers = (NSMutableDictionary *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.nsurlsessiond.credential-storage-queue", v15);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v16;
  }
  return v9;
}

- (void)populateWithInitialCredentials
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = [WeakRetained getClientProxy];

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100006304;
    v5[3] = &unk_1000B5A38;
    v5[4] = self;
    [v4 credStorage_getInitialCredentialDictionariesWithReply:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedDefaultCredentialUsers, 0);

  objc_storeStrong((id *)&self->_cachedCredentials, 0);
}

- (void)setBundleID:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDelegate:(id)a3
{
}

- (NDCredentialStorageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NDCredentialStorageDelegate *)WeakRetained;
}

- (void)reset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F634;
  block[3] = &unk_1000B6380;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)setDefaultCredential:(id)a3 forProtectionSpace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = [WeakRetained getClientProxy];

  if (v9) {
    [v9 credStorage_setDefaultCredential:v6 forProtectionSpace:v7];
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F7C0;
  block[3] = &unk_1000B60C0;
  block[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  dispatch_sync(queue, block);
}

- (id)defaultCredentialForProtectionSpace:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained getClientProxy];

  if (v6)
  {
    id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000B5B30];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10004FD78;
    v36[3] = &unk_1000B5B58;
    v36[4] = self;
    id v37 = v4;
    [v7 credStorage_defaultCredentialForProtectionSpace:v37 reply:v36];
  }
  v8 = +[Daemon sharedDaemon];
  if ([v8 isInSyncBubble] && self->_bundleID)
  {
    v9 = [(NSMutableDictionary *)self->_cachedCredentials objectForKeyedSubscript:v4];

    if (v9) {
      goto LABEL_10;
    }
    uint64_t v10 = [v4 host];
    v8 = +[NSString stringWithFormat:@"%@%@%@", @"__com.apple.CFNetwork.prefix__", v10, self->_bundleID];

    id v11 = objc_alloc((Class)NSURLProtectionSpace);
    id v12 = [v4 port];
    v13 = [v4 protocol];
    id v14 = [v4 realm];
    id v15 = [v4 authenticationMethod];
    id v16 = [v11 initWithHost:v8 port:v12 protocol:v13 realm:v14 authenticationMethod:v15];

    v17 = +[NSURLCredentialStorage sharedCredentialStorage];
    v18 = [v17 defaultCredentialForProtectionSpace:v16];

    if (v18)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004FE3C;
      block[3] = &unk_1000B60C0;
      block[4] = self;
      id v34 = v4;
      id v35 = v18;
      dispatch_sync(queue, block);
    }
  }

LABEL_10:
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_10004FF68;
  v31 = sub_10004FF78;
  id v32 = 0;
  v20 = self->_queue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10004FF80;
  v24[3] = &unk_1000B60E8;
  v24[4] = self;
  id v25 = v4;
  v26 = &v27;
  id v21 = v4;
  dispatch_sync(v20, v24);
  id v22 = (id)v28[5];

  _Block_object_dispose(&v27, 8);

  return v22;
}

- (void)removeCredential:(id)a3 forProtectionSpace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = [WeakRetained getClientProxy];

  if (v9) {
    [v9 credStorage_setCredential:v6 forProtectionSpace:v7];
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000503CC;
  block[3] = &unk_1000B60C0;
  block[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  dispatch_sync(queue, block);
}

- (void)setCredential:(id)a3 forProtectionSpace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = [WeakRetained getClientProxy];

  if (v9) {
    [v9 credStorage_setCredential:v6 forProtectionSpace:v7];
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005059C;
  block[3] = &unk_1000B60C0;
  block[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  dispatch_sync(queue, block);
}

- (id)allCredentials
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained getClientProxy];

  if (v4)
  {
    v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000B5AC0];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100050868;
    v16[3] = &unk_1000B5AE8;
    v16[4] = self;
    [v5 credStorage_allCredentialsWithReply:v16];
  }
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = sub_10004FF68;
  id v14 = sub_10004FF78;
  id v15 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005090C;
  block[3] = &unk_1000B5B10;
  block[4] = self;
  void block[5] = &v10;
  dispatch_sync(queue, block);
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)credentialsForProtectionSpace:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained getClientProxy];

  if (v6)
  {
    id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000B5A78];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100050C70;
    v21[3] = &unk_1000B5AA0;
    v21[4] = self;
    id v22 = v4;
    [v7 credStorage_credentialsForProtectionSpace:v22 reply:v21];
  }
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_10004FF68;
  objc_super v19 = sub_10004FF78;
  id v20 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050D34;
  block[3] = &unk_1000B60E8;
  id v13 = v4;
  id v14 = &v15;
  block[4] = self;
  id v9 = v4;
  dispatch_sync(queue, block);
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v10;
}

@end