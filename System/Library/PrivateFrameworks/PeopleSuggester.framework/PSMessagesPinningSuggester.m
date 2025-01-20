@interface PSMessagesPinningSuggester
@end

@implementation PSMessagesPinningSuggester

void __77___PSMessagesPinningSuggester_chatGuidsForMessagesPinningWithMaxSuggestions___block_invoke_164(uint64_t a1, void *a2)
{
}

void __77___PSMessagesPinningSuggester_chatGuidsForMessagesPinningWithMaxSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

uint64_t __147___PSMessagesPinningSuggester_chatGuidsBasedOnRegularityAndIntensityWithMaxSuggestions_referenceDate_minimumDaysOfHistory_maxInteractionsForQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 lastObject];
  v6 = [v4 lastObject];

  [v5 doubleValue];
  double v8 = v7;
  [v6 doubleValue];
  if (v8 >= v9)
  {
    [v5 doubleValue];
    double v12 = v11;
    [v6 doubleValue];
    if (v12 <= v13) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = -1;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

void __62___PSMessagesPinningSuggester_provideMessagesPinningFeedback___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __61___PSMessagesPinningSuggester_submitMessagesPinningFeedback___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    v3 = +[_PSLogging messagePinningChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __61___PSMessagesPinningSuggester_submitMessagesPinningFeedback___block_invoke_cold_1();
    }
  }
}

id __61___PSMessagesPinningSuggester_submitMessagesPinningFeedback___block_invoke_224(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __61___PSMessagesPinningSuggester_submitMessagesPinningFeedback___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Error while donating to Tips: %@", v2, v3, v4, v5, v6);
}

@end