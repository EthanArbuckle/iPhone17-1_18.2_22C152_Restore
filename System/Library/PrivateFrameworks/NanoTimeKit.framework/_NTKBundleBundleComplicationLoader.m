@interface _NTKBundleBundleComplicationLoader
- (BOOL)isEqual:(id)a3;
- (NSArray)urls;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_enumerateBundles:(id)a3;
- (void)_loadClassesUsingBlock:(id)a3;
- (void)setUrls:(id)a3;
@end

@implementation _NTKBundleBundleComplicationLoader

- (void)_enumerateBundles:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_urls)
  {
    if (_enumerateBundles__onceToken_1 != -1) {
      dispatch_once(&_enumerateBundles__onceToken_1, &__block_literal_global_133);
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    obj = self->_urls;
    uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v10 = (void *)_enumerateBundles____complicationBundleLoader;
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __56___NTKBundleBundleComplicationLoader__enumerateBundles___block_invoke_2;
          v12[3] = &unk_1E62C4288;
          id v13 = v4;
          [v10 enumerateBundlesFromDirectoryURL:v9 enumerator:v12];
        }
        uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
  }
}

- (void)_loadClassesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61___NTKBundleBundleComplicationLoader__loadClassesUsingBlock___block_invoke;
  v6[3] = &unk_1E62C4A28;
  id v7 = v4;
  id v5 = v4;
  [(_NTKBundleBundleComplicationLoader *)self _enumerateBundles:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_NTKBundleBundleComplicationLoader *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = NTKEqualObjects(self->_urls, v4->_urls);
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setUrls:self->_urls];
  return v4;
}

- (NSArray)urls
{
  return self->_urls;
}

- (void)setUrls:(id)a3
{
}

- (void).cxx_destruct
{
}

@end