@interface EPKeymaster
+ (Class)resourceClass;
- (EPKeymaster)initWithKeyName:(id)a3 shouldExport:(BOOL)a4 unlockAssertionManager:(id)a5 okayToCreateKeyBlock:(id)a6 queue:(id)a7;
- (NSString)name;
- (id)getAndMigrateKey:(BOOL)a3;
- (void)createResource;
- (void)destroyResource;
- (void)registerForKeychainNotifications;
- (void)unregisterForKeychainNotifications;
- (void)update;
@end

@implementation EPKeymaster

- (EPKeymaster)initWithKeyName:(id)a3 shouldExport:(BOOL)a4 unlockAssertionManager:(id)a5 okayToCreateKeyBlock:(id)a6 queue:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)EPKeymaster;
  v17 = [(EPResourceManager *)&v24 initWithQueue:v16];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    v18->_shouldExportKey = a4;
    objc_storeStrong((id *)&v18->_unlockManager, a5);
    id v19 = objc_retainBlock(v15);
    id okayToCreateKeyBlock = v18->_okayToCreateKeyBlock;
    v18->_id okayToCreateKeyBlock = v19;

    v18->_keychainNotifyToken = -1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000DACF0;
    block[3] = &unk_1001655F8;
    v23 = v18;
    dispatch_async(v16, block);
  }
  return v18;
}

+ (Class)resourceClass
{
  return (Class)objc_opt_class();
}

- (void)createResource
{
  v7.receiver = self;
  v7.super_class = (Class)EPKeymaster;
  [(EPResourceManager *)&v7 createResource];
  v3 = [(EPUnlockAssertionManager *)self->_unlockManager newUnlockAssertionWithDelegate:self];
  clientUnlockAssertion = self->_clientUnlockAssertion;
  self->_clientUnlockAssertion = v3;

  if (self->_shouldExportKey)
  {
    self->_triedToCreateKey = 0;
    if (!self->_keyDistributionUnlockAssertion)
    {
      v5 = [(EPUnlockAssertionManager *)self->_unlockManager newUnlockAssertionWithDelegate:self];
      keyDistributionUnlockAssertion = self->_keyDistributionUnlockAssertion;
      self->_keyDistributionUnlockAssertion = v5;
    }
  }
  else
  {
    self->_triedToCreateKey = 1;
  }
  [(EPKeymaster *)self update];
}

- (void)destroyResource
{
  v4.receiver = self;
  v4.super_class = (Class)EPKeymaster;
  [(EPResourceManager *)&v4 destroyResource];
  clientUnlockAssertion = self->_clientUnlockAssertion;
  self->_clientUnlockAssertion = 0;
}

- (void)registerForKeychainNotifications
{
  p_keychainNotifyToken = &self->_keychainNotifyToken;
  if (self->_keychainNotifyToken == -1)
  {
    objc_super v4 = [(EPResourceManager *)self queue];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000DAF38;
    handler[3] = &unk_100165958;
    handler[4] = self;
    uint32_t v5 = notify_register_dispatch("com.apple.security.keychainchanged", p_keychainNotifyToken, v4, handler);

    if (v5)
    {
      v6 = nr_daemon_log();
      BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

      if (v7)
      {
        v8 = nr_daemon_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1000FBDE0();
        }
      }
    }
  }
}

- (void)unregisterForKeychainNotifications
{
  int keychainNotifyToken = self->_keychainNotifyToken;
  if (keychainNotifyToken != -1)
  {
    notify_cancel(keychainNotifyToken);
    self->_int keychainNotifyToken = -1;
  }
}

- (id)getAndMigrateKey:(BOOL)a3
{
  BOOL v3 = a3;
  uint32_t v5 = +[EPKeychain retrieveKeyWithName:self->_name keychainGroup:@"com.apple.nanoregistry.migration2"];
  if (v5) {
    goto LABEL_2;
  }
  uint64_t v16 = +[EPKeychain retrieveKeyWithName:self->_name keychainGroup:@"com.apple.nanoregistry.migration"];
  if (v16)
  {
    uint32_t v5 = (void *)v16;
    if (v3) {
      +[EPKeychain storeKeyWithData:v16 name:self->_name keychainGroup:@"com.apple.nanoregistry.migration2"];
    }
LABEL_2:
    v6 = [[NRPBMigrationKeyForKeychain alloc] initWithData:v5];

    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v6 = 0;
  if (v3)
  {
LABEL_3:
    id v7 = +[EPKeychain removeKeyWithName:self->_name keychainGroup:@"com.apple.nanoregistry.migration"];
    id v8 = +[EPKeychain removeKeyWithName:&stru_10016A1E8 keychainGroup:@"com.apple.nanoregistry.migration2"];
  }
LABEL_4:
  if (!v6)
  {
    v9 = +[EPKeychain retrieveKeyWithName:@"migration" keychainGroup:@"com.apple.nanoregistry.migration"];
    if (v9)
    {
      v10 = +[EPKey keyFromData:v9];
      v6 = v10;
      if (v3)
      {
        v11 = [(NRPBMigrationKeyForKeychain *)v10 data];
        unsigned __int8 v12 = +[EPKeychain storeKeyWithData:v11 name:self->_name keychainGroup:@"com.apple.nanoregistry.migration2"];

        if ((v12 & 1) == 0)
        {
          id v13 = sub_1000A3CF0();
          BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

          if (v14)
          {
            id v15 = sub_1000A3CF0();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
              sub_1000FBE48();
            }
          }
        }
      }
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)update
{
  BOOL triedToCreateKey = self->_triedToCreateKey;
  keyDistributionUnlockAssertion = self->_keyDistributionUnlockAssertion;
  if (triedToCreateKey)
  {
    self->_keyDistributionUnlockAssertion = 0;

    goto LABEL_31;
  }
  if ((id)[(EPResource *)keyDistributionUnlockAssertion availability] == (id)1)
  {
    [(EPKeymaster *)self registerForKeychainNotifications];
    id okayToCreateKeyBlock = (uint64_t (**)(void))self->_okayToCreateKeyBlock;
    if (okayToCreateKeyBlock) {
      uint64_t v6 = okayToCreateKeyBlock[2]();
    }
    else {
      uint64_t v6 = 1;
    }
    id v7 = [(EPKeymaster *)self getAndMigrateKey:v6];
    id v8 = nr_daemon_log();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      if (v9)
      {
        v10 = nr_daemon_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v35 = sub_10001D51C((uint64_t)v7);
          v11 = [v35 SHA256Data];
          unsigned __int8 v12 = [v11 base64EncodedStringWithOptions:0];
          id v13 = [v12 substringToIndex:6];
          *(_DWORD *)buf = 138412290;
          v39 = v13;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "EPKeymaster: Retrieved key, digest %@", buf, 0xCu);
        }
LABEL_14:
      }
    }
    else if (v9)
    {
      v10 = nr_daemon_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "EPKeymaster: Could not retrieve key", buf, 2u);
      }
      goto LABEL_14;
    }
    BOOL v14 = sub_10001D51C((uint64_t)v7);

    if (v14)
    {
      [(EPKeymaster *)self unregisterForKeychainNotifications];
      self->_BOOL triedToCreateKey = 1;
    }
    else if (v6)
    {
      if (+[EPKeychain newKeysWithName:self->_name])
      {
        self->_BOOL triedToCreateKey = 1;
      }
      else
      {
        id v19 = sub_1000A3CF0();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);

        if (v20)
        {
          v21 = sub_1000A3CF0();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_1000FBE7C((uint64_t)&self->_name, v21, v22, v23, v24, v25, v26, v27);
          }
        }
        self->_noKey = 1;
        self->_BOOL triedToCreateKey = 1;
      }
      [(EPKeymaster *)self unregisterForKeychainNotifications];
    }
    else
    {
      id v15 = sub_1000A3CF0();
      BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (v16)
      {
        v17 = sub_1000A3CF0();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          name = self->_name;
          *(_DWORD *)buf = 138412290;
          v39 = name;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "EPKeyMaster: Not allowed to create key %@", buf, 0xCu);
        }
      }
    }
    v28 = self->_keyDistributionUnlockAssertion;
    self->_keyDistributionUnlockAssertion = 0;
  }
LABEL_31:
  if (self->_noKey)
  {
    NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
    CFStringRef v37 = @"Can't create key";
    v29 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    v30 = +[NSError errorWithDomain:@"com.apple.nanoregistry" code:555 userInfo:v29];

    [(EPResourceManager *)self setAvailability:2 withError:v30];
    clientUnlockAssertion = self->_clientUnlockAssertion;
    self->_clientUnlockAssertion = 0;

LABEL_33:
    return;
  }
  if (!self->_keyDistributionUnlockAssertion && self->_triedToCreateKey)
  {
    v32 = self->_clientUnlockAssertion;
    if (v32)
    {
      if ((id)[(EPResource *)v32 availability] == (id)1)
      {
        v33 = self;
        uint64_t v34 = 1;
LABEL_42:
        [(EPResourceManager *)v33 setAvailability:v34 withError:0];
        return;
      }
      if ((id)[(EPResource *)self->_clientUnlockAssertion availability] == (id)2)
      {
        v30 = [(EPResource *)self->_clientUnlockAssertion error];
        [(EPResourceManager *)self setAvailability:2 withError:v30];
        goto LABEL_33;
      }
    }
    v33 = self;
    uint64_t v34 = 0;
    goto LABEL_42;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_okayToCreateKeyBlock, 0);
  objc_storeStrong((id *)&self->_keyDistributionUnlockAssertion, 0);
  objc_storeStrong((id *)&self->_clientUnlockAssertion, 0);

  objc_storeStrong((id *)&self->_unlockManager, 0);
}

@end