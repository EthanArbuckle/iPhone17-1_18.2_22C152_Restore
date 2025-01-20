@interface PXFileBackedAssetsDataSourceManager
+ (id)emptyFileBackedDataSourceManager;
+ (id)fileBackedDataSourceManagerWithDirectory:(id)a3;
- (NSDictionary)fileURLsBySection;
- (PXFileBackedAssetsDataSourceManager)initWithFileURLsBySection:(id)a3;
- (void)_createDataSource;
- (void)insertFileURL:(id)a3 atIndex:(int64_t)a4 inSection:(int64_t)a5;
- (void)removeFileURLsAtIndexes:(id)a3 inSection:(int64_t)a4;
@end

@implementation PXFileBackedAssetsDataSourceManager

- (void).cxx_destruct
{
}

- (NSDictionary)fileURLsBySection
{
  return &self->_fileURLsBySection->super;
}

- (void)insertFileURL:(id)a3 atIndex:(int64_t)a4 inSection:(int64_t)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  fileURLsBySection = self->_fileURLsBySection;
  v9 = NSNumber;
  id v10 = a3;
  v11 = [v9 numberWithInteger:a5];
  v12 = [(NSMutableDictionary *)fileURLsBySection objectForKeyedSubscript:v11];
  v13 = (void *)[v12 mutableCopy];

  [v13 insertObject:v10 atIndex:a4];
  v14 = self->_fileURLsBySection;
  v15 = [NSNumber numberWithInteger:a5];
  [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];

  v16 = [(PXSectionedDataSourceManager *)self dataSource];
  v17 = [PXFileBackedAssetsDataSource alloc];
  v18 = (void *)[(NSMutableDictionary *)self->_fileURLsBySection copy];
  v19 = [(PXFileBackedAssetsDataSource *)v17 initWithFileURLsBySection:v18];

  if (v16)
  {
    id v29 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v28 = [v16 identifier];
    uint64_t v27 = [(PXFileBackedAssetsDataSource *)v19 identifier];
    v20 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v21 = [NSNumber numberWithInteger:a5];
    v30 = v21;
    id v22 = objc_alloc((Class)off_1E5DA5568);
    v23 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a4];
    v24 = (void *)[v22 initWithIncrementalChangeDetailsRemovedIndexes:0 insertedIndexes:v23 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];
    v31[0] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v26 = (void *)[v29 initWithFromDataSourceIdentifier:v28 toDataSourceIdentifier:v27 sectionChanges:v20 itemChangeDetailsBySection:v25 subitemChangeDetailsByItemBySection:0];
  }
  else
  {
    v26 = 0;
  }
  [(PXSectionedDataSourceManager *)self setDataSource:v19 changeDetails:v26];
}

- (void)removeFileURLsAtIndexes:(id)a3 inSection:(int64_t)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  fileURLsBySection = self->_fileURLsBySection;
  v8 = [NSNumber numberWithInteger:a4];
  v9 = [(NSMutableDictionary *)fileURLsBySection objectForKeyedSubscript:v8];
  id v10 = (void *)[v9 mutableCopy];

  [v10 removeObjectsAtIndexes:v6];
  v11 = self->_fileURLsBySection;
  v12 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v12];

  v13 = [(PXSectionedDataSourceManager *)self dataSource];
  v14 = [PXFileBackedAssetsDataSource alloc];
  v15 = (void *)[(NSMutableDictionary *)self->_fileURLsBySection copy];
  v16 = [(PXFileBackedAssetsDataSource *)v14 initWithFileURLsBySection:v15];

  if (v13)
  {
    id v24 = objc_alloc((Class)off_1E5DA8488);
    uint64_t v23 = [v13 identifier];
    uint64_t v17 = [(PXFileBackedAssetsDataSource *)v16 identifier];
    v18 = [off_1E5DA5568 changeDetailsWithNoChanges];
    v19 = [NSNumber numberWithInteger:a4];
    v25 = v19;
    v20 = (void *)[objc_alloc((Class)off_1E5DA5568) initWithIncrementalChangeDetailsRemovedIndexes:v6 insertedIndexes:0 movesToIndexes:0 movesFromIndexes:0 changedIndexes:0];
    v26[0] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    id v22 = (void *)[v24 initWithFromDataSourceIdentifier:v23 toDataSourceIdentifier:v17 sectionChanges:v18 itemChangeDetailsBySection:v21 subitemChangeDetailsByItemBySection:0];
  }
  else
  {
    id v22 = 0;
  }
  [(PXSectionedDataSourceManager *)self setDataSource:v16 changeDetails:v22];
}

- (void)_createDataSource
{
  v3 = [PXFileBackedAssetsDataSource alloc];
  v4 = (void *)[(NSMutableDictionary *)self->_fileURLsBySection copy];
  v5 = [(PXFileBackedAssetsDataSource *)v3 initWithFileURLsBySection:v4];

  [(PXSectionedDataSourceManager *)self setDataSource:v5 changeDetails:0];
}

- (PXFileBackedAssetsDataSourceManager)initWithFileURLsBySection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXFileBackedAssetsDataSourceManager;
  v5 = [(PXSectionedDataSourceManager *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    fileURLsBySection = v5->_fileURLsBySection;
    v5->_fileURLsBySection = (NSMutableDictionary *)v6;

    [(PXFileBackedAssetsDataSourceManager *)v5 _createDataSource];
  }

  return v5;
}

+ (id)fileBackedDataSourceManagerWithDirectory:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  unsigned __int8 v43 = 0;
  uint64_t v6 = [v4 path];
  int v7 = [v5 fileExistsAtPath:v6 isDirectory:&v43];
  int v8 = v43;

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    id v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v48 = v4;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "[PXFileBackedAssetsDataSourceManager]: %@ does not exist or is not a directory", buf, 0xCu);
    }

    v11 = [a1 emptyFileBackedDataSourceManager];
  }
  else
  {
    id v42 = 0;
    v12 = [v5 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:0 options:0 error:&v42];
    id v13 = v42;
    v14 = v13;
    if (v12)
    {
      id v33 = a1;
      id v34 = v13;
      v35 = v5;
      id v36 = v4;
      v37 = [MEMORY[0x1E4F1CA48] array];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v15 = v12;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v39;
        uint64_t v19 = *MEMORY[0x1E4F44400];
        uint64_t v20 = *MEMORY[0x1E4F44448];
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v39 != v18) {
              objc_enumerationMutation(v15);
            }
            id v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            uint64_t v23 = (void *)MEMORY[0x1E4F8CDF8];
            id v24 = [v22 pathExtension];
            v25 = [v23 typeWithFilenameExtension:v24];

            if (v25)
            {
              char v26 = [v25 conformsToType:v19];
              int v27 = [v25 conformsToType:v20];
              if ((v26 & 1) != 0 || v27) {
                [v37 addObject:v22];
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
        }
        while (v17);
      }

      if ([v37 count])
      {
        v44 = &unk_1F02D8248;
        uint64_t v28 = (void *)[v37 copy];
        v45 = v28;
        id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];

        v11 = [[PXFileBackedAssetsDataSourceManager alloc] initWithFileURLsBySection:v29];
        id v4 = v36;
      }
      else
      {
        v31 = PLUIGetLog();
        id v4 = v36;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v48 = v36;
          _os_log_impl(&dword_1A9AE7000, v31, OS_LOG_TYPE_ERROR, "[PXFileBackedAssetsDataSourceManager]: There are no recognized media files at %@", buf, 0xCu);
        }

        v11 = [v33 emptyFileBackedDataSourceManager];
      }
      v5 = v35;
      v14 = v34;
    }
    else
    {
      v30 = PLUIGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v48 = v4;
        __int16 v49 = 2112;
        v50 = v14;
        _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_ERROR, "[PXFileBackedAssetsDataSourceManager]: Failed to get contents of directory %@: %@", buf, 0x16u);
      }

      v11 = [a1 emptyFileBackedDataSourceManager];
    }
  }
  return v11;
}

+ (id)emptyFileBackedDataSourceManager
{
  v2 = [PXFileBackedAssetsDataSourceManager alloc];
  v3 = [(PXFileBackedAssetsDataSourceManager *)v2 initWithFileURLsBySection:MEMORY[0x1E4F1CC08]];
  return v3;
}

@end