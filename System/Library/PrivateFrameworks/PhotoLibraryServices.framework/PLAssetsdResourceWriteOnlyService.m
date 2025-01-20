@interface PLAssetsdResourceWriteOnlyService
- (PLAssetsdConnectionAuthorization)connectionAuthorization;
- (PLAssetsdResourceWriteOnlyService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4;
- (void)saveAssetWithDataAndPorts:(id)a3 clientConnection:(id)a4 imageSurface:(id)a5 previewImageSurface:(id)a6 reply:(id)a7;
- (void)saveAssetWithDataAndPorts:(id)a3 imageSurface:(id)a4 previewImageSurface:(id)a5 reply:(id)a6;
@end

@implementation PLAssetsdResourceWriteOnlyService

- (void).cxx_destruct
{
}

- (PLAssetsdConnectionAuthorization)connectionAuthorization
{
  return self->_connectionAuthorization;
}

- (void)saveAssetWithDataAndPorts:(id)a3 clientConnection:(id)a4 imageSurface:(id)a5 previewImageSurface:(id)a6 reply:(id)a7
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v18 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = [v14 processIdentifier];
    v20 = self;
    id v21 = v17;
    v22 = a2;
    id v23 = v14;
    id v24 = v16;
    id v25 = v15;
    uint64_t v26 = v19;
    v27 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F8C970]];
    [v13 objectForKeyedSubscript:*MEMORY[0x1E4F8C8F0]];
    v28 = id v54 = v13;
    *(_DWORD *)buf = 134218498;
    *(void *)v60 = v26;
    id v15 = v25;
    id v16 = v24;
    id v14 = v23;
    a2 = v22;
    id v17 = v21;
    self = v20;
    *(_WORD *)&v60[8] = 2114;
    *(void *)&v60[10] = v27;
    __int16 v61 = 2114;
    v62 = v28;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Received saveAssetWithDataAndPorts:clientConnection:imageSurface:previewImageSurface:reply: from %ld with job type %{public}@ uuid %{public}@", buf, 0x20u);

    id v13 = v54;
  }

  v29 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEBUG, "Begin saveAssetWithDataAndPorts", buf, 2u);
  }

  PLConsumeSandboxExtensionsForJobDictionary(v13);
  v30 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v31 = [v30 imageWriter];

  if (v13 && ([v31 imageWriterJob:v13 hasValidPathsWithConnection:v14] & 1) != 0)
  {
    v32 = [(PLAssetsdResourceWriteOnlyService *)self connectionAuthorization];
    if ([v32 isCameraClient])
    {
      v33 = v13;
      v34 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F8C970]];
      int v35 = [v34 isEqualToString:*MEMORY[0x1E4F8C9E0]];

      if (v35)
      {
        v36 = PLGatekeeperXPCGetLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "Skipping Camera preview image job due to duplicate job from nebulad", buf, 2u);
        }

        (*((void (**)(id, uint64_t, void, void, void, void))v17 + 2))(v17, 1, 0, 0, 0, 0);
        id v13 = v33;
        goto LABEL_26;
      }
    }
    else
    {
      v33 = v13;
    }
    v43 = [(PLAssetsdResourceWriteOnlyService *)self connectionAuthorization];
    int v44 = [v43 isClientInLimitedLibraryMode];

    id v13 = v33;
    if (v44)
    {
      [v33 setObject:MEMORY[0x1E4F1CC38] forKey:@"job.private.ClientInLimitedLibraryMode"];
      v45 = [(PLAssetsdResourceWriteOnlyService *)self connectionAuthorization];
      v46 = [v45 trustedCallerBundleID];

      uint64_t v47 = [v46 length];
      v48 = PLGatekeeperXPCGetLog();
      BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
      if (v47)
      {
        if (v49)
        {
          v50 = [(PLAssetsdResourceWriteOnlyService *)self connectionAuthorization];
          int v51 = [v50 clientProcessIdentifier];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v60 = v51;
          *(_WORD *)&v60[4] = 2112;
          *(void *)&v60[6] = v46;
          _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_DEFAULT, "Saving asset for limited library client (%d) %@", buf, 0x12u);
        }
        id v13 = v33;
        [v33 setObject:v46 forKey:@"job.private.LimitedLibraryClientFetchFilterIdentifier"];
        v48 = [(PLAssetsdResourceWriteOnlyService *)self connectionAuthorization];
        [v33 setObject:v48 forKey:@"job.private.LimitedLibraryClientAuthorization"];
      }
      else
      {
        if (v49)
        {
          v52 = [(PLAssetsdResourceWriteOnlyService *)self connectionAuthorization];
          int v53 = [v52 clientProcessIdentifier];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v60 = v53;
          _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_DEFAULT, "Saving asset for limited library client %d without client identifier", buf, 8u);
        }
        id v13 = v33;
      }
    }
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __119__PLAssetsdResourceWriteOnlyService_saveAssetWithDataAndPorts_clientConnection_imageSurface_previewImageSurface_reply___block_invoke;
    v55[3] = &unk_1E5871F60;
    id v56 = v17;
    [v31 saveAssetJob:v13 imageSurface:v15 previewImageSurface:v16 completionHandler:v55];
  }
  else
  {
    v37 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      *(void *)v60 = v38;
      *(_WORD *)&v60[8] = 2112;
      *(void *)&v60[10] = v13;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "[%@] failed, rejecting invalid job %@", buf, 0x16u);
    }
    v39 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v40 = *MEMORY[0x1E4F8C500];
    uint64_t v57 = *MEMORY[0x1E4F28568];
    v58 = @"Invalid imagewriter job";
    v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    v42 = [v39 errorWithDomain:v40 code:41001 userInfo:v41];

    (*((void (**)(id, void, void, uint64_t, void, void *))v17 + 2))(v17, 0, 0, 1, 0, v42);
  }
LABEL_26:
}

void __119__PLAssetsdResourceWriteOnlyService_saveAssetWithDataAndPorts_clientConnection_imageSurface_previewImageSurface_reply___block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v15[0] = 67109378;
    v15[1] = a2;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "End saveAssetWithDataAndPorts: success: %d, error: %@", (uint8_t *)v15, 0x12u);
  }

  id v11 = v8;
  v12 = v11;
  if (v11)
  {
    id v13 = (void *)[v11 mutableCopy];
    PLImageWriterRemovePrivateKeysFromJobDictionary(v13);
    id v14 = (void *)[v13 copy];
  }
  else
  {
    id v14 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveAssetWithDataAndPorts:(id)a3 imageSurface:(id)a4 previewImageSurface:(id)a5 reply:(id)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  int v14 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v23) = v14;
  if (v14)
  {
    *((void *)&v23 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: saveAssetWithDataAndPorts:imageSurface:previewImageSurface:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v23 + 1), (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  id v15 = [v10 objectForKey:*MEMORY[0x1E4F8C970]];
  if (v15)
  {
    __int16 v16 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F8C9B8], *MEMORY[0x1E4F8C9E8], 0);
    if ([v16 containsObject:v15])
    {
      id v17 = [MEMORY[0x1E4F29268] currentConnection];
      [(PLAssetsdResourceWriteOnlyService *)self saveAssetWithDataAndPorts:v10 clientConnection:v17 imageSurface:v11 previewImageSurface:v12 reply:v13];
    }
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27 = @"Missing image write job type";
    int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    __int16 v16 = [v18 errorWithDomain:*MEMORY[0x1E4F8C500] code:41008 userInfo:v19];

    (*((void (**)(id, void, void, void, void, void *))v13 + 2))(v13, 0, 0, 0, 0, v16);
  }

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    v20 = PLRequestGetLog();
    id v21 = v20;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v21, OS_SIGNPOST_INTERVAL_END, v24, "Received saveAssetWithDataAndPorts:clientConnection:imageSurface:previewImageSurface:reply: from %ld with job type %{public}@ uuid %{public}@", "%{public}s", buf, 0xCu);
    }
  }
}

- (PLAssetsdResourceWriteOnlyService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLAssetsdResourceWriteOnlyService;
  id v8 = [(PLAbstractLibraryServicesManagerService *)&v11 initWithLibraryServicesManager:a3];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_connectionAuthorization, a4);
  }

  return v9;
}

@end