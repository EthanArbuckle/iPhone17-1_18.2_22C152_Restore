@interface _UIHDRUsageCoordinator
+ (id)sharedInstance;
- (char)traitCollectionSuppressingHDR:(char *)a1;
- (id)_init;
- (id)animationForHDRHeadroomUsage:(void *)a3 layer:;
- (uint64_t)rangeForHeadroom:(uint64_t)a1;
- (void)applyConstrainedHDROverrideToView:(uint64_t)a1;
- (void)applyRangeForHeadroom:(double)a3 toMutableTraits:;
- (void)enableHDRSuppression:(void *)a3 inViewHierarchy:;
- (void)prepareSceneForLowPowerModeChange:(uint64_t)a1;
- (void)registerForAndApplyHDRAnimationToView:(uint64_t)a1;
- (void)registerForDefaultDynamicRangeChanges:(uint64_t)a1;
- (void)unregisterForDefaultDynamicRangeChanges:(uint64_t)a1;
@end

@implementation _UIHDRUsageCoordinator

+ (id)sharedInstance
{
  self;
  self;
  if (dyld_program_sdk_at_least() && qword_1EB260D08 != -1) {
    dispatch_once(&qword_1EB260D08, &__block_literal_global_270);
  }
  v0 = (void *)qword_1EB260D00;
  return v0;
}

- (void)registerForAndApplyHDRAnimationToView:(uint64_t)a1
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    v4 = self;
    v7[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    id v6 = (id)[v3 registerForTraitChanges:v5 withHandler:&__block_literal_global_10_5];
  }
}

- (void)applyRangeForHeadroom:(double)a3 toMutableTraits:
{
  if (a1)
  {
    id v5 = a2;
    uint64_t v6 = -[_UIHDRUsageCoordinator rangeForHeadroom:](a1, a3);
    self;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v5 setNSIntegerValue:v6 forTrait:v7];
  }
}

- (void)registerForDefaultDynamicRangeChanges:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    id v5 = objc_getAssociatedObject(v3, &_UIHDRUsageCoordinatorDefaultDynamicRangeRegistrationKey);
    if (!v5)
    {
      objc_initWeak(&location, v4);
      uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v7 = [MEMORY[0x1E4F28F08] mainQueue];
      uint64_t v8 = *MEMORY[0x1E4F287E8];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __64___UIHDRUsageCoordinator_registerForDefaultDynamicRangeChanges___block_invoke;
      v10[3] = &unk_1E52DA728;
      objc_copyWeak(&v11, &location);
      v9 = [v6 addObserverForName:v8 object:0 queue:v7 usingBlock:v10];

      objc_setAssociatedObject(v4, &_UIHDRUsageCoordinatorDefaultDynamicRangeRegistrationKey, v9, (void *)0x301);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

- (uint64_t)rangeForHeadroom:(uint64_t)a1
{
  uint64_t v2 = 0;
  if (a1 && a2 > 2.0)
  {
    id v3 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v2 = [v3 isLowPowerModeEnabled] ^ 1;
  }
  return v2;
}

- (char)traitCollectionSuppressingHDR:(char *)a1
{
  if (a1)
  {
    id v3 = a1;
    if (_shouldSuppressHDR(a2))
    {
      uint64_t v6 = (void *)*((void *)v3 + 2);
      id v5 = (void **)(v3 + 16);
      v4 = v6;
      if (!v6)
      {
        uint64_t v7 = +[UITraitCollection traitCollectionWithTraits:&__block_literal_global_15_4];
LABEL_7:
        v9 = *v5;
        void *v5 = (void *)v7;

        v4 = *v5;
      }
    }
    else
    {
      uint64_t v8 = (void *)*((void *)v3 + 1);
      id v5 = (void **)(v3 + 8);
      v4 = v8;
      if (!v8)
      {
        uint64_t v7 = +[UITraitCollection _traitCollectionWithHeadroomUsage:1];
        goto LABEL_7;
      }
    }
    a1 = v4;
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)applyConstrainedHDROverrideToView:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    id v7 = [v3 _screen];
    [v7 potentialEDRHeadroom];
    uint64_t v5 = -[_UIHDRUsageCoordinator rangeForHeadroom:](a1, v4);
    uint64_t v6 = -[UIView _internalTraitOverrides](v3);

    [v6 setImageDynamicRange:v5];
  }
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIHDRUsageCoordinator;
  return [(_UIHDRUsageCoordinator *)&v3 init];
}

- (void)enableHDRSuppression:(void *)a3 inViewHierarchy:
{
  id v5 = a3;
  if (a1)
  {
    id v9 = v5;
    int shouldSuppressHDR = _shouldSuppressHDR(a2);
    id v7 = -[UIView _internalTraitOverrides](v9);
    uint64_t v8 = self;
    if (shouldSuppressHDR) {
      [v7 setNSIntegerValue:0 forTrait:v8];
    }
    else {
      [v7 removeTrait:v8];
    }

    id v5 = v9;
  }
}

- (void)unregisterForDefaultDynamicRangeChanges:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && v3)
  {
    id object = v3;
    double v4 = objc_getAssociatedObject(v3, &_UIHDRUsageCoordinatorDefaultDynamicRangeRegistrationKey);
    if (v4)
    {
      id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 removeObserver:v4 name:*MEMORY[0x1E4F287E8] object:0];

      objc_setAssociatedObject(object, &_UIHDRUsageCoordinatorDefaultDynamicRangeRegistrationKey, 0, (void *)0x301);
    }

    id v3 = object;
  }
}

- (id)animationForHDRHeadroomUsage:(void *)a3 layer:
{
  id v5 = a3;
  if (a1)
  {
    uint64_t v6 = [MEMORY[0x1E4F28F80] processInfo];
    if ([v6 isLowPowerModeEnabled])
    {
    }
    else
    {
      int v7 = [v5 wantsExtendedDynamicRangeContent];

      if (v7)
      {
        double v8 = a2 ? 1.0 : 0.0;
        double v9 = _HDRInitialEDRStrength(v5);
        double v10 = _HDRAnimationDuration(v9, v8);
        if (v10 > 0.00833333333)
        {
          id v11 = _HDRSpringAnimation(v10, v9);
          goto LABEL_11;
        }
      }
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

- (void)prepareSceneForLowPowerModeChange:(uint64_t)a1
{
  if (a1)
  {
    id v6 = [a2 screen];
    id v3 = [v6 traitCollection];
    uint64_t v4 = [v3 imageDynamicRange];

    [v6 potentialEDRHeadroom];
    if (v4 != -[_UIHDRUsageCoordinator rangeForHeadroom:](a1, v5)) {
      [v6 _updateTraits];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableHDRTraitCollection, 0);
  objc_storeStrong((id *)&self->_enableHDRTraitCollection, 0);
}

@end