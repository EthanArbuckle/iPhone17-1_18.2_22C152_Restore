@interface SVXTapToRadarManager
+ (id)sharedInstance;
+ (id)sharedInstanceWithRadarFiler:(id)a3;
- (BOOL)_hasFileTTRWithIssue:(id)a3;
- (BOOL)_hasFileTTRWithRequestID:(id)a3;
- (BOOL)_skipFirstTimeTTR:(id)a3;
- (NSString)getRecognitionText;
- (id)_initWithRadarFiler:(id)a3;
- (id)getDomainFatalIssueDialogIdentifiers;
- (id)getEarlyCutoffUtterances;
- (id)getRMVIssueDialogIdentifiers;
- (id)getWebSearchIssueDialogIdentifiers;
- (void)_updateRequestID:(id)a3;
- (void)_updateTTRHistory:(id)a3;
- (void)createProblem:(id)a3 extraContent:(id)a4 completionHandler:(id)a5;
- (void)setRecognitionText:(id)a3;
@end

@implementation SVXTapToRadarManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognitionText, 0);
  objc_storeStrong((id *)&self->_radarRateLimiter, 0);
  objc_storeStrong((id *)&self->_radarDraftFactory, 0);
  objc_storeStrong((id *)&self->_radarFiler, 0);
  objc_storeStrong((id *)&self->_errorsToSkipFirstTime, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_ttrHistory, 0);

  objc_storeStrong((id *)&self->_ttrQueue, 0);
}

- (void)setRecognitionText:(id)a3
{
}

- (NSString)getRecognitionText
{
  return self->_recognitionText;
}

- (void)_updateTTRHistory:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = AFBuildVersion();
    v6 = [(NSUserDefaults *)self->_ttrHistory arrayForKey:v5];
    v7 = v6;
    if (!v6)
    {
      ttrHistory = self->_ttrHistory;
      id v16 = v4;
      v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v16 count:1];
      [(NSUserDefaults *)ttrHistory setObject:v12 forKey:v5];

      v13 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v18 = "-[SVXTapToRadarManager _updateTTRHistory:]";
        __int16 v19 = 2112;
        id v20 = v5;
        __int16 v21 = 2112;
        id v22 = v4;
        _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s First entry created for build %@, with error %@", buf, 0x20u);
      }
      goto LABEL_13;
    }
    if ([v6 containsObject:v4])
    {
      v8 = (void *)*MEMORY[0x263F28348];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
LABEL_13:

        goto LABEL_14;
      }
      v9 = v8;
      *(_DWORD *)buf = 136315906;
      v18 = "-[SVXTapToRadarManager _updateTTRHistory:]";
      __int16 v19 = 2112;
      id v20 = v4;
      __int16 v21 = 2112;
      id v22 = v5;
      __int16 v23 = 2048;
      uint64_t v24 = [v7 count];
      _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s Error %@ already exist for %@. Total errors %lu", buf, 0x2Au);
    }
    else
    {
      v9 = [v7 arrayByAddingObject:v4];
      [(NSUserDefaults *)self->_ttrHistory setObject:v9 forKey:v5];
      v14 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        v15 = v14;
        *(_DWORD *)buf = 136316162;
        v18 = "-[SVXTapToRadarManager _updateTTRHistory:]";
        __int16 v19 = 2112;
        id v20 = v4;
        __int16 v21 = 2112;
        id v22 = v5;
        __int16 v23 = 2048;
        uint64_t v24 = [v7 count];
        __int16 v25 = 2048;
        uint64_t v26 = [v9 count];
        _os_log_impl(&dword_220062000, v15, OS_LOG_TYPE_INFO, "%s Add new error %@. Total errors for build %@ changed from %lu -> %lu", buf, 0x34u);
      }
    }

    goto LABEL_13;
  }
  v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[SVXTapToRadarManager _updateTTRHistory:]";
    _os_log_error_impl(&dword_220062000, v10, OS_LOG_TYPE_ERROR, "%s No errorCode provided.", buf, 0xCu);
  }
LABEL_14:
}

- (BOOL)_hasFileTTRWithIssue:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = AFBuildVersion();
  v6 = [(NSUserDefaults *)self->_ttrHistory arrayForKey:v5];
  v7 = v6;
  if (v6)
  {
    if ([v6 containsObject:v4])
    {
      v8 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        v9 = v8;
        int v13 = 136315906;
        v14 = "-[SVXTapToRadarManager _hasFileTTRWithIssue:]";
        __int16 v15 = 2112;
        id v16 = v4;
        __int16 v17 = 2112;
        v18 = v5;
        __int16 v19 = 2048;
        uint64_t v20 = [v7 count];
        _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s Issue %@ for %@ has been prompted before. Total error count = %ld", (uint8_t *)&v13, 0x2Au);
      }
    }
  }
  else
  {
    v10 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      v14 = "-[SVXTapToRadarManager _hasFileTTRWithIssue:]";
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s First error of build %@ occurred, clean old TTR history", (uint8_t *)&v13, 0x16u);
    }
    [(NSUserDefaults *)self->_ttrHistory removePersistentDomainForName:@"com.apple.siri.sirivox.ttr"];
  }
  BOOL v11 = [(SVXRadarRateLimiter *)self->_radarRateLimiter isRateLimited];

  return v11;
}

- (BOOL)_skipFirstTimeTTR:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = AFBuildVersion();
  v6 = [(NSUserDefaults *)self->_ttrHistory arrayForKey:v5];
  v7 = v6;
  if (v6)
  {
    if ([v6 containsObject:v4])
    {
      v8 = (NSObject **)MEMORY[0x263F28348];
      v9 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        v10 = v9;
        *(_DWORD *)buf = 136315906;
        v18 = "-[SVXTapToRadarManager _skipFirstTimeTTR:]";
        __int16 v19 = 2112;
        id v20 = v4;
        __int16 v21 = 2112;
        id v22 = v5;
        __int16 v23 = 2048;
        uint64_t v24 = [v7 count];
        _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s Issue %@ for %@ has been invoked before. Total error count = %ld", buf, 0x2Au);
      }
      BOOL v11 = [NSString stringWithFormat:@"%@%@", @"ttrFiled_", v4];
      if ([v7 containsObject:v11])
      {
        v12 = *v8;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v18 = "-[SVXTapToRadarManager _skipFirstTimeTTR:]";
          _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s The first TTR was filed before.", buf, 0xCu);
        }
      }
      else if (![&unk_26D1FC660 containsObject:v4])
      {
        BOOL v15 = 0;
        goto LABEL_16;
      }
      BOOL v15 = [(SVXRadarRateLimiter *)self->_radarRateLimiter isRateLimited];
LABEL_16:

      goto LABEL_17;
    }
  }
  else
  {
    int v13 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[SVXTapToRadarManager _skipFirstTimeTTR:]";
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s First error of build %@ occurred, clean old TTR history", buf, 0x16u);
    }
    [(NSUserDefaults *)self->_ttrHistory removePersistentDomainForName:@"com.apple.siri.sirivox.ttr"];
  }
  v14 = *MEMORY[0x263F28348];
  BOOL v15 = 1;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[SVXTapToRadarManager _skipFirstTimeTTR:]";
    __int16 v19 = 2112;
    id v20 = v4;
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl(&dword_220062000, v14, OS_LOG_TYPE_INFO, "%s New issue %@ for %@ occurred. Skip radar as this is the first time", buf, 0x20u);
  }
LABEL_17:

  return v15;
}

- (void)_updateRequestID:(id)a3
{
}

- (BOOL)_hasFileTTRWithRequestID:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  requestID = self->_requestID;
  if (requestID && [(NSUUID *)requestID isEqual:v4])
  {
    v6 = *MEMORY[0x263F28348];
    BOOL v7 = 1;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      v10 = "-[SVXTapToRadarManager _hasFileTTRWithRequestID:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s A radar was prompted for request %@ before", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)createProblem:(id)a3 extraContent:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  ttrQueue = self->_ttrQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__SVXTapToRadarManager_createProblem_extraContent_completionHandler___block_invoke;
  v15[3] = &unk_264554918;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(ttrQueue, v15);
}

void __69__SVXTapToRadarManager_createProblem_extraContent_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) requestID];
  LODWORD(v2) = [v2 _hasFileTTRWithRequestID:v3];

  if (v2)
  {
    id v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v27 = "-[SVXTapToRadarManager createProblem:extraContent:completionHandler:]_block_invoke";
      v5 = "%s Return without prompting radar";
LABEL_11:
      _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, v5, buf, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v6 = *(void **)(*(void *)(a1 + 32) + 32);
  BOOL v7 = [*(id *)(a1 + 40) error];
  int v8 = [v6 containsObject:v7];

  id v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) error];
  if (v8)
  {
    int v11 = [v9 _skipFirstTimeTTR:v10];

    if (v11)
    {
      id v12 = *(void **)(a1 + 32);
      id v13 = [*(id *)(a1 + 40) error];
      [v12 _updateTTRHistory:v13];

      id v14 = *(void **)(a1 + 32);
      BOOL v15 = [*(id *)(a1 + 40) requestID];
      [v14 _updateRequestID:v15];

      id v4 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v27 = "-[SVXTapToRadarManager createProblem:extraContent:completionHandler:]_block_invoke";
        v5 = "%s Met the conditions for _skipFirstTimeTTR - Return without prompting radar";
        goto LABEL_11;
      }
LABEL_12:
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      return;
    }
  }
  else
  {
    int v16 = [v9 _hasFileTTRWithIssue:v10];

    if (v16)
    {
      id v4 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v27 = "-[SVXTapToRadarManager createProblem:extraContent:completionHandler:]_block_invoke";
        v5 = "%s Return without prompting radar";
        goto LABEL_11;
      }
      goto LABEL_12;
    }
  }
  id v17 = [*(id *)(*(void *)(a1 + 32) + 48) createWithRequiredContent:*(void *)(a1 + 40) extraContent:*(void *)(a1 + 48)];
  id v18 = *(void **)(*(void *)(a1 + 32) + 40);
  __int16 v19 = [*(id *)(a1 + 40) displayReason];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __69__SVXTapToRadarManager_createProblem_extraContent_completionHandler___block_invoke_119;
  v23[3] = &unk_264553C40;
  id v20 = *(id *)(a1 + 56);
  uint64_t v21 = *(void *)(a1 + 32);
  id v22 = *(void **)(a1 + 40);
  id v25 = v20;
  v23[4] = v21;
  id v24 = v22;
  [v18 fileRadar:v17 processName:@"Siri" displayReason:v19 completion:v23];
}

void __69__SVXTapToRadarManager_createProblem_extraContent_completionHandler___block_invoke_119(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      int v16 = v4;
      id v17 = [v3 localizedDescription];
      *(_DWORD *)buf = 136315394;
      __int16 v19 = "-[SVXTapToRadarManager createProblem:extraContent:completionHandler:]_block_invoke";
      __int16 v20 = 2112;
      uint64_t v21 = v17;
      _os_log_error_impl(&dword_220062000, v16, OS_LOG_TYPE_ERROR, "%s Failed creating a radar - error: %@", buf, 0x16u);
    }
    v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    BOOL v7 = [*(id *)(a1 + 40) error];
    [v6 _updateTTRHistory:v7];

    int v8 = *(void **)(a1 + 32);
    id v9 = [*(id *)(a1 + 40) requestID];
    [v8 _updateRequestID:v9];

    id v10 = *(void **)(*(void *)(a1 + 32) + 32);
    int v11 = [*(id *)(a1 + 40) error];
    LODWORD(v10) = [v10 containsObject:v11];

    if (v10)
    {
      id v12 = NSString;
      id v13 = [*(id *)(a1 + 40) error];
      id v14 = [v12 stringWithFormat:@"%@%@", @"ttrFiled_", v13];

      [*(id *)(a1 + 32) _updateTTRHistory:v14];
    }
    BOOL v15 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v19 = "-[SVXTapToRadarManager createProblem:extraContent:completionHandler:]_block_invoke";
      _os_log_impl(&dword_220062000, v15, OS_LOG_TYPE_INFO, "%s Radar Created", buf, 0xCu);
    }
    v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v5();
}

- (id)getEarlyCutoffUtterances
{
  return &unk_26D1FC630;
}

- (id)getWebSearchIssueDialogIdentifiers
{
  return &unk_26D1FC618;
}

- (id)getDomainFatalIssueDialogIdentifiers
{
  return &unk_26D1FC600;
}

- (id)getRMVIssueDialogIdentifiers
{
  return &unk_26D1FC5E8;
}

- (id)_initWithRadarFiler:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SVXTapToRadarManager;
  v6 = [(SVXTapToRadarManager *)&v21 init];
  BOOL v7 = v6;
  if (v6)
  {
    recognitionText = v6->_recognitionText;
    v6->_recognitionText = (NSString *)&stru_26D1E1D80;

    dispatch_queue_t v9 = dispatch_queue_create("SVXTTRManagerQueue", 0);
    ttrQueue = v7->_ttrQueue;
    v7->_ttrQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.sirivox.ttr"];
    ttrHistory = v7->_ttrHistory;
    v7->_ttrHistory = (NSUserDefaults *)v11;

    requestID = v7->_requestID;
    v7->_requestID = 0;

    uint64_t v14 = [MEMORY[0x263EFFA08] setWithArray:&unk_26D1FC648];
    errorsToSkipFirstTime = v7->_errorsToSkipFirstTime;
    v7->_errorsToSkipFirstTime = (NSSet *)v14;

    int v16 = objc_alloc_init(SVXRadarDraftFactory);
    radarDraftFactory = v7->_radarDraftFactory;
    v7->_radarDraftFactory = v16;

    id v18 = objc_alloc_init(SVXRadarRateLimiter);
    radarRateLimiter = v7->_radarRateLimiter;
    v7->_radarRateLimiter = v18;

    objc_storeStrong((id *)&v7->_radarFiler, a3);
  }

  return v7;
}

+ (id)sharedInstanceWithRadarFiler:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SVXTapToRadarManager_sharedInstanceWithRadarFiler___block_invoke;
  block[3] = &unk_2645548A0;
  id v9 = v3;
  uint64_t v4 = sharedInstanceWithRadarFiler__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&sharedInstanceWithRadarFiler__onceToken, block);
  }
  id v6 = (id)sharedInstanceWithRadarFiler__privateInstance;

  return v6;
}

void __53__SVXTapToRadarManager_sharedInstanceWithRadarFiler___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = (void *)sharedInstanceWithRadarFiler__privateInstance;
  sharedInstanceWithRadarFiler__privateInstance = 0;

  if ([*(id *)(a1 + 32) supportsRadarFiling])
  {
    sharedInstanceWithRadarFiler__privateInstance = [[SVXTapToRadarManager alloc] _initWithRadarFiler:*(void *)(a1 + 32)];
    MEMORY[0x270F9A758]();
  }
  else
  {
    id v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "+[SVXTapToRadarManager sharedInstanceWithRadarFiler:]_block_invoke";
      __int16 v6 = 2080;
      BOOL v7 = "+[SVXTapToRadarManager sharedInstanceWithRadarFiler:]_block_invoke";
      _os_log_error_impl(&dword_220062000, v3, OS_LOG_TYPE_ERROR, "%s %s: TapToRadarService class is not available", (uint8_t *)&v4, 0x16u);
    }
  }
}

+ (id)sharedInstance
{
  id v3 = objc_alloc_init(SVXRadarFiler);
  int v4 = [a1 sharedInstanceWithRadarFiler:v3];

  return v4;
}

@end