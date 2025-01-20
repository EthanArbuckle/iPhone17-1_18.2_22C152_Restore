@interface _PSCalendarEventPredictorDelegateWrapper
- (_PSCalendarEventPredictorDelegateWrapper)initWithCalendarEventPredictor:(id)a3 config:(id)a4;
- (_PSCalendarEventPredictorDelegateWrapper)initWithCalendarEventPredictor:(id)a3 startSecondsFromQuery:(double)a4 endSecondsFromQuery:(double)a5 maxParticipants:(unint64_t)a6 isEnabled:(BOOL)a7 defaultConfidenceCategory:(int64_t)a8;
- (id)getSuggestionsWithPredictionContext:(id)a3;
- (void)pingWithCompletion:(id)a3;
- (void)suggestionsForInteractionSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5;
- (void)updateWithConfig:(id)a3;
@end

@implementation _PSCalendarEventPredictorDelegateWrapper

- (_PSCalendarEventPredictorDelegateWrapper)initWithCalendarEventPredictor:(id)a3 startSecondsFromQuery:(double)a4 endSecondsFromQuery:(double)a5 maxParticipants:(unint64_t)a6 isEnabled:(BOOL)a7 defaultConfidenceCategory:(int64_t)a8
{
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_PSCalendarEventPredictorDelegateWrapper;
  v16 = [(_PSCalendarEventPredictorDelegateWrapper *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_calendarEventPredictor, a3);
    v17->_startSecondsFromQuery = a4;
    v17->_endSecondsFromQuery = a5;
    v17->_maxParticipants = a6;
    v17->_isEnabled = a7;
    v17->_defaultConfidenceCategory = a8;
  }

  return v17;
}

- (_PSCalendarEventPredictorDelegateWrapper)initWithCalendarEventPredictor:(id)a3 config:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 startSecondsFromQuery];
  double v9 = v8;
  [v6 endSecondsFromQuery];
  double v11 = v10;
  uint64_t v12 = [v6 maxOtherParticipants];
  uint64_t v13 = [v6 isEnabled];
  uint64_t v14 = [v6 defaultConfidenceCategory];

  id v15 = [(_PSCalendarEventPredictorDelegateWrapper *)self initWithCalendarEventPredictor:v7 startSecondsFromQuery:v12 endSecondsFromQuery:v13 maxParticipants:v14 isEnabled:v9 defaultConfidenceCategory:v11];
  return v15;
}

- (void)updateWithConfig:(id)a3
{
  id v4 = a3;
  [v4 startSecondsFromQuery];
  self->_startSecondsFromQuery = v5;
  [v4 endSecondsFromQuery];
  self->_endSecondsFromQuery = v6;
  self->_maxParticipants = [v4 maxOtherParticipants];
  self->_isEnabled = [v4 isEnabled];
  int64_t v7 = [v4 defaultConfidenceCategory];

  self->_defaultConfidenceCategory = v7;
}

- (id)getSuggestionsWithPredictionContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_isEnabled)
  {
    double v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-self->_startSecondsFromQuery];
    double v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:self->_endSecondsFromQuery];
    int64_t v7 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v7))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSCalendarModelTotalTime", " enableTelemetry=YES ", (uint8_t *)&v12, 2u);
    }

    double v8 = [(_PSCalendarEventPredictor *)self->_calendarEventPredictor zkwSuggestionsFromCalendarWithPredictionContext:v4 startDate:v5 endDate:v6 maxParticipants:self->_maxParticipants];
    double v9 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v9))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSCalendarModelTotalTime", (const char *)&unk_1A3274816, (uint8_t *)&v12, 2u);
    }

    double v10 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1A314B000, v10, OS_LOG_TYPE_DEFAULT, "ZKW structured calendar suggestions: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    double v5 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_DEFAULT, "ZKW structured calendar model disabled. Not generating suggestions.", (uint8_t *)&v12, 2u);
    }
    double v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (void)pingWithCompletion:(id)a3
{
}

- (void)suggestionsForInteractionSuggestionRequest:(id)a3 clientModelId:(id)a4 reply:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v51 = a4;
  v49 = (void (**)(id, void *))a5;
  int64_t v7 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_PSCalendarEventPredictorDelegateWrapper suggestionsForInteractionSuggestionRequest:clientModelId:reply:]((uint64_t)v53, v7);
  }

  v52 = [v53 psPredictionContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v8 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_PSCalendarEventPredictorDelegateWrapper suggestionsForInteractionSuggestionRequest:clientModelId:reply:]((uint64_t)v52, v8);
    }
  }
  v50 = [getATXProactiveSuggestionClientModelClass() clientModelIdFromClientModelType:29];
  if ([v51 isEqualToString:v50])
  {
    double v9 = [(_PSCalendarEventPredictorDelegateWrapper *)self getSuggestionsWithPredictionContext:v52];
    v56 = objc_opt_new();
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = v9;
    uint64_t v58 = [obj countByEnumeratingWithState:&v62 objects:v75 count:16];
    if (v58)
    {
      uint64_t v55 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v63 != v55) {
            objc_enumerationMutation(obj);
          }
          double v11 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          uint64_t v71 = 0;
          v72 = &v71;
          uint64_t v73 = 0x2050000000;
          int v12 = (void *)getATXProactiveSuggestionClientModelSpecificationClass_softClass;
          uint64_t v74 = getATXProactiveSuggestionClientModelSpecificationClass_softClass;
          if (!getATXProactiveSuggestionClientModelSpecificationClass_softClass)
          {
            uint64_t v66 = MEMORY[0x1E4F143A8];
            uint64_t v67 = 3221225472;
            v68 = __getATXProactiveSuggestionClientModelSpecificationClass_block_invoke;
            v69 = &unk_1E5ADE858;
            v70 = &v71;
            ProactiveSuggestionClientModelLibraryCore();
            Class Class = objc_getClass("ATXProactiveSuggestionClientModelSpecification");
            *(void *)(v70[1] + 24) = Class;
            getATXProactiveSuggestionClientModelSpecificationClass_softClass Class = *(void *)(v70[1] + 24);
            int v12 = (void *)v72[3];
          }
          uint64_t v14 = v12;
          _Block_object_dispose(&v71, 8);
          id v15 = [v14 alloc];
          v16 = [getATXProactiveSuggestionClientModelClass() clientModelIdFromClientModelType:29];
          v17 = (void *)[v15 initWithClientModelId:v16 clientModelVersion:@"1.0" engagementResetPolicy:0];

          uint64_t v71 = 0;
          v72 = &v71;
          uint64_t v73 = 0x2050000000;
          v18 = (void *)getATXProactiveSuggestionExecutableSpecificationClass_softClass;
          uint64_t v74 = getATXProactiveSuggestionExecutableSpecificationClass_softClass;
          if (!getATXProactiveSuggestionExecutableSpecificationClass_softClass)
          {
            uint64_t v66 = MEMORY[0x1E4F143A8];
            uint64_t v67 = 3221225472;
            v68 = __getATXProactiveSuggestionExecutableSpecificationClass_block_invoke;
            v69 = &unk_1E5ADE858;
            v70 = &v71;
            ProactiveSuggestionClientModelLibraryCore();
            Class v19 = objc_getClass("ATXProactiveSuggestionExecutableSpecification");
            *(void *)(v70[1] + 24) = v19;
            getATXProactiveSuggestionExecutableSpecificationClass_softClass Class = *(void *)(v70[1] + 24);
            v18 = (void *)v72[3];
          }
          v20 = v18;
          _Block_object_dispose(&v71, 8);
          id v21 = [v20 alloc];
          v22 = [v11 description];
          v23 = objc_opt_new();
          v24 = [v23 UUIDString];
          v25 = (void *)[v21 initWithExecutableObject:v11 executableDescription:v22 executableIdentifier:v24 suggestionExecutableType:6];

          uint64_t v71 = 0;
          v72 = &v71;
          uint64_t v73 = 0x2050000000;
          v26 = (void *)getATXProactiveSuggestionUISpecificationClass_softClass;
          uint64_t v74 = getATXProactiveSuggestionUISpecificationClass_softClass;
          if (!getATXProactiveSuggestionUISpecificationClass_softClass)
          {
            uint64_t v66 = MEMORY[0x1E4F143A8];
            uint64_t v67 = 3221225472;
            v68 = __getATXProactiveSuggestionUISpecificationClass_block_invoke;
            v69 = &unk_1E5ADE858;
            v70 = &v71;
            ProactiveSuggestionClientModelLibraryCore();
            Class v27 = objc_getClass("ATXProactiveSuggestionUISpecification");
            *(void *)(v70[1] + 24) = v27;
            getATXProactiveSuggestionUISpecificationClass_softClass Class = *(void *)(v70[1] + 24);
            v26 = (void *)v72[3];
          }
          v28 = v26;
          _Block_object_dispose(&v71, 8);
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
          uint64_t v71 = 0;
          v72 = &v71;
          uint64_t v73 = 0x2050000000;
          v32 = (void *)getATXProactiveSuggestionLayoutConfigClass_softClass;
          uint64_t v74 = getATXProactiveSuggestionLayoutConfigClass_softClass;
          if (!getATXProactiveSuggestionLayoutConfigClass_softClass)
          {
            uint64_t v66 = MEMORY[0x1E4F143A8];
            uint64_t v67 = 3221225472;
            v68 = __getATXProactiveSuggestionLayoutConfigClass_block_invoke;
            v69 = &unk_1E5ADE858;
            v70 = &v71;
            ProactiveSuggestionClientModelLibraryCore();
            Class v33 = objc_getClass("ATXProactiveSuggestionLayoutConfig");
            *(void *)(v70[1] + 24) = v33;
            getATXProactiveSuggestionLayoutConfigClass_softClass Class = *(void *)(v70[1] + 24);
            v32 = (void *)v72[3];
          }
          id v34 = v32;
          _Block_object_dispose(&v71, 8);
          v35 = [v34 layoutConfigurationsForLayoutOptions:2];
          v36 = (void *)[v29 initWithTitle:v31 subtitle:0 preferredLayoutConfigs:v35 allowedOnLockscreen:1 allowedOnHomeScreen:1 allowedOnSpotlight:1];

          if (!v30)
          {
          }
          uint64_t v71 = 0;
          v72 = &v71;
          uint64_t v73 = 0x2050000000;
          v37 = (void *)getATXProactiveSuggestionScoreSpecificationClass_softClass;
          uint64_t v74 = getATXProactiveSuggestionScoreSpecificationClass_softClass;
          if (!getATXProactiveSuggestionScoreSpecificationClass_softClass)
          {
            uint64_t v66 = MEMORY[0x1E4F143A8];
            uint64_t v67 = 3221225472;
            v68 = __getATXProactiveSuggestionScoreSpecificationClass_block_invoke;
            v69 = &unk_1E5ADE858;
            v70 = &v71;
            ProactiveSuggestionClientModelLibraryCore();
            Class v38 = objc_getClass("ATXProactiveSuggestionScoreSpecification");
            *(void *)(v70[1] + 24) = v38;
            getATXProactiveSuggestionScoreSpecificationClass_softClass Class = *(void *)(v70[1] + 24);
            v37 = (void *)v72[3];
          }
          v39 = v37;
          _Block_object_dispose(&v71, 8);
          v40 = (void *)[[v39 alloc] initWithRawScore:self->_defaultConfidenceCategory suggestedConfidenceCategory:95.0];
          uint64_t v71 = 0;
          v72 = &v71;
          uint64_t v73 = 0x2050000000;
          v41 = (void *)getATXProactiveSuggestionClass_softClass;
          uint64_t v74 = getATXProactiveSuggestionClass_softClass;
          if (!getATXProactiveSuggestionClass_softClass)
          {
            uint64_t v66 = MEMORY[0x1E4F143A8];
            uint64_t v67 = 3221225472;
            v68 = __getATXProactiveSuggestionClass_block_invoke;
            v69 = &unk_1E5ADE858;
            v70 = &v71;
            ProactiveSuggestionClientModelLibraryCore();
            Class v42 = objc_getClass("ATXProactiveSuggestion");
            *(void *)(v70[1] + 24) = v42;
            getATXProactiveSuggestionClass_softClass Class = *(void *)(v70[1] + 24);
            v41 = (void *)v72[3];
          }
          v43 = v41;
          _Block_object_dispose(&v71, 8);
          v44 = (void *)[[v43 alloc] initWithClientModelSpecification:v17 executableSpecification:v25 uiSpecification:v36 scoreSpecification:v40];
          [v56 addObject:v44];
        }
        uint64_t v58 = [obj countByEnumeratingWithState:&v62 objects:v75 count:16];
      }
      while (v58);
    }

    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x2050000000;
    v45 = (void *)getATXSuggestionRequestResponseClass_softClass_0;
    uint64_t v74 = getATXSuggestionRequestResponseClass_softClass_0;
    if (!getATXSuggestionRequestResponseClass_softClass_0)
    {
      uint64_t v66 = MEMORY[0x1E4F143A8];
      uint64_t v67 = 3221225472;
      v68 = __getATXSuggestionRequestResponseClass_block_invoke_0;
      v69 = &unk_1E5ADE858;
      v70 = &v71;
      ProactiveSuggestionClientModelLibraryCore();
      Class v46 = objc_getClass("ATXSuggestionRequestResponse");
      *(void *)(v70[1] + 24) = v46;
      getATXSuggestionRequestResponseClass_softClass_0 = *(void *)(v70[1] + 24);
      v45 = (void *)v72[3];
    }
    v47 = v45;
    _Block_object_dispose(&v71, 8);
    v48 = (void *)[[v47 alloc] initWithSuggestions:v56 feedbackMetadata:0 originalRequest:v53 responseCode:2 error:0];
    v49[2](v49, v48);
  }
  else
  {
    id obj = +[_PSZkwUtils clientModelMismatchErrorResponseForRequest:v53 requestedClientModelId:v51 actualClientModelId:v50];
    v49[2](v49, obj);
  }
}

- (void).cxx_destruct
{
}

- (void)suggestionsForInteractionSuggestionRequest:(uint64_t)a1 clientModelId:(NSObject *)a2 reply:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  double v6 = v4;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Encountered context of unknown class: %@", (uint8_t *)&v5, 0xCu);
}

- (void)suggestionsForInteractionSuggestionRequest:(uint64_t)a1 clientModelId:(NSObject *)a2 reply:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A314B000, a2, OS_LOG_TYPE_DEBUG, "Calendar model delegate call %@", (uint8_t *)&v2, 0xCu);
}

@end