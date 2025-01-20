@interface UITabSidebarTransaction
@end

@implementation UITabSidebarTransaction

void __39___UITabSidebarTransaction_updateTabs___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");

  if (!v3) {
    [*(id *)(a1 + 40) removeObject:v4];
  }
}

void __39___UITabSidebarTransaction_updateTabs___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");

  if (!v3) {
    [*(id *)(a1 + 40) removeObject:v4];
  }
}

void __54___UITabSidebarTransaction_resetCustomizationForTabs___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 allowsHiding]) {
    objc_msgSend(*(id *)(a1 + 32), "updateTab:toHidden:", v7, objc_msgSend(v7, "isHiddenByDefault"));
  }
  if ([v7 _isGroup])
  {
    v3 = *(void **)(a1 + 32);
    id v4 = v7;
    [v3 _resetDisplayOrderForGroup:v4];
    v5 = *(void **)(a1 + 32);
    v6 = [v4 children];

    [v5 resetCustomizationForTabs:v6];
  }
}

uint64_t __34___UITabSidebarTransaction_commit__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commit];
}

void __35___UITabSidebarTransaction__commit__block_invoke(void *a1, void *a2, void *a3)
{
  id v10 = a3;
  v5 = (void *)a1[4];
  id v6 = a2;
  id v7 = [v5 tabsByIdentifier];
  v8 = [v7 objectForKey:v6];

  if (([v8 _isGroup] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a1[6], a1[4], @"_UITabSidebarTransaction.m", 266, @"Cannot change the display order for a non-group element, %@", v8 object file lineNumber description];
  }
  if ([v8 _setDisplayOrderIdentifiers:v10])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[UITabBarController _notifyDisplayOrderChangesForGroup:](a1[5], v8);
    }
  }
}

@end