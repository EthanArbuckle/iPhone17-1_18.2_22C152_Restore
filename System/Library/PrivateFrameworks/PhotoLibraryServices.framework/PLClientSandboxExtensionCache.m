@interface PLClientSandboxExtensionCache
- (BOOL)containsURL:(id)a3;
- (NSMutableOrderedSet)sandboxExtensionURLs;
- (PLClientSandboxExtensionCache)initWithCacheLimit:(unint64_t)a3;
- (id)urlByStrippingFragmentFromURL:(id)a3;
- (unint64_t)cacheLimit;
- (void)insertSandboxedURL:(id)a3;
- (void)setSandboxExtensionURLs:(id)a3;
@end

@implementation PLClientSandboxExtensionCache

- (void).cxx_destruct
{
}

- (void)setSandboxExtensionURLs:(id)a3
{
}

- (NSMutableOrderedSet)sandboxExtensionURLs
{
  return self->_sandboxExtensionURLs;
}

- (unint64_t)cacheLimit
{
  return self->_cacheLimit;
}

- (id)urlByStrippingFragmentFromURL:(id)a3
{
  id v3 = a3;
  v4 = [v3 fragment];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    v6 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:0];
    [v6 setFragment:0];
    id v7 = [v6 URL];
  }
  else
  {
    id v7 = v3;
  }

  return v7;
}

- (BOOL)containsURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && ([v4 path], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    sandboxExtensionURLs = self->_sandboxExtensionURLs;
    v9 = [(PLClientSandboxExtensionCache *)self urlByStrippingFragmentFromURL:v5];
    uint64_t v10 = [(NSMutableOrderedSet *)sandboxExtensionURLs indexOfObject:v9];

    BOOL v11 = v10 != 0x7FFFFFFFFFFFFFFFLL;
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = self->_sandboxExtensionURLs;
      v13 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v10];
      [(NSMutableOrderedSet *)v12 moveObjectsAtIndexes:v13 toIndex:0];
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)insertSandboxedURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    uint64_t v5 = [v4 path];

    id v4 = v9;
    if (v5)
    {
      os_unfair_lock_lock(&self->_lock);
      uint64_t v6 = [(NSMutableOrderedSet *)self->_sandboxExtensionURLs indexOfObject:v9];
      sandboxExtensionURLs = self->_sandboxExtensionURLs;
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [(NSMutableOrderedSet *)self->_sandboxExtensionURLs insertObject:v9 atIndex:0];
      }
      else
      {
        v8 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v6];
        [(NSMutableOrderedSet *)sandboxExtensionURLs moveObjectsAtIndexes:v8 toIndex:0];
      }
      if ([(NSMutableOrderedSet *)self->_sandboxExtensionURLs count] > self->_cacheLimit) {
        [(NSMutableOrderedSet *)self->_sandboxExtensionURLs removeObjectAtIndex:[(NSMutableOrderedSet *)self->_sandboxExtensionURLs count] - 1];
      }
      os_unfair_lock_unlock(&self->_lock);
      id v4 = v9;
    }
  }
}

- (PLClientSandboxExtensionCache)initWithCacheLimit:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLClientSandboxExtensionCache;
  id v4 = [(PLClientSandboxExtensionCache *)&v9 init];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_cacheLimit = a3;
    v4->_lock._os_unfair_lock_opaque = 0;
    uint64_t v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    sandboxExtensionURLs = v5->_sandboxExtensionURLs;
    v5->_sandboxExtensionURLs = v6;
  }
  return v5;
}

@end