@interface _UIFluidParallaxTransitionSettings
+ (id)settingsControllerModule;
- (BOOL)roundedCorners;
- (UIViewSpringAnimationBehaviorSettings)interactiveSpring;
- (UIViewSpringAnimationBehaviorSettings)noninteractiveSpring;
- (double)rubberBandExtent;
- (void)setDefaultValues;
- (void)setRoundedCorners:(BOOL)a3;
- (void)setRubberBandExtent:(double)a3;
@end

@implementation _UIFluidParallaxTransitionSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFluidParallaxTransitionSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(_UIFluidParallaxTransitionSettings *)self setRoundedCorners:0];
  [(_UIFluidParallaxTransitionSettings *)self setRubberBandExtent:0.5];
  [(UIViewSpringAnimationBehaviorSettings *)self->_noninteractiveSpring setDefaultCriticallyDampedValues];
  [(UIViewSpringAnimationBehaviorSettings *)self->_noninteractiveSpring setDampingRatio:1.1];
  [(UIViewSpringAnimationBehaviorSettings *)self->_noninteractiveSpring setResponse:0.3];
  [(UIViewSpringAnimationBehaviorSettings *)self->_interactiveSpring setDefaultCriticallyDampedValues];
  [(UIViewSpringAnimationBehaviorSettings *)self->_interactiveSpring setDampingRatio:0.85];
  [(UIViewSpringAnimationBehaviorSettings *)self->_interactiveSpring setResponse:0.45];
  [(UIViewSpringAnimationBehaviorSettings *)self->_interactiveSpring setTrackingDampingRatio:0.85];
  [(UIViewSpringAnimationBehaviorSettings *)self->_interactiveSpring setTrackingResponse:0.08];
}

+ (id)settingsControllerModule
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  v18 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Rounded Corners" valueKeyPath:@"roundedCorners"];
  v20[0] = v18;
  v17 = [MEMORY[0x1E4F94148] rowWithTitle:@"Rubber Band Extent" valueKeyPath:@"rubberBandExtent"];
  v16 = [v17 between:0.0 and:1.0];
  v20[1] = v16;
  objc_super v3 = [MEMORY[0x1E4F94130] rowWithTitle:@"Noninteractive Spring" childSettingsKeyPath:@"noninteractiveSpring"];
  v20[2] = v3;
  v4 = [MEMORY[0x1E4F94130] rowWithTitle:@"Interactive Spring" childSettingsKeyPath:@"interactiveSpring"];
  v20[3] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  v6 = [v2 sectionWithRows:v5];
  v21[0] = v6;
  v7 = (void *)MEMORY[0x1E4F94160];
  v8 = (void *)MEMORY[0x1E4F940F8];
  v9 = [MEMORY[0x1E4F94170] action];
  v10 = [v8 rowWithTitle:@"Restore Defaults" action:v9];
  v19 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v12 = [v7 sectionWithRows:v11];
  v21[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v14 = [v2 moduleWithTitle:@"Parallax" contents:v13];

  return v14;
}

- (UIViewSpringAnimationBehaviorSettings)noninteractiveSpring
{
  return self->_noninteractiveSpring;
}

- (UIViewSpringAnimationBehaviorSettings)interactiveSpring
{
  return self->_interactiveSpring;
}

- (double)rubberBandExtent
{
  return self->_rubberBandExtent;
}

- (void)setRubberBandExtent:(double)a3
{
  self->_rubberBandExtent = a3;
}

- (BOOL)roundedCorners
{
  return self->_roundedCorners;
}

- (void)setRoundedCorners:(BOOL)a3
{
  self->_roundedCorners = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactiveSpring, 0);
  objc_storeStrong((id *)&self->_noninteractiveSpring, 0);
}

@end