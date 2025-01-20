@interface SBReachabilitySettings
+ (id)settingsControllerModule;
- (BOOL)allowOnAllDevices;
- (SBFCAColorMatrixSettings)jindoTintColorMatrixSettings;
- (SBFFluidBehaviorSettings)animationSettings;
- (double)homeGestureSwipeDownHeight;
- (double)homeGestureSwipeDownHysteresis;
- (double)jindoInertDisableOffset;
- (double)reachabilityDefaultKeepAlive;
- (double)reachabilityInteractiveKeepAlive;
- (double)systemWideSwipeDownHeight;
- (double)yOffset;
- (double)yOffsetFactor;
- (void)setAllowOnAllDevices:(BOOL)a3;
- (void)setAnimationSettings:(id)a3;
- (void)setDefaultValues;
- (void)setHomeGestureSwipeDownHeight:(double)a3;
- (void)setHomeGestureSwipeDownHysteresis:(double)a3;
- (void)setJindoInertDisableOffset:(double)a3;
- (void)setJindoTintColorMatrixSettings:(id)a3;
- (void)setReachabilityDefaultKeepAlive:(double)a3;
- (void)setReachabilityInteractiveKeepAlive:(double)a3;
- (void)setSystemWideSwipeDownHeight:(double)a3;
- (void)setYOffsetFactor:(double)a3;
@end

@implementation SBReachabilitySettings

- (double)systemWideSwipeDownHeight
{
  return self->_systemWideSwipeDownHeight;
}

- (void)setDefaultValues
{
  [(SBReachabilitySettings *)self setAllowOnAllDevices:0];
  [(SBReachabilitySettings *)self setReachabilityDefaultKeepAlive:8.0];
  [(SBReachabilitySettings *)self setReachabilityInteractiveKeepAlive:1.5];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
      || SBFEffectiveHomeButtonType() != 2)
    {
      goto LABEL_10;
    }
LABEL_9:
    double v6 = 0.408866995;
    goto LABEL_41;
  }
  v5 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v5 userInterfaceIdiom])
  {

    goto LABEL_10;
  }
  v2 = (void *)SBFEffectiveHomeButtonType();

  if (v2 == (void *)2) {
    goto LABEL_9;
  }
LABEL_10:
  int v7 = __sb__runningInSpringBoard();
  char v8 = v7;
  if (v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_25;
    }
LABEL_16:
    int v9 = __sb__runningInSpringBoard();
    char v10 = v9;
    if (v9)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v3 = [MEMORY[0x1E4F42D90] mainScreen];
      [v3 _referenceBounds];
    }
    BSSizeRoundForScale();
    double v12 = v11;
    double v13 = *(double *)(MEMORY[0x1E4FA6E50] + 56);
    if ((v10 & 1) == 0) {

    }
    if ((v8 & 1) == 0) {
    if (v12 >= v13)
    }
    {
      double v6 = 0.486413043;
      goto LABEL_41;
    }
    goto LABEL_25;
  }
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  if (![v2 userInterfaceIdiom]) {
    goto LABEL_16;
  }

LABEL_25:
  int v14 = __sb__runningInSpringBoard();
  char v15 = v14;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_40;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom])
    {

LABEL_40:
      double v6 = 0.3;
      goto LABEL_41;
    }
  }
  int v16 = __sb__runningInSpringBoard();
  char v17 = v16;
  if (v16)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v19 = v18;
  double v20 = *(double *)(MEMORY[0x1E4FA6E50] + 40);
  if ((v17 & 1) == 0) {

  }
  if ((v15 & 1) == 0) {
  if (v19 < v20)
  }
    goto LABEL_40;
  double v6 = 0.357571214;
LABEL_41:
  [(SBReachabilitySettings *)self setYOffsetFactor:v6];
  [(SBReachabilitySettings *)self setHomeGestureSwipeDownHysteresis:10.0];
  [(SBReachabilitySettings *)self setHomeGestureSwipeDownHeight:78.0];
  [(SBReachabilitySettings *)self setSystemWideSwipeDownHeight:200.0];
  [(SBFFluidBehaviorSettings *)self->_animationSettings setDefaultValues];
  [(SBFFluidBehaviorSettings *)self->_animationSettings setDampingRatio:1.02];
  [(SBFFluidBehaviorSettings *)self->_animationSettings setResponse:0.4];
  [(SBFFluidBehaviorSettings *)self->_animationSettings setTrackingResponse:0.1];
  animationSettings = self->_animationSettings;
  CAFrameRateRange v33 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  -[SBFFluidBehaviorSettings setFrameRateRange:highFrameRateReason:](animationSettings, "setFrameRateRange:highFrameRateReason:", 1114136, *(double *)&v33.minimum, *(double *)&v33.maximum, *(double *)&v33.preferred);
  v22 = (void *)[objc_alloc(MEMORY[0x1E4FA5EC8]) initWithDefaultValues];
  [(SBReachabilitySettings *)self setJindoTintColorMatrixSettings:v22];

  v23 = [(SBReachabilitySettings *)self jindoTintColorMatrixSettings];
  v24[0] = 0;
  v24[1] = 0;
  int v25 = 1065353216;
  uint64_t v27 = 0;
  uint64_t v26 = 0;
  int v28 = 1065353216;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  long long v31 = xmmword_1D8FD2BD0;
  uint64_t v32 = 1034147594;
  [v23 setColorMatrix:v24];

  [(SBReachabilitySettings *)self setJindoInertDisableOffset:0.12];
}

+ (id)settingsControllerModule
{
  v65[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94100];
  v3 = [MEMORY[0x1E4F94178] actionWithSettingsKeyPath:0];
  v57 = [v2 rowWithTitle:@"Restore Defaults" action:v3];

  v4 = (void *)MEMORY[0x1E4F94168];
  v65[0] = v57;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
  v54 = [v4 sectionWithRows:v5];

  v56 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Allow on all devices" valueKeyPath:@"allowOnAllDevices"];
  double v6 = (void *)MEMORY[0x1E4F94168];
  v64 = v56;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
  v52 = [v6 sectionWithRows:v7 title:@"General Settings (Must Kill SpringBoard)"];

  char v8 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Default" valueKeyPath:@"reachabilityDefaultKeepAlive"];
  v55 = [v8 minValue:1.0 maxValue:15.0];

  int v9 = [MEMORY[0x1E4F941E0] rowWithTitle:@"After Touch" valueKeyPath:@"reachabilityInteractiveKeepAlive"];
  v53 = [v9 minValue:1.0 maxValue:15.0];

  char v10 = (void *)MEMORY[0x1E4F94168];
  v63[0] = v55;
  v63[1] = v53;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
  v49 = [v10 sectionWithRows:v11 title:@"Reachability Keep Alive"];

  double v12 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Offset Factor" valueKeyPath:@"yOffsetFactor"];
  v51 = [v12 minValue:0.0 maxValue:1.0];

  double v13 = [MEMORY[0x1E4F94140] rowWithTitle:@"Offset Factor" valueKeyPath:@"yOffsetFactor"];
  v50 = [v13 between:0.0 and:1.0];

  int v14 = (void *)MEMORY[0x1E4F94168];
  v62[0] = v51;
  v62[1] = v50;
  char v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
  v48 = [v14 sectionWithRows:v15 title:@"Positioning"];

  int v16 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Home Gesture Swipe Down Hysteresis" valueKeyPath:@"homeGestureSwipeDownHysteresis"];
  v47 = [v16 minValue:0.0 maxValue:20.0];

  char v17 = [MEMORY[0x1E4F94140] rowWithTitle:@"Home Gesture Swipe Down Hysteresis" valueKeyPath:@"homeGestureSwipeDownHysteresis"];
  v46 = [v17 between:0.0 and:20.0];

  double v18 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Home Gesture Swipe Down Height" valueKeyPath:@"homeGestureSwipeDownHeight"];
  v45 = [v18 minValue:0.0 maxValue:200.0];

  double v19 = [MEMORY[0x1E4F94140] rowWithTitle:@"Home Gesture Swipe Down Height" valueKeyPath:@"homeGestureSwipeDownHeight"];
  v44 = [v19 between:0.0 and:200.0];

  double v20 = [MEMORY[0x1E4F941E0] rowWithTitle:@"System Wide Swipe Down Height" valueKeyPath:@"systemWideSwipeDownHeight"];
  v43 = [v20 minValue:0.0 maxValue:1000.0];

  v21 = [MEMORY[0x1E4F94140] rowWithTitle:@"System Wide Swipe Down Height" valueKeyPath:@"systemWideSwipeDownHeight"];
  v42 = [v21 between:0.0 and:1000.0];

  v22 = (void *)MEMORY[0x1E4F94168];
  v61[0] = v47;
  v61[1] = v46;
  v61[2] = v45;
  v61[3] = v44;
  v61[4] = v43;
  v61[5] = v42;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:6];
  v41 = [v22 sectionWithRows:v23 title:@"Gesture"];

  v24 = (void *)MEMORY[0x1E4F94168];
  int v25 = [MEMORY[0x1E4F94138] rowWithTitle:@"Color matrix over content" childSettingsKeyPath:@"jindoTintColorMatrixSettings"];
  v60[0] = v25;
  uint64_t v26 = [MEMORY[0x1E4F94140] rowWithTitle:@"Inert disable animation offset" valueKeyPath:@"jindoInertDisableOffset"];
  uint64_t v27 = [v26 between:0.0 and:2.0];
  int v28 = [v27 precision:3];
  v60[1] = v28;
  uint64_t v29 = [MEMORY[0x1E4F941E0] rowWithTitle:@"Inert disable animation offset" valueKeyPath:@"jindoInertDisableOffset"];
  uint64_t v30 = [v29 minValue:0.0 maxValue:2.0];
  v60[2] = v30;
  long long v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:3];
  uint64_t v32 = [v24 sectionWithRows:v31 title:@"Jindo"];

  CAFrameRateRange v33 = (void *)MEMORY[0x1E4F94168];
  v34 = [MEMORY[0x1E4F94138] rowWithTitle:@"Animation Settings" childSettingsKeyPath:@"animationSettings"];
  v59 = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
  v36 = [v33 sectionWithRows:v35 title:@"Miscellaneous"];

  v37 = (void *)MEMORY[0x1E4F94168];
  v58[0] = v54;
  v58[1] = v52;
  v58[2] = v49;
  v58[3] = v48;
  v58[4] = v41;
  v58[5] = v32;
  v58[6] = v36;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:7];
  v39 = [v37 moduleWithTitle:@"Reachability" contents:v38];

  return v39;
}

- (double)yOffset
{
  int v4 = __sb__runningInSpringBoard();
  char v5 = v4;
  if (v4)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [v2 _referenceBounds];
  }
  [(SBReachabilitySettings *)self yOffsetFactor];
  SBFloatRoundForMainScreenScale();
  double v7 = v6;
  if ((v5 & 1) == 0) {

  }
  return v7;
}

- (BOOL)allowOnAllDevices
{
  return self->_allowOnAllDevices;
}

- (void)setAllowOnAllDevices:(BOOL)a3
{
  self->_allowOnAllDevices = a3;
}

- (double)reachabilityDefaultKeepAlive
{
  return self->_reachabilityDefaultKeepAlive;
}

- (void)setReachabilityDefaultKeepAlive:(double)a3
{
  self->_reachabilityDefaultKeepAlive = a3;
}

- (double)reachabilityInteractiveKeepAlive
{
  return self->_reachabilityInteractiveKeepAlive;
}

- (void)setReachabilityInteractiveKeepAlive:(double)a3
{
  self->_reachabilityInteractiveKeepAlive = a3;
}

- (double)yOffsetFactor
{
  return self->_yOffsetFactor;
}

- (void)setYOffsetFactor:(double)a3
{
  self->_yOffsetFactor = a3;
}

- (double)homeGestureSwipeDownHysteresis
{
  return self->_homeGestureSwipeDownHysteresis;
}

- (void)setHomeGestureSwipeDownHysteresis:(double)a3
{
  self->_homeGestureSwipeDownHysteresis = a3;
}

- (double)homeGestureSwipeDownHeight
{
  return self->_homeGestureSwipeDownHeight;
}

- (void)setHomeGestureSwipeDownHeight:(double)a3
{
  self->_homeGestureSwipeDownHeight = a3;
}

- (void)setSystemWideSwipeDownHeight:(double)a3
{
  self->_systemWideSwipeDownHeight = a3;
}

- (SBFFluidBehaviorSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
}

- (SBFCAColorMatrixSettings)jindoTintColorMatrixSettings
{
  return self->_jindoTintColorMatrixSettings;
}

- (void)setJindoTintColorMatrixSettings:(id)a3
{
}

- (double)jindoInertDisableOffset
{
  return self->_jindoInertDisableOffset;
}

- (void)setJindoInertDisableOffset:(double)a3
{
  self->_jindoInertDisableOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jindoTintColorMatrixSettings, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

@end