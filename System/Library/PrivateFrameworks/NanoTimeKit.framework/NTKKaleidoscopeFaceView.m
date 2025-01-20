@interface NTKKaleidoscopeFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (BOOL)_isEditOptionFullscreen:(id)a3;
- (BOOL)_supportsUnadornedSnapshot;
- (BOOL)_wantsStatusBarIconShadow;
- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (NTKKaleidoscopeFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (UIColor)complicationColor;
- (double)_complicationAlphaForEditMode:(int64_t)a3;
- (double)_contentAlphaForEditMode:(int64_t)a3;
- (double)_handAlphaForEditMode:(int64_t)a3;
- (double)_kaleidoscopeTime;
- (double)_verticalPaddingForStatusBar;
- (float)_crownTurnsForStyle:(unint64_t)a3;
- (id)_imageForAsset:(unint64_t)a3;
- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (id)_newComplicationFactoryForDevice:(id)a3;
- (id)_pathfinderForAsset:(unint64_t)a3;
- (id)_quadWithStyle:(unint64_t)a3 asset:(unint64_t)a4;
- (id)_snapshotWithAsset:(unint64_t)a3 style:(unint64_t)a4 size:(CGSize)a5;
- (id)_swatchForAsset:(unint64_t)a3;
- (id)_swatchFromUserImage;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)_textureChromaForAsset:(unint64_t)a3;
- (id)_textureLumaForAsset:(unint64_t)a3;
- (id)_updatePathForQuadView:(id)a3 time:(double)a4 crownOffset:(double)a5;
- (id)provideAtlasBacking:(id)a3;
- (id)resourceProviderKey;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (unint64_t)_layoutStyleForSlot:(id)a3;
- (unint64_t)currentAsset;
- (unint64_t)currentStyle;
- (void)_applyDataMode;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_cleanupAfterTransitionComplicationSlot:(id)a3 selectedComplication:(id)a4;
- (void)_cleanupAfterZoom;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_configureTimeView:(id)a3;
- (void)_curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8;
- (void)_disableCrown;
- (void)_enableCrown;
- (void)_loadCurrentQuad;
- (void)_loadSnapshotContentViews;
- (void)_prepareForEditing;
- (void)_prepareToZoom;
- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)_unloadSnapshotContentViews;
- (void)_updateComplicationColors;
- (void)_updateDayDuration;
- (void)_updateForResourceDirectoryChange:(id)a3;
- (void)_updateFramerate;
- (void)_updatePathForTime:(double)a3;
- (void)_updateRotationForQuadView:(id)a3 time:(double)a4 crownOffset:(double)a5;
- (void)_updateUserContent;
- (void)_updateWithAsset:(unint64_t)a3;
- (void)dealloc;
- (void)quadViewWillDisplay:(id)a3 forTime:(double)a4;
- (void)setComplicationColor:(id)a3;
- (void)setCurrentAsset:(unint64_t)a3;
- (void)setCurrentStyle:(unint64_t)a3;
@end

@implementation NTKKaleidoscopeFaceView

- (id)_newComplicationFactoryForDevice:(id)a3
{
  id v4 = a3;
  id v5 = [[NTKColorCircularUtilitarianFaceViewComplicationFactory alloc] initForDevice:v4];

  [v5 setFaceView:self];
  return v5;
}

- (NTKKaleidoscopeFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v31.receiver = self;
  v31.super_class = (Class)NTKKaleidoscopeFaceView;
  v10 = [(NTKAnalogFaceView *)&v31 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:v9];
  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    loadedAssets = v10->_loadedAssets;
    v10->_loadedAssets = (NSMutableSet *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:5 valueOptions:0 capacity:2];
    quadPathfinderMapTable = v10->_quadPathfinderMapTable;
    v10->_quadPathfinderMapTable = (NSMapTable *)v13;

    v10->_extendedSRGBcolorSpace = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DBE8]);
    uint64_t v15 = objc_opt_new();
    resourceProviderKey = v10->_resourceProviderKey;
    v10->_resourceProviderKey = (CLKUIResourceProviderKey *)v15;

    uint64_t v17 = [(NTKKaleidoscopeFaceView *)v10 _newComplicationFactoryForDevice:v8];
    faceViewComplicationFactory = v10->_faceViewComplicationFactory;
    v10->_faceViewComplicationFactory = (NTKColorCircularUtilitarianFaceViewComplicationFactory *)v17;

    [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)v10->_faceViewComplicationFactory setDelegate:v10];
    objc_initWeak(&location, v10);
    v19 = v10->_faceViewComplicationFactory;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __72__NTKKaleidoscopeFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke;
    v28[3] = &unk_1E62C2D80;
    objc_copyWeak(&v29, &location);
    [(NTKFaceViewComplicationFactory *)v19 setForegroundColorProviderBlock:v28];
    v20 = v10->_faceViewComplicationFactory;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __72__NTKKaleidoscopeFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke_2;
    v26[3] = &unk_1E62C2D80;
    objc_copyWeak(&v27, &location);
    [(NTKFaceViewComplicationFactory *)v20 setPlatterColorProviderBlock:v26];
    [(NTKFaceView *)v10 setComplicationFactory:v10->_faceViewComplicationFactory];
    v10->_currentAsset = 0x7FFFFFFFFFFFFFFFLL;
    v10->_currentStyle = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v21 = [MEMORY[0x1E4FB1618] whiteColor];
    complicationColor = v10->_complicationColor;
    v10->_complicationColor = (UIColor *)v21;

    uint64_t v23 = NTKColorByPremultiplyingAlpha(v10->_complicationColor, 0.15);
    complicationPlatterColor = v10->_complicationPlatterColor;
    v10->_complicationPlatterColor = (UIColor *)v23;

    NTKImageNamed(@"Kaleidoscope-NoContent");
  }

  return 0;
}

id __72__NTKKaleidoscopeFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[134];
  }
  else
  {
    id v3 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  id v4 = v3;

  return v4;
}

id __72__NTKKaleidoscopeFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained) {
    CLKUIDefaultComplicationBackgroundColor();
  }
  id v3 = WeakRetained[115];

  return v3;
}

- (void)dealloc
{
  userTextureLuma = self->_userTextureLuma;
  self->_userTextureLuma = 0;

  userTextureChroma = self->_userTextureChroma;
  self->_userTextureChroma = 0;

  [(CLKUIQuadView *)self->_quadView removeAllQuads];
  [(NSMapTable *)self->_quadPathfinderMapTable removeAllObjects];
  id v5 = [off_1E62BDB88 sharedInstance];
  [v5 purgeAllUnused];

  CGColorSpaceRelease(self->_extendedSRGBcolorSpace);
  v6.receiver = self;
  v6.super_class = (Class)NTKKaleidoscopeFaceView;
  [(NTKAnalogFaceView *)&v6 dealloc];
}

- (void)setCurrentAsset:(unint64_t)a3
{
  if (self->_currentAsset != a3)
  {
    self->_currentAsset = a3;
    -[NTKKaleidoscopeFaceView _updateWithAsset:](self, "_updateWithAsset:");
  }
}

- (void)setCurrentStyle:(unint64_t)a3
{
  if (self->_currentStyle != a3)
  {
    self->_currentStyle = a3;
    -[NTKKaleidoscopeFaceView _crownTurnsForStyle:](self, "_crownTurnsForStyle:");
    self->_crownTurnsPerRotation = v4;
    [(NTKKaleidoscopeFaceView *)self _loadCurrentQuad];
  }
}

- (void)_loadCurrentQuad
{
  if (self->_currentAsset != 0x7FFFFFFFFFFFFFFFLL && self->_currentStyle != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(CLKUIQuadView *)self->_quadView removeAllQuads];
    id v3 = [(NTKKaleidoscopeFaceView *)self _quadWithStyle:self->_currentStyle asset:self->_currentAsset];
    [v3 setOpaque:1];
    [(CLKUIQuadView *)self->_quadView addQuad:v3];
    [(NTKKaleidoscopeFaceView *)self _kaleidoscopeTime];
    -[NTKKaleidoscopeFaceView _updatePathForTime:](self, "_updatePathForTime:");
    [(NTKKaleidoscopeFaceView *)self _updateComplicationColors];
  }
}

- (void)_updateWithAsset:(unint64_t)a3
{
  if (a3 == 1000 && (!self->_userTextureLuma || !self->_userTextureChroma)) {
    [(NTKKaleidoscopeFaceView *)self _updateUserContent];
  }

  [(NTKKaleidoscopeFaceView *)self _loadCurrentQuad];
}

- (void)_loadSnapshotContentViews
{
  v23.receiver = self;
  v23.super_class = (Class)NTKKaleidoscopeFaceView;
  [(NTKAnalogFaceView *)&v23 _loadSnapshotContentViews];
  [(NTKKaleidoscopeFaceView *)self bounds];
  objc_msgSend(off_1E62BDB80, "quadViewWithFrame:identifier:", @"Klei");
  id v3 = (CLKUIQuadView *)objc_claimAutoreleasedReturnValue();
  quadView = self->_quadView;
  self->_quadView = v3;

  [(CLKUIQuadView *)self->_quadView setOpaque:1];
  id v5 = self->_quadView;
  objc_super v6 = [MEMORY[0x1E4FB1618] blackColor];
  [(CLKUIQuadView *)v5 setBackgroundColor:v6];

  v7 = [(NTKFaceView *)self contentView];
  [v7 addSubview:self->_quadView];

  [(NTKKaleidoscopeFaceView *)self _updateWithAsset:self->_currentAsset];
  id v8 = [(NTKFaceView *)self device];
  uint64_t v9 = [v8 deviceCategory];

  if (v9 != 1)
  {
    v10 = [NTKRoundedCornerOverlayView alloc];
    [(NTKKaleidoscopeFaceView *)self bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    v19 = [(NTKFaceView *)self device];
    v20 = -[NTKRoundedCornerOverlayView initWithFrame:forDeviceCornerRadius:](v10, "initWithFrame:forDeviceCornerRadius:", v19, v12, v14, v16, v18);
    cornerView = self->_cornerView;
    self->_cornerView = v20;

    v22 = [(NTKFaceView *)self contentView];
    [v22 insertSubview:self->_cornerView aboveSubview:self->_quadView];
  }
}

- (void)_unloadSnapshotContentViews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKKaleidoscopeFaceView;
  [(NTKAnalogFaceView *)&v5 _unloadSnapshotContentViews];
  [(CLKUIQuadView *)self->_quadView removeFromSuperview];
  quadView = self->_quadView;
  self->_quadView = 0;

  [(NTKRoundedCornerOverlayView *)self->_cornerView removeFromSuperview];
  cornerView = self->_cornerView;
  self->_cornerView = 0;
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKKaleidoscopeFaceView;
  id v6 = a4;
  [(NTKFaceView *)&v7 _renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v6];
  -[CLKUIQuadView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_quadView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6, v7.receiver, v7.super_class);
}

- (void)_applyFrozen
{
  v3.receiver = self;
  v3.super_class = (Class)NTKKaleidoscopeFaceView;
  [(NTKFaceView *)&v3 _applyFrozen];
  [(CLKUIQuadView *)self->_quadView setPaused:[(NTKFaceView *)self isFrozen]];
}

- (void)_applyDataMode
{
  v5.receiver = self;
  v5.super_class = (Class)NTKKaleidoscopeFaceView;
  [(NTKAnalogFaceView *)&v5 _applyDataMode];
  [(NTKKaleidoscopeFaceView *)self _kaleidoscopeTime];
  double v4 = v3;
  -[NTKKaleidoscopeFaceView _updatePathForTime:](self, "_updatePathForTime:");
  [(NTKKaleidoscopeFaceView *)self _updateRotationForQuadView:self->_quadView time:v4 crownOffset:self->_crownOffset];
  [(NTKKaleidoscopeFaceView *)self _updateComplicationColors];
  [(NTKFaceView *)self dataMode];
}

- (void)_enableCrown
{
  v2.receiver = self;
  v2.super_class = (Class)NTKKaleidoscopeFaceView;
  [(NTKFaceView *)&v2 _enableCrown];
}

- (void)_disableCrown
{
  v2.receiver = self;
  v2.super_class = (Class)NTKKaleidoscopeFaceView;
  [(NTKFaceView *)&v2 _disableCrown];
}

- (void)quadViewWillDisplay:(id)a3 forTime:(double)a4
{
  ++self->_frameCounter;
  [(NTKKaleidoscopeFaceView *)self _kaleidoscopeTime];
  double v6 = v5;
  -[NTKKaleidoscopeFaceView _updatePathForTime:](self, "_updatePathForTime:");
  [(NTKKaleidoscopeFaceView *)self _updateRotationForQuadView:self->_quadView time:v6 crownOffset:self->_crownOffset];
  if (v6 - self->_lastComplicationUpdateTime > 300.0 && -858993459 * self->_frameCounter <= 0x33333333)
  {
    self->_lastComplicationUpdateTime = v6;
    [(NTKKaleidoscopeFaceView *)self _updateComplicationColors];
  }
}

- (double)_kaleidoscopeTime
{
  return 0.0;
}

- (void)_configureTimeView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKKaleidoscopeFaceView;
  id v3 = a3;
  [(NTKAnalogFaceView *)&v5 _configureTimeView:v3];
  double v4 = objc_msgSend(v3, "secondHandView", v5.receiver, v5.super_class);

  if (_NTKKaleidoscopeSecondHandColor_onceToken != -1) {
    dispatch_once(&_NTKKaleidoscopeSecondHandColor_onceToken, &__block_literal_global_377);
  }
  [v4 setColor:_NTKKaleidoscopeSecondHandColor___color];
}

- (unint64_t)_layoutStyleForSlot:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NTKFaceView *)self device];
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
  id v14 = a8;
  if ([(NTKKaleidoscopeFaceView *)self _layoutStyleForSlot:"_layoutStyleForSlot:"] == 1) {
    [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory curvedCircleRadius:a3 centerAngle:a4 maxAngularWidth:a5 circleCenter:a6 interior:a7 forSlot:v14];
  }
}

- (double)_verticalPaddingForStatusBar
{
  objc_super v2 = [(NTKFaceView *)self device];
  _LayoutConstants_41(v2, (uint64_t)v5);
  double v3 = v6;

  return v3;
}

- (BOOL)_wantsStatusBarIconShadow
{
  objc_super v2 = [(NTKFaceView *)self optionForCustomEditMode:15 slot:0];
  BOOL v3 = [v2 style] == 3;

  return v3;
}

- (void)_prepareForEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKKaleidoscopeFaceView;
  [(NTKAnalogFaceView *)&v3 _prepareForEditing];
  [(NSMutableSet *)self->_loadedAssets removeAllObjects];
}

- (void)_cleanupAfterEditing
{
  v3.receiver = self;
  v3.super_class = (Class)NTKKaleidoscopeFaceView;
  [(NTKAnalogFaceView *)&v3 _cleanupAfterEditing];
  objc_super v2 = [off_1E62BDB88 sharedInstance];
  [v2 purgeAllUnused];
}

- (void)_cleanupAfterTransitionComplicationSlot:(id)a3 selectedComplication:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", @"bottom-center", a4))
  {
    objc_super v5 = [(NTKFaceView *)self delegate];
    [v5 faceViewWantsCustomKeylineFramesReloadedForEditMode:12];

    id v6 = [(NTKFaceView *)self delegate];
    [v6 faceViewWantsCustomKeylineFramesReloadedForEditMode:15];
  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  if (a4 == 15)
  {
    -[NTKKaleidoscopeFaceView setCurrentStyle:](self, "setCurrentStyle:", [v10 style]);
    uint64_t v9 = [(NTKFaceView *)self delegate];
    [v9 faceViewDidChangeWantsStatusBarIconShadow];
  }
  else if (a4 == 12)
  {
    -[NTKKaleidoscopeFaceView setCurrentAsset:](self, "setCurrentAsset:", [v10 asset]);
  }
}

- (BOOL)_isEditOptionFullscreen:(id)a3
{
  return [a3 style] == 3;
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v24 = a4;
  id v12 = a5;
  id v13 = a7;
  if (a6 == 15)
  {
    p_quadView = &self->_quadView;
    [(CLKUIQuadView *)self->_quadView removeAllQuads];
    [(NSMapTable *)self->_quadPathfinderMapTable removeAllObjects];
    double v17 = -[NTKKaleidoscopeFaceView _quadWithStyle:asset:](self, "_quadWithStyle:asset:", [v24 style], self->_currentAsset);
    v20 = -[NTKKaleidoscopeFaceView _quadWithStyle:asset:](self, "_quadWithStyle:asset:", [v12 style], self->_currentAsset);
    BOOL v21 = [(NTKKaleidoscopeFaceView *)self _isEditOptionFullscreen:v24];
    double v22 = 1.0 - a3;
    if (v21)
    {
      a3 = 1.0 - a3;
      double v18 = v17;
    }
    else
    {
      double v18 = v20;
    }
    if (v21) {
      objc_super v23 = v20;
    }
    else {
      objc_super v23 = v17;
    }
    *(float *)&double v22 = a3;
    [v18 setAlpha:v22];
    [v18 setOpaque:a3 >= 1.0];
    [v23 setOpaque:1];
    [(CLKUIQuadView *)*p_quadView addQuad:v23];
  }
  else
  {
    if (a6 != 12) {
      goto LABEL_12;
    }
    uint64_t v14 = [v24 asset];
    uint64_t v15 = [v12 asset];
    p_quadView = &self->_quadView;
    [(CLKUIQuadView *)self->_quadView removeAllQuads];
    [(NSMapTable *)self->_quadPathfinderMapTable removeAllObjects];
    double v17 = [(NTKKaleidoscopeFaceView *)self _quadWithStyle:self->_currentStyle asset:v14];
    [v17 setOpaque:1];
    [(CLKUIQuadView *)self->_quadView addQuad:v17];
    double v18 = [(NTKKaleidoscopeFaceView *)self _quadWithStyle:self->_currentStyle asset:v15];
    *(float *)&double v19 = a3;
    [v18 setAlpha:v19];
    v20 = v18;
  }
  [(CLKUIQuadView *)*p_quadView addQuad:v18];

LABEL_12:
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  id v8 = [(NTKFaceView *)self timeView];
  [(NTKKaleidoscopeFaceView *)self _handAlphaForEditMode:a4];
  [(NTKKaleidoscopeFaceView *)self _handAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v8, "setAlpha:");

  uint64_t v9 = [(NTKFaceView *)self contentView];
  [(NTKKaleidoscopeFaceView *)self _contentAlphaForEditMode:a4];
  [(NTKKaleidoscopeFaceView *)self _contentAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v9, "setAlpha:");

  id v10 = [(NTKFaceView *)self contentView];
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v13[0] = *MEMORY[0x1E4F1DAB8];
  v13[1] = v11;
  v13[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v10 setTransform:v13];

  id v12 = [(NTKFaceView *)self foregroundContainerView];
  [(NTKKaleidoscopeFaceView *)self _complicationAlphaForEditMode:a4];
  [(NTKKaleidoscopeFaceView *)self _complicationAlphaForEditMode:a5];
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v12, "setAlpha:");
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)NTKKaleidoscopeFaceView;
  -[NTKFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v11, sel__applyRubberBandingFraction_forCustomEditMode_slot_, a4, a5);
  if (a4 == 15 || a4 == 12)
  {
    id v8 = [(NTKFaceView *)self contentView];
    [v8 setAlpha:NTKAlphaForRubberBandingFraction(a3)];
    double v9 = NTKScaleForRubberBandingFraction(a3);
    CGAffineTransformMakeScale(&v10, v9, v9);
    [v8 setTransform:&v10];
  }
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  if (a3 == 15 || a3 == 12)
  {
    unint64_t v7 = [(NTKFaceView *)self device];
    if ([v7 deviceCategory] == 1)
    {
      [(NTKFaceView *)self _faceEditingScaleForEditMode:a3 slot:v6];
      double v9 = v8;
      _LayoutConstants_41(v7, (uint64_t)v13);
      uint64_t v10 = NTKKeylineViewWithCircle(v13[0], v9);
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)NTKKaleidoscopeFaceView;
      uint64_t v10 = [(NTKFaceView *)&v14 _keylineViewForCustomEditMode:a3 slot:v6];
    }
    objc_super v11 = (void *)v10;
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6 = a4;
  unint64_t v7 = [(NTKFaceView *)self device];
  uint64_t v8 = [v7 deviceCategory];

  if (v8 == 1 && (a3 == 15 || a3 == 12))
  {
    double v9 = [(NTKFaceView *)self device];
    _LayoutConstants_41(v9, (uint64_t)v29);

    uint64_t v10 = [(NTKFaceView *)self timeView];
    [v10 center];
    objc_super v11 = [(NTKFaceView *)self device];
    CLKRectCenteredAboutPointForDevice();
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)NTKKaleidoscopeFaceView;
    [(NTKFaceView *)&v28 _relativeKeylineFrameForCustomEditMode:a3 slot:v6];
    double v13 = v20;
    double v15 = v21;
    double v17 = v22;
    double v19 = v23;
  }

  double v24 = v13;
  double v25 = v15;
  double v26 = v17;
  double v27 = v19;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  return [(NTKColorCircularUtilitarianFaceViewComplicationFactory *)self->_faceViewComplicationFactory keylineStyleForComplicationSlot:a3];
}

- (BOOL)_supportsUnadornedSnapshot
{
  return 0;
}

- (void)_updateForResourceDirectoryChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKKaleidoscopeFaceView;
  [(NTKFaceView *)&v4 _updateForResourceDirectoryChange:a3];
  [(NTKKaleidoscopeFaceView *)self _updateUserContent];
  [(NTKFaceView *)self reloadSnapshotContentViews];
}

- (id)provideAtlasBacking:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"Kaleidoscope-RosetteMask"])
  {
    NTKBundle();
    objc_claimAutoreleasedReturnValue();
    [(NTKFaceView *)self device];
    objc_claimAutoreleasedReturnValue();
    CLKUIOrderedSuffixesForDevice();
  }
  if (self->_userUuidLuma && self->_userUuidChroma)
  {
    if (objc_msgSend(v4, "isEqualToString:"))
    {
      objc_super v5 = +[NTKKaleidoscopeCoordinatorCache sharedCache];
      id v6 = v5;
      userImage = self->_userImage;
      userUuidLuma = self->_userUuidLuma;
      userUuidChroma = self->_userUuidChroma;
      uint64_t v10 = userUuidLuma;
LABEL_9:
      objc_super v11 = [v5 provideAtlasBacking:userImage uuid:userUuidLuma uuidLuma:v10 uuidChroma:userUuidChroma];
      goto LABEL_15;
    }
    if ([v4 isEqualToString:self->_userUuidChroma])
    {
      objc_super v5 = +[NTKKaleidoscopeCoordinatorCache sharedCache];
      id v6 = v5;
      userImage = self->_userImage;
      userUuidLuma = self->_userUuidChroma;
      uint64_t v10 = self->_userUuidLuma;
      userUuidChroma = userUuidLuma;
      goto LABEL_9;
    }
  }
  id v6 = NTKBundle();
  double v12 = [v6 pathForResource:v4 ofType:@"art"];
  if (!v12) {
    NTKImageNamed(v4);
  }
  double v13 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v4;
    __int16 v17 = 2112;
    double v18 = v12;
    _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "[kaleidoscope] using artwork for %@ at %@", buf, 0x16u);
  }

  objc_super v11 = [off_1E62BDB48 atlasBackingWithArt:v12 uuid:v4];

LABEL_15:

  return v11;
}

- (id)resourceProviderKey
{
  return self->_resourceProviderKey;
}

- (void)_updateDayDuration
{
  NTKIdealizedDate();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v4 = [v3 dateByAddingUnit:16 value:1 toDate:v6 options:0];

  [v4 timeIntervalSinceDate:v6];
  self->_dayDuration = v5;
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

- (float)_crownTurnsForStyle:(unint64_t)a3
{
  BOOL v3 = a3 == 3 || a3 == 0;
  float result = 5.0;
  if (v3) {
    return 1.0;
  }
  return result;
}

- (id)_swatchFromUserImage
{
  if (self->_userImage)
  {
    BOOL v3 = [(NTKFaceView *)self device];
    id v4 = +[NTKKaleidoscopeAssetOption optionWithAsset:1000 forDevice:v3];

    +[NTKEditOption sizeForSwatchStyle:](NTKEditOption, "sizeForSwatchStyle:", [v4 swatchStyle]);
    unint64_t v7 = NTKPhotosAspectFilledImageFromImage(self->_userImage, v5, v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)_updateUserContent
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "[kaleidoscope pathfinder cache] link failed %@", (uint8_t *)&v2, 0xCu);
}

- (void)_updateFramerate
{
  BOOL v3 = [(NTKFaceView *)self editing];
  if (v3)
  {
LABEL_6:
    BOOL v4 = 0;
    goto LABEL_7;
  }
  if (![(NTKFaceView *)self isFrozen])
  {
    if ([(NTKFaceView *)self dataMode] != 1 && [(NTKFaceView *)self dataMode] != 5)
    {
      BOOL v4 = [(NTKFaceView *)self dataMode] != 3;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  BOOL v4 = 1;
LABEL_7:
  [(CLKUIQuadView *)self->_quadView setPaused:v4 | NTKIsScreenOn() ^ 1];
  if (v3 || self->_interactiveModeAnimationInFlight)
  {
    uint64_t v5 = 0;
  }
  else
  {
    unint64_t v7 = [(NTKFaceView *)self device];
    _LayoutConstants_41(v7, (uint64_t)v8);
    uint64_t v5 = v9;
  }
  quadView = self->_quadView;

  [(CLKUIQuadView *)quadView setPreferredFramesPerSecond:v5];
}

- (void)_updateRotationForQuadView:(id)a3 time:(double)a4 crownOffset:(double)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v7 = fmod(a5 * 60.0 / self->_crownTurnsPerRotation + a4, 120.0);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = objc_msgSend(a3, "quads", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        double v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        double v15 = [(NSMapTable *)self->_quadPathfinderMapTable objectForKey:v14];
        [v15 startRotation];
        float v11 = v7 / 120.0;
        *(float *)&double v17 = fmodf(v16 + v11, 1.0);
        [v14 setRotation:v17];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }
}

- (id)_updatePathForQuadView:(id)a3 time:(double)a4 crownOffset:(double)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = [v8 quads];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v10)
  {

LABEL_13:
    uint64_t v12 = [MEMORY[0x1E4FB1618] whiteColor];
    long long v21 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[NTKKaleidoscopeFaceView _updatePathForQuadView:time:crownOffset:](v21);
    }

    goto LABEL_16;
  }
  uint64_t v11 = v10;
  id v23 = v8;
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)v26;
  float v14 = (a4 + a5 * 1800.0 + floor((a4 + a5 * 1800.0) / 43200.0) * -43200.0) / 43200.0;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v26 != v13) {
        objc_enumerationMutation(v9);
      }
      float v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      double v17 = -[NSMapTable objectForKey:](self->_quadPathfinderMapTable, "objectForKey:", v16, v23);
      long long v18 = v17;
      if (v17)
      {
        memset(v24, 0, sizeof(v24));
        [v17 pointForTime:COERCE_DOUBLE((unint64_t)LODWORD(v14))];
        long long v19 = CGColorCreate(self->_extendedSRGBcolorSpace, (const CGFloat *)v24);
        uint64_t v20 = [MEMORY[0x1E4FB1618] colorWithCGColor:v19];

        CGColorRelease(v19);
        [v16 setSampleRadius:0.0];
        [v16 setSampleCenter:0.0];
        uint64_t v12 = (void *)v20;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v11);

  id v8 = v23;
  if (!v12) {
    goto LABEL_13;
  }
LABEL_16:

  return v12;
}

- (void)_updatePathForTime:(double)a3
{
  BOOL v4 = [(NTKKaleidoscopeFaceView *)self _updatePathForQuadView:self->_quadView time:a3 crownOffset:self->_crownOffset];
  complicationColor = self->_complicationColor;
  self->_complicationColor = v4;

  NTKColorByPremultiplyingAlpha(self->_complicationColor, 0.15);
  double v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
  complicationPlatterColor = self->_complicationPlatterColor;
  self->_complicationPlatterColor = v6;
}

- (void)_updateComplicationColors
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__NTKKaleidoscopeFaceView__updateComplicationColors__block_invoke;
  v2[3] = &unk_1E62C87B0;
  v2[4] = self;
  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v2];
}

void __52__NTKKaleidoscopeFaceView__updateComplicationColors__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = [a3 display];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1072);
    id v5 = v6;
    [v5 setForegroundColor:v4];
    [v5 setPlatterColor:*(void *)(*(void *)(a1 + 32) + 920)];
  }
  if ([v6 conformsToProtocol:&unk_1FCDFD5E8]) {
    [v6 setForegroundColor:*(void *)(*(void *)(a1 + 32) + 1072)];
  }
}

- (id)_imageForAsset:(unint64_t)a3
{
  if (a3 != 1000)
  {
    BOOL v3 = objc_msgSend(NSString, "stringWithFormat:", @"Kaleidoscope-Asset%02d", (a3 + 1));
    NTKImageNamed(v3);
  }
  uint64_t v4 = self->_userImage;

  return v4;
}

- (id)_pathfinderForAsset:(unint64_t)a3
{
  if (a3 == 1000)
  {
    id v5 = self->_userPathfinder;
    if (v5) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  id v6 = NTKBundle();
  double v7 = objc_msgSend(NSString, "stringWithFormat:", @"Kaleidoscope-Asset%02d", (a3 + 1));
  id v8 = [v6 pathForResource:v7 ofType:@"pathfinder"];
  if (v8)
  {
    uint64_t v9 = +[NTKKaleidoscopePathfinder pathfinderFromFile:v8];
    id v5 = v9;
    LODWORD(v10) = 1048576045;
    LODWORD(v11) = 1062269566;
    switch(a3)
    {
      case 8uLL:
        goto LABEL_22;
      case 9uLL:
        LODWORD(v11) = 1050609104;
        goto LABEL_22;
      case 0xAuLL:
        LODWORD(v11) = 1060939122;
        goto LABEL_22;
      case 0xBuLL:
        LODWORD(v11) = 1057069931;
        goto LABEL_22;
      case 0xCuLL:
        goto LABEL_15;
      case 0xDuLL:
        LODWORD(v10) = 1050513605;
        goto LABEL_15;
      case 0xEuLL:
        LODWORD(v10) = 1072344365;
        goto LABEL_15;
      case 0xFuLL:
        LODWORD(v10) = 1071251596;
LABEL_15:
        LODWORD(v11) = LODWORD(v10);
        [(NTKKaleidoscopePathfinder *)v9 adjustRotationStart:v11];
        LODWORD(v13) = 0.5;
        goto LABEL_24;
      case 0x17uLL:
        LODWORD(v11) = -1101792568;
        goto LABEL_22;
      case 0x18uLL:
        LODWORD(v11) = 1013008293;
        goto LABEL_22;
      case 0x19uLL:
        LODWORD(v11) = 1034800000;
        goto LABEL_22;
      case 0x1AuLL:
        LODWORD(v11) = -1084462872;
LABEL_22:
        -[NTKKaleidoscopePathfinder adjustRotationStart:](v9, "adjustRotationStart:", v11, v10);
        goto LABEL_23;
      default:
        -[NTKKaleidoscopePathfinder adjustRotationStart:](v9, "adjustRotationStart:", 0.0, v10);
        if (a3 - 27 >= 6) {
LABEL_23:
        }
          LODWORD(v13) = 1.0;
        else {
          LODWORD(v13) = *(_DWORD *)"ff&?";
        }
LABEL_24:
        [(NTKKaleidoscopePathfinder *)v5 adjustSampleRadius:v13];
        break;
    }
  }
  else
  {
    uint64_t v12 = _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NTKKaleidoscopeFaceView _pathfinderForAsset:]((uint64_t)v7, v12);
    }

    id v5 = 0;
  }

  if (!v5)
  {
LABEL_26:
    float v14 = [(NTKKaleidoscopeFaceView *)self _imageForAsset:a3];
    id v5 = +[NTKKaleidoscopePathfinder pathfinderWithImage:v14];
  }
LABEL_27:

  return v5;
}

- (id)_textureLumaForAsset:(unint64_t)a3
{
  if (a3 == 1000)
  {
    uint64_t v4 = self->_userTextureLuma;
  }
  else
  {
    id v6 = @"~iphone";
    if (a3 - 8 < 0x14) {
      id v6 = &stru_1F1635E90;
    }
    double v7 = [NSString stringWithFormat:@"Kaleidoscope-Asset%02d-l%@", (a3 + 1), v6];
    v8.i64[0] = 8;
    v9.i64[0] = a3 & 0xFFFFFFFFFFFFFFFCLL;
    objc_msgSend(off_1E62BDB98, "textureWithProviderDelegate:uuid:rect:", self, v7, *(double *)vbslq_s8((int8x16_t)vdupq_lane_s64(vceqq_s64(v9, v8).i64[0], 0), (int8x16_t)xmmword_1BC8A21B0, (int8x16_t)xmmword_1BC8A21A0).i64);
    uint64_t v4 = (CLKUITexture *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_textureChromaForAsset:(unint64_t)a3
{
  if (a3 == 1000)
  {
    uint64_t v4 = self->_userTextureChroma;
  }
  else
  {
    id v6 = @"~iphone";
    if (a3 - 8 < 0x14) {
      id v6 = &stru_1F1635E90;
    }
    double v7 = [NSString stringWithFormat:@"Kaleidoscope-Asset%02d-c%@", (a3 + 1), v6];
    v8.i64[0] = 8;
    v9.i64[0] = a3 & 0xFFFFFFFFFFFFFFFCLL;
    objc_msgSend(off_1E62BDB98, "textureWithProviderDelegate:uuid:rect:", self, v7, *(double *)vbslq_s8((int8x16_t)vdupq_lane_s64(vceqq_s64(v9, v8).i64[0], 0), (int8x16_t)xmmword_1BC8A21B0, (int8x16_t)xmmword_1BC8A21A0).i64);
    uint64_t v4 = (CLKUITexture *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_quadWithStyle:(unint64_t)a3 asset:(unint64_t)a4
{
  double v7 = [NSNumber numberWithInteger:a4];
  [(NSMutableSet *)self->_loadedAssets addObject:v7];
  int64x2_t v8 = +[NTKKaleidoscopeQuad quadWithShaderType:qword_1BC8A21C0[a3]];
  int64x2_t v9 = [(NTKKaleidoscopeFaceView *)self _textureLumaForAsset:a4];
  [v8 setPrimaryLumaTexture:v9];

  double v10 = [(NTKKaleidoscopeFaceView *)self _textureChromaForAsset:a4];
  [v8 setPrimaryChromaTexture:v10];

  if (a3 == 2)
  {
    double v11 = [off_1E62BDB98 textureWithProviderDelegate:self uuid:@"Kaleidoscope-RosetteMask"];
    [v8 setSecondaryTexture:v11];
  }
  uint64_t v12 = [(NTKFaceView *)self device];
  _LayoutConstants_41(v12, (uint64_t)v16);
  LODWORD(v13) = v17;
  [v8 setDialRadius:v13];

  float v14 = [(NTKKaleidoscopeFaceView *)self _pathfinderForAsset:a4];
  [(NSMapTable *)self->_quadPathfinderMapTable setObject:v14 forKey:v8];

  return v8;
}

- (void)_prepareToZoom
{
  v3.receiver = self;
  v3.super_class = (Class)NTKKaleidoscopeFaceView;
  [(NTKFaceView *)&v3 _prepareToZoom];
  [(CLKUIQuadView *)self->_quadView setPaused:1];
}

- (void)_cleanupAfterZoom
{
  v3.receiver = self;
  v3.super_class = (Class)NTKKaleidoscopeFaceView;
  [(NTKFaceView *)&v3 _cleanupAfterZoom];
  [(NTKKaleidoscopeFaceView *)self _updateFramerate];
}

- (id)_swatchForAsset:(unint64_t)a3
{
  if (a3 != 1000)
  {
    objc_super v3 = objc_msgSend(NSString, "stringWithFormat:", @"Swatch-Kaleidoscope-Asset%02d", (a3 + 1));
    NTKImageNamed(v3);
  }
  uint64_t v4 = self->_userSwatch;

  return v4;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15) {
    return &unk_1F16EA570;
  }
  else {
    return 0;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = +[NTKKaleidoscopeSwatchMappedImageCache sharedCache];
  if (a4 == 15)
  {
    id v12 = v8;
    double v13 = [v9 objectForKeyedSubscript:&unk_1F16E42D8];
    float v14 = [(NTKFaceView *)self resourceDirectory];
    double v15 = +[NTKKaleidoscopeSwatchMappedImageCache keyForAsset:v13 style:v12 resourceDirectory:v14];
    float v16 = [v10 imageForKey:v15];
    if (!v16)
    {
      uint64_t v19 = [v13 asset];
      uint64_t v17 = [v12 style];
      +[NTKEditOption sizeForSwatchStyle:](NTKEditOption, "sizeForSwatchStyle:", [v12 swatchStyle]);
      float v16 = -[NTKKaleidoscopeFaceView _snapshotWithAsset:style:size:](self, "_snapshotWithAsset:style:size:", v19, v17);
      [v10 setImage:v16 forKey:v15];
    }
  }
  else
  {
    if (a4 == 12)
    {
      uint64_t v11 = -[NTKKaleidoscopeFaceView _swatchForAsset:](self, "_swatchForAsset:", [v8 asset]);
    }
    else
    {
      v20.receiver = self;
      v20.super_class = (Class)NTKKaleidoscopeFaceView;
      uint64_t v11 = [(NTKFaceView *)&v20 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
    }
    float v16 = (void *)v11;
  }

  return v16;
}

- (id)_snapshotWithAsset:(unint64_t)a3 style:(unint64_t)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v10 = *MEMORY[0x1E4F1DAD8];
  double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v12 = objc_msgSend(off_1E62BDB80, "quadViewWithFrame:identifier:", @"Klei", *MEMORY[0x1E4F1DAD8], v11, a5.width, a5.height);
  double v13 = [(NTKKaleidoscopeFaceView *)self _quadWithStyle:a4 asset:a3];
  [v13 setOpaque:1];
  [v12 addQuad:v13];
  [(NTKKaleidoscopeFaceView *)self _kaleidoscopeTime];
  double v15 = v14;
  [(NTKKaleidoscopeFaceView *)self _updateWithAsset:a3];
  id v16 = [(NTKKaleidoscopeFaceView *)self _updatePathForQuadView:v12 time:v15 crownOffset:0.0];
  [(NTKKaleidoscopeFaceView *)self _updateRotationForQuadView:v12 time:v15 crownOffset:0.0];
  uint64_t v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v17 nativeScale];
  uint64_t v19 = objc_msgSend(v12, "snapshotInRect:scale:time:", v10, v11, width, height, v18, v15);

  return v19;
}

- (unint64_t)currentAsset
{
  return self->_currentAsset;
}

- (unint64_t)currentStyle
{
  return self->_currentStyle;
}

- (UIColor)complicationColor
{
  return self->_complicationColor;
}

- (void)setComplicationColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationColor, 0);
  objc_storeStrong((id *)&self->_loadedAssets, 0);
  objc_storeStrong((id *)&self->_quadPathfinderMapTable, 0);
  objc_storeStrong((id *)&self->_resourceProviderKey, 0);
  objc_storeStrong((id *)&self->_userPathfinder, 0);
  objc_storeStrong((id *)&self->_userUuidChroma, 0);
  objc_storeStrong((id *)&self->_userUuidLuma, 0);
  objc_storeStrong((id *)&self->_userPhoto, 0);
  objc_storeStrong((id *)&self->_userImage, 0);
  objc_storeStrong((id *)&self->_userSwatch, 0);
  objc_storeStrong((id *)&self->_userTextureChroma, 0);
  objc_storeStrong((id *)&self->_userTextureLuma, 0);
  objc_storeStrong((id *)&self->_complicationPlatterColor, 0);
  objc_storeStrong((id *)&self->_faceViewComplicationFactory, 0);
  objc_storeStrong((id *)&self->_cornerView, 0);

  objc_storeStrong((id *)&self->_quadView, 0);
}

- (void)_updatePathForQuadView:(os_log_t)log time:crownOffset:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "[kaleidoscope] pathfinder is nil! Coloring complications white.", v1, 2u);
}

- (void)_pathfinderForAsset:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "[kaleidoscope pathfinder cache] missing pathfinder: %@", (uint8_t *)&v2, 0xCu);
}

@end