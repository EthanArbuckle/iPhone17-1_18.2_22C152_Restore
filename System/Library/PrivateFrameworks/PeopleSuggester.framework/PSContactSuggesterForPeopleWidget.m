@interface PSContactSuggesterForPeopleWidget
@end

@implementation PSContactSuggesterForPeopleWidget

void __64___PSContactSuggesterForPeopleWidget_familyMemberContactHandles__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __37___PSFamilyRecommender_currentFamily__block_invoke_cold_1();
    }
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v8 = objc_msgSend(v5, "members", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(a1 + 32) processFamilyMember:*(void *)(*((void *)&v13 + 1) + 8 * v12++) toFillContactArray:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __64___PSContactSuggesterForPeopleWidget_familyMemberContactHandles__block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __64___PSContactSuggesterForPeopleWidget_familyMemberContactHandles__block_invoke_32_cold_1();
    }
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v8 = objc_msgSend(v5, "members", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(a1 + 32) processFamilyMember:*(void *)(*((void *)&v13 + 1) + 8 * v12++) toFillContactArray:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __57___PSContactSuggesterForPeopleWidget_iCloudFamilyMembers__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = [*(id *)(a1 + 32) cnContact];
  v4 = [v3 identifier];
  id v5 = [v9 valueForKey:v4];

  if (!v5)
  {
    id v6 = [*(id *)(a1 + 32) cnContact];
    v7 = [*(id *)(a1 + 32) cnContact];
    v8 = [v7 identifier];
    [v9 setValue:v6 forKey:v8];
  }
}

void __63___PSContactSuggesterForPeopleWidget_familyRecommendedContacts__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = [*(id *)(a1 + 32) contact];
  v4 = [v3 identifier];
  id v5 = [v9 valueForKey:v4];

  if (!v5)
  {
    id v6 = [*(id *)(a1 + 32) contact];
    v7 = [*(id *)(a1 + 32) contact];
    v8 = [v7 identifier];
    [v9 setValue:v6 forKey:v8];
  }
}

uint64_t __73___PSContactSuggesterForPeopleWidget_interactionBasedRecommendedContacts__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 regularityScore];
  double v7 = v6;
  [v5 regularityScore];
  if (v7 <= v8)
  {
    [v4 regularityScore];
    double v11 = v10;
    [v5 regularityScore];
    uint64_t v9 = v11 < v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

void __73___PSContactSuggesterForPeopleWidget_interactionBasedRecommendedContacts__block_invoke_39(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(a1 + 32) identifier];
  id v4 = [v7 valueForKey:v3];

  if (!v4)
  {
    id v5 = *(void **)(a1 + 32);
    double v6 = [v5 identifier];
    [v7 setValue:v5 forKey:v6];
  }
}

void __55___PSContactSuggesterForPeopleWidget_favoritedContacts__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [*(id *)(a1 + 32) identifier];
  id v4 = [v7 valueForKey:v3];

  if (!v4)
  {
    id v5 = *(void **)(a1 + 32);
    double v6 = [v5 identifier];
    [v7 setValue:v5 forKey:v6];
  }
}

uint64_t __106___PSContactSuggesterForPeopleWidget_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

uint64_t __106___PSContactSuggesterForPeopleWidget_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

void __106___PSContactSuggesterForPeopleWidget_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(int *)(a1 + 48);
  id v5 = a2;
  id v9 = [v3 objectAtIndexedSubscript:v4];
  uint64_t v6 = [v5 objectForKeyedSubscript:v9];

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  double v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t __106___PSContactSuggesterForPeopleWidget_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 peopleWidgetScore];
  double v7 = v6;
  [v5 peopleWidgetScore];
  if (v7 <= v8)
  {
    [v4 peopleWidgetScore];
    double v11 = v10;
    [v5 peopleWidgetScore];
    uint64_t v9 = v11 != v12;
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

void __64___PSContactSuggesterForPeopleWidget_familyMemberContactHandles__block_invoke_32_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "FAFamilyMember (force fetch server) request error %@", v2, v3, v4, v5, v6);
}

@end