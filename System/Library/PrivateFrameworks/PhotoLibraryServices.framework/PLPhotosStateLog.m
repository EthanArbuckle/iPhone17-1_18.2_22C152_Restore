@interface PLPhotosStateLog
- (BOOL)compressFileFromPath:(id)a3 toPath:(id)a4;
- (BOOL)copyFilesMatching:(id)a3 andExcluding:(id)a4 fromPath:(id)a5 toPath:(id)a6 usingCompression:(BOOL)a7;
- (OS_dispatch_group)group;
- (PLPhotoLibrary)photoLibrary;
- (PLPhotosStateLog)initWithPhotoLibrary:(id)a3;
- (void)_logAssets:(id)a3 forAlbum:(id)a4 indent:(unint64_t)a5;
- (void)createSnapshot;
- (void)logAlbum:(id)a3 index:(unint64_t)a4 indent:(unint64_t)a5 completeMetadata:(BOOL)a6 printAssets:(BOOL)a7;
- (void)logAlbumLists;
- (void)logAllAlbums;
- (void)logAssetCounts;
- (void)logDescription:(id)a3;
- (void)logMoments;
@end

@implementation PLPhotosStateLog

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)createSnapshot
{
  v2 = [(PLPhotosStateLog *)self photoLibrary];
  v3 = [v2 pathManager];
  v4 = [v3 photoDirectoryWithType:2];

  v5 = [@"/var/mobile" stringByAppendingPathComponent:@"Library/Logs/CrashReporter/DiagnosticLogs/"];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v6 setDateFormat:@"YYYY_MM_dd_HH_mm_ssZZZ"];
  v7 = [MEMORY[0x1E4F1C9C8] date];
  v8 = [v6 stringFromDate:v7];

  v9 = [NSString stringWithFormat:@"PhotosSnapshot_%@", v8];
  v10 = [v5 stringByAppendingString:v9];
  v11 = [v10 stringByAppendingString:@"/"];

  dispatch_queue_t v12 = dispatch_queue_create("com.apple.photostate.PLPhotosStateLoggingQueue", MEMORY[0x1E4F14430]);
  v16 = v4;
  v17 = v5;
  id v13 = v5;
  id v14 = v4;
  id v15 = v11;
  pl_dispatch_async();
}

void __34__PLPhotosStateLog_createSnapshot__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v15 = 0;
  int v4 = [v2 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v15];
  id v5 = v15;

  if (v4)
  {
    [*(id *)(a1 + 40) copyFilesMatching:@"*.sqlite*" andExcluding:@"*aside*" fromPath:*(void *)(a1 + 48) toPath:*(void *)(a1 + 32) usingCompression:1];
    [*(id *)(a1 + 40) copyFilesMatching:@"com.apple.*" andExcluding:0 fromPath:*(void *)(a1 + 56) toPath:*(void *)(a1 + 32) usingCompression:1];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v14 = [v5 localizedDescription];
    logString(@"[PLLogging] Error creating directory %@: %@", v7, v8, v9, v10, v11, v12, v13, v6);

    id v5 = (id)v14;
  }
}

- (BOOL)copyFilesMatching:(id)a3 andExcluding:(id)a4 fromPath:(id)a5 toPath:(id)a6 usingCompression:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v13;
  id v16 = v14;
  [MEMORY[0x1E4F28CB8] defaultManager];
  v61 = id v68 = 0;
  v17 = [v61 contentsOfDirectoryAtPath:v13 error:&v68];
  id v54 = v68;
  v57 = v11;
  if (v12) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"(SELF like %@) AND (NOT (SELF like %@))", v11, v12];
  }
  else {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF like %@", v11, v50];
  }
  v55 = v17;
  v53 = v56 = v12;
  v18 = [v17 filteredArrayUsingPredicate:v53];
  long long v64 = 0u;
  long long v65 = 0u;
  BOOL v60 = v18 == 0;
  long long v66 = 0u;
  long long v67 = 0u;
  id obj = v18;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v64 objects:v69 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v65 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v64 + 1) + 8 * i);
        v24 = [v15 stringByAppendingString:v23];
        v25 = [v16 stringByAppendingString:v23];
        if (v7)
        {
          BOOL v60 = [(PLPhotosStateLog *)self compressFileFromPath:v24 toPath:v25];
        }
        else
        {
          BOOL v26 = v7;
          v27 = v15;
          v28 = v61;
          if ([v61 fileExistsAtPath:v25])
          {
            id v63 = 0;
            char v29 = [v61 removeItemAtPath:v25 error:&v63];
            id v30 = v63;
            v31 = v30;
            if ((v29 & 1) == 0)
            {
              v51 = [v30 localizedDescription];
              logString(@"[PLLogging] Error deleting file %@: %@", v32, v33, v34, v35, v36, v37, v38, (uint64_t)v25);
            }
            v28 = v61;
          }
          id v62 = 0;
          char v39 = [v28 copyItemAtPath:v24 toPath:v25 error:&v62];
          id v40 = v62;
          v41 = v40;
          if (v39)
          {
            BOOL v60 = 1;
          }
          else
          {
            v52 = [v40 localizedDescription];
            logString(@"[PLLogging] Error copying file %@ to %@: %@", v42, v43, v44, v45, v46, v47, v48, (uint64_t)v24);
          }
          id v15 = v27;
          BOOL v7 = v26;
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v64 objects:v69 count:16];
    }
    while (v20);
  }

  return v60;
}

- (BOOL)compressFileFromPath:(id)a3 toPath:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v67 = 0;
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v8 fileExistsAtPath:v6 isDirectory:&v67])
  {
    if (!v67)
    {
      uint64_t v23 = [v7 stringByAppendingPathExtension:@"gz"];

      if ([v8 fileExistsAtPath:v23])
      {
        id v60 = 0;
        char v24 = [v8 removeItemAtPath:v23 error:&v60];
        id v25 = v60;
        BOOL v26 = v25;
        if ((v24 & 1) == 0)
        {
          v55 = [v25 localizedDescription];
          logString(@"[PLLogging] Error deleting file %@: %@", v27, v28, v29, v30, v31, v32, v33, (uint64_t)v23);
        }
      }
      id v34 = v6;
      uint64_t v35 = fopen((const char *)[v34 fileSystemRepresentation], "r");
      if (v35)
      {
        uint64_t v43 = v35;
        id v7 = v23;
        uint64_t v44 = fopen((const char *)[v7 fileSystemRepresentation], "w");
        if (v44)
        {
          uint64_t v45 = v44;
          int v46 = CPFileCompressionZDeflate();
          fclose(v43);
          fclose(v45);
          if (!v46)
          {
            BOOL v18 = 1;
            goto LABEL_30;
          }
        }
        else
        {
          fclose(0);
        }
      }
      logString(@"[PLLogging] Failed to compress %@", v36, v37, v38, v39, v40, v41, v42, (uint64_t)v34);
      BOOL v18 = 0;
      id v7 = v23;
      goto LABEL_30;
    }
    id v66 = 0;
    uint64_t v9 = [v8 contentsOfDirectoryAtPath:v6 error:&v66];
    id v10 = v66;
    id v65 = 0;
    int v11 = [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v65];
    id v12 = v65;
    id v13 = v12;
    if (v11)
    {
      id v59 = v12;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v14 = v9;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v61 objects:v68 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        id v56 = v10;
        v57 = v9;
        v58 = v8;
        uint64_t v17 = *(void *)v62;
        BOOL v18 = 1;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v62 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v20 = *(void *)(*((void *)&v61 + 1) + 8 * i);
            uint64_t v21 = [v6 stringByAppendingPathComponent:v20];
            v22 = [v7 stringByAppendingPathComponent:v20];
            BOOL v18 = v18
               && [(PLPhotosStateLog *)self compressFileFromPath:v21 toPath:v22];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v61 objects:v68 count:16];
        }
        while (v16);
        uint64_t v9 = v57;
        uint64_t v8 = v58;
        id v10 = v56;
      }
      else
      {
        BOOL v18 = 1;
      }
      id v13 = v59;
    }
    else
    {
      id v14 = [v12 localizedDescription];
      logString(@"[PLLogging] Error creating directory %@: %@", v47, v48, v49, v50, v51, v52, v53, (uint64_t)v7);
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_30:

  return v18;
}

- (void)logDescription:(id)a3
{
  logTitleWithIndent(0, @"%@", (uint64_t)a3, v3, v4, v5, v6, v7, (uint64_t)a3);
}

- (void)_logAssets:(id)a3 forAlbum:(id)a4 indent:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v10 setDateFormat:@"yMMMdd-HH:mm:ss.SS"];
    int v11 = [v9 customKeyAsset];
    if (v9) {
      BOOL v12 = [v9 kindValue] == 1505;
    }
    else {
      BOOL v12 = 0;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__PLPhotosStateLog__logAssets_forAlbum_indent___block_invoke;
    v15[3] = &unk_1E586F850;
    id v16 = v11;
    id v17 = v10;
    BOOL v20 = v12;
    BOOL v18 = self;
    unint64_t v19 = a5;
    id v13 = v10;
    id v14 = v11;
    [v8 enumerateObjectsUsingBlock:v15];
  }
}

void __47__PLPhotosStateLog__logAssets_forAlbum_indent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v45 = a2;
  if (*(id *)(a1 + 32) == v45) {
    uint64_t v5 = @" (*)";
  }
  else {
    uint64_t v5 = &stru_1EEB2EB80;
  }
  uint64_t v43 = v5;
  uint64_t v6 = [v45 legacyFaces];
  if ([v6 count])
  {
    uint64_t v7 = NSString;
    id v8 = [v45 legacyFaces];
    objc_msgSend(v7, "stringWithFormat:", @" %lu legacyFaces", objc_msgSend(v8, "count"));
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = &stru_1EEB2EB80;
  }

  id v10 = [v45 locationData];
  int v11 = @" GPS";
  if (!v10) {
    int v11 = &stru_1EEB2EB80;
  }
  BOOL v12 = v11;

  uint64_t v40 = *(void *)(a1 + 56) + 1;
  uint64_t v42 = [v45 shortObjectIDURI];
  uint64_t v41 = [v45 uuid];
  [v45 effectiveThumbnailIndex];
  uint64_t v44 = [v45 shortenedFilePath];
  id v13 = *(void **)(a1 + 40);
  id v14 = [v45 dateCreated];
  uint64_t v15 = [v13 stringFromDate:v14];
  [v45 sortToken];
  [v45 cloudPlaceholderKind];
  if (*(unsigned char *)(a1 + 64))
  {
    v22 = NSString;
    [v45 cloudBatchPublishDate];
    uint64_t v39 = a1;
    uint64_t v23 = a3;
    v25 = char v24 = v9;
    [v22 stringWithFormat:@"cloud batch=%@", v25];
    v38 = BOOL v26 = v43;
    uint64_t v28 = (void *)v41;
    uint64_t v27 = (void *)v42;
    uint64_t v37 = v23;
    a1 = v39;
    logStringWithIndent(v40, @"%2zu: %@ UUID=%@ THUMB=%d \"%@\" %@ sort=%f placeholder=%d %@%@%@%@", v29, v30, v31, v32, v33, v34, v37);

    id v9 = v24;
  }
  else
  {
    BOOL v26 = v43;
    uint64_t v28 = (void *)v41;
    uint64_t v27 = (void *)v42;
    logStringWithIndent(v40, @"%2zu: %@ UUID=%@ THUMB=%d \"%@\" %@ sort=%f placeholder=%d %@%@%@%@", v16, v17, v18, v19, v20, v21, a3);
  }

  uint64_t v35 = [*(id *)(a1 + 48) photoLibrary];
  uint64_t v36 = [v35 managedObjectContext];
  objc_msgSend(v36, "refreshObject:mergeChanges:", v45, objc_msgSend(v45, "hasChanges"));
}

- (void)logAssetCounts
{
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v3 = [(PLPhotosStateLog *)self photoLibrary];
  [v3 getPhotoCount:&v35 videoCount:&v34];

  logString(@" ===== %u photos %u videos =====", v4, v5, v6, v7, v8, v9, v10, v35);
  int v11 = [(PLPhotosStateLog *)self photoLibrary];
  BOOL v12 = [v11 managedObjectContext];

  id v13 = (void *)MEMORY[0x1E4F1C0D0];
  id v14 = +[PLManagedAsset entityName];
  uint64_t v15 = [v13 fetchRequestWithEntityName:v14];

  [v15 setReturnsObjectsAsFaults:0];
  [v15 setFetchBatchSize:100];
  uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(complete != 0) AND (kind == %d)"];
  [v15 setPredicate:v16];

  uint64_t v17 = [v12 executeFetchRequest:v15 error:0];
  logString(@" ===== IMAGES =====", v18, v19, v20, v21, v22, v23, v24, 0);
  [(PLPhotosStateLog *)self _logAssets:v17 forAlbum:0 indent:0];
  id v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(complete != 0) AND (kind == %d)"];
  [v15 setPredicate:v25];

  BOOL v26 = [v12 executeFetchRequest:v15 error:0];
  logString(@" ===== VIDEOS =====", v27, v28, v29, v30, v31, v32, v33, 1);
  [(PLPhotosStateLog *)self _logAssets:v26 forAlbum:0 indent:0];
}

- (void)logAllAlbums
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  logTitleWithIndent(0, @"All Albums", v2, v3, v4, v5, v6, v7, v30);
  uint64_t v9 = [(PLPhotosStateLog *)self photoLibrary];
  uint64_t v10 = [v9 managedObjectContext];

  int v11 = (void *)MEMORY[0x1E4F1C0D0];
  BOOL v12 = +[PLGenericAlbum entityName];
  id v13 = [v11 fetchRequestWithEntityName:v12];

  id v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"kind" ascending:1];
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObject:v14];
  [v13 setSortDescriptors:v15];

  id v35 = 0;
  uint64_t v16 = [v10 executeFetchRequest:v13 error:&v35];
  id v17 = v35;
  uint64_t v24 = v17;
  if (v16)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v25 = v16;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v32;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v32 != v28) {
            objc_enumerationMutation(v25);
          }
          [(PLPhotosStateLog *)self logAlbum:*(void *)(*((void *)&v31 + 1) + 8 * v29++) index:0x7FFFFFFFFFFFFFFFLL indent:0 completeMetadata:0 printAssets:0];
        }
        while (v27 != v29);
        uint64_t v27 = [v25 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v27);
    }
  }
  else
  {
    logStringWithIndent(0, @"Failed to get albums: %@", v18, v19, v20, v21, v22, v23, (uint64_t)v17);
  }
}

- (void)logAlbumLists
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  logTitleWithIndent(0, @"Album Lists", v2, v3, v4, v5, v6, v7, v38);
  id v9 = objc_alloc(MEMORY[0x1E4F1C0D0]);
  uint64_t v10 = +[PLManagedAlbumList entityName];
  int v11 = (void *)[v9 initWithEntityName:v10];

  BOOL v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"identifier" ascending:1];
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObject:v12];
  [v11 setSortDescriptors:v13];

  id v14 = [(PLPhotosStateLog *)self photoLibrary];
  uint64_t v15 = [v14 managedObjectContext];
  id v49 = 0;
  uint64_t v16 = [v15 executeFetchRequest:v11 error:&v49];
  id v17 = v49;

  if (v16)
  {
    id v40 = v17;
    uint64_t v41 = v12;
    uint64_t v42 = v11;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v16;
    uint64_t v24 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v46 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v29 = [v28 shortObjectIDURI];
          uint64_t v30 = [v28 identifier];
          uint64_t v39 = [v28 _typeDescription];
          logStringWithIndent(0, @"%@ (%@) \"%@\"", v31, v32, v33, v34, v35, v36, (uint64_t)v29);

          uint64_t v37 = [v28 albums];
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __33__PLPhotosStateLog_logAlbumLists__block_invoke;
          v44[3] = &unk_1E586F828;
          v44[4] = self;
          v44[5] = 0;
          [v37 enumerateObjectsUsingBlock:v44];
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v25);
    }

    BOOL v12 = v41;
    int v11 = v42;
    id v17 = v40;
  }
  else
  {
    logStringWithIndent(0, @"Failed to fetch album lists: %@", v18, v19, v20, v21, v22, v23, (uint64_t)v17);
  }
}

uint64_t __33__PLPhotosStateLog_logAlbumLists__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) logAlbum:a2 index:a3 indent:*(void *)(a1 + 40) + 1 completeMetadata:0 printAssets:0];
}

- (void)logAlbum:(id)a3 index:(unint64_t)a4 indent:(unint64_t)a5 completeMetadata:(BOOL)a6 printAssets:(BOOL)a7
{
  BOOL v34 = a6;
  BOOL v35 = a7;
  id v9 = a3;
  id v36 = v9;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = &stru_1EEB2EB80;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lu: ", a4);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v9 = v36;
  }
  if ((int)[v9 pendingItemsCount] < 1)
  {
    int v11 = &stru_1EEB2EB80;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"pending=%d", objc_msgSend(v36, "pendingItemsCount"));
    int v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  BOOL v12 = [v36 shortObjectIDURI];
  id v13 = [v36 localizedTitle];
  id v14 = [v36 title];
  objc_opt_class();
  uint64_t v15 = [v36 _kindDescription];
  uint64_t v16 = [v36 kind];
  uint64_t v32 = [v36 uuid];
  logStringWithIndent(a5, @"%@%@ \"%@\" (\"%@\") %@ %@ (%@) UUID=%@ %@", v17, v18, v19, v20, v21, v22, (uint64_t)v10);

  if (v34)
  {
    uint64_t v23 = [v36 description];
    logStringWithIndent(a5, @"%@", v24, v25, v26, v27, v28, v29, (uint64_t)v23);
  }
  if (v35)
  {
    uint64_t v30 = [v36 assets];
    uint64_t v31 = [v30 array];
    [(PLPhotosStateLog *)self _logAssets:v31 forAlbum:v36 indent:a5];
  }
}

- (void)logMoments
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  verificationFailures = 0;
  uint64_t v2 = [(PLPhotosStateLog *)self photoLibrary];
  uint64_t v3 = [v2 managedObjectContext];

  logString(@"========== Moment Library ==========", v4, v5, v6, v7, v8, v9, v10, v82);
  id v98 = 0;
  int v11 = +[PLMoment allMomentsInManagedObjectContext:v3 error:&v98];
  id v12 = v98;
  v86 = v11;
  v87 = v3;
  v85 = v12;
  if (v11)
  {
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id obj = v11;
    uint64_t v20 = [obj countByEnumeratingWithState:&v94 objects:v101 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      id v22 = 0;
      uint64_t v89 = *(void *)v95;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v95 != v89) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void **)(*((void *)&v94 + 1) + 8 * i);
          if (v22)
          {
            uint64_t v25 = [*(id *)(*((void *)&v94 + 1) + 8 * i) representativeDate];
            uint64_t v26 = [v22 representativeDate];
            uint64_t v27 = [v25 compare:v26];

            if (v27 == -1)
            {
              ++verificationFailures;
              logString(@"VERIFICATION FAILURE **************************************** MIS-ORDERED MOMENT ****************************************", v28, v29, v30, v31, v32, v33, v34, v83);
            }
          }
          id v35 = v24;

          id v22 = v35;
          id v36 = [v22 uuid];
          uint64_t v37 = objc_msgSend(v22, "pl_shortDescription");
          uint64_t v38 = [v22 representativeDate];
          uint64_t v39 = [v22 title];
          [v22 cachedPhotosCount];
          [v22 cachedVideosCount];
          [v22 cachedCount];

          logStringWithIndent(1, @"<%@> %@, %@, %@. (%d P + %d V = %d)", v40, v41, v42, v43, v44, v45, (uint64_t)v36);
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v94 objects:v101 count:16];
      }
      while (v21);

      uint64_t v3 = v87;
    }
  }
  else
  {
    logString(@"Failed to fetch all moments %@", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v12);
  }
  long long v46 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Asset"];
  long long v47 = (void *)MEMORY[0x1E4F28BA0];
  long long v48 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForAssetsIncludedInMoments"), 1);
  v100[0] = v48;
  id v49 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"visibilityState", 2);
  v100[1] = v49;
  uint64_t v50 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == NULL"];
  v100[2] = v50;
  uint64_t v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:3];
  uint64_t v52 = [v47 andPredicateWithSubpredicates:v51];
  [v46 setPredicate:v52];

  uint64_t v53 = [v3 executeFetchRequest:v46 error:0];
  if ([v53 count])
  {
    ++verificationFailures;
    logString(@"VERIFICATION FAILURE **************************************** Orphaned Assets ****************************************", v54, v55, v56, v57, v58, v59, v60, @"moment");
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id v61 = v53;
    uint64_t v62 = [v61 countByEnumeratingWithState:&v90 objects:v99 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v91;
      do
      {
        for (uint64_t j = 0; j != v63; ++j)
        {
          if (*(void *)v91 != v64) {
            objc_enumerationMutation(v61);
          }
          id v66 = *(void **)(*((void *)&v90 + 1) + 8 * j);
          char v67 = [v66 shortObjectIDURI];
          id v68 = [v66 uuid];
          v84 = [v66 dateCreated];
          logStringWithIndent(1, @"%@ %@, %@", v69, v70, v71, v72, v73, v74, (uint64_t)v67);
        }
        uint64_t v63 = [v61 countByEnumeratingWithState:&v90 objects:v99 count:16];
      }
      while (v63);
    }

    uint64_t v3 = v87;
  }

  logString(@"Found %d VERIFICATION FAILURE(s)", v75, v76, v77, v78, v79, v80, v81, verificationFailures);
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PLPhotosStateLog)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLPhotosStateLog;
  uint64_t v6 = [(PLPhotosStateLog *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    dispatch_group_t v8 = dispatch_group_create();
    group = v7->_group;
    v7->_group = (OS_dispatch_group *)v8;
  }
  return v7;
}

@end