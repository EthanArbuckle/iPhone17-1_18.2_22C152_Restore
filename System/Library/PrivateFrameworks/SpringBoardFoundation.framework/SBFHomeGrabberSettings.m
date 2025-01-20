@interface SBFHomeGrabberSettings
+ (id)settingsControllerModule;
- (BOOL)constrainHitTestRectToSafeAreaInset;
- (BOOL)isEnabled;
- (BOOL)isSingleTapGatingEnabled;
- (BOOL)removeViewOnHide;
- (BOOL)resetAutoHideTimeOnRotation;
- (BOOL)visualizeHitTestRect;
- (SBFAnimationSettings)forcedProminentToThinAnimationSettings;
- (SBFAnimationSettings)hideAnimationSettings;
- (SBFAnimationSettings)hideForHomeGestureOwnershipAnimationSettings;
- (SBFAnimationSettings)initialLumaResponseAnimationSettings;
- (SBFAnimationSettings)lumaResponseAnimationSettings;
- (SBFAnimationSettings)prominentToThinAnimationSettings;
- (SBFAnimationSettings)rotationFadeInAnimationSettings;
- (SBFAnimationSettings)rotationFadeOutAnimationSettings;
- (SBFAnimationSettings)thinToProminentAnimationSettings;
- (SBFAnimationSettings)unhideAnimationSettings;
- (SBFAnimationSettings)unhideForHomeGestureOwnershipAnimationSettings;
- (SBFFluidBehaviorSettings)bounceAnimationSettings;
- (SBFFluidBehaviorSettings)edgeProtectAnimationSettings;
- (UIEdgeInsets)coverSheetHomeAffordanceCursorEdgeInsets;
- (UIEdgeInsets)coverSheetSuppressAnimationForPointerInsets;
- (double)autoHideTime;
- (double)autoHideTimeOnAppRequest;
- (double)bounceReverseAnimationDelay;
- (double)bounceTranslation;
- (double)coverSheetHomeAffordanceCursorBottomEdgeInset;
- (double)coverSheetHomeAffordanceCursorLeftEdgeInset;
- (double)coverSheetHomeAffordanceCursorRightEdgeInset;
- (double)coverSheetHomeAffordanceCursorTopEdgeInset;
- (double)coverSheetSuppressAnimationForPointerBottomEdgeInset;
- (double)coverSheetSuppressAnimationForPointerLeftEdgeInset;
- (double)coverSheetSuppressAnimationForPointerRightEdgeInset;
- (double)coverSheetSuppressAnimationForPointerTopEdgeInset;
- (double)delayForUnhideOnAppRequest;
- (double)delayForUnhideOnTouch;
- (double)hitTestOutsetDoubleTap;
- (double)hitTestOutsetSides;
- (double)hitTestOutsetTop;
- (int64_t)autoHideOverride;
- (int64_t)edgeProtectOverride;
- (int64_t)initializationStyle;
- (void)setAutoHideOverride:(int64_t)a3;
- (void)setAutoHideTime:(double)a3;
- (void)setAutoHideTimeOnAppRequest:(double)a3;
- (void)setBounceAnimationSettings:(id)a3;
- (void)setBounceReverseAnimationDelay:(double)a3;
- (void)setBounceTranslation:(double)a3;
- (void)setConstrainHitTestRectToSafeAreaInset:(BOOL)a3;
- (void)setCoverSheetHomeAffordanceCursorBottomEdgeInset:(double)a3;
- (void)setCoverSheetHomeAffordanceCursorLeftEdgeInset:(double)a3;
- (void)setCoverSheetHomeAffordanceCursorRightEdgeInset:(double)a3;
- (void)setCoverSheetHomeAffordanceCursorTopEdgeInset:(double)a3;
- (void)setCoverSheetSuppressAnimationForPointerBottomEdgeInset:(double)a3;
- (void)setCoverSheetSuppressAnimationForPointerLeftEdgeInset:(double)a3;
- (void)setCoverSheetSuppressAnimationForPointerRightEdgeInset:(double)a3;
- (void)setCoverSheetSuppressAnimationForPointerTopEdgeInset:(double)a3;
- (void)setDefaultValues;
- (void)setDelayForUnhideOnAppRequest:(double)a3;
- (void)setDelayForUnhideOnTouch:(double)a3;
- (void)setEdgeProtectAnimationSettings:(id)a3;
- (void)setEdgeProtectOverride:(int64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setForcedProminentToThinAnimationSettings:(id)a3;
- (void)setHideAnimationSettings:(id)a3;
- (void)setHideForHomeGestureOwnershipAnimationSettings:(id)a3;
- (void)setHitTestOutsetDoubleTap:(double)a3;
- (void)setHitTestOutsetSides:(double)a3;
- (void)setHitTestOutsetTop:(double)a3;
- (void)setInitialLumaResponseAnimationSettings:(id)a3;
- (void)setInitializationStyle:(int64_t)a3;
- (void)setLumaResponseAnimationSettings:(id)a3;
- (void)setProminentToThinAnimationSettings:(id)a3;
- (void)setRemoveViewOnHide:(BOOL)a3;
- (void)setResetAutoHideTimeOnRotation:(BOOL)a3;
- (void)setRotationFadeInAnimationSettings:(id)a3;
- (void)setRotationFadeOutAnimationSettings:(id)a3;
- (void)setSingleTapGatingEnabled:(BOOL)a3;
- (void)setThinToProminentAnimationSettings:(id)a3;
- (void)setUnhideAnimationSettings:(id)a3;
- (void)setUnhideForHomeGestureOwnershipAnimationSettings:(id)a3;
- (void)setVisualizeHitTestRect:(BOOL)a3;
@end

@implementation SBFHomeGrabberSettings

- (double)hitTestOutsetTop
{
  return self->_hitTestOutsetTop;
}

- (double)hitTestOutsetSides
{
  return self->_hitTestOutsetSides;
}

- (BOOL)constrainHitTestRectToSafeAreaInset
{
  return self->_constrainHitTestRectToSafeAreaInset;
}

- (int64_t)autoHideOverride
{
  return self->_autoHideOverride;
}

- (int64_t)edgeProtectOverride
{
  return self->_edgeProtectOverride;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (double)delayForUnhideOnAppRequest
{
  return self->_delayForUnhideOnAppRequest;
}

- (int64_t)initializationStyle
{
  return self->_initializationStyle;
}

- (double)autoHideTimeOnAppRequest
{
  return self->_autoHideTimeOnAppRequest;
}

- (SBFAnimationSettings)lumaResponseAnimationSettings
{
  return self->_lumaResponseAnimationSettings;
}

- (BOOL)visualizeHitTestRect
{
  return self->_visualizeHitTestRect;
}

- (SBFAnimationSettings)unhideAnimationSettings
{
  return self->_unhideAnimationSettings;
}

- (BOOL)removeViewOnHide
{
  return self->_removeViewOnHide;
}

- (SBFAnimationSettings)initialLumaResponseAnimationSettings
{
  return self->_initialLumaResponseAnimationSettings;
}

- (double)autoHideTime
{
  return self->_autoHideTime;
}

- (SBFAnimationSettings)unhideForHomeGestureOwnershipAnimationSettings
{
  return self->_unhideForHomeGestureOwnershipAnimationSettings;
}

- (void)setDefaultValues
{
  v27.receiver = self;
  v27.super_class = (Class)SBFHomeGrabberSettings;
  [(PTSettings *)&v27 setDefaultValues];
  if (SBFEffectiveHomeButtonType() == 2) {
    [(SBFHomeGrabberSettings *)self setEnabled:1];
  }
  [(SBFHomeGrabberSettings *)self setInitializationStyle:0];
  [(SBFHomeGrabberSettings *)self setRemoveViewOnHide:1];
  [(SBFHomeGrabberSettings *)self setEdgeProtectOverride:0x7FFFFFFFFFFFFFFFLL];
  [(SBFHomeGrabberSettings *)self setAutoHideOverride:0x7FFFFFFFFFFFFFFFLL];
  [(SBFHomeGrabberSettings *)self setAutoHideTime:2.0];
  [(SBFHomeGrabberSettings *)self setAutoHideTimeOnAppRequest:1.5];
  [(SBFHomeGrabberSettings *)self setResetAutoHideTimeOnRotation:1];
  [(SBFHomeGrabberSettings *)self setDelayForUnhideOnTouch:0.1];
  [(SBFHomeGrabberSettings *)self setDelayForUnhideOnAppRequest:0.1];
  [(SBFHomeGrabberSettings *)self setVisualizeHitTestRect:0];
  [(SBFHomeGrabberSettings *)self setConstrainHitTestRectToSafeAreaInset:1];
  [(SBFHomeGrabberSettings *)self setHitTestOutsetTop:10.0];
  [(SBFHomeGrabberSettings *)self setHitTestOutsetSides:10.0];
  v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  double v5 = 0.0;
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v5 = 5.0;
  }
  [(SBFHomeGrabberSettings *)self setHitTestOutsetDoubleTap:v5];
  [(SBFHomeGrabberSettings *)self setSingleTapGatingEnabled:1];
  [(SBFHomeGrabberSettings *)self setCoverSheetHomeAffordanceCursorTopEdgeInset:-4.0];
  [(SBFHomeGrabberSettings *)self setCoverSheetHomeAffordanceCursorBottomEdgeInset:-4.0];
  [(SBFHomeGrabberSettings *)self setCoverSheetHomeAffordanceCursorLeftEdgeInset:-7.0];
  [(SBFHomeGrabberSettings *)self setCoverSheetHomeAffordanceCursorRightEdgeInset:-7.0];
  [(SBFHomeGrabberSettings *)self setCoverSheetSuppressAnimationForPointerTopEdgeInset:-300.0];
  [(SBFHomeGrabberSettings *)self setCoverSheetSuppressAnimationForPointerBottomEdgeInset:0.0];
  [(SBFHomeGrabberSettings *)self setCoverSheetSuppressAnimationForPointerLeftEdgeInset:-200.0];
  [(SBFHomeGrabberSettings *)self setCoverSheetSuppressAnimationForPointerRightEdgeInset:-200.0];
  [(SBFHomeGrabberSettings *)self setBounceTranslation:2.0];
  [(SBFHomeGrabberSettings *)self setBounceReverseAnimationDelay:0.2];
  v6 = [(SBFHomeGrabberSettings *)self bounceAnimationSettings];
  [v6 setDefaultValues];

  v7 = [(SBFHomeGrabberSettings *)self bounceAnimationSettings];
  [v7 setDampingRatio:0.375278];

  v8 = [(SBFHomeGrabberSettings *)self bounceAnimationSettings];
  [v8 setResponse:0.36276];

  v9 = [(SBFHomeGrabberSettings *)self hideAnimationSettings];
  float v10 = *MEMORY[0x1E4F39AF0];
  float v11 = *(float *)(MEMORY[0x1E4F39AF0] + 4);
  float v12 = *(float *)(MEMORY[0x1E4F39AF0] + 8);
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.6, *MEMORY[0x1E4F39AF0], v11, v12, (uint64_t)v9, v9, 0);

  v13 = [(SBFHomeGrabberSettings *)self unhideAnimationSettings];
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.25, v10, v11, v12, (uint64_t)v13, v13, 0);

  v14 = [(SBFHomeGrabberSettings *)self hideForHomeGestureOwnershipAnimationSettings];
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.25, v10, v11, v12, (uint64_t)v14, v14, 0);

  v15 = [(SBFHomeGrabberSettings *)self unhideForHomeGestureOwnershipAnimationSettings];
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.25, v10, v11, v12, (uint64_t)v15, v15, 0);

  v16 = [(SBFHomeGrabberSettings *)self thinToProminentAnimationSettings];
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.25, v10, v11, v12, (uint64_t)v16, v16, 0);

  v17 = [(SBFHomeGrabberSettings *)self prominentToThinAnimationSettings];
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.25, v10, v11, v12, (uint64_t)v17, v17, 0);

  v18 = [(SBFHomeGrabberSettings *)self forcedProminentToThinAnimationSettings];
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.6, v10, v11, v12, (uint64_t)v18, v18, 0);

  v19 = [(SBFHomeGrabberSettings *)self lumaResponseAnimationSettings];
  CAFrameRateRange v28 = CAFrameRateRangeMake(30.0, 120.0, 30.0);
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(3.0, v28.minimum, v28.maximum, v28.preferred, v20, v19, 21);

  v21 = [(SBFHomeGrabberSettings *)self initialLumaResponseAnimationSettings];
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.5, v10, v11, v12, (uint64_t)v21, v21, 0);

  v22 = [(SBFHomeGrabberSettings *)self rotationFadeOutAnimationSettings];
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.1, v10, v11, v12, (uint64_t)v22, v22, 0);

  v23 = [(SBFHomeGrabberSettings *)self rotationFadeInAnimationSettings];
  __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(0.3, v10, v11, v12, (uint64_t)v23, v23, 0);

  [(SBFHomeGrabberSettings *)self setEdgeProtectOverride:0x7FFFFFFFFFFFFFFFLL];
  v24 = [(SBFHomeGrabberSettings *)self edgeProtectAnimationSettings];
  [v24 setDefaultValues];

  v25 = [(SBFHomeGrabberSettings *)self edgeProtectAnimationSettings];
  [v25 setResponse:0.444];

  v26 = [(SBFHomeGrabberSettings *)self edgeProtectAnimationSettings];
  [v26 setDampingRatio:0.884];
}

void __42__SBFHomeGrabberSettings_setDefaultValues__block_invoke(double a1, float a2, float a3, float a4, uint64_t a5, void *a6, uint64_t a7)
{
  id v15 = a6;
  [v15 setDefaultValues];
  [v15 setCurve:196608];
  [v15 setDuration:a1];
  *(float *)&double v12 = a2;
  *(float *)&double v13 = a3;
  *(float *)&double v14 = a4;
  objc_msgSend(v15, "setFrameRateRange:highFrameRateReason:", a7, v12, v13, v14);
}

- (UIEdgeInsets)coverSheetHomeAffordanceCursorEdgeInsets
{
  double coverSheetHomeAffordanceCursorTopEdgeInset = self->_coverSheetHomeAffordanceCursorTopEdgeInset;
  double coverSheetHomeAffordanceCursorLeftEdgeInset = self->_coverSheetHomeAffordanceCursorLeftEdgeInset;
  double coverSheetHomeAffordanceCursorBottomEdgeInset = self->_coverSheetHomeAffordanceCursorBottomEdgeInset;
  double coverSheetHomeAffordanceCursorRightEdgeInset = self->_coverSheetHomeAffordanceCursorRightEdgeInset;
  result.right = coverSheetHomeAffordanceCursorRightEdgeInset;
  result.bottom = coverSheetHomeAffordanceCursorBottomEdgeInset;
  result.left = coverSheetHomeAffordanceCursorLeftEdgeInset;
  result.top = coverSheetHomeAffordanceCursorTopEdgeInset;
  return result;
}

- (UIEdgeInsets)coverSheetSuppressAnimationForPointerInsets
{
  double coverSheetSuppressAnimationForPointerTopEdgeInset = self->_coverSheetSuppressAnimationForPointerTopEdgeInset;
  double coverSheetSuppressAnimationForPointerLeftEdgeInset = self->_coverSheetSuppressAnimationForPointerLeftEdgeInset;
  double coverSheetSuppressAnimationForPointerBottomEdgeInset = self->_coverSheetSuppressAnimationForPointerBottomEdgeInset;
  double coverSheetSuppressAnimationForPointerRightEdgeInset = self->_coverSheetSuppressAnimationForPointerRightEdgeInset;
  result.right = coverSheetSuppressAnimationForPointerRightEdgeInset;
  result.bottom = coverSheetSuppressAnimationForPointerBottomEdgeInset;
  result.left = coverSheetSuppressAnimationForPointerLeftEdgeInset;
  result.top = coverSheetSuppressAnimationForPointerTopEdgeInset;
  return result;
}

+ (id)settingsControllerModule
{
  v99[1] = *MEMORY[0x1E4F143B8];
  BOOL v2 = SBFIsSAETappyHomeAffordanceAvailable();
  v3 = (void *)MEMORY[0x1E4F94100];
  uint64_t v4 = [MEMORY[0x1E4F94178] action];
  double v5 = [v3 rowWithTitle:@"Restore Defaults" action:v4];
  v99[0] = v5;
  v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:1];

  v94 = [MEMORY[0x1E4F94168] sectionWithRows:v70];
  v92 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Enabled" valueKeyPath:@"enabled"];
  v98[0] = v92;
  v90 = [MEMORY[0x1E4F94110] rowWithTitle:@"Initialization" valueKeyPath:@"initializationStyle"];
  v88 = [v90 possibleValues:&unk_1ED89EBA8 titles:&unk_1ED89EBC0];
  v98[1] = v88;
  v86 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Remove On Hide" valueKeyPath:@"removeViewOnHide"];
  v98[2] = v86;
  v84 = [MEMORY[0x1E4F94110] rowWithTitle:@"Edge Protect Override" valueKeyPath:@"edgeProtectOverride"];
  v83 = [v84 possibleValues:&unk_1ED89EBD8 titles:&unk_1ED89EBF0];
  v98[3] = v83;
  v82 = [MEMORY[0x1E4F94110] rowWithTitle:@"Auto Hide Override" valueKeyPath:@"autoHideOverride"];
  v81 = [v82 possibleValues:&unk_1ED89EC08 titles:&unk_1ED89EC20];
  v98[4] = v81;
  v80 = [MEMORY[0x1E4F94140] rowWithTitle:@"Auto Hide Time - Default" valueKeyPath:@"autoHideTime"];
  v98[5] = v80;
  v79 = [MEMORY[0x1E4F941E0] rowWithTitle:0 valueKeyPath:@"autoHideTime"];
  v78 = [v79 minValue:0.0 maxValue:10.0];
  v98[6] = v78;
  v77 = [MEMORY[0x1E4F94140] rowWithTitle:@"Auto Hide Time - App Request" valueKeyPath:@"autoHideTimeOnAppRequest"];
  v98[7] = v77;
  v76 = [MEMORY[0x1E4F941E0] rowWithTitle:0 valueKeyPath:@"autoHideTimeOnAppRequest"];
  v75 = [v76 minValue:0.0 maxValue:10.0];
  v98[8] = v75;
  v74 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Reset Hide Timer On Rotation" valueKeyPath:@"resetAutoHideTimeOnRotation"];
  v98[9] = v74;
  v73 = [MEMORY[0x1E4F94140] rowWithTitle:@"Touch Unhide Delay" valueKeyPath:@"delayForUnhideOnTouch"];
  v98[10] = v73;
  v72 = [MEMORY[0x1E4F941E0] rowWithTitle:0 valueKeyPath:@"delayForUnhideOnTouch"];
  v71 = [v72 minValue:0.0 maxValue:3.0];
  v98[11] = v71;
  v69 = [MEMORY[0x1E4F94140] rowWithTitle:@"App Request Unhide Delay" valueKeyPath:@"delayForUnhideOnAppRequest"];
  v98[12] = v69;
  v68 = [MEMORY[0x1E4F941E0] rowWithTitle:0 valueKeyPath:@"delayForUnhideOnAppRequest"];
  v67 = [v68 minValue:0.0 maxValue:3.0];
  v98[13] = v67;
  v66 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Visualize Grabber Hit-Test Area" valueKeyPath:@"visualizeHitTestRect"];
  v98[14] = v66;
  v65 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Constrain Grabber Hit-Test Area" valueKeyPath:@"constrainHitTestRectToSafeAreaInset"];
  v98[15] = v65;
  v64 = [MEMORY[0x1E4F94140] rowWithTitle:@"Grabber Hit-Test Outset (Top)" valueKeyPath:@"hitTestOutsetTop"];
  v98[16] = v64;
  v63 = [MEMORY[0x1E4F941E0] rowWithTitle:0 valueKeyPath:@"hitTestOutsetTop"];
  v62 = [v63 minValue:0.0 maxValue:30.0];
  v98[17] = v62;
  v61 = [MEMORY[0x1E4F94140] rowWithTitle:@"Grabber Hit-Test Outset (Sides)" valueKeyPath:@"hitTestOutsetSides"];
  v98[18] = v61;
  v60 = [MEMORY[0x1E4F941E0] rowWithTitle:0 valueKeyPath:@"hitTestOutsetSides"];
  v59 = [v60 minValue:0.0 maxValue:60.0];
  v98[19] = v59;
  v58 = [MEMORY[0x1E4F94140] rowWithTitle:@"Grabber Hit-Test Outset (Double-Tap)" valueKeyPath:@"hitTestOutsetDoubleTap"];
  v57 = [MEMORY[0x1E4F28F60] predicateWithValue:v2];
  v56 = [v58 condition:v57];
  v98[20] = v56;
  v55 = [MEMORY[0x1E4F941E0] rowWithTitle:0 valueKeyPath:@"hitTestOutsetDoubleTap"];
  v54 = [v55 minValue:0.0 maxValue:60.0];
  v53 = [MEMORY[0x1E4F28F60] predicateWithValue:v2];
  v52 = [v54 condition:v53];
  v98[21] = v52;
  v51 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Gate Single Tap Delivery" valueKeyPath:@"singleTapGatingEnabled"];
  v98[22] = v51;
  v50 = [MEMORY[0x1E4F94140] rowWithTitle:@"Bounce Translation" valueKeyPath:@"bounceTranslation"];
  v98[23] = v50;
  v49 = [MEMORY[0x1E4F941E0] rowWithTitle:0 valueKeyPath:@"bounceTranslation"];
  v48 = [v49 minValue:0.0 maxValue:5.0];
  v98[24] = v48;
  v47 = [MEMORY[0x1E4F94140] rowWithTitle:@"Bounce Reversal Delay" valueKeyPath:@"bounceReverseAnimationDelay"];
  v98[25] = v47;
  v46 = [MEMORY[0x1E4F941E0] rowWithTitle:0 valueKeyPath:@"bounceReverseAnimationDelay"];
  v45 = [v46 minValue:0.0 maxValue:1.0];
  v98[26] = v45;
  v44 = [MEMORY[0x1E4F94140] rowWithTitle:@"Cover Sheet Home Affordance Cursor - Top Inset" valueKeyPath:@"coverSheetHomeAffordanceCursorTopEdgeInset"];
  v98[27] = v44;
  v43 = [MEMORY[0x1E4F941E0] rowWithTitle:0 valueKeyPath:@"coverSheetHomeAffordanceCursorTopEdgeInset"];
  v42 = [v43 minValue:0.0 maxValue:10.0];
  v98[28] = v42;
  v41 = [MEMORY[0x1E4F94140] rowWithTitle:@"Cover Sheet Home Affordance Cursor - Left Inset" valueKeyPath:@"coverSheetHomeAffordanceCursorLeftEdgeInset"];
  v98[29] = v41;
  v40 = [MEMORY[0x1E4F941E0] rowWithTitle:0 valueKeyPath:@"coverSheetHomeAffordanceCursorLeftEdgeInset"];
  v39 = [v40 minValue:0.0 maxValue:10.0];
  v98[30] = v39;
  v38 = [MEMORY[0x1E4F94140] rowWithTitle:@"Cover Sheet Home Affordance Cursor - Bottom Inset" valueKeyPath:@"coverSheetHomeAffordanceCursorBottomEdgeInset"];
  v98[31] = v38;
  v37 = [MEMORY[0x1E4F941E0] rowWithTitle:0 valueKeyPath:@"coverSheetHomeAffordanceCursorBottomEdgeInset"];
  v36 = [v37 minValue:0.0 maxValue:10.0];
  v98[32] = v36;
  v35 = [MEMORY[0x1E4F94140] rowWithTitle:@"Cover Sheet Home Affordance Cursor - Right Inset" valueKeyPath:@"coverSheetHomeAffordanceCursorRightEdgeInset"];
  v98[33] = v35;
  v34 = [MEMORY[0x1E4F941E0] rowWithTitle:0 valueKeyPath:@"coverSheetHomeAffordanceCursorRightEdgeInset"];
  v33 = [v34 minValue:0.0 maxValue:10.0];
  v98[34] = v33;
  v32 = [MEMORY[0x1E4F94140] rowWithTitle:@"Cover Sheet Suppress Animation For Pointer - Top Inset" valueKeyPath:@"coverSheetSuppressAnimationForPointerTopEdgeInset"];
  v98[35] = v32;
  v31 = [MEMORY[0x1E4F941E0] rowWithTitle:0 valueKeyPath:@"coverSheetSuppressAnimationForPointerTopEdgeInset"];
  v6 = [v31 minValue:0.0 maxValue:10.0];
  v98[36] = v6;
  v7 = [MEMORY[0x1E4F94140] rowWithTitle:@"Cover Sheet Suppress Animation For Pointer - Left Inset" valueKeyPath:@"coverSheetSuppressAnimationForPointerLeftEdgeInset"];
  v98[37] = v7;
  v8 = [MEMORY[0x1E4F941E0] rowWithTitle:0 valueKeyPath:@"coverSheetSuppressAnimationForPointerLeftEdgeInset"];
  v9 = [v8 minValue:0.0 maxValue:10.0];
  v98[38] = v9;
  float v10 = [MEMORY[0x1E4F94140] rowWithTitle:@"Cover Sheet Suppress Animation For Pointer - Bottom Inset" valueKeyPath:@"coverSheetSuppressAnimationForPointerBottomEdgeInset"];
  v98[39] = v10;
  float v11 = [MEMORY[0x1E4F941E0] rowWithTitle:0 valueKeyPath:@"coverSheetSuppressAnimationForPointerBottomEdgeInset"];
  double v12 = [v11 minValue:0.0 maxValue:10.0];
  v98[40] = v12;
  double v13 = [MEMORY[0x1E4F94140] rowWithTitle:@"Cover Sheet Suppress Animation For Pointer - Right Inset" valueKeyPath:@"coverSheetSuppressAnimationForPointerRightEdgeInset"];
  v98[41] = v13;
  double v14 = [MEMORY[0x1E4F941E0] rowWithTitle:0 valueKeyPath:@"coverSheetSuppressAnimationForPointerRightEdgeInset"];
  id v15 = [v14 minValue:0.0 maxValue:10.0];
  v98[42] = v15;
  v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:v98 count:43];

  v93 = [MEMORY[0x1E4F94168] sectionWithRows:v95 title:@"Setup"];
  v91 = [MEMORY[0x1E4F94138] rowWithTitle:@"Bounce" childSettingsKeyPath:@"bounceAnimationSettings"];
  v97[0] = v91;
  v89 = [MEMORY[0x1E4F94138] rowWithTitle:@"Hide" childSettingsKeyPath:@"hideAnimationSettings"];
  v97[1] = v89;
  v87 = [MEMORY[0x1E4F94138] rowWithTitle:@"Unhide" childSettingsKeyPath:@"unhideAnimationSettings"];
  v97[2] = v87;
  v85 = [MEMORY[0x1E4F94138] rowWithTitle:@"Hide For Ownership" childSettingsKeyPath:@"hideForHomeGestureOwnershipAnimationSettings"];
  v97[3] = v85;
  v16 = [MEMORY[0x1E4F94138] rowWithTitle:@"Unhide For Ownership" childSettingsKeyPath:@"unhideForHomeGestureOwnershipAnimationSettings"];
  v97[4] = v16;
  v17 = [MEMORY[0x1E4F94138] rowWithTitle:@"Thin to Prominent" childSettingsKeyPath:@"thinToProminentAnimationSettings"];
  v97[5] = v17;
  v18 = [MEMORY[0x1E4F94138] rowWithTitle:@"Prominent to Thin" childSettingsKeyPath:@"prominentToThinAnimationSettings"];
  v97[6] = v18;
  v19 = [MEMORY[0x1E4F94138] rowWithTitle:@"Forced Prominent to Thin" childSettingsKeyPath:@"forcedProminentToThinAnimationSettings"];
  v97[7] = v19;
  uint64_t v20 = [MEMORY[0x1E4F94138] rowWithTitle:@"Luma Response" childSettingsKeyPath:@"lumaResponseAnimationSettings"];
  v97[8] = v20;
  v21 = [MEMORY[0x1E4F94138] rowWithTitle:@"Initial Luma Response" childSettingsKeyPath:@"initialLumaResponseAnimationSettings"];
  v97[9] = v21;
  v22 = [MEMORY[0x1E4F94138] rowWithTitle:@"Edge Protect Rubberbanding" childSettingsKeyPath:@"edgeProtectAnimationSettings"];
  v97[10] = v22;
  v23 = [MEMORY[0x1E4F94138] rowWithTitle:@"Rotation: FadeOut" childSettingsKeyPath:@"rotationFadeOutAnimationSettings"];
  v97[11] = v23;
  v24 = [MEMORY[0x1E4F94138] rowWithTitle:@"Rotation: FadeIn" childSettingsKeyPath:@"rotationFadeInAnimationSettings"];
  v97[12] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:13];

  v26 = [MEMORY[0x1E4F94168] sectionWithRows:v25 title:@"Animations"];
  objc_super v27 = (void *)MEMORY[0x1E4F94168];
  v96[0] = v94;
  v96[1] = v93;
  v96[2] = v26;
  CAFrameRateRange v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:3];
  v29 = [v27 moduleWithTitle:0 contents:v28];

  return v29;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setInitializationStyle:(int64_t)a3
{
  self->_initializationStyle = a3;
}

- (void)setRemoveViewOnHide:(BOOL)a3
{
  self->_removeViewOnHide = a3;
}

- (void)setEdgeProtectOverride:(int64_t)a3
{
  self->_edgeProtectOverride = a3;
}

- (void)setAutoHideOverride:(int64_t)a3
{
  self->_autoHideOverride = a3;
}

- (void)setAutoHideTime:(double)a3
{
  self->_autoHideTime = a3;
}

- (void)setAutoHideTimeOnAppRequest:(double)a3
{
  self->_autoHideTimeOnAppRequest = a3;
}

- (BOOL)resetAutoHideTimeOnRotation
{
  return self->_resetAutoHideTimeOnRotation;
}

- (void)setResetAutoHideTimeOnRotation:(BOOL)a3
{
  self->_resetAutoHideTimeOnRotation = a3;
}

- (double)delayForUnhideOnTouch
{
  return self->_delayForUnhideOnTouch;
}

- (void)setDelayForUnhideOnTouch:(double)a3
{
  self->_delayForUnhideOnTouch = a3;
}

- (void)setDelayForUnhideOnAppRequest:(double)a3
{
  self->_delayForUnhideOnAppRequest = a3;
}

- (void)setVisualizeHitTestRect:(BOOL)a3
{
  self->_visualizeHitTestRect = a3;
}

- (void)setConstrainHitTestRectToSafeAreaInset:(BOOL)a3
{
  self->_constrainHitTestRectToSafeAreaInset = a3;
}

- (void)setHitTestOutsetTop:(double)a3
{
  self->_hitTestOutsetTop = a3;
}

- (void)setHitTestOutsetSides:(double)a3
{
  self->_hitTestOutsetSides = a3;
}

- (double)hitTestOutsetDoubleTap
{
  return self->_hitTestOutsetDoubleTap;
}

- (void)setHitTestOutsetDoubleTap:(double)a3
{
  self->_hitTestOutsetDoubleTap = a3;
}

- (BOOL)isSingleTapGatingEnabled
{
  return self->_singleTapGatingEnabled;
}

- (void)setSingleTapGatingEnabled:(BOOL)a3
{
  self->_singleTapGatingEnabled = a3;
}

- (double)bounceTranslation
{
  return self->_bounceTranslation;
}

- (void)setBounceTranslation:(double)a3
{
  self->_bounceTranslation = a3;
}

- (double)bounceReverseAnimationDelay
{
  return self->_bounceReverseAnimationDelay;
}

- (void)setBounceReverseAnimationDelay:(double)a3
{
  self->_bounceReverseAnimationDelay = a3;
}

- (SBFFluidBehaviorSettings)bounceAnimationSettings
{
  return self->_bounceAnimationSettings;
}

- (void)setBounceAnimationSettings:(id)a3
{
}

- (SBFAnimationSettings)hideAnimationSettings
{
  return self->_hideAnimationSettings;
}

- (void)setHideAnimationSettings:(id)a3
{
}

- (void)setUnhideAnimationSettings:(id)a3
{
}

- (SBFAnimationSettings)hideForHomeGestureOwnershipAnimationSettings
{
  return self->_hideForHomeGestureOwnershipAnimationSettings;
}

- (void)setHideForHomeGestureOwnershipAnimationSettings:(id)a3
{
}

- (void)setUnhideForHomeGestureOwnershipAnimationSettings:(id)a3
{
}

- (SBFAnimationSettings)thinToProminentAnimationSettings
{
  return self->_thinToProminentAnimationSettings;
}

- (void)setThinToProminentAnimationSettings:(id)a3
{
}

- (SBFAnimationSettings)prominentToThinAnimationSettings
{
  return self->_prominentToThinAnimationSettings;
}

- (void)setProminentToThinAnimationSettings:(id)a3
{
}

- (SBFAnimationSettings)forcedProminentToThinAnimationSettings
{
  return self->_forcedProminentToThinAnimationSettings;
}

- (void)setForcedProminentToThinAnimationSettings:(id)a3
{
}

- (void)setLumaResponseAnimationSettings:(id)a3
{
}

- (void)setInitialLumaResponseAnimationSettings:(id)a3
{
}

- (SBFAnimationSettings)rotationFadeOutAnimationSettings
{
  return self->_rotationFadeOutAnimationSettings;
}

- (void)setRotationFadeOutAnimationSettings:(id)a3
{
}

- (SBFAnimationSettings)rotationFadeInAnimationSettings
{
  return self->_rotationFadeInAnimationSettings;
}

- (void)setRotationFadeInAnimationSettings:(id)a3
{
}

- (SBFFluidBehaviorSettings)edgeProtectAnimationSettings
{
  return self->_edgeProtectAnimationSettings;
}

- (void)setEdgeProtectAnimationSettings:(id)a3
{
}

- (double)coverSheetHomeAffordanceCursorTopEdgeInset
{
  return self->_coverSheetHomeAffordanceCursorTopEdgeInset;
}

- (void)setCoverSheetHomeAffordanceCursorTopEdgeInset:(double)a3
{
  self->_double coverSheetHomeAffordanceCursorTopEdgeInset = a3;
}

- (double)coverSheetHomeAffordanceCursorBottomEdgeInset
{
  return self->_coverSheetHomeAffordanceCursorBottomEdgeInset;
}

- (void)setCoverSheetHomeAffordanceCursorBottomEdgeInset:(double)a3
{
  self->_double coverSheetHomeAffordanceCursorBottomEdgeInset = a3;
}

- (double)coverSheetHomeAffordanceCursorLeftEdgeInset
{
  return self->_coverSheetHomeAffordanceCursorLeftEdgeInset;
}

- (void)setCoverSheetHomeAffordanceCursorLeftEdgeInset:(double)a3
{
  self->_double coverSheetHomeAffordanceCursorLeftEdgeInset = a3;
}

- (double)coverSheetHomeAffordanceCursorRightEdgeInset
{
  return self->_coverSheetHomeAffordanceCursorRightEdgeInset;
}

- (void)setCoverSheetHomeAffordanceCursorRightEdgeInset:(double)a3
{
  self->_double coverSheetHomeAffordanceCursorRightEdgeInset = a3;
}

- (double)coverSheetSuppressAnimationForPointerTopEdgeInset
{
  return self->_coverSheetSuppressAnimationForPointerTopEdgeInset;
}

- (void)setCoverSheetSuppressAnimationForPointerTopEdgeInset:(double)a3
{
  self->_double coverSheetSuppressAnimationForPointerTopEdgeInset = a3;
}

- (double)coverSheetSuppressAnimationForPointerBottomEdgeInset
{
  return self->_coverSheetSuppressAnimationForPointerBottomEdgeInset;
}

- (void)setCoverSheetSuppressAnimationForPointerBottomEdgeInset:(double)a3
{
  self->_double coverSheetSuppressAnimationForPointerBottomEdgeInset = a3;
}

- (double)coverSheetSuppressAnimationForPointerLeftEdgeInset
{
  return self->_coverSheetSuppressAnimationForPointerLeftEdgeInset;
}

- (void)setCoverSheetSuppressAnimationForPointerLeftEdgeInset:(double)a3
{
  self->_double coverSheetSuppressAnimationForPointerLeftEdgeInset = a3;
}

- (double)coverSheetSuppressAnimationForPointerRightEdgeInset
{
  return self->_coverSheetSuppressAnimationForPointerRightEdgeInset;
}

- (void)setCoverSheetSuppressAnimationForPointerRightEdgeInset:(double)a3
{
  self->_double coverSheetSuppressAnimationForPointerRightEdgeInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeProtectAnimationSettings, 0);
  objc_storeStrong((id *)&self->_rotationFadeInAnimationSettings, 0);
  objc_storeStrong((id *)&self->_rotationFadeOutAnimationSettings, 0);
  objc_storeStrong((id *)&self->_initialLumaResponseAnimationSettings, 0);
  objc_storeStrong((id *)&self->_lumaResponseAnimationSettings, 0);
  objc_storeStrong((id *)&self->_forcedProminentToThinAnimationSettings, 0);
  objc_storeStrong((id *)&self->_prominentToThinAnimationSettings, 0);
  objc_storeStrong((id *)&self->_thinToProminentAnimationSettings, 0);
  objc_storeStrong((id *)&self->_unhideForHomeGestureOwnershipAnimationSettings, 0);
  objc_storeStrong((id *)&self->_hideForHomeGestureOwnershipAnimationSettings, 0);
  objc_storeStrong((id *)&self->_unhideAnimationSettings, 0);
  objc_storeStrong((id *)&self->_hideAnimationSettings, 0);
  objc_storeStrong((id *)&self->_bounceAnimationSettings, 0);
}

@end