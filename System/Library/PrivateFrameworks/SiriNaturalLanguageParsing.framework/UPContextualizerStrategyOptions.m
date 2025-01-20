@interface UPContextualizerStrategyOptions
- (UPContextualizerStrategyOptions)initWithPrebuiltIntentThreshold:(double)a3 usoSerializer:(id)a4;
- (UPUsoSerializer)usoSerializer;
- (double)prebuiltIntentThreshold;
- (id)resultUsingContextualizerInput:(id)a3;
@end

@implementation UPContextualizerStrategyOptions

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
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 dialogAct];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    __assert_rtn("-[UPContextualizerStrategyOptions resultUsingContextualizerInput:]", "UPContextualizerStrategyOptions.m", 45, "[contextualizerInput.dialogAct isKindOfClass:[UPDialogActOptions class]]");
  }

  v6 = [v4 dialogAct];
  v7 = [v4 query];
  v8 = [v4 coreResult];
  double prebuiltIntentThreshold = self->_prebuiltIntentThreshold;
  v32[0] = @"selectOrdinal";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  BOOL v11 = +[UPContextualizerUtilities hasTopCandidate:v8 excedingProbability:v10 matchingOneOfIntents:prebuiltIntentThreshold];

  if (!v11) {
    goto LABEL_6;
  }
  v12 = SNLPOSLoggerForCategory(3);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v28) = 0;
    _os_log_impl(&dword_1C8DA9000, v12, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyOptions: Detected high-probability selectOrdinal intent in core result", (uint8_t *)&v28, 2u);
  }

  v13 = +[UPResult createResultFromExistingResult:v8 truncatedTo:1];
  if (!v13)
  {
LABEL_6:
    v14 = [v6 entityName];
    v15 = [v4 domainResult];
    v16 = +[UPContextualizerUtilities filterResult:v15 byEntityName:v14 serializer:self->_usoSerializer];

    uint64_t v17 = [v16 candidateCount];
    v18 = SNLPOSLoggerForCategory(3);
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
    if (v17 < 1)
    {
      if (v19)
      {
        int v28 = 138412290;
        uint64_t v29 = (uint64_t)v14;
        _os_log_impl(&dword_1C8DA9000, v18, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyOptions: No domain result matched dialog act prompted entity (%@)", (uint8_t *)&v28, 0xCu);
      }

      goto LABEL_14;
    }
    if (v19)
    {
      int v28 = 134218242;
      uint64_t v29 = v17;
      __int16 v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_1C8DA9000, v18, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyOptions: %ld domain candidates matched dialog act prompted entity (%@)", (uint8_t *)&v28, 0x16u);
    }

    v20 = [v6 intent];
    v13 = +[UPContextualizerUtilities resultFromResult:v16 withNewIntent:v20];

    if (!v13)
    {
LABEL_14:
      v21 = [v6 entityType];
      int v22 = [v21 isEqualToString:@"string"];

      if (v22)
      {
        v23 = SNLPOSLoggerForCategory(3);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v28) = 0;
          _os_log_impl(&dword_1C8DA9000, v23, OS_LOG_TYPE_DEBUG, "UPContextualizerStrategyOptions: Building verbatim string payload", (uint8_t *)&v28, 2u);
        }

        v24 = [v4 modelIdentifier];
        v25 = [v6 intent];
        v26 = [v6 entityName];
        v13 = +[UPContextualizerUtilities buildPayloadResultFromQuery:v7 modelIdentifier:v24 intent:v25 entityName:v26 serializer:self->_usoSerializer];
      }
      else
      {
        v13 = 0;
      }
    }
  }

  return v13;
}

- (UPContextualizerStrategyOptions)initWithPrebuiltIntentThreshold:(double)a3 usoSerializer:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UPContextualizerStrategyOptions;
  v8 = [(UPContextualizerStrategyOptions *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_double prebuiltIntentThreshold = a3;
    objc_storeStrong((id *)&v8->_usoSerializer, a4);
  }

  return v9;
}

@end