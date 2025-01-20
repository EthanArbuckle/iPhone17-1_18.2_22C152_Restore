@interface NIServerKeychainManager
+ (id)sharedInstance;
- (BOOL)_shouldLog;
- (BOOL)deleteAllItemsWithService:(id)a3 synchronizable:(BOOL)a4 systemKeychain:(BOOL)a5;
- (BOOL)deleteItemWithService:(id)a3 account:(id)a4 synchronizable:(BOOL)a5 systemKeychain:(BOOL)a6;
- (BOOL)writeItem:(id)a3 synchronizable:(BOOL)a4 systemKeychain:(BOOL)a5;
- (id)_initInternal;
- (id)_internalReadItemWithService:(id)a3 account:(id)a4 synchronizable:(BOOL)a5 systemKeychain:(BOOL)a6;
- (id)readAllItemsWithService:(id)a3 synchronizable:(BOOL)a4 systemKeychain:(BOOL)a5;
- (id)readItemWithService:(id)a3 account:(id)a4 synchronizable:(BOOL)a5 systemKeychain:(BOOL)a6;
- (void)_unitTest1;
- (void)_unitTest2;
- (void)_unitTest3;
@end

@implementation NIServerKeychainManager

+ (id)sharedInstance
{
  if (qword_1008A7C80 != -1) {
    dispatch_once(&qword_1008A7C80, &stru_10085E228);
  }
  v2 = (void *)qword_1008A7C78;

  return v2;
}

- (BOOL)writeItem:(id)a3 synchronizable:(BOOL)a4 systemKeychain:(BOOL)a5
{
  id v8 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002BB764;
  v13[3] = &unk_10085E250;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  BOOL v17 = a5;
  v15 = &v18;
  id v10 = v8;
  dispatch_sync((dispatch_queue_t)queue, v13);
  char v11 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (id)readItemWithService:(id)a3 account:(id)a4 synchronizable:(BOOL)a5 systemKeychain:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_1002BBD98;
  v27 = sub_1002BBDA8;
  id v28 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002BBDB0;
  block[3] = &unk_10085E278;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  uint64_t v20 = &v23;
  BOOL v21 = a5;
  BOOL v22 = a6;
  id v13 = v11;
  id v14 = v10;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);

  return v15;
}

- (id)readAllItemsWithService:(id)a3 synchronizable:(BOOL)a4 systemKeychain:(BOOL)a5
{
  id v8 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  BOOL v21 = sub_1002BBD98;
  BOOL v22 = sub_1002BBDA8;
  id v23 = (id)objc_opt_new();
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002BBF5C;
  v13[3] = &unk_10085E250;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  BOOL v17 = a5;
  id v15 = &v18;
  id v10 = v8;
  dispatch_sync((dispatch_queue_t)queue, v13);
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);

  return v11;
}

- (BOOL)deleteItemWithService:(id)a3 account:(id)a4 synchronizable:(BOOL)a5 systemKeychain:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002BC50C;
  block[3] = &unk_10085E2C8;
  block[4] = self;
  id v17 = v10;
  BOOL v20 = a5;
  BOOL v21 = a6;
  id v18 = v11;
  id v19 = &v22;
  id v13 = v11;
  id v14 = v10;
  dispatch_sync((dispatch_queue_t)queue, block);
  LOBYTE(queue) = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return (char)queue;
}

- (BOOL)deleteAllItemsWithService:(id)a3 synchronizable:(BOOL)a4 systemKeychain:(BOOL)a5
{
  id v8 = a3;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002BC85C;
  v13[3] = &unk_10085E250;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  BOOL v17 = a5;
  id v15 = &v18;
  id v10 = v8;
  dispatch_sync((dispatch_queue_t)queue, v13);
  char v11 = *((unsigned char *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (id)_initInternal
{
  if ([(NIServerKeychainManager *)self _shouldLog])
  {
    v3 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ni-km,_initInternal", buf, 2u);
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)NIServerKeychainManager;
  v4 = [(NIServerKeychainManager *)&v8 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nearbyd.km", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;
  }
  return v4;
}

- (id)_internalReadItemWithService:(id)a3 account:(id)a4 synchronizable:(BOOL)a5 systemKeychain:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NIServerKeychainManager *)self _shouldLog])
  {
    v12 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478595;
      *(void *)id v28 = v10;
      *(_WORD *)&v28[8] = 2113;
      *(void *)&v28[10] = v11;
      __int16 v29 = 1024;
      BOOL v30 = v7;
      __int16 v31 = 1024;
      BOOL v32 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ni-km,Read: %{private}@, %{private}@, %d, %d", buf, 0x22u);
    }
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v14 = (__CFDictionary *)CFAutorelease(Mutable);
  id v15 = v14;
  CFTypeRef result = 0;
  if (v6) {
    CFBooleanRef v16 = kCFBooleanTrue;
  }
  else {
    CFBooleanRef v16 = kCFBooleanFalse;
  }
  CFDictionaryAddValue(v14, kSecUseSystemKeychain, v16);
  CFDictionaryAddValue(v15, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(v15, kSecUseDataProtectionKeychain, kCFBooleanTrue);
  CFDictionaryAddValue(v15, kSecAttrAccount, v11);
  CFDictionaryAddValue(v15, kSecAttrService, v10);
  CFDictionaryAddValue(v15, kSecAttrAccessGroup, @"com.apple.nearbyd");
  if (v7) {
    CFBooleanRef v17 = kCFBooleanTrue;
  }
  else {
    CFBooleanRef v17 = kCFBooleanFalse;
  }
  CFDictionaryAddValue(v15, kSecAttrSynchronizable, v17);
  CFDictionaryAddValue(v15, kSecReturnData, kCFBooleanTrue);
  CFDictionaryAddValue(v15, kSecReturnAttributes, kCFBooleanTrue);
  OSStatus v18 = SecItemCopyMatching(v15, &result);
  if (result)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    CFTypeID v20 = CFGetTypeID(result);
    char v21 = (void *)result;
    if (TypeID != v20)
    {
      char v21 = 0;
      CFRelease(result);
    }
  }
  else
  {
    char v21 = 0;
  }
  if ([(NIServerKeychainManager *)self _shouldLog])
  {
    uint64_t v22 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67174915;
      *(_DWORD *)id v28 = v18;
      *(_WORD *)&v28[4] = 2113;
      *(void *)&v28[6] = v21;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#ni-km,Read status: %{private}d. Result: %{private}@", buf, 0x12u);
    }
  }
  id v23 = [v21 objectForKeyedSubscript:kSecValueData];
  if (v23) {
    uint64_t v24 = [[NIServerKeychainItem alloc] initWithService:v10 account:v11 data:v23];
  }
  else {
    uint64_t v24 = 0;
  }

  return v24;
}

- (void)_unitTest1
{
  v3 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ni-km,======================================================================", buf, 2u);
  }

  v4 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ni-km,UNIT TEST 1", buf, 2u);
  }

  if (+[NIPlatformInfo isInternalBuild])
  {
    char v76 = 0;
    dispatch_queue_t v5 = [(NIServerKeychainManager *)self readItemWithService:@"UnitTestFunction1" account:@"UnitTest1" synchronizable:0 systemKeychain:0];
    BOOL v6 = v5;
    if (v5) {
      unsigned int v7 = [(NIServerKeychainItem *)v5 isEqual:0];
    }
    else {
      unsigned int v7 = 1;
    }
    objc_super v8 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v9 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: READ", buf, 8u);
    }

    id v10 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", buf, 0xCu);
    }

    id v11 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected read result: %@", buf, 0xCu);
    }

    v12 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = "FAILED";
      if (v7) {
        id v13 = "PASSED";
      }
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    id v14 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    ++v76;
    id v15 = [NIServerKeychainItem alloc];
    CFBooleanRef v16 = +[NSData dataWithBytes:&v76 length:1];
    CFBooleanRef v17 = [(NIServerKeychainItem *)v15 initWithService:@"UnitTestFunction1" account:@"UnitTest1" data:v16];

    unsigned int v18 = [(NIServerKeychainManager *)self writeItem:v17 synchronizable:0 systemKeychain:0];
    id v19 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    CFTypeID v20 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 2;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: WRITE", buf, 8u);
    }

    char v21 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Write: %@.", buf, 0xCu);
    }

    uint64_t v22 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = "FAILED";
      if (v18) {
        id v23 = "PASSED";
      }
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    uint64_t v24 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    unint64_t v25 = (unint64_t)[(NIServerKeychainItem *)v17 copy];
    uint64_t v26 = [(NIServerKeychainManager *)self readItemWithService:@"UnitTestFunction1" account:@"UnitTest1" synchronizable:0 systemKeychain:0];

    if (v26 | v25) {
      unsigned int v27 = [(id)v26 isEqual:v25];
    }
    else {
      unsigned int v27 = 1;
    }
    id v28 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    __int16 v29 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 3;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: READ", buf, 8u);
    }

    BOOL v30 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (NIServerKeychainItem *)v26;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", buf, 0xCu);
    }

    __int16 v31 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (NIServerKeychainItem *)v25;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected read result: %@", buf, 0xCu);
    }

    BOOL v32 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = "FAILED";
      if (v27) {
        v33 = "PASSED";
      }
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v34 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    ++v76;
    v35 = [NIServerKeychainItem alloc];
    v36 = +[NSData dataWithBytes:&v76 length:1];
    v37 = [(NIServerKeychainItem *)v35 initWithService:@"UnitTestFunction1" account:@"UnitTest1" data:v36];

    unsigned int v38 = [(NIServerKeychainManager *)self writeItem:v37 synchronizable:0 systemKeychain:0];
    v39 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v40 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 4;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: WRITE", buf, 8u);
    }

    v41 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v37;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Write: %@.", buf, 0xCu);
    }

    v42 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = "FAILED";
      if (v38) {
        v43 = "PASSED";
      }
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v44 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    unint64_t v45 = (unint64_t)[(NIServerKeychainItem *)v37 copy];
    uint64_t v46 = [(NIServerKeychainManager *)self readItemWithService:@"UnitTestFunction1" account:@"UnitTest1" synchronizable:0 systemKeychain:0];

    if (v46 | v45) {
      unsigned int v47 = [(id)v46 isEqual:v45];
    }
    else {
      unsigned int v47 = 1;
    }
    v48 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v49 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 5;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: READ", buf, 8u);
    }

    v50 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (NIServerKeychainItem *)v46;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", buf, 0xCu);
    }

    v51 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = (NIServerKeychainItem *)v45;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected read result: %@", buf, 0xCu);
    }

    v52 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = "FAILED";
      if (v47) {
        v53 = "PASSED";
      }
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v54 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    unsigned int v55 = [(NIServerKeychainManager *)self deleteItemWithService:@"UnitTestFunction1" account:@"UnitTest1" synchronizable:0 systemKeychain:0];
    v56 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v57 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 6;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: DELETE", buf, 8u);
    }

    v58 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = "FAILED";
      if (v55) {
        v59 = "PASSED";
      }
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v59;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v60 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    unsigned int v61 = [(NIServerKeychainManager *)self deleteItemWithService:@"UnitTestFunction1" account:@"UnitTest1" synchronizable:0 systemKeychain:0];
    v62 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v63 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 7;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: DELETE", buf, 8u);
    }

    v64 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = "FAILED";
      if (v61) {
        v65 = "PASSED";
      }
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v65;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v66 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v67 = [(NIServerKeychainManager *)self readItemWithService:@"UnitTestFunction1" account:@"UnitTest1" synchronizable:0 systemKeychain:0];

    if (v67) {
      unsigned int v68 = [(NIServerKeychainItem *)v67 isEqual:0];
    }
    else {
      unsigned int v68 = 1;
    }
    v69 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }

    v70 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v78) = 8;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 1-%d: READ", buf, 8u);
    }

    v71 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = v67;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", buf, 0xCu);
    }

    v72 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v78 = 0;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected read result: %@", buf, 0xCu);
    }

    v73 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v74 = "FAILED";
      if (v68) {
        v74 = "PASSED";
      }
      *(_DWORD *)buf = 136315138;
      v78 = (NIServerKeychainItem *)v74;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", buf, 0xCu);
    }

    v75 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", buf, 2u);
    }
  }
}

- (void)_unitTest2
{
  v3 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ni-km,======================================================================", buf, 2u);
  }

  v4 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ni-km,UNIT TEST 2", buf, 2u);
  }

  if (+[NIPlatformInfo isInternalBuild])
  {
    *(void *)buf = 0;
    v110 = buf;
    uint64_t v111 = 0x2020000000;
    char v112 = 0;
    uint64_t v108 = 0;
    v91 = objc_opt_new();
    dispatch_queue_t v5 = [(NIServerKeychainManager *)self readAllItemsWithService:@"UnitTestFunction2" synchronizable:0 systemKeychain:0];
    id v6 = [v5 count];
    id v7 = [v91 count];
    v110[24] = v6 == v7;
    if (v6 == v7)
    {
      v105[0] = _NSConcreteStackBlock;
      v105[1] = 3221225472;
      v105[2] = sub_1002BF5D0;
      v105[3] = &unk_10085E2F0;
      id v106 = v91;
      v107 = buf;
      [v5 enumerateObjectsUsingBlock:v105];
    }
    objc_super v8 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
    }

    v9 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 67109120;
      LODWORD(v114) = 1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 2-%d: READ ALL", v113, 8u);
    }

    id v10 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = (const char *)v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", v113, 0xCu);
    }

    id v11 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = (const char *)v91;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected stored: %@", v113, 0xCu);
    }

    v12 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v110[24]) {
        id v13 = "PASSED";
      }
      else {
        id v13 = "FAILED";
      }
      *(_DWORD *)v113 = 136315138;
      v114 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", v113, 0xCu);
    }

    id v14 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
    }

    id v15 = 0;
    CFBooleanRef v16 = 0;
    CFBooleanRef v17 = 0;
    uint64_t v18 = 1;
    do
    {
      ++v108;
      id v19 = +[NSString stringWithFormat:@"UnitTest2-%d", v18];

      CFTypeID v20 = +[NSData dataWithBytes:&v108 length:8];

      v92 = [[NIServerKeychainItem alloc] initWithService:@"UnitTestFunction2" account:v19 data:v20];
      if (!-[NIServerKeychainManager writeItem:synchronizable:systemKeychain:](self, "writeItem:synchronizable:systemKeychain:"))
      {
        v69 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
          sub_10042B448((uint64_t)v92, v69, v70, v71, v72, v73, v74, v75);
        }
        goto LABEL_108;
      }
      [v91 addObject:];
      uint64_t v18 = (v18 + 1);
      id v15 = v92;
      CFBooleanRef v16 = v19;
      CFBooleanRef v17 = v20;
    }
    while (v18 != 8);
    char v21 = [(NIServerKeychainManager *)self readAllItemsWithService:@"UnitTestFunction2" synchronizable:0 systemKeychain:0];

    id v22 = [v21 count];
    id v23 = [v91 count];
    v110[24] = v22 == v23;
    if (v22 == v23)
    {
      v102[0] = _NSConcreteStackBlock;
      v102[1] = 3221225472;
      v102[2] = sub_1002BF618;
      v102[3] = &unk_10085E2F0;
      id v103 = v91;
      v104 = buf;
      [v21 enumerateObjectsUsingBlock:v102];
    }
    uint64_t v24 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
    }

    unint64_t v25 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 67109120;
      LODWORD(v114) = 2;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 2-%d: READ ALL", v113, 8u);
    }

    uint64_t v26 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = (const char *)v21;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", v113, 0xCu);
    }

    unsigned int v27 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = (const char *)v91;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected stored: %@", v113, 0xCu);
    }

    id v28 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      if (v110[24]) {
        __int16 v29 = "PASSED";
      }
      else {
        __int16 v29 = "FAILED";
      }
      *(_DWORD *)v113 = 136315138;
      v114 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", v113, 0xCu);
    }

    BOOL v30 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
    }

    char v31 = 1;
    do
    {
      char v32 = v31;
      v33 = [v91 allObjects];
      v34 = [v33 firstObject];

      v35 = [v34 service];
      v36 = [v34 account];
      unsigned __int8 v37 = [(NIServerKeychainManager *)self deleteItemWithService:v35 account:v36 synchronizable:0 systemKeychain:0];

      if ((v37 & 1) == 0)
      {
        char v76 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
          sub_10042B4B4((uint64_t)v34, v76, v77, v78, v79, v80, v81, v82);
        }

        goto LABEL_107;
      }
      [v91 removeObject:v34];

      char v31 = 0;
    }
    while ((v32 & 1) != 0);
    dispatch_queue_t v5 = [(NIServerKeychainManager *)self readAllItemsWithService:@"UnitTestFunction2" synchronizable:0 systemKeychain:0];

    id v38 = [v5 count];
    id v39 = [v91 count];
    v110[24] = v38 == v39;
    if (v38 == v39)
    {
      v99[0] = _NSConcreteStackBlock;
      v99[1] = 3221225472;
      v99[2] = sub_1002BF660;
      v99[3] = &unk_10085E2F0;
      id v100 = v91;
      v101 = buf;
      [v5 enumerateObjectsUsingBlock:v99];
    }
    v40 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
    }

    v41 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 67109120;
      LODWORD(v114) = 3;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 2-%d: READ ALL", v113, 8u);
    }

    v42 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = (const char *)v5;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", v113, 0xCu);
    }

    v43 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = (const char *)v91;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected stored: %@", v113, 0xCu);
    }

    v44 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      if (v110[24]) {
        unint64_t v45 = "PASSED";
      }
      else {
        unint64_t v45 = "FAILED";
      }
      *(_DWORD *)v113 = 136315138;
      v114 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", v113, 0xCu);
    }

    uint64_t v46 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
    }

    uint64_t v47 = 8;
    v48 = v92;
    v49 = v19;
    v50 = v20;
    do
    {
      ++v108;
      id v19 = +[NSString stringWithFormat:@"UnitTest2-%d", v47];

      CFTypeID v20 = +[NSData dataWithBytes:&v108 length:8];

      v92 = [[NIServerKeychainItem alloc] initWithService:@"UnitTestFunction2" account:v19 data:v20];
      if (!-[NIServerKeychainManager writeItem:synchronizable:systemKeychain:](self, "writeItem:synchronizable:systemKeychain:"))
      {
        v83 = qword_1008ABDE0;
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
          sub_10042B448((uint64_t)v92, v83, v84, v85, v86, v87, v88, v89);
        }
        goto LABEL_108;
      }
      [v91 addObject:];
      uint64_t v47 = (v47 + 1);
      v48 = v92;
      v49 = v19;
      v50 = v20;
    }
    while (v47 != 108);
    char v21 = [(NIServerKeychainManager *)self readAllItemsWithService:@"UnitTestFunction2" synchronizable:0 systemKeychain:0];

    id v51 = [v21 count];
    id v52 = [v91 count];
    v110[24] = v51 == v52;
    if (v51 == v52)
    {
      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472;
      v96[2] = sub_1002BF6A8;
      v96[3] = &unk_10085E2F0;
      id v97 = v91;
      v98 = buf;
      [v21 enumerateObjectsUsingBlock:v96];
    }
    v53 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
    }

    v54 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 67109120;
      LODWORD(v114) = 4;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 2-%d: READ ALL", v113, 8u);
    }

    unsigned int v55 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = (const char *)v21;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", v113, 0xCu);
    }

    v56 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v113 = 138412290;
      v114 = (const char *)v91;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected stored: %@", v113, 0xCu);
    }

    v57 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      if (v110[24]) {
        v58 = "PASSED";
      }
      else {
        v58 = "FAILED";
      }
      *(_DWORD *)v113 = 136315138;
      v114 = v58;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", v113, 0xCu);
    }

    v59 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v113 = 0;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
    }

    if ([(NIServerKeychainManager *)self deleteAllItemsWithService:@"UnitTestFunction2" synchronizable:0 systemKeychain:0])
    {
      [v91 removeAllObjects];
      dispatch_queue_t v5 = [(NIServerKeychainManager *)self readAllItemsWithService:@"UnitTestFunction2" synchronizable:0 systemKeychain:0];

      id v60 = [v5 count];
      id v61 = [v91 count];
      v110[24] = v60 == v61;
      if (v60 == v61)
      {
        v93[0] = _NSConcreteStackBlock;
        v93[1] = 3221225472;
        v93[2] = sub_1002BF6F0;
        v93[3] = &unk_10085E2F0;
        id v94 = v91;
        v95 = buf;
        [v5 enumerateObjectsUsingBlock:v93];
      }
      v62 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v113 = 0;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
      }

      v63 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v113 = 67109120;
        LODWORD(v114) = 5;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 2-%d: READ ALL", v113, 8u);
      }

      v64 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v113 = 138412290;
        v114 = (const char *)v5;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", v113, 0xCu);
      }

      v65 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v113 = 138412290;
        v114 = (const char *)v91;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected stored: %@", v113, 0xCu);
      }

      v66 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        if (v110[24]) {
          v67 = "PASSED";
        }
        else {
          v67 = "FAILED";
        }
        *(_DWORD *)v113 = 136315138;
        v114 = v67;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", v113, 0xCu);
      }

      unsigned int v68 = (id)qword_1008ABDE0;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v113 = 0;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", v113, 2u);
      }

      goto LABEL_108;
    }
    v90 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_10042B404(v90);
    }
LABEL_107:
    dispatch_queue_t v5 = v21;
LABEL_108:

    _Block_object_dispose(buf, 8);
  }
}

- (void)_unitTest3
{
  v3 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v70) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ni-km,======================================================================", (uint8_t *)&v70, 2u);
  }

  v4 = (id)qword_1008ABDE0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v70) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ni-km,UNIT TEST 3", (uint8_t *)&v70, 2u);
  }

  if (+[NIPlatformInfo isInternalBuild])
  {
    dispatch_queue_t v5 = [(NIServerKeychainManager *)self readItemWithService:@"UnitTestFunction3" account:@"UnitTest3" synchronizable:0 systemKeychain:0];
    id v6 = v5;
    if (v5) {
      unsigned int v7 = [(NIServerKeychainItem *)v5 isEqual:0];
    }
    else {
      unsigned int v7 = 1;
    }
    objc_super v8 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v70) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v70, 2u);
    }

    v9 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 67109120;
      LODWORD(v71) = 1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 3-%d: READ", (uint8_t *)&v70, 8u);
    }

    id v10 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 138412290;
      uint64_t v71 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", (uint8_t *)&v70, 0xCu);
    }

    id v11 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 138412290;
      uint64_t v71 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected read result: %@", (uint8_t *)&v70, 0xCu);
    }

    v12 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = "FAILED";
      if (v7) {
        id v13 = "PASSED";
      }
      int v70 = 136315138;
      uint64_t v71 = (NIServerKeychainItem *)v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", (uint8_t *)&v70, 0xCu);
    }

    id v14 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v70) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v70, 2u);
    }

    id v15 = [NIServerKeychainItem alloc];
    CFBooleanRef v16 = NSRandomData();
    CFBooleanRef v17 = [(NIServerKeychainItem *)v15 initWithService:@"UnitTestFunction3" account:@"UnitTest3" data:v16];

    unsigned int v18 = [(NIServerKeychainManager *)self writeItem:v17 synchronizable:0 systemKeychain:0];
    id v19 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v70) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v70, 2u);
    }

    CFTypeID v20 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 67109120;
      LODWORD(v71) = 2;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 3-%d: WRITE", (uint8_t *)&v70, 8u);
    }

    char v21 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 138412290;
      uint64_t v71 = v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Write: %@.", (uint8_t *)&v70, 0xCu);
    }

    id v22 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = "FAILED";
      if (v18) {
        id v23 = "PASSED";
      }
      int v70 = 136315138;
      uint64_t v71 = (NIServerKeychainItem *)v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", (uint8_t *)&v70, 0xCu);
    }

    uint64_t v24 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v70) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v70, 2u);
    }

    unint64_t v25 = (unint64_t)[(NIServerKeychainItem *)v17 copy];
    uint64_t v26 = [(NIServerKeychainManager *)self readItemWithService:@"UnitTestFunction3" account:@"UnitTest3" synchronizable:0 systemKeychain:0];

    if (v26 | v25) {
      unsigned int v27 = [(id)v26 isEqual:v25];
    }
    else {
      unsigned int v27 = 1;
    }
    id v28 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v70) = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v70, 2u);
    }

    __int16 v29 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 67109120;
      LODWORD(v71) = 3;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 3-%d: READ", (uint8_t *)&v70, 8u);
    }

    BOOL v30 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 138412290;
      uint64_t v71 = (NIServerKeychainItem *)v26;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", (uint8_t *)&v70, 0xCu);
    }

    char v31 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 138412290;
      uint64_t v71 = (NIServerKeychainItem *)v25;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected read result: %@", (uint8_t *)&v70, 0xCu);
    }

    char v32 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = "FAILED";
      if (v27) {
        v33 = "PASSED";
      }
      int v70 = 136315138;
      uint64_t v71 = (NIServerKeychainItem *)v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", (uint8_t *)&v70, 0xCu);
    }

    v34 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v70) = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v70, 2u);
    }

    v35 = [NIServerKeychainItem alloc];
    v36 = NSRandomData();
    unsigned __int8 v37 = [(NIServerKeychainItem *)v35 initWithService:@"UnitTestFunction3" account:@"UnitTest3" data:v36];

    unsigned int v38 = [(NIServerKeychainManager *)self writeItem:v37 synchronizable:0 systemKeychain:0];
    id v39 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v70) = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v70, 2u);
    }

    v40 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 67109120;
      LODWORD(v71) = 4;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 3-%d: WRITE", (uint8_t *)&v70, 8u);
    }

    v41 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 138412290;
      uint64_t v71 = v37;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Write: %@.", (uint8_t *)&v70, 0xCu);
    }

    v42 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = "FAILED";
      if (v38) {
        v43 = "PASSED";
      }
      int v70 = 136315138;
      uint64_t v71 = (NIServerKeychainItem *)v43;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", (uint8_t *)&v70, 0xCu);
    }

    v44 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v70) = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v70, 2u);
    }

    unint64_t v45 = (unint64_t)[(NIServerKeychainItem *)v37 copy];
    uint64_t v46 = [(NIServerKeychainManager *)self readItemWithService:@"UnitTestFunction3" account:@"UnitTest3" synchronizable:0 systemKeychain:0];

    if (v46 | v45) {
      unsigned int v47 = [(id)v46 isEqual:v45];
    }
    else {
      unsigned int v47 = 1;
    }
    v48 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v70) = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v70, 2u);
    }

    v49 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 67109120;
      LODWORD(v71) = 5;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 3-%d: READ", (uint8_t *)&v70, 8u);
    }

    v50 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 138412290;
      uint64_t v71 = (NIServerKeychainItem *)v46;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", (uint8_t *)&v70, 0xCu);
    }

    id v51 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 138412290;
      uint64_t v71 = (NIServerKeychainItem *)v45;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected read result: %@", (uint8_t *)&v70, 0xCu);
    }

    id v52 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = "FAILED";
      if (v47) {
        v53 = "PASSED";
      }
      int v70 = 136315138;
      uint64_t v71 = (NIServerKeychainItem *)v53;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", (uint8_t *)&v70, 0xCu);
    }

    v54 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v70) = 0;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v70, 2u);
    }

    unsigned int v55 = [(NIServerKeychainManager *)self deleteItemWithService:@"UnitTestFunction3" account:@"UnitTest3" synchronizable:0 systemKeychain:0];
    v56 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v70) = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v70, 2u);
    }

    v57 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 67109120;
      LODWORD(v71) = 6;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 3-%d: DELETE", (uint8_t *)&v70, 8u);
    }

    v58 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = "FAILED";
      if (v55) {
        v59 = "PASSED";
      }
      int v70 = 136315138;
      uint64_t v71 = (NIServerKeychainItem *)v59;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", (uint8_t *)&v70, 0xCu);
    }

    id v60 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v70) = 0;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v70, 2u);
    }

    id v61 = [(NIServerKeychainManager *)self readItemWithService:@"UnitTestFunction3" account:@"UnitTest3" synchronizable:0 systemKeychain:0];

    if (v61) {
      unsigned int v62 = [(NIServerKeychainItem *)v61 isEqual:0];
    }
    else {
      unsigned int v62 = 1;
    }
    v63 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v70) = 0;
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v70, 2u);
    }

    v64 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 67109120;
      LODWORD(v71) = 7;
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "#ni-km,| Test 3-%d: READ", (uint8_t *)&v70, 8u);
    }

    v65 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 138412290;
      uint64_t v71 = v61;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Read result: %@.", (uint8_t *)&v70, 0xCu);
    }

    v66 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      int v70 = 138412290;
      uint64_t v71 = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Expected read result: %@", (uint8_t *)&v70, 0xCu);
    }

    v67 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v68 = "FAILED";
      if (v62) {
        unsigned int v68 = "PASSED";
      }
      int v70 = 136315138;
      uint64_t v71 = (NIServerKeychainItem *)v68;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "#ni-km,|     Test result: %s", (uint8_t *)&v70, 0xCu);
    }

    v69 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v70) = 0;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "#ni-km,|------------------------------------------------------------", (uint8_t *)&v70, 2u);
    }
  }
}

- (BOOL)_shouldLog
{
  if (!+[NIPlatformInfo isInternalBuild]) {
    return 0;
  }
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"KMOutputLogs"];

  return v3;
}

- (void).cxx_destruct
{
}

@end