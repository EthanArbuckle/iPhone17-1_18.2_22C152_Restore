@interface UINavigationController(SUTabBarControllerPackage)
- (uint64_t)_setStoreBarStyle:()SUTabBarControllerPackage clientInterface:;
@end

@implementation UINavigationController(SUTabBarControllerPackage)

- (uint64_t)_setStoreBarStyle:()SUTabBarControllerPackage clientInterface:
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t result = _UIApplicationUsesLegacyUI();
  if (result) {
    return result;
  }
  v8 = (void *)[a1 navigationBar];
  uint64_t v28 = a3;
  if (a3 == 1)
  {
    uint64_t v9 = [a4 lightKeyColor];
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  if (a3 == 2)
  {
    uint64_t v9 = [a4 darkKeyColor];
    uint64_t v10 = 1;
LABEL_6:
    uint64_t v11 = [MEMORY[0x263F1C550] labelColor];
    [v8 setBarStyle:v10];
    if (v9) {
      objc_msgSend((id)objc_msgSend(a1, "view"), "setInteractionTintColor:", v9);
    }
    if (v11)
    {
      id v12 = objc_alloc(NSDictionary);
      v13 = objc_msgSend(v12, "initWithObjectsAndKeys:", v11, *MEMORY[0x263F1C240], 0);
      [v8 setTitleTextAttributes:v13];
    }
  }
  v14 = objc_msgSend((id)objc_msgSend(a1, "navigationBar"), "topItem");
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v15 = (void *)[v14 rightBarButtonItems];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    v18 = 0;
    uint64_t v19 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v15);
        }
        v21 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v21 customView];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v18 = (void *)[v21 customView];
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v22 = (void *)[v14 leftBarButtonItems];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v27 customView];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v18 = (void *)[v27 customView];
          }
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v24);
  }
  [v14 titleView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v18 = (void *)[v14 titleView];
  }
  return [v18 setBarStyle:v28 == 2];
}

@end