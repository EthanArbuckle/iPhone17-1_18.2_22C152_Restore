@interface PLZeroKeywordStore
+ (id)expectedClasses;
- (PLZeroKeywordStore)initWithPath:(id)a3;
- (id)currentZeroKeywords;
- (id)currentZeroKeywordsForLibraryScope:(int64_t)a3;
- (void)deleteStore;
- (void)updateZeroKeywordsTo:(id)a3;
@end

@implementation PLZeroKeywordStore

- (void).cxx_destruct
{
}

- (void)updateZeroKeywordsTo:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v6];
  id v5 = v6;
  if (v4)
  {
    [v4 writeToFile:self->_storePath atomically:1];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v5;
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error archiving zero keywords: %@", buf, 0xCu);
  }
}

- (id)currentZeroKeywordsForLibraryScope:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = [(PLZeroKeywordStore *)self currentZeroKeywords];
  id v5 = v4;
  if (v4)
  {
    if ((unint64_t)a3 > 2) {
      id v6 = 0;
    }
    else {
      id v6 = off_1E58721B0[a3];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:v6];
    if (v8)
    {
      id v7 = (id)v8;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        v11 = v6;
        _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Using ZeroKeywords with library scope: %@", (uint8_t *)&v10, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        v11 = v6;
        _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "No ZeroKeywords for library scope: %@", (uint8_t *)&v10, 0xCu);
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Falling back to non-library scoped Zero Keywords.", (uint8_t *)&v10, 2u);
      }
      id v7 = v5;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)currentZeroKeywords
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:self->_storePath];
  v3 = [(id)objc_opt_class() expectedClasses];
  id v7 = 0;
  v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v3 fromData:v2 error:&v7];
  id v5 = v7;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v5;
    _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error reading zero keywords from store: %@", buf, 0xCu);
  }

  return v4;
}

- (void)deleteStore
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v3 fileExistsAtPath:self->_storePath])
  {
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    storePath = self->_storePath;
    id v8 = 0;
    char v6 = [v4 removeItemAtPath:storePath error:&v8];
    id v7 = v8;

    if ((v6 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v7;
      _os_log_error_impl(&dword_19B3C7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error deleting zero keyword store: %@", buf, 0xCu);
    }
  }
  else
  {
    id v7 = 0;
  }
}

- (PLZeroKeywordStore)initWithPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLZeroKeywordStore;
  char v6 = [(PLZeroKeywordStore *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_storePath, a3);
  }

  return v7;
}

+ (id)expectedClasses
{
  if (expectedClasses_onceToken != -1) {
    dispatch_once(&expectedClasses_onceToken, &__block_literal_global_96572);
  }
  v2 = (void *)expectedClasses_expectedClasses;
  return v2;
}

void __37__PLZeroKeywordStore_expectedClasses__block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:7];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9);
  v3 = (void *)expectedClasses_expectedClasses;
  expectedClasses_expectedClasses = v2;
}

@end