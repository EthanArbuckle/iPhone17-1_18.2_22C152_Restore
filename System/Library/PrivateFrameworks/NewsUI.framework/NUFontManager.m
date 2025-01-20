@interface NUFontManager
- (BOOL)registerFontWithURL:(id)a3 error:(id *)a4;
- (BOOL)shouldUnregisterFontWithURL:(id)a3;
- (BOOL)unregisterFontAtURL:(id)a3 error:(id *)a4;
- (NSCountedSet)referenceCounts;
- (NUFontManager)init;
- (OS_dispatch_queue)registrationQueue;
- (unint64_t)referenceCountForFontWithURL:(id)a3;
- (void)decreaseReferenceCountForFontWithURL:(id)a3;
- (void)increaseReferenceCountForFontWithURL:(id)a3;
- (void)unregisterFontWithURL:(id)a3;
@end

@implementation NUFontManager

- (NUFontManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)NUFontManager;
  v2 = [(NUFontManager *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFFFFFE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.news.font.registration", v3);
    registrationQueue = v2->_registrationQueue;
    v2->_registrationQueue = (OS_dispatch_queue *)v4;

    v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x263F08760]);
    referenceCounts = v2->_referenceCounts;
    v2->_referenceCounts = v6;
  }
  return v2;
}

- (BOOL)registerFontWithURL:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = NUSharedLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_2221C5000, v7, OS_LOG_TYPE_DEFAULT, "Registering font at URL %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  v8 = [(NUFontManager *)self registrationQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __43__NUFontManager_registerFontWithURL_error___block_invoke;
  v12[3] = &unk_2645FE448;
  v12[4] = self;
  id v13 = v6;
  p_long long buf = &buf;
  v15 = a4;
  id v9 = v6;
  dispatch_sync(v8, v12);

  BOOL v10 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);
  return v10;
}

void __43__NUFontManager_registerFontWithURL_error___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (![*(id *)(a1 + 32) referenceCountForFontWithURL:*(void *)(a1 + 40)])
  {
    CFErrorRef error = 0;
    if (!CTFontManagerRegisterFontsForURL(*(CFURLRef *)(a1 + 40), kCTFontManagerScopeProcess, &error))
    {
      CFIndex Code = CFErrorGetCode(error);
      if (Code == 105 || (CFIndex v3 = Code, Code == 305))
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
      else
      {
        if (*(void *)(a1 + 56))
        {
          **(void **)(a1 + 56) = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F03AE0] code:Code userInfo:0];
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        dispatch_queue_t v4 = NUSharedLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v5 = *(void *)(a1 + 40);
          *(_DWORD *)long long buf = 138543618;
          uint64_t v10 = v5;
          __int16 v11 = 2048;
          CFIndex v12 = v3;
          _os_log_impl(&dword_2221C5000, v4, OS_LOG_TYPE_DEFAULT, "Font registration failed for font at URL %{public}@ with error code %lu", buf, 0x16u);
        }
      }
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v6 = NUSharedLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v10 = v7;
      _os_log_impl(&dword_2221C5000, v6, OS_LOG_TYPE_DEFAULT, "Font registration succeeded for font at URL %{public}@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) increaseReferenceCountForFontWithURL:*(void *)(a1 + 40)];
  }
}

- (void)unregisterFontWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NUFontManager *)self registrationQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__NUFontManager_unregisterFontWithURL___block_invoke;
  v7[3] = &unk_2645FE470;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

uint64_t __39__NUFontManager_unregisterFontWithURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) decreaseReferenceCountForFontWithURL:*(void *)(a1 + 40)];
}

- (BOOL)unregisterFontAtURL:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CFURLRef v5 = (const __CFURL *)a3;
  id v6 = NUSharedLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    CFURLRef v14 = v5;
    _os_log_impl(&dword_2221C5000, v6, OS_LOG_TYPE_DEFAULT, "Unregister font at URL %{public}@", buf, 0xCu);
  }

  CFErrorRef error = 0;
  BOOL v7 = 1;
  if (!CTFontManagerUnregisterFontsForURL(v5, kCTFontManagerScopeProcess, &error))
  {
    CFIndex Code = CFErrorGetCode(error);
    CFIndex v9 = Code;
    if (!a4 || Code == 201)
    {
      BOOL v7 = Code == 201;
    }
    else
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F03AE0] code:Code userInfo:0];
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v10 = NUSharedLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      CFURLRef v14 = v5;
      __int16 v15 = 2048;
      CFIndex v16 = v9;
      _os_log_impl(&dword_2221C5000, v10, OS_LOG_TYPE_DEFAULT, "Unable to unregister font at URL %{public}@ with error %lu", buf, 0x16u);
    }
  }
  return v7;
}

- (void)increaseReferenceCountForFontWithURL:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFURLRef v5 = NUSharedLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl(&dword_2221C5000, v5, OS_LOG_TYPE_DEFAULT, "Increase reference count for font at URL %{public}@", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(NUFontManager *)self referenceCounts];
  [v6 addObject:v4];
}

- (void)decreaseReferenceCountForFontWithURL:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFURLRef v5 = NUSharedLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v9 = v4;
    _os_log_impl(&dword_2221C5000, v5, OS_LOG_TYPE_DEFAULT, "Decrease reference count for font at URL %{public}@", buf, 0xCu);
  }

  id v6 = [(NUFontManager *)self referenceCounts];
  [v6 removeObject:v4];

  if ([(NUFontManager *)self shouldUnregisterFontWithURL:v4])
  {
    uint64_t v7 = 0;
    [(NUFontManager *)self unregisterFontAtURL:v4 error:&v7];
  }
}

- (unint64_t)referenceCountForFontWithURL:(id)a3
{
  id v4 = a3;
  CFURLRef v5 = [(NUFontManager *)self referenceCounts];
  unint64_t v6 = [v5 countForObject:v4];

  return v6;
}

- (BOOL)shouldUnregisterFontWithURL:(id)a3
{
  return [(NUFontManager *)self referenceCountForFontWithURL:a3] == 0;
}

- (OS_dispatch_queue)registrationQueue
{
  return self->_registrationQueue;
}

- (NSCountedSet)referenceCounts
{
  return self->_referenceCounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceCounts, 0);

  objc_storeStrong((id *)&self->_registrationQueue, 0);
}

@end