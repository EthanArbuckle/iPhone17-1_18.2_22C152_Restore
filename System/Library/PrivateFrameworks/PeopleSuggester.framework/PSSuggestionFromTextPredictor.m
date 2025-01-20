@interface PSSuggestionFromTextPredictor
@end

@implementation PSSuggestionFromTextPredictor

BOOL __98___PSSuggestionFromTextPredictor_suggestionFromContactPriors_priorScoreThreshold_bundleID_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __98___PSSuggestionFromTextPredictor_suggestionFromContactPriors_priorScoreThreshold_bundleID_reason___block_invoke_cold_1(v3, a1, v4);
  }

  [v3 priorScore];
  BOOL v6 = v5 >= *(float *)(a1 + 32);

  return v6;
}

BOOL __98___PSSuggestionFromTextPredictor_suggestionFromContactPriors_priorScoreThreshold_bundleID_reason___block_invoke_74(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 contactIdentifier];
  float v5 = +[_PSInteractionStoreUtils someInteractionWithMatchingIdentifier:v4 store:*(void *)(a1[4] + 16) bundleIds:a1[5] afterStartDate:a1[6]];

  if (!v5)
  {
    BOOL v6 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v3 contactIdentifier];
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1A314B000, v6, OS_LOG_TYPE_DEFAULT, "Contact %@ hasn't been interacted with recently enough", (uint8_t *)&v9, 0xCu);
    }
  }

  return v5 != 0;
}

_PSRecipient *__98___PSSuggestionFromTextPredictor_suggestionFromContactPriors_priorScoreThreshold_bundleID_reason___block_invoke_76(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[_PSContactCache sharedInstance];
  float v5 = [v3 contactIdentifier];
  BOOL v6 = [v4 getContactForHandle:v5 handleType:0];

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4F5B3B0];
    v8 = [v6 phoneNumbers];
    int v9 = [v8 firstObject];
    v10 = [v9 value];
    uint64_t v11 = [v10 stringValue];
    v12 = [v7 normalizedStringFromContactString:v11];

    if (v12) {
      goto LABEL_5;
    }
    v13 = (void *)MEMORY[0x1E4F5B3B0];
    v14 = [v6 emailAddresses];
    v15 = [v14 firstObject];
    v16 = [v15 value];
    v12 = [v13 normalizedStringFromContactString:v16];

    if (v12 || ([v6 identifier], (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
LABEL_5:
      v17 = [_PSRecipient alloc];
      v18 = [*(id *)(*(void *)(a1 + 32) + 24) stringFromContact:v6];
      v19 = [(_PSRecipient *)v17 initWithIdentifier:v12 handle:v12 displayName:v18 contact:v6];

      goto LABEL_10;
    }
  }
  else
  {
    v20 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [v3 contactIdentifier];
      int v23 = 138412290;
      v24 = v21;
      _os_log_impl(&dword_1A314B000, v20, OS_LOG_TYPE_DEFAULT, "Unable to match contact for identifier %@", (uint8_t *)&v23, 0xCu);
    }
  }
  v19 = 0;
LABEL_10:

  return v19;
}

uint64_t __118___PSSuggestionFromTextPredictor_suggestionsFromIncompleteRemindersWithContext_startDate_endDate_priorScoreThreshold___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectID];
}

id __118___PSSuggestionFromTextPredictor_suggestionsFromIncompleteRemindersWithContext_startDate_endDate_priorScoreThreshold___block_invoke_84(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  v4 = [a2 titleAsString];
  int v5 = *(_DWORD *)(a1 + 48);
  BOOL v6 = [*(id *)(a1 + 40) bundleID];
  LODWORD(v7) = v5;
  v8 = [v3 suggestionFromText:v4 priorScoreThreshold:v6 bundleID:@"Reminder Title" reason:v7];

  return v8;
}

id __125___PSSuggestionFromTextPredictor_suggestionsFromPortraitExtractionsWithContext_startDate_endDate_priorScoreThreshold_reason___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 contact];
  id v3 = [v2 contactsContactIdentifierWithError:0];

  return v3;
}

id __125___PSSuggestionFromTextPredictor_suggestionsFromPortraitExtractionsWithContext_startDate_endDate_priorScoreThreshold_reason___block_invoke_2(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_opt_new();
  [v4 setContactIdentifier:v3];

  int v5 = *(void **)(a1 + 32);
  v12[0] = v4;
  BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  int v7 = *(_DWORD *)(a1 + 56);
  v8 = [*(id *)(a1 + 40) bundleID];
  LODWORD(v9) = v7;
  v10 = [v5 suggestionFromContactPriors:v6 priorScoreThreshold:v8 bundleID:*(void *)(a1 + 48) reason:v9];

  return v10;
}

void __125___PSSuggestionFromTextPredictor_suggestionsFromUnstructuredCalendarEventsWithContext_startDate_endDate_priorScoreThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (+[_PSSuggestionFromTextPredictor isEligibleUnstructuredEvent:](_PSSuggestionFromTextPredictor, "isEligibleUnstructuredEvent:"))
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

id __125___PSSuggestionFromTextPredictor_suggestionsFromUnstructuredCalendarEventsWithContext_startDate_endDate_priorScoreThreshold___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  v4 = [a2 title];
  int v5 = *(_DWORD *)(a1 + 48);
  BOOL v6 = [*(id *)(a1 + 40) bundleID];
  LODWORD(v7) = v5;
  v8 = [v3 suggestionFromText:v4 priorScoreThreshold:v6 bundleID:@"Calendar Event Title (Siri Vocabulary)" reason:v7];

  return v8;
}

void __98___PSSuggestionFromTextPredictor_suggestionFromContactPriors_priorScoreThreshold_bundleID_reason___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [a1 contactIdentifier];
  [a1 priorScore];
  double v7 = *(float *)(a2 + 32);
  int v9 = 138412802;
  v10 = v6;
  __int16 v11 = 2048;
  double v12 = v8;
  __int16 v13 = 2048;
  double v14 = v7;
  _os_log_debug_impl(&dword_1A314B000, a3, OS_LOG_TYPE_DEBUG, "Contact %@ has prior score %f, thresholding with %f", (uint8_t *)&v9, 0x20u);
}

@end