@interface SSVCookieStorage
+ (BOOL)_bindStatement:(sqlite3_stmt *)a3 withValues:(id)a4;
+ (BOOL)_currentProcessIsRoot;
+ (BOOL)_currentProcessShouldUseRescuedStorageLocationForLocation:(id)a3;
+ (BOOL)_fileIsOwnedByRoot:(id)a3;
+ (BOOL)_fileURLRepresentsSharedStorageLocation:(id)a3;
+ (BOOL)_migrateToVersion1WithDatabase:(id)a3;
+ (BOOL)_migrateToVersion2WithDatabase:(id)a3;
+ (BOOL)_setupCookieDatabase:(id)a3 forCookieStorage:(id)a4;
+ (BOOL)responseHasSetCookies:(id)a3;
+ (id)_getGlobalSetCookiesForResponse:(id)a3;
+ (id)_getSetCookiesForResponse:(id)a3;
+ (id)_getUserSetCookiesForResponse:(id)a3;
+ (id)_rescuedStorageLocationForLocation:(id)a3;
+ (id)_sharedStorageLocationPath;
+ (id)sharedStorage;
- (BOOL)_shouldAddITFECookieToURL:(id)a3;
- (BOOL)_stopIncludingLocalCookies;
- (BOOL)performingMigration;
- (NSURL)storageLocation;
- (SSSQLiteDatabase)_database;
- (SSVCookieStorage)init;
- (SSVCookieStorage)initWithStorageLocation:(id)a3;
- (id)_accountForKey:(id)a3;
- (id)_allCookieKeys;
- (id)_columnNameForCookieProperty:(id)a3;
- (id)_copyCookieDictionaryForURL:(id)a3 key:(id)a4;
- (id)_copyCookieObjectsForURL:(id)a3 key:(id)a4;
- (id)_copyCookiesForPreparedSQLStatement:(sqlite3_stmt *)a3;
- (id)_copyCookiesWithKey:(id)a3;
- (id)_copyPrivateCookieObjectsForURL:(id)a3 key:(id)a4;
- (id)_copyPrivateCookiesForURL:(id)a3 key:(id)a4;
- (id)_filterCookies:(id)a3 forURL:(id)a4;
- (id)allCookiesForAccount:(id)a3;
- (id)allCookiesForUserIdentifier:(id)a3;
- (id)allCookiesForUserIdentifier:(id)a3 scope:(int64_t)a4;
- (id)cookieArrayBySettingFeatureEnablerWithArray:(id)a3 key:(id)a4;
- (id)cookieHeadersForURL:(id)a3 account:(id)a4;
- (id)cookieHeadersForURL:(id)a3 userIdentifier:(id)a4;
- (id)cookieHeadersForURL:(id)a3 userIdentifier:(id)a4 scope:(int64_t)a5;
- (id)cookiesForURL:(id)a3 account:(id)a4;
- (id)cookiesForURL:(id)a3 userIdentifier:(id)a4;
- (id)cookiesForURL:(id)a3 userIdentifier:(id)a4 scope:(int64_t)a5;
- (id)fetchDefaults;
- (void)_bindInsertStatement:(sqlite3_stmt *)a3 forCookie:(id)a4 key:(id)a5;
- (void)_cookieDatabaseDidChange;
- (void)_handleSharedCookieDatabaseDidChangeDarwinNotification;
- (void)_insertCookies:(id)a3 forKey:(id)a4;
- (void)_setCookies:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)removeAllCookies;
- (void)removeCookiesWithAccount:(id)a3;
- (void)removeCookiesWithProperties:(id)a3;
- (void)removeCookiesWithUserIdentifier:(id)a3;
- (void)removeCookiesWithUserIdentifier:(id)a3 scope:(int64_t)a4;
- (void)setCookies:(id)a3 forAccount:(id)a4;
- (void)setCookies:(id)a3 forUserIdentifier:(id)a4;
- (void)setCookiesForHTTPResponse:(id)a3 account:(id)a4;
- (void)setCookiesForHTTPResponse:(id)a3 userIdentifier:(id)a4;
- (void)setCookiesForHTTPResponse:(id)a3 userIdentifier:(id)a4 scope:(int64_t)a5;
- (void)setCookiesFromCookieStorage:(id)a3;
- (void)setFeatureEnablerInDictionary:(id)a3 key:(id)a4;
- (void)setPerformingMigration:(BOOL)a3;
- (void)synchronizeFeatureEnablerCookieWithCookieValue:(id)a3 key:(id)a4 result:(id)a5;
@end

@implementation SSVCookieStorage

- (SSVCookieStorage)init
{
  return [(SSVCookieStorage *)self initWithStorageLocation:0];
}

- (SSVCookieStorage)initWithStorageLocation:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isFileURL] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Storage location must be a file URL"];
  }
  v43.receiver = self;
  v43.super_class = (Class)SSVCookieStorage;
  v5 = [(SSVCookieStorage *)&v43 init];
  if (!v5)
  {
    v6 = v4;
    goto LABEL_33;
  }
  if ([(id)objc_opt_class() _currentProcessShouldUseRescuedStorageLocationForLocation:v4])
  {
    v6 = [(id)objc_opt_class() _rescuedStorageLocationForLocation:v4];

    v7 = +[SSLogConfig sharedConfig];
    int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    v10 = [v7 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      int v11 = v9;
    }
    else {
      int v11 = v9 & 2;
    }
    if (v11)
    {
      int v44 = 138412290;
      v45 = v6;
      LODWORD(v42) = 12;
      v41 = &v44;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
      {
LABEL_15:

        goto LABEL_18;
      }
      v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v12, 4, &v44, v42);
      free(v12);
      SSFileLog(v7, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

    goto LABEL_15;
  }
  v6 = v4;
LABEL_18:
  v5->_performingMigration = 0;
  v19 = objc_msgSend(v6, "absoluteString", v41);
  int v20 = [v19 containsString:@"backup"];

  if (!v20) {
    goto LABEL_31;
  }
  v21 = +[SSLogConfig sharedAccountsCookiesConfig];
  if (!v21)
  {
    v21 = +[SSLogConfig sharedConfig];
  }
  int v22 = [v21 shouldLog];
  if ([v21 shouldLogToDisk]) {
    int v23 = v22 | 2;
  }
  else {
    int v23 = v22;
  }
  v24 = [v21 OSLogObject];
  if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
    v23 &= 2u;
  }
  if (!v23) {
    goto LABEL_29;
  }
  v25 = objc_opt_class();
  int v44 = 138543362;
  v45 = v25;
  id v26 = v25;
  LODWORD(v42) = 12;
  v27 = (void *)_os_log_send_and_compose_impl();

  if (v27)
  {
    v24 = objc_msgSend(NSString, "stringWithCString:encoding:", v27, 4, &v44, v42);
    free(v27);
    SSFileLog(v21, @"%@", v28, v29, v30, v31, v32, v33, (uint64_t)v24);
LABEL_29:
  }
  v5->_performingMigration = 1;
LABEL_31:
  dispatch_queue_t v34 = dispatch_queue_create("com.apple.StoreServices.SSVCookieStorage", 0);
  dispatchQueue = v5->_dispatchQueue;
  v5->_dispatchQueue = (OS_dispatch_queue *)v34;

  uint64_t v36 = [v6 copy];
  storageLocation = v5->_storageLocation;
  v5->_storageLocation = (NSURL *)v36;

  int v38 = [(id)objc_opt_class() _fileURLRepresentsSharedStorageLocation:v5->_storageLocation];
  v5->_usesSharedCookieDatabase = v38;
  if (v38)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_SSVCookieStorageHandleSharedCookieDatabaseDidChangeDarwinNotification, @"SSVCookieStorageSharedCookieDatabaseDidChangeDarwinNotification", 0, (CFNotificationSuspensionBehavior)1028);
  }
LABEL_33:

  return v5;
}

- (void)dealloc
{
  if (self->_usesSharedCookieDatabase)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SSVCookieStorageSharedCookieDatabaseDidChangeDarwinNotification", 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)SSVCookieStorage;
  [(SSVCookieStorage *)&v4 dealloc];
}

+ (id)sharedStorage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SSVCookieStorage_sharedStorage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedStorage_sOnce != -1) {
    dispatch_once(&sharedStorage_sOnce, block);
  }
  v2 = (void *)sharedStorage_sSharedStorage;
  return v2;
}

void __33__SSVCookieStorage_sharedStorage__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) _sharedStorageLocationPath];
  if (v1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    v3 = [v1 stringByDeletingLastPathComponent];
    [v2 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];

    id v4 = objc_alloc((Class)objc_opt_class());
    v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v1];
    uint64_t v6 = [v4 initWithStorageLocation:v5];
    v7 = (void *)sharedStorage_sSharedStorage;
    sharedStorage_sSharedStorage = v6;
  }
  else
  {
    id v2 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v2)
    {
      id v2 = +[SSLogConfig sharedConfig];
    }
    int v8 = [v2 shouldLog];
    if ([v2 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    v5 = [v2 OSLogObject];
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      LODWORD(v19) = 138412290;
      *(void *)((char *)&v19 + 4) = objc_opt_class();
      id v10 = *(id *)((char *)&v19 + 4);
      LODWORD(v18) = 12;
      int v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11) {
        goto LABEL_4;
      }
      v5 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v19, v18, v19);
      free(v11);
      SSFileLog(v2, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v5);
    }
  }

LABEL_4:
}

- (id)allCookiesForAccount:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 accountScope];
  }
  else {
    uint64_t v6 = 0;
  }
  v7 = [v5 uniqueIdentifier];
  int v8 = [(SSVCookieStorage *)self allCookiesForUserIdentifier:v7 scope:v6];

  return v8;
}

- (id)allCookiesForUserIdentifier:(id)a3
{
  return [(SSVCookieStorage *)self allCookiesForUserIdentifier:a3 scope:0];
}

- (id)allCookiesForUserIdentifier:(id)a3 scope:(int64_t)a4
{
  v5 = +[SSVCookieKey keyWithIdentifier:a3 scope:a4];
  id v6 = [(SSVCookieStorage *)self _copyCookiesWithKey:v5];
  v7 = [(SSVCookieStorage *)self cookieArrayBySettingFeatureEnablerWithArray:v6 key:v5];

  return v7;
}

- (id)cookieHeadersForURL:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v7) {
    uint64_t v9 = [v7 accountScope];
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = [v8 uniqueIdentifier];
  int v11 = [(SSVCookieStorage *)self cookieHeadersForURL:v6 userIdentifier:v10 scope:v9];

  return v11;
}

- (id)cookieHeadersForURL:(id)a3 userIdentifier:(id)a4
{
  return [(SSVCookieStorage *)self cookieHeadersForURL:a3 userIdentifier:a4 scope:0];
}

- (id)cookieHeadersForURL:(id)a3 userIdentifier:(id)a4 scope:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[SSVCookieKey keyWithIdentifier:v9 scope:a5];
  id v11 = [(SSVCookieStorage *)self _copyCookieDictionaryForURL:v8 key:v10];
  if ([(SSVCookieStorage *)self _shouldAddITFECookieToURL:v8]) {
    [(SSVCookieStorage *)self setFeatureEnablerInDictionary:v11 key:v10];
  }
  if ([v11 count])
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v22[3] = 0;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __61__SSVCookieStorage_cookieHeadersForURL_userIdentifier_scope___block_invoke;
    long long v19 = &unk_1E5BAA870;
    v21 = v22;
    id v13 = v12;
    id v20 = v13;
    [v11 enumerateKeysAndObjectsUsingBlock:&v16];
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v13, @"Cookie", 0, v16, v17, v18, v19);

    _Block_object_dispose(v22, 8);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

void __61__SSVCookieStorage_cookieHeadersForURL_userIdentifier_scope___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 1) {
    [*(id *)(a1 + 32) appendString:@"; "];
  }
  [*(id *)(a1 + 32) appendString:v6];
  [*(id *)(a1 + 32) appendString:@"="];
  [*(id *)(a1 + 32) appendString:v5];
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (id)cookiesForURL:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7) {
    uint64_t v9 = [v7 accountScope];
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = [v8 uniqueIdentifier];
  id v11 = [(SSVCookieStorage *)self cookiesForURL:v6 userIdentifier:v10 scope:v9];

  return v11;
}

- (id)cookiesForURL:(id)a3 userIdentifier:(id)a4
{
  return [(SSVCookieStorage *)self cookiesForURL:a3 userIdentifier:a4 scope:0];
}

- (id)cookiesForURL:(id)a3 userIdentifier:(id)a4 scope:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = +[SSVCookieKey keyWithIdentifier:a4 scope:a5];
  id v10 = [(SSVCookieStorage *)self _copyCookieObjectsForURL:v8 key:v9];
  BOOL v11 = [(SSVCookieStorage *)self _shouldAddITFECookieToURL:v8];

  if (v11)
  {
    uint64_t v12 = [(SSVCookieStorage *)self cookieArrayBySettingFeatureEnablerWithArray:v10 key:v9];

    id v10 = (id)v12;
  }

  return v10;
}

- (void)removeAllCookies
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F4DC40] useNewCookieStorage]
    && ![(SSVCookieStorage *)self performingMigration])
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = objc_msgSend(v4, "ams_iTunesAccounts");
    v33[0] = v5;
    id v6 = objc_msgSend(v4, "ams_iTunesSandboxAccounts");
    v33[1] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v7);
          }
          BOOL v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v25 != v14) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * j);
                objc_msgSend(v16, "ams_removeAllCookies");
                if ([v16 isDirty]) {
                  id v17 = (id)objc_msgSend(v4, "ams_saveAccount:verifyCredentials:", v16, 0);
                }
              }
              uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v13);
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v8);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    v3 = [(SSVCookieStorage *)self _database];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    id v20 = __36__SSVCookieStorage_removeAllCookies__block_invoke;
    v21 = &unk_1E5BABEE8;
    objc_copyWeak(&v22, &location);
    [v3 prepareStatementForSQL:@"DELETE FROM cookies" cache:0 usingBlock:&v18];

    [(SSVCookieStorage *)self _cookieDatabaseDidChange];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

void __36__SSVCookieStorage_removeAllCookies__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained _database];
  [v3 statementHasRowAfterStepping:a2];
}

- (void)removeCookiesWithProperties:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  if ([MEMORY[0x1E4F4DC40] useNewCookieStorage]
    && ![(SSVCookieStorage *)self performingMigration])
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    objc_msgSend(v16, "ams_removeCookiesMatchingProperties:error:", v17, 0);
  }
  else
  {
    uint64_t v29 = 0;
    long long v30 = &v29;
    uint64_t v31 = 0x2020000000;
    char v32 = 1;
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v4 = v17;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v26 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v9 = [(SSVCookieStorage *)self _columnNameForCookieProperty:v8];
          if (v9)
          {
            id v10 = [NSString stringWithFormat:@"(%@=?)", v9];
            [v19 addObject:v10];

            BOOL v11 = [v4 objectForKey:v8];
            [v18 addObject:v11];
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v5);
    }

    if ([v19 count])
    {
      id v12 = [NSString alloc];
      uint64_t v13 = [v19 componentsJoinedByString:@" AND "];
      uint64_t v14 = (void *)[v12 initWithFormat:@"DELETE FROM cookies WHERE %@", v13];

      objc_initWeak(&location, self);
      uint64_t v15 = [(SSVCookieStorage *)self _database];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __48__SSVCookieStorage_removeCookiesWithProperties___block_invoke;
      v20[3] = &unk_1E5BABF10;
      objc_copyWeak(&v23, &location);
      id v22 = &v29;
      id v21 = v18;
      [v15 prepareStatementForSQL:v14 cache:0 usingBlock:v20];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
    [(SSVCookieStorage *)self _cookieDatabaseDidChange];
    if (!*((unsigned char *)v30 + 24)) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid property value(s)"];
    }

    _Block_object_dispose(&v29, 8);
  }
}

void __48__SSVCookieStorage_removeCookiesWithProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [(id)objc_opt_class() _bindStatement:a2 withValues:*(void *)(a1 + 32)];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    do
    {
      id v4 = [WeakRetained _database];
      char v5 = [v4 statementHasRowAfterStepping:a2];
    }
    while ((v5 & 1) != 0);
  }
}

- (void)removeCookiesWithAccount:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    uint64_t v5 = [v4 accountScope];
    id v4 = v7;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [v4 uniqueIdentifier];
  [(SSVCookieStorage *)self removeCookiesWithUserIdentifier:v6 scope:v5];
}

- (void)removeCookiesWithUserIdentifier:(id)a3
{
}

- (void)removeCookiesWithUserIdentifier:(id)a3 scope:(int64_t)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    if ([MEMORY[0x1E4F4DC40] useNewCookieStorage]
      && ![(SSVCookieStorage *)self performingMigration])
    {
      id v22 = +[SSVCookieKey keyWithIdentifier:v6 scope:a4];
      id v23 = [(SSVCookieStorage *)self _accountForKey:v22];
      long long v24 = v23;
      if (v23)
      {
        objc_msgSend(v23, "ams_removeAllCookies");
        if ([v24 isDirty])
        {
          long long v25 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
          id v26 = (id)objc_msgSend(v25, "ams_saveAccount:verifyCredentials:", v24, 0);
        }
      }
    }
    else
    {
      id v7 = [NSString stringWithFormat:@"DELETE FROM cookies WHERE user=? AND user_scope=?"];
      objc_initWeak(location, self);
      uint64_t v8 = [(SSVCookieStorage *)self _database];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __58__SSVCookieStorage_removeCookiesWithUserIdentifier_scope___block_invoke;
      v28[3] = &unk_1E5BABF38;
      objc_copyWeak(v30, location);
      id v29 = v6;
      v30[1] = (id)a4;
      [v8 prepareStatementForSQL:v7 cache:0 usingBlock:v28];

      [(SSVCookieStorage *)self _cookieDatabaseDidChange];
      objc_destroyWeak(v30);
      objc_destroyWeak(location);
    }
  }
  else
  {
    uint64_t v9 = +[SSLogConfig sharedAccountsCookiesConfig];
    if (!v9)
    {
      uint64_t v9 = +[SSLogConfig sharedConfig];
    }
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    id v12 = [v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      v11 &= 2u;
    }
    if (v11)
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_opt_class();
      id v13 = *(id *)((char *)location + 4);
      LODWORD(v27) = 12;
      uint64_t v14 = (void *)_os_log_send_and_compose_impl();

      if (v14)
      {
        uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, location, v27);
        free(v14);
        SSFileLog(v9, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
      }
    }
    else
    {
    }
  }
}

void __58__SSVCookieStorage_removeCookiesWithUserIdentifier_scope___block_invoke(uint64_t a1, uint64_t a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = objc_opt_class();
  v10[0] = *(void *)(a1 + 32);
  id v6 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  [v5 _bindStatement:a2 withValues:v7];

  do
  {
    uint64_t v8 = [WeakRetained _database];
    char v9 = [v8 statementHasRowAfterStepping:a2];
  }
  while ((v9 & 1) != 0);
}

+ (BOOL)responseHasSetCookies:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _getSetCookiesForResponse:v4];
  if ([v5 count])
  {
    BOOL v6 = 1;
  }
  else
  {
    id v7 = [a1 _getUserSetCookiesForResponse:v4];

    if ([v7 count])
    {
      BOOL v6 = 1;
      uint64_t v5 = v7;
    }
    else
    {
      uint64_t v5 = [a1 _getGlobalSetCookiesForResponse:v4];

      BOOL v6 = [v5 count] != 0;
    }
  }

  return v6;
}

- (void)setCookies:(id)a3 forAccount:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6) {
    uint64_t v8 = [v6 accountScope];
  }
  else {
    uint64_t v8 = 0;
  }
  char v9 = [v7 uniqueIdentifier];
  int v10 = +[SSVCookieKey keyWithIdentifier:v9 scope:v8];

  [(SSVCookieStorage *)self _setCookies:v11 forKey:v10];
}

- (void)setCookies:(id)a3 forUserIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = +[SSVCookieKey keyWithIdentifier:a4 scope:0];
  [(SSVCookieStorage *)self _setCookies:v6 forKey:v7];
}

- (void)setCookiesForHTTPResponse:(id)a3 account:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6) {
    uint64_t v8 = [v6 accountScope];
  }
  else {
    uint64_t v8 = 0;
  }
  char v9 = [v7 uniqueIdentifier];
  [(SSVCookieStorage *)self setCookiesForHTTPResponse:v10 userIdentifier:v9 scope:v8];
}

- (void)setCookiesForHTTPResponse:(id)a3 userIdentifier:(id)a4
{
}

- (void)setCookiesForHTTPResponse:(id)a3 userIdentifier:(id)a4 scope:(int64_t)a5
{
  id v15 = a3;
  id v8 = a4;
  char v9 = [(id)objc_opt_class() _getSetCookiesForResponse:v15];
  if ([v9 count])
  {
    id v10 = +[SSVCookieKey keyWithIdentifier:v8 scope:a5];
    [(SSVCookieStorage *)self _setCookies:v9 forKey:v10];
  }
  id v11 = [(id)objc_opt_class() _getUserSetCookiesForResponse:v15];

  if ([v11 count])
  {
    id v12 = +[SSVCookieKey keyWithIdentifier:v8 scope:a5];
    [(SSVCookieStorage *)self _setCookies:v11 forKey:v12];
  }
  id v13 = [(id)objc_opt_class() _getGlobalSetCookiesForResponse:v15];

  if ([v13 count])
  {
    uint64_t v14 = +[SSVCookieKey keyWithIdentifier:&unk_1EF9A9888 scope:a5];
    [(SSVCookieStorage *)self _setCookies:v13 forKey:v14];
  }
}

- (void)setCookiesFromCookieStorage:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [v4 _database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__SSVCookieStorage_setCookiesFromCookieStorage___block_invoke;
  v15[3] = &unk_1E5BABF60;
  id v7 = v4;
  id v16 = v7;
  id v8 = v5;
  id v17 = v8;
  [v6 performTransactionWithBlock:v15];

  objc_initWeak(&location, self);
  char v9 = [(SSVCookieStorage *)self _database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__SSVCookieStorage_setCookiesFromCookieStorage___block_invoke_2;
  v11[3] = &unk_1E5BABFB0;
  objc_copyWeak(&v13, &location);
  id v10 = v8;
  id v12 = v10;
  [v9 performTransactionWithBlock:v11];

  [(SSVCookieStorage *)self _cookieDatabaseDidChange];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

uint64_t __48__SSVCookieStorage_setCookiesFromCookieStorage___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) _allCookieKeys];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        id v8 = (void *)[*(id *)(a1 + 32) _copyCookiesWithKey:v7];
        if (v8) {
          [*(id *)(a1 + 40) setObject:v8 forKey:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return 1;
}

uint64_t __48__SSVCookieStorage_setCookiesFromCookieStorage___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__SSVCookieStorage_setCookiesFromCookieStorage___block_invoke_3;
  v5[3] = &unk_1E5BABF88;
  v5[4] = WeakRetained;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];

  return 1;
}

uint64_t __48__SSVCookieStorage_setCookiesFromCookieStorage___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _insertCookies:a3 forKey:a2];
}

- (NSURL)storageLocation
{
  return self->_storageLocation;
}

- (void)_handleSharedCookieDatabaseDidChangeDarwinNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"SSVCookieStorageSharedCookiesDidChangeNotification" object:self];
}

- (void)setFeatureEnablerInDictionary:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"itfe"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__SSVCookieStorage_setFeatureEnablerInDictionary_key___block_invoke;
  v11[3] = &unk_1E5BABFD8;
  id v12 = v8;
  id v13 = v6;
  id v9 = v6;
  id v10 = v8;
  [(SSVCookieStorage *)self synchronizeFeatureEnablerCookieWithCookieValue:v10 key:v7 result:v11];
}

void __54__SSVCookieStorage_setFeatureEnablerInDictionary_key___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    if (v5 || !*(void *)(a1 + 32))
    {
      if (!v5) {
        goto LABEL_8;
      }
      id v7 = v5;
      id v6 = [v5 value];
      [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:@"itfe"];
    }
    else
    {
      id v7 = 0;
      [*(id *)(a1 + 40) removeObjectForKey:@"itfe"];
    }
    id v5 = v7;
  }
LABEL_8:
}

- (id)cookieArrayBySettingFeatureEnablerWithArray:(id)a3 key:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = (id)[a3 mutableCopy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    long long v24 = self;
    id v25 = v6;
    uint64_t v10 = *(void *)v31;
    uint64_t v11 = -1;
    while (2)
    {
      uint64_t v12 = 0;
      uint64_t v13 = v11 + v9;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * v12);
        uint64_t v15 = [v14 name];
        int v16 = [v15 isEqualToString:@"itfe"];

        if (v16)
        {
          id v17 = v14;
          uint64_t v13 = v11 + v12 + 1;
          goto LABEL_11;
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v11 = v13;
      if (v9) {
        continue;
      }
      break;
    }
    id v17 = 0;
LABEL_11:
    self = v24;
    id v6 = v25;
  }
  else
  {
    id v17 = 0;
    uint64_t v13 = -1;
  }

  uint64_t v18 = [v17 value];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __68__SSVCookieStorage_cookieArrayBySettingFeatureEnablerWithArray_key___block_invoke;
  v26[3] = &unk_1E5BAC000;
  id v27 = v17;
  id v19 = v7;
  id v28 = v19;
  uint64_t v29 = v13;
  id v20 = v17;
  [(SSVCookieStorage *)self synchronizeFeatureEnablerCookieWithCookieValue:v18 key:v6 result:v26];

  uint64_t v21 = v28;
  id v22 = v19;

  return v22;
}

void __68__SSVCookieStorage_cookieArrayBySettingFeatureEnablerWithArray_key___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v5 || !v7)
    {
      if (!v5) {
        goto LABEL_10;
      }
      uint64_t v8 = *(void **)(a1 + 40);
      uint64_t v9 = v6;
      if (v7) {
        [v8 setObject:v6 atIndexedSubscript:*(void *)(a1 + 48)];
      }
      else {
        [v8 addObject:v6];
      }
    }
    else
    {
      uint64_t v9 = 0;
      [*(id *)(a1 + 40) removeObjectAtIndex:*(void *)(a1 + 48)];
    }
    id v6 = v9;
  }
LABEL_10:
}

- (BOOL)_shouldAddITFECookieToURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 host];
  id v5 = v4;
  if (v4 && ([v4 hasPrefix:@"."] & 1) == 0)
  {
    uint64_t v6 = [@"." stringByAppendingString:v5];

    id v5 = (void *)v6;
  }
  uint64_t v7 = [v3 scheme];
  char v8 = [v7 isEqualToString:@"https"];

  LOBYTE(v7) = v8 & [v5 hasSuffix:@".apple.com"];
  return (char)v7;
}

- (void)synchronizeFeatureEnablerCookieWithCookieValue:(id)a3 key:(id)a4 result:(id)a5
{
  v89[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void *))a5;
  uint64_t v11 = [(SSVCookieStorage *)self fetchDefaults];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __78__SSVCookieStorage_synchronizeFeatureEnablerCookieWithCookieValue_key_result___block_invoke;
  v78[3] = &unk_1E5BA7248;
  id v13 = v12;
  id v79 = v13;
  [v11 enumerateKeysAndObjectsUsingBlock:v78];
  if (MGGetBoolAnswer())
  {
    uint64_t v14 = [v13 count];
    if (!v8 || v14)
    {
      if ([v13 count])
      {
        id v73 = v9;
        long long v31 = [v8 componentsSeparatedByString:@"+"];
        uint64_t v32 = [v13 count];
        v70 = v31;
        if (v32 != [v31 count]) {
          goto LABEL_28;
        }
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v33 = v31;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v74 objects:v87 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          v68 = v10;
          id v71 = v8;
          char v36 = 0;
          uint64_t v37 = *(void *)v75;
          do
          {
            for (uint64_t i = 0; i != v35; ++i)
            {
              if (*(void *)v75 != v37) {
                objc_enumerationMutation(v33);
              }
              v39 = [v11 objectForKeyedSubscript:*(void *)(*((void *)&v74 + 1) + 8 * i)];
              char v40 = [v39 BOOLValue];

              v36 |= v40 ^ 1;
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v74 objects:v87 count:16];
          }
          while (v35);

          id v8 = v71;
          uint64_t v10 = v68;
          if (v36)
          {
LABEL_28:
            v69 = [v13 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
            uint64_t v41 = [v69 componentsJoinedByString:@"+"];
            id v42 = objc_alloc(MEMORY[0x1E4F28D10]);
            uint64_t v43 = *MEMORY[0x1E4F28400];
            v85[0] = *MEMORY[0x1E4F28418];
            v85[1] = v43;
            v86[0] = @"itfe";
            v86[1] = @".apple.com";
            uint64_t v44 = *MEMORY[0x1E4F28448];
            v85[2] = *MEMORY[0x1E4F28428];
            v85[3] = v44;
            v86[2] = @"/";
            v86[3] = v41;
            v72 = (void *)v41;
            v86[4] = MEMORY[0x1E4F1CC38];
            uint64_t v45 = *MEMORY[0x1E4F28408];
            v85[4] = *MEMORY[0x1E4F28440];
            v85[5] = v45;
            uint64_t v46 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:31536000.0];
            v86[5] = v46;
            v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:6];
            uint64_t v48 = [v42 initWithProperties:v47];

            v67 = (void *)v48;
            uint64_t v84 = v48;
            v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
            id v9 = v73;
            [(SSVCookieStorage *)self _setCookies:v49 forKey:v73];

            v50 = +[SSLogConfig sharedStoreServicesConfig];
            if (!v50)
            {
              v50 = +[SSLogConfig sharedConfig];
            }
            int v51 = [v50 shouldLog];
            if ([v50 shouldLogToDisk]) {
              int v52 = v51 | 2;
            }
            else {
              int v52 = v51;
            }
            v53 = [v50 OSLogObject];
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG)) {
              int v54 = v52;
            }
            else {
              int v54 = v52 & 2;
            }
            if (v54)
            {
              v55 = objc_opt_class();
              int v80 = 138412546;
              v81 = v55;
              __int16 v82 = 2112;
              v83 = v72;
              id v56 = v8;
              id v57 = v55;
              LODWORD(v66) = 22;
              v58 = (void *)_os_log_send_and_compose_impl();

              id v8 = v56;
              v59 = v70;
              if (!v58)
              {
LABEL_41:

                v10[2](v10, 1, v67);
                goto LABEL_17;
              }
              v53 = objc_msgSend(NSString, "stringWithCString:encoding:", v58, 4, &v80, v66);
              free(v58);
              SSFileLog(v50, @"%@", v60, v61, v62, v63, v64, v65, (uint64_t)v53);
            }
            else
            {
              v59 = v70;
            }

            goto LABEL_41;
          }
        }
        else
        {
        }
        id v9 = v73;
      }
      v10[2](v10, 0, 0);
      goto LABEL_17;
    }
  }
  uint64_t v88 = *MEMORY[0x1E4F28418];
  v89[0] = @"itfe";
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:&v88 count:1];
  [(SSVCookieStorage *)self removeCookiesWithProperties:v15];

  int v16 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v16)
  {
    int v16 = +[SSLogConfig sharedConfig];
  }
  int v17 = [v16 shouldLog];
  if ([v16 shouldLogToDisk]) {
    int v18 = v17 | 2;
  }
  else {
    int v18 = v17;
  }
  id v19 = [v16 OSLogObject];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    int v20 = v18;
  }
  else {
    int v20 = v18 & 2;
  }
  if (!v20) {
    goto LABEL_15;
  }
  uint64_t v21 = objc_opt_class();
  int v80 = 138412290;
  v81 = v21;
  id v22 = v8;
  id v23 = v21;
  LODWORD(v66) = 12;
  long long v24 = (void *)_os_log_send_and_compose_impl();

  id v8 = v22;
  if (v24)
  {
    id v19 = objc_msgSend(NSString, "stringWithCString:encoding:", v24, 4, &v80, v66);
    free(v24);
    SSFileLog(v16, @"%@", v25, v26, v27, v28, v29, v30, (uint64_t)v19);
LABEL_15:
  }
  v10[2](v10, 1, 0);
LABEL_17:
}

void __78__SSVCookieStorage_synchronizeFeatureEnablerCookieWithCookieValue_key_result___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v5 BOOLValue]) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

- (id)fetchDefaults
{
  CFPreferencesAppSynchronize(@"com.apple.storeservices.itfe");
  id v2 = (id)CFPreferencesCopyAppValue(@"features", @"com.apple.storeservices.itfe");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (void *)CFPreferencesCopyAppValue(@"additionalFeatures", @"com.apple.storeservices.itfe");
    if (v3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v4 = (void *)[v2 mutableCopy];
        [v4 addEntriesFromDictionary:v3];

        id v2 = v4;
      }
    }
    id v2 = v2;

    id v5 = v2;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_accountForKey:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 scope];
  id v5 = (void *)MEMORY[0x1E4F4D9E8];
  if (v4) {
    id v5 = (void *)MEMORY[0x1E4F4D9F0];
  }
  id v6 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStoreForMediaType:", *v5);
  uint64_t v7 = [v3 identifier];
  if (v7
    && (id v8 = (void *)v7,
        [v3 identifier],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 isEqualToNumber:&unk_1EF9A9888],
        v9,
        v8,
        !v10))
  {
    id v12 = [v3 identifier];
    uint64_t v11 = objc_msgSend(v6, "ams_iTunesAccountWithDSID:", v12);
  }
  else
  {
    uint64_t v11 = objc_msgSend(v6, "ams_localiTunesAccount");
  }

  return v11;
}

- (id)_allCookieKeys
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F4DC40] useNewCookieStorage]
    && ![(SSVCookieStorage *)self performingMigration])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v19 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    long long v32 = 0u;
    long long v33 = 0u;
    long long v31 = 0u;
    long long v30 = 0u;
    uint64_t v7 = objc_msgSend(v19, "ams_iTunesAccounts");
    v35[0] = v7;
    id v8 = objc_msgSend(v19, "ams_iTunesSandboxAccounts");
    v35[1] = v8;
    obuint64_t j = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];

    uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v9)
    {
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v27 != v14) {
                  objc_enumerationMutation(v12);
                }
                int v16 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                int v17 = objc_msgSend(v16, "ams_DSID");
                if (v17)
                {
                  int v18 = +[SSVCookieKey keyWithIdentifier:scope:](SSVCookieKey, "keyWithIdentifier:scope:", v17, objc_msgSend(v16, "ams_isSandboxAccount"));
                  [v5 addObject:v18];
                }
              }
              uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v13);
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CA48] array];
    objc_initWeak(&location, self);
    uint64_t v4 = [(SSVCookieStorage *)self _database];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __34__SSVCookieStorage__allCookieKeys__block_invoke;
    v22[3] = &unk_1E5BAC028;
    objc_copyWeak(&v24, &location);
    id v5 = v3;
    id v23 = v5;
    objc_msgSend(v4, "prepareStatementForSQL:cache:usingBlock:", @"SELECT DISTINCT user, user_scope FROM cookies;",
      0,
      v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __34__SSVCookieStorage__allCookieKeys__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained _database];
  int v5 = [v4 statementHasRowAfterStepping:a2];

  if (v5)
  {
    do
    {
      id v6 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a2, 0);
      uint64_t v7 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a2, 1);
      id v8 = v7;
      if (v6 && v7)
      {
        uint64_t v9 = +[SSVCookieKey keyWithIdentifier:scope:](SSVCookieKey, "keyWithIdentifier:scope:", v6, [v7 integerValue]);
        [*(id *)(a1 + 32) addObject:v9];
      }
      int v10 = [WeakRetained _database];
      char v11 = [v10 statementHasRowAfterStepping:a2];
    }
    while ((v11 & 1) != 0);
  }
}

- (void)_bindInsertStatement:(sqlite3_stmt *)a3 forCookie:(id)a4 key:(id)a5
{
  id v16 = a4;
  id v7 = a5;
  sqlite3_bind_int(a3, 1, [v16 isSessionOnly]);
  id v8 = [v16 domain];
  sqlite3_bind_text(a3, 2, (const char *)[v8 UTF8String], -1, 0);

  uint64_t v9 = [v16 expiresDate];
  [v9 timeIntervalSinceReferenceDate];
  sqlite3_bind_int(a3, 3, (int)v10);

  id v11 = [v16 name];
  sqlite3_bind_text(a3, 4, (const char *)[v11 UTF8String], -1, 0);

  id v12 = [v16 path];
  sqlite3_bind_text(a3, 5, (const char *)[v12 UTF8String], -1, 0);

  sqlite3_bind_int(a3, 6, [v16 isSecure]);
  uint64_t v13 = [v7 identifier];
  if (v13)
  {
    uint64_t v14 = [v7 identifier];
    sqlite3_bind_int64(a3, 7, [v14 longLongValue]);
  }
  else
  {
    sqlite3_bind_int64(a3, 7, 0);
  }

  sqlite3_bind_int(a3, 8, [v7 scope]);
  id v15 = [v16 value];
  sqlite3_bind_text(a3, 9, (const char *)[v15 UTF8String], -1, 0);

  sqlite3_bind_int(a3, 10, [v16 version]);
}

+ (BOOL)_bindStatement:(sqlite3_stmt *)a3 withValues:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    int v9 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          sqlite3_bind_text(a3, v9 + i, (const char *)[v11 UTF8String], -1, 0);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            sqlite3_bind_int(a3, v9 + i, [v11 intValue]);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              BOOL v13 = 0;
              goto LABEL_16;
            }
            objc_msgSend(v11, "timeIntervalSinceReferenceDate", (void)v15);
            sqlite3_bind_double(a3, v9 + i, v12);
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      v9 += i;
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_16:

  return v13;
}

- (id)_columnNameForCookieProperty:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v11[0] = xmmword_1E5BAC048;
  v11[1] = *(_OWORD *)&off_1E5BAC058;
  v11[2] = xmmword_1E5BAC068;
  double v12 = @"version";
  v10[0] = (id)*MEMORY[0x1E4F283F8];
  v10[1] = (id)*MEMORY[0x1E4F28400];
  v10[2] = (id)*MEMORY[0x1E4F28418];
  void v10[3] = (id)*MEMORY[0x1E4F28428];
  v10[4] = (id)*MEMORY[0x1E4F28440];
  v10[5] = (id)*MEMORY[0x1E4F28448];
  uint64_t v4 = 0;
  v10[6] = (id)*MEMORY[0x1E4F28450];
  while (![a3 isEqualToString:v10[v4]])
  {
    if (++v4 == 7)
    {
      id v5 = 0;
      goto LABEL_6;
    }
  }
  id v5 = *(id *)((char *)v11 + v4 * 8);
LABEL_6:
  id v6 = v5;
  for (uint64_t i = 6; i != -1; --i)

  for (uint64_t j = 48; j != -8; j -= 8)
  return v6;
}

- (void)_cookieDatabaseDidChange
{
  if (self->_usesSharedCookieDatabase)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SSVCookieStorageSharedCookieDatabaseDidChangeDarwinNotification", 0, 0, 1u);
  }
}

- (id)_copyCookieDictionaryForURL:(id)a3 key:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 host];
  if (v8)
  {
    id v22 = v7;
    id v9 = [(SSVCookieStorage *)self _copyPrivateCookiesForURL:v6 key:v7];
    double v10 = [MEMORY[0x1E4F28D18] sharedHTTPCookieStorage];
    id v11 = [v10 cookiesForURL:v6];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          long long v18 = [v17 name];
          id v19 = [v9 objectForKey:v18];

          if (!v19)
          {
            uint64_t v20 = [v17 value];
            [v9 setObject:v20 forKey:v18];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    id v7 = v22;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_copyCookieObjectsForURL:(id)a3 key:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 host];
  if (v8)
  {
    long long v31 = v8;
    id v32 = v7;
    id v9 = [(SSVCookieStorage *)self _copyPrivateCookieObjectsForURL:v6 key:v7];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          long long v17 = [v16 name];
          [v10 setObject:v16 forKey:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v13);
    }

    long long v18 = [MEMORY[0x1E4F28D18] sharedHTTPCookieStorage];
    id v19 = [v18 cookiesForURL:v6];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v20 = v19;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(v20);
          }
          long long v25 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          long long v26 = [v25 name];
          long long v27 = [v10 objectForKey:v26];

          if (!v27) {
            [v10 setObject:v25 forKey:v26];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v22);
    }

    uint64_t v28 = [v10 allValues];
    long long v29 = (void *)[v28 copy];

    uint64_t v8 = v31;
    id v7 = v32;
  }
  else
  {
    long long v29 = 0;
  }

  return v29;
}

- (id)_copyCookiesForPreparedSQLStatement:(sqlite3_stmt *)a3
{
  v33[4] = *MEMORY[0x1E4F143B8];
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v28 = self;
  id v5 = [(SSVCookieStorage *)self _database];
  int v6 = [v5 statementHasRowAfterStepping:a3];

  if (v6)
  {
    uint64_t v25 = *MEMORY[0x1E4F283F8];
    uint64_t v24 = *MEMORY[0x1E4F28440];
    uint64_t v27 = *MEMORY[0x1E4F28450];
    uint64_t v23 = *MEMORY[0x1E4F28408];
    uint64_t v7 = *MEMORY[0x1E4F28400];
    uint64_t v8 = *MEMORY[0x1E4F28418];
    uint64_t v9 = *MEMORY[0x1E4F28428];
    uint64_t v10 = *MEMORY[0x1E4F28448];
    do
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (sqlite3_column_int(a3, 0)) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKey:v25];
      }
      if (sqlite3_column_int(a3, 5)) {
        [v11 setObject:MEMORY[0x1E4F1CC38] forKey:v24];
      }
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(a3, 7));
      [v11 setObject:v12 forKey:v27];

      uint64_t v13 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a3, 2);
      uint64_t v14 = v13;
      if (v13)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4F1C9C8];
        [v13 doubleValue];
        long long v16 = objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
        [v11 setObject:v16 forKey:v23];
      }
      v32[0] = v7;
      v32[1] = v8;
      v33[0] = &unk_1EF9A98A0;
      v33[1] = &unk_1EF9A98B8;
      v32[2] = v9;
      v32[3] = v10;
      void v33[2] = &unk_1EF9A98D0;
      v33[3] = &unk_1EF9A98E8;
      long long v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v33, v32, 4, v23);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __56__SSVCookieStorage__copyCookiesForPreparedSQLStatement___block_invoke;
      v29[3] = &unk_1E5BAC088;
      long long v31 = a3;
      id v18 = v11;
      id v30 = v18;
      [v17 enumerateKeysAndObjectsUsingBlock:v29];
      id v19 = (void *)[objc_alloc(MEMORY[0x1E4F28D10]) initWithProperties:v18];
      if (v19) {
        [v26 addObject:v19];
      }

      id v20 = [(SSVCookieStorage *)v28 _database];
      char v21 = [v20 statementHasRowAfterStepping:a3];
    }
    while ((v21 & 1) != 0);
  }
  return v26;
}

void __56__SSVCookieStorage__copyCookiesForPreparedSQLStatement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(*(sqlite3_stmt **)(a1 + 40), [a3 intValue]);
  if (v5) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

- (id)_copyCookiesWithKey:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F4DC40] useNewCookieStorage]
    && ![(SSVCookieStorage *)self performingMigration])
  {
    uint64_t v14 = [(SSVCookieStorage *)self _accountForKey:v4];
    objc_msgSend(v14, "ams_cookies");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__42;
    uint64_t v28 = __Block_byref_object_dispose__42;
    id v29 = 0;
    objc_initWeak(&location, self);
    id v5 = [(SSVCookieStorage *)self _database];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __40__SSVCookieStorage__copyCookiesWithKey___block_invoke;
    id v19 = &unk_1E5BAC0B0;
    objc_copyWeak(&v22, &location);
    id v6 = v4;
    id v20 = v6;
    char v21 = &v24;
    objc_msgSend(v5, "prepareStatementForSQL:cache:usingBlock:", @"SELECT discard, domain, expire_time, name, path, secure, value, version FROM cookies WHERE user=? AND user_scope=?;",
      0,
      &v16);

    if ([(SSVCookieStorage *)self performingMigration])
    {
      uint64_t v7 = [MEMORY[0x1E4F4DCE8] sharedAccountsCookiesConfig];
      if (!v7)
      {
        uint64_t v7 = [MEMORY[0x1E4F4DCE8] sharedConfig];
      }
      uint64_t v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = (id)objc_opt_class();
        uint64_t v10 = [(id)v25[5] count];
        id v11 = [v6 identifier];
        uint64_t v12 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138543874;
        id v31 = v9;
        __int16 v32 = 2048;
        uint64_t v33 = v10;
        __int16 v34 = 2114;
        long long v35 = v12;
        _os_log_impl(&dword_1A5002000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Someone is migrating the cookies. We found %lu cookie(s) in the database for %{public}@.", buf, 0x20u);
      }
    }
    id v13 = (id)v25[5];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v24, 8);
  }
  return v13;
}

void __40__SSVCookieStorage__copyCookiesWithKey___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [*(id *)(a1 + 32) identifier];
  SSSQLiteBindFoundationValueToStatement(a2, 1, v4);

  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "scope"));
  SSSQLiteBindFoundationValueToStatement(a2, 2, v5);

  uint64_t v6 = [WeakRetained _copyCookiesForPreparedSQLStatement:a2];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)_copyPrivateCookiesForURL:(id)a3 key:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([MEMORY[0x1E4F4DC40] useNewCookieStorage]
    && ![(SSVCookieStorage *)self performingMigration])
  {
    id v29 = [(SSVCookieStorage *)self _accountForKey:v7];
    if (![(SSVCookieStorage *)self _stopIncludingLocalCookies]
      && (objc_msgSend(v29, "ams_isLocalAccount") & 1) == 0)
    {
      uint64_t v10 = +[SSVCookieKey keyWithIdentifier:scope:](SSVCookieKey, "keyWithIdentifier:scope:", &unk_1EF9A9888, [v7 scope]);
      uint64_t v28 = [(SSVCookieStorage *)self _accountForKey:v10];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v11 = objc_msgSend(v28, "ams_cookies");
      uint64_t v12 = [(SSVCookieStorage *)self _filterCookies:v11 forURL:v6];

      uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v45 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v41 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            uint64_t v17 = [v16 value];
            id v18 = [v16 name];
            [v8 setObject:v17 forKeyedSubscript:v18];
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v45 count:16];
        }
        while (v13);
      }
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v19 = objc_msgSend(v29, "ams_cookies");
    id v20 = [(SSVCookieStorage *)self _filterCookies:v19 forURL:v6];

    uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void **)(*((void *)&v36 + 1) + 8 * j);
          uint64_t v25 = [v24 value];
          uint64_t v26 = [v24 name];
          [v8 setObject:v25 forKeyedSubscript:v26];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v21);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    id v9 = [(SSVCookieStorage *)self _database];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    id v30[2] = __50__SSVCookieStorage__copyPrivateCookiesForURL_key___block_invoke;
    v30[3] = &unk_1E5BAC0D8;
    objc_copyWeak(&v34, &location);
    id v31 = v6;
    id v32 = v7;
    id v33 = v8;
    [v9 prepareStatementForSQL:@"SELECT name, value FROM cookies WHERE ((NOT secure OR secure=?) AND ((user=? AND user_scope=?) OR (user=-1)) AND ((expire_time=0) OR (expire_time>=?)) AND (SUBSTR(?,-LENGTH(domain))=domain) AND (SUBSTR(?,1,LENGTH(path))=path))", 1, v30 cache usingBlock];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __50__SSVCookieStorage__copyPrivateCookiesForURL_key___block_invoke(id *a1, sqlite3_stmt *a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v4 = [a1[4] host];
  if (([v4 hasPrefix:@"."] & 1) == 0)
  {
    uint64_t v5 = [@"." stringByAppendingString:v4];

    id v4 = (void *)v5;
  }
  id v6 = [a1[4] scheme];
  sqlite3_bind_int(a2, 1, [v6 isEqualToString:@"https"]);

  id v7 = [a1[5] identifier];
  if (v7)
  {
    id v8 = [a1[5] identifier];
    sqlite3_bind_int64(a2, 2, [v8 longLongValue]);
  }
  else
  {
    sqlite3_bind_int64(a2, 2, 0);
  }

  sqlite3_bind_int(a2, 3, [a1[5] scope]);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  sqlite3_bind_int(a2, 4, (int)Current);
  id v10 = v4;
  sqlite3_bind_text(a2, 5, (const char *)[v10 UTF8String], -1, 0);
  id v11 = [a1[4] path];
  sqlite3_bind_text(a2, 6, (const char *)[v11 UTF8String], -1, 0);

  uint64_t v12 = [WeakRetained _database];
  int v13 = [v12 statementHasRowAfterStepping:a2];

  if (v13)
  {
    do
    {
      uint64_t v14 = sqlite3_column_text(a2, 0);
      uint64_t v15 = sqlite3_column_text(a2, 1);
      if (v14)
      {
        uint64_t v16 = v15;
        if (v15)
        {
          uint64_t v17 = (void *)[[NSString alloc] initWithUTF8String:v14];
          id v18 = (void *)[[NSString alloc] initWithUTF8String:v16];
          [a1[6] setObject:v18 forKey:v17];
        }
      }
      id v19 = [WeakRetained _database];
      char v20 = [v19 statementHasRowAfterStepping:a2];
    }
    while ((v20 & 1) != 0);
  }
}

- (id)_copyPrivateCookieObjectsForURL:(id)a3 key:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F4DC40] useNewCookieStorage]
    && ![(SSVCookieStorage *)self performingMigration])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v28 = [(SSVCookieStorage *)self _accountForKey:v7];
    if (![(SSVCookieStorage *)self _stopIncludingLocalCookies]
      && (objc_msgSend(v28, "ams_isLocalAccount") & 1) == 0)
    {
      id v11 = +[SSVCookieKey keyWithIdentifier:scope:](SSVCookieKey, "keyWithIdentifier:scope:", &unk_1EF9A9888, [v7 scope]);
      uint64_t v27 = [(SSVCookieStorage *)self _accountForKey:v11];

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      uint64_t v12 = objc_msgSend(v27, "ams_cookies");
      int v13 = [(SSVCookieStorage *)self _filterCookies:v12 forURL:v6];

      uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v46 != v15) {
              objc_enumerationMutation(v13);
            }
            uint64_t v17 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            id v18 = [v17 name];
            [v10 setObject:v17 forKeyedSubscript:v18];
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v14);
      }
    }
    long long v43 = 0u;
    long long v44 = 0u;
    long long v42 = 0u;
    long long v41 = 0u;
    id v19 = objc_msgSend(v28, "ams_cookies");
    char v20 = [(SSVCookieStorage *)self _filterCookies:v19 forURL:v6];

    uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v42 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void **)(*((void *)&v41 + 1) + 8 * j);
          uint64_t v25 = [v24 name];
          [v10 setObject:v24 forKeyedSubscript:v25];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v21);
    }

    id v9 = [v10 allValues];
  }
  else
  {
    uint64_t v35 = 0;
    long long v36 = &v35;
    uint64_t v37 = 0x3032000000;
    long long v38 = __Block_byref_object_copy__42;
    long long v39 = __Block_byref_object_dispose__42;
    id v40 = 0;
    objc_initWeak(&location, self);
    id v8 = [(SSVCookieStorage *)self _database];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __56__SSVCookieStorage__copyPrivateCookieObjectsForURL_key___block_invoke;
    v29[3] = &unk_1E5BAC100;
    objc_copyWeak(&v33, &location);
    id v30 = v6;
    id v31 = v7;
    id v32 = &v35;
    [v8 prepareStatementForSQL:@"SELECT discard, domain, expire_time, name, path, secure, value, version FROM cookies WHERE ((NOT secure OR secure=?) AND ((user=? AND user_scope=?) OR (user=-1)) AND ((expire_time=0) OR (expire_time>=?)) AND (SUBSTR(?,-LENGTH(domain))=domain) AND (SUBSTR(?,1,LENGTH(path))=path))", 1, v29 cache usingBlock];

    id v9 = (id)v36[5];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v35, 8);
  }
  return v9;
}

void __56__SSVCookieStorage__copyPrivateCookieObjectsForURL_key___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [*(id *)(a1 + 32) host];
  if (([v4 hasPrefix:@"."] & 1) == 0)
  {
    uint64_t v5 = [@"." stringByAppendingString:v4];

    id v4 = (void *)v5;
  }
  id v6 = [*(id *)(a1 + 32) scheme];
  sqlite3_bind_int(a2, 1, [v6 isEqualToString:@"https"]);

  id v7 = [*(id *)(a1 + 40) identifier];
  if (v7)
  {
    id v8 = [*(id *)(a1 + 40) identifier];
    sqlite3_bind_int64(a2, 2, [v8 longLongValue]);
  }
  else
  {
    sqlite3_bind_int64(a2, 2, 0);
  }

  sqlite3_bind_int(a2, 3, [*(id *)(a1 + 40) scope]);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  sqlite3_bind_int(a2, 4, (int)Current);
  id v10 = v4;
  sqlite3_bind_text(a2, 5, (const char *)[v10 UTF8String], -1, 0);
  id v11 = [*(id *)(a1 + 32) path];
  sqlite3_bind_text(a2, 6, (const char *)[v11 UTF8String], -1, 0);

  uint64_t v12 = [WeakRetained _copyCookiesForPreparedSQLStatement:a2];
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

- (SSSQLiteDatabase)_database
{
  database = self->__database;
  if (!database)
  {
    id v4 = [SSSQLiteDatabase alloc];
    uint64_t v5 = [(SSSQLiteDatabase *)v4 initWithDatabaseURL:self->_storageLocation readOnly:0 protectionType:*MEMORY[0x1E4F28358]];
    id v6 = self->__database;
    self->__database = v5;

    objc_initWeak(&location, self);
    id v7 = self->__database;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __29__SSVCookieStorage__database__block_invoke;
    v9[3] = &unk_1E5BAC128;
    objc_copyWeak(&v10, &location);
    [(SSSQLiteDatabase *)v7 setSetupBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    database = self->__database;
  }
  return database;
}

void __29__SSVCookieStorage__database__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [(id)objc_opt_class() _setupCookieDatabase:v4 forCookieStorage:WeakRetained];
  }
}

+ (BOOL)_fileURLRepresentsSharedStorageLocation:(id)a3
{
  id v3 = [a3 path];
  if ([v3 length])
  {
    id v4 = [v3 stringByReplacingOccurrencesOfString:@"rescued." withString:&stru_1EF96DA90];

    uint64_t v5 = [(id)objc_opt_class() _sharedStorageLocationPath];
    if (v5)
    {
      id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    }
    else
    {
      id v6 = 0;
    }
    id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
    char v7 = [v6 isEqual:v8];
  }
  else
  {
    char v7 = 0;
    id v4 = v3;
  }

  return v7;
}

- (id)_filterCookies:(id)a3 forURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    char v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SSVCookieStorage.m", 919, @"Invalid parameter not satisfying: %@", @"url" object file lineNumber description];
  }
  id v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7) {
    id v9 = v7;
  }
  id v10 = v9;

  id v11 = [v8 host];
  if (([v11 hasPrefix:@"."] & 1) == 0)
  {
    uint64_t v12 = [@"." stringByAppendingString:v11];

    id v11 = (void *)v12;
  }
  uint64_t v13 = [v8 path];
  uint64_t v14 = [v8 scheme];
  char v15 = [v14 isEqualToString:@"https"];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __42__SSVCookieStorage__filterCookies_forURL___block_invoke;
  v21[3] = &unk_1E5BAC150;
  char v24 = v15;
  id v22 = v11;
  id v23 = v13;
  id v16 = v13;
  id v17 = v11;
  id v18 = objc_msgSend(v10, "_ss_filterUsingTest:", v21);

  return v18;
}

uint64_t __42__SSVCookieStorage__filterCookies_forURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSecure]) {
    BOOL v4 = *(unsigned __int8 *)(a1 + 48) == [v3 isSecure];
  }
  else {
    BOOL v4 = 1;
  }
  uint64_t v5 = [v3 expiresDate];
  if (v5)
  {
    id v6 = [v3 expiresDate];
    [v6 timeIntervalSinceReferenceDate];
    BOOL v8 = v7 >= CFAbsoluteTimeGetCurrent();
  }
  else
  {
    BOOL v8 = 1;
  }

  id v9 = *(void **)(a1 + 32);
  id v10 = [v3 domain];
  unsigned int v11 = [v9 hasSuffix:v10];

  uint64_t v12 = *(void **)(a1 + 40);
  if (v12)
  {
    uint64_t v13 = [v3 path];
    int v14 = [v12 hasPrefix:v13];
  }
  else
  {
    int v14 = 1;
  }

  return (v4 && v8) & v14 & v11;
}

+ (id)_getGlobalSetCookiesForResponse:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 allHeaderFields];
  uint64_t v5 = [v4 objectForKey:@"X-Apple-Set-Cookie"];

  if ([v5 length])
  {
    id v6 = [v3 allHeaderFields];
    CFAbsoluteTime v7 = (void *)[v6 mutableCopy];

    [v7 setObject:v5 forKey:@"Set-Cookie"];
    BOOL v8 = (void *)MEMORY[0x1E4F28D10];
    id v9 = [v3 URL];
    id v10 = [v8 cookiesWithResponseHeaderFields:v7 forURL:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)_getSetCookiesForResponse:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28D10];
  id v4 = a3;
  uint64_t v5 = [v4 allHeaderFields];
  id v6 = [v4 URL];

  CFAbsoluteTime v7 = [v3 cookiesWithResponseHeaderFields:v5 forURL:v6];

  return v7;
}

+ (id)_getUserSetCookiesForResponse:(id)a3
{
  id v3 = a3;
  id v4 = [v3 allHeaderFields];
  uint64_t v5 = [v4 objectForKey:@"X-Apple-Set-User-Cookie"];

  if ([v5 length])
  {
    id v6 = [v3 allHeaderFields];
    CFAbsoluteTime v7 = (void *)[v6 mutableCopy];

    [v7 setObject:v5 forKey:@"Set-Cookie"];
    BOOL v8 = (void *)MEMORY[0x1E4F28D10];
    id v9 = [v3 URL];
    id v10 = [v8 cookiesWithResponseHeaderFields:v7 forURL:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_insertCookies:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  BOOL v8 = [(SSVCookieStorage *)self _database];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__SSVCookieStorage__insertCookies_forKey___block_invoke;
  _OWORD v11[3] = &unk_1E5BAC178;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 prepareStatementForSQL:@"INSERT OR REPLACE INTO cookies (discard, domain, expire_time, name, path, secure, user, user_scope, value, version) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 1, v11 cache usingBlock];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __42__SSVCookieStorage__insertCookies_forKey___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(WeakRetained, "_bindInsertStatement:forCookie:key:", a2, *(void *)(*((void *)&v11 + 1) + 8 * v9), *(void *)(a1 + 40), (void)v11);
        id v10 = [WeakRetained _database];
        [v10 statementHasRowAfterStepping:a2];

        sqlite3_reset(a2);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_setCookies:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([MEMORY[0x1E4F4DC40] useNewCookieStorage]
    && ![(SSVCookieStorage *)self performingMigration])
  {
    uint64_t v9 = [(SSVCookieStorage *)self _accountForKey:v7];
    id v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "ams_addCookies:", v6);
      if ([v10 isDirty])
      {
        long long v11 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
        long long v12 = objc_msgSend(v11, "ams_saveAccount:verifyCredentials:", v10, 0);

        [v12 waitUntilFinished];
      }
    }
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v8 = [(SSVCookieStorage *)self _database];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    char v15 = __39__SSVCookieStorage__setCookies_forKey___block_invoke;
    uint64_t v16 = &unk_1E5BAC1A0;
    objc_copyWeak(&v19, &location);
    id v17 = v6;
    id v18 = v7;
    [v8 performTransactionWithBlock:&v13];

    [(SSVCookieStorage *)self _cookieDatabaseDidChange];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

uint64_t __39__SSVCookieStorage__setCookies_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _insertCookies:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];

  return 1;
}

- (BOOL)_stopIncludingLocalCookies
{
  return CFPreferencesGetAppBooleanValue(@"stopIncludingLocalCookies", @"com.apple.itunesstored", 0) != 0;
}

+ (BOOL)_setupCookieDatabase:(id)a3 forCookieStorage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0;
  char v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  objc_initWeak(&location, a1);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__SSVCookieStorage__setupCookieDatabase_forCookieStorage___block_invoke;
  v14[3] = &unk_1E5BAC1F0;
  objc_copyWeak(v17, &location);
  id v8 = v6;
  id v15 = v8;
  uint64_t v16 = &v19;
  v17[1] = a1;
  [v8 performTransactionWithBlock:v14];
  char v9 = [v8 executeSQL:@"PRAGMA journal_mode=WAL;"];
  *((unsigned char *)v20 + 24) = v9;
  if (v7)
  {
    id v10 = dispatch_get_global_queue(0, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__SSVCookieStorage__setupCookieDatabase_forCookieStorage___block_invoke_2;
    v12[3] = &unk_1E5BA7040;
    id v13 = v7;
    dispatch_async(v10, v12);

    char v9 = *((unsigned char *)v20 + 24) != 0;
  }

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v19, 8);

  return v9;
}

BOOL __58__SSVCookieStorage__setupCookieDatabase_forCookieStorage___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [*(id *)(a1 + 32) userVersion];
  char v4 = 0;
  id v5 = &off_1E5BA6000;
  while (1)
  {
    if (!v3)
    {
      char v6 = [WeakRetained _migrateToVersion1WithDatabase:*(void *)(a1 + 32)];
      uint64_t v3 = 1;
      goto LABEL_8;
    }
    if (v3 == 1)
    {
      char v6 = [WeakRetained _migrateToVersion2WithDatabase:*(void *)(a1 + 32)];
      uint64_t v3 = 2;
LABEL_8:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
      goto LABEL_9;
    }
    if (v3 == 2) {
      break;
    }
LABEL_9:
    if (!((*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0) | v4 & 1))
    {
      id v7 = [v5[244] sharedStoreServicesConfig];
      if (!v7)
      {
        id v7 = [v5[244] sharedConfig];
      }
      id v8 = v5;
      int v9 = objc_msgSend(v7, "shouldLog", v51);
      if ([v7 shouldLogToDisk]) {
        int v10 = v9 | 2;
      }
      else {
        int v10 = v9;
      }
      long long v11 = [v7 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        int v12 = v10;
      }
      else {
        int v12 = v10 & 2;
      }
      if (v12)
      {
        id v13 = objc_opt_class();
        int v55 = 138543362;
        id v56 = v13;
        id v14 = v13;
        LODWORD(v52) = 12;
        uint64_t v51 = &v55;
        id v15 = (void *)_os_log_send_and_compose_impl();

        if (!v15) {
          goto LABEL_22;
        }
        long long v11 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v55, v52);
        free(v15);
        SSFileLog(v7, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v11);
      }

LABEL_22:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) executeSQL:@"DROP TABLE cookies;"];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        uint64_t v3 = 0;
      }
      char v4 = 1;
      id v5 = v8;
    }
  }
  int v22 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0 && (v4 & 1) != 0)
  {
    id v23 = [v5[244] sharedStoreServicesConfig];
    if (!v23)
    {
      id v23 = [v5[244] sharedConfig];
    }
    int v24 = objc_msgSend(v23, "shouldLog", v51);
    if ([v23 shouldLogToDisk]) {
      int v25 = v24 | 2;
    }
    else {
      int v25 = v24;
    }
    uint64_t v26 = [v23 OSLogObject];
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      v25 &= 2u;
    }
    if (v25)
    {
      uint64_t v27 = objc_opt_class();
      int v55 = 138543362;
      id v56 = v27;
      id v28 = v27;
      LODWORD(v52) = 12;
      uint64_t v51 = &v55;
      id v29 = (void *)_os_log_send_and_compose_impl();

      if (v29)
      {
        uint64_t v26 = objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, &v55, v52);
        free(v29);
        SSFileLog(v23, @"%@", v30, v31, v32, v33, v34, v35, (uint64_t)v26);
        goto LABEL_36;
      }
    }
    else
    {
LABEL_36:
    }
    int v22 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  if (!v22)
  {
    long long v38 = [v5[244] sharedStoreServicesConfig];
    if (!v38)
    {
      long long v38 = [v5[244] sharedConfig];
    }
    int v39 = objc_msgSend(v38, "shouldLog", v51);
    if ([v38 shouldLogToDisk]) {
      int v40 = v39 | 2;
    }
    else {
      int v40 = v39;
    }
    long long v41 = [v38 OSLogObject];
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_INFO)) {
      v40 &= 2u;
    }
    if (v40)
    {
      long long v42 = [NSNumber numberWithInteger:2];
      int v55 = 138412290;
      id v56 = v42;
      LODWORD(v52) = 12;
      long long v43 = (void *)_os_log_send_and_compose_impl();

      if (!v43)
      {
LABEL_51:

        int v37 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        goto LABEL_52;
      }
      long long v41 = objc_msgSend(NSString, "stringWithCString:encoding:", v43, 4, &v55, v52);
      free(v43);
      SSFileLog(v38, @"%@", v44, v45, v46, v47, v48, v49, (uint64_t)v41);
    }

    goto LABEL_51;
  }
  long long v36 = *(void **)(a1 + 32);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __58__SSVCookieStorage__setupCookieDatabase_forCookieStorage___block_invoke_208;
  v53[3] = &unk_1E5BAC1C8;
  id v54 = v36;
  [v54 prepareStatementForSQL:@"DELETE FROM cookies WHERE ((expire_time!=0) AND (expire_time<?))" cache:0 usingBlock:v53];
  [*(id *)(a1 + 32) setUserVersion:2];
  int v37 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);

LABEL_52:
  return v37 != 0;
}

uint64_t __58__SSVCookieStorage__setupCookieDatabase_forCookieStorage___block_invoke_208(uint64_t a1, sqlite3_stmt *a2)
{
  double Current = CFAbsoluteTimeGetCurrent();
  sqlite3_bind_double(a2, 1, Current);
  do
    uint64_t result = [*(id *)(a1 + 32) statementHasRowAfterStepping:a2];
  while ((result & 1) != 0);
  return result;
}

uint64_t __58__SSVCookieStorage__setupCookieDatabase_forCookieStorage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cookieDatabaseDidChange];
}

+ (BOOL)_migrateToVersion1WithDatabase:(id)a3
{
  return [a3 executeSQL:@"CREATE TABLE IF NOT EXISTS cookies(discard INTEGER DEFAULT 0, domain TEXT NOT NULL, expire_time REAL, name TEXT NOT NULL, path TEXT NOT NULL, secure INTEGER, user INTEGER DEFAULT 0, value TEXT NOT NULL, version INTEGER DEFAULT 1, PRIMARY KEY(name, domain, path, user))"];
}

+ (BOOL)_migrateToVersion2WithDatabase:(id)a3
{
  id v3 = a3;
  if (![v3 executeSQL:@"CREATE TABLE IF NOT EXISTS tmp_cookies (discard INTEGER DEFAULT 0, domain TEXT NOT NULL, expire_time REAL, name TEXT NOT NULL, path TEXT NOT NULL, secure INTEGER, user INTEGER DEFAULT 0, user_scope INTEGER DEFAULT 0, value TEXT NOT NULL, version INTEGER DEFAULT 1, PRIMARY KEY(name, domain, path, user, user_scope));"]) {
    goto LABEL_6;
  }
  if (([v3 executeSQL:@"INSERT INTO tmp_cookies (discard, domain, expire_time, name, path, secure, user, value, version) SELECT discard, domain, expire_time, name, path, secure, user, value, version FROM cookies;"] & 1) == 0)
  {
    [v3 executeSQL:@"DROP TABLE tmp_cookies;"];
    goto LABEL_6;
  }
  if (![v3 executeSQL:@"DROP TABLE cookies;"])
  {
LABEL_6:
    char v4 = 0;
    goto LABEL_7;
  }
  char v4 = [v3 executeSQL:@"ALTER TABLE tmp_cookies RENAME TO cookies;"];
LABEL_7:

  return v4;
}

+ (id)_sharedStorageLocationPath
{
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", CPSharedResourcesDirectory(), @"Library", @"Cookies", @"com.apple.itunesstored.2.sqlitedb", 0);
  id v3 = [NSString pathWithComponents:v2];

  return v3;
}

+ (BOOL)_currentProcessIsRoot
{
  return getuid() == 0;
}

+ (BOOL)_currentProcessShouldUseRescuedStorageLocationForLocation:(id)a3
{
  id v4 = a3;
  if ([a1 _fileIsOwnedByRoot:v4])
  {
    id v5 = [a1 _rescuedStorageLocationForLocation:v4];
    char v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v7 = [v5 path];
    char v8 = [v6 fileExistsAtPath:v7];

    if (v8) {
      LOBYTE(v9) = 1;
    }
    else {
      int v9 = [a1 _currentProcessIsRoot] ^ 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (BOOL)_fileIsOwnedByRoot:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  char v6 = [v4 path];

  id v7 = [v5 attributesOfItemAtPath:v6 error:0];

  char v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28318]];
  int v9 = v8;
  if (v8) {
    BOOL v10 = [v8 integerValue] == 0;
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)_rescuedStorageLocationForLocation:(id)a3
{
  id v4 = a3;
  if ([a1 _fileIsOwnedByRoot:v4])
  {
    id v5 = [v4 pathExtension];
    char v6 = [NSString stringWithFormat:@"%@%@", @"rescued.", v5];
    id v7 = [v4 path];
    char v8 = [v7 stringByReplacingOccurrencesOfString:v5 withString:v6];

    int v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
    id v10 = [a1 _rescuedStorageLocationForLocation:v9];
  }
  else
  {
    id v10 = v4;
  }

  return v10;
}

- (BOOL)performingMigration
{
  return self->_performingMigration;
}

- (void)setPerformingMigration:(BOOL)a3
{
  self->_performingMigration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__database, 0);
  objc_storeStrong((id *)&self->_storageLocation, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end