@interface ICStorageManager
+ (id)sharedManager;
- (BOOL)cachingEnabled;
- (ICStorageManager)init;
- (unint64_t)storageSpaceAvailable;
- (void)ensureStorageIsAvailable:(unint64_t)a3 withCompletionHandler:(id)a4;
@end

@implementation ICStorageManager

- (void).cxx_destruct
{
}

- (void)ensureStorageIsAvailable:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__ICStorageManager_ensureStorageIsAvailable_withCompletionHandler___block_invoke;
  block[3] = &unk_1E5ACA780;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(accessQueue, block);
}

void __67__ICStorageManager_ensureStorageIsAvailable_withCompletionHandler___block_invoke(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 32) storageSpaceAvailable];
  unint64_t v3 = *(void *)(a1 + 48);
  if (v3 <= v2)
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v6();
  }
  else
  {
    v9[0] = @"/private/var";
    v8[0] = @"CACHE_DELETE_VOLUME";
    v8[1] = @"CACHE_DELETE_AMOUNT";
    v4 = [NSNumber numberWithUnsignedLongLong:v3 - v2];
    v8[2] = @"CACHE_DELETE_PURGE_TIMEOUT";
    v9[1] = v4;
    v9[2] = &unk_1EF640840;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

    id v7 = *(id *)(a1 + 40);
    CacheDeletePurgeSpaceWithInfo();
  }
}

void __67__ICStorageManager_ensureStorageIsAvailable_withCompletionHandler___block_invoke_16(uint64_t a1, void *a2)
{
  v4 = [a2 objectForKey:@"CACHE_DELETE_AMOUNT"];
  uint64_t v5 = [v4 unsignedLongLongValue];

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) storageSpaceAvailable];
    id v8 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(v6 + 16);
    v8(v6, v5, v7, 0);
  }
}

- (BOOL)cachingEnabled
{
  return MEMORY[0x1F410DC88](self, a2);
}

- (unint64_t)storageSpaceAvailable
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  unint64_t v3 = NSHomeDirectory();
  id v11 = 0;
  v4 = [v2 attributesOfFileSystemForPath:v3 error:&v11];
  id v5 = v11;

  if (v5)
  {
    uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v5;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_DEFAULT, "Failed to obtain system free space. err=%{public}@", buf, 0xCu);
    }
  }
  uint64_t v7 = [v4 objectForKey:*MEMORY[0x1E4F283A0]];
  unint64_t v8 = [v7 unsignedLongLongValue];

  if (v8 >= 0x1F400000) {
    unint64_t v9 = v8 - 524288000;
  }
  else {
    unint64_t v9 = 0;
  }

  return v9;
}

- (ICStorageManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICStorageManager;
  unint64_t v2 = [(ICStorageManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunescloud.ICStorageManager.accessQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_6995);
  }
  unint64_t v2 = (void *)sharedManager___sharedManager;

  return v2;
}

uint64_t __33__ICStorageManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(ICStorageManager);
  uint64_t v1 = sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end