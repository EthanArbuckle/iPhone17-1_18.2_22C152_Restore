@interface MKApplicationMigrator
- (BOOL)importAndWait;
- (BOOL)prompt;
- (MKApplicationMigrator)init;
- (NSDictionary)signatures;
- (NSMutableArray)identifiers;
- (id)lookup;
- (void)close;
- (void)dealloc;
- (void)didLookup:(id)a3 identifiers:(id)a4 error:(id)a5;
- (void)drainQueue;
- (void)import;
- (void)import:(id)a3;
- (void)import:(id)a3 identifiers:(id)a4;
- (void)importDataEncodedInJSON:(id)a3;
- (void)install:(id)a3;
- (void)lookup:(id)a3;
- (void)purchase;
- (void)purchase2;
- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)setIdentifiers:(id)a3;
- (void)setSignatures:(id)a3;
- (void)slice:(unint64_t)a3;
@end

@implementation MKApplicationMigrator

- (MKApplicationMigrator)init
{
  v7.receiver = self;
  v7.super_class = (Class)MKApplicationMigrator;
  v2 = [(MKMigrator *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(MKMigrator *)v2 setType:2];
    v4 = objc_alloc_init(MKApplicationDatabase);
    db = v3->_db;
    v3->_db = v4;
  }
  return v3;
}

- (void)dealloc
{
  [(MKApplicationMigrator *)self close];
  v3.receiver = self;
  v3.super_class = (Class)MKApplicationMigrator;
  [(MKApplicationMigrator *)&v3 dealloc];
}

- (void)import
{
  obj = self;
  objc_sync_enter(obj);
  if ([(NSMutableArray *)obj->_identifiers count])
  {
    obj->_isImporting = 1;
    objc_sync_exit(obj);
  }
  else
  {
    objc_sync_exit(obj);

    v3.receiver = obj;
    v3.super_class = (Class)MKApplicationMigrator;
    [(MKMigrator *)&v3 import];
  }
}

- (void)close
{
  [(MKApplicationDatabase *)self->_db close];
  db = self->_db;
  self->_db = 0;
}

- (void)importDataEncodedInJSON:(id)a3
{
  id v7 = a3;
  v4 = self;
  uint64_t v5 = objc_sync_enter(v4);
  v6 = (void *)MEMORY[0x230F5C060](v5);
  [(MKApplicationMigrator *)v4 import:v7];
  objc_sync_exit(v4);
}

- (void)import:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = +[MKLog log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = self;
    _os_log_impl(&dword_22BFAC000, v5, OS_LOG_TYPE_INFO, "%@ will import applications.", buf, 0xCu);
  }

  id v13 = 0;
  v6 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:&v13];
  id v7 = v13;
  if (v7)
  {
    v8 = +[MKLog log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MKApplicationMigrator import:]();
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = v6;
      if ([v8 count])
      {
        id v9 = [v8 mutableCopy];
        [(MKApplicationMigrator *)self setIdentifiers:v9];

        self->_unint64_t totalCount = [(NSMutableArray *)self->_identifiers count];
        -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", [v4 length]);
        unint64_t totalCount = self->_totalCount;
        if (totalCount % 0x32) {
          unint64_t v11 = totalCount / 0x32 + 1;
        }
        else {
          unint64_t v11 = totalCount / 0x32;
        }
        for (; v11; --v11)
        {
          v12 = [(MKMigrator *)self delegate];
          [v12 migratorWillExecuteOperation:self];
        }
        [(MKApplicationMigrator *)self drainQueue];
      }
    }
    else
    {
      v8 = +[MKLog log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MKApplicationMigrator import:](v8);
      }
    }
  }
}

- (void)drainQueue
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(NSMutableArray *)self->_identifiers count];
  if (v3 >= 0x32) {
    uint64_t v4 = 50;
  }
  else {
    uint64_t v4 = v3;
  }
  if (v4)
  {
    id v10 = [(NSMutableArray *)self->_identifiers subarrayWithRange:0];
    -[MKApplicationMigrator lookup:](self, "lookup:");
  }
  else
  {
    unint64_t v5 = self->_totalCount - self->_matchedAppsCount;
    v6 = +[MKLog log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      unint64_t totalCount = self->_totalCount;
      unint64_t matchedAppsCount = self->_matchedAppsCount;
      *(_DWORD *)buf = 138413058;
      v12 = self;
      __int16 v13 = 2048;
      unint64_t v14 = totalCount;
      __int16 v15 = 2048;
      unint64_t v16 = matchedAppsCount;
      __int16 v17 = 2048;
      unint64_t v18 = v5;
      _os_log_impl(&dword_22BFAC000, v6, OS_LOG_TYPE_INFO, "%@ is done. total_count=%ld, matched_apps_count=%ld, not_matched_apps_count=%ld", buf, 0x2Au);
    }

    id v9 = objc_alloc_init(MKApplicationAnalytics);
    [(MKApplicationAnalytics *)v9 send:self->_matchedAppsCount mismatchedApps:v5];

    if (self->_isImporting) {
      [(MKApplicationMigrator *)self import];
    }
  }
}

- (void)slice:(unint64_t)a3
{
  -[NSMutableArray removeObjectsInRange:](self->_identifiers, "removeObjectsInRange:", 0, a3);
  [(MKApplicationMigrator *)self drainQueue];
}

- (void)lookup:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unint64_t v5 = objc_alloc_init(MKAppSearchRequest);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__MKApplicationMigrator_lookup___block_invoke;
  v7[3] = &unk_264905CE0;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(MKAppSearchRequest *)v5 search:0 androidIDs:v6 completion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __32__MKApplicationMigrator_lookup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained didLookup:v7 identifiers:*(void *)(a1 + 32) error:v6];
}

- (void)didLookup:(id)a3 identifiers:(id)a4 error:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(MKMigrator *)self delegate];
  [v11 migratorDidExecuteOperation:self];

  v12 = self;
  uint64_t v13 = objc_sync_enter(v12);
  unint64_t v14 = (void *)MEMORY[0x230F5C060](v13);
  __int16 v15 = +[MKLog log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412802;
    unint64_t v18 = v12;
    __int16 v19 = 2048;
    uint64_t v20 = [v8 count];
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_22BFAC000, v15, OS_LOG_TYPE_INFO, "%@ did lookup android ids. apps=%ld, error=%@", (uint8_t *)&v17, 0x20u);
  }

  if (v10)
  {
    unint64_t lookupErrorCount = v12->_lookupErrorCount;
    if (lookupErrorCount < 0xA)
    {
      v12->_unint64_t lookupErrorCount = lookupErrorCount + 1;
      [(MKApplicationMigrator *)v12 drainQueue];
    }
    else
    {
      [(MKApplicationDatabase *)v12->_db addIdentifiers:v9];
      -[MKMigrator migratorDidFailWithImportError:count:](v12, "migratorDidFailWithImportError:count:", v10, [v9 count]);
      -[MKApplicationMigrator slice:](v12, "slice:", [v9 count]);
    }
  }
  else
  {
    v12->_unint64_t lookupErrorCount = 0;
    [(MKApplicationMigrator *)v12 import:v8 identifiers:v9];
  }
  objc_sync_exit(v12);
}

- (void)import:(id)a3 identifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  self->_matchedAppsCount += [v7 count];
  [(MKApplicationMigrator *)self install:v7];
  -[MKMigrator migratorDidImportWithCount:](self, "migratorDidImportWithCount:", [v7 count]);
  uint64_t v8 = [v6 count];
  uint64_t v9 = [v7 count];

  [(MKMigrator *)self migratorDidFailWithImportError:0 count:v8 - v9];
  uint64_t v10 = [v6 count];

  [(MKApplicationMigrator *)self slice:v10];
}

- (BOOL)importAndWait
{
  unint64_t v3 = +[MKLog log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22BFAC000, v3, OS_LOG_TYPE_INFO, "app installation will continue.", buf, 2u);
  }

  id v4 = [(MKApplicationMigrator *)self lookup];
  [(MKApplicationMigrator *)self install:v4];
  if ([(MKApplicationDatabase *)self->_db countForAppStoreIdentifiers] >= 1
    && [(MKApplicationMigrator *)self prompt])
  {
    [(MKApplicationMigrator *)self purchase];
  }
  [(MKApplicationDatabase *)self->_db drop];
  [(MKApplicationDatabase *)self->_db close];
  db = self->_db;
  self->_db = 0;

  id v6 = +[MKLog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_22BFAC000, v6, OS_LOG_TYPE_INFO, "app installation is done.", v8, 2u);
  }

  return 1;
}

- (id)lookup
{
  v2 = [(MKApplicationDatabase *)self->_db identifiers];
  uint64_t v3 = [v2 count];
  uint64_t v4 = v3;
  if (v3 >= 50) {
    uint64_t v5 = 50;
  }
  else {
    uint64_t v5 = v3;
  }
  id v6 = objc_msgSend(v2, "subarrayWithRange:", 0, v5, v2);
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  uint64_t v8 = 0;
  id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
  while ([v6 count])
  {
    uint64_t v9 = objc_alloc_init(MKAppSearchRequest);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __31__MKApplicationMigrator_lookup__block_invoke;
    v17[3] = &unk_264905F68;
    __int16 v19 = &v32;
    uint64_t v20 = &v28;
    __int16 v21 = &v22;
    uint64_t v10 = v7;
    unint64_t v18 = v10;
    [(MKAppSearchRequest *)v9 search:0 androidIDs:v6 completion:v17];
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    unint64_t v11 = v29;
    v12 = v33;
    if (v29[3] < 10)
    {
      if (*((unsigned char *)v33 + 24)) {
        goto LABEL_13;
      }
    }
    else
    {
      *((unsigned char *)v33 + 24) = 0;
    }
    *((unsigned char *)v12 + 24) = 0;
    v11[3] = 0;
    v8 += v5;
    v4 -= v5;
    if (v4 >= 50) {
      uint64_t v5 = 50;
    }
    else {
      uint64_t v5 = v4;
    }
    uint64_t v13 = objc_msgSend(v16, "subarrayWithRange:", v8, v5);

    id v6 = (void *)v13;
LABEL_13:
  }
  id v14 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v14;
}

void __31__MKApplicationMigrator_lookup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    dispatch_semaphore_t v7 = +[MKLog log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __31__MKApplicationMigrator_lookup__block_invoke_cold_1(v6);
    }
  }
  if ([v5 count]) {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObjectsFromArray:v5];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)install:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v36 objects:v52 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v35 = *(void *)v37;
    *(void *)&long long v5 = 138413570;
    long long v32 = v5;
    uint64_t v34 = self;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v37 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v36 + 1) + 8 * v7);
        uint64_t v9 = +[MKLog log];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v10 = [v8 bundleIdentifier];
          unint64_t v11 = [v8 appStoreIdentifier];
          v12 = [v8 name];
          uint64_t v13 = [v8 developer];
          id v14 = [v8 iconURL];
          int v15 = [v8 isFree];
          *(_DWORD *)buf = v32;
          v41 = v10;
          __int16 v42 = 2112;
          v43 = v11;
          __int16 v44 = 2112;
          v45 = v12;
          __int16 v46 = 2112;
          v47 = v13;
          __int16 v48 = 2112;
          v49 = v14;
          __int16 v50 = 1024;
          int v51 = v15;
          _os_log_impl(&dword_22BFAC000, v9, OS_LOG_TYPE_INFO, "will install an application. bundle_id=%@, appstore_id=%@, name=%@, developer=%@, icon=%@, free=%d", buf, 0x3Au);

          self = v34;
        }

        if ([v8 isFree])
        {
          signatures = self->_signatures;
          int v17 = [v8 bundleIdentifier];
          unint64_t v18 = [(NSDictionary *)signatures objectForKey:v17];

          if (!v18)
          {
            __int16 v19 = (void *)MEMORY[0x263EFF8F8];
            uint64_t v20 = NSURL;
            __int16 v21 = [v8 iconURL];
            uint64_t v22 = [v20 URLWithString:v21];
            uint64_t v23 = [v19 dataWithContentsOfURL:v22];

            uint64_t v24 = [MKPlaceholder alloc];
            v25 = [v8 bundleIdentifier];
            v26 = [v8 appStoreIdentifier];
            id v27 = [v8 name];
            uint64_t v28 = [v8 developer];
            v29 = [(MKPlaceholder *)v24 initWithBundleIdentifier:v25 appStoreIdentifier:v26 bundleName:v27 developer:v28 icon:v23];

            self = v34;
            [(MKPlaceholder *)v29 install];
          }
          db = self->_db;
          uint64_t v31 = [v8 appStoreIdentifier];
          [(MKApplicationDatabase *)db addAppStoreIdentifier:v31];
        }
        ++v7;
      }
      while (v6 != v7);
      uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v52 count:16];
    }
    while (v6);
  }
}

- (BOOL)prompt
{
  v22[4] = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v21[0] = *MEMORY[0x263EFFFC8];
  uint64_t v3 = MKLocalizedString(@"APP_MIGRATION_PROMPT_TITLE");
  v22[0] = v3;
  v21[1] = *MEMORY[0x263EFFFD8];
  uint64_t v4 = MKLocalizedString(@"APP_MIGRATION_PROMPT_MESSAGE");
  v22[1] = v4;
  v21[2] = *MEMORY[0x263F00000];
  long long v5 = MKLocalizedString(@"APP_MIGRATION_PROMPT_CHOICE_YES");
  v22[2] = v5;
  v21[3] = *MEMORY[0x263EFFFE8];
  uint64_t v6 = MKLocalizedString(@"APP_MIGRATION_PROMPT_CHOICE_NO");
  v22[3] = v6;
  CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  CFUserNotificationRef v20 = 0;
  CFUserNotificationRef v20 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 0, 0, v7);
  uint64_t v15 = 0;
  unint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v8 = dispatch_get_global_queue(25, 0);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __31__MKApplicationMigrator_prompt__block_invoke;
  v11[3] = &unk_264905F90;
  uint64_t v13 = v19;
  id v14 = &v15;
  dispatch_semaphore_t v12 = v2;
  uint64_t v9 = v2;
  dispatch_async(v8, v11);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  LOBYTE(v2) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);

  return (char)v2;
}

intptr_t __31__MKApplicationMigrator_prompt__block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = responseFlags == 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)purchase
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v35 = 0;
  long long v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  long long v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = [(MKApplicationDatabase *)self->_db appStoreIdentifiers];
  unint64_t v5 = 0;
  uint64_t v6 = *MEMORY[0x263F7B948];
  *(void *)&long long v7 = 138412290;
  long long v18 = v7;
  while (v5 < objc_msgSend(v4, "count", v18))
  {
    uint64_t v8 = [v4 objectAtIndexedSubscript:v5];
    uint64_t v9 = +[MKLog log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = v18;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_22BFAC000, v9, OS_LOG_TYPE_INFO, "will lookup a store item. id=%@", (uint8_t *)&buf, 0xCu);
    }

    id v10 = objc_alloc_init(MEMORY[0x263F7B1C8]);
    [v10 setValue:v8 forParameter:v6];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __33__MKApplicationMigrator_purchase__block_invoke;
    v24[3] = &unk_264905F68;
    v26 = &v39;
    id v27 = &v35;
    uint64_t v28 = &v29;
    unint64_t v11 = v3;
    v25 = v11;
    [v10 startWithItemLookupBlock:v24];
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_t v12 = v36;
    uint64_t v13 = v40;
    if (v36[3] < 10)
    {
      if (*((unsigned char *)v40 + 24)) {
        goto LABEL_9;
      }
    }
    else
    {
      *((unsigned char *)v40 + 24) = 0;
    }
    *((unsigned char *)v13 + 24) = 0;
    v12[3] = 0;
    ++v5;
LABEL_9:
  }
  id v14 = +[MKLog log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_22BFAC000, v14, OS_LOG_TYPE_INFO, "will create a store purchase request.", (uint8_t *)&buf, 2u);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__1;
  __int16 v46 = __Block_byref_object_dispose__1;
  id v15 = objc_alloc(MEMORY[0x263F7B2E8]);
  id v47 = (id)[v15 initWithPurchases:v30[5]];
  unint64_t v16 = *(void **)(*((void *)&buf + 1) + 40);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __33__MKApplicationMigrator_purchase__block_invoke_29;
  v21[3] = &unk_264905FB8;
  p_long long buf = &buf;
  uint64_t v22 = v3;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __33__MKApplicationMigrator_purchase__block_invoke_31;
  void v19[3] = &unk_264905FE0;
  uint64_t v17 = v22;
  CFUserNotificationRef v20 = v17;
  [v16 startWithPurchaseResponseBlock:v21 completionBlock:v19];
  dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
}

void __33__MKApplicationMigrator_purchase__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    long long v7 = +[MKLog log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __33__MKApplicationMigrator_purchase__block_invoke_cold_1(v6);
    }
  }
  if (v5 && [v5 count] == 1)
  {
    id v8 = objc_alloc(MEMORY[0x263F7B2D8]);
    uint64_t v9 = [v5 objectAtIndexedSubscript:0];
    id v10 = (void *)[v8 initWithItem:v9];

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v10];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __33__MKApplicationMigrator_purchase__block_invoke_29(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 error];
  id v5 = [v4 domain];
  if ([v5 isEqualToString:*MEMORY[0x263F7B758]])
  {
    id v6 = [v3 error];
    uint64_t v7 = [v6 code];

    if (v7 == 16)
    {
      id v8 = +[MKLog log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __33__MKApplicationMigrator_purchase__block_invoke_29_cold_1(v3);
      }

      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) cancel];
    }
  }
  else
  {
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __33__MKApplicationMigrator_purchase__block_invoke_31(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)purchase2
{
  id v3 = objc_alloc_init(MEMORY[0x263F27B80]);
  [v3 setParameter:&unk_26DF7AC38 forKey:*MEMORY[0x263F27828]];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F27E28]) initWithPurchaseType:0 buyParams:v3];
  [v4 setUserInitiated:1];
  id v5 = [MEMORY[0x263F27B28] bagForProfile:@"AMSPurchase" profileVersion:@"1"];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F27E48]) initWithPurchase:v4 bag:v5];
  [v6 setDelegate:self];
  uint64_t v7 = [v6 performPurchase];
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __34__MKApplicationMigrator_purchase2__block_invoke;
  v10[3] = &unk_264906008;
  dispatch_semaphore_t v11 = v8;
  uint64_t v9 = v8;
  [v7 resultWithCompletion:v10];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

void __34__MKApplicationMigrator_purchase2__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[MKLog log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_22BFAC000, v7, OS_LOG_TYPE_INFO, "result=%@, error=%@", (uint8_t *)&v8, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)purchase:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  id v6 = (objc_class *)MEMORY[0x263F27B18];
  id v7 = a5;
  id v8 = a4;
  id v10 = (id)[[v6 alloc] initWithRequest:v8];

  id v9 = [v10 performAuthentication];
  [v9 addFinishBlock:v7];
}

- (NSDictionary)signatures
{
  return self->_signatures;
}

- (void)setSignatures:(id)a3
{
}

- (NSMutableArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_signatures, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)import:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22BFAC000, log, OS_LOG_TYPE_ERROR, "MKApplicationMigrator could not initialize because an invalid json format was received.", v1, 2u);
}

- (void)import:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_22BFAC000, v0, OS_LOG_TYPE_ERROR, "MKApplicationMigrator could not initialize because an underlying error occurred unexpectedly. error=%@", v1, 0xCu);
}

void __31__MKApplicationMigrator_lookup__block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BFAC000, v2, v3, "could not lookup applications and will retry. error=%@", v4, v5, v6, v7, v8);
}

void __33__MKApplicationMigrator_purchase__block_invoke_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BFAC000, v2, v3, "could not lookup store items and will retry. error=%@", v4, v5, v6, v7, v8);
}

void __33__MKApplicationMigrator_purchase__block_invoke_29_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_22BFAC000, v2, v3, "store purchase request was canceled. error=%@", v4, v5, v6, v7, v8);
}

@end