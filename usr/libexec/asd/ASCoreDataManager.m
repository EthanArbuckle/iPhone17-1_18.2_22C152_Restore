@interface ASCoreDataManager
+ (ASCoreDataManager)sharedInstance;
- (ASCoreDataManager)initWithStore:(id)a3;
- (ASCoreDataManager)initWithStore:(id)a3 options:(id)a4;
- (BOOL)removeStoreWithURL:(id)a3 error:(id)a4;
- (NSManagedObjectModel)ggQex4P6Prvm5Zac;
- (NSPersistentContainer)xc4PEFTuh2u6xE7M;
- (NSURL)coreDataDirectoryURL;
- (id)fjcJHNNiQ83H10La;
- (id)gFJw2BGPtEQWyLz5;
- (id)migrateCoreDataManager;
- (id)retrieveLegacyRavioliWithCoreDataManager:(id)a3;
- (id)storeNameWithExtensionForStoreWithName:(id)a3;
- (int64_t)j2Xe3JZjJDN8Y8xD:(id)a3;
- (void)mILKmibfRWMwFVWD:(id)a3 iZGmRj7VI4MJ9lO1:(id)a4 AndError:(id *)a5;
- (void)npsTCqegVwa7yuzs;
- (void)setCoreDataDirectoryURL:(id)a3;
- (void)setGgQex4P6Prvm5Zac:(id)a3;
- (void)setXc4PEFTuh2u6xE7M:(id)a3;
@end

@implementation ASCoreDataManager

+ (ASCoreDataManager)sharedInstance
{
  if (qword_1006A5D68 != -1) {
    dispatch_once(&qword_1006A5D68, &stru_10065EFF8);
  }
  v2 = (void *)qword_1006A5D60;

  return (ASCoreDataManager *)v2;
}

- (ASCoreDataManager)initWithStore:(id)a3
{
  return [(ASCoreDataManager *)self initWithStore:a3 options:0];
}

- (ASCoreDataManager)initWithStore:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  char v74 = 1;
  v70.receiver = self;
  v70.super_class = (Class)ASCoreDataManager;
  v8 = [(ASCoreDataManager *)&v70 init];
  if (v8)
  {
    id v9 = objc_alloc_init((Class)NSFileManager);
    v63 = [(ASCoreDataManager *)v8 storeNameWithExtensionForStoreWithName:v6];
    v10 = [v9 URLsForDirectory:5 inDomains:8];
    v64 = [v10 firstObject];

    v11 = [v9 URLsForDirectory:5 inDomains:1];
    v65 = [v11 firstObject];

    v60 = [v64 URLByAppendingPathComponent:@"CoreAS" isDirectory:1];
    v12 = [@"Model56902430" stringByAppendingString:@".momd"];
    v61 = [v60 URLByAppendingPathComponent:v12];

    uint64_t v13 = [v65 URLByAppendingPathComponent:@"CoreAS" isDirectory:1];
    coreDataDirectoryURL = v8->_coreDataDirectoryURL;
    v8->_coreDataDirectoryURL = (NSURL *)v13;

    v15 = v8->_coreDataDirectoryURL;
    if (!v15)
    {
      if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
        sub_10055CA58();
      }
      *((unsigned char *)v72 + 24) = 0;
      v15 = v8->_coreDataDirectoryURL;
    }
    v16 = v15;
    id v69 = 0;
    [v9 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:0 error:&v69];
    id v17 = v69;
    v62 = [(NSURL *)v8->_coreDataDirectoryURL URLByAppendingPathComponent:v63];
    if (v17)
    {
      if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
        sub_10055C9F0();
      }
      *((unsigned char *)v72 + 24) = 0;
    }
    v18 = [v7 objectForKeyedSubscript:@"2BC2E664-199A-4A80-910A-CD19B11354F2"];
    id v19 = [v18 integerValue];
    int v20 = 1;
    switch((unint64_t)v19)
    {
      case 1uLL:
        CFStringRef v86 = @"2BC2E664-199A-4A80-910A-CD19B11354F2";
        v87 = &off_1006881D8;
        v21 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
        v8 = [(ASCoreDataManager *)v8 initWithStore:v6 options:v21];

        v22 = v8;
        goto LABEL_50;
      case 3uLL:
        v23 = [(ASCoreDataManager *)v8 migrateCoreDataManager];
        goto LABEL_18;
      case 4uLL:
        if (![(ASCoreDataManager *)v8 removeStoreWithURL:v62 error:0]) {
          goto LABEL_20;
        }
        v24 = qword_1006AD1A0;
        if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
          sub_10055C9B8(v24, v25, v26, v27, v28, v29, v30, v31);
        }
        v23 = [(ASCoreDataManager *)v8 initWithStore:v6];
        v8 = v23;
LABEL_18:
        v22 = v23;
        goto LABEL_50;
      case 6uLL:
        int v20 = 0;
        goto LABEL_20;
      default:
LABEL_20:
        id v32 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v61];
        [(ASCoreDataManager *)v8 setGgQex4P6Prvm5Zac:v32];

        v58 = +[NSPersistentStoreDescription persistentStoreDescriptionWithURL:v62];
        v33 = [(ASCoreDataManager *)v8 ggQex4P6Prvm5Zac];
        LODWORD(v32) = v33 == 0;

        if (v32)
        {
          v34 = qword_1006AD1A0;
          if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
            sub_10055C980(v34, v35, v36, v37, v38, v39, v40, v41);
          }
          *((unsigned char *)v72 + 24) = 0;
        }
        v59 = [(ASCoreDataManager *)v8 ggQex4P6Prvm5Zac];
        id v42 = [objc_alloc((Class)NSPersistentContainer) initWithName:@"Model56902430" managedObjectModel:v59];
        [(ASCoreDataManager *)v8 setXc4PEFTuh2u6xE7M:v42];

        if (v19 == (id)6) {
          int v43 = v20;
        }
        else {
          int v43 = 1;
        }
        if (v43 != 1) {
          goto LABEL_31;
        }
        id v44 = [(ASCoreDataManager *)v8 j2Xe3JZjJDN8Y8xD:v8->_coreDataDirectoryURL];
        if (v44 == (id)1)
        {
          CFStringRef v84 = @"2BC2E664-199A-4A80-910A-CD19B11354F2";
          v85 = &off_1006881F0;
          v54 = +[NSDictionary dictionaryWithObjects:&v85 forKeys:&v84 count:1];
          v8 = [(ASCoreDataManager *)v8 initWithStore:v6 options:v54];

          goto LABEL_45;
        }
        if (v44 == (id)3)
        {
          CFStringRef v82 = @"2BC2E664-199A-4A80-910A-CD19B11354F2";
          v83 = &off_100688208;
          v45 = +[NSDictionary dictionaryWithObjects:&v83 forKeys:&v82 count:1];
          v8 = [(ASCoreDataManager *)v8 initWithStore:v6 options:v45];

LABEL_45:
          v22 = v8;
          goto LABEL_49;
        }
LABEL_31:
        if (v20)
        {
          v46 = [(ASCoreDataManager *)v8 fjcJHNNiQ83H10La];
          v22 = v46;
          if (!v46)
          {
            *((unsigned char *)v72 + 24) = 0;
            goto LABEL_49;
          }
          unsigned int v68 = [(ASCoreDataManager *)v46 length];
          *(_DWORD *)buf = 0;
          v47 = v22;
          [(ASCoreDataManager *)v47 bytes];
          v56 = buf;
          sub_1003581FC();
          if (!*(_DWORD *)buf)
          {
            id v57 = [objc_alloc((Class)NSData) initWithBytes:v78 length:16, buf];
            [v58 setOption:v57 forKey:NSSQLiteSEEKeychainItemOption];
            [v58 setOption:NSFileProtectionCompleteUntilFirstUserAuthentication forKey:NSPersistentStoreFileProtectionKey];
            v48 = qword_1006AD1A0;
            if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "CoreData store encryption enabled.", buf, 2u);
            }
          }
        }
        else
        {
          v49 = qword_1006AD1A0;
          if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v78 = 0;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "CoreData store encryption disabled due to legacyMode detected.", v78, 2u);
          }
        }
        *(void *)v78 = 0;
        v79 = v78;
        uint64_t v80 = 0x2020000000;
        char v81 = 0;
        v77 = v58;
        v50 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v77, 1, v56);
        v51 = [(ASCoreDataManager *)v8 xc4PEFTuh2u6xE7M];
        [v51 setPersistentStoreDescriptions:v50];

        v52 = [(ASCoreDataManager *)v8 xc4PEFTuh2u6xE7M];
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_1000159B4;
        v66[3] = &unk_10065F020;
        v66[4] = v78;
        v66[5] = &v71;
        [v52 loadPersistentStoresWithCompletionHandler:v66];

        if (v79[24])
        {
          CFStringRef v75 = @"2BC2E664-199A-4A80-910A-CD19B11354F2";
          v76 = &off_1006881D8;
          v53 = +[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
          v8 = [(ASCoreDataManager *)v8 initWithStore:v6 options:v53];

          v22 = v8;
        }
        else if (*((unsigned char *)v72 + 24))
        {
          v8 = v8;
          v22 = v8;
        }
        else
        {
          v22 = 0;
        }
        _Block_object_dispose(v78, 8);
LABEL_49:

LABEL_50:
        break;
    }
  }
  else
  {
    v22 = 0;
  }
  _Block_object_dispose(&v71, 8);

  return v22;
}

- (BOOL)removeStoreWithURL:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSFileManager defaultManager];
  id v21 = v6;
  [v7 removeItemAtURL:v5 error:&v21];
  id v8 = v21;

  id v9 = v8;
  if (!v8)
  {
    v10 = [v5 path];
    v11 = +[NSString stringWithFormat:@"%@-wal", v10];
    id v20 = 0;
    [v7 removeItemAtPath:v11 error:&v20];
    id v12 = v20;
    if (v12)
    {
      uint64_t v13 = (id)qword_1006AD1A0;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = [v12 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v23 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Failed to remove -wal file with error %@", buf, 0xCu);
      }
    }
    v15 = +[NSString stringWithFormat:@"%@-shm", v10];
    id v19 = v12;
    [v7 removeItemAtPath:v15 error:&v19];
    id v9 = v19;

    if (v9)
    {
      v16 = (id)qword_1006AD1A0;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = [v9 localizedDescription];
        *(_DWORD *)buf = 138412290;
        v23 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Failed to remove -shm file with error %@", buf, 0xCu);
      }
    }
  }
  return v8 == 0;
}

- (int64_t)j2Xe3JZjJDN8Y8xD:(id)a3
{
  id v20 = +[NSFileManager defaultManager];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [&off_1006885C8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    int64_t v5 = 5;
    uint64_t v18 = *(void *)v23;
    while (2)
    {
      id v19 = v4;
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(&off_1006885C8);
        }
        id v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v8 = -[ASCoreDataManager storeNameWithExtensionForStoreWithName:](self, "storeNameWithExtensionForStoreWithName:", v7, v18);
        id v9 = [(NSURL *)self->_coreDataDirectoryURL URLByAppendingPathComponent:v8];
        v10 = [v9 relativePath];
        if ([v20 fileExistsAtPath:v10])
        {
          v11 = +[NSFileHandle fileHandleForReadingAtPath:v10];
          id v21 = 0;
          id v12 = [v11 readDataUpToLength:16 error:&v21];
          id v13 = v21;
          if (v13)
          {
            v15 = (id)qword_1006AD1A0;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              v16 = [v13 localizedDescription];
              sub_10055CB60(v16, buf, v15);
            }

            goto LABEL_20;
          }
          strcpy((char *)buf, "SQLite format 3");
          v14 = +[NSData dataWithBytes:buf length:16];
          if ([v14 isEqualToData:v12])
          {
            if ([v7 isEqualToString:@"Model56902430g"]) {
              int64_t v5 = 3;
            }
            else {
              int64_t v5 = 1;
            }
          }
          else
          {
            int64_t v5 = 2;
          }
        }
      }
      id v4 = [&off_1006885C8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
LABEL_20:
    int64_t v5 = 5;
  }

  return v5;
}

- (id)migrateCoreDataManager
{
  v3 = qword_1006AD1A0;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Migration requirement detected. Performing migration", buf, 2u);
  }
  id v4 = [ASCoreDataManager alloc];
  CFStringRef v31 = @"2BC2E664-199A-4A80-910A-CD19B11354F2";
  id v32 = &off_100688220;
  int64_t v5 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  id v6 = [(ASCoreDataManager *)v4 initWithStore:@"Model56902430g" options:v5];

  id v7 = [(ASCoreDataManager *)self retrieveLegacyRavioliWithCoreDataManager:v6];

  id v8 = [(ASCoreDataManager *)self storeNameWithExtensionForStoreWithName:@"Model56902430g"];
  id v9 = [(NSURL *)self->_coreDataDirectoryURL URLByAppendingPathComponent:v8];
  if (![(ASCoreDataManager *)self removeStoreWithURL:v9 error:0])
  {
    v10 = qword_1006AD1A0;
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
      sub_10055CC20(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  uint64_t v18 = [ASCoreDataManager alloc];
  CFStringRef v29 = @"2BC2E664-199A-4A80-910A-CD19B11354F2";
  uint64_t v30 = &off_100688238;
  id v19 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  id v20 = [(ASCoreDataManager *)v18 initWithStore:@"Model56902430i" options:v19];

  id v21 = [[PJXBDBF1h0EU80dy alloc] initWithCoreDataManager:v20];
  long long v22 = +[RavioliConstants ravioliUUID];
  id v27 = 0;
  [(PJXBDBF1h0EU80dy *)v21 c94QZ147F1UWY71l:v22 jkjlhN0UgO78kW6q:v7 error:&v27];
  id v23 = v27;

  long long v24 = qword_1006AD1A0;
  if (v23)
  {
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
      sub_10055CBB8();
    }
    long long v25 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Restored existing JSON Bags into new store.", buf, 2u);
    }
    long long v25 = v20;
  }

  return v25;
}

- (id)gFJw2BGPtEQWyLz5
{
  v3 = [(ASCoreDataManager *)self xc4PEFTuh2u6xE7M];

  if (v3)
  {
    id v4 = [(ASCoreDataManager *)self xc4PEFTuh2u6xE7M];
    id v5 = [v4 newBackgroundContext];

    [v5 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)npsTCqegVwa7yuzs
{
  if (self->_coreDataDirectoryURL)
  {
    [@"Model56902430" stringByAppendingString:@"i"];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016500;
    block[3] = &unk_10065F048;
    block[4] = self;
    id v6 = @"Model56902430";
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = qword_1006A5D70;
    id v4 = v7;
    if (v3 != -1) {
      dispatch_once(&qword_1006A5D70, block);
    }
  }
}

- (void)mILKmibfRWMwFVWD:(id)a3 iZGmRj7VI4MJ9lO1:(id)a4 AndError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_100016B6C;
  long long v22 = sub_100016B7C;
  id v23 = 0;
  v10 = [(ASCoreDataManager *)self gFJw2BGPtEQWyLz5];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100016B84;
  v13[3] = &unk_10065F070;
  id v14 = v8;
  id v15 = v9;
  id v16 = v10;
  uint64_t v17 = &v18;
  id v11 = v10;
  [v11 performBlockAndWait:v13];

  uint64_t v12 = (void *)v19[5];
  if (v12) {
    *a5 = v12;
  }
  _Block_object_dispose(&v18, 8);
}

- (id)storeNameWithExtensionForStoreWithName:(id)a3
{
  uint64_t v3 = [a3 stringByAppendingString:@".sqlite"];

  return v3;
}

- (NSPersistentContainer)xc4PEFTuh2u6xE7M
{
  return self->_xc4PEFTuh2u6xE7M;
}

- (void)setXc4PEFTuh2u6xE7M:(id)a3
{
}

- (NSManagedObjectModel)ggQex4P6Prvm5Zac
{
  return self->_ggQex4P6Prvm5Zac;
}

- (void)setGgQex4P6Prvm5Zac:(id)a3
{
}

- (NSURL)coreDataDirectoryURL
{
  return self->_coreDataDirectoryURL;
}

- (void)setCoreDataDirectoryURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDataDirectoryURL, 0);
  objc_storeStrong((id *)&self->_ggQex4P6Prvm5Zac, 0);

  objc_storeStrong((id *)&self->_xc4PEFTuh2u6xE7M, 0);
}

- (id)retrieveLegacyRavioliWithCoreDataManager:(id)a3
{
  id v3 = a3;
  id v4 = [v3 gFJw2BGPtEQWyLz5];
  id v5 = +[NSFetchRequest fetchRequestWithEntityName:@"DB_R09283478"];
  [v5 setFetchLimit:1];
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_100019C70;
  v24[4] = sub_100019C80;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_100019C70;
  v22[4] = sub_100019C80;
  id v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100019C70;
  uint64_t v20 = sub_100019C80;
  id v21 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100019C88;
  v10[3] = &unk_10065F0D8;
  uint64_t v13 = v22;
  id v6 = v4;
  id v11 = v6;
  id v7 = v5;
  id v12 = v7;
  id v14 = v24;
  id v15 = &v16;
  [v6 performBlockAndWait:v10];
  id v8 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(v24, 8);

  return v8;
}

- (id)fjcJHNNiQ83H10La
{
  id v14 = (void *)MGCopyAnswer();
  id v16 = [v14 longValue];
  uint64_t v13 = +[NSData dataWithBytes:&v16 length:8];
  v20[0] = kSecClass;
  v20[1] = kSecAttrAccount;
  v21[0] = kSecClassGenericPassword;
  v21[1] = @"asd.uuid.data.a";
  v20[2] = kSecMatchLimit;
  v20[3] = kSecReturnAttributes;
  v21[2] = kSecMatchLimitOne;
  v21[3] = &__kCFBooleanTrue;
  v20[4] = kSecReturnData;
  v20[5] = kSecAttrAccessGroup;
  v21[4] = &__kCFBooleanTrue;
  v21[5] = @"com.apple.asd";
  CFDictionaryRef v2 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:6];
  CFTypeRef result = 0;
  if (!SecItemCopyMatching(v2, &result))
  {
    id v11 = (void *)result;
    id v4 = [(id)result objectForKey:kSecValueData];

    if (v4) {
      goto LABEL_9;
    }
  }
  id v3 = +[NSUUID UUID];
  v19[0] = 0;
  v19[1] = 0;
  [v3 getUUIDBytes:v19];
  id v4 = +[NSData dataWithBytes:v19 length:16];
  v17[0] = kSecClass;
  v17[1] = kSecAttrAccount;
  v18[0] = kSecClassGenericPassword;
  v18[1] = @"asd.uuid.data.a";
  v17[2] = kSecValueData;
  v17[3] = kSecAttrAccessible;
  v18[2] = v4;
  v18[3] = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
  v17[4] = kSecAttrAccessGroup;
  v18[4] = @"com.apple.asd";
  CFDictionaryRef v5 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];
  OSStatus v6 = SecItemAdd(v5, 0);
  if (!v6)
  {

LABEL_9:
    v10 = (void *)v13;
    id v3 = +[NSMutableData dataWithData:v13];
    [v3 appendData:v4];
    id v9 = [v3 copy];
    goto LABEL_10;
  }
  int v7 = v6;
  id v8 = qword_1006AD1A0;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
    sub_10055DDF8(v7, v8);
  }

  id v9 = 0;
  v10 = (void *)v13;
LABEL_10:

  return v9;
}

@end