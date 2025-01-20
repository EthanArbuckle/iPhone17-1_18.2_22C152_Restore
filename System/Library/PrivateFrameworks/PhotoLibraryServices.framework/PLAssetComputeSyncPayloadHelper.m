@interface PLAssetComputeSyncPayloadHelper
+ (id)mediaAnalysisPayloadDataForWrapperData:(id)a3;
+ (id)mediaAnalysisPayloadDataForWrapperURL:(id)a3;
- (BOOL)applyComputeSyncWrapperData:(id)a3 toAsset:(id)a4 error:(id *)a5;
- (id)assetPayloadForComputeSyncWrapperData:(id)a3 payloadID:(id)a4 error:(id *)a5;
- (id)computeSyncWrapperDataForAsset:(id)a3 mediaAnalysisPayload:(id)a4 analysisStage:(signed __int16)a5 error:(id *)a6;
- (id)computeSyncWrapperURLForAsset:(id)a3 analysisStage:(signed __int16)a4;
@end

@implementation PLAssetComputeSyncPayloadHelper

+ (id)mediaAnalysisPayloadDataForWrapperURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v10 = 0;
  v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:0 error:&v10];
  id v6 = v10;
  if (v5)
  {
    v7 = [a1 mediaAnalysisPayloadDataForWrapperData:v5];
  }
  else
  {
    v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = v4;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "[CCSS] Unable to read compute sync resource %@: %@", buf, 0x16u);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)mediaAnalysisPayloadDataForWrapperData:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F94090];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithData:v4];

  id v6 = objc_alloc_init(PLAssetComputeSyncPayloadWrapper);
  if ([(PLAssetComputeSyncPayloadWrapper *)v6 readFrom:v5])
  {
    v7 = [(PLAssetComputeSyncPayloadWrapper *)v6 mediaAnalysisPayload];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)computeSyncWrapperURLForAsset:(id)a3 analysisStage:(signed __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F1CB10];
  v8 = [v6 pathForComputeSyncWrapperFile];
  v9 = [v7 fileURLWithPath:v8 isDirectory:0];

  if (!v9)
  {
    v31 = PLBackendGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = [v6 scopedIdentifier];
      *(_DWORD *)buf = 138412290;
      v58 = v32;
      _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "[CCSS] Unable to get compute sync resource URL for asset %@", buf, 0xCu);
    }
    goto LABEL_38;
  }
  id v10 = (void *)MEMORY[0x19F38D3B0]();
  v11 = [v9 URLByDeletingLastPathComponent];
  id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v56 = 0;
  char v13 = [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v56];
  id v14 = v56;

  if (v13)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CB10];
    v16 = [v6 pathForComputeSyncMediaAnalysisPayloadFile];
    v17 = [v15 fileURLWithPath:v16 isDirectory:0];

    id v55 = v14;
    v18 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v17 options:0 error:&v55];
    id v19 = v55;

    v49 = v10;
    if (!v18 && (PLIsErrorFileNotFound() & 1) == 0)
    {
      v20 = PLBackendGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = [v6 scopedIdentifier];
        *(_DWORD *)buf = 138412546;
        v58 = v21;
        __int16 v59 = 2112;
        id v60 = v19;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "[CCSS] Unable to read MAD compute sync sidecar for asset %@: %@", buf, 0x16u);
      }
    }
    id v54 = v19;
    v22 = [(PLAssetComputeSyncPayloadHelper *)self computeSyncWrapperDataForAsset:v6 mediaAnalysisPayload:v18 analysisStage:v4 error:&v54];
    id v23 = v54;

    if (v22)
    {
      id v53 = v23;
      char v24 = [v22 writeToURL:v9 options:1 error:&v53];
      id v25 = v53;

      if ((v24 & 1) == 0)
      {
        v34 = PLBackendGetLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v36 = [v6 scopedIdentifier];
          *(_DWORD *)buf = 138412546;
          v58 = v36;
          __int16 v59 = 2112;
          id v60 = v25;
          _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "[CCSS] Unable to write compute sync resource for asset %@: %@", buf, 0x16u);
        }
        int v30 = 1;
        id v23 = v25;
        goto LABEL_34;
      }
      v48 = v22;
      if (!v18) {
        goto LABEL_14;
      }
      if (computeSyncWrapperURLForAsset_analysisStage__onceToken != -1) {
        dispatch_once(&computeSyncWrapperURLForAsset_analysisStage__onceToken, &__block_literal_global_14129);
      }
      if (!computeSyncWrapperURLForAsset_analysisStage__keepMadSidecarAround)
      {
        v43 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v52 = v25;
        char v44 = [v43 removeItemAtURL:v17 error:&v52];
        id v26 = v52;

        if ((v44 & 1) == 0)
        {
          v45 = PLBackendGetLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v46 = [v6 scopedIdentifier];
            *(_DWORD *)buf = 138412546;
            v58 = v46;
            __int16 v59 = 2112;
            id v60 = v26;
            _os_log_impl(&dword_19B3C7000, v45, OS_LOG_TYPE_ERROR, "[CCSS] Unable to remove MAD compute sync payload for asset %@: %@", buf, 0x16u);
          }
        }
      }
      else
      {
LABEL_14:
        id v26 = v25;
      }
      v27 = (void *)MEMORY[0x1E4F8B908];
      v28 = [v6 pathManager];
      v29 = [v28 capabilities];
      id v51 = v26;
      LOBYTE(v27) = [v27 ingestItemAtURL:v9 toURL:v9 type:0 options:2 capabilities:v29 error:&v51];
      id v14 = v51;

      if (v27)
      {
        int v30 = 0;
        v22 = v48;
        id v10 = v49;
LABEL_36:

        goto LABEL_37;
      }
      v22 = v48;
      if (!*MEMORY[0x1E4F59AC0])
      {
        v37 = __CPLAssetsdOSLogDomain();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = [v6 scopedIdentifier];
          *(_DWORD *)buf = 138412802;
          v58 = v9;
          __int16 v59 = 2112;
          id v60 = v14;
          __int16 v61 = 2112;
          id v62 = v38;
          _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "[CCSS] Failed to set file protection on generated compute sync wrapper %@, error: %@ %@", buf, 0x20u);

          v22 = v48;
        }
      }
      v34 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v50 = v14;
      char v39 = [v34 removeItemAtURL:v9 error:&v50];
      id v23 = v50;

      if ((v39 & 1) == 0)
      {
        char v42 = PLIsErrorFileNotFound();

        if (v42)
        {
          int v30 = 1;
          goto LABEL_35;
        }
        v34 = PLBackendGetLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v47 = [v6 scopedIdentifier];
          *(_DWORD *)buf = 138412546;
          v58 = v47;
          __int16 v59 = 2112;
          id v60 = v23;
          _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "[CCSS] Unable to remove compute sync wrapper for asset %@: %@", buf, 0x16u);
        }
        int v30 = 0;
LABEL_34:

LABEL_35:
        id v14 = v23;
        id v10 = v49;
        goto LABEL_36;
      }
    }
    else
    {
      v34 = PLBackendGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = [v6 scopedIdentifier];
        *(_DWORD *)buf = 138412546;
        v58 = v35;
        __int16 v59 = 2112;
        id v60 = v23;
        _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "[CCSS] Unable to encode compute sync resource for asset %@: %@", buf, 0x16u);
      }
    }
    int v30 = 1;
    goto LABEL_34;
  }
  v17 = PLBackendGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v33 = [v6 scopedIdentifier];
    *(_DWORD *)buf = 138412802;
    v58 = v33;
    __int16 v59 = 2112;
    id v60 = v11;
    __int16 v61 = 2112;
    id v62 = v14;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "[CCSS] Unable to create compute sync resource directory for asset %@ URL %@ error: %@", buf, 0x20u);
  }
  int v30 = 1;
LABEL_37:

  if (v30)
  {
LABEL_38:
    id v40 = 0;
    goto LABEL_40;
  }
  id v40 = v9;
LABEL_40:

  return v40;
}

void __79__PLAssetComputeSyncPayloadHelper_computeSyncWrapperURLForAsset_analysisStage___block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  computeSyncWrapperURLForAsset_analysisStage__keepMadSidecarAround = [v0 BOOLForKey:@"PLCCSSKeepMADPayloadAfterWrapperGeneration"];
}

- (id)assetPayloadForComputeSyncWrapperData:(id)a3 payloadID:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLAssetComputeSyncPayloadHelper.m", 63, @"Invalid parameter not satisfying: %@", @"wrapperData" object file lineNumber description];
  }
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v9];
  id v12 = objc_alloc_init(PLAssetComputeSyncPayloadWrapper);
  if ([(PLAssetComputeSyncPayloadWrapper *)v12 readFrom:v11]
    && [(PLAssetComputeSyncPayloadWrapper *)v12 hasAssetPayload])
  {
    char v13 = [(PLAssetComputeSyncPayloadWrapper *)v12 assetPayload];
    id v14 = +[PLManagedObjectJournalEntryPayload payloadWithData:v13 forPayloadID:v10 version:[(PLAssetComputeSyncPayloadWrapper *)v12 assetPayloadVersion] andNilProperties:0 error:a5];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (BOOL)applyComputeSyncWrapperData:(id)a3 toAsset:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PLAssetComputeSyncPayloadHelper.m", 50, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  v11 = [v10 cloudAssetGUID];
  id v12 = +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:v11];
  char v13 = [(PLAssetComputeSyncPayloadHelper *)self assetPayloadForComputeSyncWrapperData:v9 payloadID:v12 error:a5];

  if (v13)
  {
    id v14 = [v13 rawPayloadAttributes];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      v16 = [[PLJournalEntryPayloadPropertyInfoAssetCompute alloc] initWithAsset:v10];
      [v13 applyPayloadToManagedObject:v10 payloadAttributesToUpdate:0 info:v16];
    }
  }

  return v13 != 0;
}

- (id)computeSyncWrapperDataForAsset:(id)a3 mediaAnalysisPayload:(id)a4 analysisStage:(signed __int16)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  id v11 = a3;
  id v12 = a4;
  char v13 = +[PLAssetComputeSyncJournalEntryPayload payloadAdapterForManagedObject:v11];
  if (!v13)
  {
    char v24 = [MEMORY[0x1E4F28B00] currentHandler];
    id v25 = [v11 uuid];
    [v24 handleFailureInMethod:a2, self, @"PLAssetComputeSyncPayloadHelper.m", 27, @"Unable to create compute sync payload adapter for asset: %@", v25 object file lineNumber description];
  }
  id v14 = [[PLJournalEntryPayloadPropertyInfoAssetCompute alloc] initWithAnalysisStage:v7];
  uint64_t v15 = [(PLManagedObjectJournalEntryPayload *)[PLAssetComputeSyncJournalEntryPayload alloc] initWithInsertAdapter:v13 changedKeys:0 info:v14];
  v16 = v15;
  if (v15)
  {
    v17 = [(PLManagedObjectJournalEntryPayload *)v15 payloadDataWithError:a6];
    if (v17)
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F94098]);
      id v19 = objc_alloc_init(PLAssetComputeSyncPayloadWrapper);
      [(PLAssetComputeSyncPayloadWrapper *)v19 setAssetPayloadVersion:+[PLAssetComputeSyncJournalEntryPayload payloadVersion]];
      [(PLAssetComputeSyncPayloadWrapper *)v19 setAssetPayload:v17];
      [(PLAssetComputeSyncPayloadWrapper *)v19 setMediaAnalysisPayload:v12];
      v20 = [MEMORY[0x1E4F8B888] currentBuildVersionString];
      [(PLAssetComputeSyncPayloadWrapper *)v19 setDeviceBuild:v20];

      v21 = (void *)MGCopyAnswer();
      [(PLAssetComputeSyncPayloadWrapper *)v19 setDeviceHwModel:v21];

      [(PLAssetComputeSyncPayloadWrapper *)v19 writeTo:v18];
      v22 = [v18 immutableData];
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end