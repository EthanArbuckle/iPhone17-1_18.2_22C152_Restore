@interface MAAutoAssetAuthorizationPolicy
+ (BOOL)consumeSandboxExtension:(id)a3 forPath:(id)a4;
+ (id)_existingSandboxExtensions;
@end

@implementation MAAutoAssetAuthorizationPolicy

+ (id)_existingSandboxExtensions
{
  if (_existingSandboxExtensions_existingSandboxExtensionsOnceToken != -1) {
    dispatch_once(&_existingSandboxExtensions_existingSandboxExtensionsOnceToken, &__block_literal_global_8);
  }
  v2 = (void *)_existingSandboxExtensions_activeExtensions;
  return v2;
}

uint64_t __60__MAAutoAssetAuthorizationPolicy__existingSandboxExtensions__block_invoke()
{
  _existingSandboxExtensions_activeExtensions = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  return MEMORY[0x1F41817F8]();
}

+ (BOOL)consumeSandboxExtension:(id)a3 forPath:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [a3 UTF8String];
  v7 = +[MAAutoAssetAuthorizationPolicy _existingSandboxExtensions];
  v8 = v7;
  if (v5 && [v7 containsObject:v5])
  {
    v9 = [MEMORY[0x1E4FA56C8] sharedLogger];
    v10 = [v9 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138543362;
      id v16 = v5;
      _os_log_impl(&dword_1B275B000, v10, OS_LOG_TYPE_DEFAULT, "{MAAutoAssetAuthorizationPolicy}(consumeSandboxExtensionFromMessage) found existing consumed sandbox extension for path %{public}@", (uint8_t *)&v15, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!v6)
  {
    v13 = [MEMORY[0x1E4FA56C8] sharedLogger];
    v10 = [v13 oslog];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAssetAuthorizationPolicy consumeSandboxExtension:forPath:]((uint64_t)v5, v10);
    }
    goto LABEL_15;
  }
  uint64_t v11 = sandbox_extension_consume();
  v12 = [MEMORY[0x1E4FA56C8] sharedLogger];
  v10 = [v12 oslog];

  if (v11 == -1)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAssetAuthorizationPolicy consumeSandboxExtension:forPath:]((uint64_t)v5, v10);
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543362;
    id v16 = v5;
    _os_log_impl(&dword_1B275B000, v10, OS_LOG_TYPE_DEFAULT, "{MAAutoAssetAuthorizationPolicy}(consumeSandboxExtensionFromMessage) consumed sandbox extension for path %{public}@", (uint8_t *)&v15, 0xCu);
  }

  if (v5) {
    [v8 addObject:v5];
  }
LABEL_16:

  return 1;
}

+ (void)consumeSandboxExtension:(uint64_t)a1 forPath:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B275B000, a2, OS_LOG_TYPE_ERROR, "{MAAutoAssetAuthorizationPolicy}(consumeSandboxExtensionFromMessage) unable to consume sandbox extension as there is no extension available for path %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)consumeSandboxExtension:(uint64_t)a1 forPath:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = __error();
  id v5 = strerror(*v4);
  int v6 = *__error();
  int v7 = 136315650;
  v8 = v5;
  __int16 v9 = 1024;
  int v10 = v6;
  __int16 v11 = 2114;
  uint64_t v12 = a1;
  _os_log_error_impl(&dword_1B275B000, a2, OS_LOG_TYPE_ERROR, "{MAAutoAssetAuthorizationPolicy}(consumeSandboxExtensionFromMessage) unable to consume sandbox extension with errno %s (%d) for path %{public}@", (uint8_t *)&v7, 0x1Cu);
}

@end