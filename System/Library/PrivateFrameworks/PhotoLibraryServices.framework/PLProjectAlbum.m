@interface PLProjectAlbum
+ (BOOL)cleanupOrphanedProjectPreviewImagesInLibrary:(id)a3 error:(id *)a4;
+ (id)albumSupportsAssetOrderKeysPredicate;
+ (id)entityName;
+ (id)insertIntoPhotoLibrary:(id)a3 withUUID:(id)a4 documentType:(id)a5 projectExtensionIdentifier:(id)a6;
+ (id)validKindsForPersistence;
- (BOOL)canPerformEditOperation:(unint64_t)a3;
- (BOOL)setProjectPreviewImageData:(id)a3 error:(id *)a4;
- (BOOL)supportsAssetOrderKeys;
- (id)_previewImageFilename;
- (id)duplicateProjectPreviewImageData:(id)a3 error:(id *)a4;
- (id)payloadForChangedKeys:(id)a3;
- (id)projectPreviewImageData;
- (void)awakeFromInsert;
- (void)prepareForDeletion;
- (void)willSave;
@end

@implementation PLProjectAlbum

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  if ([(PLManagedAlbum *)self isValidForPersistence]) {
    v5 = [(PLManagedObjectJournalEntryPayload *)[PLProjectAlbumJournalEntryPayload alloc] initWithManagedObject:self changedKeys:v4];
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (BOOL)supportsAssetOrderKeys
{
  return [(PLGenericAlbum *)self kindValue] == 1508;
}

- (id)_previewImageFilename
{
  v2 = [(PLProjectAlbum *)self projectRenderUuid];
  v3 = [v2 stringByAppendingPathExtension:@"tiff"];

  return v3;
}

- (BOOL)setProjectPreviewImageData:(id)a3 error:(id *)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  CFDataRef v6 = (const __CFData *)a3;
  v7 = [(PLGenericAlbum *)self photoLibrary];
  v8 = [v7 pathManager];
  id v38 = 0;
  BOOL v9 = 1;
  v10 = [v8 photoDirectoryWithType:15 createIfNeeded:1 error:&v38];
  id v11 = v38;

  if (!v10)
  {
LABEL_23:
    if (!a4) {
      goto LABEL_25;
    }
LABEL_24:
    *a4 = v11;
    goto LABEL_25;
  }
  if (!v6) {
    goto LABEL_14;
  }
  v12 = CGImageSourceCreateWithData(v6, 0);
  if (!v12)
  {
    v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v39 = *MEMORY[0x1E4F28568];
    v40 = @"Unable to read image data";
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    uint64_t v33 = [v31 errorWithDomain:@"com.apple.photos.backend" code:0 userInfo:v32];

LABEL_22:
    BOOL v9 = 0;
    id v11 = (id)v33;
    goto LABEL_23;
  }
  v13 = v12;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v12, 0, 0);
  if (!ImageAtIndex)
  {
    v34 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v41 = *MEMORY[0x1E4F28568];
    v42 = @"Unable to read image data";
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    uint64_t v33 = [v34 errorWithDomain:@"com.apple.photos.backend" code:0 userInfo:v35];

    CFRelease(v13);
    goto LABEL_22;
  }
  v15 = ImageAtIndex;
  size_t Width = CGImageGetWidth(ImageAtIndex);
  size_t Height = CGImageGetHeight(v15);
  BOOL v18 = Width == 1024 && Height == 1024;
  int v19 = v18;
  if (!v18)
  {
    int v37 = v19;
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F28568];
    v21 = [NSString stringWithFormat:@"Invalid image size, project preview images must be %ld x %ld", 1024, 1024];
    v44[0] = v21;
    v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
    uint64_t v23 = [v20 errorWithDomain:@"com.apple.photos.backend" code:0 userInfo:v22];

    id v11 = (id)v23;
    int v19 = v37;
  }
  CGImageRelease(v15);
  CFRelease(v13);
  if (!v19)
  {
    BOOL v9 = 0;
    if (!a4) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_14:
  v24 = [(PLProjectAlbum *)self projectRenderUuid];

  if (v24)
  {
    v25 = [(PLProjectAlbum *)self _previewImageFilename];
    v26 = [v10 stringByAppendingPathComponent:v25];

    v27 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v27 removeItemAtPath:v26 error:0];

    [(PLProjectAlbum *)self setProjectRenderUuid:0];
  }
  if (v6)
  {
    v28 = [MEMORY[0x1E4F8BA08] UUIDString];
    [(PLProjectAlbum *)self setProjectRenderUuid:v28];

    v29 = [(PLProjectAlbum *)self _previewImageFilename];
    v30 = [v10 stringByAppendingPathComponent:v29];

    [(__CFData *)v6 writeToFile:v30 atomically:0];
  }
  BOOL v9 = 1;
  if (a4) {
    goto LABEL_24;
  }
LABEL_25:

  return v9;
}

- (id)duplicateProjectPreviewImageData:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PLProjectAlbum *)self _previewImageFilename];
  if (v7)
  {
    id v8 = v6;
    BOOL v9 = [(PLGenericAlbum *)self photoLibrary];
    v10 = [v9 pathManager];
    id v11 = [v10 photoDirectoryWithType:15 createIfNeeded:1 error:a4];

    if (v11)
    {
      v12 = [v11 stringByAppendingPathComponent:v7];
      v13 = [v12 pathExtension];
      v14 = [v8 stringByAppendingPathExtension:v13];
      v15 = [v11 stringByAppendingPathComponent:v14];

      v16 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v22 = 0;
      char v17 = [v16 copyItemAtPath:v12 toPath:v15 error:&v22];
      id v18 = v22;

      if ((v17 & 1) == 0)
      {
        int v19 = PLBackendGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v18;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Unable to copy rendered preview data with error %@", buf, 0xCu);
        }

        id v8 = 0;
        if (a4) {
          *a4 = v18;
        }
      }

      id v8 = v8;
      v20 = v8;
    }
    else
    {
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)projectPreviewImageData
{
  v3 = [(PLProjectAlbum *)self projectRenderUuid];

  if (v3)
  {
    id v4 = [(PLGenericAlbum *)self photoLibrary];
    v5 = [v4 pathManager];
    id v6 = [v5 photoDirectoryWithType:15];

    v7 = [(PLProjectAlbum *)self _previewImageFilename];
    id v8 = [v6 stringByAppendingPathComponent:v7];

    BOOL v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v8];
  }
  else
  {
    BOOL v9 = 0;
  }
  return v9;
}

- (void)prepareForDeletion
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  BOOL v3 = [(PLProjectAlbum *)self setProjectPreviewImageData:0 error:&v8];
  id v4 = v8;
  if (!v3)
  {
    v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [(PLProjectAlbum *)self uuid];
      *(_DWORD *)buf = 138412546;
      v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Clean up project preview image failed for project %@, error %@", buf, 0x16u);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)PLProjectAlbum;
  [(PLManagedAlbum *)&v7 prepareForDeletion];
}

- (void)willSave
{
  v9.receiver = self;
  v9.super_class = (Class)PLProjectAlbum;
  [(PLManagedAlbum *)&v9 willSave];
  BOOL v3 = [(PLProjectAlbum *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_opt_class();
    v5 = [v3 photoLibrary];
    id v6 = [v4 projectAlbumRootFolderInLibrary:v5];

    if ([(PLProjectAlbum *)self isInserted])
    {
      objc_super v7 = [v6 childCollections];
      char v8 = [v7 containsObject:self];

      if ((v8 & 1) == 0) {
        [v6 addChildCollectionsObject:self];
      }
    }
  }
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  return (a3 & 1) == 0;
}

- (void)awakeFromInsert
{
  v3.receiver = self;
  v3.super_class = (Class)PLProjectAlbum;
  [(PLGenericAlbum *)&v3 awakeFromInsert];
  [(PLGenericAlbum *)self setKindValue:1508];
}

+ (id)validKindsForPersistence
{
  pl_dispatch_once();
  v2 = (void *)validKindsForPersistence_pl_once_object_21;
  return v2;
}

void __42__PLProjectAlbum_validKindsForPersistence__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CBF0] copy];
  v1 = (void *)validKindsForPersistence_pl_once_object_21;
  validKindsForPersistence_pl_once_object_21 = v0;
}

+ (id)albumSupportsAssetOrderKeysPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 1508);
}

+ (BOOL)cleanupOrphanedProjectPreviewImagesInLibrary:(id)a3 error:(id *)a4
{
  v85[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 pathManager];
  objc_super v7 = [v6 photoDirectoryWithType:15 createIfNeeded:0 error:0];

  char v8 = PLBackendGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v79 = v7;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Running maintenance on project render directory: %@", buf, 0xCu);
  }

  char v76 = 0;
  objc_super v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v10 = [v9 fileExistsAtPath:v7 isDirectory:&v76];

  if (v10 && v76)
  {
    __int16 v11 = +[PLProjectAlbum fetchRequest];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != nil", @"projectRenderUuid");
    uint64_t v13 = (void *)MEMORY[0x1E4F28F60];
    v85[0] = @"com.apple.photos.projects.legacy.calendar";
    v85[1] = @"com.apple.photos.projects.legacy.prints";
    v85[2] = @"com.apple.photos.projects.legacy.card";
    v85[3] = @"com.apple.photos.projects.legacy.book";
    v85[4] = @"com.apple.photos.projects.slideshow";
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:5];
    uint64_t v15 = [v13 predicateWithFormat:@"NOT %K IN %@", @"projectDocumentType", v14];

    v16 = (void *)MEMORY[0x1E4F28BA0];
    v59 = (void *)v15;
    v60 = (void *)v12;
    v84[0] = v12;
    v84[1] = v15;
    char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
    id v18 = [v16 andPredicateWithSubpredicates:v17];
    [v11 setPredicate:v18];

    v83 = @"projectRenderUuid";
    int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
    [v11 setPropertiesToFetch:v19];

    [v11 setFetchBatchSize:100];
    v20 = [v5 managedObjectContext];
    id v75 = 0;
    uint64_t v21 = [v20 executeFetchRequest:v11 error:&v75];
    id v22 = v75;

    v61 = (void *)v21;
    if (v21)
    {
      uint64_t v23 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v74 = v22;
      id v24 = [v23 contentsOfDirectoryAtPath:v7 error:&v74];
      id v25 = v74;

      char v64 = v24 != 0;
      id v26 = (id)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v24];

      if (v24)
      {
        id v55 = v25;
        v56 = v11;
        v63 = v7;
        v57 = a4;
        id v58 = v5;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        id v27 = v61;
        uint64_t v28 = [v27 countByEnumeratingWithState:&v70 objects:v82 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v71;
          do
          {
            uint64_t v31 = 0;
            uint64_t v62 = v29;
            do
            {
              if (*(void *)v71 != v30) {
                objc_enumerationMutation(v27);
              }
              v32 = *(void **)(*((void *)&v70 + 1) + 8 * v31);
              uint64_t v33 = (void *)MEMORY[0x19F38D3B0]();
              v34 = [v32 _previewImageFilename];
              if ([v26 containsObject:v34])
              {
                [v26 removeObject:v34];
              }
              else
              {
                v35 = PLBackendGetLog();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                {
                  [v32 uuid];
                  uint64_t v36 = v30;
                  id v37 = v26;
                  v39 = id v38 = v27;
                  v40 = [v32 projectRenderUuid];
                  *(_DWORD *)buf = 138412546;
                  v79 = v39;
                  __int16 v80 = 2112;
                  v81 = v40;
                  _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEFAULT, "Project %@ has a render uuid (%@) but is missing corresponding image file, resetting render uuid", buf, 0x16u);

                  id v27 = v38;
                  id v26 = v37;
                  uint64_t v30 = v36;
                  uint64_t v29 = v62;
                }

                [v32 setProjectRenderUuid:0];
              }

              ++v31;
            }
            while (v29 != v31);
            uint64_t v29 = [v27 countByEnumeratingWithState:&v70 objects:v82 count:16];
          }
          while (v29);
        }

        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v26 = v26;
        uint64_t v41 = [v26 countByEnumeratingWithState:&v66 objects:v77 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v67;
          id v22 = v55;
          do
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v67 != v43) {
                objc_enumerationMutation(v26);
              }
              v45 = *(void **)(*((void *)&v66 + 1) + 8 * i);
              if (([v45 hasPrefix:@"."] & 1) == 0)
              {
                v46 = [v63 stringByAppendingPathComponent:v45];
                v47 = PLBackendGetLog();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v79 = v45;
                  _os_log_impl(&dword_19B3C7000, v47, OS_LOG_TYPE_DEFAULT, "Removing orphaned project render image: %@", buf, 0xCu);
                }

                v48 = [MEMORY[0x1E4F28CB8] defaultManager];
                id v65 = v22;
                char v64 = [v48 removeItemAtPath:v46 error:&v65];
                id v49 = v65;

                id v22 = v49;
              }
            }
            uint64_t v42 = [v26 countByEnumeratingWithState:&v66 objects:v77 count:16];
          }
          while (v42);
        }
        else
        {
          id v22 = v55;
        }

        a4 = v57;
        id v5 = v58;
        objc_super v7 = v63;
        __int16 v11 = v56;
        char v54 = v64;
      }
      else
      {
        char v54 = 0;
        id v22 = v25;
      }
    }
    else
    {
      id v26 = 0;
      char v54 = 0;
    }

    BOOL v52 = v54 & 1;
    if (!a4) {
      goto LABEL_40;
    }
LABEL_39:
    *a4 = v22;
    goto LABEL_40;
  }
  if (v76) {
    int v50 = 0;
  }
  else {
    int v50 = v10;
  }
  if (v50 == 1)
  {
    v51 = PLBackendGetLog();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v79 = v7;
      _os_log_impl(&dword_19B3C7000, v51, OS_LOG_TYPE_ERROR, "Project data directory path points to a file: %@", buf, 0xCu);
    }
  }
  id v22 = 0;
  BOOL v52 = 1;
  if (a4) {
    goto LABEL_39;
  }
LABEL_40:

  return v52;
}

+ (id)insertIntoPhotoLibrary:(id)a3 withUUID:(id)a4 documentType:(id)a5 projectExtensionIdentifier:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [a3 managedObjectContext];
  uint64_t v13 = +[PLManagedObject insertInManagedObjectContext:v12];

  if (v13)
  {
    [v13 setUuid:v9];
    [v13 setProjectDocumentType:v10];
    [v13 setProjectExtensionIdentifier:v11];
  }

  return v13;
}

+ (id)entityName
{
  return @"ProjectAlbum";
}

@end