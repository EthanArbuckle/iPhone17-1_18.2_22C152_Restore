@interface BRCTapToRadarManager
- (BRCTapToRadarManager)initWithNamedThrottleManager:(id)a3;
- (id)_ttrThrottlingRulesForIdentifier:(id)a3;
- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 keywords:(id)a8 attachments:(id)a9 sendFullLog:(BOOL)a10 displayReason:(id)a11 triggerRootCause:(id)a12;
- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 keywords:(id)a8 attachments:(id)a9 sendFullLog:(BOOL)a10 displayReason:(id)a11 triggerRootCause:(id)a12 completionHandler:(id)a13;
- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 keywords:(id)a5 attachments:(id)a6 sendFullLog:(BOOL)a7 displayReason:(id)a8 triggerRootCause:(id)a9;
- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 keywords:(id)a5 attachments:(id)a6 sendFullLog:(BOOL)a7 displayReason:(id)a8 triggerRootCause:(id)a9 completionHandler:(id)a10;
@end

@implementation BRCTapToRadarManager

- (BRCTapToRadarManager)initWithNamedThrottleManager:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BRCTapToRadarManager;
  v6 = [(BRCTapToRadarManager *)&v12 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.clouddocs.ttr-queue", v8);

    executionQueue = v6->_executionQueue;
    v6->_executionQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_namedThrottleManager, a3);
  }

  return v6;
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 keywords:(id)a5 attachments:(id)a6 sendFullLog:(BOOL)a7 displayReason:(id)a8 triggerRootCause:(id)a9
{
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 keywords:(id)a5 attachments:(id)a6 sendFullLog:(BOOL)a7 displayReason:(id)a8 triggerRootCause:(id)a9 completionHandler:(id)a10
{
  LOBYTE(v10) = a7;
  [(BRCTapToRadarManager *)self requestTapToRadarWithTitle:a3 description:a4 componentName:@"CloudDocs" componentVersion:@"All" componentID:554159 keywords:a5 attachments:a6 sendFullLog:v10 displayReason:a8 triggerRootCause:a9 completionHandler:a10];
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 keywords:(id)a8 attachments:(id)a9 sendFullLog:(BOOL)a10 displayReason:(id)a11 triggerRootCause:(id)a12
{
  LOBYTE(v12) = a10;
  [(BRCTapToRadarManager *)self requestTapToRadarWithTitle:a3 description:a4 componentName:a5 componentVersion:a6 componentID:a7 keywords:a8 attachments:a9 sendFullLog:v12 displayReason:a11 triggerRootCause:a12 completionHandler:0];
}

- (id)_ttrThrottlingRulesForIdentifier:(id)a3
{
  id v3 = a3;
  v4 = +[BRCUserDefaults defaultsForMangledID:0];
  id v5 = [v4 weeklyThrottledErrorsForTTR];
  int v6 = [v5 containsObject:v3];

  if (v6) {
    [v4 tapToRadarWeeklyThrottleRules];
  }
  else {
  v7 = [v4 tapToRadarDailyThrottleRules];
  }

  return v7;
}

- (void)requestTapToRadarWithTitle:(id)a3 description:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(int64_t)a7 keywords:(id)a8 attachments:(id)a9 sendFullLog:(BOOL)a10 displayReason:(id)a11 triggerRootCause:(id)a12 completionHandler:(id)a13
{
  id v44 = a3;
  id v45 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a11;
  id v23 = a12;
  if (a13) {
    id v24 = a13;
  }
  else {
    id v24 = &__block_literal_global_27;
  }
  v25 = (void (**)(void, void))MEMORY[0x2455D9A50](v24);
  id v43 = v23;
  if ([MEMORY[0x263F32628] isInternalBuild])
  {
    +[BRCUserDefaults generateThrottleTTRIdentifiersForTriggerRootCause:v23];
    v27 = v26 = v18;
    namedThrottleManager = self->_namedThrottleManager;
    [(id)objc_opt_class() description];
    v28 = v41 = v19;
    [(BRCTapToRadarManager *)self _ttrThrottlingRulesForIdentifier:v27];
    v29 = v40 = v25;
    executionQueue = self->_executionQueue;
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_14;
    v46[3] = &unk_265082540;
    v55 = v25;
    id v47 = v26;
    id v48 = v27;
    id v49 = v44;
    id v50 = v45;
    id v51 = v41;
    int64_t v56 = a7;
    BOOL v57 = a10;
    v30 = v20;
    id v52 = v20;
    id v53 = v21;
    id v54 = v22;
    id v31 = v27;
    id v18 = v26;
    id v32 = v31;
    [(BRCNamedThrottleManager *)namedThrottleManager throttle:v28 subCategory:v31 withRules:v29 onQueue:executionQueue block:v46];

    v33 = v43;
    id v19 = v41;

    v34 = v44;
    v35 = v40;
  }
  else
  {
    v30 = v20;
    v34 = v44;
    v36 = brc_bread_crumbs();
    v37 = brc_default_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      -[BRCTapToRadarManager requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:]();
    }

    objc_msgSend(MEMORY[0x263F087E8], "brc_errorNotSupportedInCustomerBuild");
    id v32 = (id)objc_claimAutoreleasedReturnValue();
    v35 = v25;
    ((void (**)(void, id))v25)[2](v25, v32);
    v33 = v43;
  }
}

void __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_14_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_16;
    v14 = &unk_265082518;
    id v22 = *(id *)(a1 + 96);
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    id v17 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 64);
    uint64_t v9 = *(void *)(a1 + 104);
    id v18 = v8;
    uint64_t v23 = v9;
    char v24 = *(unsigned char *)(a1 + 112);
    id v19 = *(id *)(a1 + 72);
    id v20 = *(id *)(a1 + 80);
    id v21 = *(id *)(a1 + 88);
    uint64_t v10 = +[BRCloudTelemetryTTRDecisionRequest requestWithSenderID:v6 ruleID:v7 completionHandler:&v11];
    objc_msgSend(v10, "resume", v11, v12, v13, v14);
  }
}

void __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_16(uint64_t a1, char a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    if (a2)
    {
      id v8 = brc_bread_crumbs();
      uint64_t v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_16_cold_1();
      }

      if (getRadarDraftClass() && getRadarComponentClass() && getTapToRadarServiceClass())
      {
        getRadarDraftClass();
        uint64_t v10 = objc_opt_new();
        [v10 setTitle:*(void *)(a1 + 32)];
        [v10 setProblemDescription:*(void *)(a1 + 40)];
        [v10 setClassification:2];
        [v10 setReproducibility:6];
        uint64_t v11 = (void *)[objc_alloc(getRadarComponentClass()) initWithName:*(void *)(a1 + 48) version:*(void *)(a1 + 56) identifier:*(void *)(a1 + 96)];
        [v10 setComponent:v11];

        if (*(unsigned char *)(a1 + 104)) {
          uint64_t v12 = 6;
        }
        else {
          uint64_t v12 = 0;
        }
        [v10 setAutoDiagnostics:v12];
        [v10 setIsUserInitiated:0];
        [v10 setKeywords:*(void *)(a1 + 64)];
        [v10 setAttachments:*(void *)(a1 + 72)];
        [v10 setDeleteOnAttach:1];
        v13 = [(objc_class *)getTapToRadarServiceClass() shared];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_26;
        v19[3] = &unk_265081478;
        uint64_t v14 = *(void *)(a1 + 80);
        id v20 = *(id *)(a1 + 88);
        [v13 createDraft:v10 forProcessNamed:@"iCloud Drive" withDisplayReason:v14 completionHandler:v19];

        goto LABEL_20;
      }
      id v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v17;
        _os_log_impl(&dword_23FA42000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed gathering TapToRadarKit%@", buf, 0xCu);
      }

      uint64_t v15 = *(void *)(a1 + 88);
      uint64_t v16 = objc_msgSend(MEMORY[0x263F087E8], "brc_unkownErrorWithDescription:", @"Failed gathering TapToRadarKit");
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 88);
      uint64_t v16 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorThrottledWithDescription:", @"Throttled by cloud telemetry");
    }
    uint64_t v10 = (void *)v16;
    (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v15, v16);
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_16_cold_2();
  }

  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
LABEL_21:
}

void __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      id v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v4;
      _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Tap to radar returned error: (%@)%@", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_26_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedThrottleManager, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
}

- (void)requestTapToRadarWithTitle:description:componentName:componentVersion:componentID:keywords:attachments:sendFullLog:displayReason:triggerRootCause:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Not internal build, ignoring tap to radar request%@", v2, v3, v4, v5, v6);
}

void __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_14_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Tap To Radar was throttled%@", v2, v3, v4, v5, v6);
}

void __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_16_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Creating a radar draft request%@", v2, v3, v4, v5, v6);
}

void __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_16_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] TTR Server Decision failed%@", v2, v3, v4, v5, v6);
}

void __188__BRCTapToRadarManager_requestTapToRadarWithTitle_description_componentName_componentVersion_componentID_keywords_attachments_sendFullLog_displayReason_triggerRootCause_completionHandler___block_invoke_26_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_23FA42000, v0, v1, "[DEBUG] Tap to radar returned successfuly%@", v2, v3, v4, v5, v6);
}

@end