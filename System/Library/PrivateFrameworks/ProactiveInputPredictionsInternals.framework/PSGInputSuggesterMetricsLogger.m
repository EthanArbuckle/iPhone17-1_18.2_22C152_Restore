@interface PSGInputSuggesterMetricsLogger
- (PSGInputSuggesterMetricsLogger)init;
- (PSGInputSuggesterMetricsLogger)initWithTracker:(id)a3;
- (int)_errorTypeProto:(unsigned __int8)a3;
- (int)_predictionDataSourceTypeProto:(unsigned __int8)a3;
- (int)_triggerSourceTypeProto:(unint64_t)a3;
- (void)_populatePredictionItems:(id)a3 proto:(id)a4;
- (void)_populateQueryFields:(id)a3 proto:(id)a4;
- (void)_populateTreatmentFields:(id)a3 proto:(id)a4;
- (void)_populateTriggerAttributeFields:(id)a3 proto:(id)a4;
- (void)_populateTriggerFields:(id)a3 proto:(id)a4;
- (void)logEngagement:(id)a3 request:(id)a4 position:(unint64_t)a5 config:(id)a6;
- (void)logError:(unsigned __int8)a3 request:(id)a4 trigger:(id)a5 config:(id)a6;
- (void)logImpression:(id)a3 request:(id)a4 config:(id)a5;
- (void)logPrediction:(id)a3 request:(id)a4 latencyMillis:(double)a5 config:(id)a6;
- (void)logQuery:(id)a3 config:(id)a4;
- (void)logSpeedMetricForLocaleIdentifier:(id)a3 messageDurationMilliseconds:(int)a4 messageLength:(int)a5 messageWords:(int)a6 zkwConfig:(id)a7 wordBoundaryConfig:(id)a8;
- (void)logTrigger:(id)a3 request:(id)a4 config:(id)a5;
@end

@implementation PSGInputSuggesterMetricsLogger

- (void).cxx_destruct
{
}

- (int)_errorTypeProto:(unsigned __int8)a3
{
  if (a3 < 4u) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (void)_populateTriggerAttributeFields:(id)a3 proto:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (_populateTriggerAttributeFields_proto__once != -1) {
    dispatch_once(&_populateTriggerAttributeFields_proto__once, &__block_literal_global_1795);
  }
  v7 = [v5 valueForKey:*MEMORY[0x263F51238]];
  v8 = [v5 valueForKey:*MEMORY[0x263F51220]];
  [v6 setTriggerAttributeType:v7];
  [v6 setTriggerAttributeSubtype:v8];
  v9 = [v5 valueForKey:*MEMORY[0x263F61910]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [(id)_populateTriggerAttributeFields_proto__map objectForKeyedSubscript:v9];
    if ([(__CFString *)v10 length])
    {
      v11 = v6;
      v12 = v10;
    }
    else
    {
      v14 = psg_default_log_handle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        int v17 = 138412290;
        id v18 = v5;
        _os_log_fault_impl(&dword_23EAA9000, v14, OS_LOG_TYPE_FAULT, "Invalid search field for Contacts Autocomplete trigger: %@", (uint8_t *)&v17, 0xCu);
      }

      v12 = @"Invalid";
      v11 = v6;
    }
    [v11 setTriggerAttributeField:v12];
  }
  else
  {
    uint64_t v13 = [v5 valueForKey:*MEMORY[0x263F51218]];

    if (!v13)
    {
      v9 = [v5 valueForKey:*MEMORY[0x263F511B8]];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = v6;
        v16 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_17;
        }
        v16 = @"NSNull";
        v15 = v6;
      }
      [v15 setTriggerAttributeField:v16];
      goto LABEL_17;
    }
    [v6 setTriggerAttributeField:v13];
    v9 = (__CFString *)v13;
  }
LABEL_17:
}

void __72__PSGInputSuggesterMetricsLogger__populateTriggerAttributeFields_proto___block_invoke()
{
  v5[3] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F511F8];
  v4[0] = &unk_26F241E80;
  v4[1] = &unk_26F241E98;
  uint64_t v1 = *MEMORY[0x263F511C0];
  v5[0] = v0;
  v5[1] = v1;
  v4[2] = &unk_26F241EB0;
  v5[2] = *MEMORY[0x263F511A8];
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
  v3 = (void *)_populateTriggerAttributeFields_proto__map;
  _populateTriggerAttributeFields_proto__map = v2;
}

- (int)_predictionDataSourceTypeProto:(unsigned __int8)a3
{
  if ((a3 - 1) < 0xA) {
    return (a3 - 1) + 1;
  }
  else {
    return 0;
  }
}

- (int)_triggerSourceTypeProto:(unint64_t)a3
{
  if (a3 < 6) {
    return a3 + 1;
  }
  else {
    return 0;
  }
}

- (void)_populateTriggerFields:(id)a3 proto:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend(v6, "setTriggerSourceType:", -[PSGInputSuggesterMetricsLogger _triggerSourceTypeProto:](self, "_triggerSourceTypeProto:", objc_msgSend(v7, "triggerSourceType")));
  v8 = [v7 triggerCategory];
  [v6 setTriggerCategory:v8];

  id v9 = [v7 triggerAttributes];

  [(PSGInputSuggesterMetricsLogger *)self _populateTriggerAttributeFields:v9 proto:v6];
}

- (void)_populateQueryFields:(id)a3 proto:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 responseContext];
  objc_msgSend(v5, "setHasResponseContext:", objc_msgSend(v7, "length") != 0);

  objc_msgSend(v5, "setIsResponseContextBlacklisted:", objc_msgSend(v6, "isResponseContextBlacklisted"));
  objc_msgSend(v5, "setIsDocumentEmpty:", objc_msgSend(v6, "isDocumentEmpty"));
  v8 = [v6 textContentType];
  [v5 setTextContentType:v8];

  id v9 = [v6 contextBeforeInput];
  objc_msgSend(v5, "setHasContextBeforeInput:", objc_msgSend(v9, "length") != 0);

  v10 = [v6 recipientNames];
  objc_msgSend(v5, "setHasRecipientNames:", objc_msgSend(v10, "count") != 0);

  v11 = [v6 localeIdentifier];
  [v5 setLocaleIdentifier:v11];

  v12 = [v6 bundleIdentifier];
  [v5 setBundleIdentifier:v12];

  objc_msgSend(v5, "setMaxTextualResponseItems:", objc_msgSend(v6, "textualResponseLimit"));
  objc_msgSend(v5, "setMaxStructuredInfoItems:", objc_msgSend(v6, "structuredInfoLimit"));
  objc_msgSend(v5, "setMaxPredictionItems:", objc_msgSend(v6, "totalSuggestionsLimit"));
  id v13 = [v6 initiatingProcess];

  [v5 setInitiatingProcess:v13];
}

- (void)_populatePredictionItems:(id)a3 proto:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v5;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    char v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v26;
    uint64_t v22 = *(void *)v26;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v16 = [v15 textualResponseSuggestion];

        if (v16)
        {
          uint64_t v11 = (v11 + 1);
          if (v9)
          {
            char v9 = 1;
            continue;
          }
          id v18 = [v15 textualResponseSuggestion];
          uint64_t v19 = [v18 responseCategory];
          [v6 setTextualResponseCategory:v19];
          char v9 = 1;
        }
        else
        {
          int v17 = [v15 structuredInfoSuggestion];

          if (!v17) {
            continue;
          }
          uint64_t v12 = (v12 + 1);
          if (v10)
          {
            char v10 = 1;
            continue;
          }
          v20 = [v15 structuredInfoSuggestion];
          v21 = [v20 proactiveTrigger];
          [(PSGInputSuggesterMetricsLogger *)self _populateTriggerFields:v21 proto:v6];

          id v18 = [v15 structuredInfoSuggestion];
          uint64_t v19 = [v18 portraitItem];
          uint64_t v13 = v22;
          objc_msgSend(v6, "setDataSourceType:", -[PSGInputSuggesterMetricsLogger _predictionDataSourceTypeProto:](self, "_predictionDataSourceTypeProto:", objc_msgSend(v19, "source")));
          char v10 = 1;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (!v8) {
        goto LABEL_19;
      }
    }
  }
  uint64_t v11 = 0;
  uint64_t v12 = 0;
LABEL_19:
  [v6 setNumTextualResponseItems:v11];
  [v6 setNumStructuredInfoItems:v12];
}

- (void)_populateTreatmentFields:(id)a3 proto:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 experimentIdentifiers];
  uint64_t v8 = [v7 experimentId];
  [v5 setExperimentId:v8];

  char v9 = [v6 experimentIdentifiers];
  char v10 = [v9 treatmentId];
  [v5 setTreatmentId:v10];

  id v11 = [v6 treatmentName];

  [v5 setTreatmentName:v11];
}

- (void)logSpeedMetricForLocaleIdentifier:(id)a3 messageDurationMilliseconds:(int)a4 messageLength:(int)a5 messageWords:(int)a6 zkwConfig:(id)a7 wordBoundaryConfig:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  uint64_t v10 = *(void *)&a5;
  uint64_t v11 = *(void *)&a4;
  id v14 = a8;
  id v15 = a7;
  id v16 = a3;
  id v27 = (id)objc_opt_new();
  int v17 = [v15 experimentIdentifiers];
  id v18 = [v17 experimentId];
  [v27 setZkwExperimentId:v18];

  uint64_t v19 = [v15 experimentIdentifiers];
  v20 = [v19 treatmentId];
  [v27 setZkwTreatmentId:v20];

  v21 = [v15 treatmentName];

  [v27 setZkwTreatmentName:v21];
  uint64_t v22 = [v14 experimentIdentifiers];
  v23 = [v22 experimentId];
  [v27 setWbExperimentId:v23];

  v24 = [v14 experimentIdentifiers];
  long long v25 = [v24 treatmentId];
  [v27 setWbTreatmentId:v25];

  long long v26 = [v14 treatmentName];

  [v27 setWbTreatmentName:v26];
  [v27 setLocaleIdentifier:v16];

  [v27 setMessageDurationMilliseconds:v11];
  [v27 setMessageLength:v10];
  [v27 setMessageWords:v9];
  [(PETEventTracker2 *)self->_tracker trackScalarForMessage:v27];
}

- (void)logError:(unsigned __int8)a3 request:(id)a4 trigger:(id)a5 config:(id)a6
{
  uint64_t v8 = a3;
  id v13 = a5;
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = objc_opt_new();
  [(PSGInputSuggesterMetricsLogger *)self _populateTreatmentFields:v10 proto:v12];

  [(PSGInputSuggesterMetricsLogger *)self _populateQueryFields:v11 proto:v12];
  if (v13) {
    [(PSGInputSuggesterMetricsLogger *)self _populateTriggerFields:v13 proto:v12];
  }
  objc_msgSend(v12, "setErrorType:", -[PSGInputSuggesterMetricsLogger _errorTypeProto:](self, "_errorTypeProto:", v8));
  [(PETEventTracker2 *)self->_tracker trackScalarForMessage:v12];
}

- (void)logEngagement:(id)a3 request:(id)a4 position:(unint64_t)a5 config:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v10 count])
  {
    id v13 = objc_opt_new();
    [(PSGInputSuggesterMetricsLogger *)self _populateTreatmentFields:v12 proto:v13];
    [(PSGInputSuggesterMetricsLogger *)self _populateQueryFields:v11 proto:v13];
    [(PSGInputSuggesterMetricsLogger *)self _populatePredictionItems:v10 proto:v13];
    [v13 setPosition:a5];
    [(PETEventTracker2 *)self->_tracker trackScalarForMessage:v13];
  }
  else
  {
    id v14 = psg_default_log_handle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v15 = 0;
      _os_log_error_impl(&dword_23EAA9000, v14, OS_LOG_TYPE_ERROR, "logEngagement called with zero item.", v15, 2u);
    }
  }
}

- (void)logImpression:(id)a3 request:(id)a4 config:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v11 = objc_opt_new();
    [(PSGInputSuggesterMetricsLogger *)self _populateTreatmentFields:v10 proto:v11];
    [(PSGInputSuggesterMetricsLogger *)self _populateQueryFields:v9 proto:v11];
    [(PSGInputSuggesterMetricsLogger *)self _populatePredictionItems:v8 proto:v11];
    [(PETEventTracker2 *)self->_tracker trackScalarForMessage:v11];
  }
  else
  {
    id v12 = psg_default_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v13 = 0;
      _os_log_error_impl(&dword_23EAA9000, v12, OS_LOG_TYPE_ERROR, "logImpression called with zero item.", v13, 2u);
    }
  }
}

- (void)logPrediction:(id)a3 request:(id)a4 latencyMillis:(double)a5 config:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  id v13 = objc_opt_new();
  [(PSGInputSuggesterMetricsLogger *)self _populateTreatmentFields:v11 proto:v13];

  [(PSGInputSuggesterMetricsLogger *)self _populateQueryFields:v12 proto:v13];
  id v14 = [v10 responseItems];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    id v16 = [v10 responseItems];
    [(PSGInputSuggesterMetricsLogger *)self _populatePredictionItems:v16 proto:v13];
  }
  else
  {
    int v17 = [v10 explanationSet];
    uint64_t v18 = [v17 count];

    if (v18)
    {
      uint64_t v19 = [v10 explanationSet];
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __77__PSGInputSuggesterMetricsLogger_logPrediction_request_latencyMillis_config___block_invoke;
      v20[3] = &unk_265038180;
      id v21 = v13;
      [v19 enumerateExplanationCodeWithBlock:v20];
    }
  }
  [(PETEventTracker2 *)self->_tracker trackDistributionForMessage:v13 value:a5];
}

uint64_t __77__PSGInputSuggesterMetricsLogger_logPrediction_request_latencyMillis_config___block_invoke(uint64_t result, int a2)
{
  if (a2 == 2) {
    return [*(id *)(result + 32) setRequiredAppUnavailable:1];
  }
  if (a2 == 1) {
    return [*(id *)(result + 32) setPortraitTimeout:1];
  }
  return result;
}

- (void)logTrigger:(id)a3 request:(id)a4 config:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (id)objc_opt_new();
  [(PSGInputSuggesterMetricsLogger *)self _populateTreatmentFields:v8 proto:v11];

  [(PSGInputSuggesterMetricsLogger *)self _populateQueryFields:v9 proto:v11];
  [(PSGInputSuggesterMetricsLogger *)self _populateTriggerFields:v10 proto:v11];

  [(PETEventTracker2 *)self->_tracker trackScalarForMessage:v11];
}

- (void)logQuery:(id)a3 config:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_opt_new();
  [(PSGInputSuggesterMetricsLogger *)self _populateTreatmentFields:v6 proto:v8];

  [(PSGInputSuggesterMetricsLogger *)self _populateQueryFields:v7 proto:v8];
  [(PETEventTracker2 *)self->_tracker trackScalarForMessage:v8];
}

- (PSGInputSuggesterMetricsLogger)initWithTracker:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSGInputSuggesterMetricsLogger;
  id v6 = [(PSGInputSuggesterMetricsLogger *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tracker, a3);
  }

  return v7;
}

- (PSGInputSuggesterMetricsLogger)init
{
  v3 = [MEMORY[0x263F61890] sharedInstance];
  v4 = [(PSGInputSuggesterMetricsLogger *)self initWithTracker:v3];

  return v4;
}

@end