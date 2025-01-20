@interface PLPhotoLibraryImportValidation
- (BOOL)checkLegacyLibraryRequiresRepairWithError:(id *)a3;
- (BOOL)checkLegacyLibraryVersionStatusWithError:(id *)a3;
- (BOOL)checkLibraryCPLStatusWithError:(id *)a3;
- (BOOL)checkLibraryVersionStatusWithError:(id *)a3;
- (BOOL)isLibraryValidForImportWithError:(id *)a3;
- (PLPhotoLibraryImportValidation)initWithLibraryManager:(id)a3;
@end

@implementation PLPhotoLibraryImportValidation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pm, 0);
  objc_storeStrong((id *)&self->_fm, 0);
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
}

- (BOOL)checkLegacyLibraryRequiresRepairWithError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

- (BOOL)checkLegacyLibraryVersionStatusWithError:(id *)a3
{
  v43[1] = *MEMORY[0x1E4F143B8];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__108465;
  v36 = __Block_byref_object_dispose__108466;
  id v37 = 0;
  v5 = [(PLPhotoLibraryPathManager *)self->_pm libraryURL];
  id v31 = 0;
  v6 = [v5 bookmarkDataWithOptions:0 includingResourceValuesForKeys:0 relativeToURL:0 error:&v31];
  id v7 = v31;

  if (v6)
  {
    v8 = [objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.Photos.Migration"];
    v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EECD1DB8];
    [v8 setRemoteObjectInterface:v9];

    [v8 resume];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __75__PLPhotoLibraryImportValidation_checkLegacyLibraryVersionStatusWithError___block_invoke;
    v30[3] = &unk_1E5874CF8;
    v30[4] = &v32;
    v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v30];
    v11 = v10;
    if (v10)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __75__PLPhotoLibraryImportValidation_checkLegacyLibraryVersionStatusWithError___block_invoke_71;
      v29[3] = &unk_1E5873FB0;
      v29[4] = &v32;
      [v10 getMigrationStateForLibraryBookmark:v6 withReply:v29];
    }
    else
    {
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v42 = *MEMORY[0x1E4F28568];
      v43[0] = @"Failed to establish connection to the migration service";
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
      uint64_t v19 = [v17 errorWithDomain:*MEMORY[0x1E4F8C500] code:72008 userInfo:v18];
      v20 = (void *)v33[5];
      v33[5] = v19;

      v21 = PLBackendGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = v33[5];
        *(_DWORD *)buf = 138543362;
        uint64_t v41 = v22;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "[ImportLibraryValidation] Processing error: %{public}@", buf, 0xCu);
      }
    }
    [v8 invalidate];
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    v39 = @"Missing bookmark data";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    uint64_t v14 = [v12 errorWithDomain:*MEMORY[0x1E4F8C500] code:72008 userInfo:v13];
    v15 = (void *)v33[5];
    v33[5] = v14;

    v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v33[5];
      *(_DWORD *)buf = 138543362;
      uint64_t v41 = v16;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "[ImportLibraryValidation] Processing error: %{public}@", buf, 0xCu);
    }
  }

  v23 = v33;
  v25 = (id *)(v33 + 5);
  v24 = (void *)v33[5];
  if (v24)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id obj = 0;
  [(PLPhotoLibraryImportValidation *)self checkLegacyLibraryRequiresRepairWithError:&obj];
  objc_storeStrong(v25, obj);
  v23 = v33;
  v24 = (void *)v33[5];
  if (a3)
  {
LABEL_14:
    *a3 = v24;
    v23 = v33;
  }
LABEL_15:
  BOOL v26 = v23[5] == 0;

  _Block_object_dispose(&v32, 8);
  return v26;
}

void __75__PLPhotoLibraryImportValidation_checkLegacyLibraryVersionStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F8C500];
  if (v3)
  {
    uint64_t v15 = *MEMORY[0x1E4F28A50];
    v16[0] = v3;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = [v5 errorWithDomain:v6 code:72008 userInfo:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (v4) {
  v11 = PLBackendGetLog();
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v13 = 138543362;
    uint64_t v14 = v12;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "[ImportLibraryValidation] Error detected connecting to the service. Error: %{public}@", (uint8_t *)&v13, 0xCu);
  }
}

void __75__PLPhotoLibraryImportValidation_checkLegacyLibraryVersionStatusWithError___block_invoke_71(uint64_t a1, uint64_t a2, void *a3)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if ((unint64_t)(a2 - 1) < 3)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F8C500];
    if (v5)
    {
      uint64_t v20 = *MEMORY[0x1E4F28A50];
      id v21 = v5;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    }
    else
    {
      uint64_t v9 = 0;
    }
    uint64_t v12 = 72003;
LABEL_14:
    int v13 = v7;
    uint64_t v14 = v8;
    goto LABEL_15;
  }
  if (a2 == 5)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F8C500];
    if (v5)
    {
      uint64_t v18 = *MEMORY[0x1E4F28A50];
      id v19 = v5;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    }
    else
    {
      uint64_t v9 = 0;
    }
    uint64_t v12 = 72009;
    goto LABEL_14;
  }
  if (a2) {
    goto LABEL_17;
  }
  v10 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F8C500];
  if (v5)
  {
    uint64_t v22 = *MEMORY[0x1E4F28A50];
    v23[0] = v5;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  }
  else
  {
    uint64_t v9 = 0;
  }
  int v13 = v10;
  uint64_t v14 = v11;
  uint64_t v12 = 72001;
LABEL_15:
  uint64_t v15 = [v13 errorWithDomain:v14 code:v12 userInfo:v9];
  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  if (v6) {
LABEL_17:
  }
}

- (BOOL)checkLibraryVersionStatusWithError:(id *)a3
{
  unsigned __int8 v18 = 0;
  fm = self->_fm;
  uint64_t v6 = [(PLPhotoLibraryPathManager *)self->_pm photosDatabasePath];
  LODWORD(fm) = [(NSFileManager *)fm fileExistsAtPath:v6 isDirectory:&v18];
  int v7 = v18;

  if (fm) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    uint64_t v11 = [(PLLibraryServicesManager *)self->_libraryServicesManager modelMigrator];
    uint64_t v12 = [v11 legacyMigrationState];

    switch(v12)
    {
      case 0:
        id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:72001 userInfo:0];
        break;
      case 1:
      case 3:
      case 4:
        v17 = 0;
        BOOL v9 = [(PLPhotoLibraryImportValidation *)self checkLegacyLibraryVersionStatusWithError:&v17];
        v10 = v17;
        goto LABEL_13;
      case 2:
        uint64_t v16 = 0;
        BOOL v9 = [(PLPhotoLibraryImportValidation *)self checkLegacyLibraryRequiresRepairWithError:&v16];
        v10 = v16;
        goto LABEL_13;
      default:
        id v13 = 0;
        break;
    }
    BOOL v9 = 0;
    if (a3) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v15 = 0;
    BOOL v9 = [(PLPhotoLibraryImportValidation *)self checkLegacyLibraryVersionStatusWithError:&v15];
    v10 = v15;
LABEL_13:
    id v13 = v10;
    if (a3) {
LABEL_14:
    }
      *a3 = v13;
  }

  return v9;
}

- (BOOL)checkLibraryCPLStatusWithError:(id *)a3
{
  id v5 = [(PLPhotoLibraryPathManager *)self->_pm libraryURL];
  int v6 = PLIsCloudPhotoLibraryEnabledForPhotoLibraryURL(v5);

  if (v6)
  {
    int v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:72006 userInfo:0];
    BOOL v8 = 0;
    if (!a3) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  char v14 = 0;
  fm = self->_fm;
  v10 = [(PLPhotoLibraryPathManager *)self->_pm disableICloudPhotosFilePath];
  BOOL v11 = [(NSFileManager *)fm fileExistsAtPath:v10 isDirectory:&v14];
  if (v14) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = v11;
  }

  if (v12)
  {
    int v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:72007 userInfo:0];
  }
  else
  {
    int v7 = 0;
  }
  BOOL v8 = !v12;
  if (a3) {
LABEL_11:
  }
    *a3 = v7;
LABEL_12:

  return v8;
}

- (BOOL)isLibraryValidForImportWithError:(id *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:72002 userInfo:0];
  id v5 = PLBackendGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    BOOL v8 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "[ImportLibraryValidation] Library is invalid for import. Error: %@", (uint8_t *)&v7, 0xCu);
  }

  if (a3) {
    *a3 = v4;
  }

  return 0;
}

- (PLPhotoLibraryImportValidation)initWithLibraryManager:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    char v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PLPhotoLibraryImportValidation.m", 32, @"Invalid parameter not satisfying: %@", @"manager" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PLPhotoLibraryImportValidation;
  int v7 = [(PLPhotoLibraryImportValidation *)&v15 init];
  BOOL v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_libraryServicesManager, a3);
    uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
    fm = v8->_fm;
    v8->_fm = (NSFileManager *)v9;

    uint64_t v11 = [(PLLibraryServicesManager *)v8->_libraryServicesManager pathManager];
    pm = v8->_pm;
    v8->_pm = (PLPhotoLibraryPathManager *)v11;
  }
  return v8;
}

@end