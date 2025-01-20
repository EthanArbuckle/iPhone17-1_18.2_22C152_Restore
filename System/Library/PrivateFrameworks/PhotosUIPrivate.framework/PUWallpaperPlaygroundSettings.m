@interface PUWallpaperPlaygroundSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
- (BOOL)applyLowAPLFilter;
- (double)lowAPLFilterAmount;
- (double)lowLuminanceAlphaAnimationDuration;
- (double)lowLuminanceTransformAnimationDuration;
- (double)shuffleSleepFadeInAnimationDuration;
- (double)shuffleSleepFadeOutAnimationDuration;
- (double)shuffleSleepTransformOutAnimationDuration;
- (id)parentSettings;
- (void)setApplyLowAPLFilter:(BOOL)a3;
- (void)setDefaultValues;
- (void)setLowAPLFilterAmount:(double)a3;
- (void)setLowLuminanceAlphaAnimationDuration:(double)a3;
- (void)setLowLuminanceTransformAnimationDuration:(double)a3;
- (void)setShuffleSleepFadeInAnimationDuration:(double)a3;
- (void)setShuffleSleepFadeOutAnimationDuration:(double)a3;
- (void)setShuffleSleepTransformOutAnimationDuration:(double)a3;
@end

@implementation PUWallpaperPlaygroundSettings

- (void)setShuffleSleepFadeInAnimationDuration:(double)a3
{
  self->_shuffleSleepFadeInAnimationDuration = a3;
}

- (double)shuffleSleepFadeInAnimationDuration
{
  return self->_shuffleSleepFadeInAnimationDuration;
}

- (void)setShuffleSleepFadeOutAnimationDuration:(double)a3
{
  self->_shuffleSleepFadeOutAnimationDuration = a3;
}

- (double)shuffleSleepFadeOutAnimationDuration
{
  return self->_shuffleSleepFadeOutAnimationDuration;
}

- (void)setShuffleSleepTransformOutAnimationDuration:(double)a3
{
  self->_shuffleSleepTransformOutAnimationDuration = a3;
}

- (double)shuffleSleepTransformOutAnimationDuration
{
  return self->_shuffleSleepTransformOutAnimationDuration;
}

- (void)setLowLuminanceAlphaAnimationDuration:(double)a3
{
  self->_lowLuminanceAlphaAnimationDuration = a3;
}

- (double)lowLuminanceAlphaAnimationDuration
{
  return self->_lowLuminanceAlphaAnimationDuration;
}

- (void)setLowLuminanceTransformAnimationDuration:(double)a3
{
  self->_lowLuminanceTransformAnimationDuration = a3;
}

- (double)lowLuminanceTransformAnimationDuration
{
  return self->_lowLuminanceTransformAnimationDuration;
}

- (void)setLowAPLFilterAmount:(double)a3
{
  self->_lowAPLFilterAmount = a3;
}

- (double)lowAPLFilterAmount
{
  return self->_lowAPLFilterAmount;
}

- (void)setApplyLowAPLFilter:(BOOL)a3
{
  self->_applyLowAPLFilter = a3;
}

- (BOOL)applyLowAPLFilter
{
  return self->_applyLowAPLFilter;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PUWallpaperPlaygroundSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PUWallpaperPlaygroundSettings *)self setApplyLowAPLFilter:1];
  [(PUWallpaperPlaygroundSettings *)self setLowAPLFilterAmount:0.03];
  [(PUWallpaperPlaygroundSettings *)self setLowLuminanceTransformAnimationDuration:0.5];
  [(PUWallpaperPlaygroundSettings *)self setLowLuminanceAlphaAnimationDuration:0.5];
  [(PUWallpaperPlaygroundSettings *)self setShuffleSleepTransformOutAnimationDuration:0.5];
  [(PUWallpaperPlaygroundSettings *)self setShuffleSleepFadeOutAnimationDuration:0.5];
  [(PUWallpaperPlaygroundSettings *)self setShuffleSleepFadeInAnimationDuration:1.995];
}

- (id)parentSettings
{
  return 0;
}

+ (id)settingsControllerModule
{
  v44[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  objc_super v3 = (void *)MEMORY[0x1E4F941F0];
  v41 = NSStringFromSelector(sel_applyLowAPLFilter);
  v40 = [v3 rowWithTitle:@"Apply Low APL Filter" valueKeyPath:v41];
  v43[0] = v40;
  v4 = (void *)MEMORY[0x1E4F941D8];
  v39 = NSStringFromSelector(sel_lowAPLFilterAmount);
  v38 = [v4 rowWithTitle:@"Filter Amount" valueKeyPath:v39];
  v37 = [v38 minValue:0.001 maxValue:0.05];
  v43[1] = v37;
  v5 = (void *)MEMORY[0x1E4F941D8];
  v36 = NSStringFromSelector(sel_lowLuminanceTransformAnimationDuration);
  v35 = [v5 rowWithTitle:@"Scale Animation Duration" valueKeyPath:v36];
  v34 = [v35 minValue:0.0 maxValue:2.0];
  v43[2] = v34;
  v6 = (void *)MEMORY[0x1E4F941D8];
  v33 = NSStringFromSelector(sel_lowLuminanceAlphaAnimationDuration);
  v32 = [v6 rowWithTitle:@"Alpha Animation Duration" valueKeyPath:v33];
  v31 = [v32 minValue:0.0 maxValue:2.0];
  v43[3] = v31;
  v7 = (void *)MEMORY[0x1E4F941D8];
  v30 = NSStringFromSelector(sel_shuffleSleepTransformOutAnimationDuration);
  v29 = [v7 rowWithTitle:@"Shuffle Sleep Transform Out" valueKeyPath:v30];
  v28 = [v29 minValue:0.0 maxValue:2.0];
  v43[4] = v28;
  v8 = (void *)MEMORY[0x1E4F941D8];
  v27 = NSStringFromSelector(sel_shuffleSleepFadeOutAnimationDuration);
  v26 = [v8 rowWithTitle:@"Shuffle Sleep Fade Out" valueKeyPath:v27];
  v25 = [v26 minValue:0.0 maxValue:2.0];
  v43[5] = v25;
  v9 = (void *)MEMORY[0x1E4F941D8];
  v24 = NSStringFromSelector(sel_shuffleSleepFadeInAnimationDuration);
  v23 = [v9 rowWithTitle:@"Shuffle Sleep Fade In" valueKeyPath:v24];
  v10 = [v23 minValue:0.0 maxValue:2.0];
  v43[6] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:7];
  v12 = [v2 sectionWithRows:v11 title:@"Low Luminance"];
  v44[0] = v12;
  v13 = (void *)MEMORY[0x1E4F94160];
  v14 = (void *)MEMORY[0x1E4F940F8];
  v15 = [MEMORY[0x1E4F94190] actionWithHandler:&__block_literal_global_385];
  v16 = [v14 rowWithTitle:@"Trigger Shuffle" action:v15];
  v42 = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  v18 = [v13 sectionWithRows:v17];
  v44[1] = v18;
  v19 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v44[2] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
  v21 = [v2 moduleWithTitle:@"Settings" contents:v20];

  return v21;
}

uint64_t __57__PUWallpaperPlaygroundSettings_settingsControllerModule__block_invoke()
{
  v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"PUWallpaperShuffleNotificationName" object:0];

  return 1;
}

+ (id)sharedInstance
{
  os_unfair_lock_lock(MEMORY[0x1E4F91010]);
  if (!sharedInstance_sharedInstance_15028)
  {
    uint64_t v3 = [a1 createSharedInstance];
    v4 = (void *)sharedInstance_sharedInstance_15028;
    sharedInstance_sharedInstance_15028 = v3;
  }
  os_unfair_lock_unlock(MEMORY[0x1E4F91010]);
  v5 = (void *)sharedInstance_sharedInstance_15028;
  return v5;
}

@end