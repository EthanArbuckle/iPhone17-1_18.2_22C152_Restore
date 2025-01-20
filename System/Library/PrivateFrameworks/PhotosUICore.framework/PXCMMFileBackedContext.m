@interface PXCMMFileBackedContext
+ (id)fileBackedContextWithDirectoryURL:(id)a3 activityType:(unint64_t)a4 title:(id)a5;
- (PXCMMFileBackedContext)initWithAssetsDataSourceManager:(id)a3 mediaProvider:(id)a4 activityType:(unint64_t)a5;
- (id)actionManager;
@end

@implementation PXCMMFileBackedContext

- (void).cxx_destruct
{
}

- (id)actionManager
{
  return self->_fileBackedActionManager;
}

- (PXCMMFileBackedContext)initWithAssetsDataSourceManager:(id)a3 mediaProvider:(id)a4 activityType:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PXCMMFileBackedContext;
  v5 = [(PXCMMContext *)&v9 initWithAssetsDataSourceManager:a3 mediaProvider:a4 activityType:a5];
  if (v5)
  {
    v6 = objc_alloc_init(PXCMMFileBackedActionManager);
    fileBackedActionManager = v5->_fileBackedActionManager;
    v5->_fileBackedActionManager = v6;
  }
  return v5;
}

+ (id)fileBackedContextWithDirectoryURL:(id)a3 activityType:(unint64_t)a4 title:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  objc_super v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  unsigned __int8 v62 = 0;
  v10 = [v7 path];
  int v11 = [v9 fileExistsAtPath:v10 isDirectory:&v62];
  int v12 = v62;

  if (v11) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    v14 = PLSharingGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v67 = v7;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "%@ does not exist or is not a directory", buf, 0xCu);
    }
    v15 = 0;
  }
  else
  {
    id v61 = 0;
    v16 = [v9 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:0 options:0 error:&v61];
    v17 = v61;
    v14 = v17;
    if (v16)
    {
      unint64_t v45 = a4;
      v47 = v17;
      v48 = v9;
      id v49 = v8;
      id v50 = v7;
      v51 = [MEMORY[0x1E4F1CA48] array];
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      v46 = v16;
      id obj = v16;
      uint64_t v18 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v54 = 0;
        uint64_t v20 = 0;
        uint64_t v21 = *(void *)v58;
        uint64_t v22 = *MEMORY[0x1E4F44400];
        uint64_t v23 = *MEMORY[0x1E4F44448];
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v58 != v21) {
              objc_enumerationMutation(obj);
            }
            v25 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            v26 = (void *)MEMORY[0x1E4F442D8];
            v27 = [v25 pathExtension];
            v28 = [v26 typeWithFilenameExtension:v27];

            if (v28)
            {
              unsigned int v29 = [v28 conformsToType:v22];
              unsigned int v30 = [v28 conformsToType:v23];
              v20 += v29;
              v54 += v30;
              if ((v29 & 1) != 0 || v30) {
                [v51 addObject:v25];
              }
            }
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
        }
        while (v19);
      }
      else
      {
        uint64_t v54 = 0;
        uint64_t v20 = 0;
      }

      v31 = v51;
      if ([v51 count])
      {
        v63 = &unk_1F02D7A20;
        id v32 = [v51 copy];
        v64 = v32;
        uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];

        obja = v33;
        v34 = [[PXFileBackedAssetsDataSourceManager alloc] initWithFileURLsBySection:v33];
        v35 = objc_alloc_init(PXFileBackedUIMediaProvider);
        v15 = [[PXCMMFileBackedContext alloc] initWithAssetsDataSourceManager:v34 mediaProvider:v35 activityType:v45];
        v36 = [(PXSectionedDataSourceManager *)v34 dataSource];
        id v8 = v49;
        [(PXCMMContext *)v15 setTitle:v49];
        [(PXCMMContext *)v15 setSubtitle:&stru_1F00B0030];
        v37 = [v36 startingAssetReference];
        v38 = [v37 asset];
        [(PXCMMContext *)v15 setPosterAsset:v38];

        [(PXCMMContext *)v15 setPosterMediaProvider:v35];
        id v7 = v50;
        if (v36) {
          [v36 firstItemIndexPath];
        }
        else {
          memset(v56, 0, sizeof(v56));
        }
        v40 = [v36 assetAtItemIndexPath:v56];
        v41 = [v40 creationDate];
        [(PXCMMContext *)v15 setStartDate:v41];

        if (v36) {
          [v36 lastItemIndexPath];
        }
        else {
          memset(v55, 0, sizeof(v55));
        }
        v42 = [v36 assetAtItemIndexPath:v55];
        v43 = [v42 creationDate];
        [(PXCMMContext *)v15 setEndDate:v43];

        [(PXCMMContext *)v15 setPhotosCount:v20];
        [(PXCMMContext *)v15 setVideosCount:v54];
        [(PXCMMContext *)v15 setCount:[v51 count]];

        v14 = v47;
        objc_super v9 = v48;
        v16 = v46;
        v39 = obja;
      }
      else
      {
        v39 = PLSharingGetLog();
        id v8 = v49;
        id v7 = v50;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v67 = v50;
          _os_log_impl(&dword_1A9AE7000, v39, OS_LOG_TYPE_ERROR, "There are no recognized media files at %@", buf, 0xCu);
        }
        v15 = 0;
        v14 = v47;
        objc_super v9 = v48;
      }
    }
    else
    {
      v31 = PLSharingGetLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v67 = v7;
        __int16 v68 = 2112;
        v69 = v14;
        _os_log_impl(&dword_1A9AE7000, v31, OS_LOG_TYPE_ERROR, "Failed to get contents of directory %@: %@", buf, 0x16u);
      }
      v15 = 0;
    }
  }
  return v15;
}

@end