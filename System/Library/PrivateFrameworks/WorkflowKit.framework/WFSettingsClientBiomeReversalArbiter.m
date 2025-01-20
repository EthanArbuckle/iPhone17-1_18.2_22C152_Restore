@interface WFSettingsClientBiomeReversalArbiter
+ (id)reversePublisherOptions;
- (BOOL)lastEventEquals:(id)a3;
- (BPSPublisher)publisher;
- (BPSPublisher)reversePublisher;
- (WFSettingsClientBiomeReversalArbiter)initWithBiomeStream:(id)a3;
- (WFSettingsClientBiomeReversalArbiter)initWithPublisher:(id)a3 reversePublisher:(id)a4;
- (void)getBookmarkForCurrentStateWithCompletionHandler:(id)a3;
- (void)getReversalStateWithBookmark:(id)a3 completionHandler:(id)a4;
@end

@implementation WFSettingsClientBiomeReversalArbiter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reversePublisher, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
}

- (BPSPublisher)reversePublisher
{
  return self->_reversePublisher;
}

- (BPSPublisher)publisher
{
  return self->_publisher;
}

- (BOOL)lastEventEquals:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__70131;
  v14 = __Block_byref_object_dispose__70132;
  id v15 = 0;
  v5 = [(WFSettingsClientBiomeReversalArbiter *)self publisher];
  v6 = [v5 last];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__WFSettingsClientBiomeReversalArbiter_lastEventEquals___block_invoke_2;
  v9[3] = &unk_1E6558768;
  v9[4] = &v10;
  id v7 = (id)[v6 sinkWithCompletion:&__block_literal_global_28 receiveInput:v9];

  LOBYTE(v5) = [(id)v11[5] isEqual:v4];
  _Block_object_dispose(&v10, 8);

  return (char)v5;
}

void __56__WFSettingsClientBiomeReversalArbiter_lastEventEquals___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 eventBody];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)getReversalStateWithBookmark:(id)a3 completionHandler:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, void, void *))a4;
  if (!v7)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFSettingsClientBiomeReversalArbiter.m", 58, @"Invalid parameter not satisfying: %@", @"bookmark" object file lineNumber description];
  }
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__70131;
  v36 = __Block_byref_object_dispose__70132;
  id v37 = 0;
  v9 = [(WFSettingsClientBiomeReversalArbiter *)self publisher];
  uint64_t v10 = [v9 last];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __87__WFSettingsClientBiomeReversalArbiter_getReversalStateWithBookmark_completionHandler___block_invoke_2;
  v31[3] = &unk_1E6558768;
  v31[4] = &v32;
  id v11 = (id)[v10 sinkWithCompletion:&__block_literal_global_19 receiveInput:v31];

  if (v33[5])
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    uint64_t v12 = [(WFSettingsClientBiomeReversalArbiter *)self publisher];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __87__WFSettingsClientBiomeReversalArbiter_getReversalStateWithBookmark_completionHandler___block_invoke_2_23;
    v26[3] = &unk_1E65587B0;
    v26[4] = &v27;
    id v13 = (id)[v12 drivableSinkWithBookmark:v7 completion:&__block_literal_global_22 shouldContinue:v26];

    if (*((unsigned char *)v28 + 24))
    {
      v14 = [MEMORY[0x1E4F28C58] userCancelledError];
      v8[2](v8, 0, v14);
    }
    else
    {
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x2020000000;
      char v25 = 0;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v41 = 0x3032000000;
      v42 = __Block_byref_object_copy__70131;
      v43 = __Block_byref_object_dispose__70132;
      id v44 = 0;
      v17 = [(WFSettingsClientBiomeReversalArbiter *)self reversePublisher];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __87__WFSettingsClientBiomeReversalArbiter_getReversalStateWithBookmark_completionHandler___block_invoke_4;
      v23[3] = &unk_1E65587D8;
      v23[4] = v24;
      v23[5] = &buf;
      v23[6] = &v32;
      id v18 = (id)[v17 drivableSinkWithBookmark:0 completion:&__block_literal_global_26 shouldContinue:v23];

      v19 = *(void **)(*((void *)&buf + 1) + 40);
      if (v19)
      {
        v20 = [v19 eventBody];
        ((void (**)(id, void *, void *))v8)[2](v8, v20, 0);
      }
      else
      {
        v21 = getWFBiomeReversalArbiterLogObject();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v38 = 136315138;
          v39 = "-[WFSettingsClientBiomeReversalArbiter getReversalStateWithBookmark:completionHandler:]";
          _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_ERROR, "%s The only record in the Biome stream is the one we bookmarked — there's nothing to restore to before that", v38, 0xCu);
        }

        v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.shortcuts.biomereversalarbiter" code:100 userInfo:0];
        v8[2](v8, 0, v20);
      }

      _Block_object_dispose(&buf, 8);
      _Block_object_dispose(v24, 8);
    }
    _Block_object_dispose(&v27, 8);
  }
  else
  {
    id v15 = getWFBiomeReversalArbiterLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[WFSettingsClientBiomeReversalArbiter getReversalStateWithBookmark:completionHandler:]";
      _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_ERROR, "%s The Biome stream is empty", (uint8_t *)&buf, 0xCu);
    }

    v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.shortcuts.biomereversalarbiter" code:100 userInfo:0];
    v8[2](v8, 0, v16);
  }
  _Block_object_dispose(&v32, 8);
}

void __87__WFSettingsClientBiomeReversalArbiter_getReversalStateWithBookmark_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
}

uint64_t __87__WFSettingsClientBiomeReversalArbiter_getReversalStateWithBookmark_completionHandler___block_invoke_2_23(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

BOOL __87__WFSettingsClientBiomeReversalArbiter_getReversalStateWithBookmark_completionHandler___block_invoke_4(void *a1, void *a2)
{
  id v4 = a2;
  v5 = v4;
  uint64_t v6 = *(void *)(a1[4] + 8);
  int v7 = *(unsigned __int8 *)(v6 + 24);
  if (*(unsigned char *)(v6 + 24))
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  }
  else if ([v4 isEqual:*(void *)(*(void *)(a1[6] + 8) + 40)])
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
  }

  return v7 == 0;
}

- (void)getBookmarkForCurrentStateWithCompletionHandler:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__70131;
  id v15 = __Block_byref_object_dispose__70132;
  id v16 = 0;
  v5 = [(WFSettingsClientBiomeReversalArbiter *)self publisher];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__WFSettingsClientBiomeReversalArbiter_getBookmarkForCurrentStateWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E6558700;
  v10[4] = &v11;
  id v6 = (id)[v5 sinkWithBookmark:0 completion:v10 receiveInput:&__block_literal_global_6_70152];

  uint64_t v7 = v12[5];
  if (v7)
  {
    v4[2](v4, v7, 0);
  }
  else
  {
    v8 = getWFBiomeReversalArbiterLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      id v18 = "-[WFSettingsClientBiomeReversalArbiter getBookmarkForCurrentStateWithCompletionHandler:]";
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_ERROR, "%s The Biome stream is empty", buf, 0xCu);
    }

    v9 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.shortcuts.biomereversalarbiter" code:100 userInfo:0];
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v9);
  }
  _Block_object_dispose(&v11, 8);
}

void __88__WFSettingsClientBiomeReversalArbiter_getBookmarkForCurrentStateWithCompletionHandler___block_invoke(uint64_t a1, int a2, id obj)
{
}

- (WFSettingsClientBiomeReversalArbiter)initWithPublisher:(id)a3 reversePublisher:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFSettingsClientBiomeReversalArbiter;
  v9 = [(WFSettingsClientBiomeReversalArbiter *)&v13 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_publisher, a3);
    objc_storeStrong((id *)&v10->_reversePublisher, a4);
    uint64_t v11 = v10;
  }

  return v10;
}

- (WFSettingsClientBiomeReversalArbiter)initWithBiomeStream:(id)a3
{
  id v4 = a3;
  v5 = [v4 publisher];
  id v6 = [(id)objc_opt_class() reversePublisherOptions];
  id v7 = [v4 publisherWithOptions:v6];

  id v8 = [(WFSettingsClientBiomeReversalArbiter *)self initWithPublisher:v5 reversePublisher:v7];
  return v8;
}

+ (id)reversePublisherOptions
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:0 endDate:0 maxEvents:0 lastN:0 reversed:1];
  return v2;
}

@end