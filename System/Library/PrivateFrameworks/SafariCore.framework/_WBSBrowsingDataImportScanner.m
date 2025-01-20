@interface _WBSBrowsingDataImportScanner
- (BOOL)_isArchiveFileURL:(id)a3;
- (_WBSBrowsingDataImportScanner)init;
- (id)_createSandboxExtensionForURL:(id)a3;
- (void)_processFileForURL:(id)a3 isInUnarchivedFolder:(BOOL)a4 completionHandler:(id)a5;
- (void)_scanImportedURL:(id)a3 isInUnarchivedFolder:(BOOL)a4;
- (void)scanImportURLs:(id)a3 sandboxExtensions:(id)a4 completionHandler:(id)a5;
@end

@implementation _WBSBrowsingDataImportScanner

- (_WBSBrowsingDataImportScanner)init
{
  v14.receiver = self;
  v14.super_class = (Class)_WBSBrowsingDataImportScanner;
  v2 = [(_WBSBrowsingDataImportScanner *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_resultLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    fileManager = v3->_fileManager;
    v3->_fileManager = (NSFileManager *)v4;

    dispatch_group_t v6 = dispatch_group_create();
    scannerGroup = v3->_scannerGroup;
    v3->_scannerGroup = (OS_dispatch_group *)v6;

    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v8 = (void *)getDSArchiveServiceClass_softClass;
    uint64_t v19 = getDSArchiveServiceClass_softClass;
    if (!getDSArchiveServiceClass_softClass)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __getDSArchiveServiceClass_block_invoke;
      v15[3] = &unk_1E6159628;
      v15[4] = &v16;
      __getDSArchiveServiceClass_block_invoke((uint64_t)v15);
      v8 = (void *)v17[3];
    }
    v9 = v8;
    _Block_object_dispose(&v16, 8);
    v10 = (DSArchiveService *)objc_alloc_init(v9);
    archiveService = v3->_archiveService;
    v3->_archiveService = v10;

    v12 = v3;
  }

  return v3;
}

- (void)scanImportURLs:(id)a3 sandboxExtensions:(id)a4 completionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([v7 count])
  {
    fileManager = self->_fileManager;
    v10 = [v7 firstObject];
    id v37 = 0;
    v11 = [(NSFileManager *)fileManager safari_createTemporaryDirectoryAppropriateForURL:v10 error:&v37];
    id v12 = v37;
    temporaryUnarchiveDestinationFolder = self->_temporaryUnarchiveDestinationFolder;
    self->_temporaryUnarchiveDestinationFolder = v11;

    objc_super v14 = self->_temporaryUnarchiveDestinationFolder;
    if (v14)
    {
      id v36 = v12;
      objc_msgSend(MEMORY[0x1E4F28CB0], "safari_fileHandleWithURL:options:createMode:error:", v14, 0x100000, 0, &v36);
      v15 = (NSFileHandle *)objc_claimAutoreleasedReturnValue();
      id v16 = v36;

      temporaryUnarchiveDestinationFileHandle = self->_temporaryUnarchiveDestinationFileHandle;
      self->_temporaryUnarchiveDestinationFileHandle = v15;

      if (self->_temporaryUnarchiveDestinationFileHandle)
      {
        uint64_t v18 = [(_WBSBrowsingDataImportScanner *)self _createSandboxExtensionForURL:self->_temporaryUnarchiveDestinationFolder];
        temporaryUnarchiveDestinationFolderSandboxExtension = self->_temporaryUnarchiveDestinationFolderSandboxExtension;
        self->_temporaryUnarchiveDestinationFolderSandboxExtension = v18;

        v20 = [MEMORY[0x1E4F1CA60] dictionary];
        results = self->_results;
        self->_results = v20;

        dispatch_group_enter((dispatch_group_t)self->_scannerGroup);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v22 = v7;
        uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:v38 count:16];
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v25 = *(void *)v33;
          do
          {
            uint64_t v26 = 0;
            do
            {
              if (*(void *)v33 != v25) {
                objc_enumerationMutation(v22);
              }
              [(_WBSBrowsingDataImportScanner *)self _scanImportedURL:*(void *)(*((void *)&v32 + 1) + 8 * v26++) isInUnarchivedFolder:0];
            }
            while (v24 != v26);
            uint64_t v24 = [v22 countByEnumeratingWithState:&v32 objects:v38 count:16];
          }
          while (v24);
        }

        scannerGroup = self->_scannerGroup;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __84___WBSBrowsingDataImportScanner_scanImportURLs_sandboxExtensions_completionHandler___block_invoke;
        v30[3] = &unk_1E615A6A0;
        v30[4] = self;
        id v31 = v8;
        dispatch_group_notify(scannerGroup, MEMORY[0x1E4F14428], v30);
        dispatch_group_leave((dispatch_group_t)self->_scannerGroup);
      }
      else
      {
        v29 = WBS_LOG_CHANNEL_PREFIXImport();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[_WBSBrowsingDataImportScanner scanImportURLs:sandboxExtensions:completionHandler:](v29);
        }
        (*((void (**)(id, void, id))v8 + 2))(v8, 0, v16);
      }
      id v12 = v16;
    }
    else
    {
      v28 = WBS_LOG_CHANNEL_PREFIXImport();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[_WBSBrowsingDataImportScanner scanImportURLs:sandboxExtensions:completionHandler:](v28);
      }
      (*((void (**)(id, void, id))v8 + 2))(v8, 0, v12);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CC08], 0);
  }
}

- (void)_scanImportedURL:(id)a3 isInUnarchivedFolder:(BOOL)a4
{
  BOOL v4 = a4;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v26 = 0;
  fileManager = self->_fileManager;
  id v8 = [v6 path];
  LODWORD(fileManager) = [(NSFileManager *)fileManager fileExistsAtPath:v8 isDirectory:&v26];

  if (fileManager)
  {
    if (v26)
    {
      v9 = self->_fileManager;
      uint64_t v10 = *MEMORY[0x1E4F1C628];
      v27[0] = *MEMORY[0x1E4F1C628];
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      id v12 = [(NSFileManager *)v9 enumeratorAtURL:v6 includingPropertiesForKeys:v11 options:6 errorHandler:0];

      uint64_t v13 = [v12 nextObject];
      if (v13)
      {
        objc_super v14 = (void *)v13;
        do
        {
          id v22 = 0;
          [v14 getResourceValue:&v22 forKey:v10 error:0];
          id v15 = v22;
          if (([v15 BOOLValue] & 1) == 0) {
            [(_WBSBrowsingDataImportScanner *)self _scanImportedURL:v14 isInUnarchivedFolder:v4];
          }

          uint64_t v16 = [v12 nextObject];

          objc_super v14 = (void *)v16;
        }
        while (v16);
      }
    }
    else if ([(_WBSBrowsingDataImportScanner *)self _isArchiveFileURL:v6])
    {
      v17 = [v6 lastPathComponent];
      uint64_t v18 = [v17 stringByDeletingPathExtension];

      uint64_t v19 = [(NSFileManager *)self->_fileManager safari_createDirectoryWithUniqueName:v18 relativeToDirectoryFileHandle:self->_temporaryUnarchiveDestinationFileHandle error:0];
      dispatch_group_enter((dispatch_group_t)self->_scannerGroup);
      archiveService = self->_archiveService;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __71___WBSBrowsingDataImportScanner__scanImportedURL_isInUnarchivedFolder___block_invoke;
      v25[3] = &unk_1E615DC00;
      v25[4] = self;
      id v21 = (id)[(DSArchiveService *)archiveService unarchiveItemAtURL:v6 toURL:v19 options:0 acceptedFormats:1 passphrases:0 completionHandler:v25];
    }
    else
    {
      dispatch_group_enter((dispatch_group_t)self->_scannerGroup);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __71___WBSBrowsingDataImportScanner__scanImportedURL_isInUnarchivedFolder___block_invoke_73;
      v23[3] = &unk_1E615DC28;
      v23[4] = self;
      id v24 = v6;
      [(_WBSBrowsingDataImportScanner *)self _processFileForURL:v24 isInUnarchivedFolder:v4 completionHandler:v23];
    }
  }
}

- (BOOL)_isArchiveFileURL:(id)a3
{
  uint64_t v3 = _isArchiveFileURL__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_isArchiveFileURL__onceToken, &__block_literal_global_78);
  }
  v5 = (void *)_isArchiveFileURL__archiveExtensions;
  id v6 = [v4 pathExtension];

  id v7 = [v6 lowercaseString];
  LOBYTE(v5) = [v5 containsObject:v7];

  return (char)v5;
}

- (id)_createSandboxExtensionForURL:(id)a3
{
  id v3 = a3;
  [v3 fileSystemRepresentation];
  id v4 = (const char *)sandbox_extension_issue_file();
  if (v4)
  {
    v5 = (void *)[[NSString alloc] initWithBytesNoCopy:v4 length:strlen(v4) encoding:4 freeWhenDone:1];
  }
  else
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXImport();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_WBSBrowsingDataImportScanner _createSandboxExtensionForURL:]((uint64_t)v3, v6);
    }
    v5 = 0;
  }

  return v5;
}

- (void)_processFileForURL:(id)a3 isInUnarchivedFolder:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __91___WBSBrowsingDataImportScanner__processFileForURL_isInUnarchivedFolder_completionHandler___block_invoke;
  aBlock[3] = &unk_1E615DC50;
  BOOL v30 = a4;
  aBlock[4] = self;
  id v10 = v9;
  id v29 = v10;
  v11 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v12 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v13 = [v8 pathExtension];
  if ([v13 isEqualToString:@"html"])
  {
    BOOL v14 = +[WBSNetscapeBookmarkFileReader looksLikeBookmarkFile:v8];

    if (v14)
    {
      [v12 setObject:@"bookmark" forKeyedSubscript:@"data_type"];
LABEL_11:
      v11[2](v11, v12);
      goto LABEL_15;
    }
  }
  else
  {
  }
  id v15 = [v8 pathExtension];
  int v16 = [v15 isEqualToString:@"json"];

  if (v16)
  {
    v17 = WBSLoadMetadataDictionaryFromURL((uint64_t)v8, 0);
    uint64_t v18 = [v17 mutableCopy];

    v11[2](v11, (void *)v18);
    id v12 = (void *)v18;
  }
  else
  {
    uint64_t v19 = [v8 pathExtension];
    int v20 = [v19 isEqualToString:@"csv"];

    if (v20)
    {
      id v21 = objc_alloc_init(NSClassFromString(&cfstr_Wbspasswordsda.isa));
      id v22 = v21;
      if (v21)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __91___WBSBrowsingDataImportScanner__processFileForURL_isInUnarchivedFolder_completionHandler___block_invoke_2;
        block[3] = &unk_1E615D520;
        id v24 = v21;
        id v25 = v8;
        id v26 = v12;
        v27 = v11;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      else
      {
        v11[2](v11, v12);
      }
    }
    else
    {
      if ([v12 count]) {
        goto LABEL_11;
      }
      (*((void (**)(id, void *))v10 + 2))(v10, v12);
    }
  }
LABEL_15:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveService, 0);
  objc_storeStrong((id *)&self->_temporaryUnarchiveDestinationFolderSandboxExtension, 0);
  objc_storeStrong((id *)&self->_temporaryUnarchiveDestinationFileHandle, 0);
  objc_storeStrong((id *)&self->_temporaryUnarchiveDestinationFolder, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_scannerGroup, 0);
}

- (void)scanImportURLs:(void *)a1 sandboxExtensions:completionHandler:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v4, v5, "Unable to create a temporary directory to unarchive files: %{public}@", v6, v7, v8, v9, v10);
}

- (void)scanImportURLs:(void *)a1 sandboxExtensions:completionHandler:.cold.2(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_2(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_0_3(&dword_1B728F000, v4, v5, "Unable to obtain file handle to temporary directory to unarchive files: %{public}@", v6, v7, v8, v9, v10);
}

- (void)_createSandboxExtensionForURL:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = *__error();
  int v5 = 138478083;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_1B728F000, v3, OS_LOG_TYPE_ERROR, "Can't issue extension to %{private}@: %{errno}i", (uint8_t *)&v5, 0x12u);
}

@end