@interface TRIDiffableAssetBuilder
+ (id)buildAndSaveDiffableAssetsWithAssetIds:(id)a3 metadataForAssetId:(id)a4 artifactProvider:(id)a5 options:(id)a6 paths:(id)a7 assetsDownloadSize:(unint64_t *)a8 perAssetIdCompletionBlockOnSuccess:(id)a9 perAssetIdCompletionBlockOnError:(id)a10 retryAfter:(id *)a11 error:(id *)a12;
@end

@implementation TRIDiffableAssetBuilder

+ (id)buildAndSaveDiffableAssetsWithAssetIds:(id)a3 metadataForAssetId:(id)a4 artifactProvider:(id)a5 options:(id)a6 paths:(id)a7 assetsDownloadSize:(unint64_t *)a8 perAssetIdCompletionBlockOnSuccess:(id)a9 perAssetIdCompletionBlockOnError:(id)a10 retryAfter:(id *)a11 error:(id *)a12
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v51 = a9;
  id v53 = a10;
  v56 = v18;
  if (!v18)
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    [v42 handleFailureInMethod:a2, a1, @"TRIDiffableAssetBuilder.m", 39, @"Invalid parameter not satisfying: %@", @"assetIds" object file lineNumber description];
  }
  v23 = v19;
  if (v19)
  {
    if (v20) {
      goto LABEL_5;
    }
  }
  else
  {
    v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, a1, @"TRIDiffableAssetBuilder.m", 40, @"Invalid parameter not satisfying: %@", @"metadataForAssetId" object file lineNumber description];

    if (v20)
    {
LABEL_5:
      if (a8) {
        goto LABEL_6;
      }
LABEL_14:
      v45 = [MEMORY[0x1E4F28B00] currentHandler];
      [v45 handleFailureInMethod:a2, a1, @"TRIDiffableAssetBuilder.m", 42, @"Invalid parameter not satisfying: %@", @"assetsDownloadSize" object file lineNumber description];

      if (v21) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
  }
  v44 = [MEMORY[0x1E4F28B00] currentHandler];
  [v44 handleFailureInMethod:a2, a1, @"TRIDiffableAssetBuilder.m", 41, @"Invalid parameter not satisfying: %@", @"artifactProvider" object file lineNumber description];

  if (!a8) {
    goto LABEL_14;
  }
LABEL_6:
  if (v21) {
    goto LABEL_7;
  }
LABEL_15:
  v46 = [MEMORY[0x1E4F28B00] currentHandler];
  [v46 handleFailureInMethod:a2, a1, @"TRIDiffableAssetBuilder.m", 43, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];

LABEL_7:
  v24 = v20;
  id v25 = v22;
  if (!v22)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, a1, @"TRIDiffableAssetBuilder.m", 44, @"Invalid parameter not satisfying: %@", @"paths" object file lineNumber description];
  }
  *a8 = 0;
  v26 = [TRIAssetStore alloc];
  v27 = [v21 downloadOptions];
  v28 = [v27 activity];
  v49 = v25;
  v29 = [(TRIAssetStore *)v26 initWithPaths:v25 monitoredActivity:v28];

  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke;
  v82[3] = &unk_1E6BB9558;
  v30 = v29;
  v83 = v30;
  v50 = (void *)MEMORY[0x1E016EA80](v82);
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__9;
  v80 = __Block_byref_object_dispose__9;
  id v81 = 0;
  dispatch_semaphore_t v31 = dispatch_semaphore_create(0);
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_33;
  v62[3] = &unk_1E6BB9670;
  id v32 = v24;
  id v63 = v32;
  id v33 = v21;
  id v64 = v33;
  id v52 = v51;
  id v68 = v52;
  id v48 = v53;
  id v69 = v48;
  v71 = a11;
  v72 = a12;
  id v54 = v23;
  id v65 = v54;
  SEL v73 = a2;
  id v74 = a1;
  v34 = v30;
  v75 = a8;
  v66 = v34;
  v70 = &v76;
  v35 = v31;
  v67 = v35;
  v36 = (void *)MEMORY[0x1E016EA80](v62);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_52;
  v57[3] = &unk_1E6BB9698;
  v60 = a11;
  v61 = a12;
  v37 = v35;
  v58 = v37;
  id v38 = v36;
  id v59 = v38;
  id v39 = (id)[v32 fetchDiffSourceRecordIdsWithTargetAssetIds:v56 isAcceptableSourceAssetId:v50 options:v33 completion:v57];
  [MEMORY[0x1E4F93B18] waitForSemaphore:v37];
  id v40 = (id)v77[5];

  _Block_object_dispose(&v76, 8);
  return v40;
}

uint64_t __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) hasAssetWithIdentifier:a2 type:0];
}

void __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_33(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_2;
  v21[3] = &unk_1E6BB95A8;
  id v22 = v3;
  id v23 = *(id *)(a1 + 72);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_4;
  v18[3] = &unk_1E6BB95F8;
  id v19 = v22;
  id v20 = *(id *)(a1 + 80);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_6;
  v10[3] = &unk_1E6BB9648;
  long long v15 = *(_OWORD *)(a1 + 96);
  id v11 = *(id *)(a1 + 48);
  long long v16 = *(_OWORD *)(a1 + 112);
  id v6 = *(id *)(a1 + 56);
  uint64_t v17 = *(void *)(a1 + 128);
  uint64_t v7 = *(void *)(a1 + 88);
  id v12 = v6;
  uint64_t v14 = v7;
  id v13 = *(id *)(a1 + 64);
  id v8 = v22;
  id v9 = (id)[v4 fetchDiffsWithRecordIds:v8 options:v5 perRecordProgress:0 perRecordCompletionBlockOnSuccess:v21 perRecordCompletionBlockOnError:v18 completion:v10];
}

void __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_3;
  v7[3] = &unk_1E6BB9580;
  id v8 = v4;
  uint64_t v5 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_3(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [a3 recordId];
  LODWORD(v7) = [v7 isEqual:v8];

  id v9 = v11;
  if (v7)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
    }
    *a4 = 1;
    id v9 = v11;
  }
}

void __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_5;
  v12[3] = &unk_1E6BB95D0;
  id v13 = v6;
  id v8 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v14 = v7;
  id v15 = v9;
  id v10 = v7;
  id v11 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v12];
}

void __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_5(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v7 = (void *)a1[4];
  id v8 = [a3 recordId];
  LODWORD(v7) = [v7 isEqual:v8];

  id v9 = v11;
  if (v7)
  {
    uint64_t v10 = a1[6];
    if (v10) {
      (*(void (**)(uint64_t, id, void))(v10 + 16))(v10, v11, a1[5]);
    }
    *a4 = 1;
    id v9 = v11;
  }
}

void __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  switch(a2)
  {
    case 0:
    case 1:
    case 3:
      id v12 = TRILogCategory_Server();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_error_impl(&dword_1DA291000, v12, OS_LOG_TYPE_ERROR, "Failing request for asset diff records without retry: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      id v13 = *(id **)(a1 + 72);
      if (v13) {
        goto LABEL_5;
      }
      break;
    case 2:
      id v14 = TRILogCategory_Server();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_error_impl(&dword_1DA291000, v14, OS_LOG_TYPE_ERROR, "Failing request for asset diff records with retry: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      id v15 = *(id **)(a1 + 64);
      if (v15) {
        objc_storeStrong(v15, a4);
      }
      id v13 = *(id **)(a1 + 72);
      if (v13) {
LABEL_5:
      }
        objc_storeStrong(v13, a5);
      break;
    case 4:
      if (v9)
      {
        long long v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v9, "count"));
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v31 = 0x2020000000;
        char v32 = 1;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_38;
        v22[3] = &unk_1E6BB9620;
        id v23 = *(id *)(a1 + 32);
        long long v27 = *(_OWORD *)(a1 + 80);
        id v24 = *(id *)(a1 + 40);
        id v17 = v16;
        uint64_t v18 = *(void *)(a1 + 72);
        uint64_t v28 = *(void *)(a1 + 96);
        uint64_t v29 = v18;
        id v25 = v17;
        p_long long buf = &buf;
        [v9 enumerateKeysAndObjectsUsingBlock:v22];
        uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
        id v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v17;
        id v21 = v17;

        _Block_object_dispose(&buf, 8);
      }
      break;
    default:
      break;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_38(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [v4 destAssetId];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 72), @"TRIDiffableAssetBuilder.m", 109, @"Expression was unexpectedly nil/false: %@", @"metadataForAssetId[artifact.destAssetId]" object file lineNumber description];
  }
  id obj = 0;
  id v8 = *(void **)(a1 + 40);
  id v9 = [v4 destAssetId];
  id v10 = [v4 sourceAssetId];
  id v11 = [v4 diff];
  id v12 = [v11 path];

  if (!v12)
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 72), @"TRIDiffableAssetBuilder.m", 113, @"Expression was unexpectedly nil/false: %@", @"artifact.diff.path" object file lineNumber description];
  }
  int v13 = [v8 saveAssetWithIdentifier:v9 builtFromAssetWithIdentifier:v10 patchFilename:v12 metadata:v7 error:&obj];

  if (v13)
  {
    id v14 = *(void **)(a1 + 48);
    id v15 = [v4 destAssetId];
    [v14 addObject:v15];

    **(void **)(a1 + 80) += [v4 diffSize];
  }
  else
  {
    long long v16 = *(id **)(a1 + 88);
    if (v16) {
      objc_storeStrong(v16, obj);
    }
  }
  id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v18 = [v4 diff];
  id v30 = 0;
  char v19 = [v17 removeItemAtURL:v18 error:&v30];
  id v20 = v30;

  if ((v19 & 1) == 0)
  {
    id v21 = [v20 domain];
    id v22 = v21;
    if (v21 != (void *)*MEMORY[0x1E4F281F8])
    {

      goto LABEL_13;
    }
    uint64_t v23 = [v20 code];

    if (v23 != 4)
    {
LABEL_13:
      int v24 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      id v25 = TRILogCategory_Server();
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      if (v24)
      {
        if (v26) {
          goto LABEL_19;
        }
      }
      else if (v26)
      {
LABEL_19:
        long long v27 = [v4 diff];
        *(_DWORD *)long long buf = 138412546;
        uint64_t v33 = v27;
        __int16 v34 = 2114;
        id v35 = v20;
        _os_log_error_impl(&dword_1DA291000, v25, OS_LOG_TYPE_ERROR, "Failed to clean up CK cached asset %@: %{public}@", buf, 0x16u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
  }
}

void __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_52(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  switch(a2)
  {
    case 0:
    case 1:
    case 3:
      goto LABEL_2;
    case 2:
      id v12 = *(id **)(a1 + 48);
      if (v12) {
        objc_storeStrong(v12, a4);
      }
LABEL_2:
      id v11 = *(id **)(a1 + 56);
      if (v11) {
        objc_storeStrong(v11, a5);
      }
      goto LABEL_4;
    case 4:
      if (v13) {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else {
LABEL_4:
      }
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
      break;
    default:
      break;
  }
}

@end