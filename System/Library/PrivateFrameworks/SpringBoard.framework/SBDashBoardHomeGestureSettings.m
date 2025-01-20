@interface SBDashBoardHomeGestureSettings
+ (id)settingsControllerModule;
- (void)setDefaultValues;
@end

@implementation SBDashBoardHomeGestureSettings

- (void)setDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardHomeGestureSettings;
  [(SBHomeGestureSettings *)&v5 setDefaultValues];
  [(SBHomeGestureSettings *)self setHomeGestureXOffsetFactor:1.0];
  v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  [(SBHomeGestureSettings *)self setHomeGestureCenterZoomDownCenterYOffsetFactor:dbl_1D8FD2020[(v4 & 0xFFFFFFFFFFFFFFFBLL) == 1]];
  [(SBHomeGestureSettings *)self setHomeGestureMinimumCardScale:0.55];
  [(SBHomeGestureSettings *)self setHomeGestureMinimumCardScaleRubberBandingRange:0.4];
}

+ (id)settingsControllerModule
{
  v28[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F941E0];
  v24 = NSStringFromSelector(sel_homeGestureXOffsetFactor);
  v23 = [v2 rowWithTitle:@"X Offset Factor" valueKeyPath:v24];
  v22 = [v23 minValue:0.2 maxValue:1.0];
  v28[0] = v22;
  v3 = (void *)MEMORY[0x1E4F941E0];
  uint64_t v4 = NSStringFromSelector(sel_homeGestureCenterZoomDownCenterYOffsetFactor);
  objc_super v5 = [v3 rowWithTitle:@"Center Y Offset Factor" valueKeyPath:v4];
  v6 = [v5 minValue:-0.5 maxValue:0.0];
  v28[1] = v6;
  v7 = (void *)MEMORY[0x1E4F941E0];
  v8 = NSStringFromSelector(sel_homeGestureMinimumCardScale);
  v9 = [v7 rowWithTitle:@"Minimum Card Scale" valueKeyPath:v8];
  v10 = [v9 minValue:0.4 maxValue:1.0];
  v28[2] = v10;
  v11 = (void *)MEMORY[0x1E4F94140];
  v12 = NSStringFromSelector(sel_homeGestureMinimumCardScaleRubberBandingRange);
  v13 = [v11 rowWithTitle:@"Minimum Card Scale RubberBanding Range" valueKeyPath:v12];
  v14 = [v13 between:0.0 and:1.0];
  v28[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];

  v16 = [MEMORY[0x1E4F94168] sectionWithRows:v15 title:@"Dashboard Gesture Zoom Down"];
  v17 = (void *)MEMORY[0x1E4F94168];
  v26.receiver = a1;
  v26.super_class = (Class)&OBJC_METACLASS___SBDashBoardHomeGestureSettings;
  v27[0] = v16;
  v18 = objc_msgSendSuper2(&v26, sel_settingsControllerModule);
  v27[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v20 = [v17 moduleWithTitle:0 contents:v19];

  return v20;
}

@end