@interface VUIDebugMetricsGladiatorsRulesets
+ (id)sharedInstance;
- (NSArray)rulesets;
- (VUIDebugMetricsGladiatorsRulesets)init;
- (void)setRulesets:(id)a3;
@end

@implementation VUIDebugMetricsGladiatorsRulesets

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__VUIDebugMetricsGladiatorsRulesets_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

void __51__VUIDebugMetricsGladiatorsRulesets_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v1;
}

- (VUIDebugMetricsGladiatorsRulesets)init
{
  v19.receiver = self;
  v19.super_class = (Class)VUIDebugMetricsGladiatorsRulesets;
  v2 = [(VUIDebugMetricsGladiatorsRulesets *)&v19 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CB10]);
    v4 = [@"https://ae-validator-service.amp.apple.com" stringByAppendingString:@"/v1/cache/manifest/"];
    v5 = [v4 stringByAppendingString:@"com.apple.amp.ae.validator.manifest.Video.AllRulesets"];
    v6 = (void *)[v3 initWithString:v5];

    id v7 = objc_alloc_init(MEMORY[0x1E4F28E88]);
    [v7 setHTTPMethod:@"GET"];
    [v7 addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [v7 setURL:v6];
    v8 = (void *)MEMORY[0x1E4F290E0];
    v9 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    v10 = [v8 sessionWithConfiguration:v9];

    objc_initWeak(&location, v2);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __41__VUIDebugMetricsGladiatorsRulesets_init__block_invoke;
    v16 = &unk_1E6DF4878;
    objc_copyWeak(&v17, &location);
    v11 = [v10 dataTaskWithRequest:v7 completionHandler:&v13];
    objc_msgSend(v11, "resume", v13, v14, v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __41__VUIDebugMetricsGladiatorsRulesets_init__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v7)
  {
    v9 = [v7 userInfo];
    v10 = [v9 description];
    NSLog(&cfstr_ErrorInGladiat_0.isa, v10);
  }
  else
  {
    id v28 = 0;
    v11 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:&v28];
    id v12 = v28;
    uint64_t v13 = v12;
    if (v12)
    {
      NSLog(&cfstr_ErrorParsingGl.isa, v12);
    }
    else
    {
      v23 = v11;
      uint64_t v14 = [v11 valueForKey:@"rulesets"];
      v15 = [MEMORY[0x1E4F1CA48] array];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = [*(id *)(*((void *)&v24 + 1) + 8 * i) valueForKey:@"name"];
            [v15 addObject:v21];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v18);
      }

      v22 = (void *)[v15 copy];
      [WeakRetained setRulesets:v22];

      uint64_t v13 = 0;
      v11 = v23;
    }
  }
}

- (NSArray)rulesets
{
  return self->_rulesets;
}

- (void)setRulesets:(id)a3
{
}

- (void).cxx_destruct
{
}

@end