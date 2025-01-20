@interface PLPhotoLibraryAttributesChangeRequestServiceHandler
- (BOOL)_updateDataclass:(id)a3 onAccount:(id)a4 enabled:(BOOL)a5;
- (BOOL)applyChangesWithLibrary:(id)a3 error:(id *)a4;
- (BOOL)validateChangesWithLibrary:(id)a3 error:(id *)a4;
- (PLPhotoLibraryAttributesChangeRequestServiceHandler)initWithPhotoLibraryAttributesChanges:(id)a3 clientAuthorization:(id)a4;
- (PLPhotoLibraryAttributesChanges)changes;
- (int64_t)accessScopeOptionsRequirement;
@end

@implementation PLPhotoLibraryAttributesChangeRequestServiceHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_clientAuthorization, 0);
}

- (PLPhotoLibraryAttributesChanges)changes
{
  return (PLPhotoLibraryAttributesChanges *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)_updateDataclass:(id)a3 onAccount:(id)a4 enabled:(BOOL)a5
{
  unsigned int v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v8 || (int v10 = [v8 isEnabledForDataclass:v7], v10 == v5))
  {
    BOOL v11 = 0;
  }
  else
  {
    [v9 setEnabled:v10 ^ 1 | v5 forDataclass:v7];
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)applyChangesWithLibrary:(id)a3 error:(id *)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PLPhotoLibraryAttributesChangeRequestServiceHandler *)self changes];
  id v8 = [v7 enableCloudSyncValue];

  v9 = [(PLPhotoLibraryAttributesChangeRequestServiceHandler *)self changes];
  int v10 = [v9 cloudResourcePrefetchModeValue];

  BOOL v11 = +[PLPhotoLibraryBundleController sharedBundleController];
  v12 = [v6 pathManager];
  v13 = [v12 libraryURL];
  v14 = [v11 openBundleAtLibraryURL:v13];

  v70 = a4;
  v71 = v8;
  if (!v14)
  {
    v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F8C500];
    uint64_t v80 = *MEMORY[0x1E4F28228];
    v81 = @"Error accessing photo library bundle";
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
    v28 = [v25 errorWithDomain:v26 code:41003 userInfo:v27];

    id v21 = 0;
LABEL_32:
    id v56 = v28;
    goto LABEL_33;
  }
  id v68 = v6;
  v69 = v10;
  if (!v8)
  {
    id v21 = 0;
    v28 = 0;
    int v29 = 1;
    goto LABEL_18;
  }
  v15 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(PLPhotoLibraryAttributesChangeRequestServiceHandler *)self changes];
    v17 = [v16 enableCloudSyncValue];
    *(_DWORD *)buf = 138543362;
    v93 = v17;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "Updating cloud sync enabled with requested state: %{public}@", buf, 0xCu);
  }
  v18 = [v6 pathManager];
  v19 = [v18 libraryURL];
  id v79 = 0;
  v20 = +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:v19 createIfMissing:1 error:&v79];
  id v21 = v79;

  if (!v20)
  {
    v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F8C500];
    uint64_t v32 = *MEMORY[0x1E4F28A50];
    v90[0] = *MEMORY[0x1E4F28228];
    v90[1] = v32;
    v91[0] = @"Error accessing photo library identifier";
    v91[1] = v21;
    id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:2];
    v28 = [v30 errorWithDomain:v31 code:41003 userInfo:v24];
    int v29 = 0;
    goto LABEL_17;
  }
  uint64_t v22 = [v8 BOOLValue];
  v23 = +[PLAccountStore pl_sharedAccountStore];
  id v24 = [v23 cachedPrimaryAppleAccount];

  if ([v14 isSystemPhotoLibrary])
  {
    if (![(PLPhotoLibraryAttributesChangeRequestServiceHandler *)self _updateDataclass:*MEMORY[0x1E4F17570] onAccount:v24 enabled:v22])goto LABEL_16; {
LABEL_14:
    }
    v33 = +[PLAccountStore pl_sharedAccountStore];
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __85__PLPhotoLibraryAttributesChangeRequestServiceHandler_applyChangesWithLibrary_error___block_invoke;
    v75[3] = &unk_1E586FB10;
    id v76 = v20;
    char v78 = v22;
    id v24 = v24;
    id v77 = v24;
    [v33 saveAccount:v24 withDataclassActions:0 doVerify:0 completion:v75];

    goto LABEL_16;
  }
  if (([v20 isImagePlaygroundDefaultLibraryIdentifier] & 1) == 0)
  {
    [v14 setCloudPhotoLibraryEnabled:v22];
    goto LABEL_16;
  }
  if ([(PLPhotoLibraryAttributesChangeRequestServiceHandler *)self _updateDataclass:@"com.apple.Dataclass.ImagePlayground" onAccount:v24 enabled:v22])
  {
    goto LABEL_14;
  }
LABEL_16:
  v28 = 0;
  int v29 = 1;
LABEL_17:

  id v6 = v68;
  int v10 = v69;
  if (!v29) {
    goto LABEL_26;
  }
LABEL_18:
  if (!v10) {
    goto LABEL_26;
  }
  uint64_t v34 = [v10 integerValue];
  v35 = [v14 libraryServicesManager];
  v36 = [v35 cloudPhotoLibraryManager];

  if (!v36)
  {
    v39 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = *MEMORY[0x1E4F8C500];
    uint64_t v86 = *MEMORY[0x1E4F28228];
    v87 = @"Set prefetch mode requires cloud sync enabled";
    v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v87 forKeys:&v86 count:1];
    uint64_t v42 = [v39 errorWithDomain:v40 code:45702 userInfo:v41];
    id v38 = v21;
LABEL_24:

    int v29 = 0;
    v28 = (void *)v42;
    goto LABEL_25;
  }
  id v74 = v21;
  char v37 = [v36 setPrefetchMode:v34 error:&v74];
  id v38 = v74;

  if ((v37 & 1) == 0)
  {
    v43 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v44 = *MEMORY[0x1E4F8C500];
    uint64_t v45 = *MEMORY[0x1E4F28A50];
    v88[0] = *MEMORY[0x1E4F28228];
    v88[1] = v45;
    v89[0] = @"Error setting prefetch mode on CPL manager";
    v89[1] = v38;
    v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:2];
    uint64_t v42 = [v43 errorWithDomain:v44 code:41003 userInfo:v41];
    goto LABEL_24;
  }
  int v29 = 1;
LABEL_25:

  id v21 = v38;
  id v6 = v68;
LABEL_26:
  if (!v29)
  {
    int v10 = v69;
    goto LABEL_32;
  }
  v46 = [(PLPhotoLibraryAttributesChangeRequestServiceHandler *)self changes];
  uint64_t v47 = [v46 name];

  v48 = [(PLPhotoLibraryAttributesChangeRequestServiceHandler *)self changes];
  uint64_t v49 = [v48 userDescription];

  if (!(v47 | v49))
  {
    id v56 = v28;
    BOOL v58 = 1;
LABEL_42:
    v57 = v71;
    int v10 = v69;
    goto LABEL_43;
  }
  v50 = [v6 pathManager];
  v51 = [v50 libraryURL];
  id v73 = v21;
  v52 = +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:v51 createIfMissing:1 error:&v73];
  id v53 = v73;

  if (!v52)
  {
    v59 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v60 = *MEMORY[0x1E4F8C500];
    uint64_t v61 = *MEMORY[0x1E4F28A50];
    v82[0] = *MEMORY[0x1E4F28228];
    v82[1] = v61;
    v83[0] = @"Error accessing photo library identifier";
    v83[1] = v53;
    v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:v82 count:2];
    uint64_t v63 = [v59 errorWithDomain:v60 code:41003 userInfo:v62];
    id v21 = v53;
LABEL_39:

    char v55 = 0;
    v28 = (void *)v63;
    goto LABEL_40;
  }
  id v72 = v53;
  char v54 = [v52 setValuesForName:v47 userDescription:v49 error:&v72];
  id v21 = v72;

  if ((v54 & 1) == 0)
  {
    v64 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v65 = *MEMORY[0x1E4F8C500];
    uint64_t v66 = *MEMORY[0x1E4F28A50];
    v84[0] = *MEMORY[0x1E4F28228];
    v84[1] = v66;
    v85[0] = @"Error setting name and description on library identifier";
    v85[1] = v21;
    v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
    uint64_t v63 = [v64 errorWithDomain:v65 code:41003 userInfo:v62];
    goto LABEL_39;
  }
  char v55 = 1;
LABEL_40:

  id v56 = v28;
  if (v55)
  {
    BOOL v58 = 1;
    id v6 = v68;
    goto LABEL_42;
  }
  id v6 = v68;
  int v10 = v69;
LABEL_33:
  v57 = v71;
  if (v70)
  {
    id v56 = v56;
    BOOL v58 = 0;
    id *v70 = v56;
  }
  else
  {
    BOOL v58 = 0;
  }
LABEL_43:

  return v58;
}

void __85__PLPhotoLibraryAttributesChangeRequestServiceHandler_applyChangesWithLibrary_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *(unsigned __int8 *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 138413058;
      uint64_t v11 = v8;
      __int16 v12 = 1024;
      int v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Failed to update iCPL enable state for identifier %@, enabled: %d, account: %@, error: %@", (uint8_t *)&v10, 0x26u);
    }
  }
}

- (BOOL)validateChangesWithLibrary:(id)a3 error:(id *)a4
{
  return 1;
}

- (int64_t)accessScopeOptionsRequirement
{
  return 7;
}

- (PLPhotoLibraryAttributesChangeRequestServiceHandler)initWithPhotoLibraryAttributesChanges:(id)a3 clientAuthorization:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PLPhotoLibraryAttributesChangeRequestServiceHandler.m", 32, @"Invalid parameter not satisfying: %@", @"changes" object file lineNumber description];
  }
  int v10 = [(PLPhotoLibraryAttributesChangeRequestServiceHandler *)self init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_changes, a3);
    objc_storeStrong((id *)&v11->_clientAuthorization, a4);
  }

  return v11;
}

@end