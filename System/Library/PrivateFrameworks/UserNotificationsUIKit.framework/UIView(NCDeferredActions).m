@interface UIView(NCDeferredActions)
- (uint64_t)_nc_setSubviewHasDeferredActions;
- (uint64_t)_nc_subviewHasDeferredActions;
- (uint64_t)nc_hasDeferredActions;
- (uint64_t)nc_performCrossFadeForDeferredActions;
- (void)_nc_setHasDeferredActions:()NCDeferredActions;
- (void)_nc_setSubviewHasDeferredActions:()NCDeferredActions;
- (void)nc_performDeferredActionsIfNeeded;
- (void)nc_setHasDeferredActions;
@end

@implementation UIView(NCDeferredActions)

- (void)_nc_setHasDeferredActions:()NCDeferredActions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"UIView.NCDeferredActions.hasDeferredActions", v2, (void *)0x303);
}

- (uint64_t)_nc_subviewHasDeferredActions
{
  v1 = objc_getAssociatedObject(a1, @"UIView.NCDeferredActions.subviewHasDeferredActions");
  id v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)_nc_setSubviewHasDeferredActions:()NCDeferredActions
{
  v5 = objc_msgSend(NSNumber, "numberWithBool:");
  objc_setAssociatedObject(a1, @"UIView.NCDeferredActions.subviewHasDeferredActions", v5, (void *)0x303);

  if ((a3 & 1) != 0 || (objc_msgSend(a1, "nc_hasDeferredActions") & 1) == 0)
  {
    id v6 = [a1 superview];
    objc_msgSend(v6, "_nc_setSubviewHasDeferredActions:", a3);
  }
}

- (uint64_t)_nc_setSubviewHasDeferredActions
{
  return objc_msgSend(a1, "_nc_setSubviewHasDeferredActions:", 1);
}

- (uint64_t)nc_hasDeferredActions
{
  v1 = objc_getAssociatedObject(a1, @"UIView.NCDeferredActions.hasDeferredActions");
  id v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)nc_setHasDeferredActions
{
  objc_msgSend(a1, "_nc_setHasDeferredActions:", 1);
  id v2 = [a1 superview];
  objc_msgSend(v2, "_nc_setSubviewHasDeferredActions");
}

- (void)nc_performDeferredActionsIfNeeded
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(a1, "_nc_subviewHasDeferredActions") & 1) != 0
    || objc_msgSend(a1, "nc_hasDeferredActions"))
  {
    if (objc_msgSend(a1, "_nc_subviewHasDeferredActions")) {
      objc_msgSend(a1, "_nc_setSubviewHasDeferredActions:", 0);
    }
    objc_msgSend(a1, "_nc_setHasDeferredActions:", 0);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v2 = objc_msgSend(a1, "subviews", 0);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "nc_performDeferredActionsIfNeeded");
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
}

- (uint64_t)nc_performCrossFadeForDeferredActions
{
  uint64_t result = objc_msgSend(a1, "nc_hasDeferredActions");
  if (result)
  {
    return objc_msgSend(a1, "pl_performCrossFadeIfNecessary");
  }
  return result;
}

@end