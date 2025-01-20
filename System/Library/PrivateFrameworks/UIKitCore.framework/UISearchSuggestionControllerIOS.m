@interface UISearchSuggestionControllerIOS
@end

@implementation UISearchSuggestionControllerIOS

id __52___UISearchSuggestionControllerIOS__suggestionsMenu__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v17 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v21;
    v6 = (id *)(a1 + 32);
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v5) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v9 = [v8 localizedSuggestion];
        if (!v9)
        {
          v10 = [v8 localizedAttributedSuggestion];

          if (!v10) {
            continue;
          }
          v11 = [v8 localizedAttributedSuggestion];
          v9 = [v11 string];
        }
        if (objc_opt_respondsToSelector())
        {
          v12 = [v8 iconImage];
        }
        else
        {
          v12 = 0;
        }
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __52___UISearchSuggestionControllerIOS__suggestionsMenu__block_invoke_2;
        v18[3] = &unk_1E52DD308;
        objc_copyWeak(&v19, v6);
        v18[4] = v8;
        v13 = +[UIAction actionWithTitle:v9 image:v12 identifier:0 handler:v18];
        v14 = [v8 localizedAttributedSuggestion];
        [v13 setAttributedTitle:v14];

        [v17 addObject:v13];
        objc_destroyWeak(&v19);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }

  return v17;
}

void __52___UISearchSuggestionControllerIOS__suggestionsMenu__block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(v2);
    uint64_t v4 = [v6 delegate];
    id v5 = objc_loadWeakRetained(v2);
    [v4 searchSuggestionController:v5 didSelectSuggestion:*(void *)(a1 + 32) atIndexPath:0];
  }
}

void __64___UISearchSuggestionControllerIOS__dismissMenuWithoutAnimation__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) menuInteraction];
  [v1 dismissMenu];
}

uint64_t __68___UISearchSuggestionControllerIOS__updateMenuWithSuggestionGroups___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _suggestionsMenu];
}

uint64_t __90___UISearchSuggestionControllerIOS_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _suggestionsMenu];
}

void __73___UISearchSuggestionControllerIOS__suggestionsRecoveryGestureRecognized__block_invoke(uint64_t a1)
{
  id v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    id v5 = [v2 suggestions];
    objc_msgSend(v3, "setSearchSuggestions:");
  }
  else
  {
    id v5 = [v2 searchTextField];
    uint64_t v4 = [*(id *)(a1 + 40) suggestions];
    [v5 setSearchSuggestions:v4];
  }
}

@end