@interface PLPTPAssetReader
- (NSString)path;
- (PLPTPAssetReader)initWithPath:(id)a3;
- (PLPTPAssetReader)initWithTemporaryFileDeletedOnDeallocPath:(id)a3;
- (id)dataSourcePathForDataRange:(_NSRange)a3 error:(id *)a4;
- (id)description;
- (id)userInfo;
- (void)dealloc;
- (void)setUserInfo:(id)a3;
@end

@implementation PLPTPAssetReader

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)setUserInfo:(id)a3
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (NSString)path
{
  return self->_path;
}

- (id)description
{
  v3 = +[PLDescriptionBuilder descriptionBuilderWithObject:self];
  [v3 appendName:@"path" typeCode:"@" value:&self->_path];
  v4 = [v3 build];

  return v4;
}

- (id)dataSourcePathForDataRange:(_NSRange)a3 error:(id *)a4
{
  return self->_path;
}

- (void)dealloc
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_shouldDeleteTemporaryFileOnDeallocation)
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v28 = -1;
    v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_path isDirectory:0];
    v5 = (void *)MEMORY[0x1E4F1CB10];
    v6 = NSTemporaryDirectory();
    v7 = [v5 fileURLWithPath:v6 isDirectory:1];
    id v27 = 0;
    char v8 = [v3 getRelationship:&v28 ofDirectoryAtURL:v7 toItemAtURL:v4 error:&v27];
    id v9 = v27;

    if ((v8 & 1) == 0)
    {
      v10 = PLBackendGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        path = self->_path;
        *(_DWORD *)buf = 138412546;
        v30 = path;
        __int16 v31 = 2112;
        id v32 = v9;
        v12 = "Unable to get relationship between temp dir and %@: %@";
        v13 = v10;
        uint32_t v14 = 22;
        goto LABEL_8;
      }
LABEL_16:

      goto LABEL_17;
    }
    if (v28)
    {
      v10 = PLBackendGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = self->_path;
        *(_DWORD *)buf = 138412290;
        v30 = v11;
        v12 = "Refusing to delete item not in temporary directory %@";
        v13 = v10;
        uint32_t v14 = 12;
LABEL_8:
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    id v26 = v9;
    int v16 = [v3 removeItemAtURL:v4 error:&v26];
    id v17 = v26;

    v18 = PLBackendGetLog();
    v10 = v18;
    if (v16)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = self->_path;
        *(_DWORD *)buf = 138412290;
        v30 = v19;
        v20 = "Deleted temporary ptp asset reader file %@";
        v21 = v10;
        os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
        uint32_t v23 = 12;
LABEL_14:
        _os_log_impl(&dword_19B3C7000, v21, v22, v20, buf, v23);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v24 = self->_path;
      *(_DWORD *)buf = 138412546;
      v30 = v24;
      __int16 v31 = 2112;
      id v32 = v17;
      v20 = "Unable to delete PTP asset reader temporary file %@: %@";
      v21 = v10;
      os_log_type_t v22 = OS_LOG_TYPE_ERROR;
      uint32_t v23 = 22;
      goto LABEL_14;
    }
    id v9 = v17;
    goto LABEL_16;
  }
LABEL_17:
  v25.receiver = self;
  v25.super_class = (Class)PLPTPAssetReader;
  [(PLPTPAssetReader *)&v25 dealloc];
}

- (PLPTPAssetReader)initWithTemporaryFileDeletedOnDeallocPath:(id)a3
{
  v3 = [(PLPTPAssetReader *)self initWithPath:a3];
  v4 = v3;
  if (v3)
  {
    v3->_shouldDeleteTemporaryFileOnDeallocation = 1;
    v5 = v3;
  }

  return v4;
}

- (PLPTPAssetReader)initWithPath:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLPTPAssetReader;
  v5 = [(PLPTPAssetReader *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    path = v5->_path;
    v5->_path = (NSString *)v6;

    char v8 = v5;
  }

  return v5;
}

@end