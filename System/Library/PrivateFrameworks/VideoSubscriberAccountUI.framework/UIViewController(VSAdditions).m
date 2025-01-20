@interface UIViewController(VSAdditions)
- (id)vs_addFocusGuideFromView:()VSAdditions toViews:withDirection:;
- (uint64_t)vs_ignoreInteractionCount;
- (uint64_t)vs_updateNavigationItemAndForceViewReloadWithSearchController:()VSAdditions;
- (uint64_t)vs_updateNavigationItemAndForceViewReloadWithSearchController:()VSAdditions rightBarButtonItem:;
- (void)_forceViewReload;
- (void)vs_beginIgnoringInteraction;
- (void)vs_endIgnoringInteraction;
- (void)vs_makeFrontmostAnimated:()VSAdditions completion:;
- (void)vs_makeTopmostInNavigationStack:()VSAdditions completion:;
- (void)vs_setIgnoreInteractionCount:()VSAdditions;
- (void)vs_updateViewModel:()VSAdditions withUserInterfaceStyle:andPreferredLogoSize:;
@end

@implementation UIViewController(VSAdditions)

- (uint64_t)vs_ignoreInteractionCount
{
  v1 = objc_getAssociatedObject(a1, "VSInteractionIgnoreCountKey");
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (void)vs_setIgnoreInteractionCount:()VSAdditions
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "VSInteractionIgnoreCountKey", v2, (void *)3);
}

- (void)vs_beginIgnoringInteraction
{
  uint64_t v2 = objc_msgSend(a1, "vs_ignoreInteractionCount");
  objc_msgSend(a1, "vs_setIgnoreInteractionCount:", v2 + 1);
  if (!v2)
  {
    id v3 = [a1 view];
    [v3 setUserInteractionEnabled:0];
  }
}

- (void)vs_endIgnoringInteraction
{
  uint64_t v2 = objc_msgSend(a1, "vs_ignoreInteractionCount") - 1;
  objc_msgSend(a1, "vs_setIgnoreInteractionCount:", v2);
  if (!v2)
  {
    id v3 = [a1 view];
    [v3 setUserInteractionEnabled:1];
  }
}

- (id)vs_addFocusGuideFromView:()VSAdditions toViews:withDirection:
{
  id v8 = a3;
  v9 = (objc_class *)MEMORY[0x263F1C640];
  id v10 = a4;
  id v11 = objc_alloc_init(v9);
  v12 = [a1 view];
  [v12 addLayoutGuide:v11];

  [v11 setPreferredFocusEnvironments:v10];
  v13 = [v11 widthAnchor];
  v14 = [v8 widthAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  v16 = [v11 heightAnchor];
  v17 = [v8 heightAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [v18 setActive:1];

  switch(a5)
  {
    case 1:
      v19 = [v11 bottomAnchor];
      uint64_t v20 = [v8 topAnchor];
      goto LABEL_5;
    case 2:
      v21 = [v11 topAnchor];
      v22 = [v8 topAnchor];
      v23 = [v21 constraintEqualToAnchor:v22];
      [v23 setActive:1];

      uint64_t v24 = [v11 rightAnchor];
      goto LABEL_6;
    case 4:
      v19 = [v11 topAnchor];
      uint64_t v20 = [v8 bottomAnchor];
LABEL_5:
      v25 = (void *)v20;
      v26 = [v19 constraintEqualToAnchor:v20];
      [v26 setActive:1];

      uint64_t v24 = [v11 leftAnchor];
LABEL_6:
      v27 = v24;
      uint64_t v28 = [v8 leftAnchor];
      goto LABEL_8;
    case 8:
      v29 = [v11 topAnchor];
      v30 = [v8 topAnchor];
      v31 = [v29 constraintEqualToAnchor:v30];
      [v31 setActive:1];

      v27 = [v11 leftAnchor];
      uint64_t v28 = [v8 rightAnchor];
LABEL_8:
      v32 = (void *)v28;
      v33 = [v27 constraintEqualToAnchor:v28];
      [v33 setActive:1];

      break;
    default:
      v27 = VSDefaultLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_23F9AB000, v27, OS_LOG_TYPE_DEFAULT, "Tried to add a UIFocusGuide for an unsupported direction", v35, 2u);
      }
      break;
  }

  return v11;
}

- (void)vs_updateViewModel:()VSAdditions withUserInterfaceStyle:andPreferredLogoSize:
{
  id v9 = a5;
  if ([v9 userInterfaceStyle] != a6)
  {
    if ([v9 conformsToProtocol:&unk_26F394860]) {
      objc_msgSend(v9, "setPreferredLogoSize:", a1, a2);
    }
    [v9 setUserInterfaceStyle:a6];
  }
}

- (uint64_t)vs_updateNavigationItemAndForceViewReloadWithSearchController:()VSAdditions
{
  id v4 = a3;
  v5 = [a1 navigationItem];
  [v5 setSearchController:v4];

  return [a1 _forceViewReload];
}

- (uint64_t)vs_updateNavigationItemAndForceViewReloadWithSearchController:()VSAdditions rightBarButtonItem:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 navigationItem];
  [v8 setRightBarButtonItem:v6];

  id v9 = [a1 navigationItem];
  [v9 setSearchController:v7];

  return [a1 _forceViewReload];
}

- (void)_forceViewReload
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v1 = [a1 view];
  uint64_t v2 = [v1 window];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = objc_msgSend(v2, "subviews", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 removeFromSuperview];
        [v2 addSubview:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)vs_makeFrontmostAnimated:()VSAdditions completion:
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v6 = a4;
  id v7 = [a1 presentedViewController];

  if (v7)
  {
    id v8 = VSDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = [a1 debugDescription];
      long long v10 = [a1 presentedViewController];
      long long v11 = [v10 debugDescription];
      int v13 = 138412546;
      uint64_t v14 = v9;
      __int16 v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_23F9AB000, v8, OS_LOG_TYPE_DEFAULT, "Warning: %@ is already presenting %@", (uint8_t *)&v13, 0x16u);
    }
    long long v12 = [a1 presentedViewController];
    [v12 dismissViewControllerAnimated:a3 completion:v6];
  }
  else
  {
    v6[2](v6);
  }
}

- (void)vs_makeTopmostInNavigationStack:()VSAdditions completion:
{
  id v8 = a4;
  uint64_t v6 = [a1 navigationController];

  if (v6)
  {
    id v7 = [a1 navigationController];
    objc_msgSend(v7, "vs_popToViewController:animated:completion:", a1, a3, v8);
  }
  else
  {
    v8[2]();
  }
}

@end