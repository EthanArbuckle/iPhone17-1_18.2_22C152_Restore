@interface UISearchSuggestionsListViewController
@end

@implementation UISearchSuggestionsListViewController

void __67___UISearchSuggestionsListViewController_initWithSearchController___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = [WeakRetained searchController];

  if (v11)
  {
    unint64_t v12 = [v9 unsignedIntegerValue];
    v13 = objc_msgSend(v11, "_dci_searchSuggestions");
    unint64_t v14 = [v13 count];

    if (v12 < v14)
    {
      v15 = objc_msgSend(v11, "_dci_searchSuggestions");
      v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v9, "unsignedIntegerValue"));
      [v7 setRepresentedSuggestion:v16];

      goto LABEL_4;
    }
    if (os_variant_has_internal_diagnostics())
    {
      v18 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        goto LABEL_9;
      }
      v19 = objc_msgSend(v11, "_dci_searchSuggestions");
      int v20 = 138412802;
      id v21 = v8;
      __int16 v22 = 2048;
      unint64_t v23 = v12;
      __int16 v24 = 2112;
      v25 = v19;
      _os_log_fault_impl(&dword_1853B0000, v18, OS_LOG_TYPE_FAULT, "Suggestion list not in sync with cell at indexPath: %@. itemIndex=%lu, suggestion list: %@", (uint8_t *)&v20, 0x20u);
    }
    else
    {
      v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &SectionIdentifier_block_invoke___s_category) + 8);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_4;
      }
      v18 = v17;
      v19 = objc_msgSend(v11, "_dci_searchSuggestions");
      int v20 = 138412802;
      id v21 = v8;
      __int16 v22 = 2048;
      unint64_t v23 = v12;
      __int16 v24 = 2112;
      v25 = v19;
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "Suggestion list not in sync with cell at indexPath: %@. itemIndex=%lu, suggestion list: %@", (uint8_t *)&v20, 0x20u);
    }

LABEL_9:
  }
LABEL_4:
}

uint64_t __67___UISearchSuggestionsListViewController_initWithSearchController___block_invoke_29(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 32) forIndexPath:a3 item:a4];
}

@end