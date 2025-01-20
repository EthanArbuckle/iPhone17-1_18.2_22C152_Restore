@interface WFDiagnosticsManager
- (NSArray)customTestRequests;
- (NSArray)noInternetTestRequests;
- (W5Client)client;
- (WFDiagnosticsManager)init;
- (WFDiagnosticsManager)initWithCustomTests:(id)a3;
- (id)_joinFailureDiagnosticsResultFromW5Results:(id)a3;
- (id)_noInternetDiagnosticsResultFromW5Results:(id)a3;
- (id)joinFailureTestRequestsFor:(id)a3;
- (void)runCustomDiagnosticsFor:(id)a3 withUpdate:(id)a4 result:(id)a5;
- (void)runJoinFailureDiagnosticsFor:(id)a3 withUpdate:(id)a4 result:(id)a5;
- (void)runNoInternetDiagnosticsFor:(id)a3 withUpdate:(id)a4 result:(id)a5;
- (void)setClient:(id)a3;
- (void)setCustomTestRequests:(id)a3;
- (void)setNoInternetTestRequests:(id)a3;
@end

@implementation WFDiagnosticsManager

- (WFDiagnosticsManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFDiagnosticsManager;
  v2 = [(WFDiagnosticsManager *)&v7 init];
  if (v2)
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x2050000000;
    v3 = (void *)getW5ClientClass_softClass_0;
    uint64_t v12 = getW5ClientClass_softClass_0;
    if (!getW5ClientClass_softClass_0)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __getW5ClientClass_block_invoke_0;
      v8[3] = &unk_26478E338;
      v8[4] = &v9;
      __getW5ClientClass_block_invoke_0((uint64_t)v8);
      v3 = (void *)v10[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v9, 8);
    v5 = [v4 sharedClient];
    [(WFDiagnosticsManager *)v2 setClient:v5];
  }
  return v2;
}

- (WFDiagnosticsManager)initWithCustomTests:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(WFDiagnosticsManager *)self init];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(getW5DiagnosticsTestRequestClass(), "requestWithTestID:configuration:", (int)objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "intValue", (void)v14), 0);
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [(WFDiagnosticsManager *)v5 setCustomTestRequests:v6];
  return v5;
}

- (id)joinFailureTestRequestsFor:(id)a3
{
  v10[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [getW5DiagnosticsTestRequestClass() requestWithTestID:24 configuration:0];
  if (v3)
  {
    v5 = objc_opt_new();
    [v5 setObject:v3 forKeyedSubscript:@"NetworkName"];
    uint64_t v6 = [getW5DiagnosticsTestRequestClass() requestWithTestID:24 configuration:v5];

    id v4 = (void *)v6;
  }
  id v7 = [getW5DiagnosticsTestRequestClass() requestWithTestID:19 configuration:0];
  v10[0] = v7;
  v10[1] = v4;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

  return v8;
}

- (NSArray)noInternetTestRequests
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  id v3 = [NSNumber numberWithInt:5];
  [v2 setObject:v3 forKeyedSubscript:@"Timeout"];

  id v4 = [getW5DiagnosticsTestRequestClass() requestWithTestID:11 configuration:v2];
  v7[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  return (NSArray *)v5;
}

- (id)_joinFailureDiagnosticsResultFromW5Results:(id)a3
{
  id v3 = a3;
  id v4 = [[WFDiagnosticsResultItemBT alloc] initWithResults:v3];
  v5 = v4;
  if (v4 && ![(WFDiagnosticsResultItemBT *)v4 didPassTest])
  {
    uint64_t v9 = v5;
    uint64_t v8 = v9;
  }
  else
  {
    uint64_t v6 = [[WFDiagnosticsResultItemCongestion alloc] initWithResults:v3];
    id v7 = v6;
    if (v6 && ![(WFDiagnosticsResultItemCongestion *)v6 didPassTest])
    {
      uint64_t v9 = v7;
      uint64_t v8 = v9;
    }
    else
    {
      uint64_t v8 = [[WFDiagnosticsResultItemTestPass alloc] initWithResults:v3];
      uint64_t v9 = 0;
    }
  }
  return v8;
}

- (id)_noInternetDiagnosticsResultFromW5Results:(id)a3
{
  id v3 = a3;
  id v4 = [[WFDiagnosticsResultItemNoInternet alloc] initWithResults:v3];

  return v4;
}

- (void)runCustomDiagnosticsFor:(id)a3 withUpdate:(id)a4 result:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(WFDiagnosticsManager *)self customTestRequests];
  BOOL v12 = [v11 count] == 0;

  v13 = WFLogForCategory(0);
  if (v12)
  {
    os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v13 && os_log_type_enabled(v13, v18))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v13, v18, "No test requests to run.", buf, 2u);
    }
  }
  else
  {
    int v14 = OSLogForWFLogLevel(3uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 3 && v13 && os_log_type_enabled(v13, (os_log_type_t)v14))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[WFDiagnosticsManager runCustomDiagnosticsFor:withUpdate:result:]";
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_226071000, v13, (os_log_type_t)v14, "%s: Running a Custom test for %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    client = self->_client;
    customTestRequests = self->_customTestRequests;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __66__WFDiagnosticsManager_runCustomDiagnosticsFor_withUpdate_result___block_invoke;
    v23[3] = &unk_26478F6C0;
    id v24 = v9;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __66__WFDiagnosticsManager_runCustomDiagnosticsFor_withUpdate_result___block_invoke_3;
    v19[3] = &unk_26478F710;
    id v20 = v8;
    objc_copyWeak(&v22, (id *)buf);
    id v21 = v10;
    id v17 = (id)[(W5Client *)client runDiagnostics:customTestRequests configuration:0 update:v23 reply:v19];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

void __66__WFDiagnosticsManager_runCustomDiagnosticsFor_withUpdate_result___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__WFDiagnosticsManager_runCustomDiagnosticsFor_withUpdate_result___block_invoke_2;
  v6[3] = &unk_26478EFE0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __66__WFDiagnosticsManager_runCustomDiagnosticsFor_withUpdate_result___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __66__WFDiagnosticsManager_runCustomDiagnosticsFor_withUpdate_result___block_invoke_3(id *a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7)
  {
    id v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      id v10 = a1[4];
      *(_DWORD *)buf = 138412546;
      v46 = v10;
      __int16 v47 = 2048;
      uint64_t v48 = [v6 count];
      _os_log_impl(&dword_226071000, v9, v8, "Custom test for %@ completed with %lu raw results", buf, 0x16u);
    }
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  BOOL v12 = [WeakRetained _joinFailureDiagnosticsResultFromW5Results:v6];

  if (!v12 || [v12 didPassTest])
  {
    id v13 = objc_loadWeakRetained(a1 + 6);
    uint64_t v14 = [v13 _noInternetDiagnosticsResultFromW5Results:v6];

    BOOL v12 = (void *)v14;
  }
  id v15 = objc_loadWeakRetained(a1 + 6);

  if (v15 && v12)
  {
    long long v16 = +[WFMetricsManager sharedManager];
    id v17 = [WFDiagnosticsEvent alloc];
    uint64_t v18 = [v12 didPassTest];
    uint64_t v19 = [v12 failedTests];
    id v20 = [(WFDiagnosticsEvent *)v17 initWithDiagnosticsEventType:2 didPassTest:v18 failedTests:v19];
    [v16 processEvent:v20];

LABEL_33:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__WFDiagnosticsManager_runCustomDiagnosticsFor_withUpdate_result___block_invoke_21;
    block[3] = &unk_26478F6E8;
    v39 = a1[5];
    id v36 = v5;
    id v37 = v12;
    id v38 = a1[4];
    dispatch_async(MEMORY[0x263EF83A0], block);

    v32 = v39;
    goto LABEL_34;
  }
  id v21 = objc_loadWeakRetained(a1 + 6);

  if (v21)
  {
    if (v12) {
      goto LABEL_33;
    }
    id v34 = v5;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v22 = v6;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v41;
      v26 = &stru_26D9BFD58;
      do
      {
        uint64_t v27 = 0;
        id v28 = v26;
        do
        {
          if (*(void *)v41 != v25) {
            objc_enumerationMutation(v22);
          }
          v26 = [v28 stringByAppendingFormat:@"\n%@", *(void *)(*((void *)&v40 + 1) + 8 * v27)];

          ++v27;
          id v28 = v26;
        }
        while (v24 != v27);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v24);
    }
    else
    {
      v26 = &stru_26D9BFD58;
    }

    v30 = WFLogForCategory(0);
    os_log_type_t v31 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v30 && os_log_type_enabled(v30, v31))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v26;
      _os_log_impl(&dword_226071000, v30, v31, "Custom diagnostics result failed to generate from raw results: %@", buf, 0xCu);
    }

    id v5 = v34;
  }
  else
  {
    v26 = WFLogForCategory(0);
    os_log_type_t v29 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v26 && os_log_type_enabled(v26, v29))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v26, v29, "Test finished after WFDiagnosticsMananger deallocated!", buf, 2u);
    }
  }

  if (v12) {
    goto LABEL_33;
  }
  v32 = WFLogForCategory(0);
  os_log_type_t v33 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v32 && os_log_type_enabled(v32, v33))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226071000, v32, v33, "Empty custom diagnostics result, discarding result callback!", buf, 2u);
  }
LABEL_34:
}

uint64_t __66__WFDiagnosticsManager_runCustomDiagnosticsFor_withUpdate_result___block_invoke_21(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)runJoinFailureDiagnosticsFor:(id)a3 withUpdate:(id)a4 result:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(WFDiagnosticsManager *)self joinFailureTestRequestsFor:v8];
  objc_initWeak(&location, self);
  BOOL v12 = WFLogForCategory(0);
  os_log_type_t v13 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v12 && os_log_type_enabled(v12, v13))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = "-[WFDiagnosticsManager runJoinFailureDiagnosticsFor:withUpdate:result:]";
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl(&dword_226071000, v12, v13, "%s: Running a Join Failure test for %@", buf, 0x16u);
  }

  uint64_t v14 = [(WFDiagnosticsManager *)self client];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __71__WFDiagnosticsManager_runJoinFailureDiagnosticsFor_withUpdate_result___block_invoke;
  v23[3] = &unk_26478F6C0;
  id v15 = v9;
  id v24 = v15;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __71__WFDiagnosticsManager_runJoinFailureDiagnosticsFor_withUpdate_result___block_invoke_3;
  v19[3] = &unk_26478F710;
  id v16 = v8;
  id v20 = v16;
  objc_copyWeak(&v22, &location);
  id v17 = v10;
  id v21 = v17;
  id v18 = (id)[v14 runDiagnostics:v11 configuration:0 update:v23 reply:v19];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __71__WFDiagnosticsManager_runJoinFailureDiagnosticsFor_withUpdate_result___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __71__WFDiagnosticsManager_runJoinFailureDiagnosticsFor_withUpdate_result___block_invoke_2;
  v6[3] = &unk_26478EFE0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __71__WFDiagnosticsManager_runJoinFailureDiagnosticsFor_withUpdate_result___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __71__WFDiagnosticsManager_runJoinFailureDiagnosticsFor_withUpdate_result___block_invoke_3(id *a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7)
  {
    id v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      id v10 = a1[4];
      *(_DWORD *)buf = 138412546;
      v44 = v10;
      __int16 v45 = 2048;
      uint64_t v46 = [v6 count];
      _os_log_impl(&dword_226071000, v9, v8, "Join Failure test for %@ completed with %lu raw results", buf, 0x16u);
    }
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  BOOL v12 = [WeakRetained _joinFailureDiagnosticsResultFromW5Results:v6];

  id v13 = objc_loadWeakRetained(a1 + 6);
  if (v13 && v12)
  {
    uint64_t v14 = +[WFMetricsManager sharedManager];
    id v15 = [WFDiagnosticsEvent alloc];
    uint64_t v16 = [v12 didPassTest];
    id v17 = [v12 failedTests];
    id v18 = [(WFDiagnosticsEvent *)v15 initWithDiagnosticsEventType:0 didPassTest:v16 failedTests:v17];
    [v14 processEvent:v18];

LABEL_30:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__WFDiagnosticsManager_runJoinFailureDiagnosticsFor_withUpdate_result___block_invoke_23;
    block[3] = &unk_26478F6E8;
    id v37 = a1[5];
    id v34 = v5;
    id v35 = v12;
    id v36 = a1[4];
    dispatch_async(MEMORY[0x263EF83A0], block);

    uint64_t v30 = v37;
    goto LABEL_31;
  }
  id v19 = objc_loadWeakRetained(a1 + 6);

  if (v19)
  {
    if (v12) {
      goto LABEL_30;
    }
    id v32 = v5;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v20 = v6;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v39;
      id v24 = &stru_26D9BFD58;
      do
      {
        uint64_t v25 = 0;
        v26 = v24;
        do
        {
          if (*(void *)v39 != v23) {
            objc_enumerationMutation(v20);
          }
          id v24 = [v26 stringByAppendingFormat:@"\n%@", *(void *)(*((void *)&v38 + 1) + 8 * v25)];

          ++v25;
          v26 = v24;
        }
        while (v22 != v25);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v22);
    }
    else
    {
      id v24 = &stru_26D9BFD58;
    }

    __int16 v28 = WFLogForCategory(0);
    os_log_type_t v29 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v28 && os_log_type_enabled(v28, v29))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v24;
      _os_log_impl(&dword_226071000, v28, v29, "Join Failure diagnostics result failed to generate from raw results: %@", buf, 0xCu);
    }

    id v5 = v32;
  }
  else
  {
    id v24 = WFLogForCategory(0);
    os_log_type_t v27 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v24 && os_log_type_enabled(v24, v27))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v24, v27, "Test finished after WFDiagnosticsMananger deallocated!", buf, 2u);
    }
  }

  if (v12) {
    goto LABEL_30;
  }
  uint64_t v30 = WFLogForCategory(0);
  os_log_type_t v31 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v30 && os_log_type_enabled(v30, v31))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226071000, v30, v31, "Empty join failure diagnostics result, discarding result callback!", buf, 2u);
  }
LABEL_31:
}

uint64_t __71__WFDiagnosticsManager_runJoinFailureDiagnosticsFor_withUpdate_result___block_invoke_23(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (void)runNoInternetDiagnosticsFor:(id)a3 withUpdate:(id)a4 result:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  uint64_t v11 = WFLogForCategory(0);
  os_log_type_t v12 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v11 && os_log_type_enabled(v11, v12))
  {
    *(_DWORD *)buf = 136315394;
    os_log_type_t v27 = "-[WFDiagnosticsManager runNoInternetDiagnosticsFor:withUpdate:result:]";
    __int16 v28 = 2112;
    id v29 = v8;
    _os_log_impl(&dword_226071000, v11, v12, "%s: Running a No Internet test for %@", buf, 0x16u);
  }

  id v13 = [(WFDiagnosticsManager *)self client];
  uint64_t v14 = [(WFDiagnosticsManager *)self noInternetTestRequests];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __70__WFDiagnosticsManager_runNoInternetDiagnosticsFor_withUpdate_result___block_invoke;
  v23[3] = &unk_26478F6C0;
  id v15 = v9;
  id v24 = v15;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __70__WFDiagnosticsManager_runNoInternetDiagnosticsFor_withUpdate_result___block_invoke_3;
  v19[3] = &unk_26478F710;
  id v16 = v8;
  id v20 = v16;
  objc_copyWeak(&v22, &location);
  id v17 = v10;
  id v21 = v17;
  id v18 = (id)[v13 runDiagnostics:v14 configuration:0 update:v23 reply:v19];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __70__WFDiagnosticsManager_runNoInternetDiagnosticsFor_withUpdate_result___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__WFDiagnosticsManager_runNoInternetDiagnosticsFor_withUpdate_result___block_invoke_2;
  v6[3] = &unk_26478EFE0;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __70__WFDiagnosticsManager_runNoInternetDiagnosticsFor_withUpdate_result___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __70__WFDiagnosticsManager_runNoInternetDiagnosticsFor_withUpdate_result___block_invoke_3(id *a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = WFLogForCategory(0);
  os_log_type_t v8 = OSLogForWFLogLevel(3uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 3 && v7)
  {
    id v9 = v7;
    if (os_log_type_enabled(v9, v8))
    {
      id v10 = a1[4];
      *(_DWORD *)buf = 138412546;
      v44 = v10;
      __int16 v45 = 2048;
      uint64_t v46 = [v6 count];
      _os_log_impl(&dword_226071000, v9, v8, "No Internet test for %@ completed with %lu raw results", buf, 0x16u);
    }
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  os_log_type_t v12 = [WeakRetained _noInternetDiagnosticsResultFromW5Results:v6];

  id v13 = objc_loadWeakRetained(a1 + 6);
  if (v13 && v12)
  {
    uint64_t v14 = +[WFMetricsManager sharedManager];
    id v15 = [WFDiagnosticsEvent alloc];
    uint64_t v16 = [v12 didPassTest];
    id v17 = [v12 failedTests];
    id v18 = [(WFDiagnosticsEvent *)v15 initWithDiagnosticsEventType:1 didPassTest:v16 failedTests:v17];
    [v14 processEvent:v18];

LABEL_30:
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__WFDiagnosticsManager_runNoInternetDiagnosticsFor_withUpdate_result___block_invoke_24;
    block[3] = &unk_26478F6E8;
    id v37 = a1[5];
    id v34 = v5;
    id v35 = v12;
    id v36 = a1[4];
    dispatch_async(MEMORY[0x263EF83A0], block);

    uint64_t v30 = v37;
    goto LABEL_31;
  }
  id v19 = objc_loadWeakRetained(a1 + 6);

  if (v19)
  {
    if (v12) {
      goto LABEL_30;
    }
    id v32 = v5;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v20 = v6;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v39;
      id v24 = &stru_26D9BFD58;
      do
      {
        uint64_t v25 = 0;
        v26 = v24;
        do
        {
          if (*(void *)v39 != v23) {
            objc_enumerationMutation(v20);
          }
          id v24 = [v26 stringByAppendingFormat:@"\n%@", *(void *)(*((void *)&v38 + 1) + 8 * v25)];

          ++v25;
          v26 = v24;
        }
        while (v22 != v25);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v22);
    }
    else
    {
      id v24 = &stru_26D9BFD58;
    }

    __int16 v28 = WFLogForCategory(0);
    os_log_type_t v29 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v28 && os_log_type_enabled(v28, v29))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v24;
      _os_log_impl(&dword_226071000, v28, v29, "No Internet diagnostics result failed to generate from raw results: %@", buf, 0xCu);
    }

    id v5 = v32;
  }
  else
  {
    id v24 = WFLogForCategory(0);
    os_log_type_t v27 = OSLogForWFLogLevel(4uLL);
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v24 && os_log_type_enabled(v24, v27))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226071000, v24, v27, "Test finished after WFDiagnosticsMananger deallocated!", buf, 2u);
    }
  }

  if (v12) {
    goto LABEL_30;
  }
  uint64_t v30 = WFLogForCategory(0);
  os_log_type_t v31 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v30 && os_log_type_enabled(v30, v31))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226071000, v30, v31, "Empty no internet diagnostics result, discarding result callback!", buf, 2u);
  }
LABEL_31:
}

uint64_t __70__WFDiagnosticsManager_runNoInternetDiagnosticsFor_withUpdate_result___block_invoke_24(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (W5Client)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (NSArray)customTestRequests
{
  return self->_customTestRequests;
}

- (void)setCustomTestRequests:(id)a3
{
}

- (void)setNoInternetTestRequests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noInternetTestRequests, 0);
  objc_storeStrong((id *)&self->_customTestRequests, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end