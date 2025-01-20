@interface NTKNightModeTriggerSettings
- (NTKNightModeTriggerSettings)init;
- (double)_readThresholdLuxHighFromPrefs;
- (double)_readThresholdLuxLowFromPrefs;
- (double)thresholdLuxHigh;
- (double)thresholdLuxLow;
- (unint64_t)_readActivateSampleCountFromPrefs;
- (unint64_t)_readSampleSizeFromPrefs;
- (unint64_t)activateSampleCount;
- (unint64_t)sampleSize;
- (void)_registerForDarwinNotifications;
- (void)_unregisterForDarwinNotifications;
- (void)dealloc;
- (void)setActivateSampleCount:(unint64_t)a3;
- (void)setSampleSize:(unint64_t)a3;
- (void)setThresholdLuxHigh:(double)a3;
- (void)setThresholdLuxLow:(double)a3;
@end

@implementation NTKNightModeTriggerSettings

- (NTKNightModeTriggerSettings)init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKNightModeTriggerSettings;
  v2 = [(NTKNightModeTriggerSettings *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(NTKNightModeTriggerSettings *)v2 _readThresholdLuxLowFromPrefs];
    v3->_thresholdLuxLow = v4;
    [(NTKNightModeTriggerSettings *)v3 _readThresholdLuxHighFromPrefs];
    v3->_thresholdLuxHigh = v5;
    v3->_sampleSize = [(NTKNightModeTriggerSettings *)v3 _readSampleSizeFromPrefs];
    v3->_activateSampleCount = [(NTKNightModeTriggerSettings *)v3 _readActivateSampleCountFromPrefs];
    [(NTKNightModeTriggerSettings *)v3 _registerForDarwinNotifications];
  }
  return v3;
}

- (void)dealloc
{
  [(NTKNightModeTriggerSettings *)self _unregisterForDarwinNotifications];
  v3.receiver = self;
  v3.super_class = (Class)NTKNightModeTriggerSettings;
  [(NTKNightModeTriggerSettings *)&v3 dealloc];
}

- (void)_registerForDarwinNotifications
{
  objc_initWeak(&location, self);
  objc_super v3 = +[NTKDarwinNotificationCenter defaultCenter];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__NTKNightModeTriggerSettings__registerForDarwinNotifications__block_invoke;
  v8[3] = &unk_1E62C1A18;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  [v3 addObserver:self notificationName:@"com.apple.NanoTimeKit.NightModeThresholdsChanged" usingBlock:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__NTKNightModeTriggerSettings__registerForDarwinNotifications__block_invoke_2;
  v6[3] = &unk_1E62C1A18;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  [v3 addObserver:self notificationName:@"com.apple.NanoTimeKit.NightModeSampleSize" usingBlock:v6];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__NTKNightModeTriggerSettings__registerForDarwinNotifications__block_invoke_3;
  v4[3] = &unk_1E62C1A18;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  [v3 addObserver:self notificationName:@"com.apple.NanoTimeKit.NightModeActivateSampleCount" usingBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __62__NTKNightModeTriggerSettings__registerForDarwinNotifications__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) _readThresholdLuxLowFromPrefs];
    WeakRetained[1] = v2;
    [*(id *)(a1 + 32) _readThresholdLuxHighFromPrefs];
    WeakRetained[2] = v3;
    double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"com.apple.NanoTimeKit.NightModeThresholdsChanged" object:0];
  }
}

void __62__NTKNightModeTriggerSettings__registerForDarwinNotifications__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[3] = [*(id *)(a1 + 32) _readSampleSizeFromPrefs];
    uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"com.apple.NanoTimeKit.NightModeSampleSize" object:0];
  }
}

void __62__NTKNightModeTriggerSettings__registerForDarwinNotifications__block_invoke_3(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[4] = [*(id *)(a1 + 32) _readActivateSampleCountFromPrefs];
    uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"com.apple.NanoTimeKit.NightModeActivateSampleCount" object:0];
  }
}

- (void)_unregisterForDarwinNotifications
{
  id v3 = +[NTKDarwinNotificationCenter defaultCenter];
  [v3 removeObserver:self notificationName:@"com.apple.NanoTimeKit.NightModeThresholdsChanged"];
  [v3 removeObserver:self notificationName:@"com.apple.NanoTimeKit.NightModeSampleSize"];
  [v3 removeObserver:self notificationName:@"com.apple.NanoTimeKit.NightModeActivateSampleCount"];
}

- (double)_readThresholdLuxLowFromPrefs
{
  uint64_t v2 = (void *)CFPreferencesCopyAppValue(@"NTKNightModeLuxThresholdLow", @"com.apple.NanoTimeKit");
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 2.0;
  }

  return v5;
}

- (double)_readThresholdLuxHighFromPrefs
{
  uint64_t v2 = (void *)CFPreferencesCopyAppValue(@"NTKNightModeLuxThresholdHigh", @"com.apple.NanoTimeKit");
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 7.0;
  }

  return v5;
}

- (unint64_t)_readSampleSizeFromPrefs
{
  uint64_t v2 = (void *)CFPreferencesCopyAppValue(@"NTKNightModeSampleSize", @"com.apple.NanoTimeKit");
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    unint64_t v5 = (unint64_t)v4;
  }
  else
  {
    unint64_t v5 = 20;
  }

  return v5;
}

- (unint64_t)_readActivateSampleCountFromPrefs
{
  uint64_t v2 = (void *)CFPreferencesCopyAppValue(@"NTKNightModeActivateSampleCount", @"com.apple.NanoTimeKit");
  id v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    unint64_t v5 = (unint64_t)v4;
  }
  else
  {
    unint64_t v5 = 10;
  }

  return v5;
}

- (double)thresholdLuxLow
{
  return self->_thresholdLuxLow;
}

- (void)setThresholdLuxLow:(double)a3
{
  self->_thresholdLuxLow = a3;
}

- (double)thresholdLuxHigh
{
  return self->_thresholdLuxHigh;
}

- (void)setThresholdLuxHigh:(double)a3
{
  self->_thresholdLuxHigh = a3;
}

- (unint64_t)sampleSize
{
  return self->_sampleSize;
}

- (void)setSampleSize:(unint64_t)a3
{
  self->_sampleSize = a3;
}

- (unint64_t)activateSampleCount
{
  return self->_activateSampleCount;
}

- (void)setActivateSampleCount:(unint64_t)a3
{
  self->_activateSampleCount = a3;
}

@end