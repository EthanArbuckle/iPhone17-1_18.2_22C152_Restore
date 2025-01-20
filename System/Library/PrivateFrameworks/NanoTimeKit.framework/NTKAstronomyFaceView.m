@interface NTKAstronomyFaceView
- (BOOL)_canEnterInteractiveMode;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_needsForegroundContainerView;
- (BOOL)_shouldHandleHardwareEvents;
- (BOOL)_shouldHideStatusBarForViewMode:(int64_t)a3;
- (BOOL)_timeLabelUsesLegibility;
- (BOOL)_wheelChangedWithEvent:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (NTKAstronomyFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_minimumBreathingScaleForComplicationSlot:(id)a3;
- (double)keylineStyleForComplicationSlot:(id)a3;
- (id)_date;
- (id)_detachedComplicationDisplays;
- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3;
- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)digitalTimeLabelDefaultStyle;
- (id)digitalTimeLabelSmallInUpperRightCornerStyle;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (unint64_t)_detentTypeForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (unint64_t)_timeLabelOptions;
- (void)_animateTransitionToViewMode:(int64_t)a3;
- (void)_animateTransitionToViewMode:(int64_t)a3 completion:(id)a4;
- (void)_applyDataMode;
- (void)_applyDataModeAnimated:(BOOL)a3;
- (void)_applyFromVista:(unint64_t)a3 toVista:(unint64_t)a4 fraction:(double)a5;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyShowContentForUnadornedSnapshot;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_applyViewMode:(int64_t)a3;
- (void)_applyVista:(unint64_t)a3;
- (void)_asyncUpdateLocale;
- (void)_asyncUpdateTime;
- (void)_becameActiveFace;
- (void)_becameInactiveFace;
- (void)_cleanupAfterEditing;
- (void)_cleanupAfterZoom;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_disableCrown;
- (void)_enableCrownForAstronomyVista:(unint64_t)a3;
- (void)_handleInteractiveModeGesture:(id)a3;
- (void)_handleSpheroidPanGesture:(id)a3;
- (void)_handleSupplementalModeGesture:(id)a3;
- (void)_hideLocationDot;
- (void)_interpolateFromPose:(const NTKAstronomyFaceViewAnimationPose *)a3 toPose:(const NTKAstronomyFaceViewAnimationPose *)a4 progress:(float)a5;
- (void)_layoutForegroundContainerView;
- (void)_layoutLegacyViews;
- (void)_layoutPhaseLabel;
- (void)_layoutSpheroidLabel:(int)a3;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_physicalButtonDelayedBlockFired;
- (void)_prepareForEditing;
- (void)_prepareToZoom;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_setAstronomyFaceViewModeDefault;
- (void)_setAstronomyFaceViewModeInteractive;
- (void)_setAstronomyFaceViewModeNonInteractive;
- (void)_setAstronomyFaceViewModeSupplemental;
- (void)_setIsAnimatingViewMode:(BOOL)a3;
- (void)_setupAstronomyVistaView;
- (void)_showLocationDotIfNeeded;
- (void)_startClockUpdates;
- (void)_stopClockUpdates;
- (void)_unloadSnapshotContentViews;
- (void)_updateLocaleAnimated:(BOOL)a3;
- (void)_updateLocation:(id)a3 lastLocation:(id)a4;
- (void)_updateTimeAnimated:(BOOL)a3;
- (void)_wheelDelayedBlockFired;
- (void)astronomyVistaViewContentsAnimationFinished:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setTimeOffset:(double)a3;
- (void)setViewMode:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NTKAstronomyFaceView

- (NTKAstronomyFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKAstronomyFaceView;
  v9 = [(NTKFaceView *)&v13 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    v10 = [[NTKDigitialUtilitarianFaceViewComplicationFactory alloc] initForDevice:v8];
    faceViewComplicationFactory = v9->_faceViewComplicationFactory;
    v9->_faceViewComplicationFactory = v10;

    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)v9->_faceViewComplicationFactory setUsesLegibility:1 faceView:v9];
  }

  return v9;
}

- (void)dealloc
{
  [(NTKAstronomyFaceView *)self _unloadSnapshotContentViews];
  v3.receiver = self;
  v3.super_class = (Class)NTKAstronomyFaceView;
  [(NTKFaceView *)&v3 dealloc];
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  return [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory newLegacyViewForComplication:a3 family:a4 slot:a5 faceView:self];
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return [(NTKFaceViewComplicationFactory *)self->_faceViewComplicationFactory legacyLayoutOverrideforComplicationType:a3 slot:a4 faceView:self];
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
}

- (id)_detachedComplicationDisplays
{
  return [(NTKFaceViewComplicationFactory *)self->_faceViewComplicationFactory detachedComplicationDisplaysForFaceView:self];
}

- (void)_loadLayoutRules
{
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  [(NTKFaceViewComplicationFactory *)self->_faceViewComplicationFactory keylineCornerRadiusForComplicationSlot:a3 faceView:self];
  return result;
}

- (double)keylineStyleForComplicationSlot:(id)a3
{
  return (double)[(NTKFaceViewComplicationFactory *)self->_faceViewComplicationFactory keylineStyleForComplicationSlot:a3];
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory fadesComplicationSlot:a3 inEditMode:a4 faceView:self];
}

- (double)_minimumBreathingScaleForComplicationSlot:(id)a3
{
  [(NTKFaceViewComplicationFactory *)self->_faceViewComplicationFactory minimumBreathingScaleForComplicationSlot:a3 faceView:self];
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  v6 = (UIPanGestureRecognizer *)a4;
  interactiveModeTapGesture = self->_interactiveModeTapGesture;
  BOOL v8 = (interactiveModeTapGesture == a3 || self->_spheroidPanGesture == a3)
    && (interactiveModeTapGesture == (UITapGestureRecognizer *)v6 || self->_spheroidPanGesture == v6);

  return v8;
}

- (void)_interpolateFromPose:(const NTKAstronomyFaceViewAnimationPose *)a3 toPose:(const NTKAstronomyFaceViewAnimationPose *)a4 progress:(float)a5
{
  v6 = [(NTKFaceView *)self device];
  _NTKAstronomyLayoutForDevice(v6);

  int IsRTL = CLKLayoutIsRTL();
  if (IsRTL)
  {
    BOOL v8 = [(NTKFaceView *)self device];
    [v8 screenBounds];
    float v10 = v9 - *(float *)&dword_1E9FA9EAC;
  }
  else
  {
    float v10 = *(float *)&dword_1E9FA9EAC;
  }
  double v11 = v10;
  uint64_t v12 = 1016;
  uint64_t v13 = 8;
  do
  {
    v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v12);
    if (v14)
    {
      id v15 = v14;
      CLKInterpolateBetweenFloatsClipped();
      objc_msgSend(v15, "setAlpha:");
      [v15 frame];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      CLKInterpolateBetweenFloatsClipped();
      if (IsRTL) {
        double v22 = -v22 - v19;
      }
      objc_msgSend(v15, "setFrame:", v22 + v11, v17, v19, v21);
    }
    v12 += 8;
    --v13;
  }
  while (v13);
  if (![(NTKFaceView *)self editing])
  {
    v23 = [(NTKFaceView *)self timeView];
    CLKInterpolateBetweenFloatsClipped();
    objc_msgSend(v23, "setAlpha:");

    overrideDateLabel = self->_overrideDateLabel;
    CLKInterpolateBetweenFloatsClipped();
    -[CLKUIColoringLabel setAlpha:](overrideDateLabel, "setAlpha:");
    scrubLabel = self->_scrubLabel;
    CLKInterpolateBetweenFloatsClipped();
    -[CLKUIColoringLabel setAlpha:](scrubLabel, "setAlpha:");
    phaseLabel = self->_phaseLabel;
    CLKInterpolateBetweenFloatsClipped();
    -[CLKUIColoringLabel setAlpha:](phaseLabel, "setAlpha:");
    faceViewComplicationFactory = self->_faceViewComplicationFactory;
    CLKInterpolateBetweenFloatsClipped();
    -[NTKDigitialUtilitarianFaceViewComplicationFactory setAlpha:faceView:](faceViewComplicationFactory, "setAlpha:faceView:", self);
  }
}

- (id)_date
{
  overrideDate = self->_overrideDate;
  if (overrideDate || (overrideDate = self->_crownDate) != 0)
  {
    objc_super v3 = overrideDate;
  }
  else
  {
    objc_super v3 = +[NTKDate faceDate];
  }

  return v3;
}

- (void)_animateTransitionToViewMode:(int64_t)a3
{
}

- (void)_animateTransitionToViewMode:(int64_t)a3 completion:(id)a4
{
  id v10 = a4;
  int64_t v6 = [(NTKDigitalFaceView *)self viewMode];
  if ((*((unsigned char *)self + 1256) & 1) == 0 && v6 == a3
    || (*((unsigned char *)self + 1256) & 1) != 0 && self->_animatingToViewMode == a3)
  {
    v7 = v10;
    if (!v10) {
      goto LABEL_9;
    }
    (*((void (**)(id))v10 + 2))(v10);
  }
  else
  {
    self->_animatingToViewMode = a3;
    [(NTKDelayedBlock *)self->_wheelDelayedBlock cancel];
    wheelDelayedBlock = self->_wheelDelayedBlock;
    self->_wheelDelayedBlock = 0;

    [(NTKDelayedBlock *)self->_physicalButtonDelayedBlock cancel];
    physicalButtonDelayedBlock = self->_physicalButtonDelayedBlock;
    self->_physicalButtonDelayedBlock = 0;

    *((unsigned char *)self + 1256) |= 1u;
    [(NUNIAstronomyVistaView *)self->_astronomyVistaView applyVista:self->_vista transitionStyle:0];
    [(NUNIAstronomyVistaView *)self->_astronomyVistaView showSupplemental:a3 == 3 animated:0];
    [(NTKAstronomyFaceView *)self _setIsAnimatingViewMode:0];
    [(NTKAstronomyFaceView *)self setViewMode:a3];
  }
  v7 = v10;
LABEL_9:
}

- (void)_setIsAnimatingViewMode:(BOOL)a3
{
  *((unsigned char *)self + 1256) = *((unsigned char *)self + 1256) & 0xFE | a3;
}

- (void)setViewMode:(int64_t)a3
{
  if ((*((unsigned char *)self + 1256) & 2) != 0
    && ([(NTKDigitalFaceView *)self viewMode] != a3 || (*((unsigned char *)self + 1256) & 1) != 0))
  {
    [(NTKAstronomyFaceView *)self _applyViewMode:a3];
  }
}

- (void)_applyViewMode:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NTKAstronomyFaceView;
  -[NTKDigitalFaceView setViewMode:](&v12, sel_setViewMode_);
  [(NTKDigitalFaceView *)self invalidateDigitalTimeLabelStyle];
  *((unsigned char *)self + 1256) &= ~1u;
  v5 = [(NTKFaceView *)self delegate];
  objc_msgSend(v5, "faceViewWantsStatusBarHidden:animated:", -[NTKAstronomyFaceView _shouldHideStatusBarForViewMode:](self, "_shouldHideStatusBarForViewMode:", a3), 0);

  switch(a3)
  {
    case 0:
      [(NTKAstronomyFaceView *)self _setAstronomyFaceViewModeDefault];
      goto LABEL_4;
    case 1:
      [(NTKAstronomyFaceView *)self _setAstronomyFaceViewModeNonInteractive];
      goto LABEL_4;
    case 2:
      [(NTKAstronomyFaceView *)self _setAstronomyFaceViewModeInteractive];
      p_vista = &self->_vista;
      uint64_t v10 = 28;
      if (self->_vista == 1) {
        uint64_t v10 = 56;
      }
      LODWORD(v8) = 1.0;
      [(NTKAstronomyFaceView *)self _interpolateFromPose:(char *)&_NTKAstronomyFaceViewGetPose_s_animationPoses + v10 toPose:(char *)&_NTKAstronomyFaceViewGetPose_s_animationPoses + v10 progress:v8];
      goto LABEL_12;
    case 3:
      [(NTKAstronomyFaceView *)self _setAstronomyFaceViewModeSupplemental];
      v7 = &_NTKAstronomyFaceViewGetPose_s_animationPoses;
      goto LABEL_9;
    default:
LABEL_4:
      v7 = &unk_1BC8A20B4;
LABEL_9:
      p_vista = &self->_vista;
      LODWORD(v6) = 1.0;
      [(NTKAstronomyFaceView *)self _interpolateFromPose:v7 toPose:v7 progress:v6];
      if (self->_vista != 2
        && ([(NUNIAstronomyRotationModel *)self->_rotationModel isAtHomeCoordinate] & 1) == 0)
      {
        [(NUNIAstronomyRotationModel *)self->_rotationModel stop];
        double v11 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView rotatable:*p_vista];
        [v11 homeCoordinate];
        objc_msgSend(v11, "setCenterCoordinate:animated:", 0);
      }
LABEL_12:
      [(NUNIAstronomyVistaView *)self->_astronomyVistaView applyVista:*p_vista transitionStyle:0];
      [(NUNIAstronomyVistaView *)self->_astronomyVistaView showSupplemental:a3 == 3 animated:0];
      return;
  }
}

- (BOOL)_shouldHideStatusBarForViewMode:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_startClockUpdates
{
  objc_initWeak(&location, self);
  if (!self->_clockTimerToken)
  {
    objc_super v3 = [MEMORY[0x1E4F196B0] sharedInstance];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42__NTKAstronomyFaceView__startClockUpdates__block_invoke;
    v6[3] = &unk_1E62C1288;
    objc_copyWeak(&v7, &location);
    v4 = [v3 startUpdatesWithUpdateFrequency:0 withHandler:v6 identificationLog:&__block_literal_global_50];
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = v4;

    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

void __42__NTKAstronomyFaceView__startClockUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateTimeAnimated:1];
}

__CFString *__42__NTKAstronomyFaceView__startClockUpdates__block_invoke_47()
{
  return @"astronomy face view";
}

- (void)_stopClockUpdates
{
  if (self->_clockTimerToken)
  {
    objc_super v3 = [MEMORY[0x1E4F196B0] sharedInstance];
    [v3 stopUpdatesForToken:self->_clockTimerToken];

    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;
  }
}

- (void)_setAstronomyFaceViewModeSupplemental
{
  [(NTKAstronomyFaceView *)self _disableCrown];
  overrideDateLabel = self->_overrideDateLabel;
  v4 = _NTKAstronomyFaceViewLocalizedNow();
  [(CLKUIColoringLabel *)overrideDateLabel setText:v4];

  [(CLKUIColoringLabel *)self->_scrubLabel setText:&stru_1F1635E90];
  [(CLKUIColoringLabel *)self->_phaseLabel setText:&stru_1F1635E90];
  [(UITapGestureRecognizer *)self->_interactiveModeTapGesture setEnabled:1];
  [(UITapGestureRecognizer *)self->_supplementalModeDoubleTapGesture setEnabled:1];
  [(UIPanGestureRecognizer *)self->_spheroidPanGesture setEnabled:0];
  [(NTKAstronomyFaceView *)self _hideLocationDot];
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView setFrameInterval:3];
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView startAnimation];

  [(NTKAstronomyFaceView *)self _startClockUpdates];
}

- (void)_setAstronomyFaceViewModeDefault
{
  [(NTKAstronomyFaceView *)self _enableCrownForAstronomyVista:self->_vista];
  overrideDateLabel = self->_overrideDateLabel;
  v4 = _NTKAstronomyFaceViewLocalizedNow();
  [(CLKUIColoringLabel *)overrideDateLabel setText:v4];

  [(CLKUIColoringLabel *)self->_scrubLabel setText:&stru_1F1635E90];
  [(CLKUIColoringLabel *)self->_phaseLabel setText:&stru_1F1635E90];
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView updateSunLocationAnimated:0];
  [(UITapGestureRecognizer *)self->_interactiveModeTapGesture setEnabled:1];
  [(UITapGestureRecognizer *)self->_supplementalModeDoubleTapGesture setEnabled:1];
  [(UIPanGestureRecognizer *)self->_spheroidPanGesture setEnabled:0];
  [(NTKAstronomyFaceView *)self _showLocationDotIfNeeded];
  astronomyVistaView = self->_astronomyVistaView;
  if ([(NTKFaceView *)self editing]) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 3;
  }
  [(NUNIAstronomyVistaView *)astronomyVistaView setFrameInterval:v6];
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView startAnimation];

  [(NTKAstronomyFaceView *)self _startClockUpdates];
}

- (void)_setAstronomyFaceViewModeNonInteractive
{
  [(NTKAstronomyFaceView *)self _disableCrown];
  overrideDateLabel = self->_overrideDateLabel;
  v4 = _NTKAstronomyFaceViewLocalizedNow();
  [(CLKUIColoringLabel *)overrideDateLabel setText:v4];

  [(CLKUIColoringLabel *)self->_scrubLabel setText:&stru_1F1635E90];
  [(CLKUIColoringLabel *)self->_phaseLabel setText:&stru_1F1635E90];
  [(UITapGestureRecognizer *)self->_interactiveModeTapGesture setEnabled:0];
  [(UITapGestureRecognizer *)self->_supplementalModeDoubleTapGesture setEnabled:0];
  [(UIPanGestureRecognizer *)self->_spheroidPanGesture setEnabled:0];
  [(NTKAstronomyFaceView *)self _hideLocationDot];
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView setFrameInterval:3];
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView stopAnimation];

  [(NTKAstronomyFaceView *)self _stopClockUpdates];
}

- (void)_setAstronomyFaceViewModeInteractive
{
  [(NTKAstronomyFaceView *)self _enableCrownForAstronomyVista:self->_vista];
  [(UITapGestureRecognizer *)self->_interactiveModeTapGesture setEnabled:1];
  [(UITapGestureRecognizer *)self->_supplementalModeDoubleTapGesture setEnabled:1];
  [(UIPanGestureRecognizer *)self->_spheroidPanGesture setEnabled:1];
  [(NTKAstronomyFaceView *)self _hideLocationDot];
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView setFrameInterval:0];
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView startAnimation];

  [(NTKAstronomyFaceView *)self _startClockUpdates];
}

- (void)_handleInteractiveModeGesture:(id)a3
{
  if ([a3 state] == 3 && (*((unsigned char *)self + 1256) & 1) == 0)
  {
    int64_t v4 = [(NTKDigitalFaceView *)self viewMode];
    if ((unint64_t)(v4 - 2) >= 2)
    {
      if (v4) {
        return;
      }
      uint64_t v5 = 2;
    }
    else
    {
      uint64_t v5 = 0;
    }
    [(NTKAstronomyFaceView *)self _animateTransitionToViewMode:v5];
  }
}

- (void)_handleSupplementalModeGesture:(id)a3
{
  if ([a3 state] == 3 && (*((unsigned char *)self + 1256) & 1) == 0 && self->_vista == 2)
  {
    int64_t v4 = [(NTKDigitalFaceView *)self viewMode];
    uint64_t v5 = 3;
    if (v4 && v4 != 2)
    {
      if (v4 != 3) {
        return;
      }
      uint64_t v5 = 0;
    }
    [(NTKAstronomyFaceView *)self _animateTransitionToViewMode:v5];
  }
}

- (void)_handleSpheroidPanGesture:(id)a3
{
  id v4 = a3;
  if (self->_vista != 2 && !self->_overrideDate)
  {
    id v30 = v4;
    uint64_t v5 = [(NUNIAstronomyRotationModel *)self->_rotationModel rotatable];
    uint64_t v6 = (float32x2_t *)[(NUNIAstronomyRotationModel *)self->_rotationModel interactionSettings];
    unint64_t vista = self->_vista;
    if (vista)
    {
      LODWORD(v7) = 1.0;
      double v27 = v7;
      if (vista == 1)
      {
        -[NUNIAstronomyRotationModel setPulling:](self->_rotationModel, "setPulling:", 1, *(void *)&v7);
        double v9 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView rotatable:0];
        [v9 homeCoordinate];
        BOOL v10 = v11 < 0.0;
        LODWORD(v11) = 1.0;
        if (v10) {
          *(float *)&double v11 = -1.0;
        }
        double v27 = v11;
      }
    }
    else
    {
      LODWORD(v7) = 1.0;
      double v27 = v7;
      [(NUNIAstronomyRotationModel *)self->_rotationModel setPulling:0];
    }
    uint64_t v12 = objc_msgSend(v30, "state", *(void *)&v27);
    switch(v12)
    {
      case 3:
        rotationModel = self->_rotationModel;
        double v16 = [v30 view];
        [v30 velocityInView:v16];
        v18.f64[1] = v17;
        [(NUNIAstronomyRotationModel *)rotationModel push:COERCE_DOUBLE(vmul_f32(v6[1], vmul_n_f32(vcvt_f32_f64(v18), v28)))];

        break;
      case 2:
        double v19 = [v30 view];
        [v30 translationInView:v19];
        v21.f64[1] = v20;
        float32x2_t v22 = vmul_n_f32(vcvt_f32_f64(v21), v28);

        float32x2_t v23 = vsub_f32(*(float32x2_t *)self->_previousTranslation, v22);
        float v24 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v23, v23).i32[1]), v23.f32[0], v23.f32[0]));
        float recentMovement = self->_recentMovement;
        if (recentMovement != 0.0) {
          float v24 = (float)(recentMovement * 0.6) + (float)(v24 * 0.4);
        }
        self->_float recentMovement = v24;
        float v29 = vmul_f32(v22, *v6).f32[0];
        *(float32x2_t *)self->_previousTranslation = v22;
        NUNIAstronomyClampLatitude();
        objc_msgSend(v5, "setCenterCoordinate:", v26, self->_initialCoordinate.longitude + v29);
        break;
      case 1:
        [(NUNIAstronomyRotationModel *)self->_rotationModel stop];
        [v5 centerCoordinate];
        self->_float recentMovement = 0.0;
        self->_initialCoordinate.latitude = v13;
        self->_initialCoordinate.longitude = v14;
        *(void *)self->_previousTranslation = 0;
        break;
    }

    id v4 = v30;
  }
}

- (void)astronomyVistaViewContentsAnimationFinished:(id)a3
{
  if (([(NTKDigitalFaceView *)self viewMode] & 0xFFFFFFFFFFFFFFFDLL) == 0
    && (*((unsigned char *)self + 1256) & 1) == 0)
  {
    [(NTKAstronomyFaceView *)self _enableCrownForAstronomyVista:self->_vista];
  }
  [(NTKAstronomyFaceView *)self _showLocationDotIfNeeded];

  kdebug_trace();
}

- (void)_applyDataMode
{
  int64_t v3 = [(NTKFaceView *)self dataMode];
  if (v3 == 1) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 != 2 && self->_previousDataMode == 1;
  }

  [(NTKAstronomyFaceView *)self _applyDataModeAnimated:v4];
}

- (void)_applyDataModeAnimated:(BOOL)a3
{
  if ((*((unsigned char *)self + 1256) & 2) != 0 && ![(NTKFaceView *)self zooming])
  {
    int64_t v5 = [(NTKDigitalFaceView *)self viewMode];
    int64_t v6 = [(NTKFaceView *)self dataMode];
    if (self->_previousDataMode != v6) {
      self->_previousDataMode = v6;
    }
    if (v6 == 1) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = [(NTKFaceView *)self editing] ^ 1;
    }
    if (((*((unsigned char *)self + 1256) & 1) != 0 || v7 != v5)
      && ((*((unsigned char *)self + 1256) & 1) == 0 || v7 != self->_animatingToViewMode || !a3))
    {
      if (a3)
      {
        [(NTKAstronomyFaceView *)self _animateTransitionToViewMode:v7];
      }
      else
      {
        [(NUNIAstronomyVistaView *)self->_astronomyVistaView updateSunLocationAnimated:0];
        [(NTKAstronomyFaceView *)self _applyViewMode:v7];
      }
    }
  }
}

- (void)_loadSnapshotContentViews
{
  v103.receiver = self;
  v103.super_class = (Class)NTKAstronomyFaceView;
  [(NTKDigitalFaceView *)&v103 _loadSnapshotContentViews];
  if ((*((unsigned char *)self + 1256) & 2) == 0)
  {
    int64_t v3 = [(NTKFaceView *)self foregroundContainerView];
    v102.receiver = self;
    v102.super_class = (Class)NTKAstronomyFaceView;
    [(NTKDigitalFaceView *)&v102 setViewMode:1];
    *((unsigned char *)self + 1256) &= ~1u;
    *((unsigned char *)self + 1256) &= ~8u;
    BOOL v4 = (NUNIAstronomyRotationModel *)objc_opt_new();
    rotationModel = self->_rotationModel;
    self->_rotationModel = v4;

    [(NUNIAstronomyRotationModel *)self->_rotationModel setObserver:self];
    int64_t v6 = (NSDateFormatter *)objc_opt_new();
    uint64_t v7 = self->_scrubDateFormatter[0];
    self->_scrubDateFormatter[0] = v6;

    double v8 = (NSDateFormatter *)objc_opt_new();
    double v9 = self->_scrubDateFormatter[1];
    self->_scrubDateFormatter[1] = v8;

    BOOL v10 = (NSDateFormatter *)objc_opt_new();
    double v11 = self->_scrubDateFormatter[2];
    self->_scrubDateFormatter[2] = v10;

    uint64_t v12 = [(NTKFaceView *)self device];
    _NTKAstronomyLayoutForDevice(v12);

    [(NTKAstronomyFaceView *)self _setupAstronomyVistaView];
    [(NUNIAstronomyVistaView *)self->_astronomyVistaView setObserver:self];
    CLLocationDegrees v13 = +[NTKLocationManager sharedLocationManager];
    CLLocationDegrees v14 = [v13 currentLocation];

    char v15 = *((unsigned char *)self + 1256);
    v93 = v13;
    if (v14)
    {
      *((unsigned char *)self + 1256) = v15 | 4;
      [v13 currentLocation];
    }
    else
    {
      *((unsigned char *)self + 1256) = v15 & 0xFB;
      [v13 anyLocation];
    double v16 = };
    [v16 coordinate];
    double v18 = v17;
    double v20 = v19;

    float64x2_t v21 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView rotatable:0];
    float32x2_t v22 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView rotatable:1];
    objc_msgSend(v22, "setHomeCoordinate:", 0.0, 0.0);
    objc_msgSend(v22, "setCenterCoordinate:", 0.0, 0.0);
    objc_msgSend(v21, "setHomeCoordinate:", v18, v20);
    v92 = v21;
    objc_msgSend(v21, "setCenterCoordinate:", v18, v20);
    float32x2_t v23 = [(NTKFaceView *)self timeView];
    [v23 setOverrideDate:self->_overrideDate duration:0.0];

    float v24 = [MEMORY[0x1E4F1CA20] currentLocale];
    v25 = [v24 objectForKey:*MEMORY[0x1E4F1C438]];

    float v26 = [(NTKFaceView *)self device];
    unsigned int v27 = [v26 nrDeviceVersion];

    if (HIWORD(v27) <= 4u)
    {
      float v28 = [NTKDateComplicationLabel alloc];
      float v29 = [(NTKFaceView *)self device];
      id v30 = [(NTKDateComplicationLabel *)v28 initWithSizeStyle:1 accentType:1 forDevice:v29];
      legacyDateLabel = self->_legacyDateLabel;
      self->_legacyDateLabel = v30;

      v32 = [MEMORY[0x1E4F19A50] systemFontOfSize:*(float *)&_NTKAstronomyLayoutForDevice_constants];
      [(NTKDateComplicationLabel *)self->_legacyDateLabel setFont:v32];

      v33 = [MEMORY[0x1E4FB1618] whiteColor];
      [(NTKDateComplicationLabel *)self->_legacyDateLabel setTextColor:v33];

      if ([v25 isEqualToString:@"he"]) {
        uint64_t v34 = 2048;
      }
      else {
        uint64_t v34 = 8;
      }
      [(NTKDateComplicationLabel *)self->_legacyDateLabel setOverrideDateStyle:v34];
      [(NTKDateComplicationLabel *)self->_legacyDateLabel setUserInteractionEnabled:0];
      [(NTKAstronomyFaceView *)self addSubview:self->_legacyDateLabel];
      id v35 = objc_alloc(MEMORY[0x1E4FB1838]);
      NTKImageNamed(@"AstronomyLegacyLeftBottom");
    }
    v36 = [(NTKAstronomyFaceView *)self digitalTimeLabelSmallInUpperRightCornerStyle];
    v37 = [v36 designatorFont];
    [v37 pointSize];
    double v39 = v38;

    double v40 = *MEMORY[0x1E4FB09E0];
    v41 = [MEMORY[0x1E4F19A50] systemFontOfSize:v39 weight:*MEMORY[0x1E4FB09E0]];
    v42 = [v41 CLKFontWithMonospacedNumbers];
    uint64_t v43 = [v42 CLKFontWithAlternativePunctuation];

    id v44 = objc_alloc((Class)off_1E62BDB58);
    double v45 = *MEMORY[0x1E4F1DB28];
    double v46 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v47 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v48 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v49 = (CLKUIColoringLabel *)objc_msgSend(v44, "initWithFrame:options:", 0, *MEMORY[0x1E4F1DB28], v46, v47, v48);
    scrubLabel = self->_scrubLabel;
    self->_scrubLabel = v49;

    [(CLKUIColoringLabel *)self->_scrubLabel setFont:v43];
    [(CLKUIColoringLabel *)self->_scrubLabel setUsesLegibility:1];
    [v3 addSubview:self->_scrubLabel];
    v51 = (CLKUIColoringLabel *)objc_msgSend(objc_alloc((Class)off_1E62BDB58), "initWithFrame:options:", 0, v45, v46, v47, v48);
    v52 = v3;
    phaseLabel = self->_phaseLabel;
    self->_phaseLabel = v51;

    [(CLKUIColoringLabel *)self->_phaseLabel setNumberOfLines:0];
    [(CLKUIColoringLabel *)self->_phaseLabel setUsesLegibility:1];
    v95 = (void *)v43;
    [(CLKUIColoringLabel *)self->_phaseLabel setFont:v43];
    v54 = self->_phaseLabel;
    v55 = NTKAstronomyComplicationForegroundColor(1);
    [(CLKUIColoringLabel *)v54 setTextColor:v55];

    v56 = self->_phaseLabel;
    v57 = _NTKAstronomyComplicationShadowColor(1);
    [(CLKUIColoringLabel *)v56 setShadowColor:v57];

    [v3 addSubview:self->_phaseLabel];
    v58 = (CLKUIColoringLabel *)objc_msgSend(objc_alloc((Class)off_1E62BDB58), "initWithFrame:options:", 0, v45, v46, v47, v48);
    overrideDateLabel = self->_overrideDateLabel;
    self->_overrideDateLabel = v58;

    [(CLKUIColoringLabel *)self->_overrideDateLabel setTextAlignment:0];
    v91 = v22;
    if ([v25 isEqualToString:@"th"]
      && ([(NTKFaceView *)self device],
          v60 = objc_claimAutoreleasedReturnValue(),
          uint64_t v61 = [v60 deviceCategory],
          v60,
          v61 == 1))
    {
      v62 = self->_overrideDateLabel;
      v63 = [MEMORY[0x1E4F19A50] systemFontOfSize:v39 + -4.0 weight:v40];
      v64 = [v63 CLKFontWithMonospacedNumbers];
      v65 = [v64 CLKFontWithAlternativePunctuation];
      [(CLKUIColoringLabel *)v62 setFont:v65];

      int64_t v3 = v52;
    }
    else
    {
      [(CLKUIColoringLabel *)self->_overrideDateLabel setFont:v43];
    }
    [(CLKUIColoringLabel *)self->_overrideDateLabel setUsesLegibility:1];
    [v3 addSubview:self->_overrideDateLabel];
    v66 = (NUNIAstronomyLocationDot *)objc_alloc_init(MEMORY[0x1E4F7A038]);
    locationDot = self->_locationDot;
    self->_locationDot = v66;

    v68 = self;
    v69 = v3;
    v70 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v45, v46, v47, v48);
    v71 = [MEMORY[0x1E4F19A50] systemFontOfSize:*(float *)&dword_1E9FA9EA4];
    [v70 setFont:v71];

    v72 = NTKAstronomyComplicationForegroundColor(2);
    [v70 setTextColor:v72];

    v73 = [v70 font];
    [v73 lineHeight];
    double v75 = v74;
    v90 = v73;
    [v73 descender];
    *(float *)&double v76 = v75 + v76;
    v68->_supplementalFontLineHeightPlusDescender = roundf(*(float *)&v76);
    v94 = v68;
    objc_initWeak(&location, v68);
    int v77 = 0;
    uint64_t v78 = MEMORY[0x1E4F143A8];
    v79 = MEMORY[0x1E4F14428];
    do
    {
      block[0] = v78;
      block[1] = 3221225472;
      block[2] = __49__NTKAstronomyFaceView__loadSnapshotContentViews__block_invoke;
      block[3] = &unk_1E62C85A8;
      objc_copyWeak(&v99, &location);
      int v100 = v77;
      id v80 = v70;
      id v97 = v80;
      id v81 = v69;
      id v98 = v81;
      dispatch_async(v79, block);

      objc_destroyWeak(&v99);
      ++v77;
    }
    while (v77 != 8);
    v82 = v94;
    uint64_t v83 = [objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v94 action:sel__handleSpheroidPanGesture_];
    spheroidPanGesture = v94->_spheroidPanGesture;
    v94->_spheroidPanGesture = (UIPanGestureRecognizer *)v83;

    [(UIPanGestureRecognizer *)v94->_spheroidPanGesture setMaximumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)v82->_spheroidPanGesture setDelegate:v82];
    uint64_t v85 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v94 action:sel__handleSupplementalModeGesture_];
    supplementalModeDoubleTapGesture = v94->_supplementalModeDoubleTapGesture;
    v94->_supplementalModeDoubleTapGesture = (UITapGestureRecognizer *)v85;

    [(UITapGestureRecognizer *)v94->_supplementalModeDoubleTapGesture setNumberOfTapsRequired:2];
    [(UITapGestureRecognizer *)v94->_supplementalModeDoubleTapGesture setNumberOfTouchesRequired:1];
    uint64_t v87 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v94 action:sel__handleInteractiveModeGesture_];
    interactiveModeTapGesture = v94->_interactiveModeTapGesture;
    v94->_interactiveModeTapGesture = (UITapGestureRecognizer *)v87;

    [(UITapGestureRecognizer *)v94->_interactiveModeTapGesture setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)v94->_interactiveModeTapGesture setNumberOfTouchesRequired:1];
    [(UITapGestureRecognizer *)v82->_interactiveModeTapGesture setDelegate:v82];
    [(UITapGestureRecognizer *)v94->_interactiveModeTapGesture setCancelsTouchesInView:0];
    [(UITapGestureRecognizer *)v82->_interactiveModeTapGesture requireGestureRecognizerToFail:v82->_supplementalModeDoubleTapGesture];
    [(NTKAstronomyFaceView *)v82 addGestureRecognizer:v82->_spheroidPanGesture];
    [(NTKAstronomyFaceView *)v82 addGestureRecognizer:v82->_interactiveModeTapGesture];
    [(NTKAstronomyFaceView *)v82 addGestureRecognizer:v82->_supplementalModeDoubleTapGesture];
    *((unsigned char *)v94 + 1256) |= 2u;
    [(NTKAstronomyFaceView *)v82 _applyVista:v82->_vista];
    [(NTKAstronomyFaceView *)v94 _applyViewMode:1];
    [(NTKAstronomyFaceView *)v94 _applyDataModeAnimated:0];
    [(NTKAstronomyFaceView *)v94 _updateLocaleAnimated:0];
    [(NUNIAstronomyVistaView *)v94->_astronomyVistaView updateSunLocationAnimated:0];
    [(NTKAstronomyFaceView *)v94 setNeedsLayout];
    v89 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v89 addObserver:v94 selector:sel__asyncUpdateTime name:*MEMORY[0x1E4FB2708] object:0];
    [v89 addObserver:v94 selector:sel__asyncUpdateTime name:*MEMORY[0x1E4F1C2E0] object:0];
    [v89 addObserver:v94 selector:sel__asyncUpdateLocale name:*MEMORY[0x1E4F1C370] object:0];

    objc_destroyWeak(&location);
  }
}

void __49__NTKAstronomyFaceView__loadSnapshotContentViews__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ((WeakRetained[1256] & 2) != 0)
    {
      int64_t v3 = WeakRetained + 1016;
      uint64_t v4 = *(int *)(a1 + 56);
      if (!*(void *)&WeakRetained[8 * v4 + 1016])
      {
        int64_t v5 = NSString;
        id v22 = WeakRetained;
        int64_t v6 = _loadSnapshotContentViews_s_labelLocalizationKey[v4];
        uint64_t v7 = objc_msgSend(v5, "stringWithFormat:", @"PLANET%d", v4);
        double v8 = *(void **)(a1 + 32);
        double v9 = NTKClockFaceLocalizedString(v6, v7);
        [v8 setText:v9];

        [*(id *)(a1 + 32) sizeToFit];
        [*(id *)(a1 + 32) bounds];
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        CLLocationDegrees v14 = [v22 device];
        [v14 screenScale];
        CGFloat v16 = v15;
        v24.width = v11;
        v24.height = v13;
        UIGraphicsBeginImageContextWithOptions(v24, 0, v16);

        double v17 = [*(id *)(a1 + 32) layer];
        [v17 renderInContext:UIGraphicsGetCurrentContext()];

        double v18 = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        uint64_t v19 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v18];
        uint64_t v20 = *(int *)(a1 + 56);
        float64x2_t v21 = *(void **)&v3[8 * v20];
        *(void *)&v3[8 * v20] = v19;

        [*(id *)&v3[8 * *(int *)(a1 + 56)] setAlpha:0.0];
        [*(id *)(a1 + 40) addSubview:*(void *)&v3[8 * *(int *)(a1 + 56)]];

        [v22 _layoutSpheroidLabel:*(unsigned int *)(a1 + 56)];
        id WeakRetained = v22;
      }
    }
  }
}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (void)_layoutForegroundContainerView
{
  v29.receiver = self;
  v29.super_class = (Class)NTKAstronomyFaceView;
  [(NTKFaceView *)&v29 _layoutForegroundContainerView];
  [(NTKAstronomyFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  CGFloat v11 = [(NTKAstronomyFaceView *)self digitalTimeLabelSmallInUpperRightCornerStyle];
  double v12 = [v11 layoutRule];
  [v12 referenceFrame];
  double v14 = v13;

  double v15 = [(CLKUIColoringLabel *)self->_scrubLabel text];
  scrubLabel = self->_scrubLabel;
  double v17 = _NTKAstronomyFaceViewLocalizedNow();
  [(CLKUIColoringLabel *)scrubLabel setText:v17];

  [(CLKUIColoringLabel *)self->_scrubLabel sizeToFit];
  [(CLKUIColoringLabel *)self->_scrubLabel frame];
  double v19 = v18;
  [(CLKUIColoringLabel *)self->_scrubLabel setText:v15];
  uint64_t v20 = [(NTKFaceView *)self device];
  _NTKAstronomyLayoutForDevice(v20);
  double v21 = *(double *)&qword_1E9FA9EC0;

  -[CLKUIColoringLabel setFrame:](self->_overrideDateLabel, "setFrame:", v21, v14, v21 * -2.0 + v8 * 0.75, v19);
  id v22 = self->_scrubLabel;
  [(CLKUIColoringLabel *)self->_overrideDateLabel frame];
  -[CLKUIColoringLabel setFrame:](v22, "setFrame:", v21, v10 - v19 - v23, v8 + v21 * -2.0, v19);
  [(CLKUIColoringLabel *)self->_scrubLabel frame];
  self->_phaseLabelDefaultFrame.origin.x = v21;
  self->_phaseLabelDefaultFrame.origin.y = v24 - v19;
  self->_phaseLabelDefaultFrame.size.width = v8 + v21 * -2.0;
  self->_phaseLabelDefaultFrame.size.height = v19;
  [(NTKAstronomyFaceView *)self _layoutPhaseLabel];
  uint64_t v25 = 0;
  do
  {
    uint64_t v26 = [(NTKAstronomyFaceView *)self _layoutSpheroidLabel:v25];
    uint64_t v25 = (v25 + 1);
  }
  while (v25 != 8);
  locationDot = self->_locationDot;
  MEMORY[0x1C1874A70](v26, v4, v6, v8, v10);
  -[NUNIAstronomyLocationDot setCenter:](locationDot, "setCenter:");
  float v28 = [(NTKFaceView *)self foregroundContainerView];
  [v28 bringSubviewToFront:self->_locationDot];

  [(NTKAstronomyFaceView *)self _showLocationDotIfNeeded];
}

- (void)_unloadSnapshotContentViews
{
  v30.receiver = self;
  v30.super_class = (Class)NTKAstronomyFaceView;
  [(NTKDigitalFaceView *)&v30 _unloadSnapshotContentViews];
  if ((*((unsigned char *)self + 1256) & 2) != 0)
  {
    [(NTKAstronomyFaceView *)self _stopClockUpdates];
    double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x1E4FB2708] object:0];
    [v3 removeObserver:self name:*MEMORY[0x1E4F1C2E0] object:0];
    [v3 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];
    [(NTKDelayedBlock *)self->_wheelDelayedBlock cancel];
    wheelDelayedBlock = self->_wheelDelayedBlock;
    self->_wheelDelayedBlock = 0;

    [(NTKDelayedBlock *)self->_physicalButtonDelayedBlock cancel];
    physicalButtonDelayedBlock = self->_physicalButtonDelayedBlock;
    self->_physicalButtonDelayedBlock = 0;

    *((unsigned char *)self + 1256) &= ~2u;
    *((unsigned char *)self + 1256) &= ~8u;
    *((unsigned char *)self + 1256) &= ~4u;
    [(NUNIAstronomyRotationModel *)self->_rotationModel setObserver:0];
    rotationModel = self->_rotationModel;
    self->_rotationModel = 0;

    double v7 = self->_scrubDateFormatter[0];
    self->_scrubDateFormatter[0] = 0;

    double v8 = self->_scrubDateFormatter[1];
    self->_scrubDateFormatter[1] = 0;

    double v9 = self->_scrubDateFormatter[2];
    self->_scrubDateFormatter[2] = 0;

    [(NTKAstronomyFaceView *)self removeGestureRecognizer:self->_interactiveModeTapGesture];
    [(NTKAstronomyFaceView *)self removeGestureRecognizer:self->_supplementalModeDoubleTapGesture];
    [(NTKAstronomyFaceView *)self removeGestureRecognizer:self->_spheroidPanGesture];
    interactiveModeTapGesture = self->_interactiveModeTapGesture;
    self->_interactiveModeTapGesture = 0;

    supplementalModeDoubleTapGesture = self->_supplementalModeDoubleTapGesture;
    self->_supplementalModeDoubleTapGesture = 0;

    spheroidPanGesture = self->_spheroidPanGesture;
    self->_spheroidPanGesture = 0;

    double v13 = [(NTKFaceView *)self device];
    unsigned int v14 = [v13 nrDeviceVersion];

    if (HIWORD(v14) <= 4u)
    {
      [(NTKDateComplicationLabel *)self->_legacyDateLabel removeFromSuperview];
      [(UIImageView *)self->_legacyLeftBottomImageView removeFromSuperview];
      [(UIImageView *)self->_legacyRightBottomImageView removeFromSuperview];
      legacyDateLabel = self->_legacyDateLabel;
      self->_legacyDateLabel = 0;

      legacyLeftBottomImageView = self->_legacyLeftBottomImageView;
      self->_legacyLeftBottomImageView = 0;

      legacyRightBottomImageView = self->_legacyRightBottomImageView;
      self->_legacyRightBottomImageView = 0;
    }
    [(NUNIAstronomyVistaView *)self->_astronomyVistaView removeFromSuperview];
    [(CLKUIColoringLabel *)self->_scrubLabel removeFromSuperview];
    [(CLKUIColoringLabel *)self->_phaseLabel removeFromSuperview];
    [(CLKUIColoringLabel *)self->_overrideDateLabel removeFromSuperview];
    [(NUNIAstronomyLocationDot *)self->_locationDot removeFromSuperview];
    astronomyVistaView = self->_astronomyVistaView;
    self->_astronomyVistaView = 0;

    scrubLabel = self->_scrubLabel;
    self->_scrubLabel = 0;

    phaseLabel = self->_phaseLabel;
    self->_phaseLabel = 0;

    overrideDateLabel = self->_overrideDateLabel;
    self->_overrideDateLabel = 0;

    locationDot = self->_locationDot;
    self->_locationDot = 0;

    crownDate = self->_crownDate;
    self->_crownDate = 0;

    digitalTimeLabelDefaultStyle = self->_digitalTimeLabelDefaultStyle;
    self->_digitalTimeLabelDefaultStyle = 0;

    digitalTimeLabelSmallInUpperRightCornerStyle = self->_digitalTimeLabelSmallInUpperRightCornerStyle;
    self->_digitalTimeLabelSmallInUpperRightCornerStyle = 0;

    uint64_t v26 = 0;
    spheroidLabels = self->_spheroidLabels;
    do
    {
      float v28 = spheroidLabels[v26];
      [(UIImageView *)v28 removeFromSuperview];
      objc_super v29 = spheroidLabels[v26];
      spheroidLabels[v26] = 0;

      ++v26;
    }
    while (v26 != 8);
  }
}

- (void)_applyShowContentForUnadornedSnapshot
{
  id v3 = [(NTKFaceView *)self timeView];
  objc_msgSend(v3, "setHidden:", -[NTKFaceView showContentForUnadornedSnapshot](self, "showContentForUnadornedSnapshot"));
}

- (void)_layoutPhaseLabel
{
  p_phaseLabelDefaultFrame = &self->_phaseLabelDefaultFrame;
  double x = self->_phaseLabelDefaultFrame.origin.x;
  double y = self->_phaseLabelDefaultFrame.origin.y;
  double height = self->_phaseLabelDefaultFrame.size.height;
  -[CLKUIColoringLabel sizeThatFits:](self->_phaseLabel, "sizeThatFits:", self->_phaseLabelDefaultFrame.size.width, 0.0);
  double v8 = v7;
  phaseLabel = self->_phaseLabel;
  double v10 = y + height - v7;
  double width = p_phaseLabelDefaultFrame->size.width;

  -[CLKUIColoringLabel setFrame:](phaseLabel, "setFrame:", x, v10, width, v8);
}

- (void)_layoutSpheroidLabel:(int)a3
{
  double v5 = self->_spheroidLabels[a3];
  if (v5)
  {
    double v18 = v5;
    double v6 = [(NTKFaceView *)self device];
    _NTKAstronomyLayoutForDevice(v6);

    LODWORD(v6) = CLKLayoutIsRTL();
    double v7 = [(NTKFaceView *)self device];
    [v7 screenBounds];
    double v9 = v8 - *(float *)&dword_1E9FA9EB0 - *(float *)&dword_1E9FA9EB4;

    double v10 = *(float *)&dword_1E9FA9EB0 + v9 / 7.0 * (double)a3;
    [(UIImageView *)v18 sizeToFit];
    [(UIImageView *)v18 frame];
    double v12 = v11;
    double v14 = v13;
    if (v6)
    {
      double v15 = [(NTKFaceView *)self device];
      [v15 screenBounds];
      double v17 = v16 - *(float *)&dword_1E9FA9EAC - v12;
    }
    else
    {
      double v17 = *(float *)&dword_1E9FA9EAC;
    }
    -[UIImageView setFrame:](v18, "setFrame:", v17, v10 + v14 * -0.5, v12, v14);
    double v5 = v18;
  }
}

- (void)_layoutLegacyViews
{
  id v3 = [(NTKFaceView *)self device];
  unsigned int v4 = [v3 nrDeviceVersion];

  if (HIWORD(v4) <= 4u)
  {
    [(NTKDateComplicationLabel *)self->_legacyDateLabel sizeToFit];
    [(NTKDateComplicationLabel *)self->_legacyDateLabel frame];
    double v6 = v5;
    double v8 = v7;
    double v9 = [(NTKFaceView *)self device];
    CLKRoundForDevice();
    double v11 = v10;

    -[NTKDateComplicationLabel setFrame:](self->_legacyDateLabel, "setFrame:", v11, 0.0, v6, v8);
    [(NTKAstronomyFaceView *)self bounds];
    double v13 = v12;
    double v15 = v14;
    double v16 = [(UIImageView *)self->_legacyLeftBottomImageView image];
    [v16 size];
    double v18 = v17;

    double v19 = [(UIImageView *)self->_legacyLeftBottomImageView image];
    [v19 size];
    double v21 = v20;

    -[UIImageView setFrame:](self->_legacyLeftBottomImageView, "setFrame:", 0.0, v15 - v21, v18, v21);
    id v22 = [(UIImageView *)self->_legacyRightBottomImageView image];
    [v22 size];
    double v24 = v23;

    uint64_t v25 = [(UIImageView *)self->_legacyRightBottomImageView image];
    [v25 size];
    double v27 = v26;

    legacyRightBottomImageView = self->_legacyRightBottomImageView;
    -[UIImageView setFrame:](legacyRightBottomImageView, "setFrame:", v13 - v24, v15 - v27, v24, v27);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAstronomyFaceView;
  [(NTKDigitalFaceView *)&v3 layoutSubviews];
  [(NTKAstronomyFaceView *)self bounds];
  -[NUNIAstronomyVistaView setFrame:](self->_astronomyVistaView, "setFrame:");
  [(NTKAstronomyFaceView *)self _layoutLegacyViews];
}

- (void)traitCollectionDidChange:(id)a3
{
  digitalTimeLabelDefaultStyle = self->_digitalTimeLabelDefaultStyle;
  self->_digitalTimeLabelDefaultStyle = 0;
  id v5 = a3;

  digitalTimeLabelSmallInUpperRightCornerStyle = self->_digitalTimeLabelSmallInUpperRightCornerStyle;
  self->_digitalTimeLabelSmallInUpperRightCornerStyle = 0;

  v7.receiver = self;
  v7.super_class = (Class)NTKAstronomyFaceView;
  [(NTKAstronomyFaceView *)&v7 traitCollectionDidChange:v5];
}

- (void)_showLocationDotIfNeeded
{
  if (self->_astronomyVistaView
    && !self->_vista
    && (*((unsigned char *)self + 1256) & 4) != 0
    && [(NUNIAstronomyRotationModel *)self->_rotationModel isAtHomeCoordinate]
    && ([(NUNIAstronomyLocationDot *)self->_locationDot animating] & 1) == 0)
  {
    objc_super v3 = [(NUNIAstronomyLocationDot *)self->_locationDot superview];
    if (v3
      || (v4 = [(NTKDigitalFaceView *)self viewMode], objc_super v3 = 0, v4)
      || (v5 = [(NTKFaceView *)self editing], objc_super v3 = 0, v5))
    {
    }
    else if ((*((unsigned char *)self + 1256) & 1) == 0)
    {
      double v6 = [(NTKFaceView *)self foregroundContainerView];
      [v6 addSubview:self->_locationDot];

      [(NUNIAstronomyLocationDot *)self->_locationDot setAlpha:1.0];
      locationDot = self->_locationDot;
      [(NUNIAstronomyLocationDot *)locationDot startAnimation];
    }
  }
}

- (void)_hideLocationDot
{
  [(NUNIAstronomyLocationDot *)self->_locationDot stopAnimation];
  [(NUNIAstronomyLocationDot *)self->_locationDot setAlpha:0.0];
  locationDot = self->_locationDot;

  [(NUNIAstronomyLocationDot *)locationDot removeFromSuperview];
}

- (void)_asyncUpdateLocale
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__NTKAstronomyFaceView__asyncUpdateLocale__block_invoke;
  v2[3] = &unk_1E62C0068;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __42__NTKAstronomyFaceView__asyncUpdateLocale__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateLocaleAnimated:1];
}

- (void)_asyncUpdateTime
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__NTKAstronomyFaceView__asyncUpdateTime__block_invoke;
  v2[3] = &unk_1E62C0068;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __40__NTKAstronomyFaceView__asyncUpdateTime__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateTimeAnimated:1];
}

- (void)_updateLocaleAnimated:(BOOL)a3
{
  if ((*((unsigned char *)self + 1256) & 2) != 0)
  {
    BOOL v3 = a3;
    id v6 = [MEMORY[0x1E4F1CA20] currentLocale];
    if (CLKLocaleIs24HourMode()) {
      BOOL v5 = @"H:mm";
    }
    else {
      BOOL v5 = @"h:mm a";
    }
    [(NSDateFormatter *)self->_scrubDateFormatter[0] setLocalizedDateFormatFromTemplate:v5];
    [(NSDateFormatter *)self->_scrubDateFormatter[1] setLocalizedDateFormatFromTemplate:@"MMM d"];
    [(NSDateFormatter *)self->_scrubDateFormatter[2] setLocalizedDateFormatFromTemplate:@"MM/dd/y"];
    [(NTKAstronomyFaceView *)self _updateTimeAnimated:v3];
  }
}

- (void)_updateTimeAnimated:(BOOL)a3
{
  if ((*((unsigned char *)self + 1256) & 2) != 0 && (*((unsigned char *)self + 1256) & 1) == 0)
  {
    BOOL v4 = a3;
    if (![(NTKDigitalFaceView *)self viewMode]
      && ![(NTKFaceView *)self editing]
      && ![(NTKFaceView *)self zooming])
    {
      [(NUNIAstronomyVistaView *)self->_astronomyVistaView updateSunLocationAnimated:v4];
    }
  }
  BOOL v5 = [(NTKFaceView *)self device];
  unsigned int v6 = [v5 nrDeviceVersion];

  if (HIWORD(v6) <= 4u && (*((unsigned char *)self + 1256) & 2) != 0)
  {
    unint64_t v7 = [(NTKDateComplicationLabel *)self->_legacyDateLabel overrideDateStyle];
    double v8 = [(NTKAstronomyFaceView *)self _date];
    id v9 = +[NTKComplicationDateFormatter stringForDate:v8 withStyle:v7];

    -[NTKDateComplicationLabel setDateComplicationText:withDayRange:forDateStyle:](self->_legacyDateLabel, "setDateComplicationText:withDayRange:forDateStyle:", v9, 0x7FFFFFFFFFFFFFFFLL, 0, v7);
  }
}

- (void)_updateLocation:(id)a3 lastLocation:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  unint64_t v7 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView rotatable:0];
  char v8 = *((unsigned char *)self + 1256);
  if (v9)
  {
    *((unsigned char *)self + 1256) = v8 | 4;
    [v9 coordinate];
    objc_msgSend(v7, "setHomeCoordinate:");
    [(NTKAstronomyFaceView *)self _showLocationDotIfNeeded];
  }
  else
  {
    *((unsigned char *)self + 1256) = v8 & 0xFB;
    [v6 coordinate];
    objc_msgSend(v7, "setHomeCoordinate:");
    [(NTKAstronomyFaceView *)self _hideLocationDot];
  }
  [(NTKAstronomyFaceView *)self _updateTimeAnimated:1];
}

- (void)_becameActiveFace
{
  BOOL v3 = +[NTKLocationManager sharedLocationManager];
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__NTKAstronomyFaceView__becameActiveFace__block_invoke;
  v6[3] = &unk_1E62C29C8;
  objc_copyWeak(&v7, &location);
  BOOL v4 = [v3 startLocationUpdatesWithIdentifier:@"ntk.astronomyFace" handler:v6];
  locationManagerToken = self->_locationManagerToken;
  self->_locationManagerToken = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __41__NTKAstronomyFaceView__becameActiveFace__block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _updateLocation:v6 lastLocation:v5];
}

- (void)_becameInactiveFace
{
  if (self->_locationManagerToken)
  {
    BOOL v3 = +[NTKLocationManager sharedLocationManager];
    [v3 stopLocationUpdatesForToken:self->_locationManagerToken];

    locationManagerToken = self->_locationManagerToken;
    self->_locationManagerToken = 0;
  }
}

- (unint64_t)_detentTypeForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  return 2;
}

- (void)_setupAstronomyVistaView
{
  BOOL v3 = [(NTKFaceView *)self device];
  _NTKAstronomyLayoutForDevice(v3);
  int v4 = dword_1E9FA9EA8;
  int v6 = dword_1E9FA9EB0;
  int v5 = dword_1E9FA9EB4;
  int v7 = dword_1E9FA9EB8;

  [(NTKAstronomyFaceView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = (void *)MEMORY[0x1E4F7A048];
  double v17 = [(NTKFaceView *)self device];
  double v18 = [v16 defaultConfigurationWithDevice:v17];

  double v19 = (NUNIAstronomyVistaView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F7A058]), "initWithFrame:configuration:", v18, v9, v11, v13, v15);
  astronomyVistaView = self->_astronomyVistaView;
  self->_astronomyVistaView = v19;

  LODWORD(v21) = v6;
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView setSupplementalTopInset:v21];
  LODWORD(v22) = v5;
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView setSupplementalBottomInset:v22];
  LODWORD(v23) = v4;
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView setSupplementalHorizontalInset:v23];
  LODWORD(v24) = v7;
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView setSupplementalSpheroidSize:v24];
  objc_initWeak(&location, self);
  id v25 = objc_alloc(MEMORY[0x1E4F7A068]);
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  objc_super v30 = __48__NTKAstronomyFaceView__setupAstronomyVistaView__block_invoke;
  v31 = &unk_1E62C0040;
  objc_copyWeak(&v32, &location);
  double v26 = (void *)[v25 initWithSphereoids:16515070 currentDateBlock:&v28];
  objc_msgSend(v26, "setSnap:", 3, v28, v29, v30, v31);
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView setScene:v26];
  double v27 = [(NTKFaceView *)self contentView];
  [v27 addSubview:self->_astronomyVistaView];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

id __48__NTKAstronomyFaceView__setupAstronomyVistaView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _date];
  }
  else {
  BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
  }

  return v3;
}

- (unint64_t)_timeLabelOptions
{
  return 1;
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3
{
  [(NTKAstronomyFaceView *)self bounds];

  return -[NTKAstronomyFaceView _digitalTimeLabelStyleFromViewMode:faceBounds:](self, "_digitalTimeLabelStyleFromViewMode:faceBounds:", a3);
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4
{
  if ((unint64_t)a3 > 1)
  {
    p_digitalTimeLabelSmallInUpperRightCornerStyle = &self->_digitalTimeLabelSmallInUpperRightCornerStyle;
    digitalTimeLabelSmallInUpperRightCornerStyle = self->_digitalTimeLabelSmallInUpperRightCornerStyle;
    if (digitalTimeLabelSmallInUpperRightCornerStyle) {
      goto LABEL_7;
    }
    [(NTKAstronomyFaceView *)self bounds];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v28 = *MEMORY[0x1E4FB09E0];
    double v15 = [(NTKFaceView *)self device];
    uint64_t v29 = +[NTKDigitalTimeLabelStyle smallInUpperRightCornerStyleForBounds:weight:forDevice:](NTKDigitalTimeLabelStyle, "smallInUpperRightCornerStyleForBounds:weight:forDevice:", v15, v21, v23, v25, v27, v28);
    double v17 = *p_digitalTimeLabelSmallInUpperRightCornerStyle;
    *p_digitalTimeLabelSmallInUpperRightCornerStyle = (NTKDigitalTimeLabelStyle *)v29;
  }
  else
  {
    p_digitalTimeLabelSmallInUpperRightCornerStyle = &self->_digitalTimeLabelDefaultStyle;
    digitalTimeLabelSmallInUpperRightCornerStyle = self->_digitalTimeLabelDefaultStyle;
    if (digitalTimeLabelSmallInUpperRightCornerStyle) {
      goto LABEL_7;
    }
    [(NTKAstronomyFaceView *)self bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = [(NTKFaceView *)self device];
    double v16 = NTKDigitalTimeLabelStyleWideRightSideMargin(v15);
    double v17 = [(NTKFaceView *)self device];
    uint64_t v18 = +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:", 1, v17, v8, v10, v12, v14, v16);
    double v19 = *p_digitalTimeLabelSmallInUpperRightCornerStyle;
    *p_digitalTimeLabelSmallInUpperRightCornerStyle = (NTKDigitalTimeLabelStyle *)v18;
  }
  digitalTimeLabelSmallInUpperRightCornerStyle = *p_digitalTimeLabelSmallInUpperRightCornerStyle;
LABEL_7:

  return digitalTimeLabelSmallInUpperRightCornerStyle;
}

- (id)digitalTimeLabelDefaultStyle
{
  return [(NTKAstronomyFaceView *)self _digitalTimeLabelStyleFromViewMode:0];
}

- (id)digitalTimeLabelSmallInUpperRightCornerStyle
{
  return [(NTKAstronomyFaceView *)self _digitalTimeLabelStyleFromViewMode:2];
}

- (BOOL)_timeLabelUsesLegibility
{
  return 1;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  double v7 = (NSDate *)a3;
  if ((*((unsigned char *)self + 1256) & 2) != 0 && self->_overrideDate != v7)
  {
    double v9 = v7;
    objc_storeStrong((id *)&self->_overrideDate, a3);
    double v8 = [(NTKFaceView *)self timeView];
    [v8 setOverrideDate:v9 duration:0.0];
    [v8 setFrameUsingCurrentStyle];
    [(NUNIAstronomyVistaView *)self->_astronomyVistaView updateSunLocationAnimated:a4 > 0.0];
  }

  MEMORY[0x1F4181820]();
}

- (void)setTimeOffset:(double)a3
{
  if ((*((unsigned char *)self + 1256) & 2) != 0)
  {
    id v4 = [(NTKFaceView *)self timeView];
    [v4 setTimeOffset:a3];
  }
}

- (void)_prepareToZoom
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAstronomyFaceView;
  [(NTKFaceView *)&v4 _prepareToZoom];
  if ((*((unsigned char *)self + 1256) & 2) != 0)
  {
    BOOL v3 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView scene];
    [v3 setUpdatable:0];
  }
}

- (void)_cleanupAfterZoom
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAstronomyFaceView;
  [(NTKFaceView *)&v4 _cleanupAfterZoom];
  if ((*((unsigned char *)self + 1256) & 2) != 0)
  {
    BOOL v3 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView scene];
    [v3 setUpdatable:1];
  }
}

- (BOOL)_wheelChangedWithEvent:(id)a3
{
  id v4 = a3;
  if (!self->_physicalButtonDelayedBlock)
  {
    if (![(NTKAstronomyFaceView *)self _canEnterInteractiveMode])
    {
      BOOL v5 = 1;
      goto LABEL_3;
    }
    if (!self->_wheelDelayedBlock)
    {
      objc_initWeak(&location, self);
      double v7 = [NTKDelayedBlock alloc];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __47__NTKAstronomyFaceView__wheelChangedWithEvent___block_invoke;
      v10[3] = &unk_1E62C08C0;
      objc_copyWeak(&v11, &location);
      double v8 = [(NTKDelayedBlock *)v7 initWithDelay:v10 action:0.2];
      wheelDelayedBlock = self->_wheelDelayedBlock;
      self->_wheelDelayedBlock = v8;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  BOOL v5 = 0;
LABEL_3:

  return v5;
}

void __47__NTKAstronomyFaceView__wheelChangedWithEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _wheelDelayedBlockFired];
}

- (void)_wheelDelayedBlockFired
{
  wheelDelayedBlock = self->_wheelDelayedBlock;
  self->_wheelDelayedBlock = 0;

  if (!self->_physicalButtonDelayedBlock
    && [(NTKAstronomyFaceView *)self _canEnterInteractiveMode])
  {
    [(NTKAstronomyFaceView *)self _animateTransitionToViewMode:2];
  }
}

- (void)_physicalButtonDelayedBlockFired
{
  physicalButtonDelayedBlock = self->_physicalButtonDelayedBlock;
  self->_physicalButtonDelayedBlock = 0;
}

- (void)_enableCrownForAstronomyVista:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKAstronomyFaceView;
  [(NTKFaceView *)&v5 _enableCrown];
  if ([(NTKFaceView *)self editing]) {
    char v4 = 0;
  }
  else {
    char v4 = 8;
  }
  *((unsigned char *)self + 1256) = *((unsigned char *)self + 1256) & 0xF7 | v4;
}

- (void)_disableCrown
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAstronomyFaceView;
  [(NTKFaceView *)&v4 _disableCrown];
  crownDate = self->_crownDate;
  self->_crownDate = 0;

  *((unsigned char *)self + 1256) &= ~8u;
  [(NTKAstronomyFaceView *)self _updateTimeAnimated:1];
}

- (BOOL)_canEnterInteractiveMode
{
  return (*((unsigned char *)self + 1256) & 1) == 0 && [(NTKDigitalFaceView *)self viewMode] != 2;
}

- (BOOL)_shouldHandleHardwareEvents
{
  return (*((unsigned __int8 *)self + 1256) >> 3) & 1;
}

- (void)_applyVista:(unint64_t)a3
{
  kdebug_trace();
  self->_unint64_t vista = a3;
  if ((*((unsigned char *)self + 1256) & 2) != 0)
  {
    [(NUNIAstronomyRotationModel *)self->_rotationModel stop];
    id v7 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView rotatable:a3];
    [(NUNIAstronomyRotationModel *)self->_rotationModel setRotatable:v7];
    if (v7)
    {
      [v7 homeCoordinate];
      objc_msgSend(v7, "setCenterCoordinate:animated:", 0);
    }
    [(NUNIAstronomyVistaView *)self->_astronomyVistaView applyVista:a3 transitionStyle:0];
    [(NTKAstronomyFaceView *)self _updateTimeAnimated:0];
    objc_super v5 = NTKAstronomyComplicationForegroundColor(self->_vista);
    int v6 = _NTKAstronomyComplicationShadowColor(self->_vista);
    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory setShadowColor:v6 faceView:self];
    [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory setForegroundColor:v5 faceView:self];
    [(CLKUIColoringLabel *)self->_overrideDateLabel setTextColor:v5];
    [(CLKUIColoringLabel *)self->_overrideDateLabel setShadowColor:v6];
    [(CLKUIColoringLabel *)self->_scrubLabel setTextColor:v5];
    [(CLKUIColoringLabel *)self->_scrubLabel setShadowColor:v6];
  }
}

- (void)_applyFromVista:(unint64_t)a3 toVista:(unint64_t)a4 fraction:(double)a5
{
  double v8 = NTKAstronomyComplicationForegroundColor(a3);
  double v9 = NTKAstronomyComplicationForegroundColor(a4);
  NTKInterpolateBetweenColors();
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  double v10 = _NTKAstronomyComplicationShadowColor(a3);
  id v11 = _NTKAstronomyComplicationShadowColor(a4);
  double v12 = NTKInterpolateBetweenColors();

  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory setShadowColor:v12 faceView:self];
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory setForegroundColor:v13 faceView:self];
  [(CLKUIColoringLabel *)self->_overrideDateLabel setTextColor:v13];
  [(CLKUIColoringLabel *)self->_overrideDateLabel setShadowColor:v12];
  [(CLKUIColoringLabel *)self->_scrubLabel setTextColor:v13];
  [(CLKUIColoringLabel *)self->_scrubLabel setShadowColor:v12];
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  unint64_t v5 = [a3 astronomyVista];
  if (v5 > 2) {
    int v6 = 0;
  }
  else {
    int v6 = off_1E62C85C8[v5];
  }

  NTKImageNamed(v6);
}

- (void)_prepareForEditing
{
  v9.receiver = self;
  v9.super_class = (Class)NTKAstronomyFaceView;
  [(NTKFaceView *)&v9 _prepareForEditing];
  BOOL v3 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView scene];
  [v3 setUpdatable:0];

  [(NTKAstronomyFaceView *)self _applyDataModeAnimated:0];
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory prepareForEditingForFaceView:self];
  uint64_t v4 = 0;
  do
  {
    uint64_t v5 = v4 + 1;
    if (v4 == 2) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = v4 + 1;
    }
    id v7 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView generateAnimationArrayFromVista:v4 toVista:v6 transitionStyle:0];
    double v8 = self->_editingAnimations[v4];
    self->_editingAnimations[v4] = v7;

    ++v4;
  }
  while (v5 != 3);
  [(NTKAstronomyFaceView *)self _hideLocationDot];
}

- (void)_cleanupAfterEditing
{
  v7.receiver = self;
  v7.super_class = (Class)NTKAstronomyFaceView;
  [(NTKFaceView *)&v7 _cleanupAfterEditing];
  [(NTKAstronomyFaceView *)self _applyVista:self->_vista];
  BOOL v3 = [(NUNIAstronomyVistaView *)self->_astronomyVistaView scene];
  [v3 setUpdatable:1];

  [(NTKAstronomyFaceView *)self _applyDataModeAnimated:0];
  [(NTKDigitialUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory cleanupAfterEditingForFaceView:self];
  uint64_t v4 = 0;
  editingAnimations = self->_editingAnimations;
  do
  {
    uint64_t v6 = editingAnimations[v4];
    editingAnimations[v4] = 0;

    ++v4;
  }
  while (v4 != 3);
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  astronomyVistaView = self->_astronomyVistaView;
  CLKInterpolateBetweenFloatsClipped();
  -[NUNIAstronomyVistaView setAlpha:](astronomyVistaView, "setAlpha:");
  id v7 = [(NTKFaceView *)self timeView];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v7, "setAlpha:");
}

- (void)_configureForEditMode:(int64_t)a3
{
  astronomyVistaView = self->_astronomyVistaView;
  double v6 = 0.4;
  if (a3 != 1) {
    double v6 = 1.0;
  }
  [(NUNIAstronomyVistaView *)astronomyVistaView setAlpha:v6];
  id v7 = [(NTKFaceView *)self timeView];
  id v9 = v7;
  double v8 = 0.2;
  if (!a3) {
    double v8 = 1.0;
  }
  [v7 setAlpha:v8];
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  if (a6 == 12)
  {
    uint64_t v12 = [a4 astronomyVista];
    uint64_t v13 = [v11 astronomyVista];
    uint64_t v14 = v13;
    if (v12 + 1 == v13)
    {
      double v15 = self->_editingAnimations[v12];
      if (!v15) {
        goto LABEL_18;
      }
    }
    else if (v13 + 1 == v12)
    {
      double v15 = self->_editingAnimations[v13];
      a3 = 1.0 - a3;
      if (!v15) {
        goto LABEL_18;
      }
    }
    else
    {
      if (v12 != v13) {
        goto LABEL_18;
      }
      double v15 = self->_editingAnimations[v12];
      a3 = 0.0;
      if (!v15) {
        goto LABEL_18;
      }
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v16 = v15;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v17)
    {
      uint64_t v19 = v17;
      uint64_t v20 = *(void *)v24;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(v16);
          }
          float v21 = a3;
          *(float *)&double v18 = v21;
          objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v22++), "apply:", v18, (void)v23);
        }
        while (v19 != v22);
        uint64_t v19 = [(NSArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v19);
    }

    [(NTKAstronomyFaceView *)self _applyFromVista:v12 toVista:v14 fraction:a3];
  }
LABEL_18:
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 12)
  {
    uint64_t v6 = [a3 astronomyVista];
    if (self->_vista != v6)
    {
      unint64_t v7 = v6;
      if ([(NTKFaceView *)self editing])
      {
        self->_unint64_t vista = v7;
      }
      else
      {
        [(NTKAstronomyFaceView *)self _applyVista:v7];
      }
    }
  }
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)NTKAstronomyFaceView;
  [(NTKFaceView *)&v9 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  if ((*((unsigned char *)self + 1256) & 2) != 0)
  {
    unint64_t v7 = _NTKLoggingObjectForDomain(26, (uint64_t)"NTKLoggingDomainAstro");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v8 = [(NTKFaceView *)self dataMode];
      *(_DWORD *)buf = 134217984;
      int64_t v11 = v8;
      _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "_renderSynchronouslyWithImageQueueDiscard: dataMode=%ld", buf, 0xCu);
    }

    [(NUNIAstronomyVistaView *)self->_astronomyVistaView renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_borrowedHandsView);
  objc_destroyWeak((id *)&self->_borrowedCircleView);
  for (uint64_t i = 2; i != -1; --i)
    objc_storeStrong((id *)&self->_editingAnimations[i], 0);
  objc_storeStrong((id *)&self->_physicalButtonDelayedBlock, 0);
  objc_storeStrong((id *)&self->_wheelDelayedBlock, 0);
  for (uint64_t j = 2; j != -1; --j)
    objc_storeStrong((id *)&self->_scrubDateFormatter[j], 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_crownDate, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_locationDot, 0);
  for (uint64_t k = 7; k != -1; --k)
    objc_storeStrong((id *)&self->_spheroidLabels[k], 0);
  objc_storeStrong((id *)&self->_overrideDateLabel, 0);
  objc_storeStrong((id *)&self->_phaseLabel, 0);
  objc_storeStrong((id *)&self->_scrubLabel, 0);
  objc_storeStrong((id *)&self->_astronomyVistaView, 0);
  objc_storeStrong((id *)&self->_legacyRightBottomImageView, 0);
  objc_storeStrong((id *)&self->_legacyLeftBottomImageView, 0);
  objc_storeStrong((id *)&self->_legacyDateLabel, 0);
  objc_storeStrong((id *)&self->_locationManagerToken, 0);
  objc_storeStrong((id *)&self->_interactiveModeTapGesture, 0);
  objc_storeStrong((id *)&self->_supplementalModeDoubleTapGesture, 0);
  objc_storeStrong((id *)&self->_spheroidPanGesture, 0);
  objc_storeStrong((id *)&self->_rotationModel, 0);
  objc_storeStrong((id *)&self->_digitalTimeLabelSmallInUpperRightCornerStyle, 0);
  objc_storeStrong((id *)&self->_digitalTimeLabelDefaultStyle, 0);

  objc_storeStrong((id *)&self->_faceViewComplicationFactory, 0);
}

@end