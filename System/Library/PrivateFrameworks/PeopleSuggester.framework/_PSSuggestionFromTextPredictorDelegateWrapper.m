@interface _PSSuggestionFromTextPredictorDelegateWrapper
- (_PSSuggestionFromTextPredictorDelegateWrapper)initWithDelegateType:(int64_t)a3 textPredictor:(id)a4 startSecondsFromQuery:(double)a5 endSecondsFromQuery:(double)a6 priorScoreThreshold:(float)a7 isEnabled:(BOOL)a8 defaultConfidenceCategory:(int64_t)a9;
- (_PSSuggestionFromTextPredictorDelegateWrapper)initWithTextPredictor:(id)a3 calendarConfig:(id)a4;
- (_PSSuggestionFromTextPredictorDelegateWrapper)initWithTextPredictor:(id)a3 remindersConfig:(id)a4;
- (id)getSuggestionsWithPredictionContext:(id)a3;
- (void)pingWithCompletion:(id)a3;
- (void)suggestionsForInteractionSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5;
- (void)updateWithCalendarConfig:(id)a3;
- (void)updateWithRemindersConfig:(id)a3;
@end

@implementation _PSSuggestionFromTextPredictorDelegateWrapper

- (_PSSuggestionFromTextPredictorDelegateWrapper)initWithDelegateType:(int64_t)a3 textPredictor:(id)a4 startSecondsFromQuery:(double)a5 endSecondsFromQuery:(double)a6 priorScoreThreshold:(float)a7 isEnabled:(BOOL)a8 defaultConfidenceCategory:(int64_t)a9
{
  id v17 = a4;
  v21.receiver = self;
  v21.super_class = (Class)_PSSuggestionFromTextPredictorDelegateWrapper;
  v18 = [(_PSSuggestionFromTextPredictorDelegateWrapper *)&v21 init];
  v19 = v18;
  if (v18)
  {
    v18->_delegateType = a3;
    objc_storeStrong((id *)&v18->_textPredictor, a4);
    v19->_startSecondsFromQuery = a5;
    v19->_endSecondsFromQuery = a6;
    v19->_priorScoreThreshold = a7;
    v19->_isEnabled = a8;
    v19->_defaultConfidenceCategory = a9;
  }

  return v19;
}

- (_PSSuggestionFromTextPredictorDelegateWrapper)initWithTextPredictor:(id)a3 calendarConfig:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 startSecondsFromQuery];
  double v9 = v8;
  [v6 endSecondsFromQuery];
  double v11 = v10;
  [v6 priorScoreThreshold];
  int v13 = v12;
  uint64_t v14 = [v6 isEnabled];
  uint64_t v15 = [v6 defaultConfidenceCategory];

  LODWORD(v16) = v13;
  id v17 = [(_PSSuggestionFromTextPredictorDelegateWrapper *)self initWithDelegateType:1 textPredictor:v7 startSecondsFromQuery:v14 endSecondsFromQuery:v15 priorScoreThreshold:v9 isEnabled:v11 defaultConfidenceCategory:v16];

  return v17;
}

- (_PSSuggestionFromTextPredictorDelegateWrapper)initWithTextPredictor:(id)a3 remindersConfig:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 startSecondsFromQuery];
  double v9 = v8;
  [v6 endSecondsFromQuery];
  double v11 = v10;
  [v6 priorScoreThreshold];
  int v13 = v12;
  uint64_t v14 = [v6 isEnabled];
  uint64_t v15 = [v6 defaultConfidenceCategory];

  LODWORD(v16) = v13;
  id v17 = [(_PSSuggestionFromTextPredictorDelegateWrapper *)self initWithDelegateType:2 textPredictor:v7 startSecondsFromQuery:v14 endSecondsFromQuery:v15 priorScoreThreshold:v9 isEnabled:v11 defaultConfidenceCategory:v16];

  return v17;
}

- (void)updateWithCalendarConfig:(id)a3
{
  id v4 = a3;
  [v4 startSecondsFromQuery];
  self->_startSecondsFromQuery = v5;
  [v4 endSecondsFromQuery];
  self->_endSecondsFromQuery = v6;
  [v4 priorScoreThreshold];
  self->_priorScoreThreshold = v7;
  self->_isEnabled = [v4 isEnabled];
  int64_t v8 = [v4 defaultConfidenceCategory];

  self->_defaultConfidenceCategory = v8;
}

- (void)updateWithRemindersConfig:(id)a3
{
  id v4 = a3;
  [v4 startSecondsFromQuery];
  self->_startSecondsFromQuery = v5;
  [v4 endSecondsFromQuery];
  self->_endSecondsFromQuery = v6;
  [v4 priorScoreThreshold];
  self->_priorScoreThreshold = v7;
  self->_isEnabled = [v4 isEnabled];
  int64_t v8 = [v4 defaultConfidenceCategory];

  self->_defaultConfidenceCategory = v8;
}

- (id)getSuggestionsWithPredictionContext:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isEnabled)
  {
    double v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-self->_startSecondsFromQuery];
    double v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:self->_endSecondsFromQuery];
    int64_t delegateType = self->_delegateType;
    if (delegateType == 2)
    {
      id v17 = +[_PSLogging suggestionSignpost];
      if (os_signpost_enabled(v17))
      {
        LOWORD(v21) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSUnstructuredRemindersModelTotalTime", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
      }

      *(float *)&double v18 = self->_priorScoreThreshold;
      double v10 = [(_PSSuggestionFromTextPredictor *)self->_textPredictor suggestionsFromIncompleteRemindersWithContext:v4 startDate:v5 endDate:v6 priorScoreThreshold:v18];
      v19 = +[_PSLogging suggestionSignpost];
      if (os_signpost_enabled(v19))
      {
        LOWORD(v21) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSUnstructuredRemindersModelTotalTime", (const char *)&unk_1A3274816, (uint8_t *)&v21, 2u);
      }

      int v12 = +[_PSLogging generalChannel];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      int v21 = 138412290;
      v22 = v10;
      int v13 = "ZKW unstructured reminders suggestions: %@";
    }
    else
    {
      if (delegateType != 1)
      {
        int v12 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[_PSSuggestionFromTextPredictorDelegateWrapper getSuggestionsWithPredictionContext:](&self->_delegateType, v12);
        }
        double v10 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_23;
      }
      int64_t v8 = +[_PSLogging suggestionSignpost];
      if (os_signpost_enabled(v8))
      {
        LOWORD(v21) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSUnstructuredCalendarModelTotalTime", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
      }

      *(float *)&double v9 = self->_priorScoreThreshold;
      double v10 = [(_PSSuggestionFromTextPredictor *)self->_textPredictor suggestionsFromUnstructuredCalendarEventsWithContext:v4 startDate:v5 endDate:v6 priorScoreThreshold:v9];
      double v11 = +[_PSLogging suggestionSignpost];
      if (os_signpost_enabled(v11))
      {
        LOWORD(v21) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSUnstructuredCalendarModelTotalTime", (const char *)&unk_1A3274816, (uint8_t *)&v21, 2u);
      }

      int v12 = +[_PSLogging generalChannel];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_23:

        goto LABEL_28;
      }
      int v21 = 138412290;
      v22 = v10;
      int v13 = "ZKW unstructured calendar suggestions: %@";
    }
    _os_log_impl(&dword_1A314B000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v21, 0xCu);
    goto LABEL_23;
  }
  int64_t v14 = self->_delegateType;
  double v5 = +[_PSLogging generalChannel];
  BOOL v15 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v14 == 1)
  {
    if (v15)
    {
      LOWORD(v21) = 0;
      double v16 = "ZKW unstructured calendar model disabled. Not generating suggestions.";
LABEL_26:
      _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v21, 2u);
    }
  }
  else if (v15)
  {
    LOWORD(v21) = 0;
    double v16 = "ZKW unstructured reminders model disabled. Not generating suggestions.";
    goto LABEL_26;
  }
  double v10 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_28:

  return v10;
}

- (void)pingWithCompletion:(id)a3
{
}

- (void)suggestionsForInteractionSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v57 = a4;
  v51 = (void (**)(id, void *))a5;
  float v7 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_PSSuggestionFromTextPredictorDelegateWrapper suggestionsForInteractionSuggestionRequest:clientModelId:reply:]((uint64_t)v53, (uint64_t)self, v7);
  }

  if (!self->_delegateType)
  {
    v52 = (void *)[objc_alloc((Class)getATXSuggestionRequestResponseClass_0()) initWithSuggestions:MEMORY[0x1E4F1CBF0] feedbackMetadata:0 originalRequest:v53 responseCode:2 error:0];
    v51[2](v51, v52);
    goto LABEL_44;
  }
  v52 = [v53 psPredictionContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int64_t v8 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggestionFromTextPredictorDelegateWrapper suggestionsForInteractionSuggestionRequest:clientModelId:reply:]((uint64_t)v52, v8);
    }
  }
  int64_t delegateType = self->_delegateType;
  if (delegateType == 1)
  {
    uint64_t v10 = 30;
    goto LABEL_13;
  }
  if (delegateType == 2)
  {
    uint64_t v10 = 31;
LABEL_13:
    uint64_t v72 = 0;
    v73 = &v72;
    uint64_t v74 = 0x2050000000;
    double v11 = (void *)getATXProactiveSuggestionClientModelClass_softClass_0;
    uint64_t v75 = getATXProactiveSuggestionClientModelClass_softClass_0;
    if (!getATXProactiveSuggestionClientModelClass_softClass_0)
    {
      uint64_t v67 = MEMORY[0x1E4F143A8];
      uint64_t v68 = 3221225472;
      v69 = __getATXProactiveSuggestionClientModelClass_block_invoke_0;
      v70 = &unk_1E5ADE858;
      v71 = &v72;
      ProactiveSuggestionClientModelLibraryCore_0();
      v73[3] = (uint64_t)objc_getClass("ATXProactiveSuggestionClientModel");
      getATXProactiveSuggestionClientModelClass_softClass_0 = *(void *)(v71[1] + 24);
      double v11 = (void *)v73[3];
    }
    id v12 = v11;
    _Block_object_dispose(&v72, 8);
    v49 = [v12 clientModelIdFromClientModelType:v10];
    char v13 = objc_msgSend(v49, "isEqualToString:", v57, v49);
    goto LABEL_17;
  }
  char v13 = objc_msgSend(0, "isEqualToString:", v57, 0);
LABEL_17:
  if (v13)
  {
    int64_t v14 = [(_PSSuggestionFromTextPredictorDelegateWrapper *)self getSuggestionsWithPredictionContext:v52];
    v56 = objc_opt_new();
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id obj = v14;
    uint64_t v59 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
    if (v59)
    {
      uint64_t v55 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v59; ++i)
        {
          if (*(void *)v64 != v55) {
            objc_enumerationMutation(obj);
          }
          double v16 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          uint64_t v72 = 0;
          v73 = &v72;
          uint64_t v74 = 0x2050000000;
          id v17 = (void *)getATXProactiveSuggestionClientModelSpecificationClass_softClass_0;
          uint64_t v75 = getATXProactiveSuggestionClientModelSpecificationClass_softClass_0;
          if (!getATXProactiveSuggestionClientModelSpecificationClass_softClass_0)
          {
            uint64_t v67 = MEMORY[0x1E4F143A8];
            uint64_t v68 = 3221225472;
            v69 = __getATXProactiveSuggestionClientModelSpecificationClass_block_invoke_0;
            v70 = &unk_1E5ADE858;
            v71 = &v72;
            ProactiveSuggestionClientModelLibraryCore_0();
            Class Class = objc_getClass("ATXProactiveSuggestionClientModelSpecification");
            *(void *)(v71[1] + 24) = Class;
            getATXProactiveSuggestionClientModelSpecificationClass_softClass_0 = *(void *)(v71[1] + 24);
            id v17 = (void *)v73[3];
          }
          v19 = v17;
          _Block_object_dispose(&v72, 8);
          v20 = (void *)[[v19 alloc] initWithClientModelId:v57 clientModelVersion:@"1.0" engagementResetPolicy:0];
          uint64_t v72 = 0;
          v73 = &v72;
          uint64_t v74 = 0x2050000000;
          int v21 = (void *)getATXProactiveSuggestionExecutableSpecificationClass_softClass_0;
          uint64_t v75 = getATXProactiveSuggestionExecutableSpecificationClass_softClass_0;
          if (!getATXProactiveSuggestionExecutableSpecificationClass_softClass_0)
          {
            uint64_t v67 = MEMORY[0x1E4F143A8];
            uint64_t v68 = 3221225472;
            v69 = __getATXProactiveSuggestionExecutableSpecificationClass_block_invoke_0;
            v70 = &unk_1E5ADE858;
            v71 = &v72;
            ProactiveSuggestionClientModelLibraryCore_0();
            Class v22 = objc_getClass("ATXProactiveSuggestionExecutableSpecification");
            *(void *)(v71[1] + 24) = v22;
            getATXProactiveSuggestionExecutableSpecificationClass_softClass_0 = *(void *)(v71[1] + 24);
            int v21 = (void *)v73[3];
          }
          uint64_t v23 = v21;
          _Block_object_dispose(&v72, 8);
          id v24 = [v23 alloc];
          v25 = [v16 description];
          v26 = objc_opt_new();
          v27 = [v26 UUIDString];
          v28 = (void *)[v24 initWithExecutableObject:v16 executableDescription:v25 executableIdentifier:v27 suggestionExecutableType:6];

          uint64_t v72 = 0;
          v73 = &v72;
          uint64_t v74 = 0x2050000000;
          v29 = (void *)getATXProactiveSuggestionUISpecificationClass_softClass_0;
          uint64_t v75 = getATXProactiveSuggestionUISpecificationClass_softClass_0;
          if (!getATXProactiveSuggestionUISpecificationClass_softClass_0)
          {
            uint64_t v67 = MEMORY[0x1E4F143A8];
            uint64_t v68 = 3221225472;
            v69 = __getATXProactiveSuggestionUISpecificationClass_block_invoke_0;
            v70 = &unk_1E5ADE858;
            v71 = &v72;
            ProactiveSuggestionClientModelLibraryCore_0();
            Class v30 = objc_getClass("ATXProactiveSuggestionUISpecification");
            *(void *)(v71[1] + 24) = v30;
            getATXProactiveSuggestionUISpecificationClass_softClass_0 = *(void *)(v71[1] + 24);
            v29 = (void *)v73[3];
          }
          v31 = v29;
          _Block_object_dispose(&v72, 8);
          id v32 = [v31 alloc];
          v33 = [v16 groupName];
          v34 = v33;
          if (!v33)
          {
            v62 = [v16 recipients];
            v61 = [v62 firstObject];
            v60 = [v61 handle];
            v34 = v60;
          }
          uint64_t v72 = 0;
          v73 = &v72;
          uint64_t v74 = 0x2050000000;
          v35 = (void *)getATXProactiveSuggestionLayoutConfigClass_softClass_0;
          uint64_t v75 = getATXProactiveSuggestionLayoutConfigClass_softClass_0;
          if (!getATXProactiveSuggestionLayoutConfigClass_softClass_0)
          {
            uint64_t v67 = MEMORY[0x1E4F143A8];
            uint64_t v68 = 3221225472;
            v69 = __getATXProactiveSuggestionLayoutConfigClass_block_invoke_0;
            v70 = &unk_1E5ADE858;
            v71 = &v72;
            ProactiveSuggestionClientModelLibraryCore_0();
            Class v36 = objc_getClass("ATXProactiveSuggestionLayoutConfig");
            *(void *)(v71[1] + 24) = v36;
            getATXProactiveSuggestionLayoutConfigClass_softClass_0 = *(void *)(v71[1] + 24);
            v35 = (void *)v73[3];
          }
          id v37 = v35;
          _Block_object_dispose(&v72, 8);
          v38 = [v37 layoutConfigurationsForLayoutOptions:2];
          v39 = (void *)[v32 initWithTitle:v34 subtitle:0 preferredLayoutConfigs:v38 allowedOnLockscreen:1 allowedOnHomeScreen:1 allowedOnSpotlight:1];

          if (!v33)
          {
          }
          uint64_t v72 = 0;
          v73 = &v72;
          uint64_t v74 = 0x2050000000;
          v40 = (void *)getATXProactiveSuggestionScoreSpecificationClass_softClass_0;
          uint64_t v75 = getATXProactiveSuggestionScoreSpecificationClass_softClass_0;
          if (!getATXProactiveSuggestionScoreSpecificationClass_softClass_0)
          {
            uint64_t v67 = MEMORY[0x1E4F143A8];
            uint64_t v68 = 3221225472;
            v69 = __getATXProactiveSuggestionScoreSpecificationClass_block_invoke_0;
            v70 = &unk_1E5ADE858;
            v71 = &v72;
            ProactiveSuggestionClientModelLibraryCore_0();
            Class v41 = objc_getClass("ATXProactiveSuggestionScoreSpecification");
            *(void *)(v71[1] + 24) = v41;
            getATXProactiveSuggestionScoreSpecificationClass_softClass_0 = *(void *)(v71[1] + 24);
            v40 = (void *)v73[3];
          }
          v42 = v40;
          _Block_object_dispose(&v72, 8);
          v43 = (void *)[[v42 alloc] initWithRawScore:self->_defaultConfidenceCategory suggestedConfidenceCategory:90.0];
          uint64_t v72 = 0;
          v73 = &v72;
          uint64_t v74 = 0x2050000000;
          v44 = (void *)getATXProactiveSuggestionClass_softClass_0;
          uint64_t v75 = getATXProactiveSuggestionClass_softClass_0;
          if (!getATXProactiveSuggestionClass_softClass_0)
          {
            uint64_t v67 = MEMORY[0x1E4F143A8];
            uint64_t v68 = 3221225472;
            v69 = __getATXProactiveSuggestionClass_block_invoke_0;
            v70 = &unk_1E5ADE858;
            v71 = &v72;
            ProactiveSuggestionClientModelLibraryCore_0();
            Class v45 = objc_getClass("ATXProactiveSuggestion");
            *(void *)(v71[1] + 24) = v45;
            getATXProactiveSuggestionClass_softClass_0 = *(void *)(v71[1] + 24);
            v44 = (void *)v73[3];
          }
          v46 = v44;
          _Block_object_dispose(&v72, 8);
          v47 = (void *)[[v46 alloc] initWithClientModelSpecification:v20 executableSpecification:v28 uiSpecification:v39 scoreSpecification:v43];
          [v56 addObject:v47];
        }
        uint64_t v59 = [obj countByEnumeratingWithState:&v63 objects:v76 count:16];
      }
      while (v59);
    }

    v48 = (void *)[objc_alloc((Class)getATXSuggestionRequestResponseClass_0()) initWithSuggestions:v56 feedbackMetadata:0 originalRequest:v53 responseCode:2 error:0];
    v51[2](v51, v48);
  }
  else
  {
    id obj = +[_PSZkwUtils clientModelMismatchErrorResponseForRequest:v53 requestedClientModelId:v57 actualClientModelId:v50];
    v51[2](v51, obj);
  }

LABEL_44:
}

- (void).cxx_destruct
{
}

- (void)getSuggestionsWithPredictionContext:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Unknown ZKW unstructured reminders delegate type: %ld", (uint8_t *)&v3, 0xCu);
}

- (void)suggestionsForInteractionSuggestionRequest:(uint64_t)a1 clientModelId:(NSObject *)a2 reply:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  double v6 = v4;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Encountered context of unknown class: %@", (uint8_t *)&v5, 0xCu);
}

- (void)suggestionsForInteractionSuggestionRequest:(uint64_t)a1 clientModelId:(uint64_t)a2 reply:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a2 + 8);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1A314B000, log, OS_LOG_TYPE_DEBUG, "Unstructured text model delegate call %@ for delegate type %ld", (uint8_t *)&v4, 0x16u);
}

@end