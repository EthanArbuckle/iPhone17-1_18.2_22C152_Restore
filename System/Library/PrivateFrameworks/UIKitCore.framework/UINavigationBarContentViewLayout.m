@interface UINavigationBarContentViewLayout
@end

@implementation UINavigationBarContentViewLayout

void __59___UINavigationBarContentViewLayout_setDocumentProperties___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateDocumentIconViewIfNecessary];
}

void __74___UINavigationBarContentViewLayout__updateRenamingContentViewIfNecessary__block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && WeakRetained[1] == *(void *)(a1 + 32))
  {
    v5 = WeakRetained;
    [*(id *)(*(void *)(a1 + 40) + 192) setConstant:-a2];
    id WeakRetained = v5;
  }
}

uint64_t __61___UINavigationBarContentViewLayout_setActiveRenamerSession___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateTitleControlVisibility];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateRenamingContentViewVisibilityIfNecessary];
}

uint64_t __61___UINavigationBarContentViewLayout_setActiveRenamerSession___block_invoke_2(uint64_t result)
{
  if (!*(void *)(result + 32)) {
    return [*(id *)(result + 40) _updateRenamingContentViewIfNecessary];
  }
  return result;
}

void __50___UINavigationBarContentViewLayout__overflowItem__block_invoke(uint64_t a1, void *a2)
{
  v20 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    [(_UINavigationBarContentViewLayout *)(uint64_t)v21 _resolvedButtonBarLayoutInfo];
    int v5 = v21[57];
    uint64_t v6 = [WeakRetained titleMenuProvider];
    v7 = (void (**)(void, void))v6;
    if (v5 && v6)
    {
      v8 = [WeakRetained documentProperties];
      v9 = [v8 _representedURL];
      v10 = +[_UINavigationBarTitleControl titleMenuSuggestedActionsWithDocumentFileURL:v9];
      v11 = ((void (**)(void, void *))v7)[2](v7, v10);

      if (v11)
      {
        v12 = objc_msgSend(v11, "_copyWithOptions:", objc_msgSend(v11, "options") | 1);
        [v4 addObject:v12];
      }
    }
    v13 = [WeakRetained additionalOverflowItems];
    if (v13) {
      [v4 addObject:v13];
    }
    v14 = [WeakRetained leadingBar];
    v15 = [v14 elementsForOverflowMenu];
    [v4 addObjectsFromArray:v15];

    v16 = [WeakRetained leadingBar];
    __addItemsFromBarForMode(v4, v16, [WeakRetained leadingGroupsMode]);

    v17 = [WeakRetained centerBar];
    __addItemsFromBarForMode(v4, v17, [WeakRetained centerGroupsMode]);

    v18 = [WeakRetained trailingBar];
    __addItemsFromBarForMode(v4, v18, 1);

    if ([WeakRetained _canCustomizeBar])
    {
      v19 = [WeakRetained _fixedItemsMenu];
      [v4 addObject:v19];
    }
    v20[2](v20, v4);
  }
  else
  {
    v20[2](v20, (void *)MEMORY[0x1E4F1CBF0]);
  }
}

id __50___UINavigationBarContentViewLayout__overflowItem__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [(_UINavigationBarContentViewLayout *)(uint64_t)v14 _resolvedButtonBarLayoutInfo];
  if (v14[57])
  {
    v3 = [WeakRetained documentProperties];
    if (v3)
    {
      v4 = [WeakRetained overflowItem];
      int v5 = [v4 view];

      if (v5)
      {
        uint64_t v6 = [v5 contextMenuInteraction];
      }
      else
      {
        v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:*(void *)(a1 + 40) object:WeakRetained file:@"_UINavigationBarContentViewLayout.m" lineNumber:1969 description:@"Trying to present the overflow menu without a view to present it from."];

        uint64_t v6 = [0 contextMenuInteraction];
        v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:*(void *)(a1 + 40) object:WeakRetained file:@"_UINavigationBarContentViewLayout.m" lineNumber:1971 description:@"Trying to present the overflow menu but the button does not have a context menu interaction."];
      }
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __50___UINavigationBarContentViewLayout__overflowItem__block_invoke_3;
      v12[3] = &unk_1E52DE548;
      id v13 = v5;
      id v7 = v5;
      v8 = [v3 _headerViewForMenuInteraction:v6 sourceViewProvider:v12];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __50___UINavigationBarContentViewLayout__overflowItem__block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __52___UINavigationBarContentViewLayout__fixedItemsMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = [WeakRetained[41] delegate];
    [v2 navigationBarContentViewDidTriggerCustomization:v3[41]];

    id WeakRetained = v3;
  }
}

void __62___UINavigationBarContentViewLayout__updateFixedLeadingGroups__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[41];
    uint64_t v6 = [v5 delegate];
    id v7 = [v8 sender];
    [v6 navigationBarContentViewDidTriggerBackAction:v5 fromBackButtonItem:v7];
  }
}

BOOL __99___UINavigationBarContentViewLayout__updateInlineSearchBarGroupWithLeadingPadding_trailingPadding___block_invoke(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = [v1 title];
    if ([v3 length])
    {
      v4 = [v2 image];
      BOOL v5 = v4 == 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __51___UINavigationBarContentViewLayout_layoutSubviews__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 320) view];
  [v1 layoutIfNeeded];
}

@end