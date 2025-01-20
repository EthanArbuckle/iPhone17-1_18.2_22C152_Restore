@interface UITabModel
@end

@implementation UITabModel

uint64_t __42___UITabModel_setTabItems_inferSelection___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _setTabModel:*(void *)(a1 + 32)];
}

void __42___UITabModel_setTabItems_inferSelection___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isTabHidden:") & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __42___UITabModel_setTabItems_inferSelection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setTabModel:0];
}

void __39___UITabModel__inferCurrentEditability__block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 _isCustomizable];
  char v7 = [v6 _isUniquelySPI];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
  }
  *a4 = v8;
}

void __60___UITabModel__setSelectedItem_notifyDelegateOnReselection___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    -[UITabBarController _selectedElementDidChange:previousElement:](WeakRetained, *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
}

void __42___UITabModel_setTabItems_inferSelection___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    -[UITabBarController _selectedElementDidChange:previousElement:](WeakRetained, *(void **)(*(void *)(a1 + 32) + 48), *(void **)(a1 + 40));
  }
}

uint64_t __42___UITabModel_setTabItems_inferSelection___block_invoke_2_6(uint64_t a1, void *a2)
{
  return [a2 _tabModelDidReload:*(void *)(a1 + 32)];
}

uint64_t __43___UITabModel_replaceItemAtIndex_withItem___block_invoke(void *a1, void *a2)
{
  return [a2 _tabModel:a1[4] didReplaceOldItem:a1[5] newItem:a1[6]];
}

uint64_t __49___UITabModel_visibilityDidChangeForTab_editing___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _tabModel:*(void *)(a1 + 32) visibilityDidChangeForTab:*(void *)(a1 + 40)];
}

uint64_t __35___UITabModel_tabContentDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _tabModel:*(void *)(a1 + 32) tabContentDidChange:*(void *)(a1 + 40)];
}

uint64_t __41___UITabModel_elementsDidChangeForGroup___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _tabModel:*(void *)(a1 + 32) elementsDidChangeForGroup:*(void *)(a1 + 40)];
}

uint64_t __59___UITabModel__selectElement_notifyObserversOnReselection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _selectElement:*(void *)(a1 + 40) notifyObserversOnReselection:0];
}

uint64_t __62___UITabModel__updateSelectedLeafPerformBeforeNotifyingBlock___block_invoke(void *a1, void *a2)
{
  return [a2 _tabModel:a1[4] didChangeSelectedLeaf:a1[5] previousElement:a1[6]];
}

uint64_t __40___UITabModel_setPersistenceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _tabModel:*(void *)(a1 + 32) customizationStoreDidChange:*(void *)(a1 + 40)];
}

uint64_t __38___UITabModel_favoriteOrderDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _tabModel:*(void *)(a1 + 32) favoriteOrderDidChange:*(void *)(a1 + 40) animated:1];
}

uint64_t __42___UITabModel_customizationStoreDidReset___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _tabModel:*(void *)(a1 + 32) favoriteOrderDidReset:*(void *)(a1 + 40)];
}

uint64_t __27___UITabModel_setEditable___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _tabModel:*(void *)(a1 + 32) editableDidChange:*(unsigned __int8 *)(a1 + 40)];
}

@end