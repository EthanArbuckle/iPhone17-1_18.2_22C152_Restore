@interface UPContextualizerStrategyPrompt
- (UPContextualizerStrategyPrompt)initWithPrebuiltIntentThreshold:(double)a3 usoSerializer:(id)a4;
- (UPUsoSerializer)usoSerializer;
- (double)prebuiltIntentThreshold;
- (id)resultUsingContextualizerInput:(id)a3;
@end

@implementation UPContextualizerStrategyPrompt

- (void).cxx_destruct
{
}

- (UPUsoSerializer)usoSerializer
{
  return self->_usoSerializer;
}

- (double)prebuiltIntentThreshold
{
  return self->_prebuiltIntentThreshold;
}

- (id)resultUsingContextualizerInput:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 dialogAct];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[UPContextualizerStrategyPrompt resultUsingContextualizerInput:]", "UPContextualizerStrategyPrompt.m", 45, "[dialogAct isKindOfClass:[UPDialogActPrompt class]]");
  }
  uint64_t v6 = [v5 reference];
  v7 = [v4 coreResult];
  v35 = (void *)v6;
  uint64_t v8 = +[UPContextualizerUtilities createConfirmOrRejectedDialogActsFor:v7 reference:v6];

  v9 = [UPContextualizerInput alloc];
  v10 = [v4 domainResult];
  v11 = [v4 modelIdentifier];
  v12 = [v4 query];
  v33 = (void *)v8;
  v34 = v5;
  v13 = [(UPContextualizerInput *)v9 initWithDomainResult:v10 coreResult:v8 modelIdentifier:v11 query:v12 dialogAct:v5];

  v14 = [(UPContextualizerInput *)v13 dialogAct];
  v15 = [(UPContextualizerInput *)v13 query];
  v16 = [v14 entityName];
  v17 = [(UPContextualizerInput *)v13 domainResult];
  v32 = self;
  v18 = +[UPContextualizerUtilities filterResult:v17 byEntityName:v16 serializer:self->_usoSerializer];

  uint64_t v19 = [v18 candidateCount];
  v20 = SNLPOSLoggerForCategory(3);
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v19 < 1)
  {
    if (v21)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v37 = (uint64_t)v16;
      _os_log_impl(&dword_1C8DA9000, v20, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyPrompt: No domain result matched dialog act prompted entity (%@)", buf, 0xCu);
    }

    v24 = v33;
    goto LABEL_10;
  }
  if (v21)
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v37 = v19;
    __int16 v38 = 2112;
    v39 = v16;
    _os_log_impl(&dword_1C8DA9000, v20, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyPrompt; %ld domain candidates matched dialog act prompted entity (%@)",
      buf,
      0x16u);
  }

  v22 = [v14 intent];
  v23 = +[UPContextualizerUtilities resultFromResult:v18 withNewIntent:v22];

  v24 = v33;
  if (!v23)
  {
LABEL_10:
    v25 = [v14 entityType];
    int v26 = [v25 isEqualToString:@"string"];

    if (v26)
    {
      v27 = SNLPOSLoggerForCategory(3);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C8DA9000, v27, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyPrompt: Building verbatim string payload", buf, 2u);
      }

      v28 = [(UPContextualizerInput *)v13 modelIdentifier];
      v29 = [v14 intent];
      v30 = [v14 entityName];
      v23 = +[UPContextualizerUtilities buildPayloadResultFromQuery:v15 modelIdentifier:v28 intent:v29 entityName:v30 serializer:v32->_usoSerializer];
    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

- (UPContextualizerStrategyPrompt)initWithPrebuiltIntentThreshold:(double)a3 usoSerializer:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UPContextualizerStrategyPrompt;
  uint64_t v8 = [(UPContextualizerStrategyPrompt *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_prebuiltIntentThreshold = a3;
    objc_storeStrong((id *)&v8->_usoSerializer, a4);
  }

  return v9;
}

@end