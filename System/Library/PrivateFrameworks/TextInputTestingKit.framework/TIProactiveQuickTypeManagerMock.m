@interface TIProactiveQuickTypeManagerMock
- (BOOL)isAutoCompleteEnabled;
- (BOOL)isAutoPopupEnabled;
- (BOOL)isEnabled;
- (BOOL)usePQT2Flow;
- (NSDictionary)metrics;
- (TIProactiveQuickTypeManagerMock)init;
- (id)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6;
- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 isContinuousPath:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14;
- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14;
- (id)getMeCardEmailAddresses;
- (id)searchForMeCardEmailAddresses;
- (id)searchForMeCardRegions;
- (void)generateAndRenderProactiveSuggestionsForInput:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withIsResponseDenyListed:(BOOL)a13 withShouldDisableAutoCaps:(BOOL)a14 withAvailableApps:(id)a15 logBlock:(id)a16 async:(BOOL)a17 completion:(id)a18;
- (void)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6 async:(BOOL)a7 completion:(id)a8;
- (void)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 isContinuousPath:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14 async:(BOOL)a15 completion:(id)a16;
- (void)propogateMetrics:(id)a3 data:(id)a4;
- (void)setMetrics:(id)a3;
@end

@implementation TIProactiveQuickTypeManagerMock

- (void).cxx_destruct
{
}

- (void)setMetrics:(id)a3
{
}

- (NSDictionary)metrics
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)searchForMeCardRegions
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)searchForMeCardEmailAddresses
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)propogateMetrics:(id)a3 data:(id)a4
{
}

- (id)getMeCardEmailAddresses
{
  return (id)MEMORY[0x263EFFA68];
}

- (BOOL)usePQT2Flow
{
  return 1;
}

- (BOOL)isAutoCompleteEnabled
{
  return 1;
}

- (BOOL)isAutoPopupEnabled
{
  return 1;
}

- (BOOL)isEnabled
{
  return 1;
}

- (void)generateAndRenderProactiveSuggestionsForInput:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 nextInputWillInsertAutospace:(BOOL)a12 withIsResponseDenyListed:(BOOL)a13 withShouldDisableAutoCaps:(BOOL)a14 withAvailableApps:(id)a15 logBlock:(id)a16 async:(BOOL)a17 completion:(id)a18
{
  v19 = (void (**)(id, void *))a18;
  v20 = NSDictionary;
  id v21 = a8;
  v22 = [v20 dictionaryWithObjects:&unk_26F2C9E10 forKeys:&unk_26F2C9E28];
  v23 = [MEMORY[0x263F08708] newlineCharacterSet];
  v24 = [v21 componentsSeparatedByCharactersInSet:v23];

  id v28 = [v24 lastObject];

  v25 = [v22 objectForKey:v28];
  if (v25)
  {
    v26 = [MEMORY[0x263F7E640] secureCandidateForInput:v25 slotID:100];
    v27 = [MEMORY[0x263EFF980] array];
    [v27 addObject:v26];
  }
  else
  {
    v27 = 0;
  }
  v19[2](v19, v27);
}

- (void)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6 async:(BOOL)a7 completion:(id)a8
{
}

- (id)generateAndRenderProactiveSuggestionsWithInput:(id)a3 withSecureCandidateRenderer:(id)a4 withRenderTraits:(id)a5 textContentType:(id)a6
{
  return 0;
}

- (void)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 isContinuousPath:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14 async:(BOOL)a15 completion:(id)a16
{
  id v21 = (void (**)(id, void *))a16;
  uint64_t v17 = [a3 count];
  if (v17)
  {
    uint64_t v18 = v17;
    v19 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v17];
    do
    {
      v20 = [MEMORY[0x263F7E640] secureCandidateForInput:&stru_26F2B7E50 slotID:100];
      [v19 addObject:v20];

      --v18;
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }
  v21[2](v21, v19);
}

- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withKeyboardState:(id)a4 withAdditionalPredictions:(id)a5 withSecureCandidateRenderer:(id)a6 withRenderTraits:(id)a7 withInput:(id)a8 withRecipient:(id)a9 withApplication:(id)a10 withLocale:(id)a11 isContinuousPath:(BOOL)a12 withAvailableApps:(id)a13 logBlock:(id)a14
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v33 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a13;
  id v28 = a14;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__1616;
  v41 = __Block_byref_object_dispose__1617;
  id v42 = 0;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __269__TIProactiveQuickTypeManagerMock_generateAndRenderProactiveSuggestionsWithTriggers_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_isContinuousPath_withAvailableApps_logBlock___block_invoke;
  v36[3] = &unk_2650505F0;
  v36[4] = &v37;
  LOBYTE(v32) = 0;
  LOBYTE(v31) = a12;
  v34 = v20;
  [(TIProactiveQuickTypeManagerMock *)self generateAndRenderProactiveSuggestionsWithTriggers:v19 withKeyboardState:v20 withAdditionalPredictions:v21 withSecureCandidateRenderer:v22 withRenderTraits:v23 withInput:v33 withRecipient:v24 withApplication:v25 withLocale:v26 isContinuousPath:v31 withAvailableApps:v27 logBlock:v28 async:v32 completion:v36];
  id v29 = (id)v38[5];
  _Block_object_dispose(&v37, 8);

  return v29;
}

void __269__TIProactiveQuickTypeManagerMock_generateAndRenderProactiveSuggestionsWithTriggers_withKeyboardState_withAdditionalPredictions_withSecureCandidateRenderer_withRenderTraits_withInput_withRecipient_withApplication_withLocale_isContinuousPath_withAvailableApps_logBlock___block_invoke(uint64_t a1, void *a2)
{
}

- (TIProactiveQuickTypeManagerMock)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIProactiveQuickTypeManagerMock;
  v2 = [(TIProactiveQuickTypeManagerMock *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    metrics = v2->_metrics;
    v2->_metrics = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end