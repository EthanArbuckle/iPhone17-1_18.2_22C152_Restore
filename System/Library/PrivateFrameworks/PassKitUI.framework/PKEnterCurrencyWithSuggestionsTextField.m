@interface PKEnterCurrencyWithSuggestionsTextField
@end

@implementation PKEnterCurrencyWithSuggestionsTextField

void __61___PKEnterCurrencyWithSuggestionsTextField_setInputDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained suggestionsDataSource];
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = v3;
    v6 = [v2 textSuggestionsForTextField:v4];
    [v5 setSuggestions:v6];
  }
}

@end