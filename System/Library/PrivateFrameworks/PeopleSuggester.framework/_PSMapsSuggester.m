@interface _PSMapsSuggester
- (id)suggestionsFromContext:(id)a3 maxSuggestions:(unint64_t)a4;
- (void)deleteMapsFeedbackEventsMatchingHandle:(id)a3 contactId:(id)a4 startLocationId:(id)a5 endLocationId:(id)a6;
- (void)provideMapsFeedback:(id)a3;
@end

@implementation _PSMapsSuggester

- (id)suggestionsFromContext:(id)a3 maxSuggestions:(unint64_t)a4
{
  id v5 = a3;
  v6 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSMapsSuggesterTotalTime", (const char *)&unk_1A3274816, buf, 2u);
  }

  v7 = objc_alloc_init(_PSEnsembleModel);
  v8 = [(_PSEnsembleModel *)v7 predictWithMapsPredictionContext:v5 maxSuggestions:a4];

  v9 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSMapsSuggesterTotalTime", (const char *)&unk_1A3274816, v11, 2u);
  }

  return v8;
}

- (void)provideMapsFeedback:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 action];
  uint64_t v5 = [v4 type];

  switch(v5)
  {
    case 0:
    case 4:
      uint64_t v6 = [v3 indexOfEngagedSuggestion];
      v7 = +[_PSLogging feedbackChannel];
      v8 = v7;
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[_PSMapsSuggester provideMapsFeedback:](v8);
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v10 = [NSNumber numberWithUnsignedInteger:v6];
        v11 = [v3 action];
        v12 = [v11 transportBundleID];
        *(_DWORD *)buf = 138412546;
        v16 = v10;
        __int16 v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_1A314B000, v8, OS_LOG_TYPE_INFO, "Feedback for maps suggestions: Engagement with suggestion at index %@, transport: %@", buf, 0x16u);
      }
      break;
    case 1:
      v8 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v9 = "Feedback for maps suggestions: Engagement with non-suggestion";
        goto LABEL_9;
      }
      break;
    case 2:
      v8 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v9 = "Feedback for maps suggestions: Abandonment";
LABEL_9:
        _os_log_impl(&dword_1A314B000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
      }
      break;
    default:
      v8 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[_PSMapsSuggester provideMapsFeedback:](v8);
      }
      break;
  }

  [v3 donateToBiome];
  v14 = v3;
  id v13 = v3;
  AnalyticsSendEventLazy();
}

- (void)deleteMapsFeedbackEventsMatchingHandle:(id)a3 contactId:(id)a4 startLocationId:(id)a5 endLocationId:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = BiomeLibrary();
  v14 = [v13 MapsShare];
  v15 = [v14 ETAFeedback];

  v16 = [v15 pruner];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __99___PSMapsSuggester_deleteMapsFeedbackEventsMatchingHandle_contactId_startLocationId_endLocationId___block_invoke;
  v21[3] = &unk_1E5ADFE48;
  id v22 = v9;
  id v23 = v11;
  id v24 = v12;
  id v25 = v10;
  id v17 = v10;
  id v18 = v12;
  id v19 = v11;
  id v20 = v9;
  [v16 deleteWithPolicy:@"delete-maps-feedback" eventsPassingTest:v21];
}

- (void)provideMapsFeedback:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A314B000, log, OS_LOG_TYPE_ERROR, "Feedback with unknown action type", v1, 2u);
}

- (void)provideMapsFeedback:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A314B000, log, OS_LOG_TYPE_ERROR, "Feedback with unknown suggestion", v1, 2u);
}

@end