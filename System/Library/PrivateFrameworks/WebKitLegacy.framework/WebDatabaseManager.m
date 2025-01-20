@interface WebDatabaseManager
+ (id)sharedWebDatabaseManager;
+ (void)removeEmptyDatabaseFiles;
+ (void)scheduleEmptyDatabaseRemoval;
- (BOOL)deleteDatabase:(id)a3 withOrigin:(id)a4;
- (BOOL)deleteOrigin:(id)a3;
- (WebDatabaseManager)init;
- (id)databasesWithOrigin:(id)a3;
- (id)detailsForDatabase:(id)a3 withOrigin:(id)a4;
- (id)origins;
- (void)deleteAllDatabases;
- (void)deleteAllIndexedDatabases;
@end

@implementation WebDatabaseManager

uint64_t __50__WebDatabaseManager_scheduleEmptyDatabaseRemoval__block_invoke()
{
  uint64_t v0 = +[WebDatabaseManager removeEmptyDatabaseFiles];
  return MEMORY[0x1F416E078](v0);
}

+ (void)removeEmptyDatabaseFiles
{
  v2 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:WebDatabaseDirectoryDefaultsKey];
  if (!v3 || (v4 = (__CFString *)v3, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    v4 = @"~/Library/WebKit/Databases";
  }
  v5 = (void *)[(__CFString *)v4 stringByStandardizingPath];
  v6 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  v7 = (void *)[v6 contentsOfDirectoryAtPath:v5 error:0];
  if (v7)
  {
    v8 = v7;
    uint64_t v9 = [v7 count];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *MEMORY[0x1E4F283D0];
      for (i = objc_msgSend(v8, "objectAtIndex:", 0, *MEMORY[0x1E4F283D0], v5);
            ;
            i = objc_msgSend(v8, "objectAtIndex:", v11, v28, v29))
      {
        v14 = i;
        if ([i length])
        {
          if ([v14 characterAtIndex:0] != 46)
          {
            v15 = (void *)[v5 stringByAppendingPathComponent:v14];
            char v31 = 0;
            if ([v6 fileExistsAtPath:v15 isDirectory:&v31])
            {
              if (v31
                && objc_msgSend((id)objc_msgSend(v6, "attributesOfItemAtPath:error:", v15, 0), "fileType") != v12)
              {
                v16 = (void *)[v6 contentsOfDirectoryAtPath:v15 error:0];
                uint64_t v17 = [v16 count];
                if (!v17) {
                  goto LABEL_7;
                }
                uint64_t v18 = v17;
                uint64_t v19 = 0;
                uint64_t v20 = 0;
                do
                {
                  v21 = (void *)[v16 objectAtIndex:v19];
                  if ([v21 length])
                  {
                    if ([v21 characterAtIndex:0] != 46)
                    {
                      uint64_t v22 = [v15 stringByAppendingPathComponent:v21];
                      if ([v6 fileExistsAtPath:v22 isDirectory:&v31])
                      {
                        if (!v31)
                        {
                          MEMORY[0x1E4E442D0](&v30, v22);
                          unsigned int v25 = WebCore::DatabaseTracker::deleteDatabaseFileIfEmpty((WebCore::DatabaseTracker *)&v30, v23);
                          v26 = v30;
                          v30 = 0;
                          if (v26)
                          {
                            if (*(_DWORD *)v26 == 2) {
                              WTF::StringImpl::destroy(v26, v24);
                            }
                            else {
                              *(_DWORD *)v26 -= 2;
                            }
                          }
                          v20 += v25;
                        }
                      }
                    }
                  }
                  ++v19;
                }
                while (v18 != v19);
                BOOL v27 = v18 == v20;
                uint64_t v12 = v28;
                v5 = v29;
                if (v27 || !objc_msgSend((id)objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v15, 0), "count")) {
LABEL_7:
                }
                  rmdir((const char *)[v15 fileSystemRepresentation]);
              }
            }
          }
        }
        if (++v11 == v10) {
          break;
        }
      }
    }
  }
}

+ (void)scheduleEmptyDatabaseRemoval
{
  WebCore::DatabaseTracker::emptyDatabaseFilesRemovalTaskWillBeScheduled((WebCore::DatabaseTracker *)a1);
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_async(global_queue, &__block_literal_global_1);
}

+ (id)sharedWebDatabaseManager
{
  if (_MergedGlobals_12 == 1) {
    return (id)qword_1EB3A9730;
  }
  id result = objc_alloc_init(WebDatabaseManager);
  qword_1EB3A9730 = (uint64_t)result;
  _MergedGlobals_12 = 1;
  return result;
}

- (WebDatabaseManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)WebDatabaseManager;
  v2 = [(WebDatabaseManager *)&v12 init];
  uint64_t v3 = v2;
  if (v2)
  {
    if (!WebPlatformStrategies::initializeIfNecessary(void)::platformStrategies) {
      operator new();
    }
    v4 = (WebCore::DatabaseManager *)WebCore::DatabaseManager::singleton((WebCore::DatabaseManager *)v2);
    v5 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v6 = [v5 objectForKey:WebDatabaseDirectoryDefaultsKey];
    if (!v6 || (v7 = (__CFString *)v6, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      v7 = @"~/Library/WebKit/Databases";
    }
    MEMORY[0x1E4E442D0](&v11, [(__CFString *)v7 stringByStandardizingPath]);
    WebCore::DatabaseManager::initialize(v4, (const WTF::String *)&v11);
    uint64_t v9 = v11;
    uint64_t v11 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
      {
        WTF::StringImpl::destroy(v9, v8);
          goto LABEL_11;
        goto LABEL_14;
      }
      *(_DWORD *)v9 -= 2;
    }
    {
LABEL_11:
      WebCore::DatabaseManager::setClient();
      return v3;
    }
LABEL_14:
    WTF::NeverDestroyed<WebKit::WebDatabaseManagerClient,WTF::AnyThreadsAccessTraits>::NeverDestroyed<>(WebKit::WebDatabaseManagerClient::sharedWebDatabaseManagerClient(void)::sharedClient);
    goto LABEL_11;
  }
  return v3;
}

- (id)origins
{
  v2 = (WebCore::DatabaseTracker *)WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  WebCore::DatabaseTracker::origins((uint64_t *)&v21, v2);
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v4 = (void *)[v3 initWithCapacity:v23];
  if (v23)
  {
    v5 = v21;
    uint64_t v6 = 32 * v23;
    while (1)
    {
      v7 = [WebSecurityOrigin alloc];
      WebCore::SecurityOriginData::securityOrigin((uint64_t *)&v24, v5);
      uint64_t v8 = [(WebSecurityOrigin *)v7 _initWithWebCoreSecurityOrigin:v24];
      uint64_t v10 = (const void *)v8;
      uint64_t v11 = v24;
      v24 = 0;
      if (v11)
      {
        if (atomic_fetch_add((atomic_uint *volatile)v11, 0xFFFFFFFF) == 1) {
          break;
        }
      }
      if (v8) {
        goto LABEL_7;
      }
LABEL_3:
      v5 = (WTF *)((char *)v5 + 32);
      v6 -= 32;
      if (!v6) {
        goto LABEL_20;
      }
    }
    atomic_store(1u, (unsigned int *)v11);
    objc_super v12 = (WTF::StringImpl *)*((void *)v11 + 6);
    *((void *)v11 + 6) = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2) {
        WTF::StringImpl::destroy(v12, v9);
      }
      else {
        *(_DWORD *)v12 -= 2;
      }
    }
    v13 = (WTF::StringImpl *)*((void *)v11 + 5);
    *((void *)v11 + 5) = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2) {
        WTF::StringImpl::destroy(v13, v9);
      }
      else {
        *(_DWORD *)v13 -= 2;
      }
    }
    uint64_t v14 = *((unsigned int *)v11 + 8);
    if (v14 != -1) {
      ((void (*)(char *, char *))off_1F3C7C5D8[v14])(&v25, (char *)v11 + 8);
    }
    *((_DWORD *)v11 + 8) = -1;
    WTF::fastFree(v11, v9);
    if (!v10) {
      goto LABEL_3;
    }
LABEL_7:
    [v4 addObject:v10];
    CFRelease(v10);
    goto LABEL_3;
  }
LABEL_20:
  CFTypeRef v16 = (id)CFMakeCollectable(v4);
  uint64_t v17 = (unsigned int *)v21;
  if (v23)
  {
    uint64_t v18 = 32 * v23;
    do
    {
      uint64_t v19 = v17[6];
      if (v19 != -1) {
        ((void (*)(WTF **, unsigned int *))off_1F3C7C5D8[v19])(&v24, v17);
      }
      v17[6] = -1;
      v17 += 8;
      v18 -= 32;
    }
    while (v18);
    uint64_t v17 = (unsigned int *)v21;
  }
  if (v17)
  {
    v21 = 0;
    int v22 = 0;
    WTF::fastFree((WTF *)v17, v15);
  }
  return (id)v16;
}

- (id)databasesWithOrigin:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
    [v3 _core];
    WebCore::DatabaseTracker::databaseNames();
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v15];
    if (v15)
    {
      uint64_t v6 = v14;
      uint64_t v7 = 8 * v15;
      do
      {
        WTF::makeNSArrayElement((uint64_t *)&cf, v6, v4);
        if (cf)
        {
          objc_msgSend(v5, "addObject:");
          CFTypeRef v8 = cf;
          CFTypeRef cf = 0;
          if (v8) {
            CFRelease(v8);
          }
        }
        uint64_t v6 = (WTF *)((char *)v6 + 8);
        v7 -= 8;
      }
      while (v7);
    }
    id v3 = (id)CFMakeCollectable(v5);
    if (v15)
    {
      uint64_t v10 = (WTF::StringImpl **)v14;
      uint64_t v11 = 8 * v15;
      do
      {
        objc_super v12 = *v10;
        *uint64_t v10 = 0;
        if (v12)
        {
          if (*(_DWORD *)v12 == 2) {
            WTF::StringImpl::destroy(v12, v9);
          }
          else {
            *(_DWORD *)v12 -= 2;
          }
        }
        ++v10;
        v11 -= 8;
      }
      while (v11);
    }
    if (v14) {
      WTF::fastFree(v14, v9);
    }
  }
  return v3;
}

- (id)detailsForDatabase:(id)a3 withOrigin:(id)a4
{
  v19[3] = *MEMORY[0x1E4F143B8];
  if (!a4) {
    return 0;
  }
  uint64_t v6 = (WebCore::DatabaseManager *)WebCore::DatabaseManager::singleton((WebCore::DatabaseManager *)self);
  MEMORY[0x1E4E442D0](&v13, a3);
  WebCore::DatabaseManager::detailsForNameAndOrigin((uint64_t *)&v14, v6, (const WTF::String *)&v13, (WebCore::SecurityOrigin *)[a4 _core]);
  CFTypeRef v8 = v13;
  v13 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
    {
      WTF::StringImpl::destroy(v8, v7);
      if (v14) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
    *(_DWORD *)v8 -= 2;
  }
  if (v14)
  {
LABEL_6:
    v18[0] = WebDatabaseDisplayNameKey;
    if (v15 && *((_DWORD *)v15 + 1)) {
      a3 = (id)WTF::StringImpl::operator NSString *();
    }
    v19[0] = a3;
    v18[1] = WebDatabaseExpectedSizeKey;
    v19[1] = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v16, v13);
    v18[2] = WebDatabaseUsageKey;
    v19[2] = [NSNumber numberWithUnsignedLongLong:v17];
    uint64_t v9 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
    uint64_t v10 = v15;
    unsigned int v15 = 0;
    if (!v10) {
      goto LABEL_16;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v9 = 0;
  uint64_t v10 = v15;
  unsigned int v15 = 0;
  if (!v10) {
    goto LABEL_16;
  }
LABEL_14:
  if (*(_DWORD *)v10 == 2)
  {
    WTF::StringImpl::destroy(v10, v7);
    uint64_t v11 = v14;
    uint64_t v14 = 0;
    if (!v11) {
      return v9;
    }
    goto LABEL_19;
  }
  *(_DWORD *)v10 -= 2;
LABEL_16:
  uint64_t v11 = v14;
  uint64_t v14 = 0;
  if (!v11) {
    return v9;
  }
LABEL_19:
  if (*(_DWORD *)v11 == 2) {
    WTF::StringImpl::destroy(v11, v7);
  }
  else {
    *(_DWORD *)v11 -= 2;
  }
  return v9;
}

- (void)deleteAllDatabases
{
  v2 = (WebCore::DatabaseTracker *)WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  WebCore::DatabaseTracker::deleteAllDatabasesImmediately(v2);
  id v3 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  v4 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v5 = [v4 objectForKey:WebDatabaseDirectoryDefaultsKey];
  if (!v5 || (uint64_t v6 = (__CFString *)v5, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
    uint64_t v6 = @"~/Library/WebKit/Databases";
  }
  uint64_t v7 = [(__CFString *)v6 stringByStandardizingPath];
  [v3 removeItemAtPath:v7 error:0];
}

- (BOOL)deleteOrigin:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  uint64_t v5 = [a3 _core] + 8;
  return MEMORY[0x1F416E040](v4, v5);
}

- (BOOL)deleteDatabase:(id)a3 withOrigin:(id)a4
{
  if (!a4) {
    return 0;
  }
  WebCore::DatabaseTracker::singleton((WebCore::DatabaseTracker *)self);
  [a4 _core];
  MEMORY[0x1E4E442D0](&v10, a3);
  char v7 = WebCore::DatabaseTracker::deleteDatabase();
  CFTypeRef v8 = v10;
  uint64_t v10 = 0;
  if (!v8) {
    return v7;
  }
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    return v7;
  }
  WTF::StringImpl::destroy(v8, v6);
  return v7;
}

- (void)deleteAllIndexedDatabases
{
  {
    uint64_t v2 = WebDatabaseProvider::singleton(void)::databaseProvider;
  }
  else
  {
    uint64_t v2 = WTF::fastMalloc((WTF *)0x18);
    *(_DWORD *)(v2 + 8) = 1;
    *(void *)uint64_t v2 = &unk_1F3C7C678;
    *(void *)(v2 + 16) = 0;
    WebDatabaseProvider::singleton(void)::databaseProvider = v2;
  }
  WebDatabaseProvider::deleteAllDatabases((void *)v2);
}

@end