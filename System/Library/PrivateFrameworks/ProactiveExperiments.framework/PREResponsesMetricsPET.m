@interface PREResponsesMetricsPET
- (BOOL)isApricotDevice;
- (PREResponsesMetricsPET)init;
- (PREResponsesMetricsPET)initWithExperimentResolver:(id)a3;
- (PREResponsesMetricsPET)initWithTracker:(id)a3 experimentResolver:(id)a4;
- (id)_responseListFromGeneratedEvent:(id)a3;
- (id)tracker;
- (void)registerResponseTapped:(id)a3;
- (void)registerResponseViewed:(id)a3;
- (void)registerResponsesGenerated:(id)a3;
@end

@implementation PREResponsesMetricsPET

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_resolver, 0);

  objc_storeStrong((id *)&self->_tracker, 0);
}

- (id)tracker
{
  return self->_tracker;
}

- (BOOL)isApricotDevice
{
  return 0;
}

- (void)registerResponseViewed:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = objc_opt_new();
    -[NSObject setLastViewedIndex:](v5, "setLastViewedIndex:", [v4 unsignedIntValue]);
    resolver = self->_resolver;
    v7 = [MEMORY[0x1E4F89D60] defaultLanguage];
    v8 = [(PREExperimentResolverProtocol *)resolver getResponseSuggestionsExperimentConfig:v7 shouldDownloadAssets:0];

    v9 = [v8 experimentIdentifiers];
    v10 = [v9 experimentId];
    [v5 setExperimentId:v10];

    v11 = [v8 experimentIdentifiers];
    v12 = [v11 treatmentId];
    [v5 setTreatmentId:v12];

    v13 = [v8 treatmentName];
    [v5 setTreatmentModelName:v13];

    [v5 setHostProcess:self->_processName];
    [v5 setIsApricotDevice:self->_isApricotDevice];
    tracker = self->_tracker;
    [v4 doubleValue];
    -[PETEventTracker2 trackDistributionForMessage:value:](tracker, "trackDistributionForMessage:value:", v5);
    v15 = pre_responses_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1CA622000, v15, OS_LOG_TYPE_DEFAULT, "PREResponsesMetricsPET finished logging responses viewed", v16, 2u);
    }
  }
  else
  {
    v5 = pre_responses_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA622000, v5, OS_LOG_TYPE_DEFAULT, "lastViewedIndex is nil. Skip logging", buf, 2u);
    }
  }
}

- (void)registerResponseTapped:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 selectedPosition];
    if (v6)
    {
      v7 = [v5 selectedPosition];
      uint64_t v8 = [v7 unsignedIntegerValue];
    }
    else
    {
      uint64_t v8 = 0xFFFFFFFFLL;
    }

    resolver = self->_resolver;
    v11 = [v5 responsesGeneratedEvent];
    v12 = [v11 language];
    v9 = [(PREExperimentResolverProtocol *)resolver getResponseSuggestionsExperimentConfig:v12 shouldDownloadAssets:0];

    v13 = objc_opt_new();
    v14 = [v5 responsesGeneratedEvent];

    if (v14)
    {
      v48 = v9;
      v15 = [v5 responsesGeneratedEvent];
      v16 = [v15 responses];
      unint64_t v17 = [v16 count];

      v47 = self;
      if (v17 <= v8)
      {
        [v13 setModelId:0xFFFFFFFFLL];
        [v13 setReplyTextId:0xFFFFFFFFLL];
        [v13 setResponseClassId:0xFFFFFFFFLL];
      }
      else
      {
        v18 = [v15 responses];
        v19 = [v18 objectAtIndexedSubscript:v8];

        v20 = [v19 modelId];
        objc_msgSend(v13, "setModelId:", objc_msgSend(v20, "unsignedIntegerValue"));

        [v13 setReplyTextId:0xFFFFFFFFLL];
        [v13 setResponseClassId:0xFFFFFFFFLL];
        v21 = [v19 isCustomResponse];
        objc_msgSend(v13, "setIsCustomResponse:", objc_msgSend(v21, "BOOLValue"));

        v22 = [v19 isRobotResponse];
        objc_msgSend(v13, "setIsRobotResponse:", objc_msgSend(v22, "BOOLValue"));
      }
      uint64_t v46 = v8;
      v49 = v5;
      v24 = [v15 locale];
      [v13 setLocale:v24];

      v25 = [v15 language];
      [v13 setLang:v25];

      objc_msgSend(v13, "setGenerationStatus:", objc_msgSend(v15, "generationStatus"));
      v26 = [v15 responses];
      objc_msgSend(v13, "setNumberOfResponsesGenerated:", objc_msgSend(v26, "count"));

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v45 = v15;
      v27 = [v15 responses];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = 0;
        uint64_t v31 = 0;
        uint64_t v32 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v51 != v32) {
              objc_enumerationMutation(v27);
            }
            v34 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            v35 = [v34 isCustomResponse];
            int v36 = [v35 BOOLValue];

            if (v36)
            {
              uint64_t v30 = (v30 + 1);
            }
            else
            {
              v37 = [v34 isRobotResponse];
              int v38 = [v37 BOOLValue];

              uint64_t v31 = (v31 + v38);
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v29);
      }
      else
      {
        uint64_t v30 = 0;
        uint64_t v31 = 0;
      }

      [v13 setNumberOfCustomResponses:v30];
      [v13 setNumberOfRobotResponses:v31];

      v9 = v48;
      v5 = v49;
      uint64_t v8 = v46;
      self = v47;
    }
    else
    {
      v23 = pre_responses_handle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA622000, v23, OS_LOG_TYPE_DEFAULT, "No generated list found in the tapped event. Probably due to process restart", buf, 2u);
      }

      [v13 setModelId:0xFFFFFFFFLL];
      [v13 setReplyTextId:0xFFFFFFFFLL];
      [v13 setResponseClassId:0xFFFFFFFFLL];
      [v13 setLocale:0];
      [v13 setLang:0];
      [v13 setGenerationStatus:0];
      [v13 setNumberOfResponsesGenerated:0xFFFFFFFFLL];
      [v13 setNumberOfCustomResponses:0xFFFFFFFFLL];
      [v13 setIsCustomResponse:0];
      [v13 setIsRobotResponse:0];
    }
    v39 = [v9 experimentIdentifiers];
    v40 = [v39 experimentId];
    [v13 setExperimentId:v40];

    v41 = [v9 experimentIdentifiers];
    v42 = [v41 treatmentId];
    [v13 setTreatmentId:v42];

    v43 = [v9 treatmentName];
    [v13 setTreatmentModelName:v43];

    [v13 setIsApricotDevice:self->_isApricotDevice];
    [v13 setHostProcess:self->_processName];
    objc_msgSend(v13, "setInputMethod:", objc_msgSend(v5, "inputMethod"));
    objc_msgSend(v13, "setHasQuestionMark:", objc_msgSend(v5, "hasQuestionMark"));
    [v13 setPosition:v8];
    -[PETEventTracker2 trackDistributionForMessage:value:](self->_tracker, "trackDistributionForMessage:value:", v13, (double)(unint64_t)[v5 timeToTap]);
    v44 = pre_responses_handle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA622000, v44, OS_LOG_TYPE_DEFAULT, "PREResponsesMetricsPET finished logging response tapped", buf, 2u);
    }
  }
  else
  {
    v9 = pre_responses_handle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA622000, v9, OS_LOG_TYPE_DEFAULT, "PREResponseTappedEvent is nil. Skip logging", buf, 2u);
    }
  }
}

- (id)_responseListFromGeneratedEvent:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  resolver = self->_resolver;
  v6 = [v4 language];
  v7 = [(PREExperimentResolverProtocol *)resolver getResponseSuggestionsExperimentConfig:v6 shouldDownloadAssets:0];

  uint64_t v8 = objc_opt_new();
  v9 = [v7 experimentIdentifiers];
  v10 = [v9 experimentId];
  [v8 setExperimentId:v10];

  v11 = [v7 experimentIdentifiers];
  v12 = [v11 treatmentId];
  [v8 setTreatmentId:v12];

  v33 = v7;
  v13 = [v7 treatmentName];
  [v8 setTreatmentModelName:v13];

  v14 = objc_opt_new();
  [v14 setHostProcess:self->_processName];
  v15 = [v4 locale];
  [v14 setLocale:v15];

  v16 = [v4 language];
  [v14 setLang:v16];

  [v14 setIsApricotDevice:self->_isApricotDevice];
  objc_msgSend(v14, "setCharCount:", objc_msgSend(v4, "messageCharCount"));
  uint64_t v32 = v14;
  objc_msgSend(v14, "setHasQuestionMark:", objc_msgSend(v4, "hasQuestionMark"));
  id v17 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v18 = [v4 responses];
  v19 = objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v18, "count"));

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v20 = [v4 responses];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v26 = objc_opt_new();
        v27 = [v25 modelId];
        objc_msgSend(v26, "setModelId:", objc_msgSend(v27, "unsignedIntegerValue"));

        [v26 setResponseClassId:0xFFFFFFFFLL];
        [v26 setReplyTextId:0xFFFFFFFFLL];
        uint64_t v28 = [v25 isCustomResponse];
        objc_msgSend(v26, "setIsCustomResponse:", objc_msgSend(v28, "BOOLValue"));

        uint64_t v29 = [v25 isRobotResponse];
        objc_msgSend(v26, "setIsRobotResponse:", objc_msgSend(v29, "BOOLValue"));

        [v19 addObject:v26];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v22);
  }

  uint64_t v30 = objc_opt_new();
  [v30 setExperiment:v8];
  [v30 setMsgMetadata:v32];
  [v30 setItems:v19];
  objc_msgSend(v30, "setIsCached:", objc_msgSend(v4, "isCached"));
  objc_msgSend(v30, "setResponseTimePerf:", objc_msgSend(v4, "responseTimePerf"));
  objc_msgSend(v30, "setGenerationStatus:", objc_msgSend(v4, "generationStatus"));

  return v30;
}

- (void)registerResponsesGenerated:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    resolver = self->_resolver;
    v7 = [v4 language];
    uint64_t v8 = [(PREExperimentResolverProtocol *)resolver getResponseSuggestionsExperimentConfig:v7 shouldDownloadAssets:0];

    *(void *)buf = 0;
    long long v34 = buf;
    uint64_t v35 = 0x2020000000;
    int v36 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = &v29;
    uint64_t v31 = 0x2020000000;
    int v32 = 0;
    v9 = [v5 responses];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __53__PREResponsesMetricsPET_registerResponsesGenerated___block_invoke;
    v23[3] = &unk_1E65B1B08;
    v10 = v8;
    v24 = v10;
    v25 = self;
    id v11 = v5;
    id v26 = v11;
    v27 = buf;
    uint64_t v28 = &v29;
    [v9 enumerateObjectsUsingBlock:v23];

    v12 = objc_opt_new();
    objc_msgSend(v12, "setIsCached:", objc_msgSend(v11, "isCached"));
    v13 = [v10 experimentIdentifiers];
    v14 = [v13 experimentId];
    [v12 setExperimentId:v14];

    v15 = [v10 experimentIdentifiers];
    v16 = [v15 treatmentId];
    [v12 setTreatmentId:v16];

    id v17 = [v10 treatmentName];
    [v12 setTreatmentModelName:v17];

    [v12 setHostProcess:self->_processName];
    v18 = [v11 locale];
    [v12 setLocale:v18];

    v19 = [v11 language];
    [v12 setLang:v19];

    [v12 setIsApricotDevice:self->_isApricotDevice];
    objc_msgSend(v12, "setGenerationStatus:", objc_msgSend(v11, "generationStatus"));
    v20 = [v11 responses];
    objc_msgSend(v12, "setNumberOfResponsesGenerated:", objc_msgSend(v20, "count"));

    [v12 setNumberOfCustomResponses:*((unsigned int *)v34 + 6)];
    [v12 setNumberOfRobotResponses:*((unsigned int *)v30 + 6)];
    -[PETEventTracker2 trackDistributionForMessage:value:](self->_tracker, "trackDistributionForMessage:value:", v12, (double)(unint64_t)[v11 responseTimePerf]);
    uint64_t v21 = pre_responses_handle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_impl(&dword_1CA622000, v21, OS_LOG_TYPE_DEFAULT, "PREResponsesMetricsPET finished logging responses generated", v22, 2u);
    }

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v10 = pre_responses_handle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA622000, v10, OS_LOG_TYPE_DEFAULT, "PREResponsesGeneratedEvent is nil. Skip logging", buf, 2u);
    }
  }
}

void __53__PREResponsesMetricsPET_registerResponsesGenerated___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v19 = a2;
  v5 = objc_opt_new();
  v6 = [v19 modelId];
  objc_msgSend(v5, "setModelId:", objc_msgSend(v6, "unsignedIntegerValue"));

  [v5 setResponseClassId:0xFFFFFFFFLL];
  [v5 setReplyTextId:0xFFFFFFFFLL];
  [v5 setPosition:a3];
  v7 = [*(id *)(a1 + 32) experimentIdentifiers];
  uint64_t v8 = [v7 experimentId];
  [v5 setExperimentId:v8];

  v9 = [*(id *)(a1 + 32) experimentIdentifiers];
  v10 = [v9 treatmentId];
  [v5 setTreatmentId:v10];

  id v11 = [*(id *)(a1 + 32) treatmentName];
  [v5 setTreatmentModelName:v11];

  [v5 setHostProcess:*(void *)(*(void *)(a1 + 40) + 32)];
  v12 = [*(id *)(a1 + 48) locale];
  [v5 setLocale:v12];

  v13 = [*(id *)(a1 + 48) language];
  [v5 setLang:v13];

  [v5 setIsApricotDevice:*(unsigned __int8 *)(*(void *)(a1 + 40) + 24)];
  v14 = [v19 isCustomResponse];
  objc_msgSend(v5, "setIsCustomResponse:", objc_msgSend(v14, "BOOLValue"));

  v15 = [v19 isCustomResponse];
  LODWORD(v10) = [v15 BOOLValue];

  if (v10) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  v16 = [v19 isRobotResponse];
  objc_msgSend(v5, "setIsRobotResponse:", objc_msgSend(v16, "BOOLValue"));

  id v17 = [v19 isRobotResponse];
  int v18 = [v17 BOOLValue];

  if (v18) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  }
  [*(id *)(*(void *)(a1 + 40) + 8) trackScalarForMessage:v5];
}

- (PREResponsesMetricsPET)initWithTracker:(id)a3 experimentResolver:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PREResponsesMetricsPET;
  v9 = [(PREResponsesMetricsPET *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tracker, a3);
    objc_storeStrong((id *)&v10->_resolver, a4);
    v10->_isApricotDevice = [(PREResponsesMetricsPET *)v10 isApricotDevice];
    id v11 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v12 = [v11 processName];
    processName = v10->_processName;
    v10->_processName = (NSString *)v12;
  }
  return v10;
}

- (PREResponsesMetricsPET)initWithExperimentResolver:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93728];
  id v5 = a3;
  v6 = [v4 sharedInstance];
  id v7 = [(PREResponsesMetricsPET *)self initWithTracker:v6 experimentResolver:v5];

  return v7;
}

- (PREResponsesMetricsPET)init
{
  v3 = +[PREExperimentResolver sharedInstance];
  id v4 = [(PREResponsesMetricsPET *)self initWithExperimentResolver:v3];

  return v4;
}

@end