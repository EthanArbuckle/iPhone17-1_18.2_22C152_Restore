@interface PLModelMigrationAction
- (id)actionName;
@end

@implementation PLModelMigrationAction

void __95__PLModelMigrationAction_RevalidateFaceAreaPoints_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  [v7 revalidateFaceAreaPoints];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95__PLModelMigrationAction_RevalidateFaceAreaPoints_performActionWithManagedObjectContext_error___block_invoke_2;
  v13[3] = &unk_1E5873348;
  v13[4] = *(void *)(a1 + 32);
  v13[5] = a3;
  if (__ROR8__(0x1CAC083126E978D5 * a3, 3) <= 0x4189374BC6A7EFuLL && a3 != 0) {
    __95__PLModelMigrationAction_RevalidateFaceAreaPoints_performActionWithManagedObjectContext_error___block_invoke_2((uint64_t)v13);
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 1)
  {
    v9 = *(void **)(a1 + 32);
    v10 = [v7 addedDate];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v11 + 40);
    LODWORD(v9) = [v9 isCancelledWithResumeMarker:v10 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);

    if (v9)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 2;
      *a4 = 1;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __95__PLModelMigrationAction_RevalidateFaceAreaPoints_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v2 = PLMigrationGetLog();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) logger];

    if (v4)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      *(_OWORD *)buf = 0u;
      long long v15 = 0u;
      v5 = PLMigrationGetLog();
      os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
      uint64_t v6 = *(void *)(a1 + 40);
      int v12 = 134217984;
      uint64_t v13 = v6;
      LODWORD(v11) = 12;
      id v7 = (uint8_t *)_os_log_send_and_compose_impl();

      v8 = objc_msgSend(*(id *)(a1 + 32), "logger", &v12, v11);
      objc_msgSend(v8, "logWithMessage:fromCodeLocation:type:", v7, "PLModelMigrationActionBackground.m", 221, 1);

      if (v7 != buf) {
        free(v7);
      }
    }
    else
    {
      v9 = PLMigrationGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v10;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "Updated %lu assets", buf, 0xCu);
      }
    }
  }
}

void __102__PLModelMigrationAction_CinematicVideoPopulateDepthType_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  v8 = [v7 metadataFromMediaPropertiesOrOriginalResource];
  if (v8)
  {
    [v7 setDepthTypeFromMetadata:v8];
  }
  else
  {
    v9 = PLMigrationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [v7 uuid];
      *(_DWORD *)buf = 138543362;
      long long v18 = v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "No metadata associated with asset: %{public}@", buf, 0xCu);
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 1)
  {
    uint64_t v11 = *(void **)(a1 + 32);
    int v12 = [v7 addedDate];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v13 + 40);
    LODWORD(v11) = [v11 isCancelledWithResumeMarker:v12 error:&obj];
    objc_storeStrong((id *)(v13 + 40), obj);

    if (v11)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 2;
      *a4 = 1;
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __102__PLModelMigrationAction_CinematicVideoPopulateDepthType_performActionWithManagedObjectContext_error___block_invoke_194;
  v15[3] = &unk_1E5873348;
  v15[4] = *(void *)(a1 + 32);
  v15[5] = a3;
  if (__ROR8__(0x1CAC083126E978D5 * a3, 3) <= 0x4189374BC6A7EFuLL && a3 != 0) {
    __102__PLModelMigrationAction_CinematicVideoPopulateDepthType_performActionWithManagedObjectContext_error___block_invoke_194((uint64_t)v15);
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __102__PLModelMigrationAction_CinematicVideoPopulateDepthType_performActionWithManagedObjectContext_error___block_invoke_194(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v2 = PLMigrationGetLog();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) logger];

    if (v4)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      *(_OWORD *)buf = 0u;
      long long v15 = 0u;
      v5 = PLMigrationGetLog();
      os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
      uint64_t v6 = *(void *)(a1 + 40);
      int v12 = 134217984;
      uint64_t v13 = v6;
      LODWORD(v11) = 12;
      id v7 = (uint8_t *)_os_log_send_and_compose_impl();

      v8 = objc_msgSend(*(id *)(a1 + 32), "logger", &v12, v11);
      objc_msgSend(v8, "logWithMessage:fromCodeLocation:type:", v7, "PLModelMigrationActionBackground.m", 322, 1);

      if (v7 != buf) {
        free(v7);
      }
    }
    else
    {
      v9 = PLMigrationGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v10;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "Updated %lu assets", buf, 0xCu);
      }
    }
  }
}

void __85__PLModelMigrationAction_updateACVideos_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  v8 = [v7 metadataFromMediaPropertiesOrOriginalResource];
  if ([v8 isActionCam]) {
    [v7 setKindSubtype:104];
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 1)
  {
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v7 addedDate];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v11 + 40);
    LODWORD(v9) = [v9 isCancelledWithResumeMarker:v10 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);

    if (v9)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 2;
      *a4 = 1;
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__PLModelMigrationAction_updateACVideos_performActionWithManagedObjectContext_error___block_invoke_2;
  v13[3] = &unk_1E5873348;
  v13[4] = *(void *)(a1 + 32);
  v13[5] = a3;
  if (__ROR8__(0x1CAC083126E978D5 * a3, 3) <= 0x4189374BC6A7EFuLL && a3 != 0) {
    __85__PLModelMigrationAction_updateACVideos_performActionWithManagedObjectContext_error___block_invoke_2((uint64_t)v13);
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __85__PLModelMigrationAction_updateACVideos_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v2 = PLMigrationGetLog();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) logger];

    if (v4)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      *(_OWORD *)buf = 0u;
      long long v15 = 0u;
      v5 = PLMigrationGetLog();
      os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
      uint64_t v6 = *(void *)(a1 + 40);
      int v12 = 134217984;
      uint64_t v13 = v6;
      LODWORD(v11) = 12;
      id v7 = (uint8_t *)_os_log_send_and_compose_impl();

      v8 = objc_msgSend(*(id *)(a1 + 32), "logger", &v12, v11);
      objc_msgSend(v8, "logWithMessage:fromCodeLocation:type:", v7, "PLModelMigrationActionBackground.m", 423, 1);

      if (v7 != buf) {
        free(v7);
      }
    }
    else
    {
      v9 = PLMigrationGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v10;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "Updated %lu assets", buf, 0xCu);
      }
    }
  }
}

void __88__PLModelMigrationAction_RebuildHighlights_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
}

BOOL __95__PLModelMigrationAction_RemoveAllPurgeableClones_performActionWithManagedObjectContext_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)a1[4];
  id v34 = 0;
  int v5 = [v4 isCancelledWithResumeMarker:0 error:&v34];
  id v6 = v34;
  id v7 = v6;
  if (!v5)
  {
    uint64_t v12 = a1[5];
    id v33 = 0;
    uint64_t v13 = [v3 resourceValuesForKeys:v12 error:&v33];
    id v14 = v33;
    uint64_t v11 = v14;
    if (v13)
    {
      long long v15 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F1C660]];
      int v16 = [v15 BOOLValue];

      if (!v16)
      {
        BOOL v10 = 1;
LABEL_16:

        goto LABEL_17;
      }
      long long v17 = [v3 lastPathComponent];
      if ((unint64_t)[v17 length] >= a1[9])
      {
        id v20 = objc_alloc(MEMORY[0x1E4F29128]);
        long long v21 = [v17 substringToIndex:a1[9]];
        long long v22 = (void *)[v20 initWithUUIDString:v21];
        long long v23 = [v22 UUIDString];

        if (v23)
        {
          long long v24 = (void *)a1[4];
          uint64_t v25 = a1[6];
          id v32 = 0;
          uint64_t v26 = [v24 removePurgableClonesForAssetUUID:v23 withMOC:v25 error:&v32];
          id v27 = v32;
          *(void *)(*(void *)(a1[7] + 8) + 24) = v26;
          uint64_t v28 = *(void *)(*(void *)(a1[7] + 8) + 24);
          BOOL v10 = v28 == 1;
          if (v28 != 1)
          {
            uint64_t v29 = *(void *)(a1[8] + 8);
            long long v30 = *(void **)(v29 + 40);
            *(void *)(v29 + 40) = v27;
            id v27 = v30;
          }
        }
        else
        {
          BOOL v10 = 1;
        }
      }
      else
      {
        BOOL v10 = 1;
      }
    }
    else
    {
      *(void *)(*(void *)(a1[7] + 8) + 24) = 3;
      uint64_t v18 = *(void *)(a1[8] + 8);
      id v19 = v14;
      BOOL v10 = 0;
      long long v17 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v19;
    }

    goto LABEL_16;
  }
  *(void *)(*(void *)(a1[7] + 8) + 24) = 2;
  uint64_t v8 = *(void *)(a1[8] + 8);
  id v9 = v6;
  BOOL v10 = 0;
  uint64_t v11 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v9;
LABEL_17:

  return v10;
}

void __107__PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  [*(id *)(a1 + 32) _processForRepairWithAsset:v7 repairCount:*(void *)(*(void *)(a1 + 48) + 8) + 24];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 1)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = [v7 addedDate];
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v10 + 40);
    LODWORD(v8) = [v8 isCancelledWithResumeMarker:v9 error:&obj];
    objc_storeStrong((id *)(v10 + 40), obj);

    if (v8)
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
      *a4 = 1;
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __107__PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets_performActionWithManagedObjectContext_error___block_invoke_2;
  v12[3] = &unk_1E5873348;
  v12[4] = *(void *)(a1 + 32);
  v12[5] = a3;
  if (__ROR8__(0x1CAC083126E978D5 * a3, 3) <= 0x4189374BC6A7EFuLL && a3 != 0) {
    __107__PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets_performActionWithManagedObjectContext_error___block_invoke_2((uint64_t)v12);
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __107__PLModelMigrationAction_FixDuplicateMergeCrashRecoveryAssets_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v2 = PLMigrationGetLog();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    v4 = [*(id *)(a1 + 32) logger];

    if (v4)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      *(_OWORD *)buf = 0u;
      long long v15 = 0u;
      int v5 = PLMigrationGetLog();
      os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
      uint64_t v6 = *(void *)(a1 + 40);
      int v12 = 134217984;
      uint64_t v13 = v6;
      LODWORD(v11) = 12;
      id v7 = (uint8_t *)_os_log_send_and_compose_impl();

      uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "logger", &v12, v11);
      objc_msgSend(v8, "logWithMessage:fromCodeLocation:type:", v7, "PLModelMigrationActionBackground.m", 716, 1);

      if (v7 != buf) {
        free(v7);
      }
    }
    else
    {
      id v9 = PLMigrationGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v10;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "Updated %lu assets", buf, 0xCu);
      }
    }
  }
}

uint64_t __100__PLModelMigrationAction_ReevaluatePanoramaImageAssets_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updatePanoramosityWithMetadata:0];
}

id __106__PLModelMigrationAction_setInitialIsDetectedScreenshotValue_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __106__PLModelMigrationAction_setInitialIsDetectedScreenshotValue_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __106__PLModelMigrationAction_setInitialIsDetectedScreenshotValue_performActionWithManagedObjectContext_error___block_invoke_3(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = [v6 objectID];
  uint64_t v8 = (void *)a1[4];
  uint64_t v9 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v9 + 40);
  int v10 = [v8 isCancelledWithResumeMarker:v7 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    [v6 recalculateIsDetectedScreenshot];
    ++*(void *)(*(void *)(a1[7] + 8) + 24);
    uint64_t v11 = *(void **)(*(void *)(a1[8] + 8) + 40);
    objc_msgSend(v11, "setCompletedUnitCount:", objc_msgSend(v11, "completedUnitCount") + 1);
  }
}

id __107__PLModelMigrationAction_dedupeResourcesWithSimilarCompactUTI_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __107__PLModelMigrationAction_dedupeResourcesWithSimilarCompactUTI_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __107__PLModelMigrationAction_dedupeResourcesWithSimilarCompactUTI_performActionWithManagedObjectContext_error___block_invoke_3(void *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v49 = a2;
  id v7 = a3;
  uint64_t v8 = [v7 objectID];
  uint64_t v9 = (void *)a1[4];
  uint64_t v10 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v10 + 40);
  int v11 = [v9 isCancelledWithResumeMarker:v8 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    v50 = a1;
    int v12 = [v7 uniformTypeIdentifier];
    uint64_t v13 = [v12 identifier];
    int v14 = PLFileTypeFromIdentifier(v13);

    if (v14)
    {
      v47 = v12;
      v48 = v8;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v15 = [v7 asset];
      long long v16 = [v15 modernResources];

      uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v91 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v52 != v19) {
              objc_enumerationMutation(v16);
            }
            long long v21 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            long long v22 = [v21 objectID];
            long long v23 = [v7 objectID];
            char v24 = [v22 isEqual:v23];

            if ((v24 & 1) == 0 && ([v21 isDeleted] & 1) == 0)
            {
              long long v25 = [v21 fingerprint];
              long long v26 = [v7 fingerprint];
              int IsEqual = PLObjectIsEqual();

              if (IsEqual)
              {
                long long v28 = [v21 dataStoreKey];
                long long v29 = [v7 dataStoreKey];
                int v30 = PLObjectIsEqual();

                if (v30)
                {
                  if (PLResourceIdentityIsEqual(v21, v7))
                  {
                    long long v31 = PLMigrationGetLog();
                    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);

                    long long v33 = v50;
                    if (v32)
                    {
                      long long v34 = [(id)v50[4] logger];

                      if (v34)
                      {
                        long long v89 = 0u;
                        long long v90 = 0u;
                        long long v87 = 0u;
                        long long v88 = 0u;
                        long long v85 = 0u;
                        long long v86 = 0u;
                        long long v83 = 0u;
                        long long v84 = 0u;
                        long long v81 = 0u;
                        long long v82 = 0u;
                        long long v79 = 0u;
                        long long v80 = 0u;
                        long long v77 = 0u;
                        long long v78 = 0u;
                        long long v75 = 0u;
                        long long v76 = 0u;
                        long long v73 = 0u;
                        long long v74 = 0u;
                        long long v71 = 0u;
                        long long v72 = 0u;
                        long long v69 = 0u;
                        long long v70 = 0u;
                        long long v67 = 0u;
                        long long v68 = 0u;
                        long long v65 = 0u;
                        long long v66 = 0u;
                        long long v63 = 0u;
                        long long v64 = 0u;
                        long long v61 = 0u;
                        long long v62 = 0u;
                        memset(buf, 0, sizeof(buf));
                        long long v35 = PLMigrationGetLog();
                        os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
                        long long v36 = [v7 objectID];
                        long long v37 = [v21 objectID];
                        int v56 = 138543618;
                        v57 = v36;
                        __int16 v58 = 2114;
                        v59 = v37;
                        LODWORD(v46) = 22;
                        long long v38 = (uint8_t *)_os_log_send_and_compose_impl();

                        long long v39 = objc_msgSend((id)v50[4], "logger", &v56, v46);
                        objc_msgSend(v39, "logWithMessage:fromCodeLocation:type:", v38, "PLModelMigrationActionBackground.m", 945, 0);

                        long long v33 = v50;
                        if (v38 != buf) {
                          free(v38);
                        }
                      }
                      else
                      {
                        long long v40 = PLMigrationGetLog();
                        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                        {
                          long long v41 = [v7 objectID];
                          long long v42 = [v21 objectID];
                          *(_DWORD *)buf = 138543618;
                          *(void *)&uint8_t buf[4] = v41;
                          *(_WORD *)&buf[12] = 2114;
                          *(void *)&buf[14] = v42;
                          _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEFAULT, "Deleting resource: %{public}@ as it duplicates another resource with an optimized version of the same UTI (%{public}@)", buf, 0x16u);
                        }
                        long long v33 = v50;
                      }
                    }
                    [v49 deleteObject:v7];
                    ++*(void *)(*(void *)(v33[7] + 8) + 24);
                    long long v43 = [v7 asset];
                    BOOL v44 = PLCanIncludeResourceInHints(v7, v43);

                    if (v44)
                    {
                      long long v45 = [v7 asset];
                      [v45 recalculateImageRequestHints];
                    }
                  }
                }
              }
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v51 objects:v91 count:16];
        }
        while (v18);
      }

      int v12 = v47;
      uint64_t v8 = v48;
    }
    objc_msgSend(*(id *)(*(void *)(v50[8] + 8) + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(v50[8] + 8) + 40), "completedUnitCount") + 1);
  }
}

id __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke_3(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = [v6 firstObject];
  uint64_t v8 = [v7 objectID];

  uint64_t v9 = (void *)a1[4];
  uint64_t v10 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v10 + 40);
  int v11 = [v9 isCancelledWithResumeMarker:v8 error:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    *(void *)(*(void *)(a1[7] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    int v12 = objc_msgSend(v6, "_pl_map:", &__block_literal_global_368);
    uint64_t v13 = a1[5];
    uint64_t v14 = *(void *)(a1[6] + 8);
    id v17 = *(id *)(v14 + 40);
    BOOL v15 = +[PLSocialGroupAssetContainment updateAndSaveAssetPersonEdgesForAssetsWithIDs:v12 inContext:v13 error:&v17];
    objc_storeStrong((id *)(v14 + 40), v17);
    if (!v15) {
      *a4 = 1;
    }
    long long v16 = *(void **)(*(void *)(a1[8] + 8) + 40);
    objc_msgSend(v16, "setCompletedUnitCount:", objc_msgSend(v16, "completedUnitCount") + objc_msgSend(v6, "count"));
  }
}

void __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke_372(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v25 = 0;
  BOOL v3 = +[PLSocialGroup runAssetContainmentOnAllSocialGroupsInContext:v2 error:&v25];
  id v4 = v25;

  int v5 = PLMigrationGetLog();
  id v6 = v5;
  if (v3)
  {
    BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (!v7) {
      goto LABEL_16;
    }
    uint64_t v8 = [*(id *)(a1 + 40) logger];

    if (v8)
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v35 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      *(_OWORD *)buf = 0u;
      uint64_t v9 = PLMigrationGetLog();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      LOWORD(v26) = 0;
      LODWORD(v24) = 2;
      uint64_t v10 = (uint8_t *)_os_log_send_and_compose_impl();

      int v11 = objc_msgSend(*(id *)(a1 + 40), "logger", &v26, v24);
      int v12 = v11;
      uint64_t v13 = v10;
      uint64_t v14 = 1027;
      uint64_t v15 = 0;
      goto LABEL_8;
    }
    uint64_t v19 = PLMigrationGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v20 = "Successfully ran asset containment on all groups in library";
      long long v21 = v19;
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      uint32_t v23 = 2;
LABEL_14:
      _os_log_impl(&dword_19B3C7000, v21, v22, v20, buf, v23);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  BOOL v16 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

  if (!v16) {
    goto LABEL_16;
  }
  id v17 = [*(id *)(a1 + 40) logger];

  if (!v17)
  {
    uint64_t v19 = PLMigrationGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      long long v20 = "Failed to update containment for all groups with error: %@";
      long long v21 = v19;
      os_log_type_t v22 = OS_LOG_TYPE_ERROR;
      uint32_t v23 = 12;
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  *(_OWORD *)buf = 0u;
  uint64_t v18 = PLMigrationGetLog();
  os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
  int v26 = 138412290;
  id v27 = v4;
  LODWORD(v24) = 12;
  uint64_t v10 = (uint8_t *)_os_log_send_and_compose_impl();

  int v11 = objc_msgSend(*(id *)(a1 + 40), "logger", &v26, v24);
  int v12 = v11;
  uint64_t v13 = v10;
  uint64_t v14 = 1025;
  uint64_t v15 = 16;
LABEL_8:
  objc_msgSend(v11, "logWithMessage:fromCodeLocation:type:", v13, "PLModelMigrationActionBackground.m", v14, v15);

  if (v10 != buf) {
    free(v10);
  }
LABEL_16:
}

uint64_t __91__PLModelMigrationAction_DrawAssetPersonEdges_performActionWithManagedObjectContext_error___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

id __98__PLModelMigrationAction_UpdateAssetAdjustmentsState_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __98__PLModelMigrationAction_UpdateAssetAdjustmentsState_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __98__PLModelMigrationAction_UpdateAssetAdjustmentsState_performActionWithManagedObjectContext_error___block_invoke_3(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  BOOL v7 = (void *)a1[4];
  uint64_t v8 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v7 isCancelledWithResumeMarker:0 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    [v6 updateAssetAdjustmentsStateIfNeededFromAdjustmentFile];
    ++*(void *)(*(void *)(a1[7] + 8) + 24);
    uint64_t v10 = *(void **)(*(void *)(a1[8] + 8) + 40);
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);
  }
}

void __93__PLModelMigrationAction_UpdateAssetAdjustmentsState_isResetAfterRebuildRequiredWithLibrary___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = +[PLManagedAsset entityName];
  uint64_t v4 = [v2 fetchRequestWithEntityName:v3];

  int v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"adjustmentsState", 1);
  [v4 setPredicate:v5];

  [v4 setFetchLimit:1];
  [v4 setResultType:4];
  id v6 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v6 countForFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v9 = PLMigrationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Failed to get count of Asset.adjustmentsState. Error: %@", buf, 0xCu);
    }
  }
}

id __101__PLModelMigrationAction_setInitialIsRecentlySavedValue_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __101__PLModelMigrationAction_setInitialIsRecentlySavedValue_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __101__PLModelMigrationAction_setInitialIsRecentlySavedValue_performActionWithManagedObjectContext_error___block_invoke_3(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  uint64_t v7 = [v6 objectID];
  uint64_t v8 = (void *)a1[4];
  uint64_t v9 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v9 + 40);
  int v10 = [v8 isCancelledWithResumeMarker:v7 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    [v6 recalculateIsRecentlySaved];
    ++*(void *)(*(void *)(a1[7] + 8) + 24);
    int v11 = *(void **)(*(void *)(a1[8] + 8) + 40);
    objc_msgSend(v11, "setCompletedUnitCount:", objc_msgSend(v11, "completedUnitCount") + 1);
  }
}

id __122__PLModelMigrationAction_setInitialhasPeopleSceneMidOrGreaterConfidenceValue_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __122__PLModelMigrationAction_setInitialhasPeopleSceneMidOrGreaterConfidenceValue_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __122__PLModelMigrationAction_setInitialhasPeopleSceneMidOrGreaterConfidenceValue_performActionWithManagedObjectContext_error___block_invoke_3(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  uint64_t v7 = [v6 objectID];
  uint64_t v8 = (void *)a1[4];
  uint64_t v9 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v9 + 40);
  int v10 = [v8 isCancelledWithResumeMarker:v7 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    [v6 recalculatehasPeopleSceneMidOrGreaterConfidence];
    ++*(void *)(*(void *)(a1[7] + 8) + 24);
    int v11 = *(void **)(*(void *)(a1[8] + 8) + 40);
    objc_msgSend(v11, "setCompletedUnitCount:", objc_msgSend(v11, "completedUnitCount") + 1);
  }
}

void __104__PLModelMigrationAction_AddMissingExtendedAttributes_2024_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 metadataFromMediaPropertiesOrOriginalResource];
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = 0;
  BOOL v6 = +[PLModelMigrationActionUtility processExtendedAttributesWithAction:v5 asset:v3 metadata:v4 error:&v8];
  id v7 = v8;
  if (v6)
  {
    [*(id *)(a1 + 32) updateSleetPropertiesForAsset:v3 metadata:v4];
    [*(id *)(a1 + 32) updateSpatialPropertiesForAsset:v3 metadata:v4];
  }
}

void __102__PLModelMigrationAction_AddMissingAdjustedMediaMetadata_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 additionalAttributes];
  v2 = [v3 mediaMetadata];

  if (!v2) {
    [v3 setMediaMetadataData:0];
  }
}

uint64_t __113__PLModelMigrationAction_RemoveOrphanGeneratedAssetDescriptionNodes_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  BOOL v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = +[PLGraphEdge entityName];
  id v8 = [v6 fetchRequestWithEntityName:v7];

  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"targetNode", v5];
  [v8 setPredicate:v9];

  v41[0] = @"targetNode";
  int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  [v8 setRelationshipKeyPathsForPrefetching:v10];

  int v11 = [*(id *)(a1 + 32) executeFetchRequest:v8 error:a3];
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __113__PLModelMigrationAction_RemoveOrphanGeneratedAssetDescriptionNodes_performActionWithManagedObjectContext_error___block_invoke_462;
    v34[3] = &unk_1E5862390;
    id v35 = v12;
    id v13 = v12;
    [v11 enumerateObjectsUsingBlock:v34];
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v5];
    [v14 minusSet:v13];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __113__PLModelMigrationAction_RemoveOrphanGeneratedAssetDescriptionNodes_performActionWithManagedObjectContext_error___block_invoke_2;
    v31[3] = &unk_1E58623B8;
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 56);
    id v32 = v15;
    uint64_t v33 = v16;
    [v14 enumerateObjectsUsingBlock:v31];

    uint64_t v17 = 1;
  }
  else
  {
    uint64_t v18 = PLMigrationGetLog();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      long long v20 = [*(id *)(a1 + 40) logger];

      if (v20)
      {
        memset(buf, 0, sizeof(buf));
        long long v21 = PLMigrationGetLog();
        os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
        uint64_t v22 = *(void *)(a1 + 48);
        uint64_t v23 = *a3;
        int v36 = 138543618;
        uint64_t v37 = v22;
        __int16 v38 = 2112;
        uint64_t v39 = v23;
        LODWORD(v30) = 22;
        uint64_t v24 = (_OWORD *)_os_log_send_and_compose_impl();

        id v25 = objc_msgSend(*(id *)(a1 + 40), "logger", &v36, v30);
        objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActionBackground.m", 1429, 16);

        if (v24 != buf) {
          free(v24);
        }
      }
      else
      {
        int v26 = PLMigrationGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = *(void *)(a1 + 48);
          uint64_t v28 = *a3;
          LODWORD(buf[0]) = 138543618;
          *(void *)((char *)buf + 4) = v27;
          WORD6(buf[0]) = 2112;
          *(void *)((char *)buf + 14) = v28;
          _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Failed to fetch edges for %{public}@. Error: %@", (uint8_t *)buf, 0x16u);
        }
      }
    }
    uint64_t v17 = 3;
  }

  return v17;
}

void __113__PLModelMigrationAction_RemoveOrphanGeneratedAssetDescriptionNodes_performActionWithManagedObjectContext_error___block_invoke_462(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 targetNode];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v6 targetNode];
    [v4 addObject:v5];
  }
}

uint64_t __113__PLModelMigrationAction_RemoveOrphanGeneratedAssetDescriptionNodes_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) deleteObject:a2];
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __99__PLModelMigrationAction_UpdateDayHighlightDateTitles_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PLPhotosHighlightGenerator updateTitlesForHighlight:a2 dateRangeTitleGenerator:*(void *)(a1 + 32) options:0];
}

void __99__PLModelMigrationAction_SetPrivacyStateOnSmartAlbums_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 userQueryData];
  id v8 = +[PLQueryHandler constructQueryFromData:v7];

  if (+[PLQueryHandler includesHiddenAssetsInQuery:v8]) {
    [v6 setPrivacyState:1];
  }
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v10 + 40);
  int v11 = [v9 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __122__PLModelMigrationAction_RemovePeopleMergeCandidatesForConfidenceComputation_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  uint64_t v33 = [v4 personUUID];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v30 = v4;
  id v5 = [v4 mergeCandidates];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v32 = 0;
    uint64_t v9 = *(void *)v36;
    long long v31 = v6;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x19F38D3B0]();
        if (![v11 verifiedType])
        {
          id v13 = [v11 mergeCandidates];
          if ([v13 count] == 1)
          {
            uint64_t v14 = [v11 mergeCandidates];
            id v15 = [v14 anyObject];
            uint64_t v16 = [v15 personUUID];
            int v17 = [v33 isEqualToString:v16];

            if (v17)
            {
              uint64_t v18 = PLMigrationGetLog();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                BOOL v19 = [v11 personUUID];
                *(_DWORD *)buf = 138543618;
                long long v40 = v33;
                __int16 v41 = 2114;
                long long v42 = v19;
                _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Removing merge candidate relationship between %{public}@ and %{public}@", buf, 0x16u);
              }
              long long v20 = v32;
              if (!v32)
              {
                long long v20 = [v30 mutableMergeCandidates];
                ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
              }
              id v32 = v20;
              [v20 removeObject:v11];
              long long v21 = [v11 associatedFaceGroup];
              [v21 setPersonBuilderState:1];

              uint64_t v22 = [v11 mergeCandidatesWithConfidence];
              uint64_t v23 = [v22 count];

              if (v23)
              {
                uint64_t v24 = [v11 mutableMergeCandidatesWithConfidence];
                [v24 removeAllObjects];

                [v11 setMergeCandidateConfidence:0.0];
              }
            }
            id v6 = v31;
          }
          else
          {
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v8);
  }
  else
  {
    id v32 = 0;
  }

  id v25 = *(void **)(a1 + 32);
  uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v26 + 40);
  int v27 = [v25 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v26 + 40), obj);
  if (v27)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

uint64_t __113__PLModelMigrationAction_ResetSharedLibrarySharingSuggestionsAssets_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  PLLibraryScopeAssetRemoveSuggestedByClientType(a2);
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v7 + 40);
  int v8 = [v6 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  return objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __134__PLModelMigrationAction_UpdateDuplicateAssetVisibilityStateMostRelevant_updateKeyAssetVisibilityStateWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 assets];
  uint64_t v7 = [v6 firstObject];

  if ([v7 duplicateAssetVisibilityState] == 1) {
    [v7 setDuplicateAssetVisibilityState:2];
  }
  int v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v9 + 40);
  int v10 = [v8 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

uint64_t __155__PLModelMigrationAction_PopulateInitialSharedAssetCollectionStats__recalculateSharedAssetContainerValuesForEntityNamed_propertiesToFetch_inContext_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 recalculateSharedAssetContainerCachedValues];
}

void __120__PLModelMigrationAction_RepairUnknownAssetTypeAndUnsupportedPlaybackStyle_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 kind] == 3)
  {
    uint64_t v7 = [v6 originalUniformTypeIdentifier];
    uint64_t v8 = +[PLManagedAsset assetTypeFromUniformTypeIdentifier:v7];

    if (v8 == 3)
    {
      uint64_t v9 = a1 + 56;
    }
    else
    {
      [v6 setKind:v8];
      uint64_t v9 = a1 + 48;
    }
    ++*(void *)(*(void *)(*(void *)v9 + 8) + 24);
  }
  if ([v6 kind] != 3 && !objc_msgSend(v6, "playbackStyle"))
  {
    objc_msgSend(v6, "setPlaybackStyle:", +[PLManagedAsset defaultPlaybackStyleFromAssetType:subtype:playbackVariation:](PLManagedAsset, "defaultPlaybackStyleFromAssetType:subtype:playbackVariation:", objc_msgSend(v6, "kind"), objc_msgSend(v6, "kindSubtype"), objc_msgSend(v6, "playbackVariation")));
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  int v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v11 + 40);
  int v12 = [v10 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
  {
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __90__PLModelMigrationAction_DeleteOrphanedFaces_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v7 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    [*(id *)(a1 + 40) deleteObject:v6];
  }
  objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);
}

void __114__PLModelMigrationAction_FixUnpushedVideoComplementResourcesAfterFDR_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 masterResourceForCPLType:1];
  uint64_t v8 = [v6 masterResourceForCPLType:18];
  int v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v10 = [v8 cplFileURL];
  uint64_t v11 = [v10 path];
  int v12 = [v9 fileExistsAtPath:v11];

  id v13 = [v6 master];
  if ([v13 cloudLocalState] == 3)
  {
    if ([v7 cloudLocalState] == 3)
    {
      if ([v8 cloudLocalState] != 1) {
        int v12 = 0;
      }

      if (v12 != 1) {
        goto LABEL_15;
      }
LABEL_12:
      [v6 setCloudLocalState:0];
      id v15 = [v6 master];
      [v15 setCloudLocalState:0];

      [v8 setCloudLocalState:0];
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      goto LABEL_15;
    }
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v14 = [v6 master];
  if ([v14 cloudLocalState] != 1 || objc_msgSend(v7, "cloudLocalState") != 3)
  {

    goto LABEL_14;
  }
  if ([v8 cloudLocalState] != 1) {
    LOBYTE(v12) = 0;
  }

  if (v12) {
    goto LABEL_12;
  }
LABEL_15:
  uint64_t v16 = *(void **)(a1 + 32);
  uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v17 + 40);
  int v18 = [v16 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v17 + 40), obj);
  if (v18)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __129__PLModelMigrationAction_MigrateSuggestedByClientTypeCameraSmartSharing_performActionWithManagedObjectContext_error_shouldForce___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (([v6 libraryScopeShareState] & 0x18) == 8)
  {
    PLLibraryScopeAssetRemoveSuggestedByClientType(v6);
    id v7 = v6;
    objc_msgSend(v7, "setLibraryScopeShareState:", objc_msgSend(v7, "libraryScopeShareState") | 4);

    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v9 + 40);
  int v10 = [v8 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  if (v10)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __94__PLModelMigrationAction_UnTrashSharedDuplicates_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 master];
  uint64_t v8 = [v7 objectIDsForRelationshipNamed:@"assets"];
  unint64_t v9 = [v8 count];

  if (v9 >= 2)
  {
    [v6 unTrash];
    if ([v6 cloudLocalState] == 4)
    {
      [v6 setUploadAttempts:0];
      [v6 setLastUploadAttemptDate:0];
    }
    [v6 setCloudLocalState:0];
    [v6 persistMetadataToFilesystem];
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  int v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v11 + 40);
  int v12 = [v10 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __115__PLModelMigrationAction_UpdateDuplicateProcessingState_processAssetStateMap_pendingParentUnitCount_context_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 additionalAttributes];
  __int16 v8 = [v7 duplicateDetectorPerceptualProcessingState];

  unsigned __int16 v9 = [*(id *)(a1 + 32) shortValue] | v8;
  int v10 = [v6 additionalAttributes];
  [v10 setDuplicateDetectorPerceptualProcessingState:v9];

  uint64_t v11 = [v6 additionalAttributes];
  int v12 = [v11 containsDuplicateDetectorPerceptualProcessingState:16];

  if (v12)
  {
    id v13 = *(void **)(a1 + 40);
    uint64_t v14 = [v6 objectID];
    [v13 addObject:v14];
  }
  id v15 = [v6 additionalAttributes];
  int v16 = [v15 containsDuplicateDetectorPerceptualProcessingState:64];

  if (v16)
  {
    uint64_t v17 = *(void **)(a1 + 40);
    int v18 = [v6 objectID];
    [v17 addObject:v18];
  }
  BOOL v19 = *(void **)(a1 + 48);
  uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v20 + 40);
  int v21 = [v19 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v20 + 40), obj);
  if (v21)
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "completedUnitCount") + 1);
}

id __101__PLModelMigrationAction_GenerateMemoryStartAndEndDates_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __101__PLModelMigrationAction_GenerateMemoryStartAndEndDates_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __101__PLModelMigrationAction_GenerateMemoryStartAndEndDates_performActionWithManagedObjectContext_error___block_invoke_3(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = (void *)a1[4];
  uint64_t v8 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v7 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    [v6 recalculateStartAndEndDates];
    ++*(void *)(*(void *)(a1[7] + 8) + 24);
    int v10 = *(void **)(*(void *)(a1[8] + 8) + 40);
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);
  }
}

id __115__PLModelMigrationAction_moveLocalVersionTokenFromPlistToGlobalValues_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 32);
  id v16 = 0;
  id v5 = [v2 unarchivedObjectOfClass:v3 fromData:v4 error:&v16];
  id v6 = v16;
  if (!v5)
  {
    id v7 = PLMigrationGetLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      int v9 = [*(id *)(a1 + 40) logger];

      if (v9)
      {
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
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v26 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        *(_OWORD *)buf = 0u;
        int v10 = PLMigrationGetLog();
        os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
        int v17 = 138412290;
        id v18 = v6;
        LODWORD(v15) = 12;
        uint64_t v11 = (uint8_t *)_os_log_send_and_compose_impl();

        int v12 = objc_msgSend(*(id *)(a1 + 40), "logger", &v17, v15);
        objc_msgSend(v12, "logWithMessage:fromCodeLocation:type:", v11, "PLModelMigrationActions_18000.m", 273, 16);

        if (v11 != buf) {
          free(v11);
        }
      }
      else
      {
        id v13 = PLMigrationGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v6;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Unable to unarchive token data: %@", buf, 0xCu);
        }
      }
    }
  }

  return v5;
}

id __96__PLModelMigrationAction_RenameGraphNodeValueNames_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __96__PLModelMigrationAction_RenameGraphNodeValueNames_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 count];
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 setTotalUnitCount:v3];
}

void __96__PLModelMigrationAction_RenameGraphNodeValueNames_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    id v6 = [v8 valueName];
    if (v6)
    {
      id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
      if (v7) {
        [v8 setValueName:v7];
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  }
}

id __115__PLModelMigrationAction_MigrateMemoryPendingStateStoryToCreationType_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __115__PLModelMigrationAction_MigrateMemoryPendingStateStoryToCreationType_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __115__PLModelMigrationAction_MigrateMemoryPendingStateStoryToCreationType_performActionWithManagedObjectContext_error___block_invoke_3(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = (void *)a1[4];
  uint64_t v8 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v7 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    [v6 setPendingState:0];
    [v6 setCreationType:1];
    ++*(void *)(*(void *)(a1[7] + 8) + 24);
    int v10 = *(void **)(*(void *)(a1[8] + 8) + 40);
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);
  }
}

id __96__PLModelMigrationAction_RemoveRejectedMemberLabel_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __96__PLModelMigrationAction_RemoveRejectedMemberLabel_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __96__PLModelMigrationAction_RemoveRejectedMemberLabel_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v7 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    [v6 setEdges:0];
    [*(id *)(a1 + 40) deleteObject:v6];
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    int v10 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);
  }
}

id __106__PLModelMigrationAction_UpdatePlaybackControlBadgeAttribute_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __106__PLModelMigrationAction_UpdatePlaybackControlBadgeAttribute_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __106__PLModelMigrationAction_UpdatePlaybackControlBadgeAttribute_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  int v4 = [v6 packedBadgeAttributes];
  if (v4 != (v4 | 0x20)) {
    objc_msgSend(v6, "setPackedBadgeAttributes:");
  }
  id v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  objc_msgSend(v5, "setCompletedUnitCount:", objc_msgSend(v5, "completedUnitCount") + 1);
}

id __98__PLModelMigrationAction_RemoveLabelsFromSyndication_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __98__PLModelMigrationAction_RemoveLabelsFromSyndication_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __98__PLModelMigrationAction_RemoveLabelsFromSyndication_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v7 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    [v6 setEdges:0];
    [*(id *)(a1 + 40) deleteObject:v6];
    int v10 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);
  }
}

id __117__PLModelMigrationAction_DeletePLGeneratedAssetDescriptionNodesAndLabel_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __117__PLModelMigrationAction_DeletePLGeneratedAssetDescriptionNodesAndLabel_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __117__PLModelMigrationAction_DeletePLGeneratedAssetDescriptionNodesAndLabel_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v7 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    [*(id *)(a1 + 40) deleteObject:v6];
  }
}

id __105__PLModelMigrationAction_FixSignExtended32bSceneIdentifiers_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __105__PLModelMigrationAction_FixSignExtended32bSceneIdentifiers_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __105__PLModelMigrationAction_FixSignExtended32bSceneIdentifiers_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((unint64_t)[v5 sceneIdentifier] >> 32) {
    objc_msgSend(v5, "setSceneIdentifier:", objc_msgSend(v5, "sceneIdentifier"));
  }
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  objc_msgSend(v4, "setCompletedUnitCount:", objc_msgSend(v4, "completedUnitCount") + 1);
}

id __107__PLModelMigrationAction_ReKeyResourcesIncorrectlyStoredAsM4A_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __107__PLModelMigrationAction_ReKeyResourcesIncorrectlyStoredAsM4A_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __107__PLModelMigrationAction_ReKeyResourcesIncorrectlyStoredAsM4A_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v7 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    int v10 = [v6 dataStoreKeyData];
    buf[0] = 0;
    [v10 getBytes:buf length:1];
    if (buf[0] >= 0x10u) {
      int v11 = 16;
    }
    else {
      int v11 = buf[0];
    }

    if (v11 == 3)
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1CA58]);
      id v13 = [v6 dataStoreKeyData];
      uint64_t v14 = (void *)[v12 initWithData:v13];

      id v15 = v14;
      id v16 = (unsigned int *)[v15 mutableBytes];
      unint64_t v17 = *v16 | ((unint64_t)*((unsigned __int16 *)v16 + 2) << 32);
      if ((v17 & 0x7F8000000000) == 0xE0000000000)
      {
        unint64_t v18 = v17 & 0xFFFF807FFFFFFFFFLL;
        *id v16 = v18;
        *((_WORD *)v16 + 2) = (v18 | 0xC0000000000) >> 32;
        [v6 setDataStoreKeyData:v15];
        BOOL v19 = PLMigrationGetLog();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

        if (v20)
        {
          long long v21 = [*(id *)(a1 + 32) logger];

          if (v21)
          {
            long long v70 = 0u;
            long long v71 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v64 = 0u;
            long long v65 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            memset(buf, 0, sizeof(buf));
            long long v22 = PLMigrationGetLog();
            os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
            long long v23 = [v6 objectID];
            long long v24 = [v6 dataStoreKey];
            long long v25 = [v6 assetID];
            long long v26 = [v24 fileURLForAssetID:v25];
            int v37 = 138412546;
            long long v38 = v23;
            __int16 v39 = 2112;
            long long v40 = v26;
            LODWORD(v35) = 22;
            long long v27 = (uint8_t *)_os_log_send_and_compose_impl();

            long long v28 = objc_msgSend(*(id *)(a1 + 32), "logger", &v37, v35);
            objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActions_18000.m", 711, 0);

            if (v27 != buf) {
              free(v27);
            }
          }
          else
          {
            long long v29 = PLMigrationGetLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              long long v30 = [v6 objectID];
              long long v31 = [v6 dataStoreKey];
              long long v32 = [v6 assetID];
              long long v33 = [v31 fileURLForAssetID:v32];
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v30;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v33;
              _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEFAULT, "Patched dataStoreKeyData for resource with ID: %@, now points to: %@", buf, 0x16u);
            }
          }
        }
        long long v34 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        objc_msgSend(v34, "setCompletedUnitCount:", objc_msgSend(v34, "completedUnitCount") + 1);
      }
    }
  }
}

id __97__PLModelMigrationAction_DeleteDanglingPLGraphEdges_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __97__PLModelMigrationAction_DeleteDanglingPLGraphEdges_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __97__PLModelMigrationAction_DeleteDanglingPLGraphEdges_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "deleteObject:");
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v4 = [v3 completedUnitCount] + 1;
  return [v3 setCompletedUnitCount:v4];
}

id __99__PLModelMigrationAction_RemoveUnverifiedSocialGroups_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __99__PLModelMigrationAction_RemoveUnverifiedSocialGroups_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __99__PLModelMigrationAction_RemoveUnverifiedSocialGroups_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v7 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    id v10 = +[PLGraphNodeContainer newNodeContainerWithNode:v6];
    if (![v10 socialGroupVerifiedType]) {
      [*(id *)(a1 + 40) deleteObject:v6];
    }
    int v11 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    objc_msgSend(v11, "setCompletedUnitCount:", objc_msgSend(v11, "completedUnitCount") + 1);
  }
}

id __107__PLModelMigrationAction_PopulateCloudFeedEntryIsMine__migrateEntriesWithFetchRequest_moc_progress_result___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __107__PLModelMigrationAction_PopulateCloudFeedEntryIsMine__migrateEntriesWithFetchRequest_moc_progress_result___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 recalcIsMine];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 completedUnitCount] + 1;
  return [v4 setCompletedUnitCount:v5];
}

id __88__PLModelMigrationAction_PopulateKeyAssets_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __88__PLModelMigrationAction_PopulateKeyAssets_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __88__PLModelMigrationAction_PopulateKeyAssets_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v7 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    [*(id *)(a1 + 40) refreshObject:v6 mergeChanges:1];
    [v6 updateKeyAssetsIfNeeded];
    id v10 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);
  }
}

id __110__PLModelMigrationAction_ReevaluateAllowedForAnalysisForGPAssets_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __110__PLModelMigrationAction_ReevaluateAllowedForAnalysisForGPAssets_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __110__PLModelMigrationAction_ReevaluateAllowedForAnalysisForGPAssets_performActionWithManagedObjectContext_error___block_invoke_3(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = (void *)a1[4];
  uint64_t v8 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v7 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    id v10 = [v6 asset];
    int v11 = [v10 additionalAttributes];
    [v11 updateAllowedForAnalysis];

    id v12 = *(void **)(*(void *)(a1[7] + 8) + 40);
    objc_msgSend(v12, "setCompletedUnitCount:", objc_msgSend(v12, "completedUnitCount") + 1);
  }
}

id __106__PLModelMigrationAction_FixComputeSyncResourceFileExtension_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __106__PLModelMigrationAction_FixComputeSyncResourceFileExtension_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __106__PLModelMigrationAction_FixComputeSyncResourceFileExtension_performActionWithManagedObjectContext_error___block_invoke_3(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = (void *)a1[4];
  uint64_t v8 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v7 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    id v10 = [v6 cloudLastOnDemandDownloadDate];

    int v11 = [v6 asset];
    id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v13 = [v6 fileURL];
    uint64_t v14 = [v13 path];
    int v15 = [v12 fileExistsAtPath:v14];

    if (v15)
    {
      id v16 = [v6 fileURL];
      unint64_t v17 = [v16 path];
      unint64_t v18 = [v11 pathForComputeSyncWrapperFile];
      [v12 moveItemAtPath:v17 toPath:v18 error:0];
    }
    [v11 updateComputeSyncResourceAfterDownloadWithResource:v6 onDemandDownload:v10 != 0];
    BOOL v19 = *(void **)(*(void *)(a1[7] + 8) + 40);
    objc_msgSend(v19, "setCompletedUnitCount:", objc_msgSend(v19, "completedUnitCount") + 1);
  }
}

id __100__PLModelMigrationAction_UpdateTripHighlightDateTitles_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __100__PLModelMigrationAction_UpdateTripHighlightDateTitles_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __100__PLModelMigrationAction_UpdateTripHighlightDateTitles_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  +[PLPhotosHighlightGenerator updateTitlesForHighlight:a3 dateRangeTitleGenerator:*(void *)(a1 + 32) options:0];
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v5 = [v4 completedUnitCount] + 1;
  return [v4 setCompletedUnitCount:v5];
}

id __96__PLModelMigrationAction_DeleteInvalidSocialGroups_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __96__PLModelMigrationAction_DeleteInvalidSocialGroups_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __96__PLModelMigrationAction_DeleteInvalidSocialGroups_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v4 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSocialGroup, "newNodeContainerWithNode:");
  uint64_t v5 = [v4 members];
  unint64_t v6 = [v5 count];

  if (v6 <= 1)
  {
    [*(id *)(a1 + 32) deleteObject:v8];
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  id v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v7, "completedUnitCount") + 1);
}

id __99__PLModelMigrationAction_UpdateHighlightCollageAssets_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __99__PLModelMigrationAction_UpdateHighlightCollageAssets_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __99__PLModelMigrationAction_UpdateHighlightCollageAssets_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 recalculateCollageAssets];
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v5 = [v4 completedUnitCount] + 1;
  return [v4 setCompletedUnitCount:v5];
}

id __98__PLModelMigrationAction_FixBlankPhotosFromVideoMode_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __98__PLModelMigrationAction_FixBlankPhotosFromVideoMode_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __98__PLModelMigrationAction_FixBlankPhotosFromVideoMode_performActionWithManagedObjectContext_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 modernResources];
  uint64_t v8 = [v7 count];

  if (v8 != 2) {
    goto LABEL_19;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  int v9 = [v6 modernResources];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v10)
  {

LABEL_19:
    id v13 = 0;
    goto LABEL_24;
  }
  uint64_t v11 = v10;
  uint64_t v25 = a1;
  long long v26 = v6;
  id v27 = v5;
  unsigned __int8 v12 = 0;
  id v13 = 0;
  uint64_t v14 = *(void *)v30;
  long long v28 = (void *)*MEMORY[0x1E4F44410];
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v30 != v14) {
        objc_enumerationMutation(v9);
      }
      id v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      if (objc_msgSend(v16, "recipeID", v25) == 65938)
      {
        id v17 = v16;

        id v13 = v17;
      }
      else
      {
        unint64_t v18 = v9;
        BOOL v19 = [v16 uniformTypeIdentifier];
        BOOL v20 = [v19 identifier];
        long long v21 = [v28 identifier];
        if (v20 == v21)
        {
          long long v23 = [v16 fileURL];
          BOOL v22 = v23 != 0;
        }
        else
        {
          BOOL v22 = 0;
        }

        v12 |= v22;
        int v9 = v18;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
  }
  while (v11);

  if (v13)
  {
    long long v24 = [v13 dataStoreKeyData];
    id v6 = v26;
    if (v24)
    {
    }
    else if ((([v13 localAvailability] == -1) & v12) == 1)
    {
      [v26 setAdjustmentsState:0];
      [v13 deleteResource];
      objc_msgSend(*(id *)(*(void *)(*(void *)(v25 + 32) + 8) + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(v25 + 32) + 8) + 40), "completedUnitCount") + 1);
    }
    id v5 = v27;
  }
  else
  {
    id v6 = v26;
    id v5 = v27;
  }
LABEL_24:
}

void __124__PLModelMigrationAction_ReprocessInvalidDuplicateHashes_removeDuplicateHashesAndResetAlbumsWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 additionalAttributes];
  uint64_t v4 = [v3 sceneprint];

  id v5 = *(void **)(a1 + 32);
  id v6 = [v4 duplicateMatchingData];
  if ([v5 containsObject:v6])
  {
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v4 duplicateMatchingAlternateData];
    LODWORD(v7) = [v7 containsObject:v8];

    if (!v7) {
      goto LABEL_5;
    }
  }
  [v10 removeFromDuplicateAlbum];
  PLResetMediaProcessingStateOnAsset(2, v10, 1);
  int v9 = [v10 additionalAttributes];
  [v9 setDuplicateMatchingData:0 duplicateMatchingAlternateData:0 processingSucceeded:1];

LABEL_5:
}

void __114__PLModelMigrationAction_ResetCustomSocialGroupDataForRejectedGroups_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = +[PLGraphNodeContainer newNodeContainerWithNode:a2];
  if ([v3 socialGroupVerifiedType] == -1)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id obj = *(id *)(v4 + 40);
    char v5 = [v3 resetCustomDataWithError:&obj];
    objc_storeStrong((id *)(v4 + 40), obj);
    if ((v5 & 1) == 0)
    {
      id v6 = PLMigrationGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = [v3 uuid];
        uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        uint64_t v11 = v7;
        __int16 v12 = 2112;
        uint64_t v13 = v8;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "PLModelMigrationAction_ResetCustomSocialGroupDataForRejectedGroups: error removing custom data for socialGroup with UUID: %@. Error: %@", buf, 0x16u);
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
  }
}

uint64_t __104__PLModelMigrationAction_UpdateEditSuggestionImageRecipeID_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 setRecipeID:66137];
  ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __103__PLModelMigrationAction_updateBrokenStyleableFromRebuild_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 metadataFromMediaPropertiesOrOriginalResource];
  uint64_t v4 = v3;
  if (v3)
  {
    char v5 = [v3 smartStyleIsReversible];
    int v6 = [v5 BOOLValue];

    if (v6)
    {
      id v7 = [v8 additionalAttributes];
      [v7 setSleetIsReversible:1];

      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
    }
  }
}

id __104__PLModelMigrationAction_FixAssetsWithMissingSaliencyRects_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __104__PLModelMigrationAction_FixAssetsWithMissingSaliencyRects_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __104__PLModelMigrationAction_FixAssetsWithMissingSaliencyRects_performActionWithManagedObjectContext_error___block_invoke_3(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = (void *)a1[4];
  uint64_t v8 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v7 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    id v10 = [v6 additionalAttributes];
    [v10 setSceneAnalysisVersion:0];

    uint64_t v11 = [v6 additionalAttributes];
    [v11 setSceneAnalysisTimestamp:0];

    ++*(void *)(*(void *)(a1[7] + 8) + 24);
    __int16 v12 = *(void **)(*(void *)(a1[8] + 8) + 40);
    objc_msgSend(v12, "setCompletedUnitCount:", objc_msgSend(v12, "completedUnitCount") + 1);
  }
}

id __106__PLModelMigrationAction_InstallComputeSyncResourcesIfNeeded_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __106__PLModelMigrationAction_InstallComputeSyncResourcesIfNeeded_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  char v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __106__PLModelMigrationAction_InstallComputeSyncResourcesIfNeeded_performActionWithManagedObjectContext_error___block_invoke_3(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  id v7 = (void *)a1[4];
  uint64_t v8 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v7 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    id v10 = [v6 asset];
    if ([v10 installSparseFullStageComputeSyncResourceIfNeeded]) {
      ++*(void *)(*(void *)(a1[7] + 8) + 24);
    }
    uint64_t v11 = *(void **)(*(void *)(a1[8] + 8) + 40);
    objc_msgSend(v11, "setCompletedUnitCount:", objc_msgSend(v11, "completedUnitCount") + 1);
  }
}

uint64_t __108__PLModelMigrationAction_MoveVersionsToMediaAnalysisAttributes_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processAsset:a2 withContext:*(void *)(a1 + 40)];
}

void __86__PLModelMigrationAction_ResetHighlights_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
}

void __100__PLModelMigrationAction_PromoteLeftoverDeferredAssets_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  [v6 setLocalAvailabilityTarget:1];
  [v6 setLocalAvailability:0xFFFFFFFFLL];
  id v7 = [v6 photoLibrary];

  uint64_t v8 = [v7 libraryServicesManager];
  int v9 = [v8 backgroundJobService];
  [v9 signalBackgroundProcessingNeededOnLibrary:v7];

  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v11 + 40);
  LODWORD(v9) = [v10 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

uint64_t __124__PLModelMigrationAction_FixResourcesIncorrectlyAssignedToSyndicationDataStore_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDataStoreClassID:2];
  [v3 setDataStoreSubtype:3];
  if ([v3 isLocallyAvailable]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  [v3 setLocalAvailability:v4];

  char v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v5 completedUnitCount] + 1;
  return [v5 setCompletedUnitCount:v6];
}

uint64_t __105__PLModelMigrationAction_MigrateProResPackedBadgeAttributes_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 setProResBadgeAttribute:1];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v7 + 40);
  int v8 = [v6 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  return objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __124__PLModelMigrationAction_RelocateBundleScopeData_updateResourceFilePathWithManagedObjectContext_bundleScope_progress_error___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  id v3 = [v18 dataStoreKey];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v5 = [*(id *)(a1 + 32) pathManager];
    uint64_t v6 = [v5 photoDirectoryWithType:*(unsigned __int8 *)(a1 + 56)];

    uint64_t v7 = [*(id *)(a1 + 32) legacyPrefixPathWithType:*(unsigned __int8 *)(a1 + 56)];
    int v8 = [v18 fileURL];
    int v9 = [v8 path];

    if ([v9 hasPrefix:v7])
    {
      id v10 = objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v7, "length"));
      uint64_t v11 = [v6 stringByAppendingPathComponent:v10];

      __int16 v12 = [PLPrimaryResourceDataStoreFilePathKey alloc];
      uint64_t v13 = [v18 asset];
      uint64_t v14 = [v13 assetID];
      int v15 = [v14 libraryID];
      id v16 = [(PLPrimaryResourceDataStoreFilePathKey *)v12 initWithFilePath:v11 andLibraryID:v15];

      id v17 = [(PLPrimaryResourceDataStoreFilePathKey *)v16 keyData];
      [v18 setDataStoreKeyData:v17];

      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

uint64_t __100__PLModelMigrationAction_SetDefaultFaceAnalysisVersion_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 additionalAttributes];
  [v6 setFaceAnalysisVersion:*(__int16 *)(a1 + 64)];

  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v7 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  return objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __125__PLModelMigrationAction_FixBackgroundResourceWorkerModifyingIncorrectResources_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 dataStoreKey];

  uint64_t v8 = v6;
  if (v7)
  {
    uint64_t v9 = 1;
  }
  else
  {
    if ([v6 dataStoreSubtype] == 1)
    {
      id v10 = [v6 asset];
      uint64_t v11 = [v10 pathForOriginalFile];
      [v6 markAsLocallyAvailableWithFilePath:v11];

      goto LABEL_7;
    }
    uint64_t v8 = v6;
    uint64_t v9 = 0xFFFFFFFFLL;
  }
  [v8 setLocalAvailability:v9];
LABEL_7:
  __int16 v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v13 + 40);
  int v14 = [v12 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v13 + 40), obj);
  if (v14)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __88__PLModelMigrationAction_ResetGraphPersons_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 resetAllFacesToDefault];
  if ([v5 isValidForPersistence])
  {
    id v3 = [v5 personUUID];
    uint64_t v4 = [*(id *)(a1 + 32) pathManager];
    +[PLPersistedPersonMetadata deleteMetadataFileForPersonUUID:v3 pathManager:v4];
  }
  [v5 deletePersonWithReason:2];
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __109__PLModelMigrationAction_FixPackedBadgeAttributesForRAWPlusJPEG_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 asset];
  [v3 recalculateRAWBadgeAttribute];
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
}

void __193__PLModelMigrationAction_DeletePetPersonsAndDetectedFaces_deleteManagedObjectsWithManagedObjectContext_entity_predicate_pendingParentUnitCount_deletedIdentifiers_entityIdentifierKeyPath_error___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = *(NSString **)(a1 + 32);
  if (v3)
  {
    NSSelectorFromString(v3);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = *(void **)(a1 + 40);
      id v5 = [v6 valueForKey:*(void *)(a1 + 32)];
      [v4 addObject:v5];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 deletePersonWithReason:8];
  }
  else {
    [*(id *)(a1 + 48) deleteObject:v6];
  }
  objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "completedUnitCount") + 1);
}

void __101__PLModelMigrationAction_PushAssetsWithPetSyncableFaces_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = [v6 assetForFace];
  uint64_t v8 = v7;
  if (v7)
  {
    if ([v7 cloudLocalState] == 4)
    {
      [v8 setUploadAttempts:0];
      [v8 setLastUploadAttemptDate:0];
    }
    [v8 setCloudLocalState:0];
    uint64_t v9 = PLMigrationGetLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      uint64_t v11 = [*(id *)(a1 + 32) logger];

      if (v11)
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        memset(buf, 0, sizeof(buf));
        __int16 v12 = PLMigrationGetLog();
        os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
        uint64_t v13 = [v8 scopedIdentifier];
        int v14 = [v6 uuid];
        int v25 = 138543618;
        long long v26 = v13;
        __int16 v27 = 2114;
        long long v28 = v14;
        LODWORD(v23) = 22;
        int v15 = (uint8_t *)_os_log_send_and_compose_impl();

        id v16 = objc_msgSend(*(id *)(a1 + 32), "logger", &v25, v23);
        objc_msgSend(v16, "logWithMessage:fromCodeLocation:type:", v15, "PLModelMigrationActions_17000.m", 336, 0);

        if (v15 != buf) {
          free(v15);
        }
      }
      else
      {
        id v17 = PLMigrationGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = [v8 scopedIdentifier];
          BOOL v19 = [v6 uuid];
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v18;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v19;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "[PushAssetsWithPetSyncableFaces] Setting asset %{public}@ to unpushed due to syncable pet face: %{public}@", buf, 0x16u);
        }
      }
    }
  }
  BOOL v20 = *(void **)(a1 + 32);
  uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v21 + 40);
  int v22 = [v20 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v21 + 40), obj);
  if (v22)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

id __106__PLModelMigrationAction_MergeDetectedFacesAndDetectedTorsos_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __106__PLModelMigrationAction_MergeDetectedFacesAndDetectedTorsos_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __106__PLModelMigrationAction_MergeDetectedFacesAndDetectedTorsos_performActionWithManagedObjectContext_error___block_invoke_3(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  uint64_t v7 = [v6 personForTorso];

  if (v7)
  {
    uint64_t v8 = [v6 personForTorso];
    [v6 setPersonForFace:v8];

    objc_msgSend(v6, "migration_setPersonForTorso:", 0);
  }
  uint64_t v9 = [v6 assetForTorso];

  if (v9)
  {
    BOOL v10 = [v6 assetForTorso];
    [v6 setAssetForFace:v10];

    objc_msgSend(v6, "migration_setAssetForTorso:", 0);
  }
  uint64_t v11 = (void *)a1[4];
  uint64_t v12 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v12 + 40);
  int v13 = [v11 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v12 + 40), obj);
  if (v13)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  int v14 = *(void **)(*(void *)(a1[7] + 8) + 40);
  objc_msgSend(v14, "setCompletedUnitCount:", objc_msgSend(v14, "completedUnitCount") + 1);
}

id __109__PLModelMigrationAction_CopyStickerConfidenceScoreToAssetTable_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __109__PLModelMigrationAction_CopyStickerConfidenceScoreToAssetTable_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __109__PLModelMigrationAction_CopyStickerConfidenceScoreToAssetTable_performActionWithManagedObjectContext_error___block_invoke_3(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  uint64_t v7 = [v6 mediaAnalysisAttributes];
  uint64_t v8 = [v7 visualSearchAttributes];

  uint64_t v9 = +[PLVisualSearchAttributes stickerConfidenceScoreKey];
  objc_msgSend(v8, "pl_floatValueForKey:", v9);
  int v11 = v10;

  LODWORD(v12) = v11;
  [v6 setStickerConfidenceScore:v12];

  ++*(void *)(*(void *)(a1[5] + 8) + 24);
  int v13 = (void *)a1[4];
  uint64_t v14 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v14 + 40);
  LODWORD(v9) = [v13 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v14 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(a1[7] + 8) + 24) = 2;
    *a4 = 1;
  }
  int v15 = *(void **)(*(void *)(a1[8] + 8) + 40);
  objc_msgSend(v15, "setCompletedUnitCount:", objc_msgSend(v15, "completedUnitCount") + 1);
}

id __111__PLModelMigrationAction_FixupDefaultStickerConfidenceScoreValues_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __111__PLModelMigrationAction_FixupDefaultStickerConfidenceScoreValues_performActionWithManagedObjectContext_error___block_invoke_2(double a1, uint64_t a2, uint64_t a3, void *a4)
{
  LODWORD(a1) = -1.0;
  return [a4 setStickerConfidenceScore:a1];
}

id __100__PLModelMigrationAction_LibraryScopeTrashedStateFixup_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __100__PLModelMigrationAction_LibraryScopeTrashedStateFixup_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __100__PLModelMigrationAction_LibraryScopeTrashedStateFixup_performActionWithManagedObjectContext_error___block_invoke_3(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  [a3 untrash];
  ++*(void *)(*(void *)(a1[5] + 8) + 24);
  id v6 = (void *)a1[4];
  uint64_t v7 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v7 + 40);
  int v8 = [v6 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    *(void *)(*(void *)(a1[7] + 8) + 24) = 2;
    *a4 = 1;
  }
  uint64_t v9 = *(void **)(*(void *)(a1[8] + 8) + 40);
  return objc_msgSend(v9, "setCompletedUnitCount:", objc_msgSend(v9, "completedUnitCount") + 1);
}

id __103__PLModelMigrationAction_PopulatePersonCloudDetectionType_performActionWithManagedObjectContext_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __103__PLModelMigrationAction_PopulatePersonCloudDetectionType_performActionWithManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __103__PLModelMigrationAction_PopulatePersonCloudDetectionType_performActionWithManagedObjectContext_error___block_invoke_3(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  uint64_t v7 = (void *)a1[4];
  uint64_t v8 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v8 + 40);
  int v9 = [v7 isCancelledWithError:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) = 2;
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v6, "setCloudDetectionType:", objc_msgSend(v6, "detectionType"));
    int v10 = *(void **)(*(void *)(a1[7] + 8) + 40);
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "completedUnitCount") + 1);
  }
}

- (id)actionName
{
  return @"MigrationAction";
}

void __94__PLModelMigrationAction_CreateManualIndexes_createManualIndexesDropBeforeCreate_pathManager___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [NSString stringWithFormat:@"DROP INDEX IF EXISTS %@;", a2];
  uint64_t v4 = *(sqlite3 **)(a1 + 32);
  id v5 = v3;
  sqlite3_exec(v4, (const char *)[v5 UTF8String], 0, 0, 0);
}

void __94__PLModelMigrationAction_CreateManualIndexes_createManualIndexesDropBeforeCreate_pathManager___block_invoke_2(void *a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = a1[4];
  id v9 = a3;
  int v10 = [v7 hasSuffix:v8];
  int v11 = &stru_1EEB2EB80;
  if (v10) {
    int v11 = @"UNIQUE";
  }
  double v12 = [NSString stringWithFormat:@"CREATE %@ INDEX IF NOT EXISTS %@ ON %@;", v11, v7, v9];

  errmsg = 0;
  int v13 = (sqlite3 *)a1[7];
  id v14 = v12;
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = sqlite3_exec(v13, (const char *)[v14 UTF8String], 0, 0, &errmsg);
  if (*(_DWORD *)(*(void *)(a1[5] + 8) + 24))
  {
    int v15 = PLMigrationGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = *(_DWORD *)(*(void *)(a1[5] + 8) + 24);
      *(_DWORD *)buf = 138543874;
      id v19 = v7;
      __int16 v20 = 1024;
      int v21 = v16;
      __int16 v22 = 2080;
      uint64_t v23 = errmsg;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "*** Error creating manual index: %{public}@ %d %s", buf, 0x1Cu);
    }

    if (errmsg) {
      sqlite3_free(errmsg);
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }
}

id __102__PLModelMigrationAction_RepairSingletons__repairRootFolderFixedOrderKeysInStore_context_pathManager___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) persistentStoreCoordinator];
  id v5 = [NSString stringWithUTF8String:a2];
  id v6 = PLManagedObjectContextForMigrationActionWithCoordinator(v4, v5, *(void **)(a1 + 40), 0);

  return v6;
}

void __102__PLModelMigrationAction_RepairSingletons__repairRootFolderFixedOrderKeysInStore_context_pathManager___block_invoke_2(uint64_t a1)
{
  id v2 = +[PLGenericAlbum albumWithKind:3999 inManagedObjectContext:*(void *)(a1 + 32)];
  [v2 enforceFixedOrderKeyComplianceWithOrderKeyManager:*(void *)(a1 + 40)];
}

@end