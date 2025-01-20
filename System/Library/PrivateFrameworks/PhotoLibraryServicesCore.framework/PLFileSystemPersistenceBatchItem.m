@interface PLFileSystemPersistenceBatchItem
- (NSMutableDictionary)attributes;
- (NSURL)fileURL;
- (PLFileSystemPersistenceBatchItem)initWithFileURL:(id)a3;
- (id)description;
- (void)persist;
- (void)setAttributes:(id)a3;
- (void)setData:(id)a3 forKey:(id)a4;
- (void)setInt32:(int)a3 forKey:(id)a4;
- (void)setString:(id)a3 forKey:(id)a4;
- (void)setUInt16:(unsigned __int16)a3 forKey:(id)a4;
- (void)setUInt64:(unint64_t)a3 forKey:(id)a4;
- (void)setUUIDString:(id)a3 forKey:(id)a4;
@end

@implementation PLFileSystemPersistenceBatchItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)setAttributes:(id)a3
{
}

- (NSMutableDictionary)attributes
{
  return self->_attributes;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)persist
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(PLFileSystemPersistenceBatchItem *)self fileURL];
  id v4 = [v3 path];
  v5 = (const char *)[v4 fileSystemRepresentation];

  int v6 = open(v5, 2097153);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_2:
    v7 = [(PLFileSystemPersistenceBatchItem *)self attributes];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __43__PLFileSystemPersistenceBatchItem_persist__block_invoke;
    v19[3] = &unk_1E58A1200;
    int v20 = v6;
    v19[4] = self;
    [v7 enumerateKeysAndObjectsUsingBlock:v19];

    close(v6);
    return;
  }
  int v8 = *__error();
  v9 = [(PLFileSystemPersistenceBatchItem *)self fileURL];
  v10 = [v9 path];
  BOOL v11 = +[PLFileUtilities stripImmutableFlagIfNecessaryFromFileAtPath:v10];

  if (v11)
  {
    v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(PLFileSystemPersistenceBatchItem *)self fileURL];
      v14 = [v13 path];
      v15 = __error();
      v16 = strerror(*v15);
      *(_DWORD *)buf = 138412546;
      v22 = v14;
      __int16 v23 = 2082;
      v24 = v16;
      _os_log_impl(&dword_19BCFB000, v12, OS_LOG_TYPE_DEFAULT, "Retrying after clearing IMMUTABLE flag from %@ after failing to open file for writing (%{public}s).", buf, 0x16u);
    }
    int v6 = open(v5, 2097153);
    if ((v6 & 0x80000000) == 0) {
      goto LABEL_2;
    }
    int v8 = *__error();
  }
  v17 = PLBackendGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = strerror(v8);
    *(_DWORD *)buf = 136446210;
    v22 = v18;
    _os_log_impl(&dword_19BCFB000, v17, OS_LOG_TYPE_ERROR, "Unable to open file to save extended attributes (%{public}s).", buf, 0xCu);
  }
}

void __43__PLFileSystemPersistenceBatchItem_persist__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA98] null];
  if (v7 == v6) {
    int v8 = 0;
  }
  else {
    int v8 = v6;
  }
  id v9 = v8;

  id v10 = v5;
  int v11 = *(_DWORD *)(a1 + 40);
  id v12 = v10;
  v13 = (const char *)[v12 UTF8String];
  if (v9)
  {
    id v14 = v9;
    if (fsetxattr(v11, v13, (const void *)[v14 bytes], objc_msgSend(v14, "length"), 0, 0) < 0)
    {
      v15 = PLBackendGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = [*(id *)(a1 + 32) fileURL];
        v17 = [v16 path];
        v18 = __error();
        v19 = strerror(*v18);
        int v23 = 138412546;
        v24 = v17;
        __int16 v25 = 2080;
        v26 = v19;
        int v20 = "Unable to set extended attributes on '%@': (%s).";
LABEL_12:
        _os_log_impl(&dword_19BCFB000, v15, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v23, 0x16u);

        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else if (fremovexattr(v11, v13, 0) < 0 && *__error() != 93)
  {
    v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [*(id *)(a1 + 32) fileURL];
      v17 = [v16 path];
      v21 = __error();
      v22 = strerror(*v21);
      int v23 = 138412546;
      v24 = v17;
      __int16 v25 = 2080;
      v26 = v22;
      int v20 = "Unable to remove extended attributes on '%@': (%s).";
      goto LABEL_12;
    }
LABEL_13:
  }
}

- (void)setString:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dataUsingEncoding:4];
  [(PLFileSystemPersistenceBatchItem *)self setData:v7 forKey:v6];
}

- (void)setUInt64:(unint64_t)a3 forKey:(id)a4
{
  unint64_t v8 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C9B8];
  id v6 = a4;
  id v7 = [v5 dataWithBytes:&v8 length:8];
  [(PLFileSystemPersistenceBatchItem *)self setData:v7 forKey:v6];
}

- (void)setInt32:(int)a3 forKey:(id)a4
{
  int v8 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C9B8];
  id v6 = a4;
  id v7 = [v5 dataWithBytes:&v8 length:4];
  [(PLFileSystemPersistenceBatchItem *)self setData:v7 forKey:v6];
}

- (void)setUInt16:(unsigned __int16)a3 forKey:(id)a4
{
  unsigned __int16 v8 = a3;
  id v5 = (void *)MEMORY[0x1E4F1C9B8];
  id v6 = a4;
  id v7 = [v5 dataWithBytes:&v8 length:2];
  [(PLFileSystemPersistenceBatchItem *)self setData:v7 forKey:v6];
}

- (void)setUUIDString:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  PLUUIDDataFromString(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(PLFileSystemPersistenceBatchItem *)self setData:v7 forKey:v6];
}

- (void)setData:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
  }
  id v7 = [(PLFileSystemPersistenceBatchItem *)self attributes];
  [v7 setObject:v8 forKey:v6];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(PLFileSystemPersistenceBatchItem *)self fileURL];
  id v6 = [v5 path];
  id v7 = [v3 stringWithFormat:@"<%@ %p> '%@'", v4, self, v6];

  return v7;
}

- (PLFileSystemPersistenceBatchItem)initWithFileURL:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLFileSystemPersistenceBatchItem;
  id v6 = [(PLFileSystemPersistenceBatchItem *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileURL, a3);
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attributes = v7->_attributes;
    v7->_attributes = v8;
  }
  return v7;
}

@end