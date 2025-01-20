@interface NTKAnalogVideoFaceView
+ (BOOL)isRichComplicationsEnabled;
+ (int64_t)uiSensitivity;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_shouldAnimateComplicationsOnTap;
- (BOOL)_supportsUnadornedSnapshot;
- (BOOL)shouldFadeIncomingView;
- (CGPoint)_contentCenterOffset;
- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4;
- (CGSize)videoDialSize;
- (NTKAnalogVideoFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKColorCircularUtilitarianFaceViewComplicationFactory)faceViewComplicationFactory;
- (NTKFaceViewTapControl)faceTapControl;
- (NTKVideoPlayerView)videoPlayerView;
- (UIEdgeInsets)_insetsForDialSize:(CGSize)a3;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_contentAlphaForEditMode:(int64_t)a3;
- (double)_handAlphaForEditMode:(int64_t)a3;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_minimumBreathingScaleForComplicationSlot:(id)a3;
- (double)keylineStyleForComplicationSlot:(id)a3;
- (id)_complicationsCompanionForegroundColor;
- (id)_complicationsEditingColor;
- (id)_complicationsPlatterColor;
- (id)_complicationsTapColor;
- (id)_detachedComplicationDisplays;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_slotForUtilitySlot:(int64_t)a3;
- (id)_tapHighlightImage;
- (id)imageForEditOption:(id)a3;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4;
- (int64_t)_utilitySlotForSlot:(id)a3;
- (unint64_t)_layoutStyleForSlot:(id)a3;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyDataMode;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applySlow;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_cleanupAfterOrb:(BOOL)a3;
- (void)_cleanupAfterTransitionComplicationSlot:(id)a3 selectedComplication:(id)a4;
- (void)_cleanupAfterTransitionToOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_configureTimeView:(id)a3;
- (void)_curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8;
- (void)_faceLibraryDismissed;
- (void)_handleOrdinaryScreenWake;
- (void)_handleWristRaiseScreenWake;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_prepareForOrb;
- (void)_setVideoPlayerDataSource:(id)a3;
- (void)_transformVideoPlayerView:(unint64_t)a3;
- (void)_unloadSnapshotContentViews;
- (void)customizeFaceViewForListing:(id)a3 changeEvent:(unint64_t)a4 animated:(BOOL)a5;
- (void)faceViewWasTapped:(id)a3;
- (void)layoutSubviews;
- (void)screenDidTurnOffAnimated:(BOOL)a3;
- (void)setDataMode:(int64_t)a3;
- (void)setFaceTapControl:(id)a3;
- (void)setFaceViewComplicationFactory:(id)a3;
- (void)setNormalComplicationDisplayWrapper:(id)a3 forSlot:(id)a4;
- (void)setVideoDialSize:(CGSize)a3;
- (void)setVideoPlayerView:(id)a3;
- (void)setupVideoPlayerView;
@end

@implementation NTKAnalogVideoFaceView

+ (int64_t)uiSensitivity
{
  if (![a1 isRichComplicationsEnabled]) {
    return 0;
  }
  return NTKBlueRidgeUISensitivity();
}

- (NTKAnalogVideoFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)NTKAnalogVideoFaceView;
  v10 = [(NTKAnalogFaceView *)&v26 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:v9];
  v11 = v10;
  if (v10)
  {
    v10->_previousDataMode = 0;
    uint64_t v12 = [MEMORY[0x1E4FB1618] whiteColor];
    complicationColor = v11->_complicationColor;
    v11->_complicationColor = (UIColor *)v12;

    v11->_videoDialSize = (CGSize)*MEMORY[0x1E4F1DB30];
    v14 = -[NTKColorCircularUtilitarianFaceViewComplicationFactory initWithFaceView:device:graphicCornerComplications:]([NTKColorCircularUtilitarianFaceViewComplicationFactory alloc], "initWithFaceView:device:graphicCornerComplications:", v11, v8, [(id)objc_opt_class() isRichComplicationsEnabled]);
    faceViewComplicationFactory = v11->_faceViewComplicationFactory;
    v11->_faceViewComplicationFactory = v14;

    v16 = [(NTKAnalogVideoFaceView *)v11 faceViewComplicationFactory];
    [v16 setDelegate:v11];

    [(NTKFaceView *)v11 setComplicationFactory:v11->_faceViewComplicationFactory];
    objc_initWeak(&location, v11);
    v17 = v11->_faceViewComplicationFactory;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __71__NTKAnalogVideoFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke;
    v23[3] = &unk_1E62C2D80;
    objc_copyWeak(&v24, &location);
    [(NTKFaceViewComplicationFactory *)v17 setForegroundColorProviderBlock:v23];
    v18 = v11->_faceViewComplicationFactory;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __71__NTKAnalogVideoFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke_2;
    v21[3] = &unk_1E62C2D80;
    objc_copyWeak(&v22, &location);
    [(NTKFaceViewComplicationFactory *)v18 setPlatterColorProviderBlock:v21];
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v11 selector:sel__faceLibraryDismissed name:@"NTKFaceLibraryDismissedNotification" object:0];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v11;
}

id __71__NTKAnalogVideoFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _complicationsForegroundColor];

  return v2;
}

id __71__NTKAnalogVideoFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _complicationsPlatterColor];

  return v2;
}

- (void)_loadSnapshotContentViews
{
  v13.receiver = self;
  v13.super_class = (Class)NTKAnalogVideoFaceView;
  [(NTKAnalogFaceView *)&v13 _loadSnapshotContentViews];
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  [(NTKAnalogVideoFaceView *)self bounds];
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  backgroundContainerView = self->_backgroundContainerView;
  self->_backgroundContainerView = v4;

  [(UIView *)self->_backgroundContainerView setAutoresizingMask:18];
  v6 = [(NTKFaceView *)self contentView];
  [v6 insertSubview:self->_backgroundContainerView atIndex:0];

  v7 = [(NTKAnalogVideoFaceView *)self faceViewComplicationFactory];
  [v7 applyComplicationContentSpecificAttributesAnimated:0 faceView:self];

  [(NTKAnalogVideoFaceView *)self setupVideoPlayerView];
  if (!self->_faceTapControl)
  {
    id v8 = (NTKFaceViewTapControl *)objc_opt_new();
    faceTapControl = self->_faceTapControl;
    self->_faceTapControl = v8;

    [(NTKFaceViewTapControl *)self->_faceTapControl addTarget:self action:sel_faceViewWasTapped_ forControlEvents:64];
    v10 = [(NTKFaceViewTapControl *)self->_faceTapControl highlightImageView];
    v11 = [(NTKAnalogVideoFaceView *)self _tapHighlightImage];
    [v10 setImage:v11];

    uint64_t v12 = [(NTKFaceView *)self contentView];
    [v12 addSubview:self->_faceTapControl];
  }
}

- (void)_unloadSnapshotContentViews
{
  v6.receiver = self;
  v6.super_class = (Class)NTKAnalogVideoFaceView;
  [(NTKAnalogFaceView *)&v6 _unloadSnapshotContentViews];
  [(UIView *)self->_backgroundContainerView removeFromSuperview];
  backgroundContainerView = self->_backgroundContainerView;
  self->_backgroundContainerView = 0;

  [(NTKVideoPlayerView *)self->_videoPlayerView removeFromSuperview];
  videoPlayerView = self->_videoPlayerView;
  self->_videoPlayerView = 0;

  [(NTKFaceViewTapControl *)self->_faceTapControl removeFromSuperview];
  faceTapControl = self->_faceTapControl;
  self->_faceTapControl = 0;
}

- (void)setNormalComplicationDisplayWrapper:(id)a3 forSlot:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogVideoFaceView;
  [(NTKFaceView *)&v4 setNormalComplicationDisplayWrapper:a3 forSlot:a4];
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  return [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory newLegacyViewForComplication:a3 family:a4 slot:a5 faceView:self];
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
  return (double)[(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory keylineStyleForComplicationSlot:a3];
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return [(NTKFaceViewComplicationFactory *)self->_faceViewComplicationFactory fadesComplicationSlot:a3 inEditMode:a4 faceView:self];
}

- (double)_minimumBreathingScaleForComplicationSlot:(id)a3
{
  [(NTKFaceViewComplicationFactory *)self->_faceViewComplicationFactory minimumBreathingScaleForComplicationSlot:a3 faceView:self];
  return result;
}

- (void)setDataMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKAnalogVideoFaceView;
  -[NTKFaceView setDataMode:](&v5, sel_setDataMode_);
  [(NTKFaceViewTapControl *)self->_faceTapControl setHighlighted:0];
  [(NTKFaceViewTapControl *)self->_faceTapControl setUserInteractionEnabled:a3 == 1];
}

- (void)_applyDataMode
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogVideoFaceView;
  [(NTKAnalogFaceView *)&v3 _applyDataMode];
  [(NTKVideoPlayerView *)self->_videoPlayerView applyDataMode:[(NTKFaceView *)self dataMode] comingFromDataMode:self->_previousDataMode];
  self->_previousDataMode = [(NTKFaceView *)self dataMode];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)NTKAnalogVideoFaceView;
  [(NTKAnalogFaceView *)&v7 layoutSubviews];
  backgroundContainerView = self->_backgroundContainerView;
  [(NTKAnalogVideoFaceView *)self bounds];
  -[UIView ntk_setBoundsAndPositionFromFrame:](backgroundContainerView, "ntk_setBoundsAndPositionFromFrame:");
  videoPlayerView = self->_videoPlayerView;
  [(NTKAnalogVideoFaceView *)self bounds];
  -[UIView ntk_setBoundsAndPositionFromFrame:](videoPlayerView, "ntk_setBoundsAndPositionFromFrame:");
  faceTapControl = self->_faceTapControl;
  [(NTKAnalogVideoFaceView *)self bounds];
  double MidX = CGRectGetMidX(v8);
  [(NTKAnalogVideoFaceView *)self bounds];
  -[NTKFaceViewTapControl setCenter:](faceTapControl, "setCenter:", MidX, CGRectGetMidY(v9));
  [(NTKFaceViewTapControl *)self->_faceTapControl sizeToFit];
}

- (void)setupVideoPlayerView
{
  objc_super v3 = [NTKVideoPlayerView alloc];
  [(NTKAnalogVideoFaceView *)self bounds];
  objc_super v4 = -[NTKVideoPlayerView initWithFrame:](v3, "initWithFrame:");
  videoPlayerView = self->_videoPlayerView;
  self->_videoPlayerView = v4;

  [(NTKVideoPlayerView *)self->_videoPlayerView setDelegate:self];
  [(NTKVideoPlayerView *)self->_videoPlayerView setVideoPlayerResizeGravity:0];
  [(NTKVideoPlayerView *)self->_videoPlayerView setShouldApplyVideoInsetToPosterImage:1];
  [(UIView *)self->_backgroundContainerView addSubview:self->_videoPlayerView];
  [(NTKAnalogVideoFaceView *)self sendSubviewToBack:self->_backgroundContainerView];
  [(NTKAnalogVideoFaceView *)self _customizeVideoPlayerOnSetup];
}

- (void)_setVideoPlayerDataSource:(id)a3
{
  id v9 = a3;
  objc_super v4 = [(NTKAnalogVideoFaceView *)self videoPlayerView];
  id v5 = [v4 dataSource];

  if (v5 != v9)
  {
    objc_super v6 = [(NTKAnalogVideoFaceView *)self videoPlayerView];
    [v6 setDataSource:v9];

    objc_super v7 = [(NTKAnalogVideoFaceView *)self videoPlayerView];
    CGRect v8 = [v9 posterImage];
    [v7 setPosterImage:v8];
  }
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogVideoFaceView;
  [(NTKFaceView *)&v3 _applyFrozen];
  [(NTKVideoPlayerView *)self->_videoPlayerView applyFrozen:[(NTKFaceView *)self isFrozen]];
}

- (void)_applySlow
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogVideoFaceView;
  [(NTKFaceView *)&v3 _applySlow];
  [(NTKVideoPlayerView *)self->_videoPlayerView applySlow:[(NTKFaceView *)self isSlow]];
}

- (void)_prepareForOrb
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogVideoFaceView;
  [(NTKFaceView *)&v3 _prepareForOrb];
  [(NTKVideoPlayerView *)self->_videoPlayerView applyOrbing:1];
}

- (void)_cleanupAfterOrb:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogVideoFaceView;
  [(NTKFaceView *)&v4 _cleanupAfterOrb:a3];
  [(NTKVideoPlayerView *)self->_videoPlayerView applyOrbing:0];
}

- (void)_handleWristRaiseScreenWake
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogVideoFaceView;
  [(NTKFaceView *)&v3 _handleWristRaiseScreenWake];
  [(NTKAnalogVideoFaceView *)self _handleEitherScreenWake];
  [(NTKVideoPlayerView *)self->_videoPlayerView handleWristRaiseScreenWake];
}

- (void)_handleOrdinaryScreenWake
{
  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogVideoFaceView;
  [(NTKFaceView *)&v3 _handleOrdinaryScreenWake];
  [(NTKAnalogVideoFaceView *)self _handleEitherScreenWake];
  [(NTKVideoPlayerView *)self->_videoPlayerView handleOrdinaryScreenWake];
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogVideoFaceView;
  [(NTKFaceView *)&v4 screenDidTurnOffAnimated:a3];
  [(NTKAnalogVideoFaceView *)self _tearDownTransitioningView:0];
  [(NTKVideoPlayerView *)self->_videoPlayerView handleScreenOff];
}

- (void)faceViewWasTapped:(id)a3
{
  if ([(NTKAnalogVideoFaceView *)self _shouldAnimateComplicationsOnTap])
  {
    objc_super v4 = [(NTKAnalogVideoFaceView *)self _complicationsTapColor];
    complicationColor = self->_complicationColor;
    self->_complicationColor = v4;

    objc_super v6 = [(NTKAnalogVideoFaceView *)self faceViewComplicationFactory];
    [v6 applyComplicationContentSpecificAttributesAnimated:1 faceView:self];
  }
  [(NTKVideoPlayerView *)self->_videoPlayerView videoPlayerViewWasTapped];
  [(NTKAnalogVideoFaceView *)self _faceViewWasTapped];
}

- (id)_tapHighlightImage
{
  v2 = [(NTKFaceView *)self device];
  objc_super v3 = NTKNoHighlightDialTapImage(v2);

  return v3;
}

- (void)_configureTimeView:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKAnalogVideoFaceView;
  id v3 = a3;
  [(NTKAnalogFaceView *)&v8 _configureTimeView:v3];
  objc_super v4 = objc_msgSend(v3, "minuteHandView", v8.receiver, v8.super_class);
  id v5 = [MEMORY[0x1E4FB1618] blackColor];
  [v4 setHandDotColor:v5];

  objc_super v6 = [v3 secondHandView];

  objc_super v7 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [v6 setColor:v7];
}

- (unint64_t)_layoutStyleForSlot:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKFaceView *)self device];
  if ([v5 deviceCategory] == 1)
  {

LABEL_5:
    unint64_t v7 = 0;
    goto LABEL_6;
  }
  char v6 = [v4 isEqualToString:@"bottom-center"];

  if ((v6 & 1) == 0) {
    goto LABEL_5;
  }
  unint64_t v7 = 1;
LABEL_6:

  return v7;
}

- (void)_curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8
{
  id v16 = a8;
  if ([(NTKAnalogVideoFaceView *)self _layoutStyleForSlot:"_layoutStyleForSlot:"] == 1)
  {
    int64_t v14 = [(NTKAnalogVideoFaceView *)self _utilitySlotForSlot:v16];
    v15 = [(NTKFaceView *)self device];
    +[NTKUtilityComplicationFactory curvedCircleRadius:a3 centerAngle:a4 maxAngularWidth:a5 circleCenter:a6 interior:a7 forSlot:v14 forDevice:v15];
  }
}

- (CGPoint)_contentCenterOffset
{
  if ([(id)objc_opt_class() isRichComplicationsEnabled])
  {
    double v3 = *MEMORY[0x1E4F1DAD8];
    double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    id v5 = [(NTKFaceView *)self delegate];
    char v6 = [v5 faceViewComplicationIsEmptyForSlot:@"bottom-center"];

    unint64_t v7 = [(NTKFaceView *)self _complicationSlotsHiddenByCurrentConfiguration];
    char v8 = [v7 containsObject:@"bottom-center"];

    id v9 = [(NTKFaceView *)self device];
    double v10 = _LayoutConstants_12(v9);
    double v12 = v11;
    double v3 = v13;
    double v4 = v14;

    if ((v6 & 1) == 0 && (v8 & 1) == 0)
    {
      double v3 = v10;
      double v4 = v12;
    }
  }
  double v15 = v3;
  double v16 = v4;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)_faceLibraryDismissed
{
  [(NTKVideoPlayerView *)self->_videoPlayerView faceLibraryWasDismissed];
  id v3 = [(NTKAnalogVideoFaceView *)self faceViewComplicationFactory];
  [v3 applyComplicationContentSpecificAttributesAnimated:1 faceView:self];
}

- (id)_complicationsPlatterColor
{
  v2 = [(NTKAnalogVideoFaceView *)self _complicationsForegroundColor];
  id v3 = NTKColorByPremultiplyingAlpha(v2, 0.15);

  return v3;
}

- (id)_complicationsCompanionForegroundColor
{
  return self->_complicationColor;
}

- (id)_complicationsEditingColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

- (id)_complicationsTapColor
{
  return (id)[MEMORY[0x1E4FB1618] grayColor];
}

- (BOOL)_shouldAnimateComplicationsOnTap
{
  return 1;
}

- (void)_prepareForEditing
{
  v7.receiver = self;
  v7.super_class = (Class)NTKAnalogVideoFaceView;
  [(NTKAnalogFaceView *)&v7 _prepareForEditing];
  id v3 = [(NTKAnalogVideoFaceView *)self faceViewComplicationFactory];
  [v3 prepareForEditingForFaceView:self];

  [(NTKAnalogVideoFaceView *)self _setupTransitioningViewIfNeeded:1];
  [(NTKFaceView *)self _applyEditConfigurationsWithForce:1];
  [(NTKVideoPlayerView *)self->_videoPlayerView transitionToEditing];
  double v4 = [(NTKFaceView *)self device];
  [v4 screenCornerRadius];
  double v6 = v5;

  NTKApplyViewCornerRadius(self, v6);
}

- (void)_cleanupAfterEditing
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogVideoFaceView;
  [(NTKAnalogFaceView *)&v4 _cleanupAfterEditing];
  id v3 = [(NTKAnalogVideoFaceView *)self faceViewComplicationFactory];
  [v3 cleanupAfterEditingForFaceView:self];

  [(NTKAnalogVideoFaceView *)self _tearDownTransitioningView:0];
  NTKApplyViewCornerRadius(self, 0.0);
}

- (void)_cleanupAfterTransitionComplicationSlot:(id)a3 selectedComplication:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", @"bottom-center", a4))
  {
    double v5 = [(NTKFaceView *)self delegate];
    [v5 faceViewWantsCustomKeylineFramesReloadedForEditMode:12];

    id v6 = [(NTKFaceView *)self delegate];
    [v6 faceViewWantsCustomKeylineFramesReloadedForEditMode:15];
  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  transitioningView = self->_transitioningView;
  if (transitioningView) {
    -[NTKEditOptionTransitioningView setOption:](transitioningView, "setOption:", a3, a4, a5);
  }
  faceViewComplicationFactory = self->_faceViewComplicationFactory;
  -[NTKColorCircularUtilitarianFaceViewComplicationFactory applyComplicationContentSpecificAttributesAnimated:faceView:](faceViewComplicationFactory, "applyComplicationContentSpecificAttributesAnimated:faceView:", 0, self, a5);
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
}

- (void)_cleanupAfterTransitionToOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  BOOL v8 = [(NTKFaceView *)self editing];
  if (a4 && !a5 && v8) {
    [(NTKAnalogVideoFaceView *)self _tearDownTransitioningView:0];
  }
  id v9 = [(NTKFaceView *)self timeView];
  [(NTKAnalogVideoFaceView *)self _handAlphaForEditMode:a4];
  [(NTKAnalogVideoFaceView *)self _handAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v9, "setAlpha:");

  double v10 = [(NTKFaceView *)self foregroundContainerView];
  [(NTKAnalogVideoFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKAnalogVideoFaceView *)self _complicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v10, "setAlpha:");

  transitioningView = self->_transitioningView;
  [(NTKAnalogVideoFaceView *)self _contentAlphaForEditMode:a4];
  [(NTKAnalogVideoFaceView *)self _contentAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  -[NTKEditOptionTransitioningView setDimmingAlpha:](transitioningView, "setDimmingAlpha:");
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  double v8 = NTKAlphaForRubberBandingFraction(a3);
  [(NTKAnalogVideoFaceView *)self _contentAlphaForEditMode:a4];
  [(NTKEditOptionTransitioningView *)self->_transitioningView setDimmingAlpha:v8 * v9];
  transitioningView = self->_transitioningView;
  [(NTKEditOptionTransitioningView *)transitioningView setRubberBandingFraction:a3];
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

- (id)imageForEditOption:(id)a3
{
  return 0;
}

- (BOOL)shouldFadeIncomingView
{
  return 1;
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKFaceView *)self device];
  if ([v5 deviceCategory] == 1)
  {

LABEL_7:
    int64_t v7 = 0;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"top-left"])
  {
  }
  else
  {
    char v6 = [v4 isEqualToString:@"top-right"];

    if ((v6 & 1) == 0) {
      goto LABEL_7;
    }
  }
  int64_t v7 = 1;
LABEL_8:

  return v7;
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(id)objc_opt_class() isRichComplicationsEnabled]
    && (([v6 isEqualToString:@"top-left"] & 1) != 0
     || [v6 isEqualToString:@"top-right"]))
  {
    int64_t v7 = [(NTKAnalogVideoFaceView *)self faceViewComplicationFactory];
    [v7 keylineFrameForCornerComplicationSlot:v6 selected:v4];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)NTKAnalogVideoFaceView;
    [(NTKFaceView *)&v24 _keylineFrameForComplicationSlot:v6 selected:v4];
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
    double v15 = v19;
  }

  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  double v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)_supportsUnadornedSnapshot
{
  return 0;
}

- (void)customizeFaceViewForListing:(id)a3 changeEvent:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  double v16 = v8;
  if (a4 != 2
    || (BOOL v9 = [(NTKAnalogVideoFaceView *)self _shouldAnimateComplicationsOnTap],
        id v8 = v16,
        !v9))
  {
    uint64_t v10 = [v8 color];
    id v8 = v16;
    if (v10)
    {
      double v11 = (void *)v10;
      complicationColor = self->_complicationColor;
      double v13 = [v16 color];

      id v8 = v16;
      if (complicationColor != v13)
      {
        double v14 = [v16 color];
        double v15 = self->_complicationColor;
        self->_complicationColor = v14;

        [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory applyComplicationContentSpecificAttributesAnimated:v5 faceView:self];
        id v8 = v16;
      }
    }
  }
}

- (void)_transformVideoPlayerView:(unint64_t)a3
{
  if (a3 == 2)
  {
    id v8 = objc_msgSend(&unk_1F16E9AD8, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(&unk_1F16E9AD8, "count")));
    [v8 floatValue];

    BOOL v5 = [(NTKAnalogVideoFaceView *)self videoPlayerView];
    CLKDegreesToRadians();
    CGAffineTransformMakeRotation(&v11, v9);
    int64_t v7 = &v11;
LABEL_9:
    BOOL v4 = v5;
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    if (_transformVideoPlayerView__onceToken != -1) {
      dispatch_once(&_transformVideoPlayerView__onceToken, &__block_literal_global_42);
    }
    *(void *)&v13[0] = 0;
    uint64_t v10 = +[NTKDate faceDate];
    NTKHourMinuteSecondAnglesForTime(0, 0, v13, v10, _transformVideoPlayerView___calendar);

    BOOL v5 = [(NTKAnalogVideoFaceView *)self videoPlayerView];
    CGAffineTransformMakeRotation(&v12, *(CGFloat *)v13);
    int64_t v7 = &v12;
    goto LABEL_9;
  }
  if (a3) {
    return;
  }
  BOOL v4 = [(NTKAnalogVideoFaceView *)self videoPlayerView];
  BOOL v5 = v4;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v13[0] = *MEMORY[0x1E4F1DAB8];
  v13[1] = v6;
  v13[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  int64_t v7 = (CGAffineTransform *)v13;
LABEL_10:
  [v4 setVideoPlayerTransform:v7];
}

void __52__NTKAnalogVideoFaceView__transformVideoPlayerView___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  v1 = (void *)_transformVideoPlayerView___calendar;
  _transformVideoPlayerView___calendar = v0;
}

- (void)setVideoDialSize:(CGSize)a3
{
  p_videoDialSize = &self->_videoDialSize;
  self->_videoDialSize = a3;
  id v5 = [(NTKAnalogVideoFaceView *)self videoPlayerView];
  -[NTKAnalogVideoFaceView _insetsForDialSize:](self, "_insetsForDialSize:", p_videoDialSize->width, p_videoDialSize->height);
  objc_msgSend(v5, "setVideoPlayerInset:");
}

- (UIEdgeInsets)_insetsForDialSize:(CGSize)a3
{
  if (a3.width == 0.0)
  {
    double v3 = *MEMORY[0x1E4FB2848];
    double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    double width = a3.width;
    id v8 = [(NTKFaceView *)self device];
    [v8 screenBounds];
    double v10 = v9;

    double v3 = (v10 - width) * 0.5;
    double v4 = v3;
    double v5 = v3;
    double v6 = v3;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (int64_t)_utilitySlotForSlot:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"top-left"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"top-right"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"bottom-left"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"bottom-right"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"bottom-center"])
  {
    int64_t v4 = 10;
  }
  else if ([v3 isEqualToString:@"date"])
  {
    int64_t v4 = 12;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (id)_slotForUtilitySlot:(int64_t)a3
{
  int64_t v4 = a3 - 1;
  if (unint64_t)(a3 - 1) <= 0xB && ((0xA0Fu >> v4))
  {
    double v5 = *off_1E62C2DA0[v4];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

- (double)_handAlphaForEditMode:(int64_t)a3
{
  double result = 0.2;
  if (!a3) {
    return 1.0;
  }
  return result;
}

- (double)_contentAlphaForEditMode:(int64_t)a3
{
  double result = 0.2;
  if (a3 != 1) {
    return 1.0;
  }
  return result;
}

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  double result = 0.2;
  if ((unint64_t)a3 < 2) {
    return 1.0;
  }
  return result;
}

- (NTKVideoPlayerView)videoPlayerView
{
  return self->_videoPlayerView;
}

- (void)setVideoPlayerView:(id)a3
{
}

- (NTKColorCircularUtilitarianFaceViewComplicationFactory)faceViewComplicationFactory
{
  return self->_faceViewComplicationFactory;
}

- (void)setFaceViewComplicationFactory:(id)a3
{
}

- (NTKFaceViewTapControl)faceTapControl
{
  return self->_faceTapControl;
}

- (void)setFaceTapControl:(id)a3
{
}

- (CGSize)videoDialSize
{
  double width = self->_videoDialSize.width;
  double height = self->_videoDialSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceTapControl, 0);
  objc_storeStrong((id *)&self->_faceViewComplicationFactory, 0);
  objc_storeStrong((id *)&self->_videoPlayerView, 0);
  objc_storeStrong((id *)&self->_burnInStudyPosterImageView, 0);
  objc_storeStrong((id *)&self->_transitioningView, 0);
  objc_storeStrong((id *)&self->_backgroundContainerView, 0);
  objc_storeStrong((id *)&self->_complicationColor, 0);
}

+ (BOOL)isRichComplicationsEnabled
{
  return 0;
}

@end