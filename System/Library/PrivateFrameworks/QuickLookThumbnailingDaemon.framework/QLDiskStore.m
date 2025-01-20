@interface QLDiskStore
+ (id)diskStoreForURL:(id)a3;
+ (id)diskStores;
- (BOOL)acceptsThumbnails;
- (BOOL)distant;
- (BOOL)encrypted;
- (BOOL)hasThumbnailCache;
- (BOOL)isExternalEncrypted;
- (QLDiskStore)initWithURL:(id)a3;
- (const)mountPath;
- (id)description;
- (statfs)fs_stat;
- (unint64_t)availableDiskSpace;
- (unsigned)disableCache;
- (unsigned)disableQuickLook;
- (void)executeBlock:(id)a3 onQueue:(id)a4;
- (void)setDisableCache:(unsigned __int8)a3;
- (void)setDisableQuickLook:(unsigned __int8)a3;
- (void)setFs_stat:(statfs *)a3;
- (void)setIsExternalEncrypted:(BOOL)a3;
@end

@implementation QLDiskStore

- (QLDiskStore)initWithURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CFURLRef v4 = (const __CFURL *)a3;
  v13.receiver = self;
  v13.super_class = (Class)QLDiskStore;
  v5 = [(QLDiskStore *)&v13 init];
  if (!v5) {
    goto LABEL_10;
  }
  memset(&__src, 0, 512);
  if (!CFURLGetFileSystemRepresentation(v4, 1u, buffer, 1024))
  {
    v6 = _log_2();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[QLDiskStore initWithURL:]((uint64_t)v4, v6);
    }
    goto LABEL_8;
  }
  if (!statfs((const char *)buffer, &__src))
  {
    memcpy(&v5->_fs_stat, &__src, sizeof(v5->_fs_stat));
    CFDictionarySetValue((CFMutableDictionaryRef)diskStores, &v5->_fs_stat.f_fsid, v5);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.quicklook.diskstore.inited", v8);
    afterInit = v5->_afterInit;
    v5->_afterInit = (OS_dispatch_queue *)v9;

    v11 = v5->_afterInit;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__QLDiskStore_initWithURL___block_invoke;
    block[3] = &unk_1E6D0CA70;
    v15 = v5;
    memcpy(v16, &__src, sizeof(v16));
    dispatch_async(v11, block);

LABEL_10:
    v7 = v5;
    goto LABEL_11;
  }
  v6 = _log_2();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[QLDiskStore initWithURL:]();
  }
LABEL_8:

  v7 = 0;
LABEL_11:

  return v7;
}

uint64_t __27__QLDiskStore_initWithURL___block_invoke(uint64_t a1)
{
  v2 = (char *)(a1 + 128);
  objc_msgSend(*(id *)(a1 + 32), "setDisableQuickLook:", file_exists((char *)(a1 + 128), ".ql_disablethumbnails"));
  if ([*(id *)(a1 + 32) disableQuickLook]) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = file_exists(v2, ".ql_disablecache");
  }
  [*(id *)(a1 + 32) setDisableCache:v3];
  uint64_t result = [*(id *)(a1 + 32) disableQuickLook];
  if (!result)
  {
    v5 = *(void **)(a1 + 32);
    return [v5 disableCache];
  }
  return result;
}

+ (id)diskStoreForURL:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(&v10, 0, 512);
  if (([v4 getFileSystemRepresentation:v9 maxLength:1024] & 1) == 0)
  {
    v5 = _log_2();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[QLDiskStore initWithURL:]((uint64_t)v4, v5);
    }
    goto LABEL_7;
  }
  if (statfs(v9, &v10))
  {
    v5 = _log_2();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[QLDiskStore initWithURL:]();
    }
LABEL_7:

    v6 = 0;
    goto LABEL_8;
  }
  pthread_mutex_lock(&lock);
  CFDictionaryRef Mutable = (const __CFDictionary *)diskStores;
  if (!diskStores)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kDiskStoresKeyCallback, MEMORY[0x1E4F1D540]);
    diskStores = (uint64_t)Mutable;
  }
  v6 = CFDictionaryGetValue(Mutable, &v10.f_fsid);
  if (!v6) {
    v6 = (void *)[objc_alloc((Class)a1) initWithURL:v4];
  }
  pthread_mutex_unlock(&lock);
LABEL_8:

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<QLDiskStore %s>", -[QLDiskStore mountPath](self, "mountPath"));
}

- (void)executeBlock:(id)a3 onQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  afterInit = self->_afterInit;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__QLDiskStore_executeBlock_onQueue___block_invoke;
  v11[3] = &unk_1E6D0CA98;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(afterInit, v11);
}

void __36__QLDiskStore_executeBlock_onQueue___block_invoke(uint64_t a1)
{
}

- (BOOL)acceptsThumbnails
{
  return self->_disableQuickLook == 0;
}

- (BOOL)hasThumbnailCache
{
  return self->_disableCache == 0;
}

- (BOOL)distant
{
  return (self->_fs_stat.f_flags & 0x1000) == 0 && strcmp("/", self->_fs_stat.f_mntonname) != 0;
}

- (BOOL)isExternalEncrypted
{
  return self->_isExternalEncrypted;
}

- (unint64_t)availableDiskSpace
{
  return self->_fs_stat.f_bavail * self->_fs_stat.f_bsize;
}

- (const)mountPath
{
  return self->_fs_stat.f_mntonname;
}

+ (id)diskStores
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = MEMORY[0x1E01C5350](0, 0, 0);
  if (v3)
  {
    id v4 = (const void *)v3;
    uint64_t v11 = 0;
    while (1)
    {
      do
        uint64_t v5 = MEMORY[0x1E01C5360](v4, &v11, 0);
      while (v5 == 3);
      if (v5 == 2) {
        break;
      }
      id v6 = [QLDiskStore alloc];
      id v7 = [(QLDiskStore *)v6 initWithURL:v11];
      v8 = _log_2();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if (v7)
      {
        if (v9)
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v13 = v11;
          __int16 v14 = 2112;
          v15 = v7;
          _os_log_error_impl(&dword_1DDC5E000, v8, OS_LOG_TYPE_ERROR, "Getting store for %@: %@", buf, 0x16u);
        }

        [v2 addObject:v7];
      }
      else
      {
        if (v9)
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v13 = v11;
          _os_log_error_impl(&dword_1DDC5E000, v8, OS_LOG_TYPE_ERROR, "No store for %@", buf, 0xCu);
        }
      }
    }
    CFRelease(v4);
  }
  return v2;
}

- (BOOL)encrypted
{
  return self->_encrypted;
}

- (unsigned)disableQuickLook
{
  return self->_disableQuickLook;
}

- (void)setDisableQuickLook:(unsigned __int8)a3
{
  self->_disableQuickLook = a3;
}

- (unsigned)disableCache
{
  return self->_disableCache;
}

- (void)setDisableCache:(unsigned __int8)a3
{
  self->_disableCache = a3;
}

- (void)setIsExternalEncrypted:(BOOL)a3
{
  self->_isExternalEncrypted = a3;
}

- (statfs)fs_stat
{
  objc_copyStruct(retstr, &self->_fs_stat, 2168, 1, 0);
  return result;
}

- (void)setFs_stat:(statfs *)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DDC5E000, a2, OS_LOG_TYPE_ERROR, "Can't get file system representation for %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithURL:.cold.2()
{
  __error();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_0_1(&dword_1DDC5E000, v0, v1, "Can't get FS stat for %s: %i", v2, v3, v4, v5, v6);
}

@end