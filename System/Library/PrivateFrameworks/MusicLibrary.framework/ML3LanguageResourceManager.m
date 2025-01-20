@interface ML3LanguageResourceManager
+ (ML3LanguageResourceManager)sharedResourceManager;
- (ML3LanguageResources)cachedResources;
- (ML3LanguageResources)resources;
- (OS_dispatch_queue)serialQueue;
- (id)_buildLanguageResources;
- (id)_init;
- (void)invalidateCachedResources;
- (void)setCachedResources:(id)a3;
- (void)setSerialQueue:(id)a3;
@end

@implementation ML3LanguageResourceManager

- (ML3LanguageResources)resources
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__25298;
  v10 = __Block_byref_object_dispose__25299;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__ML3LanguageResourceManager_resources__block_invoke;
  v5[3] = &unk_1E5FB8360;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ML3LanguageResources *)v3;
}

+ (ML3LanguageResourceManager)sharedResourceManager
{
  if (sharedResourceManager___once != -1) {
    dispatch_once(&sharedResourceManager___once, &__block_literal_global_25308);
  }
  v2 = (void *)sharedResourceManager___sharedResourceManager;

  return (ML3LanguageResourceManager *)v2;
}

void __39__ML3LanguageResourceManager_resources__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[1])
  {
    if (__daemonProcessInfo)
    {
      uint64_t v3 = [v2 _buildLanguageResources];
      uint64_t v4 = *(void *)(a1 + 32);
      v5 = *(void **)(v4 + 8);
      *(void *)(v4 + 8) = v3;
    }
    else
    {
      uint64_t v6 = +[MLMediaLibraryService sharedMediaLibraryService];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __39__ML3LanguageResourceManager_resources__block_invoke_2;
      v7[3] = &unk_1E5FB8068;
      v7[4] = *(void *)(a1 + 32);
      [v6 getLanguageResourcesWithCompletion:v7];
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 8));
}

void __39__ML3LanguageResourceManager_resources__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543362;
      id v13 = v7;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "Error fetching language resources. (Error = %{public}@) Falling back to building resources in-process.", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v9 = [*(id *)(a1 + 32) _buildLanguageResources];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 8);
    *(void *)(v10 + 8) = v9;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), a2);
  }
}

uint64_t __51__ML3LanguageResourceManager_sharedResourceManager__block_invoke()
{
  sharedResourceManager___sharedResourceManager = [[ML3LanguageResourceManager alloc] _init];

  return MEMORY[0x1F41817F8]();
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)ML3LanguageResourceManager;
  v2 = [(ML3LanguageResourceManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MusicLibrary.ML3LanguageResourceManager", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_cachedResources, 0);
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setCachedResources:(id)a3
{
}

- (ML3LanguageResources)cachedResources
{
  return self->_cachedResources;
}

- (id)_buildLanguageResources
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E4F1D3B8]);
  CFArrayRef v3 = (const __CFArray *)CFPreferencesCopyAppValue(@"AppleLanguages", v2);
  if (v3)
  {
    CFArrayRef v4 = v3;
    if (CFArrayGetCount(v3) <= 0)
    {
      CFRelease(v4);
    }
    else
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v4, 0);
      CanonicalLanguageIdentifierFromString = (__CFString *)CFLocaleCreateCanonicalLanguageIdentifierFromString((CFAllocatorRef)*MEMORY[0x1E4F1CF80], ValueAtIndex);
      CFRelease(v4);
      if (CanonicalLanguageIdentifierFromString) {
        goto LABEL_7;
      }
    }
  }
  CanonicalLanguageIdentifierFromString = @"en";
LABEL_7:
  id v7 = +[ML3MusicLibrary pathForResourceFileOrFolder:16];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v7];
  uint64_t v9 = +[ML3MusicLibrary pathForResourceFileOrFolder:17];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v9];
  id v11 = [[ML3LanguageResources alloc] initWithSectionsInfo:v8 sortingDetails:v10 canonicalLanguageIdentifier:CanonicalLanguageIdentifierFromString];

  return v11;
}

- (void)invalidateCachedResources
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__ML3LanguageResourceManager_invalidateCachedResources__block_invoke;
  block[3] = &unk_1E5FB8298;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __55__ML3LanguageResourceManager_invalidateCachedResources__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFStringRef v2 = *(void **)(v1 + 8);
  *(void *)(v1 + 8) = 0;
}

@end