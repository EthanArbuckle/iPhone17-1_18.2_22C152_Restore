@interface UIViewController(CPL)
- (id)_px_footerToolbar;
- (id)_px_offersTableView;
- (void)px_insertFooterToolbarWithItems:()CPL;
- (void)px_removeFooterToolbar;
@end

@implementation UIViewController(CPL)

- (id)_px_footerToolbar
{
  return objc_getAssociatedObject(a1, &pxFooterToolbarKey);
}

- (id)_px_offersTableView
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v1 = [a1 view];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(v1, "subviews", 0);
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)px_removeFooterToolbar
{
  objc_msgSend(a1, "_px_footerToolbar");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 removeFromSuperview];
  objc_setAssociatedObject(a1, &pxFooterToolbarKey, 0, (void *)1);
  v2 = objc_msgSend(a1, "_px_offersTableView");
  [v2 contentInset];
  objc_msgSend(v2, "setContentInset:");
}

- (void)px_insertFooterToolbarWithItems:()CPL
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "_px_footerToolbar");

  if (!v5)
  {
    v6 = objc_opt_new();
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [a1 view];
    [v7 addSubview:v6];
    long long v8 = (void *)MEMORY[0x1E4F28DC8];
    long long v9 = _NSDictionaryOfVariableBindings(&cfstr_Tooolbar.isa, v6, 0);
    long long v10 = [v8 constraintsWithVisualFormat:@"H:|[tooolbar]|" options:0 metrics:0 views:v9];
    [v7 addConstraints:v10];

    long long v11 = (void *)MEMORY[0x1E4F28DC8];
    v12 = _NSDictionaryOfVariableBindings(&cfstr_Tooolbar.isa, v6, 0);
    uint64_t v13 = [v11 constraintsWithVisualFormat:@"V:[tooolbar]|" options:0 metrics:0 views:v12];
    [v7 addConstraints:v13];

    v14 = objc_msgSend(a1, "_px_offersTableView");
    [v14 contentInset];
    objc_msgSend(v14, "setContentInset:");
    objc_setAssociatedObject(a1, &pxFooterToolbarKey, v6, (void *)1);
  }
  objc_msgSend(a1, "_px_footerToolbar");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v15 setItems:v4];
}

@end