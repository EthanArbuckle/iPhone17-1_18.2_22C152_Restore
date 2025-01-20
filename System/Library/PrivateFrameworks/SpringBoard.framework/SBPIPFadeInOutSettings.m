@interface SBPIPFadeInOutSettings
+ (BOOL)ignoresKey:(id)a3;
+ (id)settingsControllerModule;
- ($1AB5FA073B851C12C2339EC22442E995)fadeInInitialValues;
- ($1AB5FA073B851C12C2339EC22442E995)fadeOutFinalValues;
- (SBFAnimationSettings)fadeInOutAnimationSettings;
- (double)fadeInInitialBlurRadius;
- (double)fadeInInitialOpacity;
- (double)fadeInInitialScale;
- (double)fadeOutFinalBlurRadius;
- (double)fadeOutFinalOpacity;
- (double)fadeOutFinalScale;
- (void)setDefaultValues;
- (void)setFadeInInitialBlurRadius:(double)a3;
- (void)setFadeInInitialOpacity:(double)a3;
- (void)setFadeInInitialScale:(double)a3;
- (void)setFadeInOutAnimationSettings:(id)a3;
- (void)setFadeOutFinalBlurRadius:(double)a3;
- (void)setFadeOutFinalOpacity:(double)a3;
- (void)setFadeOutFinalScale:(double)a3;
@end

@implementation SBPIPFadeInOutSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBPIPFadeInOutSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(SBFAnimationSettings *)self->_fadeInOutAnimationSettings setAnimationType:1];
  [(SBFAnimationSettings *)self->_fadeInOutAnimationSettings setCurve:196608];
  [(SBFAnimationSettings *)self->_fadeInOutAnimationSettings setDuration:0.8];
  [(SBFAnimationSettings *)self->_fadeInOutAnimationSettings setMass:2.0];
  [(SBFAnimationSettings *)self->_fadeInOutAnimationSettings setStiffness:300.0];
  [(SBFAnimationSettings *)self->_fadeInOutAnimationSettings setDamping:50.0];
  self->_fadeInInitialScale = 0.8;
  self->_fadeInInitialBlurRadius = 60.0;
  self->_fadeOutFinalScale = 0.8;
  self->_fadeOutFinalBlurRadius = 60.0;
}

- ($1AB5FA073B851C12C2339EC22442E995)fadeInInitialValues
{
  double fadeInInitialScale = self->_fadeInInitialScale;
  double fadeInInitialOpacity = self->_fadeInInitialOpacity;
  double fadeInInitialBlurRadius = self->_fadeInInitialBlurRadius;
  result.var2 = fadeInInitialBlurRadius;
  result.var1 = fadeInInitialOpacity;
  result.var0 = fadeInInitialScale;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)fadeOutFinalValues
{
  double fadeOutFinalScale = self->_fadeOutFinalScale;
  double fadeOutFinalOpacity = self->_fadeOutFinalOpacity;
  double fadeOutFinalBlurRadius = self->_fadeOutFinalBlurRadius;
  result.var2 = fadeOutFinalBlurRadius;
  result.var1 = fadeOutFinalOpacity;
  result.var0 = fadeOutFinalScale;
  return result;
}

+ (BOOL)ignoresKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"fadeInInitialValues"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"fadeOutFinalValues"];
  }

  return v4;
}

+ (id)settingsControllerModule
{
  v30[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94168];
  id v3 = [MEMORY[0x1E4FA5E80] _moduleWithSectionTitle:@"Fade-In/Out animation" delay:0 frameRate:0];
  char v4 = NSStringFromSelector(sel_fadeInOutAnimationSettings);
  v27 = [v2 submoduleWithModule:v3 childSettingsKeyPath:v4];

  v5 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Scale" valueKeyPath:@"fadeInInitialScale"];
  v26 = [v5 minValue:0.0 maxValue:1.0];

  v6 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Opacity" valueKeyPath:@"fadeInInitialOpacity"];
  v25 = [v6 minValue:0.0 maxValue:1.0];

  v7 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Blur Radius" valueKeyPath:@"fadeInInitialBlurRadius"];
  v8 = [v7 minValue:0.0 maxValue:90.0];

  v9 = (void *)MEMORY[0x1E4F94168];
  v30[0] = v25;
  v30[1] = v26;
  v30[2] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  v11 = [v9 sectionWithRows:v10 title:@"Fade-In Initial Values"];

  v12 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Scale" valueKeyPath:@"fadeOutFinalScale"];
  v13 = [v12 minValue:0.0 maxValue:1.0];

  v14 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Opacity" valueKeyPath:@"fadeOutFinalOpacity"];
  v15 = [v14 minValue:0.0 maxValue:1.0];

  v16 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Blur Radius" valueKeyPath:@"fadeOutFinalBlurRadius"];
  v17 = [v16 minValue:0.0 maxValue:90.0];

  v18 = (void *)MEMORY[0x1E4F94168];
  v29[0] = v15;
  v29[1] = v13;
  v29[2] = v17;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
  v20 = [v18 sectionWithRows:v19 title:@"Fade-Out Final Values"];

  v21 = (void *)MEMORY[0x1E4F94168];
  v28[0] = v11;
  v28[1] = v20;
  v28[2] = v27;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  v23 = [v21 moduleWithTitle:@"Fade-In/Out Settings" contents:v22];

  return v23;
}

- (SBFAnimationSettings)fadeInOutAnimationSettings
{
  return self->_fadeInOutAnimationSettings;
}

- (void)setFadeInOutAnimationSettings:(id)a3
{
}

- (double)fadeInInitialScale
{
  return self->_fadeInInitialScale;
}

- (void)setFadeInInitialScale:(double)a3
{
  self->_double fadeInInitialScale = a3;
}

- (double)fadeInInitialOpacity
{
  return self->_fadeInInitialOpacity;
}

- (void)setFadeInInitialOpacity:(double)a3
{
  self->_double fadeInInitialOpacity = a3;
}

- (double)fadeInInitialBlurRadius
{
  return self->_fadeInInitialBlurRadius;
}

- (void)setFadeInInitialBlurRadius:(double)a3
{
  self->_double fadeInInitialBlurRadius = a3;
}

- (double)fadeOutFinalScale
{
  return self->_fadeOutFinalScale;
}

- (void)setFadeOutFinalScale:(double)a3
{
  self->_double fadeOutFinalScale = a3;
}

- (double)fadeOutFinalOpacity
{
  return self->_fadeOutFinalOpacity;
}

- (void)setFadeOutFinalOpacity:(double)a3
{
  self->_double fadeOutFinalOpacity = a3;
}

- (double)fadeOutFinalBlurRadius
{
  return self->_fadeOutFinalBlurRadius;
}

- (void)setFadeOutFinalBlurRadius:(double)a3
{
  self->_double fadeOutFinalBlurRadius = a3;
}

- (void).cxx_destruct
{
}

@end