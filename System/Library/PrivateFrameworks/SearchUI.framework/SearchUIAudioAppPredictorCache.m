@interface SearchUIAudioAppPredictorCache
- (SearchUIAudioAppPredictorCache)init;
- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4;
@end

@implementation SearchUIAudioAppPredictorCache

- (SearchUIAudioAppPredictorCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)SearchUIAudioAppPredictorCache;
  v2 = [(TLKAsyncCache *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v3 addObserver:v2 selector:sel_clear name:@"com.apple.LaunchServices.applicationRegistered" object:0];
    [v3 addObserver:v2 selector:sel_clear name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
  }
  return v2;
}

- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v8 = (void *)getSAAudioAppPredictorClass_softClass;
    uint64_t v25 = getSAAudioAppPredictorClass_softClass;
    if (!getSAAudioAppPredictorClass_softClass)
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __getSAAudioAppPredictorClass_block_invoke;
      v20 = &unk_1E6E72C90;
      v21 = &v22;
      __getSAAudioAppPredictorClass_block_invoke((uint64_t)&v17);
      v8 = (void *)v23[3];
    }
    v9 = v8;
    _Block_object_dispose(&v22, 8);
    v10 = (void *)[[v9 alloc] initWithCaller:6];
    v11 = +[SearchUIMediaUtilities mediaSearchForMetadata:v5];
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v12 = (void *)getSAAudioAppPredictorOptionsClass_softClass;
    uint64_t v25 = getSAAudioAppPredictorOptionsClass_softClass;
    if (!getSAAudioAppPredictorOptionsClass_softClass)
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      v19 = __getSAAudioAppPredictorOptionsClass_block_invoke;
      v20 = &unk_1E6E72C90;
      v21 = &v22;
      __getSAAudioAppPredictorOptionsClass_block_invoke((uint64_t)&v17);
      v12 = (void *)v23[3];
    }
    id v13 = v12;
    _Block_object_dispose(&v22, 8);
    v14 = objc_opt_new();
    [v14 setTrimDisambiguationForRelevance:1];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__SearchUIAudioAppPredictorCache_computeObjectForKey_completionHandler___block_invoke;
    v15[3] = &unk_1E6E734D8;
    id v16 = v7;
    [v10 predictWithSearch:v11 options:v14 completion:v15];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

uint64_t __72__SearchUIAudioAppPredictorCache_computeObjectForKey_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end