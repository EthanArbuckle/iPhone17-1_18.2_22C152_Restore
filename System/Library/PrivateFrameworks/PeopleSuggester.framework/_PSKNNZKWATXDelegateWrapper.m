@interface _PSKNNZKWATXDelegateWrapper
- (_PSKNNZKWATXDelegateWrapper)initWithKNNModel:(id)a3 fallbackInteractionConfig:(id)a4;
- (_PSKNNZKWATXDelegateWrapper)initWithKNNModel:(id)a3 modelType:(int64_t)a4 modelConfiguration:(id)a5 maxSuggestions:(unint64_t)a6 transformers:(id)a7 isEnabled:(BOOL)a8 defaultConfidenceCategory:(int64_t)a9;
- (_PSKNNZKWATXDelegateWrapper)initWithKNNModel:(id)a3 primaryInteractionsConfig:(id)a4;
- (id)_getInteractionFilterForPrimaryInteractionsModel;
- (id)getSuggestionsWithPredictionContext:(id)a3;
- (void)pingWithCompletion:(id)a3;
- (void)suggestionsForInteractionSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5;
- (void)updateWithFallbackInteractionsConfig:(id)a3;
- (void)updateWithPrimaryInteractionsConfig:(id)a3;
@end

@implementation _PSKNNZKWATXDelegateWrapper

- (_PSKNNZKWATXDelegateWrapper)initWithKNNModel:(id)a3 modelType:(int64_t)a4 modelConfiguration:(id)a5 maxSuggestions:(unint64_t)a6 transformers:(id)a7 isEnabled:(BOOL)a8 defaultConfidenceCategory:(int64_t)a9
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a7;
  v22.receiver = self;
  v22.super_class = (Class)_PSKNNZKWATXDelegateWrapper;
  v19 = [(_PSKNNZKWATXDelegateWrapper *)&v22 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_knnModel, a3);
    v20->_modelType = a4;
    objc_storeStrong((id *)&v20->_modelConfiguration, a5);
    v20->_maxSuggestions = a6;
    objc_storeStrong((id *)&v20->_transformers, a7);
    v20->_isEnabled = a8;
    v20->_defaultConfidenceCategory = a9;
  }

  return v20;
}

- (_PSKNNZKWATXDelegateWrapper)initWithKNNModel:(id)a3 primaryInteractionsConfig:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [_PSKNNModelConfiguration alloc];
  v9 = [v6 mechanisms];
  v10 = [v6 interactionCountMaxDepths];
  v11 = [v6 interactionHistoryRelativeStartDates];
  v12 = [v6 bundleIds];
  uint64_t v13 = [v6 modelType];
  v14 = [(_PSKNNZKWATXDelegateWrapper *)self _getInteractionFilterForPrimaryInteractionsModel];
  v15 = [(_PSKNNModelConfiguration *)v8 initWithInteractionMechanisms:v9 interactionCountMaxDepths:v10 interactionHistoryRelativeStartDates:v11 bundleIds:v12 modelType:v13 clusterPruneThreshold:5 modelName:@"PastFaceTimeCallsorMessages" shouldExcludeInteractionBlock:v14];

  id v16 = objc_opt_new();
  uint64_t v17 = [v6 maxSuggestions];
  id v18 = [v16 mapRecipientsToContactsWithUnmapped:0];
  v24[0] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  uint64_t v20 = [v6 isEnabled];
  uint64_t v21 = [v6 defaultConfidenceCategory];

  objc_super v22 = [(_PSKNNZKWATXDelegateWrapper *)self initWithKNNModel:v7 modelType:32 modelConfiguration:v15 maxSuggestions:v17 transformers:v19 isEnabled:v20 defaultConfidenceCategory:v21];
  return v22;
}

- (_PSKNNZKWATXDelegateWrapper)initWithKNNModel:(id)a3 fallbackInteractionConfig:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [_PSKNNModelConfiguration alloc];
  v9 = [v6 mechanisms];
  v10 = [v6 interactionCountMaxDepths];
  v11 = [v6 interactionHistoryRelativeStartDates];
  v12 = [v6 bundleIds];
  uint64_t v13 = -[_PSKNNModelConfiguration initWithInteractionMechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:modelName:](v8, "initWithInteractionMechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:modelName:", v9, v10, v11, v12, [v6 modelType], 5, @"PastPhoneCalls");

  v14 = objc_opt_new();
  uint64_t v15 = [v6 maxSuggestions];
  id v16 = [v14 mapRecipientsToContactsWithUnmapped:0];
  v22[0] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  uint64_t v18 = [v6 isEnabled];
  uint64_t v19 = [v6 defaultConfidenceCategory];

  uint64_t v20 = [(_PSKNNZKWATXDelegateWrapper *)self initWithKNNModel:v7 modelType:33 modelConfiguration:v13 maxSuggestions:v15 transformers:v17 isEnabled:v18 defaultConfidenceCategory:v19];
  return v20;
}

- (id)_getInteractionFilterForPrimaryInteractionsModel
{
  return &__block_literal_global_45;
}

- (void)updateWithPrimaryInteractionsConfig:(id)a3
{
  id v4 = a3;
  v5 = [_PSKNNModelConfiguration alloc];
  id v6 = [v4 mechanisms];
  id v7 = [v4 interactionCountMaxDepths];
  v8 = [v4 interactionHistoryRelativeStartDates];
  v9 = [v4 bundleIds];
  uint64_t v10 = [v4 modelType];
  v11 = [(_PSKNNZKWATXDelegateWrapper *)self _getInteractionFilterForPrimaryInteractionsModel];
  v12 = [(_PSKNNModelConfiguration *)v5 initWithInteractionMechanisms:v6 interactionCountMaxDepths:v7 interactionHistoryRelativeStartDates:v8 bundleIds:v9 modelType:v10 clusterPruneThreshold:5 modelName:@"PastFaceTimeCallsorMessages" shouldExcludeInteractionBlock:v11];
  modelConfiguration = self->_modelConfiguration;
  self->_modelConfiguration = v12;

  self->_isEnabled = [v4 isEnabled];
  int64_t v14 = [v4 defaultConfidenceCategory];

  self->_defaultConfidenceCategory = v14;
}

- (void)updateWithFallbackInteractionsConfig:(id)a3
{
  id v4 = a3;
  v5 = [_PSKNNModelConfiguration alloc];
  id v6 = [v4 mechanisms];
  id v7 = [v4 interactionCountMaxDepths];
  v8 = [v4 interactionHistoryRelativeStartDates];
  v9 = [v4 bundleIds];
  uint64_t v10 = -[_PSKNNModelConfiguration initWithInteractionMechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:modelName:](v5, "initWithInteractionMechanisms:interactionCountMaxDepths:interactionHistoryRelativeStartDates:bundleIds:modelType:clusterPruneThreshold:modelName:", v6, v7, v8, v9, [v4 modelType], 5, @"PastPhoneCalls");
  modelConfiguration = self->_modelConfiguration;
  self->_modelConfiguration = v10;

  self->_isEnabled = [v4 isEnabled];
  int64_t v12 = [v4 defaultConfidenceCategory];

  self->_defaultConfidenceCategory = v12;
}

- (id)getSuggestionsWithPredictionContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t modelType = self->_modelType;
  if (!self->_isEnabled)
  {
    id v7 = +[_PSLogging generalChannel];
    BOOL v11 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (modelType == 32)
    {
      if (!v11) {
        goto LABEL_26;
      }
      LOWORD(v17) = 0;
      int64_t v12 = "ZKW primary interaction model disabled. Not generating suggestions.";
    }
    else
    {
      if (!v11) {
        goto LABEL_26;
      }
      LOWORD(v17) = 0;
      int64_t v12 = "ZKW fallback interaction model disabled. Not generating suggestions.";
    }
    _os_log_impl(&dword_1A314B000, v7, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, 2u);
    goto LABEL_26;
  }
  if (modelType == 33)
  {
    uint64_t v13 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v13))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSFallbackInteractionModelTotalTime", " enableTelemetry=YES ", (uint8_t *)&v17, 2u);
    }

    id v7 = [(_PSKNNModel *)self->_knnModel rankedZkwSuggestionsWithPredictionContext:v4 modelConfiguration:self->_modelConfiguration maxSuggestions:self->_maxSuggestions];
    int64_t v14 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v14))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSFallbackInteractionModelTotalTime", (const char *)&unk_1A3274816, (uint8_t *)&v17, 2u);
    }

    v9 = +[_PSLogging generalChannel];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    int v17 = 138739971;
    uint64_t v18 = v7;
    uint64_t v10 = "ZKW fallback interaction suggestions: %{sensitive}@";
    goto LABEL_19;
  }
  if (modelType == 32)
  {
    id v6 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v6))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSFaceTimeInteractionModelTotalTime", " enableTelemetry=YES ", (uint8_t *)&v17, 2u);
    }

    id v7 = [(_PSKNNModel *)self->_knnModel rankedZkwSuggestionsWithPredictionContext:v4 modelConfiguration:self->_modelConfiguration maxSuggestions:self->_maxSuggestions];
    v8 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v8))
    {
      LOWORD(v17) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSFaceTimeInteractionModelTotalTime", (const char *)&unk_1A3274816, (uint8_t *)&v17, 2u);
    }

    v9 = +[_PSLogging generalChannel];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    int v17 = 138739971;
    uint64_t v18 = v7;
    uint64_t v10 = "ZKW primary interaction suggestions: %{sensitive}@";
LABEL_19:
    _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, 0xCu);
LABEL_20:

    uint64_t v15 = +[_PSFTZKWSuggestionsTransformerFactory getResultsFromTransformers:self->_transformers suggestions:v7];
    goto LABEL_27;
  }
  id v7 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[_PSKNNZKWATXDelegateWrapper getSuggestionsWithPredictionContext:](&self->_modelType, v7);
  }
LABEL_26:
  uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_27:

  return v15;
}

- (void)pingWithCompletion:(id)a3
{
}

- (void)suggestionsForInteractionSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v52 = a4;
  v50 = (void (**)(id, void *))a5;
  id v7 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_PSKNNZKWATXDelegateWrapper suggestionsForInteractionSuggestionRequest:clientModelId:reply:]((uint64_t)v54, v7);
  }

  v53 = [v54 psPredictionContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_PSKNNZKWATXDelegateWrapper suggestionsForInteractionSuggestionRequest:clientModelId:reply:]((uint64_t)v53, v8);
    }
  }
  v51 = [getATXProactiveSuggestionClientModelClass_1() clientModelIdFromClientModelType:self->_modelType];
  if ([v52 isEqualToString:v51])
  {
    v9 = [(_PSKNNZKWATXDelegateWrapper *)self getSuggestionsWithPredictionContext:v53];
    v57 = objc_opt_new();
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id obj = v9;
    uint64_t v58 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
    if (v58)
    {
      uint64_t v56 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v64 != v56) {
            objc_enumerationMutation(obj);
          }
          BOOL v11 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          uint64_t v72 = 0;
          v73 = &v72;
          uint64_t v74 = 0x2050000000;
          int64_t v12 = (void *)getATXProactiveSuggestionClientModelSpecificationClass_softClass_1;
          uint64_t v75 = getATXProactiveSuggestionClientModelSpecificationClass_softClass_1;
          if (!getATXProactiveSuggestionClientModelSpecificationClass_softClass_1)
          {
            uint64_t v67 = MEMORY[0x1E4F143A8];
            uint64_t v68 = 3221225472;
            v69 = __getATXProactiveSuggestionClientModelSpecificationClass_block_invoke_1;
            v70 = &unk_1E5ADE858;
            v71 = &v72;
            ProactiveSuggestionClientModelLibraryCore_2();
            Class Class = objc_getClass("ATXProactiveSuggestionClientModelSpecification");
            *(void *)(v71[1] + 24) = Class;
            getATXProactiveSuggestionClientModelSpecificationClass_softClass_1 = *(void *)(v71[1] + 24);
            int64_t v12 = (void *)v73[3];
          }
          int64_t v14 = v12;
          _Block_object_dispose(&v72, 8);
          id v15 = [v14 alloc];
          id v16 = [getATXProactiveSuggestionClientModelClass_1() clientModelIdFromClientModelType:self->_modelType];
          int v17 = (void *)[v15 initWithClientModelId:v16 clientModelVersion:@"1.0" engagementResetPolicy:0];

          uint64_t v72 = 0;
          v73 = &v72;
          uint64_t v74 = 0x2050000000;
          uint64_t v18 = (void *)getATXProactiveSuggestionExecutableSpecificationClass_softClass_1;
          uint64_t v75 = getATXProactiveSuggestionExecutableSpecificationClass_softClass_1;
          if (!getATXProactiveSuggestionExecutableSpecificationClass_softClass_1)
          {
            uint64_t v67 = MEMORY[0x1E4F143A8];
            uint64_t v68 = 3221225472;
            v69 = __getATXProactiveSuggestionExecutableSpecificationClass_block_invoke_1;
            v70 = &unk_1E5ADE858;
            v71 = &v72;
            ProactiveSuggestionClientModelLibraryCore_2();
            Class v19 = objc_getClass("ATXProactiveSuggestionExecutableSpecification");
            *(void *)(v71[1] + 24) = v19;
            getATXProactiveSuggestionExecutableSpecificationClass_softClass_1 = *(void *)(v71[1] + 24);
            uint64_t v18 = (void *)v73[3];
          }
          uint64_t v20 = v18;
          _Block_object_dispose(&v72, 8);
          id v21 = [v20 alloc];
          objc_super v22 = [v11 description];
          v23 = objc_opt_new();
          v24 = [v23 UUIDString];
          v25 = (void *)[v21 initWithExecutableObject:v11 executableDescription:v22 executableIdentifier:v24 suggestionExecutableType:6];

          uint64_t v72 = 0;
          v73 = &v72;
          uint64_t v74 = 0x2050000000;
          v26 = (void *)getATXProactiveSuggestionUISpecificationClass_softClass_1;
          uint64_t v75 = getATXProactiveSuggestionUISpecificationClass_softClass_1;
          if (!getATXProactiveSuggestionUISpecificationClass_softClass_1)
          {
            uint64_t v67 = MEMORY[0x1E4F143A8];
            uint64_t v68 = 3221225472;
            v69 = __getATXProactiveSuggestionUISpecificationClass_block_invoke_1;
            v70 = &unk_1E5ADE858;
            v71 = &v72;
            ProactiveSuggestionClientModelLibraryCore_2();
            Class v27 = objc_getClass("ATXProactiveSuggestionUISpecification");
            *(void *)(v71[1] + 24) = v27;
            getATXProactiveSuggestionUISpecificationClass_softClass_1 = *(void *)(v71[1] + 24);
            v26 = (void *)v73[3];
          }
          v28 = v26;
          _Block_object_dispose(&v72, 8);
          id v29 = [v28 alloc];
          v30 = [v11 groupName];
          v31 = v30;
          if (!v30)
          {
            v61 = [v11 recipients];
            v60 = [v61 firstObject];
            v59 = [v60 handle];
            v31 = v59;
          }
          uint64_t v72 = 0;
          v73 = &v72;
          uint64_t v74 = 0x2050000000;
          v32 = (void *)getATXProactiveSuggestionLayoutConfigClass_softClass_1;
          uint64_t v75 = getATXProactiveSuggestionLayoutConfigClass_softClass_1;
          if (!getATXProactiveSuggestionLayoutConfigClass_softClass_1)
          {
            uint64_t v67 = MEMORY[0x1E4F143A8];
            uint64_t v68 = 3221225472;
            v69 = __getATXProactiveSuggestionLayoutConfigClass_block_invoke_1;
            v70 = &unk_1E5ADE858;
            v71 = &v72;
            ProactiveSuggestionClientModelLibraryCore_2();
            Class v33 = objc_getClass("ATXProactiveSuggestionLayoutConfig");
            *(void *)(v71[1] + 24) = v33;
            getATXProactiveSuggestionLayoutConfigClass_softClass_1 = *(void *)(v71[1] + 24);
            v32 = (void *)v73[3];
          }
          id v34 = v32;
          _Block_object_dispose(&v72, 8);
          v35 = [v34 layoutConfigurationsForLayoutOptions:2];
          v36 = (void *)[v29 initWithTitle:v31 subtitle:0 preferredLayoutConfigs:v35 allowedOnLockscreen:1 allowedOnHomeScreen:1 allowedOnSpotlight:1];

          if (!v30)
          {
          }
          BOOL v37 = self->_modelType == 32;
          uint64_t v72 = 0;
          v73 = &v72;
          uint64_t v74 = 0x2050000000;
          v38 = (void *)getATXProactiveSuggestionScoreSpecificationClass_softClass_1;
          uint64_t v75 = getATXProactiveSuggestionScoreSpecificationClass_softClass_1;
          if (!getATXProactiveSuggestionScoreSpecificationClass_softClass_1)
          {
            uint64_t v67 = MEMORY[0x1E4F143A8];
            uint64_t v68 = 3221225472;
            v69 = __getATXProactiveSuggestionScoreSpecificationClass_block_invoke_1;
            v70 = &unk_1E5ADE858;
            v71 = &v72;
            ProactiveSuggestionClientModelLibraryCore_2();
            Class v39 = objc_getClass("ATXProactiveSuggestionScoreSpecification");
            *(void *)(v71[1] + 24) = v39;
            getATXProactiveSuggestionScoreSpecificationClass_softClass_1 = *(void *)(v71[1] + 24);
            v38 = (void *)v73[3];
          }
          v40 = v38;
          _Block_object_dispose(&v72, 8);
          v41 = (void *)[[v40 alloc] initWithRawScore:self->_defaultConfidenceCategory suggestedConfidenceCategory:dbl_1A32656C0[v37]];
          uint64_t v72 = 0;
          v73 = &v72;
          uint64_t v74 = 0x2050000000;
          v42 = (void *)getATXProactiveSuggestionClass_softClass_1;
          uint64_t v75 = getATXProactiveSuggestionClass_softClass_1;
          if (!getATXProactiveSuggestionClass_softClass_1)
          {
            uint64_t v67 = MEMORY[0x1E4F143A8];
            uint64_t v68 = 3221225472;
            v69 = __getATXProactiveSuggestionClass_block_invoke_1;
            v70 = &unk_1E5ADE858;
            v71 = &v72;
            ProactiveSuggestionClientModelLibraryCore_2();
            Class v43 = objc_getClass("ATXProactiveSuggestion");
            *(void *)(v71[1] + 24) = v43;
            getATXProactiveSuggestionClass_softClass_1 = *(void *)(v71[1] + 24);
            v42 = (void *)v73[3];
          }
          v44 = v42;
          _Block_object_dispose(&v72, 8);
          v45 = (void *)[[v44 alloc] initWithClientModelSpecification:v17 executableSpecification:v25 uiSpecification:v36 scoreSpecification:v41];
          [v57 addObject:v45];
        }
        uint64_t v58 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
      }
      while (v58);
    }

    uint64_t v72 = 0;
    v73 = &v72;
    uint64_t v74 = 0x2050000000;
    v46 = (void *)getATXSuggestionRequestResponseClass_softClass_2;
    uint64_t v75 = getATXSuggestionRequestResponseClass_softClass_2;
    if (!getATXSuggestionRequestResponseClass_softClass_2)
    {
      uint64_t v67 = MEMORY[0x1E4F143A8];
      uint64_t v68 = 3221225472;
      v69 = __getATXSuggestionRequestResponseClass_block_invoke_2;
      v70 = &unk_1E5ADE858;
      v71 = &v72;
      ProactiveSuggestionClientModelLibraryCore_2();
      Class v47 = objc_getClass("ATXSuggestionRequestResponse");
      *(void *)(v71[1] + 24) = v47;
      getATXSuggestionRequestResponseClass_softClass_2 = *(void *)(v71[1] + 24);
      v46 = (void *)v73[3];
    }
    v48 = v46;
    _Block_object_dispose(&v72, 8);
    v49 = (void *)[[v48 alloc] initWithSuggestions:v57 feedbackMetadata:0 originalRequest:v54 responseCode:2 error:0];
    v50[2](v50, v49);
  }
  else
  {
    id obj = +[_PSZkwUtils clientModelMismatchErrorResponseForRequest:v54 requestedClientModelId:v52 actualClientModelId:v51];
    v50[2](v50, obj);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformers, 0);
  objc_storeStrong((id *)&self->_modelConfiguration, 0);

  objc_storeStrong((id *)&self->_knnModel, 0);
}

- (void)getSuggestionsWithPredictionContext:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Unknown ZKW fallback interaction model type: %ld", (uint8_t *)&v3, 0xCu);
}

- (void)suggestionsForInteractionSuggestionRequest:(uint64_t)a1 clientModelId:(NSObject *)a2 reply:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Encountered context of unknown class: %@", (uint8_t *)&v5, 0xCu);
}

- (void)suggestionsForInteractionSuggestionRequest:(uint64_t)a1 clientModelId:(NSObject *)a2 reply:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A314B000, a2, OS_LOG_TYPE_DEBUG, "Interaction model delegate call %@", (uint8_t *)&v2, 0xCu);
}

@end