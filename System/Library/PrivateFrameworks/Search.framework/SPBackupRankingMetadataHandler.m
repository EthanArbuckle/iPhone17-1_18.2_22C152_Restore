@interface SPBackupRankingMetadataHandler
+ (id)sharedInstance;
+ (void)checkForRestoreFile;
+ (void)clearDirtyState;
- (BOOL)didCreateKeychainItem;
- (NSMutableDictionary)keychainData;
- (NSMutableDictionary)privateKeyQuery;
- (OS_dispatch_queue)queue;
- (SPBackupRankingMetadataHandler)init;
- (char)getDataOutWithSize:(unint64_t)a3 withFlag:(unint64_t)a4 fd:(int *)a5;
- (id)createRandomAESKey;
- (id)dictionaryToSecItemFormat:(id)a3;
- (id)fetchKeyFromKeychain;
- (id)getBackUpFilePath;
- (id)secItemFormatToDictionary:(id)a3;
- (int)getBackupVersion:(unint64_t)a3;
- (int)restoreFromExistingKeyWithOutData:(__CFData *)a3;
- (void)addAttributesToDictionary:(id)a3;
- (void)backUpFileProtectionClassCheck;
- (void)backUpFileProtectionClassCheckWithFd:(int)a3;
- (void)extractAndWriteEncryptedBackupMetadata:(id)a3;
- (void)restoreRankingSignalsFromEncryptedFile:(id)a3;
- (void)setKeychainData:(id)a3;
- (void)setPrivateKeyQuery:(id)a3;
- (void)setQueue:(id)a3;
- (void)tryRestoreFromBackUp;
- (void)writeToKeychain;
@end

@implementation SPBackupRankingMetadataHandler

+ (id)sharedInstance
{
  if (qword_1000A8ED0 != -1) {
    dispatch_once(&qword_1000A8ED0, &stru_100092F38);
  }
  v2 = (void *)qword_1000A8EC8;

  return v2;
}

+ (void)clearDirtyState
{
}

+ (void)checkForRestoreFile
{
  id v2 = a1;
  objc_sync_enter(v2);
  char v8 = 0;
  if (([(id)qword_1000A8E88 BOOLForKey:@"didCreateLocalBackup"] & 1) == 0)
  {
    v3 = +[NSFileManager defaultManager];
    unsigned __int8 v4 = [v3 fileExistsAtPath:qword_1000A8EA0 isDirectory:&v8];

    if ((v4 & 1) == 0)
    {
      v5 = (const std::__fs::filesystem::path *)[(id)qword_1000A8E98 UTF8String];
      v6 = (const std::__fs::filesystem::path *)[(id)qword_1000A8EA8 UTF8String];
      rename(v5, v6, v7);
    }
  }
  objc_sync_exit(v2);
}

- (id)getBackUpFilePath
{
  return (id)qword_1000A8E98;
}

- (SPBackupRankingMetadataHandler)init
{
  v11.receiver = self;
  v11.super_class = (Class)SPBackupRankingMetadataHandler;
  id v2 = [(SPBackupRankingMetadataHandler *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.searchd.createEncryptedRankingBackupQueue", v3);
    [(SPBackupRankingMetadataHandler *)v2 setQueue:v4];

    id location = 0;
    objc_initWeak(&location, v2);
    v5 = SPLogForSPLogCategoryDefault();
    os_log_type_t v6 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v5, v6))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "com.apple.searchd.createEncryptedRankingBackup";
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Registering XPC activity:%s", buf, 0xCu);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100029FC0;
    v8[3] = &unk_100092F80;
    objc_copyWeak(&v9, &location);
    xpc_activity_register("com.apple.searchd.createEncryptedRankingBackup", XPC_ACTIVITY_CHECK_IN, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)addAttributesToDictionary:(id)a3
{
  id v3 = a3;
  [v3 setObject:@"com.apple.Spotlight" forKey:kSecAttrAccessGroup];
  [v3 setObject:kCFBooleanTrue forKey:kSecAttrSynchronizable];
  [v3 setObject:kCFBooleanTrue forKey:kSecReturnData];
  [v3 setObject:kCFBooleanTrue forKey:kSecAttrCanEncrypt];
  [v3 setObject:kCFBooleanTrue forKey:kSecAttrCanDecrypt];
  [v3 setObject:kSecAttrKeyClassSymmetric forKey:kSecAttrKeyClass];
}

- (int)restoreFromExistingKeyWithOutData:(__CFData *)a3
{
  CFTypeRef result = a3;
  CFDictionaryRef v4 = [(SPBackupRankingMetadataHandler *)self privateKeyQuery];
  OSStatus v5 = SecItemCopyMatching(v4, &result);

  os_log_type_t v6 = [(SPBackupRankingMetadataHandler *)self keychainData];

  if (!v6)
  {
    char v8 = objc_opt_new();
    [(SPBackupRankingMetadataHandler *)self setKeychainData:v8];

    if (v5) {
      return v5;
    }
LABEL_5:
    id v9 = [(SPBackupRankingMetadataHandler *)self keychainData];
    [v9 setObject:result forKey:kSecValueData];

    return v5;
  }
  if (!v5) {
    goto LABEL_5;
  }
  return v5;
}

- (id)fetchKeyFromKeychain
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  [(SPBackupRankingMetadataHandler *)self setPrivateKeyQuery:v3];

  CFDictionaryRef v4 = [(SPBackupRankingMetadataHandler *)self privateKeyQuery];
  [v4 setObject:kSecClassKey forKey:kSecClass];

  OSStatus v5 = [(SPBackupRankingMetadataHandler *)self privateKeyQuery];
  [(SPBackupRankingMetadataHandler *)self addAttributesToDictionary:v5];

  unsigned int v6 = [(SPBackupRankingMetadataHandler *)self restoreFromExistingKeyWithOutData:0];
  if (!v6) {
    goto LABEL_5;
  }
  if (v6 == -25300)
  {
    if ([(SPBackupRankingMetadataHandler *)self didCreateKeychainItem])
    {
      [(SPBackupRankingMetadataHandler *)self writeToKeychain];
      [(SPBackupRankingMetadataHandler *)self restoreFromExistingKeyWithOutData:0];
LABEL_5:
      v7 = [(SPBackupRankingMetadataHandler *)self keychainData];
      char v8 = [v7 objectForKey:kSecValueData];

      goto LABEL_10;
    }
  }
  else
  {
    id v9 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100065304();
    }
  }
  char v8 = 0;
LABEL_10:

  return v8;
}

- (id)createRandomAESKey
{
  uint64_t v2 = 0;
  v5[0] = 0;
  v5[1] = 0;
  do
  {
    *(_DWORD *)((char *)v5 + v2) = arc4random();
    v2 += 4;
  }
  while (v2 != 16);
  id v3 = [objc_alloc((Class)NSData) initWithBytes:v5 length:16];

  return v3;
}

- (BOOL)didCreateKeychainItem
{
  id v3 = [(SPBackupRankingMetadataHandler *)self keychainData];

  if (v3)
  {
    CFDictionaryRef v4 = [(SPBackupRankingMetadataHandler *)self keychainData];

    if (!v4) {
      goto LABEL_9;
    }
    OSStatus v5 = [(SPBackupRankingMetadataHandler *)self keychainData];
    CFDictionaryRef v6 = [(SPBackupRankingMetadataHandler *)self dictionaryToSecItemFormat:v5];

    if (SecItemDelete(v6))
    {
      v7 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10006536C();
      }
    }
  }
  else
  {
    CFDictionaryRef v6 = (const __CFDictionary *)objc_opt_new();
    [(SPBackupRankingMetadataHandler *)self setKeychainData:v6];
  }

LABEL_9:
  char v8 = [(SPBackupRankingMetadataHandler *)self createRandomAESKey];
  if (v8)
  {
    id v9 = [(SPBackupRankingMetadataHandler *)self keychainData];
    [v9 setObject:v8 forKey:kSecValueData];

    v10 = [(SPBackupRankingMetadataHandler *)self keychainData];
    [(SPBackupRankingMetadataHandler *)self addAttributesToDictionary:v10];
  }
  else
  {
    v10 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100065338();
    }
  }

  return v8 != 0;
}

- (void)writeToKeychain
{
  CFTypeRef result = 0;
  CFDictionaryRef v3 = [(SPBackupRankingMetadataHandler *)self privateKeyQuery];
  OSStatus v4 = SecItemCopyMatching(v3, &result);

  if (v4)
  {
    OSStatus v5 = [(SPBackupRankingMetadataHandler *)self keychainData];
    OSStatus v6 = SecItemAdd((CFDictionaryRef)[(SPBackupRankingMetadataHandler *)self dictionaryToSecItemFormat:v5], 0);

    if (v6 == -25299)
    {
      v7 = [(SPBackupRankingMetadataHandler *)self keychainData];
      OSStatus v6 = SecItemDelete((CFDictionaryRef)[(SPBackupRankingMetadataHandler *)self dictionaryToSecItemFormat:v7]);
    }
    if (v6)
    {
      char v8 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000653D4();
      }
    }
    if (result) {
      CFRelease(result);
    }
  }
  else
  {
    id v9 = (void *)result;
    v10 = +[NSMutableDictionary dictionaryWithDictionary:result];

    objc_super v11 = [(SPBackupRankingMetadataHandler *)self privateKeyQuery];
    v12 = [v11 objectForKey:kSecClass];
    [v10 setObject:v12 forKey:kSecClass];

    v13 = [(SPBackupRankingMetadataHandler *)self keychainData];
    v14 = [(SPBackupRankingMetadataHandler *)self dictionaryToSecItemFormat:v13];

    [v14 removeObjectForKey:kSecClass];
    if (SecItemUpdate((CFDictionaryRef)v10, (CFDictionaryRef)v14))
    {
      v15 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000653A0();
      }
    }
  }
}

- (id)dictionaryToSecItemFormat:(id)a3
{
  id v3 = a3;
  OSStatus v4 = +[NSMutableDictionary dictionaryWithDictionary:v3];
  [v4 setObject:kSecClassKey forKey:kSecClass];
  OSStatus v5 = [v3 objectForKey:kSecValueData];

  if (v5) {
    [v4 setObject:v5 forKey:kSecValueData];
  }

  return v4;
}

- (id)secItemFormatToDictionary:(id)a3
{
  id v3 = +[NSMutableDictionary dictionaryWithDictionary:a3];
  [v3 setObject:kCFBooleanTrue forKey:kSecReturnData];
  [v3 setObject:kSecClassKey forKey:kSecClass];
  CFTypeRef result = 0;
  OSStatus v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);
  if (v4 == -25300)
  {
    OSStatus v5 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006543C();
    }
  }
  else
  {
    if (!v4)
    {
      [v3 setObject:result forKey:kSecValueData];
      goto LABEL_9;
    }
    OSStatus v5 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100065408();
    }
  }

LABEL_9:

  return v3;
}

- (void)backUpFileProtectionClassCheckWithFd:(int)a3
{
  if (a3 != -1 && fcntl(a3, 63) != 3) {
    fcntl(a3, 64, 3);
  }
}

- (void)backUpFileProtectionClassCheck
{
  id v3 = (id)qword_1000A8E98;
  if (v3)
  {
    id v5 = v3;
    uint64_t v4 = open((const char *)[v3 UTF8String], 0x8000);
    id v3 = v5;
    if (v4 != -1)
    {
      [(SPBackupRankingMetadataHandler *)self backUpFileProtectionClassCheckWithFd:v4];
      close(v4);
      id v3 = v5;
    }
  }
}

- (void)extractAndWriteEncryptedBackupMetadata:(id)a3
{
  uint64_t v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  OSStatus v6 = [(SPBackupRankingMetadataHandler *)v5 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B0C8;
  block[3] = &unk_1000921B0;
  block[4] = v5;
  dispatch_group_async(v4, v6, block);

  objc_sync_exit(v5);
}

- (void)tryRestoreFromBackUp
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  char v21 = 0;
  id v3 = +[NSFileManager defaultManager];
  unsigned __int8 v4 = [v3 fileExistsAtPath:qword_1000A8EA8 isDirectory:&v21];

  if (v4)
  {
    [(id)qword_1000A8E88 doubleForKey:@"lastBackupRestoreAttemptTime"];
    double v6 = v5;
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    id v20 = 0;
    id v20 = [(id)qword_1000A8E88 integerForKey:@"backupRestoreAttemptCount"];
    double v7 = CFAbsoluteTimeGetCurrent() - v6;
    if (((unint64_t)v18[3] < 0x10 || v7 >= 86400.0) && (byte_1000A8ED8 & 1) == 0 && (byte_1000A8ED9 & 1) == 0)
    {
      byte_1000A8ED9 = 1;
      if (v6 == 0.0)
      {
        char v8 = &XPC_ACTIVITY_INTERVAL_15_MIN;
      }
      else if (v7 <= 86400.0)
      {
        if (v7 <= 40000.0)
        {
          if (v7 <= 10000.0)
          {
            char v8 = &XPC_ACTIVITY_INTERVAL_1_DAY;
            if (v7 > 5000.0) {
              char v8 = &XPC_ACTIVITY_INTERVAL_8_HOURS;
            }
          }
          else
          {
            char v8 = &XPC_ACTIVITY_INTERVAL_4_HOURS;
          }
        }
        else
        {
          char v8 = &XPC_ACTIVITY_INTERVAL_1_HOUR;
        }
      }
      else
      {
        char v8 = &XPC_ACTIVITY_INTERVAL_5_MIN;
      }
      int64_t v9 = *v8;
      id location = 0;
      objc_initWeak(&location, v2);
      xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_REPEATING, 0);
      xpc_dictionary_set_BOOL(v10, XPC_ACTIVITY_ALLOW_BATTERY, 0);
      xpc_dictionary_set_int64(v10, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_HOUR);
      xpc_dictionary_set_string(v10, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
      xpc_dictionary_set_int64(v10, XPC_ACTIVITY_DELAY, v9);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10002BD58;
      handler[3] = &unk_100092FD0;
      id v11 = v10;
      id v13 = v11;
      objc_copyWeak(&v15, &location);
      v14 = &v17;
      xpc_activity_register("com.apple.searchd.restoreBackup", XPC_ACTIVITY_CHECK_IN, handler);
      objc_destroyWeak(&v15);

      objc_destroyWeak(&location);
    }
    _Block_object_dispose(&v17, 8);
  }
  objc_sync_exit(v2);
}

- (char)getDataOutWithSize:(unint64_t)a3 withFlag:(unint64_t)a4 fd:(int *)a5
{
  *a5 = -1;
  int v7 = sub_10002AAC8(a3, a4);
  if (v7 < 0)
  {
    xpc_object_t v10 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10006560C();
    }
  }
  else
  {
    int v8 = v7;
    CFTypeRef result = (char *)mmap(0, a3, 3, 1, v7, 0);
    if (result != (char *)-1)
    {
      *a5 = v8;
      return result;
    }
    close(v8);
    xpc_object_t v10 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100065640();
    }
  }

  return 0;
}

- (int)getBackupVersion:(unint64_t)a3
{
  memset(&v10.st_size, 0, 48);
  int v4 = open((const char *)objc_msgSend((id)qword_1000A8E98, "UTF8String", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 0);
  if (v4 < 0)
  {
    int v7 = *__error();
    int v8 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100065674(v7, v8);
    }

    *__error() = v7;
    return 1;
  }
  else
  {
    int v5 = v4;
    fstat(v4, &v10);
    int v6 = 1;
    if (v10.st_size >= a3)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      *(_OWORD *)__s1 = 0u;
      long long v12 = 0u;
      read(v5, __s1, a3);
      if (!strncmp(__s1, "SPOTLIGHT_RANKING_BACKUP_VERSION_00002", a3)) {
        int v6 = 2;
      }
      else {
        int v6 = 1;
      }
    }
    close(v5);
  }
  return v6;
}

- (void)restoreRankingSignalsFromEncryptedFile:(id)a3
{
  int v4 = a3;
  int v5 = [(SPBackupRankingMetadataHandler *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C260;
  block[3] = &unk_1000921B0;
  block[4] = self;
  dispatch_group_async(v4, v5, block);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
}

- (NSMutableDictionary)privateKeyQuery
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrivateKeyQuery:(id)a3
{
}

- (NSMutableDictionary)keychainData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKeychainData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainData, 0);
  objc_storeStrong((id *)&self->_privateKeyQuery, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end