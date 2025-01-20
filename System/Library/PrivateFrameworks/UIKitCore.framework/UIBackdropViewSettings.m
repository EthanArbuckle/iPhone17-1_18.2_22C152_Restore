@interface UIBackdropViewSettings
@end

@implementation UIBackdropViewSettings

void __60___UIBackdropViewSettings_scheduleSettingsDidChangeIfNeeded__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[2] settingsDidChange:WeakRetained];
    [v2 clearRunLoopObserver];
    WeakRetained = v2;
  }
}

void __45___UIBackdropViewSettings_darkeningTintColor__block_invoke()
{
  v0 = [[UIColor alloc] initWithRed:0.168627451 green:0.231372549 blue:0.321568627 alpha:1.0];
  v1 = (void *)qword_1EB25D4C8;
  qword_1EB25D4C8 = (uint64_t)v0;
}

@end