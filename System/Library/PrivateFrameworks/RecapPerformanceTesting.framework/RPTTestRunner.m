@interface RPTTestRunner
+ (BOOL)isRecapAvailable;
+ (void)playInteraction:(id)a3 completionHandler:(id)a4;
+ (void)runTestWithParameters:(id)a3;
+ (void)runTestWithParameters:(id)a3 delegate:(id)a4;
+ (void)runTestWithParameters:(id)a3 resultHandler:(id)a4;
- (BOOL)_isReadyForRunningParameters:(id)a3 error:(id *)a4;
- (BOOL)_managePPTLifetimeEvent:(int64_t)a3 forParameters:(id)a4;
- (BOOL)_startSerializedRunnerWithError:(id *)a3;
- (BOOL)checkTestRequirementsWithError:(id *)a3;
- (RCPInlinePlayer)inlinePlayer;
- (RPTInteractionOptions)interactionOptions;
- (RPTSettings)settings;
- (RPTTestRunner)initWithInteractionOptions:(id)a3;
- (RPTTestRunnerDelegate)delegate;
- (void)_endSerializedRunner;
- (void)_failWithParameters:(id)a3 error:(id)a4;
- (void)_finishWithParameters:(id)a3;
- (void)_runTestWithParameters:(id)a3;
- (void)_runTestWithParameters:(id)a3 retries:(int64_t)a4;
- (void)playInteraction:(id)a3 completionHandler:(id)a4;
- (void)runTestWithParameters:(id)a3;
- (void)runTestWithParameters:(id)a3 resultHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setInteractionOptions:(id)a3;
- (void)setSettings:(id)a3;
@end

@implementation RPTTestRunner

+ (void)runTestWithParameters:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = +[RPTInteractionOptions defaultForPlatform];
  id v7 = (id)[v5 initWithInteractionOptions:v6];

  [v7 runTestWithParameters:v4];
}

- (RCPInlinePlayer)inlinePlayer
{
  return self->_inlinePlayer;
}

+ (BOOL)isRecapAvailable
{
  return RecapLibraryCore() != 0;
}

+ (void)playInteraction:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  id v10 = +[RPTInteractionOptions defaultForPlatform];
  v9 = (void *)[v8 initWithInteractionOptions:v10];
  [v9 playInteraction:v7 completionHandler:v6];
}

+ (void)runTestWithParameters:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v9 = +[RPTInteractionOptions defaultForPlatform];
  id v10 = (id)[v8 initWithInteractionOptions:v9];

  [v10 runTestWithParameters:v7 resultHandler:v6];
}

+ (void)runTestWithParameters:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v9 = +[RPTInteractionOptions defaultForPlatform];
  id v10 = (id)[v8 initWithInteractionOptions:v9];

  [v10 setDelegate:v6];
  [v10 runTestWithParameters:v7];
}

- (RPTTestRunner)initWithInteractionOptions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RPTTestRunner;
  id v5 = [(RPTTestRunner *)&v14 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = (RPTInteractionOptions *)v4;
    }
    else
    {
      id v6 = +[RPTInteractionOptions defaultForPlatform];
    }
    interactionOptions = v5->_interactionOptions;
    v5->_interactionOptions = v6;

    uint64_t v8 = +[RPTSettings processEnvironment];
    settings = v5->_settings;
    v5->_settings = (RPTSettings *)v8;

    id v10 = (RCPInlinePlayer *)objc_alloc_init((Class)getRCPInlinePlayerClass());
    inlinePlayer = v5->_inlinePlayer;
    v5->_inlinePlayer = v10;

    v12 = RPTLogTestRunning();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v16 = v4;
      _os_log_impl(&dword_1B626C000, v12, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTTestRunner initWithOptions: %{public}@]", buf, 0xCu);
    }
  }
  return v5;
}

- (void)playInteraction:(id)a3 completionHandler:(id)a4
{
  id v5 = +[RPTInteractionTestParameters interactionTestParametersWithTestName:0 interaction:a3 duration:a4 completionHandler:1.0];
  [(RPTTestRunner *)self runTestWithParameters:v5];
}

- (BOOL)_isReadyForRunningParameters:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(RPTTestRunner *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(RPTTestRunner *)self delegate];
    char v9 = [v8 testRunner:self isReadyForRunningParameters:v5];
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)_runTestWithParameters:(id)a3 retries:(int64_t)a4
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v17 = 0;
  BOOL v7 = [(RPTTestRunner *)self _isReadyForRunningParameters:v6 error:&v17];
  id v8 = v17;
  char v9 = v8;
  if (v7)
  {
    [(RPTTestRunner *)self _runTestWithParameters:v6];
  }
  else if (a4 < 1)
  {
    if (!v8)
    {
      v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v12 = *MEMORY[0x1E4F28588];
      v18[0] = *MEMORY[0x1E4F28578];
      v18[1] = v12;
      v19[0] = @"App not ready to test";
      v19[1] = @"Client reported not ready to test.";
      v18[2] = *MEMORY[0x1E4F285A0];
      v19[2] = @"Check your client code.";
      v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:3];
      char v9 = [v11 errorWithDomain:@"com.apple.RecapPerformanceTesting" code:4 userInfo:v13];
    }
    [(RPTTestRunner *)self _failWithParameters:v6 error:v9];
  }
  else
  {
    dispatch_time_t v10 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__RPTTestRunner__runTestWithParameters_retries___block_invoke;
    block[3] = &unk_1E613E048;
    block[4] = self;
    id v15 = v6;
    int64_t v16 = a4;
    dispatch_after(v10, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __48__RPTTestRunner__runTestWithParameters_retries___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runTestWithParameters:*(void *)(a1 + 40) retries:*(void *)(a1 + 48) - 1];
}

- (void)runTestWithParameters:(id)a3
{
  id v7 = 0;
  id v4 = a3;
  BOOL v5 = [(RPTTestRunner *)self _startSerializedRunnerWithError:&v7];
  id v6 = v7;
  if (v5) {
    [(RPTTestRunner *)self _runTestWithParameters:v4 retries:10];
  }
  else {
    [(RPTTestRunner *)self _failWithParameters:v4 error:v6];
  }
}

- (void)_runTestWithParameters:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = RPTLogTestRunning();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1B626C000, v5, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTTestRunner runTestWithParameters: %{public}@]", (uint8_t *)&buf, 0xCu);
  }

  id v6 = [v4 testName];
  id v7 = [(RPTTestRunner *)self settings];
  id v8 = [v7 recapOverrideFileURL];
  BOOL v9 = v8 != 0;

  dispatch_time_t v10 = RPTLogTestRunning();
  if (os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl(&dword_1B626C000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RunTestWithParameters", "<testName>=%{public, name=testName}@", (uint8_t *)&buf, 0xCu);
  }

  id v37 = 0;
  BOOL v11 = [(RPTTestRunner *)self checkTestRequirementsWithError:&v37];
  id v12 = v37;
  if (v11)
  {
    v13 = RPTLogTestRunning();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v14 = [v4 testName];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1B626C000, v13, OS_LOG_TYPE_DEFAULT, "RPT: PrepareForTest begin %{public}@", (uint8_t *)&buf, 0xCu);
    }
    id v15 = RPTLogTestRunning();
    if (os_signpost_enabled(v15))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v6;
      _os_signpost_emit_with_name_impl(&dword_1B626C000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PrepareForTest", "<testName>=%{public, name=testName}@", (uint8_t *)&buf, 0xCu);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__0;
    v41 = __Block_byref_object_dispose__0;
    id v42 = 0;
    int64_t v16 = makeRCPPlayerPlaybackOptions();
    id v17 = [(RPTTestRunner *)self interactionOptions];
    id RCPSyntheticEventStreamClass = getRCPSyntheticEventStreamClass();
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __40__RPTTestRunner__runTestWithParameters___block_invoke;
    v32[3] = &unk_1E613E070;
    BOOL v36 = v9;
    p_long long buf = &buf;
    id v19 = v17;
    id v33 = v19;
    id v20 = v4;
    id v34 = v20;
    v21 = [RCPSyntheticEventStreamClass eventStreamWithEventActions:v32];
    v22 = [(RPTTestRunner *)self inlinePlayer];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __40__RPTTestRunner__runTestWithParameters___block_invoke_2;
    v24[3] = &unk_1E613E160;
    id v25 = v20;
    id v26 = 0;
    BOOL v31 = v9;
    v27 = self;
    v30 = &buf;
    id v23 = v19;
    id v28 = v23;
    id v29 = v6;
    [v22 playEventStream:v21 options:v16 completion:v24];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    [(RPTTestRunner *)self _failWithParameters:v4 error:v12];
  }
}

uint64_t __40__RPTTestRunner__runTestWithParameters___block_invoke(uint64_t result, void *a2)
{
  if (!*(unsigned char *)(result + 56))
  {
    uint64_t v2 = result;
    id v3 = a2;
    id v4 = [[RPTDefaultPointerAndFingerInteroppingComposer alloc] initFromWrapping:v3 interactionOptions:*(void *)(v2 + 32)];
    uint64_t v5 = *(void *)(*(void *)(v2 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v7 = [*(id *)(v2 + 32) senderProperties];
    [v3 setSenderProperties:v7];

    id v8 = *(void **)(v2 + 40);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(v2 + 48) + 8) + 40);
    return [v8 prepareWithComposer:v9];
  }
  return result;
}

void __40__RPTTestRunner__runTestWithParameters___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = RPTLogTestRunning();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) testName];
    *(_DWORD *)long long buf = 138543362;
    id v19 = v3;
    _os_log_impl(&dword_1B626C000, v2, OS_LOG_TYPE_DEFAULT, "RPT: PrepareForTest end %{public}@", buf, 0xCu);
  }
  id v4 = RPTLogTestRunning();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B626C000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PrepareForTest", (const char *)&unk_1B627EA16, buf, 2u);
  }

  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__RPTTestRunner__runTestWithParameters___block_invoke_80;
  block[3] = &unk_1E613E160;
  id v6 = *(id *)(a1 + 40);
  char v17 = *(unsigned char *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = v6;
  uint64_t v12 = v7;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 72);
  id v13 = v8;
  uint64_t v16 = v9;
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  dispatch_after(v5, MEMORY[0x1E4F14428], block);
}

void __40__RPTTestRunner__runTestWithParameters___block_invoke_80(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = makeRCPPlayerPlaybackOptions();
  if (*(unsigned char *)(a1 + 80))
  {
    id RCPEventStreamClass = getRCPEventStreamClass();
    id v4 = [*(id *)(a1 + 40) settings];
    dispatch_time_t v5 = [v4 recapOverrideFileURL];
    id v29 = 0;
    id v6 = [RCPEventStreamClass eventStreamWithFileURL:v5 error:&v29];
    id v7 = v29;

    if (!v6)
    {
      [*(id *)(a1 + 40) _failWithParameters:*(void *)(a1 + 48) error:v7];
      goto LABEL_12;
    }
  }
  else
  {
    id RCPSyntheticEventStreamClass = getRCPSyntheticEventStreamClass();
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __40__RPTTestRunner__runTestWithParameters___block_invoke_2_81;
    v25[3] = &unk_1E613E098;
    uint64_t v28 = *(void *)(a1 + 72);
    id v26 = *(id *)(a1 + 56);
    id v27 = *(id *)(a1 + 48);
    id v6 = [RCPSyntheticEventStreamClass eventStreamWithEventActions:v25];

    id v7 = v26;
  }

  uint64_t v9 = RPTLogTestRunning();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v10 = [*(id *)(a1 + 48) testName];
    *(_DWORD *)long long buf = 138543362;
    BOOL v31 = v10;
    _os_log_impl(&dword_1B626C000, v9, OS_LOG_TYPE_DEFAULT, "RPT: PrewarmForTest begin %{public}@", buf, 0xCu);
  }
  id v11 = RPTLogTestRunning();
  if (os_signpost_enabled(v11))
  {
    uint64_t v12 = *(void **)(a1 + 64);
    id v13 = @"YES";
    if (!*(unsigned char *)(a1 + 80)) {
      id v13 = @"NO";
    }
    *(_DWORD *)long long buf = 138543618;
    BOOL v31 = v12;
    __int16 v32 = 2114;
    id v33 = v13;
    _os_signpost_emit_with_name_impl(&dword_1B626C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PrewarmForTest", "<testName>=%{public, name=testName}@ <isOverride>=%{public, name=isOverride}@", buf, 0x16u);
  }

  id v14 = [*(id *)(a1 + 40) inlinePlayer];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __40__RPTTestRunner__runTestWithParameters___block_invoke_88;
  void v18[3] = &unk_1E613E138;
  id v15 = *(id *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 40);
  id v19 = v15;
  uint64_t v20 = v16;
  id v17 = *(id *)(a1 + 64);
  char v24 = *(unsigned char *)(a1 + 80);
  id v21 = v17;
  id v22 = v6;
  id v23 = v2;
  id v7 = v6;
  [v14 prewarmForEventStream:v7 completion:v18];

LABEL_12:
}

void __40__RPTTestRunner__runTestWithParameters___block_invoke_2_81(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v4 = a2;
  [v3 setForwardingTarget:v4];
  dispatch_time_t v5 = [*(id *)(a1 + 32) senderProperties];
  [v4 setSenderProperties:v5];

  id v6 = [*(id *)(a1 + 40) composerBlock];
  v6[2](v6, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

void __40__RPTTestRunner__runTestWithParameters___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = RPTLogTestRunning();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v5 = [*(id *)(a1 + 32) testName];
    *(_DWORD *)long long buf = 138543362;
    id v26 = v5;
    _os_log_impl(&dword_1B626C000, v4, OS_LOG_TYPE_DEFAULT, "RPT: PrewarmForTest end %{public}@", buf, 0xCu);
  }
  id v6 = RPTLogTestRunning();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B626C000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PrewarmForTest", (const char *)&unk_1B627EA16, buf, 2u);
  }

  id v7 = *(void **)(a1 + 40);
  if (v3)
  {
    [v7 _failWithParameters:*(void *)(a1 + 32) error:v3];
  }
  else
  {
    if ([v7 _managePPTLifetimeEvent:0 forParameters:*(void *)(a1 + 32)])
    {
      id v8 = [MEMORY[0x1E4F42738] sharedApplication];
      [v8 startedTest:*(void *)(a1 + 48)];
    }
    uint64_t v9 = RPTLogTestRunning();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v10 = [*(id *)(a1 + 32) testName];
      *(_DWORD *)long long buf = 138543362;
      id v26 = v10;
      _os_log_impl(&dword_1B626C000, v9, OS_LOG_TYPE_DEFAULT, "RPT: PerformTest begin %{public}@", buf, 0xCu);
    }
    id v11 = RPTLogTestRunning();
    if (os_signpost_enabled(v11))
    {
      uint64_t v12 = *(void **)(a1 + 48);
      id v13 = @"YES";
      if (!*(unsigned char *)(a1 + 72)) {
        id v13 = @"NO";
      }
      *(_DWORD *)long long buf = 138543618;
      id v26 = v12;
      __int16 v27 = 2114;
      uint64_t v28 = v13;
      _os_signpost_emit_with_name_impl(&dword_1B626C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PerformTest", "<testName>=%{public, name=testName}@ <isOverride>=%{public, name=isOverride}@ isAnimation=YES ", buf, 0x16u);
    }

    id v14 = [*(id *)(a1 + 40) inlinePlayer];
    uint64_t v15 = *(void *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 64);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __40__RPTTestRunner__runTestWithParameters___block_invoke_90;
    v20[3] = &unk_1E613E110;
    id v17 = *(id *)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 40);
    id v19 = *(void **)(a1 + 48);
    id v21 = v17;
    uint64_t v22 = v18;
    id v23 = v19;
    char v24 = *(unsigned char *)(a1 + 72);
    [v14 playEventStream:v15 options:v16 completion:v20];
  }
}

void __40__RPTTestRunner__runTestWithParameters___block_invoke_90(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __40__RPTTestRunner__runTestWithParameters___block_invoke_2_91;
  v15[3] = &unk_1E613E0C0;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(a1 + 48);
  id v16 = v2;
  uint64_t v17 = v3;
  id v18 = v4;
  dispatch_time_t v5 = (void (**)(void))MEMORY[0x1BA9B23F0](v15);
  if (objc_opt_respondsToSelector())
  {
    id v6 = RPTLogTestRunning();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) testName];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v20 = v7;
      _os_log_impl(&dword_1B626C000, v6, OS_LOG_TYPE_DEFAULT, "RPT: PostEventStreamPerformTest begin %{public}@", buf, 0xCu);
    }
    id v8 = RPTLogTestRunning();
    if (os_signpost_enabled(v8))
    {
      uint64_t v9 = *(void **)(a1 + 48);
      dispatch_time_t v10 = @"YES";
      if (!*(unsigned char *)(a1 + 56)) {
        dispatch_time_t v10 = @"NO";
      }
      *(_DWORD *)long long buf = 138543618;
      uint64_t v20 = v9;
      __int16 v21 = 2114;
      uint64_t v22 = v10;
      _os_signpost_emit_with_name_impl(&dword_1B626C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PostEventStreamPerformTest", "<testName>=%{public, name=testName}@ <isOverride>=%{public, name=isOverride}@", buf, 0x16u);
    }

    id v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __40__RPTTestRunner__runTestWithParameters___block_invoke_94;
    v12[3] = &unk_1E613E0E8;
    id v13 = v11;
    id v14 = v5;
    [v13 waitForPostEventStreamDelayWithHandler:v12];
  }
  else
  {
    v5[2](v5);
  }
}

uint64_t __40__RPTTestRunner__runTestWithParameters___block_invoke_2_91(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = RPTLogTestRunning();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) testName];
    int v12 = 138543362;
    id v13 = v3;
    _os_log_impl(&dword_1B626C000, v2, OS_LOG_TYPE_DEFAULT, "RPT: PerformTest end %{public}@", (uint8_t *)&v12, 0xCu);
  }
  id v4 = RPTLogTestRunning();
  if (os_signpost_enabled(v4))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B626C000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PerformTest", (const char *)&unk_1B627EA16, (uint8_t *)&v12, 2u);
  }

  if ([*(id *)(a1 + 40) _managePPTLifetimeEvent:1 forParameters:*(void *)(a1 + 32)])
  {
    dispatch_time_t v5 = [MEMORY[0x1E4F42738] sharedApplication];
    [v5 finishedTest:*(void *)(a1 + 48) waitForCommit:1 extraResults:0];
  }
  id v6 = [*(id *)(a1 + 32) completionHandler];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) completionHandler];
    v7[2]();
  }
  id v8 = RPTLogTestRunning();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [*(id *)(a1 + 32) testName];
    int v12 = 138543362;
    id v13 = v9;
    _os_log_impl(&dword_1B626C000, v8, OS_LOG_TYPE_DEFAULT, "RPT: RunTestWithParameters end %{public}@", (uint8_t *)&v12, 0xCu);
  }
  dispatch_time_t v10 = RPTLogTestRunning();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B626C000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RunTestWithParameters", (const char *)&unk_1B627EA16, (uint8_t *)&v12, 2u);
  }

  return [*(id *)(a1 + 40) _finishWithParameters:*(void *)(a1 + 32)];
}

uint64_t __40__RPTTestRunner__runTestWithParameters___block_invoke_94(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = RPTLogTestRunning();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) testName];
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1B626C000, v2, OS_LOG_TYPE_DEFAULT, "RPT: PostEventStreamPerformTest end %{public}@", (uint8_t *)&v6, 0xCu);
  }
  id v4 = RPTLogTestRunning();
  if (os_signpost_enabled(v4))
  {
    LOWORD(v6) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B626C000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PostEventStreamPerformTest", (const char *)&unk_1B627EA16, (uint8_t *)&v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)runTestWithParameters:(id)a3 resultHandler:(id)a4
{
  id v7 = a3;
  if (a4)
  {
    id v6 = a4;
    a4 = (id)objc_opt_new();
    [a4 setResultsHandler:v6];
  }
  [(RPTTestRunner *)self setDelegate:a4];
  [(RPTTestRunner *)self runTestWithParameters:v7];
}

- (BOOL)_startSerializedRunnerWithError:(id *)a3
{
  id v4 = objc_opt_class();
  objc_sync_enter(v4);
  ++_testIsRunning;
  objc_sync_exit(v4);

  dispatch_time_t v5 = [(RPTTestRunner *)self delegate];
  objc_setAssociatedObject(self, "RPTTestRunner_delegateKey", v5, (void *)0x301);

  return 1;
}

- (void)_endSerializedRunner
{
  objc_setAssociatedObject(self, "RPTTestRunner_delegateKey", 0, (void *)0x301);
  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  --_testIsRunning;
  objc_sync_exit(obj);
}

- (void)_finishWithParameters:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_time_t v5 = [(RPTTestRunner *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(RPTTestRunner *)self delegate];
    [v7 testRunner:self didFinishRunningParameters:v4];
  }
  uint64_t v8 = RPTLogTestRunning();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_1B626C000, v8, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTTestRunner _finishWithParameters: %{public}@]", (uint8_t *)&v9, 0xCu);
  }

  [(RPTTestRunner *)self _endSerializedRunner];
}

- (void)_failWithParameters:(id)a3 error:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 testName];
  if (v8)
  {
    int v9 = (void *)v8;
    BOOL v10 = [(RPTTestRunner *)self _managePPTLifetimeEvent:2 forParameters:v6];

    if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F42738] sharedApplication];
      int v12 = [v6 testName];
      id v13 = [v7 debugDescription];
      [v11 failedTest:v12 withFailure:v13];
    }
  }
  uint64_t v14 = RPTLogTestRunning();
  if (os_signpost_enabled(v14))
  {
    uint64_t v15 = [v7 debugDescription];
    int v20 = 138412290;
    __int16 v21 = v15;
    _os_signpost_emit_with_name_impl(&dword_1B626C000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RunTestWithParameters", "<failure?>=%@", (uint8_t *)&v20, 0xCu);
  }
  id v16 = [(RPTTestRunner *)self delegate];
  char v17 = objc_opt_respondsToSelector();

  if (v17)
  {
    id v18 = [(RPTTestRunner *)self delegate];
    [v18 testRunner:self didFailRunningParameters:v6 withError:v7];
  }
  id v19 = RPTLogTestRunning();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[RPTTestRunner _failWithParameters:error:]((uint64_t)v6, (uint64_t)v7, v19);
  }

  [(RPTTestRunner *)self _endSerializedRunner];
}

- (BOOL)_managePPTLifetimeEvent:(int64_t)a3 forParameters:(id)a4
{
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    LODWORD(a3) = [v6 managesTestStartAndEnd] ^ 1;
  }
  else
  {
    id v7 = [(RPTTestRunner *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      int v9 = [(RPTTestRunner *)self delegate];
      LOBYTE(a3) = [v9 testRunner:self shouldManagePPTLifetimeEvent:a3 forParamaters:v6];
    }
    else
    {
      BOOL v10 = [v6 testName];
      LOBYTE(a3) = v10 != 0;
    }
  }

  return a3;
}

- (BOOL)checkTestRequirementsWithError:(id *)a3
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  if (!RecapLibraryCore())
  {
    dispatch_time_t v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F28588];
    v22[0] = *MEMORY[0x1E4F28578];
    v22[1] = v6;
    v23[0] = @"Recap.framework is unavaliable.";
    v23[1] = @"The framework failed to be loaded in via soft-linking.";
    v22[2] = *MEMORY[0x1E4F285A0];
    v23[2] = @"Check you are on a supported platform.";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
    char v8 = [v5 errorWithDomain:@"com.apple.RecapPerformanceTesting" code:3 userInfo:v7];
    [v4 addObject:v8];
  }
  int v9 = +[RPTEntitlementChecker checkerForCurrentProcess];
  BOOL v10 = v9;
  if (v9)
  {
    id v19 = 0;
    char v11 = [v9 checkWithError:&v19];
    int v12 = v19;
    if ((v11 & 1) == 0) {
      [v4 addObject:v12];
    }
    uint64_t v13 = [v4 count];
    BOOL v14 = v13 == 0;
    if (a3 && v13)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F28750];
      v20[0] = *MEMORY[0x1E4F28578];
      v20[1] = v16;
      v21[0] = @"Test running requirements failed.";
      v21[1] = v4;
      char v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
      *a3 = [v15 errorWithDomain:@"com.apple.RecapPerformanceTesting" code:1 userInfo:v17];

      BOOL v14 = 0;
    }
  }
  else
  {
    int v12 = RPTLogTestRunning();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[RPTTestRunner checkTestRequirementsWithError:](v12);
    }
    BOOL v14 = 1;
  }

  return v14;
}

- (RPTInteractionOptions)interactionOptions
{
  return self->_interactionOptions;
}

- (void)setInteractionOptions:(id)a3
{
}

- (RPTTestRunnerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RPTTestRunnerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RPTSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlinePlayer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interactionOptions, 0);
}

- (void)_failWithParameters:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B626C000, log, OS_LOG_TYPE_ERROR, "RPT: -[RPTTestRunner _failWithParameters: %{public}@ error: %{public}@]", (uint8_t *)&v3, 0x16u);
}

- (void)checkTestRequirementsWithError:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B626C000, log, OS_LOG_TYPE_ERROR, "Could not verify process' entitlements but will try anyways. Likely an XPCService or Daemon. If nothing works, please check your entitlements.", v1, 2u);
}

@end