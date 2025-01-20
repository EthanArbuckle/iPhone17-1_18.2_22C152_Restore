@interface IMBaseDiskCache
- (BOOL)hasItemForKey:(id)a3;
- (BOOL)isEmpty;
- (IMBaseDiskCache)init;
- (IMBaseDiskCache)initWithBasePath:(id)a3;
- (NSString)basePath;
- (id)_allFiles;
- (id)pathForKey:(id)a3;
- (void)clearCache;
- (void)initialize;
- (void)removeItemForKey:(id)a3;
- (void)removeItemsWithPrefx:(id)a3;
- (void)setBasePath:(id)a3;
@end

@implementation IMBaseDiskCache

- (IMBaseDiskCache)initWithBasePath:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMBaseDiskCache;
  v5 = [(IMBaseDiskCache *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(IMBaseDiskCache *)v5 setBasePath:v4];
    [(IMBaseDiskCache *)v6 initialize];
  }

  return v6;
}

- (void)setBasePath:(id)a3
{
}

- (void)initialize
{
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v3 = [(IMBaseDiskCache *)self basePath];
  if (([v5 fileExistsAtPath:v3] & 1) == 0)
  {
    int v4 = [MEMORY[0x1E4F91FC8] supportsImageStore];

    if (!v4) {
      goto LABEL_5;
    }
    v3 = [(IMBaseDiskCache *)self basePath];
    [v5 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];
  }

LABEL_5:
}

- (NSString)basePath
{
  return self->_basePath;
}

- (IMBaseDiskCache)init
{
  v3 = [MEMORY[0x1E4FB1438] applicationCacheDirectory];
  int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringByAppendingPathComponent:v5];

  v7 = [(IMBaseDiskCache *)self initWithBasePath:v6];
  return v7;
}

- (void)clearCache
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [(IMBaseDiskCache *)self basePath];
  [v3 removeItemAtPath:v4 error:0];

  [(IMBaseDiskCache *)self initialize];
}

- (void)removeItemsWithPrefx:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = [(IMBaseDiskCache *)self _allFiles];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v11 hasPrefix:v4])
          {
            v12 = [(IMBaseDiskCache *)self basePath];
            v13 = [v12 stringByAppendingPathComponent:v11];

            [v5 removeItemAtPath:v13 error:0];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (void)removeItemForKey:(id)a3
{
  id v4 = [(IMBaseDiskCache *)self pathForKey:a3];
  if ([v4 length])
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v3 removeItemAtPath:v4 error:0];
  }
}

- (BOOL)hasItemForKey:(id)a3
{
  v3 = [(IMBaseDiskCache *)self pathForKey:a3];
  if ([v3 length])
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v5 = [v4 fileExistsAtPath:v3];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isEmpty
{
  v2 = [(IMBaseDiskCache *)self _allFiles];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (id)pathForKey:(id)a3
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    objc_msgSend(v4, "pf_stringWithPercentEscape");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((unint64_t)[v5 length] >= 0x100)
    {
      uint64_t v7 = [v4 pathExtension];
      id v8 = [v4 stringByDeletingPathExtension];
      uint64_t v9 = [v8 UTF8String];
      v6 = v5;
      if (v9)
      {
        v10 = (const void *)v9;
        v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
        CC_LONG v12 = [v8 length];
        id v13 = v11;
        CC_SHA256(v10, v12, (unsigned __int8 *)[v13 mutableBytes]);
        long long v14 = [v13 base64EncodedStringWithOptions:0];
        v24[0] = @"shortened-";
        v24[1] = v14;
        v24[2] = v7;
        long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
        v6 = [v15 componentsJoinedByString:&stru_1F3F553C0];
      }
      long long v16 = _MTLogCategoryDefault();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412546;
        id v21 = v5;
        __int16 v22 = 2112;
        v23 = v6;
        _os_log_impl(&dword_1E3BC5000, v16, OS_LOG_TYPE_DEFAULT, "Image name exceeds 255 characters. Shortening %@ to %@", (uint8_t *)&v20, 0x16u);
      }
    }
    long long v17 = [(IMBaseDiskCache *)self basePath];
    v18 = [v17 stringByAppendingPathComponent:v6];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_allFiles
{
  BOOL v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(IMBaseDiskCache *)self basePath];
  id v5 = [v3 contentsOfDirectoryAtPath:v4 error:0];

  return v5;
}

- (void).cxx_destruct
{
}

@end