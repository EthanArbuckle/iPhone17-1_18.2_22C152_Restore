@interface BRCBouncingAnalyzer
- (BOOL)_isGenericUntitledFileName:(id)a3;
- (BOOL)analyzeServerBouncingOfItem:(id)a3 withServerItem:(id)a4;
- (BOOL)analyzeServerBouncingOriginalRecord:(id)a3 savedRecord:(id)a4;
- (BRCBouncingAnalyzer)initWithTapToRadarManager:(id)a3 analyticsReporter:(id)a4;
- (int)analyzeBouncingOfItem:(id)a3 withServerItem:(id)a4 bounceReason:(int)a5;
- (void)analyzeBouncingOfItem:(id)a3 withTemplateItem:(id)a4;
- (void)close;
- (void)reportInitialScanItemTypeMismatch:(id)a3;
@end

@implementation BRCBouncingAnalyzer

- (BRCBouncingAnalyzer)initWithTapToRadarManager:(id)a3 analyticsReporter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCBouncingAnalyzer;
  v9 = [(BRCBouncingAnalyzer *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tapToRadarManager, a3);
    objc_storeStrong((id *)&v10->_analyticsReporter, a4);
  }

  return v10;
}

- (void)close
{
  tapToRadarManager = self->_tapToRadarManager;
  self->_tapToRadarManager = 0;

  analyticsReporter = self->_analyticsReporter;
  self->_analyticsReporter = 0;
}

- (void)reportInitialScanItemTypeMismatch:(id)a3
{
  id v4 = a3;
  v5 = +[BRCAutoBugCaptureReporter sharedABCReporter];
  [v5 captureLogsForOperationType:@"SyncHealth" ofSubtype:@"InitialScanBounce" forError:0];

  [(BRCAnalyticsReporter *)self->_analyticsReporter aggregateReportForAppTelemetryIdentifier:300 error:0];
  v6 = NSString;
  id v7 = [v4 itemID];

  id v10 = [v6 stringWithFormat:@"Item %@ type was not compatible with local initial scan item", v7];

  tapToRadarManager = self->_tapToRadarManager;
  v9 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInitialScanItemTypeMismatch");
  [(BRCTapToRadarManager *)tapToRadarManager requestTapToRadarWithTitle:@"[Bouncing] Initial scan item type mismatch" description:v10 keywords:MEMORY[0x263EFFA68] attachments:MEMORY[0x263EFFA68] sendFullLog:1 displayReason:@"type mismatch between server and client item during reimport" triggerRootCause:v9];
}

- (BOOL)analyzeServerBouncingOriginalRecord:(id)a3 savedRecord:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 recordType];
  int v9 = [v8 isEqualToString:@"structure"];

  if (v9)
  {
    id v33 = 0;
    id location = 0;
    id v31 = 0;
    id v32 = 0;
    id v29 = 0;
    id v30 = 0;
    if (![v6 deserializeFilename:0 basename:&location bounceno:&v33 extension:&v32 userInfo:0 error:0]|| !objc_msgSend(v7, "deserializeFilename:basename:bounceno:extension:userInfo:error:", 0, &v31, &v30, &v29, 0, 0))
    {
      goto LABEL_21;
    }
    id v10 = brc_bread_crumbs();
    v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v28 = [v6 recordID];
      *(_DWORD *)buf = 138414082;
      v36 = v28;
      __int16 v37 = 2112;
      id v38 = location;
      __int16 v39 = 2112;
      id v40 = v33;
      __int16 v41 = 2112;
      id v42 = v32;
      __int16 v43 = 2112;
      id v44 = v31;
      __int16 v45 = 2112;
      id v46 = v30;
      __int16 v47 = 2112;
      id v48 = v29;
      __int16 v49 = 2112;
      v50 = v10;
      _os_log_debug_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] RecordID: %@ orig:<baseName: %@ bounceNo: %@ extension: %@> -> saved:<baseName: %@ bounceNo: %@ extension: %@>%@", buf, 0x52u);
    }
    id v12 = location ? location : &stru_26F3822F0;
    objc_storeStrong(&location, v12);
    id v13 = v31 ? v31 : &stru_26F3822F0;
    objc_storeStrong(&v31, v13);
    id v14 = v32 ? v32 : &stru_26F3822F0;
    objc_storeStrong(&v32, v14);
    id v15 = v29 ? v29 : &stru_26F3822F0;
    objc_storeStrong(&v29, v15);
    if ([location isEqualToString:v31]
      && [v32 isEqualToString:v29]
      && (objc_msgSend(v33, "br_isEqualToNumber:", v30) & 1) == 0)
    {
      v18 = brc_bread_crumbs();
      v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[BRCBouncingAnalyzer analyzeServerBouncingOriginalRecord:savedRecord:](v6, (uint64_t)v18, v19);
      }

      v20 = +[BRCAutoBugCaptureReporter sharedABCReporter];
      [v20 captureLogsForOperationType:@"SyncHealth" ofSubtype:@"ServerBouncedItem" forError:0];

      v21 = [v6 pluginFields];
      v22 = [v21 objectForKeyedSubscript:@"br_initialItem"];

      if (v22)
      {
        v23 = NSString;
        v24 = [v6 recordID];
        v25 = [v23 stringWithFormat:@"Item %@ got bounced by server after being set that it is from initial scan", v24];

        tapToRadarManager = self->_tapToRadarManager;
        v27 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorRecordBouncedByServer");
        BOOL v16 = 1;
        [(BRCTapToRadarManager *)tapToRadarManager requestTapToRadarWithTitle:@"[Bouncing] Initial scan item got bounced by server" description:v25 keywords:MEMORY[0x263EFFA68] attachments:MEMORY[0x263EFFA68] sendFullLog:1 displayReason:@"reimported item got bounced by server" triggerRootCause:v27];
      }
      else
      {
        BOOL v16 = 1;
      }
    }
    else
    {
LABEL_21:
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)analyzeServerBouncingOfItem:(id)a3 withServerItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && [v7 isLive])
  {
    uint64_t v30 = 0;
    int v9 = [v6 st];
    id v10 = [v9 logicalNameWithoutLocalBounce];
    id v29 = 0;
    objc_msgSend(v10, "br_stringByDeletingPathBounceNo:andPathExtension:", &v30, &v29);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v12 = (__CFString *)v29;

    if (v11) {
      id v13 = v11;
    }
    else {
      id v13 = &stru_26F3822F0;
    }
    id v14 = v13;

    if (v12) {
      id v15 = v12;
    }
    else {
      id v15 = &stru_26F3822F0;
    }
    BOOL v16 = v15;

    uint64_t v28 = 0;
    v17 = [v8 st];
    v18 = [v17 logicalName];
    id v27 = 0;
    objc_msgSend(v18, "br_stringByDeletingPathBounceNo:andPathExtension:", &v28, &v27);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v20 = (__CFString *)v27;

    if (v19) {
      v21 = v19;
    }
    else {
      v21 = &stru_26F3822F0;
    }
    v22 = v21;

    if (v20) {
      v23 = v20;
    }
    else {
      v23 = &stru_26F3822F0;
    }
    v24 = v23;

    if ([(__CFString *)v14 isEqualToString:v22]
      && [(__CFString *)v16 isEqualToString:v24]
      && v30 != v28)
    {
      [(BRCAnalyticsReporter *)self->_analyticsReporter aggregateReportForAppTelemetryIdentifier:503 error:0];
      BOOL v25 = 1;
    }
    else
    {
      BOOL v25 = 0;
    }
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)_isGenericUntitledFileName:(id)a3
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  v5 = [v3 bundleForClass:objc_opt_class()];
  id v6 = _BRLocalizedStringWithFormat();
  id v7 = [v6 localizedLowercaseString];

  id v8 = [v4 st];

  int v9 = [v8 logicalName];
  id v10 = [v9 localizedLowercaseString];

  LOBYTE(v8) = [v10 hasPrefix:v7];
  return (char)v8;
}

- (int)analyzeBouncingOfItem:(id)a3 withServerItem:(id)a4 bounceReason:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 == 501)
  {
    if ([v8 isDead])
    {
      a5 = 513;
    }
    else if ([v8 isFromInitialScan])
    {
      a5 = 517;
    }
    else if ([v8 isKnownByServer])
    {
      if (([v8 localDiffs] & 0x20) != 0)
      {
        a5 = 515;
      }
      else if (([v8 localDiffs] & 0x40) != 0)
      {
        a5 = 516;
      }
      else if ([(BRCBouncingAnalyzer *)self _isGenericUntitledFileName:v9])
      {
        if [v8 isChildSharedItem] && (objc_msgSend(v9, "isChildSharedItem")) {
          a5 = 518;
        }
        else {
          a5 = 519;
        }
      }
      else
      {
        a5 = 501;
      }
    }
    else
    {
      if ([v8 isDirectory] && objc_msgSend(v9, "isDirectory"))
      {
        id v10 = +[BRCAutoBugCaptureReporter sharedABCReporter];
        [v10 captureLogsForOperationType:@"SyncHealth" ofSubtype:@"CollidingDirectoryApplyNotKnownByServerBounce" forError:0];

        v11 = NSString;
        id v12 = [v8 itemID];
        id v13 = [v11 stringWithFormat:@"Directory %@ got bounced due to a colliding new directory applied on server", v12];

        tapToRadarManager = self->_tapToRadarManager;
        id v15 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorBouncedItemNotKnownByServer");
        [(BRCTapToRadarManager *)tapToRadarManager requestTapToRadarWithTitle:@"[Bouncing] Directory name collision when applying from server" description:v13 keywords:MEMORY[0x263EFFA68] attachments:MEMORY[0x263EFFA68] sendFullLog:1 displayReason:@"directory bounced due to a new directory applied from server" triggerRootCause:v15];
      }
      a5 = 514;
    }
  }

  return a5;
}

- (void)analyzeBouncingOfItem:(id)a3 withTemplateItem:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if ([v15 isDirectory])
  {
    id v7 = [v6 contentType];
    int v8 = objc_msgSend(v7, "br_isDirectoryType");

    if (v8)
    {
      id v9 = +[BRCAutoBugCaptureReporter sharedABCReporter];
      [v9 captureLogsForOperationType:@"SyncHealth" ofSubtype:@"CollidingDirectoryBounceInFPCreate" forError:0];

      id v10 = NSString;
      v11 = [v15 itemID];
      id v12 = [v10 stringWithFormat:@"Directory %@ got bounced due to a colliding new directory created on disk", v11];

      tapToRadarManager = self->_tapToRadarManager;
      id v14 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInitialScanItemBouncedByServer");
      [(BRCTapToRadarManager *)tapToRadarManager requestTapToRadarWithTitle:@"[Bouncing] Directory name collision when creating new item" description:v12 keywords:MEMORY[0x263EFFA68] attachments:MEMORY[0x263EFFA68] sendFullLog:1 displayReason:@"directory bounced due to a new directory created on disk" triggerRootCause:v14];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_tapToRadarManager, 0);
}

- (void)analyzeServerBouncingOriginalRecord:(NSObject *)a3 savedRecord:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = [a1 recordID];
  id v7 = [a1 pluginFields];
  int v8 = 138412802;
  id v9 = v6;
  __int16 v10 = 2112;
  v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_debug_impl(&dword_23FA42000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Server bounced record %@. Plugin fields: %@%@", (uint8_t *)&v8, 0x20u);
}

@end