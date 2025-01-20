@interface BRCZoneHealthReportOperation
- (BOOL)shouldPerformAnotherBatch;
- (BOOL)shouldRetryForError:(id)a3;
- (BRCZoneHealthReportOperation)initWithSession:(id)a3;
- (void)_reportRecords:(id)a3 requestID:(unint64_t)a4;
- (void)main;
@end

@implementation BRCZoneHealthReportOperation

- (BRCZoneHealthReportOperation)initWithSession:(id)a3
{
  id v5 = a3;
  v6 = [v5 syncContextProvider];
  v7 = [v6 zoneHealthSyncContext];
  v10.receiver = self;
  v10.super_class = (Class)BRCZoneHealthReportOperation;
  v8 = [(_BRCOperation *)&v10 initWithName:@"zone-health-report" syncContext:v7 sessionContext:v5];

  if (v8)
  {
    objc_storeStrong((id *)&v8->_session, a3);
    v8->shouldPerformAnotherBatch = 1;
  }

  return v8;
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (BOOL)shouldPerformAnotherBatch
{
  return self->shouldPerformAnotherBatch;
}

- (void)_reportRecords:(id)a3 requestID:(unint64_t)a4
{
  id v6 = a3;
  v21 = (void *)a4;
  v7 = (void *)[objc_alloc(MEMORY[0x263EFD748]) initWithRecordsToSave:v6 recordIDsToDelete:0];
  v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&v21 length:8];
  [v7 setClientChangeTokenData:v8];

  [v7 setAtomic:1];
  v9 = objc_opt_new();
  [v7 setConfiguration:v9];

  uint64_t v10 = *MEMORY[0x263F32550];
  v11 = [v7 configuration];
  [v11 setSourceApplicationBundleIdentifier:v10];

  objc_initWeak(&location, v7);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __57__BRCZoneHealthReportOperation__reportRecords_requestID___block_invoke;
  v16 = &unk_265086390;
  objc_copyWeak(v19, &location);
  v17 = self;
  id v12 = v6;
  id v18 = v12;
  v19[1] = v21;
  [v7 setModifyRecordsCompletionBlock:&v13];
  -[_BRCOperation addSubOperation:](self, "addSubOperation:", v7, v13, v14, v15, v16, v17);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

void __57__BRCZoneHealthReportOperation__reportRecords_requestID___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (objc_msgSend(v9, "brc_isCloudKitErrorImplyingZoneNeedsCreation"))
  {
    v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)id location = 138412802;
      *(void *)&location[4] = WeakRetained;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      v26 = v11;
      _os_log_debug_impl(&dword_23FA42000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] We need to create the zone health zone on %@ - %@%@", location, 0x20u);
    }

    uint64_t v13 = objc_msgSend(MEMORY[0x263EFD808], "brc_zoneHealthZoneID");
    objc_initWeak((id *)location, *(id *)(a1 + 32));
    uint64_t v14 = [[BRCCreateZoneAndSubscribeOperation alloc] initWithSession:*(void *)(*(void *)(a1 + 32) + 512) zoneID:v13];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    id v19[2] = __57__BRCZoneHealthReportOperation__reportRecords_requestID___block_invoke_5;
    v19[3] = &unk_265086368;
    objc_copyWeak(v21, (id *)location);
    id v15 = *(id *)(a1 + 40);
    v16 = *(void **)(a1 + 56);
    id v20 = v15;
    v21[1] = v16;
    [(BRCCreateZoneAndSubscribeOperation *)v14 setCreateZoneAndSubscribeCompletionBlock:v19];
    [*(id *)(a1 + 32) addSubOperation:v14];

    objc_destroyWeak(v21);
    objc_destroyWeak((id *)location);
  }
  else
  {
    if (v9)
    {
      v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        *(_DWORD *)id location = 138412802;
        *(void *)&location[4] = WeakRetained;
        __int16 v23 = 2112;
        id v24 = v9;
        __int16 v25 = 2112;
        v26 = v17;
        _os_log_error_impl(&dword_23FA42000, v18, (os_log_type_t)0x90u, "[ERROR] Failed reporting zone health on %@ - %@%@", location, 0x20u);
      }
    }
    else
    {
      v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id location = 138412802;
        *(void *)&location[4] = v7;
        __int16 v23 = 2112;
        id v24 = WeakRetained;
        __int16 v25 = 2112;
        v26 = v17;
        _os_log_debug_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] finished reporting zone health: %@, op: %@%@", location, 0x20u);
      }
    }

    [*(id *)(a1 + 32) completedWithResult:0 error:v9];
  }
}

void __57__BRCZoneHealthReportOperation__reportRecords_requestID___block_invoke_5(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (v5) {
    [WeakRetained completedWithResult:0 error:v5];
  }
  else {
    [WeakRetained _reportRecords:*(void *)(a1 + 32) requestID:*(void *)(a1 + 48)];
  }
}

- (void)main
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_23FA42000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] No zone health errors to report%@", (uint8_t *)&v2, 0xCu);
}

void __36__BRCZoneHealthReportOperation_main__block_invoke(void *a1)
{
  int v2 = [*(id *)(a1[4] + 248) session];
  uint64_t v3 = [v2 clientDB];
  [v3 forceBatchStart];

  uint64_t v4 = [*(id *)(a1[4] + 248) session];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__BRCZoneHealthReportOperation_main__block_invoke_2;
  v6[3] = &unk_2650863B8;
  id v5 = (void *)a1[5];
  uint64_t v8 = a1[6];
  id v7 = v5;
  [v4 enumeratePrivateClientZones:v6];
}

uint64_t __36__BRCZoneHealthReportOperation_main__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 prepareProblemReportForSyncWithRequestID:*(void *)(a1 + 40)];
  if ([v4 needsSyncUp])
  {
    uint64_t v49 = a1;
    id v5 = [v3 serverZone];
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFD808], "brc_zoneHealthZoneID");
    id v7 = NSString;
    uint64_t v8 = [v5 zoneName];
    id v9 = [MEMORY[0x263F08C38] UUID];
    uint64_t v10 = [v9 UUIDString];
    uint64_t v11 = [v7 stringWithFormat:@"%@/%@", v8, v10];

    id v12 = objc_alloc(MEMORY[0x263EFD7E8]);
    v51 = v5;
    uint64_t v13 = [v5 zoneName];
    uint64_t v14 = [v12 initWithRecordName:v13 zoneID:v6];

    v48 = (void *)v11;
    v50 = (void *)v6;
    uint64_t v15 = [objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:v11 zoneID:v6];
    v47 = (void *)v14;
    v16 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"zoneState" recordID:v14];
    v46 = (void *)v15;
    v17 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"zoneDetails" recordID:v15];
    LODWORD(v14) = [v4 state];
    id v18 = [v3 zoneHealthState];
    LODWORD(v9) = [v18 state];

    if ((int)v14 <= (int)v9)
    {
      v19 = brc_bread_crumbs();
      id v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v61 = v19;
        _os_log_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] not updating zone health state because we think we are less broken than the server does%@", buf, 0xCu);
      }
    }
    else
    {
      v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "state"));
      [v16 setObject:v19 forKeyedSubscript:@"state"];
    }

    v21 = NSNumber;
    v22 = [MEMORY[0x263EFF910] date];
    [v22 timeIntervalSince1970];
    id v24 = [v21 numberWithUnsignedLongLong:(unint64_t)v23];
    [v16 setObject:v24 forKeyedSubscript:@"updateTime"];

    [v16 setObject:&stru_26F3822F0 forKeyedSubscript:@"clientInfo"];
    if (![v4 state])
    {
      v43 = brc_bread_crumbs();
      v44 = brc_default_log();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
        __36__BRCZoneHealthReportOperation_main__block_invoke_2_cold_1((uint64_t)v43, v44);
      }
    }
    v45 = v16;
    __int16 v25 = [v4 effectiveProblemMessage];
    [v17 setObject:v25 forKeyedSubscript:@"message"];

    id v26 = objc_alloc(MEMORY[0x263EFD808]);
    v53 = v3;
    uint64_t v27 = [v3 serverZone];
    v28 = [v27 zoneName];
    v29 = (void *)[v26 initWithZoneName:v28 ownerName:*MEMORY[0x263EFD488]];

    v30 = objc_opt_new();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v52 = v4;
    v31 = [v4 effectedRecordNames];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v55 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = (void *)[objc_alloc(MEMORY[0x263EFD7E8]) initWithRecordName:*(void *)(*((void *)&v54 + 1) + 8 * i) zoneID:v29];
          v37 = (void *)[objc_alloc(MEMORY[0x263EFD820]) initWithRecordID:v36 action:0];
          [v30 addObject:v37];
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v33);
    }

    if ([v30 count]) {
      [v17 setObject:v30 forKeyedSubscript:@"records"];
    }
    id v3 = v53;
    v38 = [v53 zoneHealthState];
    v39 = [v38 ckInfo];
    [v39 setCKInfoFieldsInRecord:v45 includeCZMEtag:0];

    v40 = *(void **)(v49 + 32);
    v58[0] = v17;
    v58[1] = v45;
    v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:2];
    [v40 addObjectsFromArray:v41];

    uint64_t v4 = v52;
  }

  return 1;
}

- (void).cxx_destruct
{
}

void __36__BRCZoneHealthReportOperation_main__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_23FA42000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: report.state != BRCZoneHealthStateHealthy%@", (uint8_t *)&v2, 0xCu);
}

@end