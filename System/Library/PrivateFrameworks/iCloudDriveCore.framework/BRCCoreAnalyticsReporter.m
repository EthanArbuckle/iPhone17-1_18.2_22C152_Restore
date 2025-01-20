@interface BRCCoreAnalyticsReporter
+ (BOOL)uploadLoadErrorsAsIndividualEvents:(id)a3 syncType:(id)a4 totalItemsCount:(unint64_t)a5 zoneCountsOnly:(BOOL)a6 isFolderSharingEnabled:(BOOL)a7 dsid:(id)a8 rampNumber:(id)a9;
+ (BOOL)uploadSyncErrorsAsIndividualEvents:(id)a3 syncType:(id)a4 totalItemsCount:(unint64_t)a5 zoneType:(id)a6 zoneCountsOnly:(BOOL)a7 isFolderSharingEnabled:(BOOL)a8 dsid:(id)a9 rampNumber:(id)a10;
+ (id)dictionaryForErrorsByZone:(id)a3 wantPrivateZone:(BOOL)a4;
+ (id)telemetryDictionaryToUploadForError:(id)a3 errorMessage:(id)a4 count:(id)a5 syncType:(id)a6 totalItemsCount:(id)a7 zoneType:(id)a8 zoneCountsOnly:(BOOL)a9 isFolderSharingEnabled:(BOOL)a10 dsid:(id)a11 rampNumber:(id)a12 lastFailureDate:(id)a13 pcsState:(id)a14;
+ (void)newAppTelemetryMetricEvent:(id)a3;
+ (void)sendTelemetryEvent:(id)a3 withReport:(id)a4;
+ (void)uploadMetricsReport:(id)a3;
@end

@implementation BRCCoreAnalyticsReporter

+ (void)uploadMetricsReport:(id)a3
{
  v56[7] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[BRCAnalyticsReporter isTelemetryReportingEnabled])
  {
    v5 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v6 = [v5 isBlacklistedFromFolderSharing] ^ 1;

    v7 = [v4 syncUpErrorsByMangledID];
    uint64_t v8 = [a1 dictionaryForErrorsByZone:v7 wantPrivateZone:0];

    uint64_t v9 = [v4 clientTruthTotalItemsCount];
    v10 = [v4 dsid];
    v11 = [v4 rampNumber];
    v54 = (void *)v8;
    char v51 = [a1 uploadSyncErrorsAsIndividualEvents:v8 syncType:@"syncUp" totalItemsCount:v9 zoneType:@"shared" zoneCountsOnly:1 isFolderSharingEnabled:v6 dsid:v10 rampNumber:v11];

    v12 = [v4 syncUpErrorsByMangledID];
    uint64_t v13 = [a1 dictionaryForErrorsByZone:v12 wantPrivateZone:1];

    uint64_t v14 = [v4 clientTruthTotalItemsCount];
    v15 = [v4 dsid];
    v16 = [v4 rampNumber];
    v53 = (void *)v13;
    char v49 = [a1 uploadSyncErrorsAsIndividualEvents:v13 syncType:@"syncUp" totalItemsCount:v14 zoneType:@"private" zoneCountsOnly:1 isFolderSharingEnabled:v6 dsid:v15 rampNumber:v16];

    v17 = [v4 syncDownErrorsByMangledID];
    uint64_t v18 = [a1 dictionaryForErrorsByZone:v17 wantPrivateZone:0];

    uint64_t v19 = [v4 clientTruthTotalItemsCount];
    v20 = [v4 dsid];
    v21 = [v4 rampNumber];
    v52 = (void *)v18;
    char v48 = [a1 uploadSyncErrorsAsIndividualEvents:v18 syncType:@"syncDown" totalItemsCount:v19 zoneType:@"shared" zoneCountsOnly:1 isFolderSharingEnabled:v6 dsid:v20 rampNumber:v21];

    v22 = [v4 syncUpErrorsByMangledID];
    uint64_t v23 = [a1 dictionaryForErrorsByZone:v22 wantPrivateZone:1];

    uint64_t v24 = [v4 clientTruthTotalItemsCount];
    v25 = [v4 dsid];
    v26 = [v4 rampNumber];
    v50 = (void *)v23;
    char v27 = [a1 uploadSyncErrorsAsIndividualEvents:v23 syncType:@"syncDown" totalItemsCount:v24 zoneType:@"private" zoneCountsOnly:1 isFolderSharingEnabled:v6 dsid:v25 rampNumber:v26];

    v28 = [v4 uploadFailures];
    uint64_t v29 = [v4 clientTruthTotalItemsCount];
    v30 = [v4 dsid];
    v31 = [v4 rampNumber];
    char v32 = [a1 uploadLoadErrorsAsIndividualEvents:v28 syncType:@"upload" totalItemsCount:v29 zoneCountsOnly:0 isFolderSharingEnabled:v6 dsid:v30 rampNumber:v31];

    v33 = [v4 downloadFailures];
    uint64_t v34 = [v4 clientTruthTotalItemsCount];
    v35 = [v4 dsid];
    v36 = [v4 rampNumber];
    char v37 = [a1 uploadLoadErrorsAsIndividualEvents:v33 syncType:@"download" totalItemsCount:v34 zoneCountsOnly:0 isFolderSharingEnabled:v6 dsid:v35 rampNumber:v36];

    v38 = [v4 syncUpFailures];
    uint64_t v39 = [v4 clientTruthTotalItemsCount];
    v40 = [v4 dsid];
    v41 = [v4 rampNumber];
    char v42 = [a1 uploadLoadErrorsAsIndividualEvents:v38 syncType:@"itemSyncUp" totalItemsCount:v39 zoneCountsOnly:0 isFolderSharingEnabled:v6 dsid:v40 rampNumber:v41];

    if ((v51 & 1) == 0
      && (v49 & 1) == 0
      && (v48 & 1) == 0
      && (v27 & 1) == 0
      && (v32 & 1) == 0
      && (v37 & 1) == 0
      && (v42 & 1) == 0)
    {
      v55[0] = @"ErrorName";
      v55[1] = @"ErrorCount";
      v56[0] = @"success";
      v56[1] = &unk_26F3DDAA8;
      v56[2] = @"success";
      v55[2] = @"SyncType";
      v55[3] = @"TotalItemsCount";
      v43 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "clientTruthTotalItemsCount"));
      v56[3] = v43;
      v55[4] = @"FolderSharingEnabled";
      v44 = [NSNumber numberWithBool:v6];
      v56[4] = v44;
      v55[5] = @"DSID";
      v45 = [v4 dsid];
      v56[5] = v45;
      v55[6] = @"RampNumber";
      v46 = [v4 rampNumber];
      v56[6] = v46;
      v47 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:7];

      [a1 sendTelemetryEvent:@"com.apple.iCloudDrive.syncStatus" withReport:v47];
    }
  }
}

+ (id)dictionaryForErrorsByZone:(id)a3 wantPrivateZone:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__BRCCoreAnalyticsReporter_dictionaryForErrorsByZone_wantPrivateZone___block_invoke;
  v9[3] = &unk_265086F30;
  BOOL v11 = a4;
  id v7 = v6;
  id v10 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

void __70__BRCCoreAnalyticsReporter_dictionaryForErrorsByZone_wantPrivateZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  if (*(unsigned __int8 *)(a1 + 40) == [a2 isPrivate])
  {
    id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
      uint64_t v7 = [v6 intValue] + 1;
    }
    else
    {
      uint64_t v7 = 1;
    }

    uint64_t v8 = [NSNumber numberWithInt:v7];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
  }
}

+ (id)telemetryDictionaryToUploadForError:(id)a3 errorMessage:(id)a4 count:(id)a5 syncType:(id)a6 totalItemsCount:(id)a7 zoneType:(id)a8 zoneCountsOnly:(BOOL)a9 isFolderSharingEnabled:(BOOL)a10 dsid:(id)a11 rampNumber:(id)a12 lastFailureDate:(id)a13 pcsState:(id)a14
{
  id v41 = a4;
  id v37 = a8;
  id v40 = a11;
  id v39 = a13;
  id v38 = a14;
  uint64_t v19 = NSString;
  id v20 = a12;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a3;
  v25 = [v24 domain];
  v26 = NSNumber;
  uint64_t v27 = [v24 code];

  v28 = [v26 numberWithInteger:v27];
  uint64_t v29 = [v19 stringWithFormat:@"%@;%@", v25, v28];

  v30 = objc_opt_new();
  v31 = [NSNumber numberWithBool:a10];
  [v30 setObject:v31 forKey:@"FolderSharingEnabled"];

  [v30 setObject:v29 forKey:@"ErrorName"];
  if (a9) {
    char v32 = @"ZoneErrorCount";
  }
  else {
    char v32 = @"ErrorCount";
  }
  [v30 setObject:v23 forKey:v32];

  [v30 setObject:v22 forKey:@"SyncType"];
  [v30 setObject:v21 forKey:@"TotalItemsCount"];

  if (v37) {
    [v30 setObject:v37 forKey:@"ZoneType"];
  }
  [v30 setObject:v40 forKey:@"DSID"];
  [v30 setObject:v20 forKey:@"RampNumber"];

  if (v39)
  {
    v33 = NSString;
    [v39 timeIntervalSinceReferenceDate];
    v35 = objc_msgSend(v33, "stringWithFormat:", @"%f", v34);
    [v30 setObject:v35 forKey:@"LastErrorTimestamp"];
  }
  if (v38) {
    [v30 setObject:v38 forKey:@"ChainedFiles"];
  }
  if (v41) {
    [v30 setObject:v41 forKey:@"ErrorMessage"];
  }

  return v30;
}

+ (BOOL)uploadSyncErrorsAsIndividualEvents:(id)a3 syncType:(id)a4 totalItemsCount:(unint64_t)a5 zoneType:(id)a6 zoneCountsOnly:(BOOL)a7 isFolderSharingEnabled:(BOOL)a8 dsid:(id)a9 rampNumber:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a9;
  id v20 = a10;
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __151__BRCCoreAnalyticsReporter_uploadSyncErrorsAsIndividualEvents_syncType_totalItemsCount_zoneType_zoneCountsOnly_isFolderSharingEnabled_dsid_rampNumber___block_invoke;
  v26[3] = &unk_265086F58;
  id v32 = a1;
  id v21 = v17;
  id v27 = v21;
  unint64_t v33 = a5;
  id v22 = v18;
  id v28 = v22;
  BOOL v34 = a7;
  BOOL v35 = a8;
  id v23 = v19;
  id v29 = v23;
  id v24 = v20;
  id v30 = v24;
  v31 = &v36;
  [v16 enumerateKeysAndObjectsUsingBlock:v26];
  LOBYTE(v17) = *((unsigned char *)v37 + 24);

  _Block_object_dispose(&v36, 8);
  return (char)v17;
}

void __151__BRCCoreAnalyticsReporter_uploadSyncErrorsAsIndividualEvents_syncType_totalItemsCount_zoneType_zoneCountsOnly_isFolderSharingEnabled_dsid_rampNumber___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 error];
  id v19 = *(void **)(a1 + 72);
  id v20 = v7;
  uint64_t v8 = objc_msgSend(v7, "brc_cloudKitErrorMessage");
  uint64_t v18 = *(void *)(a1 + 32);
  id v9 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 80)];
  __int16 v10 = *(_WORD *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 56);
  int v14 = [v6 isPCSChained];

  v15 = @"unchained";
  if (v14) {
    v15 = @"chain sent";
  }
  LOWORD(v17) = v10;
  id v16 = objc_msgSend(v19, "telemetryDictionaryToUploadForError:errorMessage:count:syncType:totalItemsCount:zoneType:zoneCountsOnly:isFolderSharingEnabled:dsid:rampNumber:lastFailureDate:pcsState:", v20, v8, v5, v18, v9, v12, v17, v11, v13, 0, v15);

  [*(id *)(a1 + 72) sendTelemetryEvent:@"com.apple.iCloudDrive.syncStatus" withReport:v16];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
}

+ (BOOL)uploadLoadErrorsAsIndividualEvents:(id)a3 syncType:(id)a4 totalItemsCount:(unint64_t)a5 zoneCountsOnly:(BOOL)a6 isFolderSharingEnabled:(BOOL)a7 dsid:(id)a8 rampNumber:(id)a9
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v63 = a4;
  id v62 = a8;
  id v61 = a9;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = v11;
  uint64_t v45 = [v11 countByEnumeratingWithState:&v73 objects:v79 count:16];
  char v12 = 0;
  if (v45)
  {
    uint64_t v44 = *(void *)v74;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v74 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v46 = v13;
        int v14 = *(void **)(*((void *)&v73 + 1) + 8 * v13);
        long long v69 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        v64 = v14;
        v15 = [v14 shareDBErrorCountByPCSAndEDPState];
        id v16 = [v15 allKeys];

        id v47 = v16;
        uint64_t v51 = [v16 countByEnumeratingWithState:&v69 objects:v78 count:16];
        if (v51)
        {
          uint64_t v49 = *(void *)v70;
          do
          {
            for (uint64_t i = 0; i != v51; ++i)
            {
              if (*(void *)v70 != v49) {
                objc_enumerationMutation(v47);
              }
              uint64_t v18 = *(void **)(*((void *)&v69 + 1) + 8 * i);
              v55 = [v64 error];
              v53 = [v64 error];
              id v19 = objc_msgSend(v53, "brc_cloudKitErrorMessage");
              id v20 = [v64 shareDBErrorCountByPCSAndEDPState];
              id v21 = [v20 objectForKeyedSubscript:v18];
              id v22 = [NSNumber numberWithUnsignedLongLong:a5];
              id v23 = [v64 lastFailureDate];
              id v24 = [v18 left];
              unsigned int v25 = [v24 intValue] - 1;
              v26 = @"unknown";
              if (v25 <= 3) {
                v26 = off_265086F78[v25];
              }
              BYTE1(v42) = a7;
              LOBYTE(v42) = a6;
              id v27 = objc_msgSend(a1, "telemetryDictionaryToUploadForError:errorMessage:count:syncType:totalItemsCount:zoneType:zoneCountsOnly:isFolderSharingEnabled:dsid:rampNumber:lastFailureDate:pcsState:", v55, v19, v21, v63, v22, @"shared", v42, v62, v61, v23, v26);

              [a1 sendTelemetryEvent:@"com.apple.iCloudDrive.syncStatus" withReport:v27];
            }
            uint64_t v51 = [v47 countByEnumeratingWithState:&v69 objects:v78 count:16];
          }
          while (v51);
          char v12 = 1;
        }

        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        id v28 = [v64 privateDBErrorCountByPCSAndEDPState];
        id v29 = [v28 allKeys];

        id v48 = v29;
        uint64_t v52 = [v29 countByEnumeratingWithState:&v65 objects:v77 count:16];
        if (v52)
        {
          uint64_t v50 = *(void *)v66;
          do
          {
            for (uint64_t j = 0; j != v52; ++j)
            {
              if (*(void *)v66 != v50) {
                objc_enumerationMutation(v48);
              }
              v31 = *(void **)(*((void *)&v65 + 1) + 8 * j);
              v56 = [v64 error];
              v54 = [v64 error];
              id v32 = objc_msgSend(v54, "brc_cloudKitErrorMessage");
              unint64_t v33 = [v64 privateDBErrorCountByPCSAndEDPState];
              BOOL v34 = [v33 objectForKeyedSubscript:v31];
              BOOL v35 = [NSNumber numberWithUnsignedLongLong:a5];
              uint64_t v36 = [v64 lastFailureDate];
              id v37 = [v31 left];
              unsigned int v38 = [v37 intValue] - 1;
              char v39 = @"unknown";
              if (v38 <= 3) {
                char v39 = off_265086F78[v38];
              }
              BYTE1(v42) = a7;
              LOBYTE(v42) = a6;
              id v40 = objc_msgSend(a1, "telemetryDictionaryToUploadForError:errorMessage:count:syncType:totalItemsCount:zoneType:zoneCountsOnly:isFolderSharingEnabled:dsid:rampNumber:lastFailureDate:pcsState:", v56, v32, v34, v63, v35, @"private", v42, v62, v61, v36, v39);

              [a1 sendTelemetryEvent:@"com.apple.iCloudDrive.syncStatus" withReport:v40];
            }
            uint64_t v52 = [v48 countByEnumeratingWithState:&v65 objects:v77 count:16];
          }
          while (v52);
          char v12 = 1;
        }

        uint64_t v13 = v46 + 1;
      }
      while (v46 + 1 != v45);
      uint64_t v45 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
    }
    while (v45);
  }

  return v12 & 1;
}

+ (void)newAppTelemetryMetricEvent:(id)a3
{
  id v19 = a3;
  if (+[BRCAnalyticsReporter isTelemetryReportingEnabled])
  {
    id v4 = objc_opt_new();
    switch([v19 telemetrySchema])
    {
      case 2u:
        if ([v19 hasMagnitudeInt])
        {
          id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v19, "magnitudeInt"));
          [v4 setObject:v5 forKey:@"mismatchCount"];
        }
        char v6 = 0;
        uint64_t v7 = @"com.apple.iCloudDrive.appTelemetry.folderSharingCountMismatch";
        break;
      case 3u:
        if ([v19 hasMagnitudeInt])
        {
          uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v19, "magnitudeInt"));
          [v4 setObject:v8 forKey:@"numberOfZonesOutOfSync"];
        }
        char v6 = 0;
        uint64_t v7 = @"com.apple.iCloudDrive.appTelemetry.missingPush";
        break;
      case 4u:
        if ([v19 hasMagnitudeBool])
        {
          if ([v19 magnitudeBool]) {
            id v9 = @"true";
          }
          else {
            id v9 = @"false";
          }
          [v4 setObject:v9 forKey:@"permanentlyInconsistent"];
        }
        char v6 = 0;
        uint64_t v7 = @"com.apple.iCloudDrive.appTelemetry.permanentlyInconsistent";
        break;
      case 5u:
        if ([v19 hasMagnitudeInt])
        {
          __int16 v10 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v19, "magnitudeInt"));
          [v4 setObject:v10 forKey:@"eventCount"];
        }
        char v6 = 0;
        uint64_t v7 = @"com.apple.iCloudDrive.appTelemetry.droppedEvent";
        break;
      case 6u:
        if ([v19 hasMagnitudeInt])
        {
          id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v19, "magnitudeInt"));
          [v4 setObject:v11 forKey:@"data"];
        }
        char v6 = 0;
        uint64_t v7 = @"com.apple.iCloudDrive.appTelemetry.testEvent";
        break;
      case 7u:
        if ([v19 hasMagnitudeBool])
        {
          if ([v19 magnitudeBool]) {
            char v12 = @"true";
          }
          else {
            char v12 = @"false";
          }
          [v4 setObject:v12 forKey:@"sharedAliasInSharedFolder"];
        }
        char v6 = 0;
        uint64_t v7 = @"com.apple.iCloudDrive.appTelemetry.shareAliasInSharedFolder";
        break;
      default:
        uint64_t v7 = 0;
        char v6 = 1;
        break;
    }
    if ([v19 hasInvestigation])
    {
      uint64_t v13 = [v19 investigation];
      int v14 = [v13 hasZoneName];

      if (v14)
      {
        id v15 = [NSString alloc];
        id v16 = [v19 investigation];
        uint64_t v17 = [v16 zoneName];
        uint64_t v18 = (void *)[v15 initWithData:v17 encoding:4];

        [v4 setObject:v18 forKey:@"zoneName"];
      }
    }
    if ((v6 & 1) == 0) {
      [a1 sendTelemetryEvent:v7 withReport:v4];
    }
  }
}

+ (void)sendTelemetryEvent:(id)a3 withReport:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  AnalyticsIsEventUsed();
  uint64_t v8 = v5;
  id v7 = v5;
  AnalyticsSendEventLazy();
}

id __58__BRCCoreAnalyticsReporter_sendTelemetryEvent_withReport___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end