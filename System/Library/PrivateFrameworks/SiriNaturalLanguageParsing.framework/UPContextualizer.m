@interface UPContextualizer
- (UPContextualizer)init;
- (UPContextualizer)initWithPrebuiltIntentThreshold:(double)a3;
- (UPContextualizerStrategyCancel)cancelContextualizerStrategy;
- (UPContextualizerStrategyOffer)offerContextualizerStrategy;
- (UPContextualizerStrategyOptions)optionsContextualizerStrategy;
- (UPContextualizerStrategyPrompt)promptContextualizerStrategy;
- (double)prebuiltIntentThreshold;
- (id)_contextualizeByDialogActTypeUsingContextualizerInput:(id)a3;
- (id)resultWithContextualizerInput:(id)a3;
@end

@implementation UPContextualizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promptContextualizerStrategy, 0);
  objc_storeStrong((id *)&self->_optionsContextualizerStrategy, 0);
  objc_storeStrong((id *)&self->_offerContextualizerStrategy, 0);
  objc_storeStrong((id *)&self->_cancelContextualizerStrategy, 0);
}

- (UPContextualizerStrategyPrompt)promptContextualizerStrategy
{
  return self->_promptContextualizerStrategy;
}

- (UPContextualizerStrategyOptions)optionsContextualizerStrategy
{
  return self->_optionsContextualizerStrategy;
}

- (UPContextualizerStrategyOffer)offerContextualizerStrategy
{
  return self->_offerContextualizerStrategy;
}

- (UPContextualizerStrategyCancel)cancelContextualizerStrategy
{
  return self->_cancelContextualizerStrategy;
}

- (double)prebuiltIntentThreshold
{
  return self->_prebuiltIntentThreshold;
}

- (id)_contextualizeByDialogActTypeUsingContextualizerInput:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21[0] = objc_opt_class();
  v22[0] = self->_offerContextualizerStrategy;
  v21[1] = objc_opt_class();
  v22[1] = self->_optionsContextualizerStrategy;
  v21[2] = objc_opt_class();
  v22[2] = self->_promptContextualizerStrategy;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v6 = [v4 dialogAct];
  v7 = [v4 coreResult];
  v8 = +[UPContextualizerUtilities createConfirmOrRejectedDialogActsFor:v7 reference:0];

  v9 = [UPContextualizerInput alloc];
  v10 = [v4 domainResult];
  v11 = [v4 modelIdentifier];
  v12 = [v4 query];

  v13 = [(UPContextualizerInput *)v9 initWithDomainResult:v10 coreResult:v8 modelIdentifier:v11 query:v12 dialogAct:v6];
  v14 = [v5 objectForKey:objc_opt_class()];
  v15 = v14;
  if (v14)
  {
    v16 = [v14 resultUsingContextualizerInput:v13];
  }
  else
  {
    v17 = SNLPOSLoggerForCategory(3);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138739971;
      v20 = v6;
      _os_log_impl(&dword_1C8DA9000, v17, OS_LOG_TYPE_ERROR, "Could not find contextualizer strategy for dialog act: %{sensitive}@", (uint8_t *)&v19, 0xCu);
    }

    v16 = 0;
  }

  return v16;
}

- (id)resultWithContextualizerInput:(id)a3
{
  id v4 = a3;
  v5 = [v4 coreResult];
  uint64_t v6 = [v5 candidateCount];

  if (!v6
    || ([(UPContextualizerStrategyCancel *)self->_cancelContextualizerStrategy resultUsingContextualizerInput:v4], (v7 = objc_claimAutoreleasedReturnValue()) == 0)&& ([(UPContextualizer *)self _contextualizeByDialogActTypeUsingContextualizerInput:v4], (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = [v4 domainResult];
  }

  return v7;
}

- (UPContextualizer)init
{
  return [(UPContextualizer *)self initWithPrebuiltIntentThreshold:0.5];
}

- (UPContextualizer)initWithPrebuiltIntentThreshold:(double)a3
{
  v15.receiver = self;
  v15.super_class = (Class)UPContextualizer;
  id v4 = [(UPContextualizer *)&v15 init];
  if (v4)
  {
    v5 = objc_alloc_init(UPUsoSerializer);
    v4->_prebuiltIntentThreshold = a3;
    uint64_t v6 = [[UPContextualizerStrategyCancel alloc] initWithPrebuiltIntentThreshold:v4->_prebuiltIntentThreshold];
    cancelContextualizerStrategy = v4->_cancelContextualizerStrategy;
    v4->_cancelContextualizerStrategy = v6;

    v8 = [[UPContextualizerStrategyOffer alloc] initWithPrebuiltIntentThreshold:v4->_prebuiltIntentThreshold];
    offerContextualizerStrategy = v4->_offerContextualizerStrategy;
    v4->_offerContextualizerStrategy = v8;

    v10 = [[UPContextualizerStrategyOptions alloc] initWithPrebuiltIntentThreshold:v5 usoSerializer:v4->_prebuiltIntentThreshold];
    optionsContextualizerStrategy = v4->_optionsContextualizerStrategy;
    v4->_optionsContextualizerStrategy = v10;

    v12 = [[UPContextualizerStrategyPrompt alloc] initWithPrebuiltIntentThreshold:v5 usoSerializer:v4->_prebuiltIntentThreshold];
    promptContextualizerStrategy = v4->_promptContextualizerStrategy;
    v4->_promptContextualizerStrategy = v12;
  }
  return v4;
}

@end