@interface WFActionRateLimiter
+ (id)sharedInstance;
+ (void)performAction:(id)a3 onQueue:(id)a4 withBlock:(id)a5;
- (NSDictionary)attempts;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)queue;
- (WFActionRateLimiter)init;
- (WFActionRateLimiter)initWithUserDefaults:(id)a3;
- (void)modify:(id)a3;
- (void)setAttempts:(id)a3;
@end

@implementation WFActionRateLimiter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)modify:(id)a3
{
  id v4 = a3;
  v5 = [(WFActionRateLimiter *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__WFActionRateLimiter_modify___block_invoke;
  v7[3] = &unk_1E65572A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __30__WFActionRateLimiter_modify___block_invoke(uint64_t a1)
{
  CFAllocatorRef v2 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  v3 = [*(id *)(a1 + 32) attempts];
  id DeepCopy = (id)CFPropertyListCreateDeepCopy(v2, v3, 1uLL);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) setAttempts:DeepCopy];
}

- (void)setAttempts:(id)a3
{
  id v4 = a3;
  id v5 = [(WFActionRateLimiter *)self userDefaults];
  [v5 setObject:v4 forKey:@"WFActionRateLimiter"];
}

- (NSDictionary)attempts
{
  CFAllocatorRef v2 = [(WFActionRateLimiter *)self userDefaults];
  v3 = [v2 dictionaryForKey:@"WFActionRateLimiter"];
  id v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v5 = v3;

  return v5;
}

- (WFActionRateLimiter)initWithUserDefaults:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"WFActionRateLimiter.m", 46, @"Invalid parameter not satisfying: %@", @"userDefaults" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)WFActionRateLimiter;
  v7 = [(WFActionRateLimiter *)&v13 init];
  if (v7)
  {
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.shortcuts.WFActionRateLimiter", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v7->_userDefaults, a3);
    v10 = v7;
  }

  return v7;
}

- (WFActionRateLimiter)init
{
  v3 = [MEMORY[0x1E4F1CB18] workflowUserDefaults];
  id v4 = [(WFActionRateLimiter *)self initWithUserDefaults:v3];

  return v4;
}

+ (void)performAction:(id)a3 onQueue:(id)a4 withBlock:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = a4;
  v11 = (void (**)(void))a5;
  v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_14:
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"WFActionRateLimiter.m", 77, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, a1, @"WFActionRateLimiter.m", 76, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

  if (!v12) {
    goto LABEL_14;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_15:
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, a1, @"WFActionRateLimiter.m", 78, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

LABEL_4:
  uint64_t v13 = [v9 rateLimitThreshold];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    v15 = [v9 identifier];
    v16 = [a1 sharedInstance];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __55__WFActionRateLimiter_performAction_onQueue_withBlock___block_invoke;
    v28[3] = &unk_1E654EA88;
    id v17 = v15;
    id v29 = v17;
    v31 = &v32;
    id v18 = v9;
    id v30 = v18;
    [v16 modify:v28];

    if (v33[3] <= v14)
    {
      v12[2](v12);
    }
    else
    {
      v19 = getWFWorkflowExecutionLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [v18 identifier];
        uint64_t v21 = [v18 rateLimitDelay];
        *(_DWORD *)buf = 136315906;
        v37 = "+[WFActionRateLimiter performAction:onQueue:withBlock:]";
        __int16 v38 = 2112;
        v39 = v20;
        __int16 v40 = 2048;
        uint64_t v41 = v14;
        __int16 v42 = 2048;
        uint64_t v43 = v21;
        _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_DEFAULT, "%s Action \"%@\" is being rate limited because it passed the threshold of %li runs. Delaying execution for %li seconds.", buf, 0x2Au);
      }
      dispatch_time_t v22 = dispatch_time(0, 1000000000 * [v18 rateLimitDelay]);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __55__WFActionRateLimiter_performAction_onQueue_withBlock___block_invoke_192;
      block[3] = &unk_1E6558678;
      v27 = v12;
      dispatch_after(v22, v10, block);
    }
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v12[2](v12);
  }
}

void __55__WFActionRateLimiter_performAction_onQueue_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  v3 = [v19 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v19 setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
  }

  id v6 = [v5 objectForKeyedSubscript:@"LastAttemptDate"];
  uint64_t v7 = objc_opt_class();
  dispatch_queue_t v8 = WFEnforceClass(v6, v7);

  id v9 = [v5 objectForKeyedSubscript:@"NumberOfAttempts"];
  uint64_t v10 = objc_opt_class();
  v11 = WFEnforceClass(v9, v10);
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v11 integerValue];

  [v8 timeIntervalSinceNow];
  double v13 = v12;
  uint64_t v14 = [*(id *)(a1 + 40) rateLimitTimeout];
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v13 <= (double)-v14) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = *(void *)(v15 + 24) + 1;
  }
  *(void *)(v15 + 24) = v16;
  id v17 = [NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  [v5 setObject:v17 forKeyedSubscript:@"NumberOfAttempts"];

  id v18 = [MEMORY[0x1E4F1C9C8] date];
  [v5 setObject:v18 forKeyedSubscript:@"LastAttemptDate"];
}

uint64_t __55__WFActionRateLimiter_performAction_onQueue_withBlock___block_invoke_192(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8796 != -1) {
    dispatch_once(&sharedInstance_onceToken_8796, &__block_literal_global_8797);
  }
  CFAllocatorRef v2 = (void *)sharedInstance_rateLimiter;
  return v2;
}

void __37__WFActionRateLimiter_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(WFActionRateLimiter);
  v1 = (void *)sharedInstance_rateLimiter;
  sharedInstance_rateLimiter = (uint64_t)v0;
}

@end