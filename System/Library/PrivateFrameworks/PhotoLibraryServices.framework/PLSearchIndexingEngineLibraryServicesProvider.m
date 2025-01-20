@interface PLSearchIndexingEngineLibraryServicesProvider
- (BOOL)isUnitTesting;
- (NSString)description;
- (PLSearchIndexingEngineLibraryServicesProvider)initWithLSM:(id)a3;
- (id)createLogger;
- (id)libraryWithName:(const char *)a3;
- (id)pathManager;
- (id)redactedDescription;
- (int64_t)libraryIdentifier;
@end

@implementation PLSearchIndexingEngineLibraryServicesProvider

- (void).cxx_destruct
{
}

- (id)redactedDescription
{
  v3 = (void *)MEMORY[0x1E4F8B908];
  v4 = [(PLLibraryServicesManager *)self->_lsm pathManager];
  v5 = [v4 photoDirectoryWithType:1];
  v6 = [v3 redactedDescriptionForPath:v5];

  v7 = NSString;
  uint64_t v8 = objc_opt_class();
  [(PLLibraryServicesManager *)self->_lsm wellKnownPhotoLibraryIdentifier];
  v9 = PLStringFromWellKnownPhotoLibraryIdentifier();
  v10 = [v7 stringWithFormat:@"<%@: %p> [%@] [%@]", v8, self, v9, v6];

  return v10;
}

- (id)createLogger
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v3 = [(PLSearchIndexingEngineLibraryServicesProvider *)self pathManager];
  v4 = [v3 libraryURL];

  v5 = +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:v4 createIfMissing:0 error:0];
  v6 = [v5 uuid];
  if (!v6)
  {
    switch([(PLSearchIndexingEngineLibraryServicesProvider *)self libraryIdentifier])
    {
      case 0:
        BOOL v15 = [(PLLibraryServicesManager *)self->_lsm isAppPhotoLibrary];
        v16 = @"UBF_USER";
        if (v15) {
          v16 = @"UBF_APPX";
        }
        v6 = v16;
        break;
      case 1:
        v27 = [(PLSearchIndexingEngineLibraryServicesProvider *)self pathManager];
        int v28 = [v27 isDCIM];
        v29 = @"UBF_SPLX";
        if (v28) {
          v29 = @"DCIM_SPL";
        }
        v6 = v29;

        break;
      case 2:
        v6 = @"UBF_MSGX";
        break;
      case 3:
        v6 = @"UBF_SYND";
        break;
      default:
        v6 = 0;
        break;
    }
  }
  v7 = [MEMORY[0x1E4F8B8E0] setupWithLibraryIdentifier:v6 type:2];
  [v7 setEnableAutoFlush:1];
  uint64_t v8 = PLSearchBackendIndexStatusGetLog();
  v9 = v8;
  if (v6)
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (!v10) {
      goto LABEL_28;
    }
    if (v7)
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      memset(buf, 0, sizeof(buf));
      v11 = PLSearchBackendIndexStatusGetLog();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      v12 = [v4 lastPathComponent];
      int v32 = 138543618;
      v33 = v6;
      __int16 v34 = 2114;
      v35 = v12;
      LODWORD(v31) = 22;
      v13 = (uint8_t *)_os_log_send_and_compose_impl();

      objc_msgSend(v7, "logWithMessage:fromCodeLocation:type:", v13, "PLSearchIndexingEngine.m", 151, 0, &v32, v31);
      if (v13 == buf) {
        goto LABEL_28;
      }
      v14 = v13;
LABEL_15:
      free(v14);
      goto LABEL_28;
    }
    v21 = PLSearchBackendIndexStatusGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [v4 lastPathComponent];
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v22;
      v23 = "[Search Logger]: Library identifier for library : [%{public}@ : %{public}@]";
      v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      uint32_t v26 = 22;
LABEL_26:
      _os_log_impl(&dword_19B3C7000, v24, v25, v23, buf, v26);
    }
  }
  else
  {
    BOOL v17 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (!v17) {
      goto LABEL_28;
    }
    if (v7)
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      memset(buf, 0, sizeof(buf));
      v18 = PLSearchBackendIndexStatusGetLog();
      os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
      v19 = [v4 lastPathComponent];
      int v32 = 138543362;
      v33 = v19;
      LODWORD(v31) = 12;
      v20 = (uint8_t *)_os_log_send_and_compose_impl();

      objc_msgSend(v7, "logWithMessage:fromCodeLocation:type:", v20, "PLSearchIndexingEngine.m", 153, 16, &v32, v31);
      if (v20 == buf) {
        goto LABEL_28;
      }
      v14 = v20;
      goto LABEL_15;
    }
    v21 = PLSearchBackendIndexStatusGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = [v4 lastPathComponent];
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v22;
      v23 = "[Search Logger]: Failed to obtain library identifier for library : %{public}@";
      v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      uint32_t v26 = 12;
      goto LABEL_26;
    }
  }

LABEL_28:
  return v7;
}

- (NSString)description
{
  return [(PLLibraryServicesManager *)self->_lsm description];
}

- (id)libraryWithName:(const char *)a3
{
  v4 = [(PLLibraryServicesManager *)self->_lsm databaseContext];
  v5 = (void *)[v4 newShortLivedLibraryWithName:a3];

  return v5;
}

- (id)pathManager
{
  return [(PLLibraryServicesManager *)self->_lsm pathManager];
}

- (int64_t)libraryIdentifier
{
  return [(PLLibraryServicesManager *)self->_lsm wellKnownPhotoLibraryIdentifier];
}

- (BOOL)isUnitTesting
{
  return 0;
}

- (PLSearchIndexingEngineLibraryServicesProvider)initWithLSM:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLSearchIndexingEngineLibraryServicesProvider;
  v6 = [(PLSearchIndexingEngineLibraryServicesProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lsm, a3);
  }

  return v7;
}

@end