@interface UIHDRUsageCoordinator
@end

@implementation UIHDRUsageCoordinator

void __64___UIHDRUsageCoordinator_registerForAndApplyHDRAnimationToView___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  +[_UIHDRUsageCoordinator sharedInstance]();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v2;
  if (v12)
  {
    v4 = [v3 layer];
    if ([v4 wantsExtendedDynamicRangeContent])
    {
      v5 = [v3 traitCollection];
      if ([v5 _headroomUsage]) {
        double v6 = 1.0;
      }
      else {
        double v6 = 0.0;
      }

      double v7 = _HDRInitialEDRStrength(v4);
      v8 = [MEMORY[0x1E4F28F80] processInfo];
      int v9 = [v8 isLowPowerModeEnabled];

      if (v9)
      {
        [v4 setContentsEDRStrength:v6];
LABEL_10:
        [v4 removeAnimationForKey:@"contentsEDRStrength"];
        goto LABEL_11;
      }
      double v10 = _HDRAnimationDuration(v7, v6);
      [v4 setContentsEDRStrength:v6];
      if (v10 <= 0.00833333333) {
        goto LABEL_10;
      }
      v11 = _HDRSpringAnimation(v10, v7);
      [v4 addAnimation:v11 forKey:@"contentsEDRStrength"];
    }
LABEL_11:
  }
}

void __56___UIHDRUsageCoordinator_traitCollectionSuppressingHDR___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = self;
  [v2 setCGFloatValue:v3 forTrait:1.0];

  self;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setNSIntegerValue:0 forTrait:v4];
}

void __40___UIHDRUsageCoordinator_sharedInstance__block_invoke()
{
  id v0 = [[_UIHDRUsageCoordinator alloc] _init];
  v1 = (void *)qword_1EB260D00;
  qword_1EB260D00 = (uint64_t)v0;
}

void __64___UIHDRUsageCoordinator_registerForDefaultDynamicRangeChanges___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = +[_UIHDRUsageCoordinator sharedInstance]();
    -[_UIHDRUsageCoordinator applyConstrainedHDROverrideToView:]((uint64_t)v1, WeakRetained);
  }
}

@end