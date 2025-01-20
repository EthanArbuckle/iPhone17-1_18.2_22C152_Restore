@interface NCNotificationViewController(SBPPTRunnerAdditions)
- (id)_dismissControlOfPresentedLongLook;
- (id)pptLongLookDidDismissBlock;
- (id)pptLongLookDidPresentBlock;
- (id)pptLongLookWillDismissBlock;
- (id)pptLongLookWillPresentBlock;
- (void)_recapDismissLongLookViaPullDown;
- (void)_recapDismissLongLookViaTapOutside;
- (void)_recapSwipePresentLongLook;
- (void)setPPTLongLookDidDismissBlock:()SBPPTRunnerAdditions;
- (void)setPPTLongLookDidPresentBlock:()SBPPTRunnerAdditions;
- (void)setPPTLongLookWillDismissBlock:()SBPPTRunnerAdditions;
- (void)setPPTLongLookWillPresentBlock:()SBPPTRunnerAdditions;
@end

@implementation NCNotificationViewController(SBPPTRunnerAdditions)

- (id)pptLongLookWillPresentBlock
{
  return objc_getAssociatedObject(a1, &_SBPPTRunnerBannerLongLookWillPresentCompletion);
}

- (void)setPPTLongLookWillPresentBlock:()SBPPTRunnerAdditions
{
  if (a3)
  {
    id v4 = (id)MEMORY[0x1D948C7A0](a3);
    objc_setAssociatedObject(a1, &_SBPPTRunnerBannerLongLookWillPresentCompletion, v4, (void *)3);
  }
}

- (id)pptLongLookDidPresentBlock
{
  return objc_getAssociatedObject(a1, &_SBPPTRunnerBannerLongLookDidPresentCompletion);
}

- (void)setPPTLongLookDidPresentBlock:()SBPPTRunnerAdditions
{
  if (a3)
  {
    id v4 = (id)MEMORY[0x1D948C7A0](a3);
    objc_setAssociatedObject(a1, &_SBPPTRunnerBannerLongLookDidPresentCompletion, v4, (void *)3);
  }
}

- (id)pptLongLookWillDismissBlock
{
  return objc_getAssociatedObject(a1, &_SBPPTRunnerBannerLongLookWillDismissCompletion);
}

- (void)setPPTLongLookWillDismissBlock:()SBPPTRunnerAdditions
{
  if (a3)
  {
    id v4 = (id)MEMORY[0x1D948C7A0](a3);
    objc_setAssociatedObject(a1, &_SBPPTRunnerBannerLongLookWillDismissCompletion, v4, (void *)3);
  }
}

- (id)pptLongLookDidDismissBlock
{
  return objc_getAssociatedObject(a1, &_SBPPTRunnerBannerLongLookDidDismissCompletion);
}

- (void)setPPTLongLookDidDismissBlock:()SBPPTRunnerAdditions
{
  if (a3)
  {
    id v4 = (id)MEMORY[0x1D948C7A0](a3);
    objc_setAssociatedObject(a1, &_SBPPTRunnerBannerLongLookDidDismissCompletion, v4, (void *)3);
  }
}

- (void)_recapSwipePresentLongLook
{
  v1 = [a1 view];
  v2 = [v1 window];
  [v1 bounds];
  UIRectGetCenter();
  objc_msgSend(v1, "convertPoint:toView:", 0);
  objc_msgSend(v2, "_convertPointToSceneReferenceSpace:");
  uint64_t v4 = v3;
  uint64_t v6 = v5;

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__NCNotificationViewController_SBPPTRunnerAdditions___recapSwipePresentLongLook__block_invoke;
  v7[3] = &__block_descriptor_48_e34_v16__0___RCPEventStreamComposer__8l;
  v7[4] = v4;
  v7[5] = v6;
  SBPPTSynthesizeEventsForEventActions(v7, 0);
}

- (id)_dismissControlOfPresentedLongLook
{
  v1 = [a1 _presentedLongLookViewController];
  v2 = [v1 _lookView];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v1 _lookView];
    uint64_t v4 = [v3 dismissControl];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_recapDismissLongLookViaPullDown
{
  v1 = [a1 _presentedLongLookViewController];
  v2 = [v1 _lookView];

  uint64_t v3 = [v2 window];
  [v2 bounds];
  UIRectGetCenter();
  objc_msgSend(v2, "convertPoint:toView:", 0);
  objc_msgSend(v3, "_convertPointToSceneReferenceSpace:");
  uint64_t v5 = v4;
  uint64_t v7 = v6;

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__NCNotificationViewController_SBPPTRunnerAdditions___recapDismissLongLookViaPullDown__block_invoke;
  v8[3] = &__block_descriptor_48_e34_v16__0___RCPEventStreamComposer__8l;
  v8[4] = v5;
  v8[5] = v7;
  SBPPTSynthesizeEventsForEventActions(v8, 0);
}

- (void)_recapDismissLongLookViaTapOutside
{
  v1 = [a1 view];
  v2 = [v1 window];
  [v1 bounds];
  double MinX = CGRectGetMinX(v9);
  [v1 bounds];
  objc_msgSend(v1, "convertPoint:toView:", 0, MinX, CGRectGetMaxY(v10));
  objc_msgSend(v2, "_convertPointToSceneReferenceSpace:");
  uint64_t v5 = v4;
  uint64_t v7 = v6;

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__NCNotificationViewController_SBPPTRunnerAdditions___recapDismissLongLookViaTapOutside__block_invoke;
  v8[3] = &__block_descriptor_48_e34_v16__0___RCPEventStreamComposer__8l;
  v8[4] = v5;
  v8[5] = v7;
  SBPPTSynthesizeEventsForEventActions(v8, 0);
}

@end