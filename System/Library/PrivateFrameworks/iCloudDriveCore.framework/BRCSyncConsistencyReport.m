@interface BRCSyncConsistencyReport
+ (void)_finishReport:(id)a3 session:(id)a4 temporaryDBURL:(id)a5 mountFD:(int)a6 completionHandler:(id)a7;
+ (void)cleanupApfsSnapshotWithMountFD:(int)a3;
+ (void)cleanupApfsSnapshotWithMountPath:(id)a3;
+ (void)generateReportWithSession:(id)a3 mangledIDs:(id)a4 completion:(id)a5;
- (BOOL)wasAbleToRun;
- (NSArray)telemetryErrorEvents;
- (NSArray)telemetryWarningEvents;
- (NSError)lastError;
@end

@implementation BRCSyncConsistencyReport

+ (void)_finishReport:(id)a3 session:(id)a4 temporaryDBURL:(id)a5 mountFD:(int)a6 completionHandler:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if ((v8 & 0x80000000) == 0)
  {
    [a1 cleanupApfsSnapshotWithMountFD:v8];
    close(v8);
  }
  if (v14)
  {
    v16 = [MEMORY[0x263F08850] defaultManager];
    [v16 removeItemAtURL:v14 error:0];
  }
  v17 = [v13 clientTruthWorkloop];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __91__BRCSyncConsistencyReport__finishReport_session_temporaryDBURL_mountFD_completionHandler___block_invoke;
  v20[3] = &unk_26507F850;
  id v21 = v12;
  id v22 = v15;
  id v18 = v15;
  id v19 = v12;
  dispatch_async(v17, v20);
}

uint64_t __91__BRCSyncConsistencyReport__finishReport_session_temporaryDBURL_mountFD_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) wasAbleToRun])
  {
    v2 = brc_bread_crumbs();
    v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __91__BRCSyncConsistencyReport__finishReport_session_temporaryDBURL_mountFD_completionHandler___block_invoke_cold_1();
    }
  }
  else
  {
    v2 = brc_bread_crumbs();
    v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      v6 = v2;
      _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_DEFAULT, "[WARNING] Telemetry sync consistency report did not run%@", (uint8_t *)&v5, 0xCu);
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)cleanupApfsSnapshotWithMountPath:(id)a3
{
  uint64_t v4 = open((const char *)[a3 fileSystemRepresentation], 0);
  if ((v4 & 0x80000000) == 0)
  {
    int v5 = v4;
    [a1 cleanupApfsSnapshotWithMountFD:v4];
    close(v5);
  }
}

+ (void)cleanupApfsSnapshotWithMountFD:(int)a3
{
  id v14 = 0;
  char v4 = BRCUnmountAPFSSnapshot(@"iCloudDriveSyncConsistency", &v14);
  id v5 = v14;
  v6 = v5;
  if ((v4 & 1) == 0 && (objc_msgSend(v5, "br_isPOSIXErrorCode:", 2) & 1) == 0)
  {
    uint64_t v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      +[BRCSyncConsistencyReport cleanupApfsSnapshotWithMountFD:]();
    }
  }
  id v13 = v6;
  char v9 = BRCDeleteAPFSSnapshot(a3, @"iCloudDriveSyncConsistency", &v13);
  id v10 = v13;

  if ((v9 & 1) == 0 && (objc_msgSend(v10, "br_isPOSIXErrorCode:", 2) & 1) == 0)
  {
    v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u)) {
      +[BRCSyncConsistencyReport cleanupApfsSnapshotWithMountFD:]();
    }
  }
}

+ (void)generateReportWithSession:(id)a3 mangledIDs:(id)a4 completion:(id)a5
{
  uint64_t v133 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_alloc_init(BRCSyncConsistencyReport);
  id v12 = +[BRCUserDefaults defaultsForMangledID:0];
  id v13 = +[BRCSystemResourcesManager manager];
  id v14 = [v8 volume];
  char v15 = objc_msgSend(v13, "hasEnoughSpaceForDevice:", objc_msgSend(v14, "deviceID"));

  if (v15)
  {
    v91 = v12;
    id v92 = a1;
    v88 = v10;
    v16 = [MEMORY[0x263F08850] defaultManager];
    v17 = NSURL;
    id v18 = [v8 sessionDirPath];
    id v19 = [v18 stringByAppendingPathComponent:@"telemetry-db"];
    v20 = [v17 fileURLWithPath:v19];

    if ([v20 checkResourceIsReachableAndReturnError:0]) {
      [v16 removeItemAtURL:v20 error:0];
    }
    v90 = v16;
    [v16 createDirectoryAtURL:v20 withIntermediateDirectories:1 attributes:0 error:0];
    id v21 = [v8 serverTruthWorkloop];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke;
    block[3] = &unk_26507ED98;
    id v22 = v8;
    id v123 = v22;
    id v23 = v20;
    id v124 = v23;
    dispatch_async_and_wait(v21, block);

    v24 = [v22 clientTruthWorkloop];
    v119[0] = MEMORY[0x263EF8330];
    v119[1] = 3221225472;
    v119[2] = __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_2;
    v119[3] = &unk_26507ED98;
    id v25 = v22;
    id v120 = v25;
    id v87 = v23;
    id v121 = v87;
    dispatch_async_and_wait(v24, v119);

    v26 = [v25 volume];
    v27 = [v26 mountPath];

    v28 = +[BRCUserDefaults defaultsForMangledID:0];
    LODWORD(v24) = [v28 syncConsistencyCheckerSnapshotting];

    v89 = v27;
    if (!v24)
    {
      v34 = @"/";
      unsigned int v85 = -1;
LABEL_11:
      v81 = BRDiskCheckerServiceConnection();
      v84 = v34;
      v38 = [NSURL fileURLWithPath:v34];
      v39 = [MEMORY[0x263F325A0] mobileDocumentsURL];
      v40 = [v39 path];
      v83 = v38;
      v41 = [v38 URLByAppendingPathComponent:v40];

      v86 = v9;
      v82 = v41;
      if (v9 && [v9 count])
      {
        v115[0] = MEMORY[0x263EF8330];
        v115[1] = 3221225472;
        v115[2] = __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_721;
        v115[3] = &unk_26507FC58;
        id v116 = v41;
        v42 = objc_msgSend(v9, "br_transform:", v115);
      }
      else
      {
        v126 = v41;
        v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v126 count:1];
      }
      v43 = objc_opt_new();
      long long v111 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      long long v114 = 0u;
      id v44 = v42;
      uint64_t v45 = [v44 countByEnumeratingWithState:&v111 objects:v125 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v112;
        while (2)
        {
          for (uint64_t i = 0; i != v46; ++i)
          {
            if (*(void *)v112 != v47) {
              objc_enumerationMutation(v44);
            }
            uint64_t v49 = *(void *)(*((void *)&v111 + 1) + 8 * i);
            id v110 = 0;
            v50 = [MEMORY[0x263F054E0] wrapperWithURL:v49 readonly:1 error:&v110];
            v51 = (NSError *)v110;
            if (v51)
            {
              lastError = v11->_lastError;
              v11->_lastError = v51;
              v59 = v51;

              v54 = v87;
              id v10 = v88;
              [v92 _finishReport:v11 session:v25 temporaryDBURL:v87 mountFD:v85 completionHandler:v88];

              v57 = v44;
              v56 = v81;
              goto LABEL_25;
            }
            [v43 addObject:v50];
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v111 objects:v125 count:16];
          if (v46) {
            continue;
          }
          break;
        }
      }

      v108[0] = MEMORY[0x263EF8330];
      v108[1] = 3221225472;
      v108[2] = __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_2_723;
      v108[3] = &unk_26507FC80;
      id v52 = v25;
      id v109 = v52;
      v80 = objc_msgSend(v86, "br_transform:", v108);
      v101[0] = MEMORY[0x263EF8330];
      v101[1] = 3221225472;
      v101[2] = __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_3;
      v101[3] = &unk_26507FCA8;
      v53 = v11;
      v102 = v53;
      id v106 = v92;
      id v76 = v52;
      id v103 = v76;
      v54 = v87;
      id v75 = v87;
      id v104 = v75;
      unsigned int v107 = v85;
      id v10 = v88;
      id v55 = v88;
      id v105 = v55;
      v79 = [v81 remoteObjectProxyWithErrorHandler:v101];
      unsigned int v78 = [v91 syncConsistencyFileChecksumRate];
      unsigned int v77 = [v91 syncConsistencyPackageChecksumRate];
      v56 = v81;
      unsigned int v74 = [v91 syncConsistencyMaxEventsCount];
      v93[0] = MEMORY[0x263EF8330];
      v93[1] = 3221225472;
      v93[2] = __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_725;
      v93[3] = &unk_26507FCD0;
      v94 = v53;
      id v99 = v92;
      id v95 = v76;
      id v96 = v75;
      unsigned int v100 = v85;
      id v98 = v55;
      id v97 = v81;
      [v79 checkTreeConsistencyWithDatabaseURL:v96 rootURLWrappers:v43 fileChecksumRatePerThousand:v78 packageChecksumRatePerThousand:v77 maxEventsCount:v74 forZoneRowIDs:v80 reply:v93];

      v57 = v109;
LABEL_25:

      id v9 = v86;
      id v12 = v91;
      v60 = v84;
      goto LABEL_31;
    }
    id v29 = v27;
    uint64_t v30 = open((const char *)[v29 fileSystemRepresentation], 0);
    if ((v30 & 0x80000000) != 0)
    {
      v61 = v11->_lastError;
      v11->_lastError = 0;

      v54 = v87;
      [v92 _finishReport:v11 session:v25 temporaryDBURL:v87 mountFD:v30 completionHandler:v10];
    }
    else
    {
      [v92 cleanupApfsSnapshotWithMountFD:v30];
      id v118 = 0;
      BOOL v31 = BRCGenerateAPFSSnapshot(v30, @"iCloudDriveSyncConsistency", &v118);
      v32 = (NSError *)v118;
      v33 = v32;
      if (v31)
      {
        v117 = v32;
        BRCMountAPFSSnapshot(v30, @"iCloudDriveSyncConsistency", &v117);
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v35 = v117;

        if (v34)
        {
          unsigned int v85 = v30;

          goto LABEL_11;
        }
        uint64_t v68 = v30;
        v69 = brc_bread_crumbs();
        v70 = brc_default_log();
        id v12 = v91;
        if (os_log_type_enabled(v70, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          id v128 = v29;
          __int16 v129 = 2112;
          v130 = v35;
          __int16 v131 = 2112;
          v132 = v69;
          _os_log_error_impl(&dword_23FA42000, v70, (os_log_type_t)0x90u, "[ERROR] Failed to mount snapshot at %@ - %@%@", buf, 0x20u);
        }

        v71 = v11->_lastError;
        v11->_lastError = v35;
        v72 = v35;

        v54 = v87;
        uint64_t v73 = v68;
        id v10 = v88;
        [v92 _finishReport:v11 session:v25 temporaryDBURL:v87 mountFD:v73 completionHandler:v88];

        v60 = 0;
LABEL_31:

        goto LABEL_32;
      }
      uint64_t v62 = v30;
      v63 = brc_bread_crumbs();
      v64 = brc_default_log();
      if (os_log_type_enabled(v64, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        id v128 = v29;
        __int16 v129 = 2112;
        v130 = v33;
        __int16 v131 = 2112;
        v132 = v63;
        _os_log_error_impl(&dword_23FA42000, v64, (os_log_type_t)0x90u, "[ERROR] Failed to generate snapshot at %@ - %@%@", buf, 0x20u);
      }

      v65 = v11->_lastError;
      v11->_lastError = v33;
      v66 = v33;

      v54 = v87;
      uint64_t v67 = v62;
      id v10 = v88;
      [v92 _finishReport:v11 session:v25 temporaryDBURL:v87 mountFD:v67 completionHandler:v88];
    }
    v60 = @"/";
    id v12 = v91;
    goto LABEL_31;
  }
  uint64_t v36 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", 28);
  v37 = v11->_lastError;
  v11->_lastError = (NSError *)v36;

  [a1 _finishReport:v11 session:v8 temporaryDBURL:0 mountFD:0xFFFFFFFFLL completionHandler:v10];
LABEL_32:
}

void __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) serverDB];
  [v2 flush];

  id v4 = [*(id *)(a1 + 32) serverDB];
  v3 = [*(id *)(a1 + 40) URLByAppendingPathComponent:@"server.db"];
  [v4 backupToURL:v3 progress:0];
}

void __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) clientDB];
  [v2 flush];

  id v4 = [*(id *)(a1 + 32) clientDB];
  v3 = [*(id *)(a1 + 40) URLByAppendingPathComponent:@"client.db"];
  [v4 backupToURL:v3 progress:0];
}

uint64_t __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_721(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) URLByAppendingPathComponent:a2];
}

id __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_2_723(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)MEMORY[0x263F325E0];
  id v4 = a2;
  id v5 = (void *)[[v3 alloc] initWithMangledString:v4];

  v6 = [v2 appLibraryByMangledID:v5];
  uint64_t v7 = [v6 zoneRowID];

  return v7;
}

void __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = brc_bread_crumbs();
    v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
      __79__BRCAnalyticsReporter__resumePausedTreeConsistencyCheckOperationWithActivity___block_invoke_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
    [*(id *)(a1 + 64) _finishReport:*(void *)(a1 + 32) session:*(void *)(a1 + 40) temporaryDBURL:*(void *)(a1 + 48) mountFD:*(unsigned int *)(a1 + 72) completionHandler:*(void *)(a1 + 56)];
  }
}

void __76__BRCSyncConsistencyReport_generateReportWithSession_mangledIDs_completion___block_invoke_725(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a4);
  }
  else
  {
    [*(id *)(a1 + 56) invalidate];
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
    id v28 = v7;
    if (v7)
    {
      id v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v11 = v7;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v34 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = [[AppTelemetryTimeSeriesEvent alloc] initWithData:*(void *)(*((void *)&v33 + 1) + 8 * i)];
            [v10 addObject:v16];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v13);
      }

      uint64_t v17 = *(void *)(a1 + 32);
      id v18 = *(void **)(v17 + 16);
      *(void *)(v17 + 16) = v10;

      id v7 = v28;
    }
    if (v8)
    {
      id v19 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v20 = v8;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v30 != v23) {
              objc_enumerationMutation(v20);
            }
            id v25 = [[AppTelemetryTimeSeriesEvent alloc] initWithData:*(void *)(*((void *)&v29 + 1) + 8 * j)];
            [v19 addObject:v25];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v22);
      }

      uint64_t v26 = *(void *)(a1 + 32);
      v27 = *(void **)(v26 + 24);
      *(void *)(v26 + 24) = v19;

      id v7 = v28;
    }
  }
  [*(id *)(a1 + 72) _finishReport:*(void *)(a1 + 32) session:*(void *)(a1 + 40) temporaryDBURL:*(void *)(a1 + 48) mountFD:*(unsigned int *)(a1 + 80) completionHandler:*(void *)(a1 + 64)];
}

- (NSArray)telemetryErrorEvents
{
  return self->_telemetryErrorEvents;
}

- (NSArray)telemetryWarningEvents
{
  return self->_telemetryWarningEvents;
}

- (NSError)lastError
{
  return self->_lastError;
}

- (BOOL)wasAbleToRun
{
  return self->_wasAbleToRun;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_telemetryWarningEvents, 0);
  objc_storeStrong((id *)&self->_telemetryErrorEvents, 0);
}

void __91__BRCSyncConsistencyReport__finishReport_session_temporaryDBURL_mountFD_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_12();
  v1 = v0;
  v2 = [*v0 telemetryErrorEvents];
  [v2 count];
  v3 = [*v1 telemetryWarningEvents];
  [v3 count];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_12_0(&dword_23FA42000, v4, v5, "[DEBUG] Telemetry sync consistency report succeeded with %lu error and %lu warning events%@", v6, v7, v8, v9, 2u);
}

+ (void)cleanupApfsSnapshotWithMountFD:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] Failed to delete old snapshot - %@%@");
}

+ (void)cleanupApfsSnapshotWithMountFD:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] Failed to unmount old snapshot - %@%@");
}

@end