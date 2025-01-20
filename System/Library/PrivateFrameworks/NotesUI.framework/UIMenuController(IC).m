@interface UIMenuController(IC)
- (void)ic_addMenuItemsIfNecessary:()IC;
@end

@implementation UIMenuController(IC)

- (void)ic_addMenuItemsIfNecessary:()IC
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 menuItems];
  v6 = v5;
  if (!v5) {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v7 = (void *)[v5 mutableCopy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __51__UIMenuController_IC__ic_addMenuItemsIfNecessary___block_invoke;
        v14[3] = &unk_1E5FDD530;
        v14[4] = v13;
        if ((objc_msgSend(v7, "ic_containsObjectPassingTest:", v14) & 1) == 0) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if (!v7) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((updatedMenuItems) != nil)", "-[UIMenuController(IC) ic_addMenuItemsIfNecessary:]", 1, 0, @"Expected non-nil value for '%s'", "updatedMenuItems");
  }
  [a1 setMenuItems:v7];
}

@end