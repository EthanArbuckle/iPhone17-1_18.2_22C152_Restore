@interface PLAssetsdPhotoKitClient
+ (BOOL)inTransactionProxy;
+ (BOOL)sendChangesRequest:(id)a3 usingProxyFactory:(id)a4 error:(id *)a5;
+ (void)sendChangesRequest:(id)a3 usingProxyFactory:(id)a4 reply:(id)a5;
+ (void)setInTransactionProxy:(BOOL)a3 queue:(id)a4;
- (BOOL)cancelReservedCloudIdentifiersWithEntityName:(id)a3 error:(id *)a4;
- (BOOL)processUniversalSearchJITForAssetUUID:(id)a3 processingTypes:(unint64_t)a4 error:(id *)a5;
- (BOOL)resetStateForMediaProcessingTaskID:(unint64_t)a3 assetUUIDs:(id)a4 resetOptions:(unint64_t)a5 error:(id *)a6;
- (BOOL)sendChangesRequest:(id)a3 error:(id *)a4;
- (id)analyzeAssets:(id)a3 forFeature:(unint64_t)a4 withCompletionHandler:(id)a5;
- (id)analyzeLibraryForFeature:(unint64_t)a3 withCompletionHandler:(id)a4;
- (id)clientName;
- (id)getUUIDsForAssetObjectIDs:(id)a3 filterPredicate:(id)a4 context:(id)a5 error:(id *)a6;
- (id)processUniversalSearchJITForCoreSpotlightUniqueIdentifier:(id)a3 bundleID:(id)a4 processingTypes:(unint64_t)a5 error:(id *)a6;
- (id)reserveCloudIdentifiersWithEntityName:(id)a3 count:(unint64_t)a4 error:(id *)a5;
- (id)reservedCloudIdentifiersWithEntityName:(id)a3 error:(id *)a4;
- (id)resolveLocalIdentifiersForCloudIdentifiers:(id)a3 error:(id *)a4;
- (void)sendChangesRequest:(id)a3 reply:(id)a4;
@end

@implementation PLAssetsdPhotoKitClient

- (BOOL)resetStateForMediaProcessingTaskID:(unint64_t)a3 assetUUIDs:(id)a4 resetOptions:(unint64_t)a5 error:(id *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  BOOL v11 = +[PLXPCMessageLogger enabled];
  LOBYTE(v32) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: resetStateForMediaProcessingTaskID:assetUUIDs:resetOptions:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((void *)&v32 + 1);
    *((void *)&v32 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__982;
  v38 = __Block_byref_object_dispose__983;
  id v39 = 0;
  v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __92__PLAssetsdPhotoKitClient_resetStateForMediaProcessingTaskID_assetUUIDs_resetOptions_error___block_invoke;
  v27[3] = &unk_1E58A1C40;
  v27[4] = &buf;
  v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v27];

  if (v15)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __92__PLAssetsdPhotoKitClient_resetStateForMediaProcessingTaskID_assetUUIDs_resetOptions_error___block_invoke_31;
    v26[3] = &unk_1E58A17E0;
    v26[4] = &v28;
    v26[5] = &buf;
    id v16 = (id)[v15 resetStateForMediaProcessingTaskID:a3 assetUUIDs:v10 resetOptions:a5 reply:v26];
    int v17 = *((unsigned __int8 *)v29 + 24);
    id v18 = *(id *)(*((void *)&buf + 1) + 40);
    v19 = v18;
    if (!v17 && a6) {
      *a6 = v18;
    }

    BOOL v20 = *((unsigned char *)v29 + 24) != 0;
  }
  else
  {
    BOOL v20 = 0;
    if (a6) {
      *a6 = *(id *)(*((void *)&buf + 1) + 40);
    }
  }

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v28, 8);
  if ((_BYTE)v32) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if ((void)v33)
  {
    v21 = PLRequestGetLog();
    v22 = v21;
    os_signpost_id_t v23 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(*((SEL *)&v34 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v20;
}

void __92__PLAssetsdPhotoKitClient_resetStateForMediaProcessingTaskID_assetUUIDs_resetOptions_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    v8 = "-[PLAssetsdPhotoKitClient resetStateForMediaProcessingTaskID:assetUUIDs:resetOptions:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __92__PLAssetsdPhotoKitClient_resetStateForMediaProcessingTaskID_assetUUIDs_resetOptions_error___block_invoke_31(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if ((a2 & 1) == 0)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
  }
}

- (id)analyzeLibraryForFeature:(unint64_t)a3 withCompletionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v23 = 0u;
  *(_OWORD *)sel = 0u;
  long long v22 = 0u;
  BOOL v7 = +[PLXPCMessageLogger enabled];
  LOBYTE(v22) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: analyzeLibraryForFeature:withCompletionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v9 = (void *)*((void *)&v22 + 1);
    *((void *)&v22 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__982;
  uint64_t v28 = __Block_byref_object_dispose__983;
  id v29 = 0;
  id v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74__PLAssetsdPhotoKitClient_analyzeLibraryForFeature_withCompletionHandler___block_invoke;
  v21[3] = &unk_1E58A1C40;
  v21[4] = &buf;
  uint64_t v11 = [v10 remoteObjectProxyWithErrorHandler:v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __74__PLAssetsdPhotoKitClient_analyzeLibraryForFeature_withCompletionHandler___block_invoke_30;
  v19[3] = &unk_1E58A1BC8;
  id v12 = v6;
  id v20 = v12;
  v13 = [v11 analyzeLibraryForFeature:a3 reply:v19];

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v22) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  }
  if ((void)v23)
  {
    v14 = PLRequestGetLog();
    v15 = v14;
    os_signpost_id_t v16 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v13;
}

void __74__PLAssetsdPhotoKitClient_analyzeLibraryForFeature_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    v8 = "-[PLAssetsdPhotoKitClient analyzeLibraryForFeature:withCompletionHandler:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __74__PLAssetsdPhotoKitClient_analyzeLibraryForFeature_withCompletionHandler___block_invoke_30(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v3 = +[PLResult failureWithError:a2];
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
    id v5 = +[PLResult successWithResult:v4];

    uint64_t v3 = (uint64_t)v5;
  }
  id v6 = (id)v3;
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (id)analyzeAssets:(id)a3 forFeature:(unint64_t)a4 withCompletionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v26 = 0u;
  *(_OWORD *)sel = 0u;
  long long v25 = 0u;
  BOOL v10 = +[PLXPCMessageLogger enabled];
  LOBYTE(v25) = v10;
  if (v10)
  {
    uint64_t v11 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: analyzeAssets:forFeature:withCompletionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v12 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__982;
  char v31 = __Block_byref_object_dispose__983;
  id v32 = 0;
  v13 = [(PLAssetsdBaseClient *)self proxyFactory];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __74__PLAssetsdPhotoKitClient_analyzeAssets_forFeature_withCompletionHandler___block_invoke;
  v24[3] = &unk_1E58A1C40;
  v24[4] = &buf;
  v14 = [v13 remoteObjectProxyWithErrorHandler:v24];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __74__PLAssetsdPhotoKitClient_analyzeAssets_forFeature_withCompletionHandler___block_invoke_28;
  v22[3] = &unk_1E58A1BC8;
  id v15 = v9;
  id v23 = v15;
  os_signpost_id_t v16 = [v14 analyzeAssets:v8 forFeature:a4 reply:v22];

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    int v17 = PLRequestGetLog();
    id v18 = v17;
    os_signpost_id_t v19 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v16;
}

void __74__PLAssetsdPhotoKitClient_analyzeAssets_forFeature_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdPhotoKitClient analyzeAssets:forFeature:withCompletionHandler:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __74__PLAssetsdPhotoKitClient_analyzeAssets_forFeature_withCompletionHandler___block_invoke_28(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    uint64_t v3 = +[PLResult failureWithError:a2];
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
    id v5 = +[PLResult successWithResult:v4];

    uint64_t v3 = (uint64_t)v5;
  }
  id v6 = (id)v3;
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

- (BOOL)processUniversalSearchJITForAssetUUID:(id)a3 processingTypes:(unint64_t)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v28 = 0u;
  *(_OWORD *)sel = 0u;
  long long v27 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v27) = v9;
  if (v9)
  {
    id v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: processUniversalSearchJITForAssetUUID:processingTypes:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v11 = (void *)*((void *)&v27 + 1);
    *((void *)&v27 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__982;
  uint64_t v33 = __Block_byref_object_dispose__983;
  id v34 = 0;
  id v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __87__PLAssetsdPhotoKitClient_processUniversalSearchJITForAssetUUID_processingTypes_error___block_invoke;
  v26[3] = &unk_1E58A1C40;
  v26[4] = &buf;
  v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v26];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __87__PLAssetsdPhotoKitClient_processUniversalSearchJITForAssetUUID_processingTypes_error___block_invoke_27;
  v23[3] = &unk_1E58A1A88;
  id v14 = v8;
  id v24 = v14;
  p_long long buf = &buf;
  [v13 processUniversalSearchJITForAssetUUID:v14 processingTypes:a4 reply:v23];

  id v15 = *(void **)(*((void *)&buf + 1) + 40);
  id v16 = v15;
  int v17 = v16;
  if (v15 && a5) {
    *a5 = v16;
  }

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v27) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  }
  if ((void)v28)
  {
    id v18 = PLRequestGetLog();
    os_signpost_id_t v19 = v18;
    os_signpost_id_t v20 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v15 == 0;
}

void __87__PLAssetsdPhotoKitClient_processUniversalSearchJITForAssetUUID_processingTypes_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdPhotoKitClient processUniversalSearchJITForAssetUUID:processingTypes:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __87__PLAssetsdPhotoKitClient_processUniversalSearchJITForAssetUUID_processingTypes_error___block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "US JIT Processing failed for asset %{public}@ : %@", (uint8_t *)&v8, 0x16u);
    }
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v3;
}

- (id)processUniversalSearchJITForCoreSpotlightUniqueIdentifier:(id)a3 bundleID:(id)a4 processingTypes:(unint64_t)a5 error:(id *)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  BOOL v12 = +[PLXPCMessageLogger enabled];
  LOBYTE(v40) = v12;
  if (v12)
  {
    v13 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: processUniversalSearchJITForCoreSpotlightUniqueIdentifier:bundleID:processingTypes:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v14 = (void *)*((void *)&v40 + 1);
    *((void *)&v40 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v41 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__982;
  v46 = __Block_byref_object_dispose__983;
  id v47 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__982;
  v38 = __Block_byref_object_dispose__983;
  id v39 = 0;
  id v15 = [(PLAssetsdBaseClient *)self proxyFactory];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __116__PLAssetsdPhotoKitClient_processUniversalSearchJITForCoreSpotlightUniqueIdentifier_bundleID_processingTypes_error___block_invoke;
  v33[3] = &unk_1E58A1C40;
  v33[4] = &v34;
  id v16 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v33];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __116__PLAssetsdPhotoKitClient_processUniversalSearchJITForCoreSpotlightUniqueIdentifier_bundleID_processingTypes_error___block_invoke_25;
  v28[3] = &unk_1E589F0F8;
  p_long long buf = &buf;
  id v17 = v11;
  id v29 = v17;
  id v18 = v10;
  id v30 = v18;
  id v32 = &v34;
  [v16 processUniversalSearchJITForCoreSpotlightUniqueIdentifier:v18 bundleID:v17 processingTypes:a5 reply:v28];

  uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
  id v20 = (id)v35[5];
  v21 = v20;
  if (!v19 && a6) {
    *a6 = v20;
  }

  id v22 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v40) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v41 + 8));
  }
  if ((void)v41)
  {
    id v23 = PLRequestGetLog();
    id v24 = v23;
    os_signpost_id_t v25 = v41;
    if ((unint64_t)(v41 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(*((SEL *)&v42 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v22;
}

void __116__PLAssetsdPhotoKitClient_processUniversalSearchJITForCoreSpotlightUniqueIdentifier_bundleID_processingTypes_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    int v8 = "-[PLAssetsdPhotoKitClient processUniversalSearchJITForCoreSpotlightUniqueIdentifier:bundleID:processingTypes:er"
         "ror:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __116__PLAssetsdPhotoKitClient_processUniversalSearchJITForCoreSpotlightUniqueIdentifier_bundleID_processingTypes_error___block_invoke_25(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  if (!v6)
  {
    int v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = a1[4];
      uint64_t v10 = a1[5];
      int v11 = 138543874;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_ERROR, "US JIT Processing failed for %{public}@ : %{public}@ : %@", (uint8_t *)&v11, 0x20u);
    }

    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
  }
}

- (id)getUUIDsForAssetObjectIDs:(id)a3 filterPredicate:(id)a4 context:(id)a5 error:(id *)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v47 = 0u;
  *(_OWORD *)sel = 0u;
  long long v46 = 0u;
  BOOL v13 = +[PLXPCMessageLogger enabled];
  LOBYTE(v46) = v13;
  if (v13)
  {
    uint64_t v14 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getUUIDsForAssetObjectIDs:filterPredicate:context:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v15 = (void *)*((void *)&v46 + 1);
    *((void *)&v46 + 1) = v14;

    os_activity_scope_enter(v14, (os_activity_scope_state_t)((char *)&v47 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__982;
  v53 = __Block_byref_object_dispose__983;
  id v54 = 0;
  uint64_t v40 = 0;
  long long v41 = &v40;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__982;
  uint64_t v44 = __Block_byref_object_dispose__983;
  id v45 = 0;
  id v16 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v17 = v10;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(v17);
        }
        v21 = [*(id *)(*((void *)&v36 + 1) + 8 * i) URIRepresentation];
        [v16 addObject:v21];
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v18);
  }

  id v22 = [(PLAssetsdBaseClient *)self proxyFactory];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __83__PLAssetsdPhotoKitClient_getUUIDsForAssetObjectIDs_filterPredicate_context_error___block_invoke;
  v35[3] = &unk_1E58A1C40;
  v35[4] = &buf;
  id v23 = [v22 synchronousRemoteObjectProxyWithErrorHandler:v35];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __83__PLAssetsdPhotoKitClient_getUUIDsForAssetObjectIDs_filterPredicate_context_error___block_invoke_21;
  v31[3] = &unk_1E589F0D0;
  p_long long buf = &buf;
  id v24 = v12;
  id v32 = v24;
  uint64_t v34 = &v40;
  [v23 getUUIDsForAssetObjectURIs:v16 filterPredicate:v11 reply:v31];

  if (a6) {
    *a6 = *(id *)(*((void *)&buf + 1) + 40);
  }
  id v25 = (id)v41[5];

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v46) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v47 + 8));
  }
  if ((void)v47)
  {
    long long v26 = PLRequestGetLog();
    long long v27 = v26;
    os_signpost_id_t v28 = v47;
    if ((unint64_t)(v47 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v27, OS_SIGNPOST_INTERVAL_END, v28, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v25;
}

void __83__PLAssetsdPhotoKitClient_getUUIDsForAssetObjectIDs_filterPredicate_context_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    int v8 = "-[PLAssetsdPhotoKitClient getUUIDsForAssetObjectIDs:filterPredicate:context:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __83__PLAssetsdPhotoKitClient_getUUIDsForAssetObjectIDs_filterPredicate_context_error___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Received error getting uuids for asset object IDs, error: %@", buf, 0xCu);
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = v6;
    id v10 = *(id *)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 32) persistentStoreCoordinator];
    id v12 = [MEMORY[0x1E4F1CA60] dictionary];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __83__PLAssetsdPhotoKitClient_getUUIDsForAssetObjectIDs_filterPredicate_context_error___block_invoke_23;
    v17[3] = &unk_1E589F0A8;
    id v18 = v11;
    id v13 = v12;
    id v19 = v13;
    id v10 = v11;
    [v5 enumerateKeysAndObjectsUsingBlock:v17];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
    id v16 = v13;
  }
}

void __83__PLAssetsdPhotoKitClient_getUUIDsForAssetObjectIDs_filterPredicate_context_error___block_invoke_23(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v5 = [*(id *)(a1 + 32) managedObjectIDForURIRepresentation:a2];
  if (v5) {
    [*(id *)(a1 + 40) setObject:v6 forKey:v5];
  }
}

- (BOOL)cancelReservedCloudIdentifiersWithEntityName:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  BOOL v7 = +[PLXPCMessageLogger enabled];
  LOBYTE(v26) = v7;
  if (v7)
  {
    uint64_t v8 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: cancelReservedCloudIdentifiersWithEntityName:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v9 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__982;
  id v32 = __Block_byref_object_dispose__983;
  id v33 = 0;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  id v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __78__PLAssetsdPhotoKitClient_cancelReservedCloudIdentifiersWithEntityName_error___block_invoke;
  v21[3] = &unk_1E58A1C40;
  v21[4] = &buf;
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v21];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __78__PLAssetsdPhotoKitClient_cancelReservedCloudIdentifiersWithEntityName_error___block_invoke_20;
  v20[3] = &unk_1E58A17E0;
  v20[4] = &v22;
  v20[5] = &buf;
  [v11 cancelReservedCloudIdentifiersWithEntityName:v6 reply:v20];

  LODWORD(v11) = *((unsigned __int8 *)v23 + 24);
  id v12 = *(id *)(*((void *)&buf + 1) + 40);
  id v13 = v12;
  if (!v11 && a4) {
    *a4 = v12;
  }

  int v14 = *((unsigned __int8 *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    __int16 v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v28 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v14 != 0;
}

void __78__PLAssetsdPhotoKitClient_cancelReservedCloudIdentifiersWithEntityName_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PLAssetsdPhotoKitClient cancelReservedCloudIdentifiersWithEntityName:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __78__PLAssetsdPhotoKitClient_cancelReservedCloudIdentifiersWithEntityName_error___block_invoke_20(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v6)
  {
    int v7 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Received error cancelling reserved cloud identifiers, error: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (id)reservedCloudIdentifiersWithEntityName:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  BOOL v7 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v7;
  if (v7)
  {
    int v8 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: reservedCloudIdentifiersWithEntityName:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v9 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__982;
  uint64_t v35 = __Block_byref_object_dispose__983;
  id v36 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__982;
  long long v27 = __Block_byref_object_dispose__983;
  id v28 = 0;
  uint64_t v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72__PLAssetsdPhotoKitClient_reservedCloudIdentifiersWithEntityName_error___block_invoke;
  v22[3] = &unk_1E58A1C40;
  void v22[4] = &buf;
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v22];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__PLAssetsdPhotoKitClient_reservedCloudIdentifiersWithEntityName_error___block_invoke_18;
  v21[3] = &unk_1E58A1278;
  v21[4] = &buf;
  void v21[5] = &v23;
  [v11 reservedCloudIdentifiersWithEntityName:v6 reply:v21];

  uint64_t v12 = v24[5];
  id v13 = *(id *)(*((void *)&buf + 1) + 40);
  int v14 = v13;
  if (!v12 && a4) {
    *a4 = v13;
  }

  id v15 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    id v16 = PLRequestGetLog();
    os_signpost_id_t v17 = v16;
    os_signpost_id_t v18 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(*((SEL *)&v31 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v15;
}

void __72__PLAssetsdPhotoKitClient_reservedCloudIdentifiersWithEntityName_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    int v8 = "-[PLAssetsdPhotoKitClient reservedCloudIdentifiersWithEntityName:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __72__PLAssetsdPhotoKitClient_reservedCloudIdentifiersWithEntityName_error___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Received error retrieving reserved cloud identifiers, error: %@", buf, 0xCu);
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = v6;
    id v10 = *(id *)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__PLAssetsdPhotoKitClient_reservedCloudIdentifiersWithEntityName_error___block_invoke_19;
    v15[3] = &unk_1E589F080;
    id v16 = v11;
    id v10 = v11;
    [v5 enumerateObjectsUsingBlock:v15];
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithArray:v10];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    int v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

void __72__PLAssetsdPhotoKitClient_reservedCloudIdentifiersWithEntityName_error___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 UUIDString];
  [v2 addObject:v3];
}

- (id)reserveCloudIdentifiersWithEntityName:(id)a3 count:(unint64_t)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v31) = v9;
  if (v9)
  {
    id v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: reserveCloudIdentifiersWithEntityName:count:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v11 = (void *)*((void *)&v31 + 1);
    *((void *)&v31 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x3032000000;
  id v36 = __Block_byref_object_copy__982;
  uint64_t v37 = __Block_byref_object_dispose__983;
  id v38 = 0;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__982;
  long long v29 = __Block_byref_object_dispose__983;
  id v30 = 0;
  uint64_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __77__PLAssetsdPhotoKitClient_reserveCloudIdentifiersWithEntityName_count_error___block_invoke;
  v24[3] = &unk_1E58A1C40;
  v24[4] = &buf;
  uint64_t v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:v24];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __77__PLAssetsdPhotoKitClient_reserveCloudIdentifiersWithEntityName_count_error___block_invoke_12;
  v23[3] = &unk_1E58A1278;
  void v23[4] = &buf;
  v23[5] = &v25;
  [v13 reserveCloudIdentifiersWithEntityName:v8 count:a4 reply:v23];

  uint64_t v14 = v26[5];
  id v15 = *(id *)(*((void *)&buf + 1) + 40);
  id v16 = v15;
  if (!v14 && a5) {
    *a5 = v15;
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
    uint64_t v19 = v18;
    os_signpost_id_t v20 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(*((SEL *)&v33 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v17;
}

void __77__PLAssetsdPhotoKitClient_reserveCloudIdentifiersWithEntityName_count_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdPhotoKitClient reserveCloudIdentifiersWithEntityName:count:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __77__PLAssetsdPhotoKitClient_reserveCloudIdentifiersWithEntityName_count_error___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Received error reserving cloud identifiers, error: %@", buf, 0xCu);
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    id v9 = v6;
    id v10 = *(id *)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__PLAssetsdPhotoKitClient_reserveCloudIdentifiersWithEntityName_count_error___block_invoke_14;
    v15[3] = &unk_1E589F080;
    id v16 = v11;
    id v10 = v11;
    [v5 enumerateObjectsUsingBlock:v15];
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithArray:v10];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

void __77__PLAssetsdPhotoKitClient_reserveCloudIdentifiersWithEntityName_count_error___block_invoke_14(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 UUIDString];
  [v2 addObject:v3];
}

- (id)resolveLocalIdentifiersForCloudIdentifiers:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  BOOL v7 = +[PLXPCMessageLogger enabled];
  LOBYTE(v26) = v7;
  if (v7)
  {
    uint64_t v8 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: resolveLocalIdentifiersForCloudIdentifiers:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v9 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__982;
  long long v32 = __Block_byref_object_dispose__983;
  id v33 = 0;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__982;
  uint64_t v24 = __Block_byref_object_dispose__983;
  id v25 = 0;
  id v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __76__PLAssetsdPhotoKitClient_resolveLocalIdentifiersForCloudIdentifiers_error___block_invoke;
  v19[3] = &unk_1E58A1C40;
  void v19[4] = &buf;
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__PLAssetsdPhotoKitClient_resolveLocalIdentifiersForCloudIdentifiers_error___block_invoke_10;
  v18[3] = &unk_1E58A00D0;
  v18[4] = &buf;
  v18[5] = &v20;
  [v11 resolveLocalIdentifiersForCloudIdentifiers:v6 reply:v18];

  if (a4) {
    *a4 = *(id *)(*((void *)&buf + 1) + 40);
  }
  id v12 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    uint64_t v13 = PLRequestGetLog();
    uint64_t v14 = v13;
    os_signpost_id_t v15 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(*((SEL *)&v28 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v12;
}

void __76__PLAssetsdPhotoKitClient_resolveLocalIdentifiersForCloudIdentifiers_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PLAssetsdPhotoKitClient resolveLocalIdentifiersForCloudIdentifiers:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __76__PLAssetsdPhotoKitClient_resolveLocalIdentifiersForCloudIdentifiers_error___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_ERROR, "Received error getting uuids for local cloud identifiers, error: %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v9 = a1 + 32;
  }
  else
  {
    uint64_t v9 = a1 + 40;
    a3 = a2;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)v9 + 8) + 40), a3);
}

- (BOOL)sendChangesRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PLAssetsdBaseClient *)self proxyFactory];
  LOBYTE(a4) = +[PLAssetsdPhotoKitClient sendChangesRequest:v6 usingProxyFactory:v7 error:a4];

  return (char)a4;
}

- (void)sendChangesRequest:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  +[PLAssetsdPhotoKitClient sendChangesRequest:v7 usingProxyFactory:v8 reply:v6];
}

- (id)clientName
{
  return @"PhotoKit client";
}

+ (BOOL)sendChangesRequest:(id)a3 usingProxyFactory:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v30) = v9;
  if (v9)
  {
    int v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: sendChangesRequest:usingProxyFactory:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v11 = (void *)*((void *)&v30 + 1);
    *((void *)&v30 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  uint64_t v12 = [v8 queue];
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 1;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__982;
  id v36 = __Block_byref_object_dispose__983;
  id v37 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_error___block_invoke;
  v22[3] = &unk_1E589F058;
  id v13 = v8;
  id v23 = v13;
  uint64_t v24 = &v26;
  p_long long buf = &buf;
  uint64_t v14 = [v13 synchronousRemoteObjectProxyWithErrorHandler:v22];
  +[PLAssetsdPhotoKitClient setInTransactionProxy:1 queue:v12];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_error___block_invoke_9;
  v21[3] = &unk_1E58A17E0;
  v21[4] = &v26;
  void v21[5] = &buf;
  [v14 applyChangesRequest:v7 reply:v21];
  +[PLAssetsdPhotoKitClient setInTransactionProxy:0 queue:v12];
  if (*((unsigned char *)v27 + 24))
  {
    int v15 = 1;
  }
  else if (a5)
  {
    *a5 = *(id *)(*((void *)&buf + 1) + 40);
    int v15 = *((unsigned __int8 *)v27 + 24);
  }
  else
  {
    int v15 = 0;
  }

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v26, 8);

  if ((_BYTE)v30) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  }
  if ((void)v31)
  {
    id v16 = PLRequestGetLog();
    id v17 = v16;
    os_signpost_id_t v18 = v31;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(*((SEL *)&v32 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v15 != 0;
}

void __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_error___block_invoke(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = a1[4];
    id v6 = NSStringFromSelector(sel_sendChangesRequest_usingProxyFactory_error_);
    int v9 = 138543874;
    uint64_t v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error received from proxy factory %{public}@ in %{public}@: %@", (uint8_t *)&v9, 0x20u);
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 0;
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
}

void __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_error___block_invoke_9(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

+ (void)sendChangesRequest:(id)a3 usingProxyFactory:(id)a4 reply:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  BOOL v11 = +[PLXPCMessageLogger enabled];
  LOBYTE(v33) = v11;
  if (v11)
  {
    uint64_t v12 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: sendChangesRequest:usingProxyFactory:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v13 = (void *)*((void *)&v33 + 1);
    *((void *)&v33 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v34 + 8));
  }
  id v14 = [v9 queue];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_reply___block_invoke;
  v31[3] = &unk_1E58A1BC8;
  id v32 = v10;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3254779904;
  v22[2] = __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_reply___block_invoke_3;
  v22[3] = &unk_1EEBF52D0;
  char v26 = v33;
  id v27 = *((id *)&v33 + 1);
  long long v28 = v34;
  long long v29 = v35;
  SEL v30 = a2;
  id v15 = v14;
  id v23 = v15;
  id v16 = v8;
  id v24 = v16;
  id v17 = v32;
  id v25 = v17;
  [v9 remoteObjectProxyWithErrorHandler:v31 handler:v22];

  if ((_BYTE)v33) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v34 + 8));
  }
  if ((void)v34)
  {
    os_signpost_id_t v18 = PLRequestGetLog();
    uint64_t v19 = v18;
    os_signpost_id_t v20 = v34;
    if ((unint64_t)(v34 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(*((SEL *)&v35 + 1));
      *(_DWORD *)long long buf = 136446210;
      id v37 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136446466;
    id v6 = "+[PLAssetsdPhotoKitClient sendChangesRequest:usingProxyFactory:reply:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %{public}s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_reply___block_invoke_3(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v16 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v17[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 104));
      *(_DWORD *)long long buf = 138543362;
      id v15 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  +[PLAssetsdPhotoKitClient setInTransactionProxy:1 queue:*(void *)(a1 + 32)];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_reply___block_invoke_6;
  v12[3] = &unk_1E58A1C18;
  uint64_t v11 = *(void *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  [v3 applyChangesRequest:v11 reply:v12];
  +[PLAssetsdPhotoKitClient setInTransactionProxy:0 queue:*(void *)(a1 + 32)];
}

uint64_t __70__PLAssetsdPhotoKitClient_sendChangesRequest_usingProxyFactory_reply___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)setInTransactionProxy:(BOOL)a3 queue:(id)a4
{
}

+ (BOOL)inTransactionProxy
{
  return dispatch_get_specific("PLAssetsdPhotoKitClient_transactionProxy") != 0;
}

@end