@interface UIViewController(PXImageModulationManager)
- (double)px_HDRFocus;
- (double)px_imageModulationIntensity;
- (id)px_imageModulationManager;
- (uint64_t)_px_windowMatchesImageModulationManager:()PXImageModulationManager;
- (uint64_t)_pxswizzled_imageModulation_viewDidDisappear:()PXImageModulationManager;
- (uint64_t)_pxswizzled_imageModulation_viewWillAppear:()PXImageModulationManager;
- (uint64_t)_pxswizzled_imageModulation_viewWillDisappear:()PXImageModulationManager;
- (uint64_t)px_enableImageModulation;
- (void)_px_viewAppearanceDidChange;
- (void)px_setNeedsHDRFocusUpdate;
- (void)px_setNeedsImageModulationIntensityUpdate;
@end

@implementation UIViewController(PXImageModulationManager)

- (void)_px_viewAppearanceDidChange
{
  v1 = objc_msgSend(a1, "px_imageModulationManager");
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__UIViewController_PXImageModulationManager___px_viewAppearanceDidChange__block_invoke;
  v3[3] = &unk_1E5DD0FA8;
  id v4 = v1;
  id v2 = v1;
  [v2 performChanges:v3];
}

- (uint64_t)_pxswizzled_imageModulation_viewDidDisappear:()PXImageModulationManager
{
  objc_msgSend(a1, "_pxswizzled_imageModulation_viewDidDisappear:");
  return objc_msgSend(a1, "_px_viewAppearanceDidChange");
}

- (uint64_t)_pxswizzled_imageModulation_viewWillDisappear:()PXImageModulationManager
{
  objc_msgSend(a1, "_pxswizzled_imageModulation_viewWillDisappear:");
  return objc_msgSend(a1, "_px_viewAppearanceDidChange");
}

- (uint64_t)_pxswizzled_imageModulation_viewWillAppear:()PXImageModulationManager
{
  objc_msgSend(a1, "_pxswizzled_imageModulation_viewWillAppear:");
  return objc_msgSend(a1, "_px_viewAppearanceDidChange");
}

- (void)px_setNeedsImageModulationIntensityUpdate
{
  objc_msgSend(a1, "px_imageModulationManager");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setNeedsImageModulationIntensityUpdate];
}

- (double)px_imageModulationIntensity
{
  return 0.0;
}

- (void)px_setNeedsHDRFocusUpdate
{
  objc_msgSend(a1, "px_imageModulationManager");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 setNeedsHDRFocusUpdate];
}

- (double)px_HDRFocus
{
  return 0.0;
}

- (uint64_t)_px_windowMatchesImageModulationManager:()PXImageModulationManager
{
  id v4 = a3;
  v5 = [a1 viewIfLoaded];
  v6 = [v5 window];

  v7 = [v4 rootViewController];

  v8 = [v7 viewIfLoaded];
  v9 = [v8 window];

  if (v6) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  uint64_t v12 = v10 || v6 == v9;

  return v12;
}

- (id)px_imageModulationManager
{
  objc_getAssociatedObject(a1, (const void *)PXImageModulationManagerAssociationKey);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = [a1 viewIfLoaded];
    id v4 = [v3 window];

    if (v4)
    {
      objc_msgSend(v4, "px_imageModulationManager");
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      if (!v2)
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    else
    {
      v6 = [a1 parentViewController];
      v7 = objc_msgSend(v6, "px_imageModulationManager");
      v8 = v7;
      if (v7)
      {
        id v2 = v7;
      }
      else
      {
        v9 = [a1 presentingViewController];
        objc_msgSend(v9, "px_imageModulationManager");
        id v2 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (!v2) {
        goto LABEL_5;
      }
    }
    objc_setAssociatedObject(a1, (const void *)PXImageModulationManagerAssociationKey, v2, (void *)1);
    goto LABEL_5;
  }
LABEL_6:
  return v2;
}

- (uint64_t)px_enableImageModulation
{
  id v2 = objc_opt_class();
  objc_msgSend(v2, "px_swizzleOnceAsSubclassOfClass:context:usingBlock:", objc_opt_class(), px_enableImageModulation_PXImageModulationContext, &__block_literal_global_258_149091);
  return objc_msgSend(a1, "px_setImageModulationEnabled:", 1);
}

@end