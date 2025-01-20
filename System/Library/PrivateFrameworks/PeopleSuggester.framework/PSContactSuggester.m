@interface PSContactSuggester
@end

@implementation PSContactSuggester

void __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_136(uint64_t a1, void *a2)
{
}

void __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = +[_PSLogging suggestionSignpost];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1();
  }
}

void __150___PSContactSuggester_gameCenterSuggestionsWithMaxSuggestions_interactionDomains_appleUsersOnly_includeGroupSuggestions_excludeContactsByIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 state] == 1)
  {
    v3 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __150___PSContactSuggester_gameCenterSuggestionsWithMaxSuggestions_interactionDomains_appleUsersOnly_includeGroupSuggestions_excludeContactsByIdentifiers___block_invoke_cold_1(v2, v3);
    }
  }
}

void __150___PSContactSuggester_gameCenterSuggestionsWithMaxSuggestions_interactionDomains_appleUsersOnly_includeGroupSuggestions_excludeContactsByIdentifiers___block_invoke_166(uint64_t a1, void *a2)
{
  id v5 = [a2 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v4 = [v5 identifier];
    [v3 addObject:v4];
  }
}

uint64_t __150___PSContactSuggester_gameCenterSuggestionsWithMaxSuggestions_interactionDomains_appleUsersOnly_includeGroupSuggestions_excludeContactsByIdentifiers___block_invoke_171(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = objc_msgSend(a2, "recipients", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    char v7 = 1;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) identifier];
        if (v9)
        {
          if ([*(id *)(a1 + 32) containsObject:v9]) {
            char v7 = 0;
          }
          else {
            [*(id *)(a1 + 40) addObject:v9];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    char v7 = 1;
  }

  [*(id *)(a1 + 32) unionSet:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) removeAllObjects];
  return v7 & 1;
}

uint64_t __151___PSContactSuggester_contactSuggestionsWithMaxSuggestions_interactionDomains_referenceDate_appleUsersOnly_includeGroups_excludeContactsByIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 regularityScore];
  double v7 = v6;
  [v5 regularityScore];
  if (v7 > v8)
  {
LABEL_5:
    uint64_t v12 = -1;
    goto LABEL_6;
  }
  [v4 regularityScore];
  double v10 = v9;
  [v5 regularityScore];
  if (v10 >= v11)
  {
    unint64_t v13 = [v4 totalFrequency];
    if (v13 <= [v5 totalFrequency])
    {
      unint64_t v15 = [v4 totalFrequency];
      uint64_t v12 = v15 < [v5 totalFrequency];
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v12 = 1;
LABEL_6:

  return v12;
}

uint64_t __128___PSContactSuggester_computeContactPriorsForContactIdentifiers_withTimeConstant_withInteractionMechanisms_asOf_overLookbackOf___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 priorScore];
  float v6 = v5;
  [v4 priorScore];
  float v8 = v7;

  if (v6 <= v8) {
    return 1;
  }
  else {
    return -1;
  }
}

void __56___PSContactSuggester_computeAndSaveContactPriorArchive__block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1A6243860]();
  v3 = [*(id *)(a1 + 32) computeContactPriorsForContactIdentifiers:0];
  id v4 = [_PSContactSuggesterArchive alloc];
  float v5 = [MEMORY[0x1E4F1C9C8] date];
  float v6 = [(_PSContactSuggesterArchive *)v4 initWithArchiveDate:v5 contactPriorDictionary:v3];

  [*(id *)(a1 + 32) writeArchive:v6];
}

void __54___PSContactSuggester__cascadeContentForContactPriors__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 changePublisherWithUseCase:@"PeopleSuggesterContactPriors"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54___PSContactSuggester__cascadeContentForContactPriors__block_invoke_3;
  v5[3] = &unk_1E5ADEAE0;
  v5[4] = *(void *)(a1 + 32);
  id v4 = (id)[v3 sinkWithCompletion:&__block_literal_global_215 receiveInput:v5];
}

void __54___PSContactSuggester__cascadeContentForContactPriors__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = [a2 allLocalInstances];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v20;
    *(void *)&long long v4 = 67109376;
    long long v17 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v2);
        }
        float v8 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v7), "content", v17);
        if ([v8 minVersion] && objc_msgSend(v8, "version"))
        {
          if ([v8 minVersion] <= 1)
          {
            uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
            uint64_t v16 = *(void **)(v15 + 40);
            *(void *)(v15 + 40) = v8;

            goto LABEL_18;
          }
          double v9 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v10 = [v8 version];
            int v11 = [v8 minVersion];
            *(_DWORD *)buf = 67109632;
            int v24 = v10;
            __int16 v25 = 1024;
            int v26 = v11;
            __int16 v27 = 1024;
            int v28 = 1;
            _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_DEFAULT, "Skipping persisted cascade data with version=%d, minVersion=%d because this incantation of the software (%d) does not satisfy that minVersion", buf, 0x14u);
          }
        }
        else
        {
          double v9 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          {
            int v12 = [v8 version];
            int v13 = [v8 minVersion];
            *(_DWORD *)buf = v17;
            int v24 = v12;
            __int16 v25 = 1024;
            int v26 = v13;
            _os_log_fault_impl(&dword_1A314B000, v9, OS_LOG_TYPE_FAULT, "Skipping persisted cascade data with invalid versioning info (version=%d, minVersion=%d)", buf, 0xEu);
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v14 = [v2 countByEnumeratingWithState:&v19 objects:v29 count:16];
      uint64_t v5 = v14;
    }
    while (v14);
  }
LABEL_18:
}

id __90___PSContactSuggester__filteredContactDictionaryFromCascadeContent_forContactIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  id v3 = a2;
  long long v4 = objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));
  uint64_t v5 = [v4 stringValue];
  int v6 = [v5 isEqual:v3];

  if (v6) {
    id v7 = v4;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

void __90___PSContactSuggester__filteredContactDictionaryFromCascadeContent_forContactIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  long long v4 = (void *)MEMORY[0x1A6243860]();
  uint64_t v5 = [NSNumber numberWithLongLong:a2];
  if ([*(id *)(a1 + 32) containsObject:v5])
  {
    int v6 = *(void **)(a1 + 40);
    id v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    [v6 setObject:v5 forKeyedSubscript:v7];
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

void __90___PSContactSuggester__filteredContactDictionaryFromCascadeContent_forContactIdentifiers___block_invoke_3(uint64_t a1, float a2)
{
  long long v4 = (void *)MEMORY[0x1A6243860]();
  uint64_t v5 = *(void **)(a1 + 32);
  int v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  id v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    float v8 = [v7 stringValue];
    double v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];

    if (!v9)
    {
      int v10 = objc_opt_new();
      [v10 setRank:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
      *(float *)&double v11 = a2;
      [v10 setPriorScore:v11];
      [v10 setContactIdentifier:v8];
      int v12 = [*(id *)(a1 + 48) modelName];
      [v10 setModelName:v12];

      int v13 = [*(id *)(a1 + 48) modelVersion];
      [v10 setModelVersion:v13];

      [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v8];
    }
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
}

void __58___PSContactSuggester_contactPriorsForContactIdentifiers___block_invoke()
{
  v0 = [MEMORY[0x1E4F5B418] interactionSignpost];
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSContactPriorsForContactIdentifiers", (const char *)&unk_1A3274816, v1, 2u);
  }
}

BOOL __58___PSContactSuggester_contactPriorsForContactIdentifiers___block_invoke_229(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __58___PSContactSuggester_contactPriorsForContactIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

uint64_t __54___PSContactSuggester_contactPriorSuggestionsForText___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) matchSpansOfString:*(void *)(a1 + 40)];

  return MEMORY[0x1F41817F8]();
}

void __80___PSContactSuggester__cascadeContentForPriorsArchive_cascadeContactEnumerator___block_invoke(uint64_t a1)
{
}

void __80___PSContactSuggester__cascadeContentForPriorsArchive_cascadeContactEnumerator___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a4;
  int v6 = [a3 sourceItemIdentifier];
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  float v8 = v7;
  if (v7)
  {
    [v7 priorScore];
    *(_DWORD *)(*(void *)(a1 + 48) + 16 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 8) = v9;
    *(void *)(*(void *)(a1 + 48) + 16 * (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))++) = [v10 longLongValue];
  }
}

uint64_t __80___PSContactSuggester__cascadeContentForPriorsArchive_cascadeContactEnumerator___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(float *)&unsigned int v3 = *(float *)(a2 + 8) - *(float *)(a3 + 8);
  LODWORD(v4) = (__PAIR64__(*(float *)&v3 > 0.0, v3) - COERCE_UNSIGNED_INT(0.0)) >> 32;
  if (!v4)
  {
    uint64_t v4 = (uint64_t)(*(void *)a2 - *(void *)a3) >> 63;
    if (*(void *)a2 > *(void *)a3) {
      LODWORD(v4) = v4 + 1;
    }
  }
  return -(int)v4;
}

void __55___PSContactSuggester__cascadeContentForPriorsArchive___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unsigned int v3 = [MEMORY[0x1E4F57FB8] setEnumeratorWithUseCase:@"PeopleSuggesterContactPriors"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55___PSContactSuggester__cascadeContentForPriorsArchive___block_invoke_2;
  v5[3] = &unk_1E5ADEC80;
  id v6 = v2;
  id v4 = v2;
  [v3 enumerateAllSets:0 itemType:19668 usingBlock:v5];
}

void __55___PSContactSuggester__cascadeContentForPriorsArchive___block_invoke_2(uint64_t a1, void *a2)
{
  unsigned int v3 = [a2 changePublisherWithUseCase:@"PeopleSuggesterContactPriors"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55___PSContactSuggester__cascadeContentForPriorsArchive___block_invoke_4;
  v5[3] = &unk_1E5ADEC58;
  id v6 = *(id *)(a1 + 32);
  id v4 = (id)[v3 sinkWithCompletion:&__block_literal_global_261 receiveInput:v5];
}

void __55___PSContactSuggester__cascadeContentForPriorsArchive___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned int v3 = objc_msgSend(a2, "allLocalInstances", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        float v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = *(void *)(a1 + 32);
        id v10 = [v8 content];
        double v11 = [v8 metaContent];
        int v12 = [v8 sharedIdentifier];
        (*(void (**)(uint64_t, void *, void *, void *))(v9 + 16))(v9, v10, v11, v12);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

void __46___PSContactSuggester__writeArchiveToCascade___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v4 = 0;
  id v3 = a2;
  [v3 registerItem:v2 error:&v4];
  [v3 finish:0];
}

void __91___PSContactSuggester_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "XPC Error: %@", v2, v3, v4, v5, v6);
}

void __150___PSContactSuggester_gameCenterSuggestionsWithMaxSuggestions_interactionDomains_appleUsersOnly_includeGroupSuggestions_excludeContactsByIdentifiers___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Finalizing local events failed: %@", v4, 0xCu);
}

@end