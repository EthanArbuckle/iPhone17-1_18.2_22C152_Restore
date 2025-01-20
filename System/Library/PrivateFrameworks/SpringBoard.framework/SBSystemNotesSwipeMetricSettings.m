@interface SBSystemNotesSwipeMetricSettings
+ (BOOL)ignoresKey:(id)a3;
+ (id)settingsControllerModule;
- (double)cornerDistanceBeforeScalingForDismiss;
- (double)flickVelocityThreshold;
- (double)panDistanceBeforeScaling;
- (double)panDistancePer1xScaling;
- (double)panInitialThumbnailScale;
- (double)scaleThresholdBeforeFullSize;
- (void)setCornerDistanceBeforeScalingForDismiss:(double)a3;
- (void)setDefaultValues;
- (void)setFlickVelocityThreshold:(double)a3;
- (void)setPanDistanceBeforeScaling:(double)a3;
- (void)setPanDistancePer1xScaling:(double)a3;
- (void)setPanInitialThumbnailScale:(double)a3;
- (void)setScaleThresholdBeforeFullSize:(double)a3;
@end

@implementation SBSystemNotesSwipeMetricSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBSystemNotesSwipeMetricSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBSystemNotesSwipeMetricSettings *)self setPanDistanceBeforeScaling:50.0];
  [(SBSystemNotesSwipeMetricSettings *)self setPanInitialThumbnailScale:1.0];
  [(SBSystemNotesSwipeMetricSettings *)self setPanDistancePer1xScaling:200.0];
  [(SBSystemNotesSwipeMetricSettings *)self setScaleThresholdBeforeFullSize:0.6];
  [(SBSystemNotesSwipeMetricSettings *)self setFlickVelocityThreshold:500.0];
  [(SBSystemNotesSwipeMetricSettings *)self setCornerDistanceBeforeScalingForDismiss:270.0];
}

+ (id)settingsControllerModule
{
  v20[6] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Distance Before Scaling" valueKeyPath:@"panDistanceBeforeScaling"];
  v18 = [v2 minValue:0.0 maxValue:500.0];

  objc_super v3 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Initial Thumbnail Scale" valueKeyPath:@"panInitialThumbnailScale"];
  v4 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Pan Distance Per 1x Scaling" valueKeyPath:@"panDistancePer1xScaling"];
  v5 = [v4 minValue:0.0 maxValue:500.0];

  v6 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Scale Threshold Before Full Size" valueKeyPath:@"scaleThresholdBeforeFullSize"];
  v7 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Flick Velocity Threshold" valueKeyPath:@"flickVelocityThreshold"];
  v8 = [v7 minValue:0.0 maxValue:5000.0];

  v9 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Corner Distance Before Scaling for Dismiss" valueKeyPath:@"cornerDistanceBeforeScalingForDismiss"];
  v10 = [v9 minValue:-100.0 maxValue:500.0];

  v11 = (void *)MEMORY[0x1E4F94168];
  v20[0] = v18;
  v20[1] = v3;
  v20[2] = v5;
  v20[3] = v6;
  v20[4] = v8;
  v20[5] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:6];
  v13 = [v11 sectionWithRows:v12 title:@"Swipe In Animation Metrics"];

  v14 = (void *)MEMORY[0x1E4F94168];
  v19 = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v16 = [v14 moduleWithTitle:@"Swipe In Gesture Settings" contents:v15];

  return v16;
}

+ (BOOL)ignoresKey:(id)a3
{
  return [a3 isEqualToString:@"cornerSwipeGestureEnabled"];
}

- (double)panDistanceBeforeScaling
{
  return self->_panDistanceBeforeScaling;
}

- (void)setPanDistanceBeforeScaling:(double)a3
{
  self->_panDistanceBeforeScaling = a3;
}

- (double)panInitialThumbnailScale
{
  return self->_panInitialThumbnailScale;
}

- (void)setPanInitialThumbnailScale:(double)a3
{
  self->_panInitialThumbnailScale = a3;
}

- (double)panDistancePer1xScaling
{
  return self->_panDistancePer1xScaling;
}

- (void)setPanDistancePer1xScaling:(double)a3
{
  self->_panDistancePer1xScaling = a3;
}

- (double)scaleThresholdBeforeFullSize
{
  return self->_scaleThresholdBeforeFullSize;
}

- (void)setScaleThresholdBeforeFullSize:(double)a3
{
  self->_scaleThresholdBeforeFullSize = a3;
}

- (double)flickVelocityThreshold
{
  return self->_flickVelocityThreshold;
}

- (void)setFlickVelocityThreshold:(double)a3
{
  self->_flickVelocityThreshold = a3;
}

- (double)cornerDistanceBeforeScalingForDismiss
{
  return self->_cornerDistanceBeforeScalingForDismiss;
}

- (void)setCornerDistanceBeforeScalingForDismiss:(double)a3
{
  self->_cornerDistanceBeforeScalingForDismiss = a3;
}

@end