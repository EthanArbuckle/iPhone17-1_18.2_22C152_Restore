@interface PRSPosterConfigurationCacheProvider
- (NSData)lastActiveHomePoster;
- (NSData)lastActiveLockPoster;
- (PRSPosterConfigurationCacheProvider)initWithCachingReason:(id)a3;
- (id)_homeURL;
- (id)_lockURL;
- (id)_lock_readAtURL:(id)a3;
- (void)_lock_removeAtURL:(id)a3;
- (void)_lock_setupSharedWorkspaceIfNeeded;
- (void)_lock_writeData:(id)a3 atURL:(id)a4;
- (void)removeCaches;
- (void)setLastActiveHomePoster:(id)a3;
- (void)setLastActiveLockPoster:(id)a3;
@end

@implementation PRSPosterConfigurationCacheProvider

- (PRSPosterConfigurationCacheProvider)initWithCachingReason:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRSPosterConfigurationCacheProvider;
  v5 = [(PRSPosterConfigurationCacheProvider *)&v11 init];
  if (v5)
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    v6 = (void (*)(void))getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_ptr;
    v16 = getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_ptr;
    if (!getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_ptr)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_block_invoke;
      v12[3] = &unk_1E5D007B0;
      v12[4] = &v13;
      __getPBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURLSymbolLoc_block_invoke((uint64_t)v12);
      v6 = (void (*)(void))v14[3];
    }
    _Block_object_dispose(&v13, 8);
    if (!v6) {
      -[PRSPosterConfigurationCacheProvider initWithCachingReason:]();
    }
    v7 = v6();
    uint64_t v8 = [v7 URLByAppendingPathComponent:v4];
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v8;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (NSData)lastActiveLockPoster
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(PRSPosterConfigurationCacheProvider *)self _lockURL];
  v5 = [(PRSPosterConfigurationCacheProvider *)self _lock_readAtURL:v4];

  os_unfair_lock_unlock(p_lock);
  return (NSData *)v5;
}

- (NSData)lastActiveHomePoster
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(PRSPosterConfigurationCacheProvider *)self _homeURL];
  v5 = [(PRSPosterConfigurationCacheProvider *)self _lock_readAtURL:v4];

  os_unfair_lock_unlock(p_lock);
  return (NSData *)v5;
}

- (void)setLastActiveLockPoster:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = [(PRSPosterConfigurationCacheProvider *)self _lockURL];
  [(PRSPosterConfigurationCacheProvider *)self _lock_writeData:v5 atURL:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)setLastActiveHomePoster:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = [(PRSPosterConfigurationCacheProvider *)self _homeURL];
  [(PRSPosterConfigurationCacheProvider *)self _lock_writeData:v5 atURL:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeCaches
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(PRSPosterConfigurationCacheProvider *)self _lockURL];
  [(PRSPosterConfigurationCacheProvider *)self _lock_removeAtURL:v4];

  id v5 = [(PRSPosterConfigurationCacheProvider *)self _homeURL];
  [(PRSPosterConfigurationCacheProvider *)self _lock_removeAtURL:v5];

  os_unfair_lock_unlock(p_lock);
}

- (id)_lock_readAtURL:(id)a3
{
  id v3 = a3;
  id v14 = 0;
  int v4 = [v3 checkResourceIsReachableAndReturnError:&v14];
  id v5 = v14;
  v6 = v5;
  if (v4)
  {
    id v13 = 0;
    v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3 options:1 error:&v13];
    id v8 = v13;
    v9 = v8;
    if (v7) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v8 == 0;
    }
    if (v10) {
      goto LABEL_15;
    }
    objc_super v11 = PRSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PRSPosterConfigurationCacheProvider _lock_readAtURL:]();
    }
  }
  else
  {
    if (!v5)
    {
      v9 = 0;
      goto LABEL_14;
    }
    objc_super v11 = PRSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PRSPosterConfigurationCacheProvider _lock_readAtURL:]();
    }
    v9 = 0;
  }

LABEL_14:
  v7 = 0;
LABEL_15:

  return v7;
}

- (void)_lock_writeData:(id)a3 atURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(PRSPosterConfigurationCacheProvider *)self _lock_setupSharedWorkspaceIfNeeded];
  id v10 = 0;
  LOBYTE(self) = [v7 writeToURL:v6 options:268435457 error:&v10];

  id v8 = v10;
  if ((self & 1) == 0)
  {
    v9 = PRSLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PRSPosterConfigurationCacheProvider _lock_writeData:atURL:]();
    }
  }
}

- (void)_lock_removeAtURL:(id)a3
{
  id v3 = a3;
  int v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  char v5 = [v4 removeItemAtURL:v3 error:&v9];
  id v6 = v9;
  id v7 = v6;
  if ((v5 & 1) == 0 && v6)
  {
    id v8 = PRSLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[PRSPosterConfigurationCacheProvider _lock_removeAtURL:]();
    }
  }
}

- (void)_lock_setupSharedWorkspaceIfNeeded
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  char v5 = v3;
  _os_log_error_impl(&dword_1A78AC000, a2, OS_LOG_TYPE_ERROR, "Error setting up shared workspace: %@", (uint8_t *)&v4, 0xCu);
}

- (id)_lockURL
{
  return [(NSURL *)self->_baseURL URLByAppendingPathComponent:@"lock" isDirectory:0];
}

- (id)_homeURL
{
  return [(NSURL *)self->_baseURL URLByAppendingPathComponent:@"home" isDirectory:0];
}

- (void).cxx_destruct
{
}

- (void)initWithCachingReason:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSURL *soft_PBUIWallpaperSharedDirectoryDataStoreSharedDirectoryURL(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"PRSPosterConfigurationCacheProvider.m", 18, @"%s", dlerror());

  __break(1u);
}

- (void)_lock_readAtURL:.cold.1()
{
  OUTLINED_FUNCTION_2();
  v1 = [v0 localizedDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A78AC000, v2, v3, "Error reading data from URL. Error: %@, URL: %@", v4, v5, v6, v7, v8);
}

- (void)_lock_readAtURL:.cold.2()
{
  OUTLINED_FUNCTION_2();
  v1 = [v0 localizedDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A78AC000, v2, v3, "Error reaching resource at URL. Error: %@, URL: %@", v4, v5, v6, v7, v8);
}

- (void)_lock_writeData:atURL:.cold.1()
{
  OUTLINED_FUNCTION_2();
  v1 = [v0 localizedDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A78AC000, v2, v3, "Error writing data to URL. Error: %@, URL: %@", v4, v5, v6, v7, v8);
}

- (void)_lock_removeAtURL:.cold.1()
{
  OUTLINED_FUNCTION_2();
  v1 = [v0 localizedDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1A78AC000, v2, v3, "Error removing item at URL. Error: %@, URL: %@", v4, v5, v6, v7, v8);
}

@end