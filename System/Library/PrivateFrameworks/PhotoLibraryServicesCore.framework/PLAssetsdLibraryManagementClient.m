@interface PLAssetsdLibraryManagementClient
- (BOOL)closeAndDeletePhotoLibraryAtURL:(id)a3 error:(id *)a4;
- (BOOL)closePhotoLibraryAtURL:(id)a3 error:(id *)a4;
- (BOOL)overrideSystemPhotoLibraryURL:(id)a3 error:(id *)a4;
- (BOOL)removePhotoLibraryURL:(id)a3 error:(id *)a4;
- (BOOL)resetSyndicationLibrary:(id *)a3;
- (BOOL)setSystemPhotoLibraryURL:(id)a3 error:(id *)a4;
- (id)createManagedPhotoLibraryWithOptions:(id)a3 error:(id *)a4;
- (id)findPhotoLibraryIdentifiersMatchingSearchCriteria:(id)a3 error:(id *)a4;
- (id)photoLibraryIdentifierForPhotoLibraryURL:(id)a3 error:(id *)a4;
- (void)filesystemSizeForLibraryURL:(id)a3 result:(id)a4;
- (void)getPhotoLibraryURLsWithLibraryURL:(id)a3 reply:(id)a4;
@end

@implementation PLAssetsdLibraryManagementClient

- (id)createManagedPhotoLibraryWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v40) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: createManagedPhotoLibraryWithOptions:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((void *)&v40 + 1);
    *((void *)&v40 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v41 + 8));
  }
  v11 = PLRequestGetLog();
  *((void *)&v42 + 1) = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v41 = v12;
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(*((SEL *)&v42 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__5519;
  v46 = __Block_byref_object_dispose__5520;
  id v47 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__5519;
  v38 = __Block_byref_object_dispose__5520;
  id v39 = 0;
  v16 = [v7 objectForKeyedSubscript:@"PLPhotoLibraryOpenerOptionsBundleURLKey"];
  v17 = [v7 objectForKeyedSubscript:@"PLPhotoLibraryOpenerOptionsTestOptionsKey"];
  v18 = [v17 objectForKey:@"PLInternalTestOptionsPhotoLibraryDomainRootURLKey"];

  v19 = v16;
  if (v16 || (v19 = v18) != 0)
  {
    v20 = +[PLAutoBindingProxyFactory clientToServiceSandboxExtensionForURL:v19];
  }
  else
  {
    v20 = 0;
  }
  v21 = [(PLAssetsdBaseClient *)self proxyFactory];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __79__PLAssetsdLibraryManagementClient_createManagedPhotoLibraryWithOptions_error___block_invoke;
  v33[3] = &unk_1E58A1C40;
  v33[4] = &buf;
  v22 = [v21 synchronousRemoteObjectProxyWithErrorHandler:v33];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __79__PLAssetsdLibraryManagementClient_createManagedPhotoLibraryWithOptions_error___block_invoke_20;
  v32[3] = &unk_1E58A1B00;
  v32[4] = &v34;
  v32[5] = &buf;
  [v22 createManagedPhotoLibraryWithOptions:v7 sandboxExtension:v20 reply:v32];

  uint64_t v23 = v35[5];
  id v24 = *(id *)(*((void *)&buf + 1) + 40);
  v25 = v24;
  if (!v23 && a4) {
    *a4 = v24;
  }

  id v26 = (id)v35[5];
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v40) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v41 + 8));
  }
  if ((void)v41)
  {
    v27 = PLRequestGetLog();
    v28 = v27;
    os_signpost_id_t v29 = v41;
    if ((unint64_t)(v41 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      v30 = sel_getName(*((SEL *)&v42 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v30;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v28, OS_SIGNPOST_INTERVAL_END, v29, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v26;
}

void __79__PLAssetsdLibraryManagementClient_createManagedPhotoLibraryWithOptions_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdLibraryManagementClient createManagedPhotoLibraryWithOptions:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __79__PLAssetsdLibraryManagementClient_createManagedPhotoLibraryWithOptions_error___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)findPhotoLibraryIdentifiersMatchingSearchCriteria:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v35) = v8;
  if (v8)
  {
    uint64_t v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: findPhotoLibraryIdentifiersMatchingSearchCriteria:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v35 + 1);
    *((void *)&v35 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v36 + 8));
  }
  id v11 = PLRequestGetLog();
  *((void *)&v37 + 1) = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v36 = v12;
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(*((SEL *)&v37 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v39 = 0x3032000000;
  long long v40 = __Block_byref_object_copy__5519;
  long long v41 = __Block_byref_object_dispose__5520;
  id v42 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__5519;
  v33 = __Block_byref_object_dispose__5520;
  id v34 = 0;
  v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __92__PLAssetsdLibraryManagementClient_findPhotoLibraryIdentifiersMatchingSearchCriteria_error___block_invoke;
  v28[3] = &unk_1E58A1C40;
  v28[4] = &buf;
  v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v28];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __92__PLAssetsdLibraryManagementClient_findPhotoLibraryIdentifiersMatchingSearchCriteria_error___block_invoke_18;
  v27[3] = &unk_1E58A1278;
  v27[4] = &v29;
  v27[5] = &buf;
  [v17 findPhotoLibraryIdentifiersMatchingSearchCriteria:v7 reply:v27];

  uint64_t v18 = v30[5];
  id v19 = *(id *)(*((void *)&buf + 1) + 40);
  v20 = v19;
  if (!v18 && a4) {
    *a4 = v19;
  }

  id v21 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v35) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v36 + 8));
  }
  if ((void)v36)
  {
    v22 = PLRequestGetLog();
    uint64_t v23 = v22;
    os_signpost_id_t v24 = v36;
    if ((unint64_t)(v36 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      v25 = sel_getName(*((SEL *)&v37 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v25;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v21;
}

void __92__PLAssetsdLibraryManagementClient_findPhotoLibraryIdentifiersMatchingSearchCriteria_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdLibraryManagementClient findPhotoLibraryIdentifiersMatchingSearchCriteria:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __92__PLAssetsdLibraryManagementClient_findPhotoLibraryIdentifiersMatchingSearchCriteria_error___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)photoLibraryIdentifierForPhotoLibraryURL:(id)a3 error:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v40 = 0u;
  *(_OWORD *)sel = 0u;
  long long v39 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v39) = v8;
  if (v8)
  {
    uint64_t v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: photoLibraryIdentifierForPhotoLibraryURL:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v39 + 1);
    *((void *)&v39 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v40 + 8));
  }
  id v11 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v40 = v12;
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__5519;
  v45 = __Block_byref_object_dispose__5520;
  id v46 = 0;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000;
  long long v36 = __Block_byref_object_copy__5519;
  long long v37 = __Block_byref_object_dispose__5520;
  id v38 = 0;
  v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __83__PLAssetsdLibraryManagementClient_photoLibraryIdentifierForPhotoLibraryURL_error___block_invoke;
  v32[3] = &unk_1E58A1C40;
  v32[4] = &v33;
  v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v32];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __83__PLAssetsdLibraryManagementClient_photoLibraryIdentifierForPhotoLibraryURL_error___block_invoke_16;
  v28[3] = &unk_1E58A12A0;
  p_long long buf = &buf;
  id v18 = v7;
  id v29 = v18;
  uint64_t v31 = &v33;
  [v17 getPhotoLibraryIdentifierWithLibraryURL:v18 reply:v28];

  uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
  id v20 = (id)v34[5];
  id v21 = v20;
  if (!v19 && a4) {
    *a4 = v20;
  }

  id v22 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v39) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v40 + 8));
  }
  if ((void)v40)
  {
    uint64_t v23 = PLRequestGetLog();
    os_signpost_id_t v24 = v23;
    os_signpost_id_t v25 = v40;
    if ((unint64_t)(v40 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      id v26 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v26;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v22;
}

void __83__PLAssetsdLibraryManagementClient_photoLibraryIdentifierForPhotoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdLibraryManagementClient photoLibraryIdentifierForPhotoLibraryURL:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __83__PLAssetsdLibraryManagementClient_photoLibraryIdentifierForPhotoLibraryURL_error___block_invoke_16(void *a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    BOOL v8 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_ERROR, "Error getting photo library identifier for url %@: %@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  }
}

- (void)filesystemSizeForLibraryURL:(id)a3 result:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, void))a4;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v44 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v44) = v9;
  if (v9)
  {
    int v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: filesystemSizeForLibraryURL:result:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v11 = (void *)*((void *)&v44 + 1);
    *((void *)&v44 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v45 + 8));
  }
  __int16 v12 = PLRequestGetLog();
  *((void *)&v46 + 1) = a2;
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  *(void *)&long long v45 = v13;
  uint64_t v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    Name = sel_getName(*((SEL *)&v46 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__5519;
  v50 = __Block_byref_object_dispose__5520;
  id v51 = 0;
  uint64_t v40 = 0;
  long long v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x2020000000;
  uint64_t v39 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v35 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  v17 = [(PLAssetsdBaseClient *)self proxyFactory];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71__PLAssetsdLibraryManagementClient_filesystemSizeForLibraryURL_result___block_invoke;
  v25[3] = &unk_1E58A1A88;
  id v18 = v7;
  id v26 = v18;
  p_long long buf = &buf;
  uint64_t v19 = [v17 synchronousRemoteObjectProxyWithErrorHandler:v25];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __71__PLAssetsdLibraryManagementClient_filesystemSizeForLibraryURL_result___block_invoke_14;
  v24[3] = &unk_1E589FCB0;
  v24[4] = &buf;
  v24[5] = &v40;
  v24[6] = &v36;
  v24[7] = &v32;
  v24[8] = &v28;
  [v19 filesystemSizeForLibraryURL:v18 reply:v24];

  v8[2](v8, v41[3], v37[3], v33[3], v29[3], *(void *)(*((void *)&buf + 1) + 40));
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v44) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v45 + 8));
  }
  if ((void)v45)
  {
    id v20 = PLRequestGetLog();
    id v21 = v20;
    os_signpost_id_t v22 = v45;
    if ((unint64_t)(v45 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      uint64_t v23 = sel_getName(*((SEL *)&v46 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __71__PLAssetsdLibraryManagementClient_filesystemSizeForLibraryURL_result___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting filesystem size for libraryURL %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

void __71__PLAssetsdLibraryManagementClient_filesystemSizeForLibraryURL_result___block_invoke_14(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v12 = a6;
  if (v12)
  {
    id v13 = v12;
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a6);
    id v12 = v13;
  }
  else
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a2;
    *(void *)(*(void *)(a1[6] + 8) + 24) = a3;
    *(void *)(*(void *)(a1[7] + 8) + 24) = a4;
    *(void *)(*(void *)(a1[8] + 8) + 24) = a5;
  }
}

- (BOOL)resetSyndicationLibrary:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  *(_OWORD *)sel = 0u;
  long long v24 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v24) = v6;
  if (v6)
  {
    id v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: resetSyndicationLibrary:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v8 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  uint64_t v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v25 = v10;
  uint64_t v11 = v9;
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__5519;
  uint64_t v30 = __Block_byref_object_dispose__5520;
  id v31 = 0;
  uint64_t v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __60__PLAssetsdLibraryManagementClient_resetSyndicationLibrary___block_invoke;
  v23[3] = &unk_1E58A1C40;
  v23[4] = &buf;
  v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v23];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __60__PLAssetsdLibraryManagementClient_resetSyndicationLibrary___block_invoke_2;
  v22[3] = &unk_1E58A1E50;
  v22[4] = &buf;
  [v15 resetSyndicationLibraryWithReply:v22];

  v16 = *(void **)(*((void *)&buf + 1) + 40);
  if (v16 && a3) {
    *a3 = v16;
  }
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    v17 = PLRequestGetLog();
    id v18 = v17;
    os_signpost_id_t v19 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      id v20 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v20;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v16 == 0;
}

void __60__PLAssetsdLibraryManagementClient_resetSyndicationLibrary___block_invoke(uint64_t a1, void *a2)
{
}

void __60__PLAssetsdLibraryManagementClient_resetSyndicationLibrary___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if ((a2 & 1) == 0)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

- (void)getPhotoLibraryURLsWithLibraryURL:(id)a3 reply:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v35 = 0u;
  *(_OWORD *)sel = 0u;
  long long v34 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v34) = v9;
  if (v9)
  {
    os_signpost_id_t v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getPhotoLibraryURLsWithLibraryURL:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v11 = (void *)*((void *)&v34 + 1);
    *((void *)&v34 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v35 + 8));
  }
  id v12 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  *(void *)&long long v35 = v13;
  uint64_t v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    uint64_t v38 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  v17 = [(PLAssetsdBaseClient *)self proxyFactory];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __76__PLAssetsdLibraryManagementClient_getPhotoLibraryURLsWithLibraryURL_reply___block_invoke;
  v32[3] = &unk_1E58A1BC8;
  id v33 = v8;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3254779904;
  v24[2] = __76__PLAssetsdLibraryManagementClient_getPhotoLibraryURLsWithLibraryURL_reply___block_invoke_10;
  v24[3] = &unk_1EEBF4F18;
  char v27 = v34;
  id v28 = *((id *)&v34 + 1);
  long long v29 = v35;
  long long v30 = *(_OWORD *)sel;
  SEL v31 = a2;
  id v18 = v7;
  id v25 = v18;
  id v19 = v33;
  id v26 = v19;
  [v17 remoteObjectProxyWithErrorHandler:v32 handler:v24];

  if ((_BYTE)v34) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v35 + 8));
  }
  if ((void)v35)
  {
    id v20 = PLRequestGetLog();
    id v21 = v20;
    os_signpost_id_t v22 = v35;
    if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      uint64_t v23 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v38 = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __76__PLAssetsdLibraryManagementClient_getPhotoLibraryURLsWithLibraryURL_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[PLAssetsdLibraryManagementClient getPhotoLibraryURLsWithLibraryURL:reply:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__PLAssetsdLibraryManagementClient_getPhotoLibraryURLsWithLibraryURL_reply___block_invoke_10(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v13 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      os_signpost_id_t v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      int v11 = 138543362;
      id v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 getPhotoLibraryURLsWithLibraryURL:*(void *)(a1 + 32) reply:*(void *)(a1 + 40)];
}

- (BOOL)overrideSystemPhotoLibraryURL:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v29 = 0u;
  *(_OWORD *)sel = 0u;
  long long v28 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v28) = v8;
  if (v8)
  {
    uint64_t v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: overrideSystemPhotoLibraryURL:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_signpost_id_t v10 = (void *)*((void *)&v28 + 1);
    *((void *)&v28 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v29 + 8));
  }
  int v11 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v29 = v12;
  os_signpost_id_t v13 = v11;
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (v7) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 3;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__5519;
  long long v34 = __Block_byref_object_dispose__5520;
  id v35 = 0;
  v17 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __72__PLAssetsdLibraryManagementClient_overrideSystemPhotoLibraryURL_error___block_invoke;
  v27[3] = &unk_1E58A1C40;
  v27[4] = &buf;
  id v18 = [v17 synchronousRemoteObjectProxyWithErrorHandler:v27];
  id v19 = +[PLAutoBindingProxyFactory clientToServiceSandboxExtensionForURL:v7];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __72__PLAssetsdLibraryManagementClient_overrideSystemPhotoLibraryURL_error___block_invoke_2;
  v26[3] = &unk_1E58A1C40;
  v26[4] = &buf;
  [v18 setSystemPhotoLibraryURL:v7 sandboxExtension:v19 options:v16 reply:v26];

  id v20 = *(void **)(*((void *)&buf + 1) + 40);
  if (a4 && v20)
  {
    *a4 = v20;
    id v20 = *(void **)(*((void *)&buf + 1) + 40);
  }
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v28) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  }
  if ((void)v29)
  {
    id v21 = PLRequestGetLog();
    os_signpost_id_t v22 = v21;
    os_signpost_id_t v23 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      long long v24 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v24;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v20 == 0;
}

void __72__PLAssetsdLibraryManagementClient_overrideSystemPhotoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
}

void __72__PLAssetsdLibraryManagementClient_overrideSystemPhotoLibraryURL_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)closePhotoLibraryAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5519;
  id v18 = __Block_byref_object_dispose__5520;
  id v19 = 0;
  id v7 = [(PLAssetsdBaseClient *)self proxyFactory];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PLAssetsdLibraryManagementClient_closePhotoLibraryAtURL_error___block_invoke;
  v13[3] = &unk_1E58A17B8;
  v13[4] = &v20;
  v13[5] = &v14;
  BOOL v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__PLAssetsdLibraryManagementClient_closePhotoLibraryAtURL_error___block_invoke_2;
  v12[3] = &unk_1E58A17E0;
  v12[4] = &v20;
  v12[5] = &v14;
  [v8 closePhotoLibraryAtURL:v6 reply:v12];

  int v9 = *((unsigned __int8 *)v21 + 24);
  if (a4 && !*((unsigned char *)v21 + 24))
  {
    *a4 = (id) v15[5];
    int v9 = *((unsigned __int8 *)v21 + 24);
  }
  BOOL v10 = v9 != 0;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __65__PLAssetsdLibraryManagementClient_closePhotoLibraryAtURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 code] == 4099
    && ([v6 domain],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqualToString:*MEMORY[0x1E4F281F8]],
        v4,
        v5))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __65__PLAssetsdLibraryManagementClient_closePhotoLibraryAtURL_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2) {
    goto LABEL_5;
  }
  if ([v5 code] == 41026)
  {
    id v7 = [v6 domain];
    int v8 = [v7 isEqualToString:@"com.apple.photos.error"];

    if (v8)
    {
      NSLog((NSString *)@"Ignoring filesystem deletion error (probably files still in use by photoanalysisd): %@", v6);

      id v6 = 0;
LABEL_5:
      char v9 = 1;
      goto LABEL_7;
    }
  }
  char v9 = 0;
LABEL_7:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v9;
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  int v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v6;
}

- (BOOL)closeAndDeletePhotoLibraryAtURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__5519;
  id v18 = __Block_byref_object_dispose__5520;
  id v19 = 0;
  id v7 = [(PLAssetsdBaseClient *)self proxyFactory];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__PLAssetsdLibraryManagementClient_closeAndDeletePhotoLibraryAtURL_error___block_invoke;
  v13[3] = &unk_1E58A17B8;
  v13[4] = &v20;
  v13[5] = &v14;
  int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__PLAssetsdLibraryManagementClient_closeAndDeletePhotoLibraryAtURL_error___block_invoke_2;
  v12[3] = &unk_1E58A17E0;
  v12[4] = &v20;
  v12[5] = &v14;
  [v8 closeAndDeletePhotoLibraryAtURL:v6 reply:v12];

  int v9 = *((unsigned __int8 *)v21 + 24);
  if (a4 && !*((unsigned char *)v21 + 24))
  {
    *a4 = (id) v15[5];
    int v9 = *((unsigned __int8 *)v21 + 24);
  }
  BOOL v10 = v9 != 0;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __74__PLAssetsdLibraryManagementClient_closeAndDeletePhotoLibraryAtURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 code] == 4099
    && ([v6 domain],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqualToString:*MEMORY[0x1E4F281F8]],
        v4,
        v5))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __74__PLAssetsdLibraryManagementClient_closeAndDeletePhotoLibraryAtURL_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)removePhotoLibraryURL:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v28 = 0u;
  *(_OWORD *)sel = 0u;
  long long v27 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v27) = v8;
  if (v8)
  {
    int v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: removePhotoLibraryURL:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    BOOL v10 = (void *)*((void *)&v27 + 1);
    *((void *)&v27 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  int v11 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v28 = v12;
  os_signpost_id_t v13 = v11;
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__5519;
  id v33 = __Block_byref_object_dispose__5520;
  id v34 = 0;
  uint64_t v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__PLAssetsdLibraryManagementClient_removePhotoLibraryURL_error___block_invoke;
  v26[3] = &unk_1E58A1C40;
  v26[4] = &buf;
  v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v26];
  id v18 = +[PLAutoBindingProxyFactory clientToServiceSandboxExtensionForURL:v7];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __64__PLAssetsdLibraryManagementClient_removePhotoLibraryURL_error___block_invoke_2;
  v25[3] = &unk_1E58A1C40;
  void v25[4] = &buf;
  [v17 setSystemPhotoLibraryURL:v7 sandboxExtension:v18 options:2 reply:v25];

  id v19 = *(void **)(*((void *)&buf + 1) + 40);
  if (a4 && v19)
  {
    *a4 = v19;
    id v19 = *(void **)(*((void *)&buf + 1) + 40);
  }
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v27) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  }
  if ((void)v28)
  {
    uint64_t v20 = PLRequestGetLog();
    id v21 = v20;
    os_signpost_id_t v22 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      char v23 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19 == 0;
}

void __64__PLAssetsdLibraryManagementClient_removePhotoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
}

void __64__PLAssetsdLibraryManagementClient_removePhotoLibraryURL_error___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)setSystemPhotoLibraryURL:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v28 = 0u;
  *(_OWORD *)sel = 0u;
  long long v27 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v27) = v8;
  if (v8)
  {
    int v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: setSystemPhotoLibraryURL:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    BOOL v10 = (void *)*((void *)&v27 + 1);
    *((void *)&v27 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  int v11 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v28 = v12;
  os_signpost_id_t v13 = v11;
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__5519;
  id v33 = __Block_byref_object_dispose__5520;
  id v34 = 0;
  uint64_t v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __67__PLAssetsdLibraryManagementClient_setSystemPhotoLibraryURL_error___block_invoke;
  v26[3] = &unk_1E58A1C40;
  v26[4] = &buf;
  v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v26];
  id v18 = +[PLAutoBindingProxyFactory clientToServiceSandboxExtensionForURL:v7];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __67__PLAssetsdLibraryManagementClient_setSystemPhotoLibraryURL_error___block_invoke_2;
  v25[3] = &unk_1E58A1C40;
  void v25[4] = &buf;
  [v17 setSystemPhotoLibraryURL:v7 sandboxExtension:v18 options:2 * (v7 == 0) reply:v25];

  id v19 = *(void **)(*((void *)&buf + 1) + 40);
  if (a4 && v19)
  {
    *a4 = v19;
    id v19 = *(void **)(*((void *)&buf + 1) + 40);
  }
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v27) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  }
  if ((void)v28)
  {
    uint64_t v20 = PLRequestGetLog();
    id v21 = v20;
    os_signpost_id_t v22 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      char v23 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19 == 0;
}

void __67__PLAssetsdLibraryManagementClient_setSystemPhotoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
}

void __67__PLAssetsdLibraryManagementClient_setSystemPhotoLibraryURL_error___block_invoke_2(uint64_t a1, void *a2)
{
}

@end