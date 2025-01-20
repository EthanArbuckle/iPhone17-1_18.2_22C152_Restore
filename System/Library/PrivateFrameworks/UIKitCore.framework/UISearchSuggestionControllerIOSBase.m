@interface UISearchSuggestionControllerIOSBase
@end

@implementation UISearchSuggestionControllerIOSBase

void __69___UISearchSuggestionControllerIOSBase__geometryChanged_forAncestor___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    [*(id *)(a1 + 32) _refreshSearchSuggestionsMenuAfterGeometryChange];
    id v4 = objc_loadWeakRetained(v2);
    [v4 setHasSetUpGeometryChangeResponse:0];
  }
}

void __69___UISearchSuggestionControllerIOSBase__geometryChanged_forAncestor___block_invoke_4(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v2);
    [v4 _updateMenuWithSuggestionGroups:*(void *)(a1 + 32)];

    id v5 = objc_loadWeakRetained(v2);
    [v5 setHasSetUpGeometryChangeResponse:0];
  }
}

@end