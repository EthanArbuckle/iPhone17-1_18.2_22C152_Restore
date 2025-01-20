@interface PLAssetsdNonBindingDebugClient
- (BOOL)getPhotosXPCEndpoint:(id *)a3 error:(id *)a4;
- (id)activePhotoLibraries:(id *)a3;
- (id)boundServicesForLibrary:(id)a3 error:(id *)a4;
- (id)existingPhotoLibraryIdentifierForPhotoLibraryURL:(id)a3 error:(id *)a4;
@end

@implementation PLAssetsdNonBindingDebugClient

- (BOOL)getPhotosXPCEndpoint:(id *)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  *(_OWORD *)sel = 0u;
  long long v37 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v37) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getPhotosXPCEndpoint:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((void *)&v37 + 1);
    *((void *)&v37 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v38 + 8));
  }
  v11 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v38 = v12;
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__8849;
  v43 = __Block_byref_object_dispose__8850;
  id v44 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__8849;
  v31 = __Block_byref_object_dispose__8850;
  id v32 = 0;
  v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __61__PLAssetsdNonBindingDebugClient_getPhotosXPCEndpoint_error___block_invoke;
  v26[3] = &unk_1E58A1C40;
  v26[4] = &buf;
  v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __61__PLAssetsdNonBindingDebugClient_getPhotosXPCEndpoint_error___block_invoke_5;
  v25[3] = &unk_1E58A12C8;
  v25[4] = &v33;
  v25[5] = &v27;
  v25[6] = &buf;
  [v17 getPhotosXPCEndpointWithReply:v25];

  if (!a4 || (v18 = *(void **)(*((void *)&buf + 1) + 40)) == 0)
  {
    v18 = (void *)v28[5];
    a4 = a3;
  }
  *a4 = v18;
  int v19 = *((unsigned __int8 *)v34 + 24);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v33, 8);
  if ((_BYTE)v37) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v38 + 8));
  }
  if ((void)v38)
  {
    v20 = PLRequestGetLog();
    v21 = v20;
    os_signpost_id_t v22 = v38;
    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      v23 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19 != 0;
}

void __61__PLAssetsdNonBindingDebugClient_getPhotosXPCEndpoint_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdNonBindingDebugClient getPhotosXPCEndpoint:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __61__PLAssetsdNonBindingDebugClient_getPhotosXPCEndpoint_error___block_invoke_5(void *a1, int a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (a2)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
    uint64_t v9 = [a3 _endpoint];
    uint64_t v10 = *(void *)(a1[5] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    os_signpost_id_t v12 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_19BCFB000, v12, OS_LOG_TYPE_ERROR, "Error getting photos XPC endpoint: %@", (uint8_t *)&v13, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  }
}

- (id)existingPhotoLibraryIdentifierForPhotoLibraryURL:(id)a3 error:(id *)a4
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
    uint64_t v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: existingPhotoLibraryIdentifierForPhotoLibraryURL:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v10 = (void *)*((void *)&v39 + 1);
    *((void *)&v39 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v40 + 8));
  }
  uint64_t v11 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v40 = v12;
  int v13 = v11;
  id v14 = v13;
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
  id v44 = __Block_byref_object_copy__8849;
  uint64_t v45 = __Block_byref_object_dispose__8850;
  id v46 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  char v36 = __Block_byref_object_copy__8849;
  long long v37 = __Block_byref_object_dispose__8850;
  id v38 = 0;
  v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __89__PLAssetsdNonBindingDebugClient_existingPhotoLibraryIdentifierForPhotoLibraryURL_error___block_invoke;
  v32[3] = &unk_1E58A1C40;
  v32[4] = &v33;
  v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v32];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __89__PLAssetsdNonBindingDebugClient_existingPhotoLibraryIdentifierForPhotoLibraryURL_error___block_invoke_3;
  v28[3] = &unk_1E58A12A0;
  p_long long buf = &buf;
  id v18 = v7;
  id v29 = v18;
  v31 = &v33;
  [v17 getExistingPhotoLibraryIdentifierWithLibraryURL:v18 reply:v28];

  uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
  id v20 = (id)v34[5];
  v21 = v20;
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
    v23 = PLRequestGetLog();
    v24 = v23;
    os_signpost_id_t v25 = v40;
    if ((unint64_t)(v40 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      v26 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v26;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v22;
}

void __89__PLAssetsdNonBindingDebugClient_existingPhotoLibraryIdentifierForPhotoLibraryURL_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdNonBindingDebugClient existingPhotoLibraryIdentifierForPhotoLibraryURL:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __89__PLAssetsdNonBindingDebugClient_existingPhotoLibraryIdentifierForPhotoLibraryURL_error___block_invoke_3(void *a1, void *a2, void *a3)
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

- (id)boundServicesForLibrary:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v33) = v8;
  if (v8)
  {
    uint64_t v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: boundServicesForLibrary:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v10 = (void *)*((void *)&v33 + 1);
    *((void *)&v33 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v34 + 8));
  }
  uint64_t v11 = PLRequestGetLog();
  *((void *)&v35 + 1) = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v34 = v12;
  id v13 = v11;
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(*((SEL *)&v35 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  id v38 = __Block_byref_object_copy__8849;
  long long v39 = __Block_byref_object_dispose__8850;
  id v40 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__8849;
  v31 = __Block_byref_object_dispose__8850;
  id v32 = 0;
  v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__PLAssetsdNonBindingDebugClient_boundServicesForLibrary_error___block_invoke;
  v26[3] = &unk_1E58A1C40;
  v26[4] = &buf;
  v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __64__PLAssetsdNonBindingDebugClient_boundServicesForLibrary_error___block_invoke_2;
  v25[3] = &unk_1E58A1278;
  v25[4] = &v27;
  v25[5] = &buf;
  [v17 getBoundServicesForLibrary:v7 reply:v25];

  if (a4)
  {
    id v18 = *(void **)(*((void *)&buf + 1) + 40);
    if (v18) {
      *a4 = v18;
    }
  }
  id v19 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v33) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v34 + 8));
  }
  if ((void)v34)
  {
    id v20 = PLRequestGetLog();
    v21 = v20;
    os_signpost_id_t v22 = v34;
    if ((unint64_t)(v34 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      v23 = sel_getName(*((SEL *)&v35 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19;
}

void __64__PLAssetsdNonBindingDebugClient_boundServicesForLibrary_error___block_invoke(uint64_t a1, void *a2)
{
}

void __64__PLAssetsdNonBindingDebugClient_boundServicesForLibrary_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)activePhotoLibraries:(id *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v31) = v6;
  if (v6)
  {
    uint64_t v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: activePhotoLibraries:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    BOOL v8 = (void *)*((void *)&v31 + 1);
    *((void *)&v31 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  uint64_t v9 = PLRequestGetLog();
  *((void *)&v33 + 1) = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v32 = v10;
  id v11 = v9;
  os_signpost_id_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(*((SEL *)&v33 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x3032000000;
  char v36 = __Block_byref_object_copy__8849;
  uint64_t v37 = __Block_byref_object_dispose__8850;
  id v38 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__8849;
  uint64_t v29 = __Block_byref_object_dispose__8850;
  id v30 = 0;
  uint64_t v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __55__PLAssetsdNonBindingDebugClient_activePhotoLibraries___block_invoke;
  v24[3] = &unk_1E58A1C40;
  v24[4] = &buf;
  uint64_t v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v24];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __55__PLAssetsdNonBindingDebugClient_activePhotoLibraries___block_invoke_2;
  v23[3] = &unk_1E58A1250;
  v23[4] = &v25;
  v23[5] = &buf;
  [v15 getActivePhotoLibrariesWithReply:v23];

  if (a3)
  {
    v16 = *(void **)(*((void *)&buf + 1) + 40);
    if (v16) {
      *a3 = v16;
    }
  }
  id v17 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v31) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if ((void)v32)
  {
    id v18 = PLRequestGetLog();
    id v19 = v18;
    os_signpost_id_t v20 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      v21 = sel_getName(*((SEL *)&v33 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v21;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v17;
}

void __55__PLAssetsdNonBindingDebugClient_activePhotoLibraries___block_invoke(uint64_t a1, void *a2)
{
}

void __55__PLAssetsdNonBindingDebugClient_activePhotoLibraries___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  os_signpost_id_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

@end