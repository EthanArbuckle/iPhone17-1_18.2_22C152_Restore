@interface PFLBackgroundRunner
+ (void)initialize;
- (BOOL)prepareForActivity:(id)a3;
- (PFLBackgroundRunner)init;
- (QuickTypePFLBackgroundTask)task;
- (RBSAssertion)assertion;
- (_DASActivity)activity;
- (unsigned)start;
- (void)cleanup;
- (void)setAssertion:(id)a3;
- (void)setTask:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation PFLBackgroundRunner

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_2);
  }
}

uint64_t __33__PFLBackgroundRunner_initialize__block_invoke()
{
  sLog_6 = (uint64_t)os_log_create("com.apple.NLP", "PFLBackgroundRunner");
  return MEMORY[0x270F9A758]();
}

- (PFLBackgroundRunner)init
{
  v3.receiver = self;
  v3.super_class = (Class)PFLBackgroundRunner;
  return [(PFLBackgroundRunner *)&v3 init];
}

- (void)cleanup
{
  objc_super v3 = [(PFLBackgroundRunner *)self assertion];

  if (v3)
  {
    id v4 = [(PFLBackgroundRunner *)self assertion];
    [v4 invalidate];
  }
}

- (BOOL)prepareForActivity:(id)a3
{
  v36[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = [v5 objectForKeyedSubscript:@"QuickTypePFLBackgroundTask"];

  if ([v6 length])
  {
    id v33 = 0;
    v7 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v33];
    id v8 = v33;
    [(PFLBackgroundRunner *)self setTask:v7];

    v9 = [(PFLBackgroundRunner *)self task];

    if (v9)
    {
      v10 = [MEMORY[0x263F64480] attributeWithDomain:@"com.apple.NLPLearner" name:@"AccessGPU"];
      id v11 = objc_alloc(MEMORY[0x263F64408]);
      v12 = [MEMORY[0x263F64630] targetWithPid:getpid()];
      v36[0] = v10;
      v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:1];
      v14 = (void *)[v11 initWithExplanation:@"PFL training" target:v12 attributes:v13];

      id v32 = 0;
      char v15 = [v14 acquireWithError:&v32];
      id v16 = v32;

      v17 = sLog_6;
      if (v15)
      {
        if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v14;
          _os_log_impl(&dword_234530000, v17, OS_LOG_TYPE_INFO, "acquired assertion for background task runner %@", buf, 0xCu);
        }
        [(PFLBackgroundRunner *)self setAssertion:v14];
      }
      else
      {
        if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_ERROR)) {
          -[PFLBackgroundRunner prepareForActivity:]((uint64_t)v16, v17, v25, v26, v27, v28, v29, v30);
        }
        [v14 invalidate];
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_ERROR)) {
        -[PFLBackgroundRunner prepareForActivity:]();
      }
      char v15 = 0;
      id v16 = v8;
    }
  }
  else
  {
    v18 = sLog_6;
    if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_ERROR)) {
      -[PFLBackgroundRunner prepareForActivity:]((uint64_t)v4, v18, v19, v20, v21, v22, v23, v24);
    }
    char v15 = 0;
  }

  return v15;
}

- (unsigned)start
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  objc_super v3 = [(PFLBackgroundRunner *)self task];
  id v4 = [v3 url];

  v5 = sLog_6;
  if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_234530000, v5, OS_LOG_TYPE_DEFAULT, "starting PFLBackgroundRunner with task url %@", (uint8_t *)&buf, 0xCu);
  }
  id v20 = 0;
  v6 = (void *)[objc_alloc(MEMORY[0x263F3A460]) initWithResumptionURL:v4 error:&v20];
  id v7 = v20;
  id v8 = v7;
  if (!v6 || v7)
  {
    if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_ERROR)) {
      -[PFLBackgroundRunner start]();
    }
    unsigned __int8 v13 = 1;
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v22 = 0x2020000000;
    char v23 = 1;
    v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    v10 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __28__PFLBackgroundRunner_start__block_invoke;
    v16[3] = &unk_264BEEC90;
    p_long long buf = &buf;
    id v11 = v9;
    v17 = v11;
    id v18 = v6;
    [v18 downloadAttachmentsWithConfiguration:v10 completion:v16];

    dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    [(PFLBackgroundRunner *)self cleanup];
    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      v12 = sLog_6;
      unsigned __int8 v13 = 0;
      if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v15 = 0;
        _os_log_impl(&dword_234530000, v12, OS_LOG_TYPE_DEFAULT, "finished posting results", v15, 2u);
        unsigned __int8 v13 = 0;
      }
    }
    else
    {
      unsigned __int8 v13 = 1;
    }

    _Block_object_dispose(&buf, 8);
  }

  return v13;
}

void __28__PFLBackgroundRunner_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    id v4 = sLog_6;
    if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_ERROR)) {
      __28__PFLBackgroundRunner_start__block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    id v11 = (void *)sLog_6;
    if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 40);
      unsigned __int8 v13 = v11;
      v14 = [v12 recipe];
      char v15 = [*(id *)(a1 + 40) matchingRecordSet];
      *(_DWORD *)long long buf = 138412802;
      v40 = v12;
      __int16 v41 = 2112;
      v42 = v14;
      __int16 v43 = 2112;
      id v44 = v15;
      _os_log_impl(&dword_234530000, v13, OS_LOG_TYPE_DEFAULT, "training with session:%@ recipe:%@ recordSet:%@", buf, 0x20u);
    }
    id v16 = [*(id *)(a1 + 40) recipe];
    v17 = [*(id *)(a1 + 40) matchingRecordSet];
    id v37 = 0;
    id v38 = 0;
    id v18 = trainMLPModelForDES(v16, v17, &v38, &v37);
    id v19 = v38;
    id v20 = v37;

    uint64_t v21 = sLog_6;
    BOOL v22 = os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_DEFAULT);
    if (v20 || !v18)
    {
      if (v22)
      {
        uint64_t v27 = *(void **)(a1 + 40);
        uint64_t v28 = v21;
        uint64_t v29 = [v27 recipe];
        uint64_t v30 = [*(id *)(a1 + 40) matchingRecordSet];
        *(_DWORD *)long long buf = 138412802;
        v40 = v29;
        __int16 v41 = 2112;
        v42 = v30;
        __int16 v43 = 2112;
        id v44 = v20;
        _os_log_impl(&dword_234530000, v28, OS_LOG_TYPE_DEFAULT, "quicktype training failed for recipe:%@ recordSet:%@ err:%@", buf, 0x20u);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      v31 = *(NSObject **)(a1 + 32);
      uint64_t v23 = a1 + 32;
      dispatch_group_enter(v31);
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __28__PFLBackgroundRunner_start__block_invoke_71;
      v35[3] = &unk_264BEEC68;
      uint64_t v25 = &v36;
      id v32 = *(void **)(v23 + 8);
      id v36 = *(id *)v23;
      [v32 completeWithError:v20 completionHandler:v35];
    }
    else
    {
      if (v22)
      {
        *(_DWORD *)long long buf = 138412290;
        v40 = v18;
        _os_log_impl(&dword_234530000, v21, OS_LOG_TYPE_DEFAULT, "training succeeded with json result %@", buf, 0xCu);
      }
      uint64_t v24 = *(NSObject **)(a1 + 32);
      uint64_t v23 = a1 + 32;
      dispatch_group_enter(v24);
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __28__PFLBackgroundRunner_start__block_invoke_72;
      v33[3] = &unk_264BEEC68;
      uint64_t v25 = &v34;
      uint64_t v26 = *(void **)(v23 + 8);
      id v34 = *(id *)v23;
      [v26 completeWithJSONResult:v18 binaryResult:v19 completionHandler:v33];
    }
    dispatch_group_leave(*(dispatch_group_t *)v23);
  }
}

void __28__PFLBackgroundRunner_start__block_invoke_71(uint64_t a1)
{
}

void __28__PFLBackgroundRunner_start__block_invoke_72(uint64_t a1)
{
}

- (void)stop
{
  id v3 = sLog_6;
  if (os_log_type_enabled((os_log_t)sLog_6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_234530000, v3, OS_LOG_TYPE_DEFAULT, "stopping background task runner", v4, 2u);
  }
  [(PFLBackgroundRunner *)self cleanup];
}

- (_DASActivity)activity
{
  return self->_activity;
}

- (QuickTypePFLBackgroundTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (RBSAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

- (void)prepareForActivity:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)prepareForActivity:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_234530000, v0, v1, "unable to de-serialize task from data %@ err:%@");
}

- (void)prepareForActivity:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)start
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_234530000, v0, v1, "unable to reconstruct session from url:%@ err:%@");
}

void __28__PFLBackgroundRunner_start__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end