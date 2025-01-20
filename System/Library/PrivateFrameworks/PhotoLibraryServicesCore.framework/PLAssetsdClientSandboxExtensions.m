@interface PLAssetsdClientSandboxExtensions
- (BOOL)consumeSandboxExtensions:(id)a3;
- (PLAssetsdClientSandboxExtensions)init;
- (void)_stopUsingSecurityScopedURLs;
- (void)dealloc;
@end

@implementation PLAssetsdClientSandboxExtensions

- (PLAssetsdClientSandboxExtensions)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLAssetsdClientSandboxExtensions;
  v2 = [(PLAssetsdClientSandboxExtensions *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    securityScopedURLs = v2->_securityScopedURLs;
    v2->_securityScopedURLs = v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (void)_stopUsingSecurityScopedURLs
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = self->_securityScopedURLs;
  objc_sync_enter(v3);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = self->_securityScopedURLs;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_securityScopedURLs, "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        [v8 stopAccessingSecurityScopedResource];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_securityScopedURLs removeAllObjects];
  objc_sync_exit(v3);
}

- (BOOL)consumeSandboxExtensions:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  uint64_t v5 = self->_securityScopedURLs;
  objc_sync_enter(v5);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__PLAssetsdClientSandboxExtensions_consumeSandboxExtensions___block_invoke;
  v7[3] = &unk_1E589FC78;
  v7[4] = self;
  v7[5] = &v8;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
  objc_sync_exit(v5);

  LOBYTE(v5) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)v5;
}

void __61__PLAssetsdClientSandboxExtensions_consumeSandboxExtensions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CB10];
  id v7 = a3;
  uint64_t v8 = [v6 fileURLWithPath:v5 isDirectory:1];
  MEMORY[0x19F38EE60](v8, v7);

  long long v9 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v5];

  if (!v9)
  {
    if ([v8 startAccessingSecurityScopedResource])
    {
      [*(id *)(*(void *)(a1 + 32) + 8) setObject:v8 forKeyedSubscript:v5];
    }
    else
    {
      uint64_t v10 = PLBackendGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        long long v12 = v8;
        _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_ERROR, "Unable to start accessing security scoped URL: %@", (uint8_t *)&v11, 0xCu);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
}

- (void)dealloc
{
  [(PLAssetsdClientSandboxExtensions *)self _stopUsingSecurityScopedURLs];
  v3.receiver = self;
  v3.super_class = (Class)PLAssetsdClientSandboxExtensions;
  [(PLAssetsdClientSandboxExtensions *)&v3 dealloc];
}

@end