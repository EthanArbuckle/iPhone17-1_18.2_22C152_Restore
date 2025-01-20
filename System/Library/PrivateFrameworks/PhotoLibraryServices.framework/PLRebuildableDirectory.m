@interface PLRebuildableDirectory
+ (id)rebuildableDirectoryWithURL:(id)a3 isCPLAssets:(BOOL)a4 isPhotoStream:(BOOL)a5 photoLibrary:(id)a6 startTime:(double)a7;
+ (void)collectFileURLs:(id)a3 urlsToSkip:(id)a4 forAddingToAlbum:(id)a5 intoAssetsArray:(id)a6 assetsKind:(int)a7 testCreationDates:(BOOL)a8 startTime:(double)a9 pathManager:(id)a10;
- (BOOL)isCPLAssets;
- (BOOL)isPhotoStream;
- (NSFileManager)fm;
- (NSURL)url;
- (PLPhotoLibrary)photoLibrary;
- (double)startTime;
- (id)debugDescription;
- (id)description;
- (void)_collectContentsOfDirectoryURL:(id)a3 urlsToSkip:(id)a4 forAddingToAlbum:(id)a5 intoAssetsArray:(id)a6 assetsKind:(int)a7 startTime:(double)a8;
- (void)gatherAssetsToImport:(id)a3 pendingAssetsCount:(unint64_t *)a4 onDiskURLsToSkip:(id)a5 cameraRollOnly:(BOOL)a6;
@end

@implementation PLRebuildableDirectory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fm, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (double)startTime
{
  return self->_startTime;
}

- (NSFileManager)fm
{
  return (NSFileManager *)objc_getProperty(self, a2, 32, 1);
}

- (PLPhotoLibrary)photoLibrary
{
  return (PLPhotoLibrary *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isPhotoStream
{
  return self->_isPhotoStream;
}

- (BOOL)isCPLAssets
{
  return self->_isCPLAssets;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)_collectContentsOfDirectoryURL:(id)a3 urlsToSkip:(id)a4 forAddingToAlbum:(id)a5 intoAssetsArray:(id)a6 assetsKind:(int)a7 startTime:(double)a8
{
  uint64_t v9 = *(void *)&a7;
  v14 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v15 = *MEMORY[0x1E4F1C6E8];
  uint64_t v16 = *MEMORY[0x1E4F1C540];
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  objc_msgSend(v14, "arrayWithObjects:", v15, v16, 0);
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  v21 = [(NSFileManager *)self->_fm enumeratorAtURL:v20 includingPropertiesForKeys:v25 options:1 errorHandler:&__block_literal_global_36];

  v22 = objc_opt_class();
  v23 = [(PLRebuildableDirectory *)self photoLibrary];
  v24 = [v23 pathManager];
  [v22 collectFileURLs:v21 urlsToSkip:v19 forAddingToAlbum:v18 intoAssetsArray:v17 assetsKind:v9 testCreationDates:1 startTime:a8 pathManager:v24];
}

uint64_t __122__PLRebuildableDirectory__collectContentsOfDirectoryURL_urlsToSkip_forAddingToAlbum_intoAssetsArray_assetsKind_startTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v6 = PLMigrationGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = [v4 path];
    int v9 = 138412546;
    v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Unable to enumerate asset dir '%@': %@", (uint8_t *)&v9, 0x16u);
  }
  return 1;
}

- (void)gatherAssetsToImport:(id)a3 pendingAssetsCount:(unint64_t *)a4 onDiskURLsToSkip:(id)a5 cameraRollOnly:(BOOL)a6
{
  BOOL v6 = a6;
  v36 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v39 = a5;
  fm = self->_fm;
  __int16 v11 = [(PLRebuildableDirectory *)self url];
  uint64_t v12 = *MEMORY[0x1E4F1C6E8];
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObject:*MEMORY[0x1E4F1C6E8]];
  v14 = [(NSFileManager *)fm enumeratorAtURL:v11 includingPropertiesForKeys:v13 options:1 errorHandler:&__block_literal_global_92910];

  if (![(PLRebuildableDirectory *)self isPhotoStream])
  {
    v37 = 0;
    goto LABEL_11;
  }
  uint64_t v15 = [(PLRebuildableDirectory *)self url];
  id v46 = 0;
  int v16 = [v15 getResourceValue:&v46 forKey:v12 error:0];
  id v17 = v46;
  id v18 = v17;
  if (!v16)
  {

LABEL_7:
    id v18 = 0;
    goto LABEL_8;
  }
  uint64_t v19 = [v17 length];

  if (!v19) {
    goto LABEL_7;
  }
LABEL_8:
  id v20 = PLMigrationGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v21 = [(PLRebuildableDirectory *)self url];
    *(_DWORD *)buf = 138412546;
    v49 = v21;
    __int16 v50 = 2112;
    v51 = v18;
    _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "Will rebuild Photo Stream content at %@ for stream ID %@", buf, 0x16u);
  }
  v37 = v18;

LABEL_11:
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v14;
  uint64_t v22 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v40 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v43 != v40) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v26 = (void *)MEMORY[0x19F38D3B0]();
        unsigned int v41 = 0;
        if ([(PLRebuildableDirectory *)self isPhotoStream]) {
          int v27 = 2;
        }
        else {
          int v27 = 7;
        }
        unsigned int v41 = v27;
        if ([(PLRebuildableDirectory *)self isCPLAssets])
        {
          unsigned int v41 = 0;
        }
        else
        {
          if (!+[PLModelMigrator shouldImportAssetsFromDCIMSubDirectoryAtURL:v25 assetsKind:&v41])
          {
            v30 = PLMigrationGetLog();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_38;
            }
            goto LABEL_37;
          }
          if (v6 && v41 == 1)
          {
            v30 = PLMigrationGetLog();
            if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_38;
            }
LABEL_37:
            v35 = [v25 path];
            *(_DWORD *)buf = 138412290;
            v49 = v35;
            _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEBUG, "Skipping sub level '%@'.", buf, 0xCu);

            goto LABEL_38;
          }
        }
        v28 = PLMigrationGetLog();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v29 = [v25 path];
          *(_DWORD *)buf = 138412290;
          v49 = v29;
          _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_DEBUG, "Searching sub level '%@'.", buf, 0xCu);
        }
        if (v6)
        {
          v30 = 0;
        }
        else
        {
          v30 = 0;
          if ([(PLRebuildableDirectory *)self isPhotoStream] && v37)
          {
            [(PLRebuildableDirectory *)self photoLibrary];
            v32 = BOOL v31 = v6;
            v30 = +[PLPhotoStreamAlbum photoStreamAlbumWithStreamID:v37 inPhotoLibrary:v32 createIfNeeded:1];

            BOOL v6 = v31;
          }
        }
        uint64_t v33 = [v9 count];
        [(PLRebuildableDirectory *)self _collectContentsOfDirectoryURL:v25 urlsToSkip:v39 forAddingToAlbum:v30 intoAssetsArray:v9 assetsKind:v41 startTime:self->_startTime];
        uint64_t v34 = [v9 count];
        if (!v6 && v34 != v33) {
          unint64_t *v36 = [v9 count];
        }
LABEL_38:
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v23);
  }
}

uint64_t __98__PLRebuildableDirectory_gatherAssetsToImport_pendingAssetsCount_onDiskURLsToSkip_cameraRollOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  BOOL v6 = PLMigrationGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = [v4 path];
    int v9 = 138412546;
    v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Unable to enumerate sub dir '%@': %@", (uint8_t *)&v9, 0x16u);
  }
  return 1;
}

- (id)description
{
  v2 = [(PLRebuildableDirectory *)self url];
  v3 = [v2 path];

  return v3;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(PLRebuildableDirectory *)self url];
  BOOL v6 = [v5 path];
  v7 = [v3 stringWithFormat:@"<%@ %p> %@", v4, self, v6];

  return v7;
}

+ (void)collectFileURLs:(id)a3 urlsToSkip:(id)a4 forAddingToAlbum:(id)a5 intoAssetsArray:(id)a6 assetsKind:(int)a7 testCreationDates:(BOOL)a8 startTime:(double)a9 pathManager:(id)a10
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v45 = a4;
  id v43 = a5;
  id v39 = a6;
  id v16 = a10;
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (!a8)
  {
    id v17 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [v17 timeIntervalSinceReferenceDate];
    a9 = v18;
  }
  unsigned int v41 = v16;
  int v19 = objc_msgSend(v16, "isUBF", v39);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v15;
  uint64_t v20 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
  v21 = v45;
  if (v20)
  {
    uint64_t v22 = v20;
    uint64_t v23 = *(void *)v57;
    uint64_t v24 = *MEMORY[0x1E4F1C628];
    uint64_t v46 = *MEMORY[0x1E4F1C540];
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v57 != v23) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        if (v19)
        {
          id v55 = 0;
          [v26 getResourceValue:&v55 forKey:v24 error:0];
          id v27 = v55;
          if ([v27 BOOLValue]) {
            goto LABEL_23;
          }
          if (([MEMORY[0x1E4F8B978] isValidOriginalURL:v26] & 1) == 0)
          {
            v32 = PLMigrationGetLog();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v33 = [v26 lastPathComponent];
              *(_DWORD *)buf = 138412290;
              v61 = v33;
              _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_DEFAULT, "Skipping URL with invalid filename: %@", buf, 0xCu);
            }
LABEL_23:

            continue;
          }
        }
        if ([v21 containsObject:v26]) {
          continue;
        }
        v28 = (void *)MEMORY[0x19F38D3B0]();
        if (!+[PLManagedAsset isValidFileURLForImport:v26])
        {
          v29 = PLMigrationGetLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v61 = v26;
            _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEBUG, "_collectFileURLs: skipping %@, not valid for import", buf, 0xCu);
          }
          goto LABEL_32;
        }
        id v54 = 0;
        [v26 getResourceValue:&v54 forKey:v46 error:0];
        v29 = v54;
        [v29 timeIntervalSinceReferenceDate];
        if (a9 < v30)
        {
          BOOL v31 = PLMigrationGetLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            uint64_t v34 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:a9];
            *(_DWORD *)buf = 138412802;
            v61 = v26;
            __int16 v62 = 2112;
            v63 = v29;
            __int16 v64 = 2112;
            v65 = v34;
            _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "File import will skip %@ because it was created on %@, after we started import on %@", buf, 0x20u);
            goto LABEL_30;
          }
        }
        else
        {
          if (v19)
          {
            BOOL v31 = [MEMORY[0x1E4F8B978] uuidFromURL:v26];
            if (!v31) {
              goto LABEL_31;
            }
LABEL_27:
            uint64_t v34 = [v44 objectForKeyedSubscript:v31];
            if (!v34)
            {
              uint64_t v34 = [[PLFileSystemImportAsset alloc] initWithDestinationAlbum:v43 assetKind:a7];
              [v44 setObject:v34 forKeyedSubscript:v31];
            }
            [(PLFileSystemImportAsset *)v34 addURL:v26];
LABEL_30:

            v21 = v45;
            goto LABEL_31;
          }
          v35 = [v26 lastPathComponent];
          BOOL v31 = [v35 stringByDeletingPathExtension];

          v21 = v45;
          if (v31) {
            goto LABEL_27;
          }
        }
LABEL_31:

LABEL_32:
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
    }
    while (v22);
  }

  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ((v19 & 1) == 0)
  {
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __137__PLRebuildableDirectory_collectFileURLs_urlsToSkip_forAddingToAlbum_intoAssetsArray_assetsKind_testCreationDates_startTime_pathManager___block_invoke;
    v51[3] = &unk_1E5871A68;
    id v52 = v44;
    id v53 = v36;
    [v52 enumerateKeysAndObjectsUsingBlock:v51];
  }
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __137__PLRebuildableDirectory_collectFileURLs_urlsToSkip_forAddingToAlbum_intoAssetsArray_assetsKind_testCreationDates_startTime_pathManager___block_invoke_3;
  v48[3] = &unk_1E5871A68;
  id v49 = v36;
  id v50 = v40;
  id v37 = v40;
  id v38 = v36;
  [v44 enumerateKeysAndObjectsUsingBlock:v48];
}

void __137__PLRebuildableDirectory_collectFileURLs_urlsToSkip_forAddingToAlbum_intoAssetsArray_assetsKind_testCreationDates_startTime_pathManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __137__PLRebuildableDirectory_collectFileURLs_urlsToSkip_forAddingToAlbum_intoAssetsArray_assetsKind_testCreationDates_startTime_pathManager___block_invoke_2;
  v10[3] = &unk_1E5871A40;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = *(id *)(a1 + 40);
  id v7 = v6;
  id v8 = v5;
  int v9 = (void (**)(void, void))MEMORY[0x19F38D650](v10);
  v9[2](v9, *MEMORY[0x1E4F8C548]);
  v9[2](v9, *MEMORY[0x1E4F8C300]);
  v9[2](v9, *MEMORY[0x1E4F8C540]);
}

void __137__PLRebuildableDirectory_collectFileURLs_urlsToSkip_forAddingToAlbum_intoAssetsArray_assetsKind_testCreationDates_startTime_pathManager___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:a2] & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void __137__PLRebuildableDirectory_collectFileURLs_urlsToSkip_forAddingToAlbum_intoAssetsArray_assetsKind_testCreationDates_startTime_pathManager___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v7 = [*(id *)(a1 + 32) stringByAppendingString:a2];
  v3 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 48);
    id v6 = [v3 urls];
    [v5 addURLs:v6];

    [*(id *)(a1 + 56) addObject:v7];
  }
}

+ (id)rebuildableDirectoryWithURL:(id)a3 isCPLAssets:(BOOL)a4 isPhotoStream:(BOOL)a5 photoLibrary:(id)a6 startTime:(double)a7
{
  BOOL v9 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = objc_alloc_init(PLRebuildableDirectory);
  if (v9)
  {
    id v15 = (void *)MEMORY[0x1E4F28FE8];
    id v16 = [v12 lastPathComponent];
    id v17 = [v15 scannerWithString:v16];

    [v17 setCharactersToBeSkipped:0];
    if ([v17 scanLongLong:0] && objc_msgSend(v17, "isAtEnd"))
    {
      p_super = PLMigrationGetLog();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = [v12 path];
        int v25 = 138412290;
        v26 = v19;
        _os_log_impl(&dword_19B3C7000, p_super, OS_LOG_TYPE_DEFAULT, "Found valid PhotoStream directory at %@", (uint8_t *)&v25, 0xCu);
      }
    }
    else
    {
      uint64_t v20 = PLMigrationGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [v12 path];
        int v25 = 138412290;
        v26 = v21;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Invalid PhotoStream directory at %@", (uint8_t *)&v25, 0xCu);
      }
      p_super = &v14->super;
      id v14 = 0;
    }
  }
  if (v14)
  {
    if ([v12 checkResourceIsReachableAndReturnError:0])
    {
      objc_storeStrong((id *)&v14->_url, a3);
      v14->_isCPLAssets = a4;
      v14->_isPhotoStream = v9;
      objc_storeStrong((id *)&v14->_photoLibrary, a6);
      uint64_t v22 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E4F28CB8]);
      fm = v14->_fm;
      v14->_fm = v22;

      v14->_startTime = a7;
    }
    else
    {

      id v14 = 0;
    }
  }

  return v14;
}

@end