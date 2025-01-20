@interface PTUISettingsController(PXSettingsSearch)
- (uint64_t)px_shouldPreventAnimations;
- (void)_pxswizzled_pushViewController:()PXSettingsSearch animated:;
- (void)px_performWithoutAnimations:()PXSettingsSearch completionHandler:;
- (void)px_setShouldPreventAnimations:()PXSettingsSearch;
@end

@implementation PTUISettingsController(PXSettingsSearch)

- (void)px_setShouldPreventAnimations:()PXSettingsSearch
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_px_shouldPreventAnimations, v2, (void *)1);
}

- (uint64_t)px_shouldPreventAnimations
{
  v1 = objc_getAssociatedObject(a1, sel_px_shouldPreventAnimations);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)_pxswizzled_pushViewController:()PXSettingsSearch animated:
{
  id v6 = a3;
  objc_msgSend(a1, "_pxswizzled_pushViewController:animated:", v6, a4 & ~objc_msgSend(a1, "px_shouldPreventAnimations"));
}

- (void)px_performWithoutAnimations:()PXSettingsSearch completionHandler:
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PTUISettingsController_PXSettingsSearch__px_performWithoutAnimations_completionHandler___block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = a1;
  uint64_t v6 = px_performWithoutAnimations_completionHandler__onceToken;
  v7 = a4;
  v8 = a3;
  if (v6 != -1) {
    dispatch_once(&px_performWithoutAnimations_completionHandler__onceToken, block);
  }
  uint64_t v9 = objc_msgSend(a1, "px_shouldPreventAnimations");
  objc_msgSend(a1, "px_setShouldPreventAnimations:", 1);
  v8[2](v8);

  objc_msgSend(a1, "px_setShouldPreventAnimations:", v9);
  v7[2](v7);
}

@end