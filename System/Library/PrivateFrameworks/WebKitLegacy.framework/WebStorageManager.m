@interface WebStorageManager
+ (id)_storageDirectoryPath;
+ (id)sharedWebStorageManager;
+ (void)setStorageDatabaseIdleInterval:(double)a3;
- (WebStorageManager)init;
- (id)origins;
- (unint64_t)diskUsageForOrigin:(id)a3;
- (void)deleteAllOrigins;
- (void)deleteOrigin:(id)a3;
- (void)syncFileSystemAndTrackerDatabase;
@end

@implementation WebStorageManager

+ (id)sharedWebStorageManager
{
  if (_MergedGlobals_25 == 1) {
    return (id)qword_1EB3A9868;
  }
  id result = objc_alloc_init(WebStorageManager);
  qword_1EB3A9868 = (uint64_t)result;
  _MergedGlobals_25 = 1;
  return result;
}

- (WebStorageManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)WebStorageManager;
  v2 = [(WebStorageManager *)&v4 init];
  if (v2) {
    WebKitInitializeStorageIfNecessary();
  }
  return v2;
}

- (id)origins
{
  uint64_t v2 = WebKit::StorageTracker::tracker((WebKit::StorageTracker *)self);
  WebKit::StorageTracker::origins(v2, (uint64_t)&v21);
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  objc_super v4 = (void *)[v3 initWithCapacity:v23];
  if (v23)
  {
    v5 = v21;
    uint64_t v6 = 32 * v23;
    while (1)
    {
      v7 = [WebSecurityOrigin alloc];
      WebCore::SecurityOriginData::securityOrigin((uint64_t *)&v24, v5);
      uint64_t v8 = [(WebSecurityOrigin *)v7 _initWithWebCoreSecurityOrigin:v24];
      v10 = (const void *)v8;
      v11 = v24;
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
    v12 = (WTF::StringImpl *)*((void *)v11 + 6);
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
      ((void (*)(char *, char *))off_1F3C7D7D8[v14])(&v25, (char *)v11 + 8);
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
  v17 = (unsigned int *)v21;
  if (v23)
  {
    uint64_t v18 = 32 * v23;
    do
    {
      uint64_t v19 = v17[6];
      if (v19 != -1) {
        ((void (*)(WTF **, unsigned int *))off_1F3C7D7D8[v19])(&v24, v17);
      }
      v17[6] = -1;
      v17 += 8;
      v18 -= 32;
    }
    while (v18);
    v17 = (unsigned int *)v21;
  }
  if (v17)
  {
    v21 = 0;
    int v22 = 0;
    WTF::fastFree((WTF *)v17, v15);
  }
  return (id)v16;
}

- (void)deleteAllOrigins
{
  uint64_t v2 = (atomic_uchar *)WebKit::StorageTracker::tracker((WebKit::StorageTracker *)self);
  WebKit::StorageTracker::deleteAllOrigins(v2);
  id v3 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = +[WebStorageManager _storageDirectoryPath];
  [v3 removeItemAtPath:v4 error:0];
}

- (void)deleteOrigin:(id)a3
{
  id v4 = (WTF::StringImpl *)WebKit::StorageTracker::tracker((WebKit::StorageTracker *)self);
  v5 = (const WebCore::SecurityOriginData *)([a3 _core] + 8);
  WebKit::StorageTracker::deleteOrigin(v4, v5);
}

- (unint64_t)diskUsageForOrigin:(id)a3
{
  id v4 = (WebKit::StorageTracker *)WebKit::StorageTracker::tracker((WebKit::StorageTracker *)self);
  v5 = (WebCore::SecurityOrigin *)[a3 _core];
  return WebKit::StorageTracker::diskUsageForOrigin(v4, v5);
}

- (void)syncFileSystemAndTrackerDatabase
{
  uint64_t v2 = (atomic_uchar *)WebKit::StorageTracker::tracker((WebKit::StorageTracker *)self);
  WebKit::StorageTracker::syncFileSystemAndTrackerDatabase(v2);
}

+ (id)_storageDirectoryPath
{
  if (byte_1EB3A9861)
  {
    if (qword_1EB3A9878 == -1) {
      return (id)qword_1EB3A9870;
    }
  }
  else
  {
    qword_1EB3A9870 = 0;
    byte_1EB3A9861 = 1;
    if (qword_1EB3A9878 == -1) {
      return (id)qword_1EB3A9870;
    }
  }
  dispatch_once(&qword_1EB3A9878, &__block_literal_global_5);
  return (id)qword_1EB3A9870;
}

void __42__WebStorageManager__storageDirectoryPath__block_invoke()
{
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"WebKitLocalStorageDatabasePathPreferenceKey");
  v1 = v0;
  if (!v0 || (CFRetain(v0), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v2 = objc_msgSend(-[NSArray objectAtIndex:](NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1), "objectAtIndex:", 0), "stringByAppendingPathComponent:", @"WebKit/LocalStorage");
    id v3 = v2;
    if (v2) {
      CFRetain(v2);
    }
    if (v1) {
      CFRelease(v1);
    }
    v1 = v3;
  }
  id v4 = (const void *)[v1 stringByStandardizingPath];
  uint64_t v5 = (uint64_t)v4;
  if (v4) {
    CFRetain(v4);
  }
  uint64_t v6 = (const void *)qword_1EB3A9870;
  qword_1EB3A9870 = v5;
  if (v6) {
    CFRelease(v6);
  }
  if (v1)
  {
    CFRelease(v1);
  }
}

+ (void)setStorageDatabaseIdleInterval:(double)a3
{
  *(double *)(WebKit::StorageTracker::tracker((WebKit::StorageTracker *)a1) + 136) = a3;
}

@end