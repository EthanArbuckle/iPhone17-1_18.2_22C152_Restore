@interface UIViewController(PXImageModulationManager_Private)
- (double)_px_imageModulationMixFactorWithPresentedViewController:()PXImageModulationManager_Private;
- (double)px_effectiveHDRFocus;
- (double)px_effectiveImageModulationIntensity;
- (uint64_t)px_isImageModulationEnabled;
- (void)px_setImageModulationEnabled:()PXImageModulationManager_Private;
@end

@implementation UIViewController(PXImageModulationManager_Private)

- (double)_px_imageModulationMixFactorWithPresentedViewController:()PXImageModulationManager_Private
{
  id v4 = a3;
  int v5 = [v4 _appearState];
  if (v5 == 3)
  {
    BOOL v7 = objc_msgSend(a1, "px_isImageModulationEnabled") == 0;
    double v8 = 1.0;
    double v9 = 0.0;
LABEL_6:
    if (v7) {
      double v6 = v8;
    }
    else {
      double v6 = v9;
    }
    goto LABEL_10;
  }
  if (v5 == 2)
  {
    double v6 = 1.0;
    goto LABEL_10;
  }
  double v6 = 0.0;
  if (v5 == 1)
  {
    BOOL v7 = objc_msgSend(v4, "px_isImageModulationEnabled") == 0;
    double v8 = 0.0;
    double v9 = 1.0;
    goto LABEL_6;
  }
LABEL_10:

  return v6;
}

- (double)px_effectiveImageModulationIntensity
{
  v2 = objc_msgSend(a1, "px_topmostPresentedViewController");
  if (v2)
  {
    objc_msgSend(a1, "_px_imageModulationMixFactorWithPresentedViewController:", v2);
    double v4 = v3;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __90__UIViewController_PXImageModulationManager_Private__px_effectiveImageModulationIntensity__block_invoke;
    v11[3] = &unk_1E5DBF650;
    v11[4] = a1;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __90__UIViewController_PXImageModulationManager_Private__px_effectiveImageModulationIntensity__block_invoke_2;
    v9[3] = &unk_1E5DBF650;
    id v10 = v2;
    double v5 = PXImageModulationFloatByLinearlyInterpolatingFloats(v11, v9, v4);
  }
  else
  {
    objc_msgSend(a1, "px_imageModulationIntensity");
    double v5 = v6;
  }
  if (px_effectiveImageModulationIntensity_onceToken != -1) {
    dispatch_once(&px_effectiveImageModulationIntensity_onceToken, &__block_literal_global_287_149088);
  }
  if (px_effectiveImageModulationIntensity_hookExists)
  {
    objc_msgSend(a1, "px_effectiveImageModulationIntensityWithProposedValue:", v5);
    double v5 = v7;
  }

  return v5;
}

- (double)px_effectiveHDRFocus
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(a1, "px_topmostPresentedViewController");
  if (v2)
  {
    objc_msgSend(a1, "_px_imageModulationMixFactorWithPresentedViewController:", v2);
    double v4 = v3;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__UIViewController_PXImageModulationManager_Private__px_effectiveHDRFocus__block_invoke;
    v11[3] = &unk_1E5DBF650;
    v11[4] = a1;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__UIViewController_PXImageModulationManager_Private__px_effectiveHDRFocus__block_invoke_2;
    v9[3] = &unk_1E5DBF650;
    id v10 = v2;
    double v5 = PXImageModulationFloatByLinearlyInterpolatingFloats(v11, v9, v4);
  }
  else
  {
    objc_msgSend(a1, "px_HDRFocus");
    double v5 = v6;
  }
  double v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v13 = a1;
    __int16 v14 = 2112;
    v15 = v2;
    __int16 v16 = 2048;
    double v17 = v5;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "[ImageModulation] Asked %@ for its presentedVC: %@ to determine effectiveHDRFocus: %f", buf, 0x20u);
  }

  return v5;
}

- (void)px_setImageModulationEnabled:()PXImageModulationManager_Private
{
  v2 = (const void *)PXImageModulationEnabledAssociationKey;
  objc_msgSend(NSNumber, "numberWithBool:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v2, v3, (void *)1);
}

- (uint64_t)px_isImageModulationEnabled
{
  v1 = objc_getAssociatedObject(a1, (const void *)PXImageModulationEnabledAssociationKey);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end