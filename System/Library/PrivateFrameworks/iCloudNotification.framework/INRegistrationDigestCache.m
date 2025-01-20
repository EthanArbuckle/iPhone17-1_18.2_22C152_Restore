@interface INRegistrationDigestCache
+ (BOOL)isAvailable;
+ (id)sharedInstance;
- (BOOL)removeRegistrationDigestForAccount:(id)a3 withError:(id *)a4;
- (BOOL)updateRegistrationDigest:(id)a3 forAccount:(id)a4 withError:(id *)a5;
- (INRegistrationDigestCache)init;
- (id)registrationDigestForAccount:(id)a3 withError:(id *)a4;
- (void)dealloc;
@end

@implementation INRegistrationDigestCache

+ (BOOL)isAvailable
{
  return MKBDeviceUnlockedSinceBoot() == 1;
}

+ (id)sharedInstance
{
  if (qword_10004E470 != -1) {
    dispatch_once(&qword_10004E470, &stru_100041070);
  }
  v2 = (void *)qword_10004E468;
  return v2;
}

- (INRegistrationDigestCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)INRegistrationDigestCache;
  v2 = [(INRegistrationDigestCache *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.ind.keychain", v3);
    keychainQueue = v2->_keychainQueue;
    v2->_keychainQueue = (OS_dispatch_queue *)v4;

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000CC94;
    handler[3] = &unk_100041098;
    v8 = v2;
    notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &v2->_unlockNotifyToken, (dispatch_queue_t)&_dispatch_main_q, handler);
  }
  return v2;
}

- (void)dealloc
{
  notify_cancel(self->_unlockNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)INRegistrationDigestCache;
  [(INRegistrationDigestCache *)&v3 dealloc];
}

- (id)registrationDigestForAccount:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_10000CEAC;
  v23 = sub_10000CEBC;
  id v24 = 0;
  v7 = [v6 identifier];
  v8 = v7;
  if (!v6)
  {

    v8 = @"logged-out";
  }
  keychainQueue = self->_keychainQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000CEC4;
  v14[3] = &unk_1000410C0;
  v15 = v8;
  id v16 = v6;
  v17 = &v19;
  v18 = a4;
  id v10 = v6;
  v11 = v8;
  dispatch_sync(keychainQueue, v14);
  id v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (BOOL)removeRegistrationDigestForAccount:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v7 = [v6 identifier];
  v8 = v7;
  if (!v6)
  {

    v8 = @"logged-out";
  }
  keychainQueue = self->_keychainQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000D158;
  v14[3] = &unk_1000410C0;
  v15 = v8;
  id v16 = v6;
  v17 = &v19;
  v18 = a4;
  id v10 = v6;
  v11 = v8;
  dispatch_sync(keychainQueue, v14);
  char v12 = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return v12;
}

- (BOOL)updateRegistrationDigest:(id)a3 forAccount:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  id v10 = [v9 identifier];
  v11 = v10;
  if (!v9)
  {

    v11 = @"logged-out";
  }
  keychainQueue = self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D3CC;
  block[3] = &unk_1000410E8;
  id v18 = v8;
  uint64_t v19 = v11;
  id v20 = v9;
  uint64_t v21 = &v23;
  char v22 = a5;
  id v13 = v9;
  v14 = v11;
  id v15 = v8;
  dispatch_sync(keychainQueue, block);
  LOBYTE(keychainQueue) = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return (char)keychainQueue;
}

- (void).cxx_destruct
{
}

@end