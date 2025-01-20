@interface SecDbKeychainMetadataKeyStore
+ (BOOL)cachingEnabled;
+ (id)sharedStore;
+ (void)resetSharedStore;
- (BOOL)readKeyDataForClass:(int)a3 fromDb:(__OpaqueSecDbConnection *)a4 actualKeyclass:(int *)a5 wrappedKey:(id *)a6 error:(id *)a7;
- (NSMutableDictionary)keysDict;
- (OS_dispatch_queue)queue;
- (id)_init;
- (id)fetchKeyForClass:(int)a3 fromDb:(__OpaqueSecDbConnection *)a4 keybag:(int)a5 specifier:(id)a6 allowWrites:(BOOL)a7 error:(id *)a8;
- (id)keyForKeyclass:(int)a3 keybag:(int)a4 keySpecifier:(id)a5 allowWrites:(BOOL)a6 error:(id *)a7;
- (id)newKeyForKeyclass:(int)a3 withKeybag:(int)a4 keySpecifier:(id)a5 database:(__OpaqueSecDbConnection *)a6 error:(id *)a7;
- (id)validateWrappedKey:(id)a3 forKeyClass:(int)a4 actualKeyClass:(int *)a5 keybag:(int)a6 keySpecifier:(id)a7 error:(id *)a8;
- (id)writeKey:(id)a3 ForKeyclass:(int)a4 withKeybag:(int)a5 keySpecifier:(id)a6 database:(__OpaqueSecDbConnection *)a7 error:(id *)a8;
- (int)keybagNotificationToken;
- (void)_onQueueDropAllKeys;
- (void)_onQueueDropClassAKeys;
- (void)dealloc;
- (void)dropAllKeys;
- (void)dropClassAKeys;
- (void)setKeybagNotificationToken:(int)a3;
- (void)setKeysDict:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation SecDbKeychainMetadataKeyStore

- (id)keyForKeyclass:(int)a3 keybag:(int)a4 keySpecifier:(id)a5 allowWrites:(BOOL)a6 error:(id *)a7
{
  id v13 = a5;
  if (a7)
  {
    off_10035CA90();
    v15 = v14;
    if (*v14)
    {
      v29 = +[NSAssertionHandler currentHandler];
      v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      v28 = NSStringFromSelector(a2);
      [v29 handleFailureInMethod:a2, self, @"SecDbKeychainMetadataKeyStore.m", 335, @"re-entering -[%@ %@] - that shouldn't happen!", v27, v28 object file lineNumber description];
    }
    unsigned char *v15 = 1;
    if (a3 < 32)
    {
      int v16 = a3;
    }
    else
    {
      int v16 = a3 & 0x1F;
      v17 = sub_10000B070("SanitizeKeyclass");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = a3;
        LOWORD(v54) = 1024;
        *(_DWORD *)((char *)&v54 + 2) = a3 & 0x1F;
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "sanitizing request for keyclass %d to keyclass %d", buf, 0xEu);
      }
    }
    *(void *)buf = 0;
    v54 = buf;
    uint64_t v55 = 0x3032000000;
    v56 = sub_1001D097C;
    v57 = sub_1001D098C;
    id v58 = 0;
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x3032000000;
    v50 = sub_1001D097C;
    v51 = sub_1001D098C;
    id v52 = 0;
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    uint64_t v46 = 0;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    char v42 = 1;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000163B8;
    block[3] = &unk_100307000;
    v32 = buf;
    v33 = &v39;
    block[4] = self;
    v34 = &v43;
    int v36 = v16;
    int v37 = a4;
    BOOL v38 = a6;
    id v31 = v13;
    v35 = &v47;
    dispatch_sync(queue, block);
    if (*((unsigned char *)v40 + 24))
    {
      v21 = v54;
      if (*((void *)v54 + 5)) {
        goto LABEL_20;
      }
    }
    v22 = (void *)v48[5];
    if (v22)
    {
      *a7 = v22;
      v23 = (const void *)v44[3];
      if (!v23)
      {
LABEL_19:
        v24 = (void *)*((void *)v54 + 5);
        *((void *)v54 + 5) = 0;

        v21 = v54;
LABEL_20:
        unsigned char *v15 = 0;
        id v19 = *((id *)v21 + 5);

        _Block_object_dispose(&v39, 8);
        _Block_object_dispose(&v43, 8);
        _Block_object_dispose(&v47, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_21;
      }
      v44[3] = 0;
      CFRelease(v23);
    }
    else
    {
      *a7 = (id)v44[3];
      v44[3] = 0;
    }
    if (!*a7) {
      sub_10002BBA0(@"Execution has encountered an unexpected state", 0x53C0000Eu);
    }
    goto LABEL_19;
  }
  v18 = sub_10000B070("SecError");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "keyForKeyclass called without error param, this is a bug", buf, 2u);
  }

  id v19 = 0;
LABEL_21:

  return v19;
}

+ (id)sharedStore
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_1001D097C;
  v10 = sub_1001D098C;
  id v11 = 0;
  if (qword_10035D2C8 != -1) {
    dispatch_once(&qword_10035D2C8, &stru_100307020);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001856C;
  v5[3] = &unk_100306F10;
  v5[4] = &v6;
  v5[5] = a1;
  dispatch_sync((dispatch_queue_t)qword_10035D2A8, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (BOOL)cachingEnabled
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysDict, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setKeybagNotificationToken:(int)a3
{
  self->_keybagNotificationToken = a3;
}

- (int)keybagNotificationToken
{
  return self->_keybagNotificationToken;
}

- (void)setKeysDict:(id)a3
{
}

- (NSMutableDictionary)keysDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (id)fetchKeyForClass:(int)a3 fromDb:(__OpaqueSecDbConnection *)a4 keybag:(int)a5 specifier:(id)a6 allowWrites:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  uint64_t v10 = *(void *)&a5;
  uint64_t v12 = *(void *)&a3;
  id v14 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v26 = 0;
  id v25 = 0;
  unsigned int v15 = [(SecDbKeychainMetadataKeyStore *)self readKeyDataForClass:v12 fromDb:a4 actualKeyclass:&v26 wrappedKey:&v25 error:a8];
  id v16 = v25;
  v17 = v16;
  v18 = 0;
  if (v15)
  {
    if (![v16 length])
    {
      v21 = sub_10000B070("SecDbMetadataKeyStore");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No metadata key found on disk despite existing row. That's odd.", buf, 2u);
      }
      v18 = 0;
      goto LABEL_13;
    }
    int v19 = v26;
    v18 = [(SecDbKeychainMetadataKeyStore *)self validateWrappedKey:v17 forKeyClass:v12 actualKeyClass:&v26 keybag:v10 keySpecifier:v14 error:a8];
    if (v18 && v9 && v19 != v26)
    {
      id v24 = 0;
      v20 = [(SecDbKeychainMetadataKeyStore *)self writeKey:v18 ForKeyclass:v12 withKeybag:v10 keySpecifier:v14 database:a4 error:&v24];
      v21 = v24;

      if (!v20)
      {
        v22 = sub_10000B070("SecWarning");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          int v28 = v12;
          __int16 v29 = 2112;
          v30 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "SecDbMetadataKeyStore: Unable to rewrite metadata key for %d to new format: %@", buf, 0x12u);
        }

        v21 = 0;
      }
LABEL_13:
    }
  }

  return v18;
}

- (BOOL)readKeyDataForClass:(int)a3 fromDb:(__OpaqueSecDbConnection *)a4 actualKeyclass:(int *)a5 wrappedKey:(id *)a6 error:(id *)a7
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_1001D097C;
  v35 = sub_1001D098C;
  id v36 = 0;
  uint64_t v27 = 0;
  int v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  CFTypeRef v22 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001D1480;
  v17[3] = &unk_100306FB0;
  int v18 = a3;
  v17[4] = &v27;
  v17[5] = &v19;
  v17[8] = a4;
  v17[9] = a5;
  v17[6] = &v31;
  v17[7] = &v23;
  int v12 = sub_10002742C((uint64_t)a4, @"SELECT data, actualKeyclass FROM metadatakeys WHERE keyclass = ?", &v22, (uint64_t)v17);
  if (*((unsigned char *)v28 + 24)) {
    int v13 = v12;
  }
  else {
    int v13 = 0;
  }
  *((unsigned char *)v28 + 24) = v13;
  if (v13 == 1 && *((unsigned char *)v24 + 24))
  {
    *a6 = (id) v32[5];
    BOOL v14 = 1;
  }
  else
  {
    unsigned int v15 = (void *)v20[3];
    if (a7)
    {
      *a7 = v15;
      v20[3] = 0;
    }
    else if (v15)
    {
      v20[3] = 0;
      CFRelease(v15);
    }
    BOOL v14 = 0;
    *a5 = 0;
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v14;
}

- (id)writeKey:(id)a3 ForKeyclass:(int)a4 withKeybag:(int)a5 keySpecifier:(id)a6 database:(__OpaqueSecDbConnection *)a7 error:(id *)a8
{
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a4;
  id v14 = a3;
  id v15 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v16 = +[NSMutableData dataWithLength:40];
  int v40 = v12;
  v17 = [v14 keyData];
  id v39 = 0;
  unsigned __int8 v18 = +[SecAKSObjCWrappers aksEncryptWithKeybag:v11 keyclass:v12 plaintext:v17 outKeyclass:&v40 ciphertext:v16 personaId:0 personaIdLength:0 error:&v39];
  id v19 = v39;

  if (v18)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v46 = 0x2020000000;
    char v47 = 1;
    uint64_t v35 = 0;
    id v36 = &v35;
    uint64_t v37 = 0x2020000000;
    CFTypeRef v38 = 0;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1001D1984;
    v28[3] = &unk_100306F60;
    p_long long buf = &buf;
    uint64_t v31 = &v35;
    int v33 = v12;
    int v34 = v40;
    id v29 = v16;
    v32 = a7;
    char v20 = sub_10002742C((uint64_t)a7, @"INSERT OR REPLACE INTO metadatakeys (keyclass, actualKeyclass, data) VALUES (?,?,?)", &v38, (uint64_t)v28);
    if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
      char v21 = v20;
    }
    else {
      char v21 = 0;
    }
    *(unsigned char *)(*((void *)&buf + 1) + 24) = v21;
    if (v21)
    {
      id v22 = v14;
    }
    else
    {
      id v24 = sub_10000B070("SecError");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = v36[3];
        *(_DWORD *)uint64_t v41 = 67109378;
        int v42 = v12;
        __int16 v43 = 2112;
        uint64_t v44 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Failed to write new metadata key for %d: %@", v41, 0x12u);
      }

      char v26 = (void *)v36[3];
      if (a8)
      {
        id v22 = 0;
        *a8 = v26;
        v36[3] = 0;
      }
      else
      {
        if (v26)
        {
          v36[3] = 0;
          CFRelease(v26);
        }
        id v22 = 0;
      }
    }

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v23 = sub_10000B070("SecError");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "SecDbMetadataKeyStore: Unable to encrypt new metadata key to keybag: %@", (uint8_t *)&buf, 0xCu);
    }

    id v22 = 0;
    if (a8) {
      *a8 = v19;
    }
  }

  return v22;
}

- (id)newKeyForKeyclass:(int)a3 withKeybag:(int)a4 keySpecifier:(id)a5 database:(__OpaqueSecDbConnection *)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v18 = 0;
  id v13 = [objc_alloc((Class)_SFAESKey) initRandomKeyWithSpecifier:v12 error:&v18];
  id v14 = v18;
  id v15 = v14;
  if (v13)
  {
    id v16 = [(SecDbKeychainMetadataKeyStore *)self writeKey:v13 ForKeyclass:v10 withKeybag:v9 keySpecifier:v12 database:a6 error:a7];
  }
  else
  {
    id v16 = 0;
    if (a7) {
      *a7 = v14;
    }
  }

  return v16;
}

- (id)validateWrappedKey:(id)a3 forKeyClass:(int)a4 actualKeyClass:(int *)a5 keybag:(int)a6 keySpecifier:(id)a7 error:(id *)a8
{
  uint64_t v10 = *(void *)&a6;
  id v13 = a3;
  id v14 = a7;
  unsigned int v15 = *a5;
  if (*a5 == a4 || v15 == 0) {
    uint64_t v17 = a4;
  }
  else {
    uint64_t v17 = v15;
  }
  id v18 = +[NSMutableData dataWithLength:32];
  id v34 = 0;
  unsigned int v19 = +[SecAKSObjCWrappers aksDecryptWithKeybag:v10 keyclass:v17 ciphertext:v13 outKeyclass:0 plaintext:v18 personaId:0 personaIdLength:0 error:&v34];
  id v20 = v34;
  char v21 = v20;
  if (v19)
  {
    id v33 = v20;
    id v22 = [objc_alloc((Class)_SFAESKey) initWithData:v18 specifier:v14 error:&v33];
    id v23 = v33;

    if (v22) {
      goto LABEL_24;
    }
    id v24 = sub_10000B070("SecError");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109378;
      LODWORD(v36[0]) = v17;
      WORD2(v36[0]) = 2112;
      *(void *)((char *)v36 + 6) = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: AKS decrypted metadata blob for class %d but could not turn it into a key: %@", buf, 0x12u);
    }

    goto LABEL_15;
  }
  if ((int)v17 > 30 || *a5)
  {
    id v23 = v20;
    goto LABEL_15;
  }
  *a5 = v17 | 0x20;
  id v32 = v20;
  unsigned int v29 = +[SecAKSObjCWrappers aksDecryptWithKeybag:keyclass:ciphertext:outKeyclass:plaintext:personaId:personaIdLength:error:](SecAKSObjCWrappers, "aksDecryptWithKeybag:keyclass:ciphertext:outKeyclass:plaintext:personaId:personaIdLength:error:", v10, 0, &v32);
  id v23 = v32;

  if (!v29
    || (id v31 = v23,
        id v22 = [objc_alloc((Class)_SFAESKey) initWithData:v18 specifier:v14 error:&v31],
        id v30 = v31,
        v23,
        id v23 = v30,
        !v22))
  {
LABEL_15:
    uint64_t v25 = [v23 domain];
    if ([v25 isEqualToString:kCFErrorDomainOSStatus])
    {
      id v26 = [v23 code];

      if (v26 == (id)-25308)
      {
        if (a8)
        {
LABEL_18:
          id v23 = v23;
          id v22 = 0;
          *a8 = v23;
          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }
    else
    {
    }
    uint64_t v27 = sub_10000B070("SecError");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      v36[0] = v23;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: Unable to create key from retrieved data: %@", buf, 0xCu);
    }

    if (a8) {
      goto LABEL_18;
    }
LABEL_23:
    id v22 = 0;
  }
LABEL_24:

  return v22;
}

- (void)_onQueueDropAllKeys
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = sub_10000B070("SecDbKeychainMetadataKeyStore");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "dropping all metadata keys", v4, 2u);
  }

  [(NSMutableDictionary *)self->_keysDict removeAllObjects];
}

- (void)dropAllKeys
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D1FAC;
  block[3] = &unk_100308558;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_onQueueDropClassAKeys
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = sub_10000B070("SecDbKeychainMetadataKeyStore");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "dropping class A metadata keys", v4, 2u);
  }

  [(NSMutableDictionary *)self->_keysDict setObject:0 forKeyedSubscript:&off_1003267E8];
  [(NSMutableDictionary *)self->_keysDict setObject:0 forKeyedSubscript:&off_100326800];
  [(NSMutableDictionary *)self->_keysDict setObject:0 forKeyedSubscript:&off_100326818];
}

- (void)dropClassAKeys
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001D20E0;
  block[3] = &unk_100308558;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)dealloc
{
  int keybagNotificationToken = self->_keybagNotificationToken;
  if (keybagNotificationToken != -1)
  {
    notify_cancel(keybagNotificationToken);
    self->_int keybagNotificationToken = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SecDbKeychainMetadataKeyStore;
  [(SecDbKeychainMetadataKeyStore *)&v4 dealloc];
}

- (id)_init
{
  v13.receiver = self;
  v13.super_class = (Class)SecDbKeychainMetadataKeyStore;
  v2 = [(SecDbKeychainMetadataKeyStore *)&v13 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    keysDict = v2->_keysDict;
    v2->_keysDict = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("SecDbKeychainMetadataKeyStore", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v2->_int keybagNotificationToken = -1;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    uint64_t v8 = v2->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001D22A0;
    v10[3] = &unk_100306F38;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v2->_keybagNotificationToken, v8, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (void)resetSharedStore
{
  if (qword_10035D2C8 != -1) {
    dispatch_once(&qword_10035D2C8, &stru_100307020);
  }
  v2 = qword_10035D2A8;

  dispatch_sync(v2, &stru_100306EE8);
}

@end