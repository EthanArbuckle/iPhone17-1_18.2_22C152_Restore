@interface NTKBasePhotosFaceView
- (BOOL)_curtainViewVisible;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3;
- (BOOL)_preloadNextPhoto;
- (BOOL)_screenOn;
- (BOOL)_timeLabelUsesLegibility;
- (BOOL)isInteractive;
- (BOOL)isNoPhotosViewVisible;
- (BOOL)screenWillGoDark;
- (Class)photosFaceClass;
- (NSValue)monochromeColorMatrix;
- (NTKAlbumEmptyView)noPhotosView;
- (NTKBasePhotosFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (NTKPhotoImageView)posterImageView;
- (UIImage)photosColorRamp;
- (UIImage)photosMonoColorRamp;
- (UIView)cornerView;
- (double)_backgroundImageAlphaForEditMode:(int64_t)a3;
- (double)_editSpeedForCustomEditMode:(int64_t)a3 slot:(id)a4;
- (double)_foregroundAlphaForEditMode:(int64_t)a3;
- (double)_foregroundAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (double)_keylineCornerRadiusForComplicationSlot:(id)a3;
- (double)_timeLabelAlphaForEditMode:(int64_t)a3;
- (double)_timeTravelYAdjustment;
- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4;
- (id)_newGradientViewWithColor:(id)a3;
- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5;
- (id)_selectedContentView;
- (id)createFaceColorPalette;
- (int64_t)_complicationPickerStyleForSlot:(id)a3;
- (int64_t)_utilitySlotForSlot:(id)a3;
- (unint64_t)dateAlignment;
- (void)_animateIn;
- (void)_applyAlignment;
- (void)_applyComplicationContentSpecificAttributesAnimated:(BOOL)a3;
- (void)_applyDataMode;
- (void)_applyForegroundAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_applyFrozen;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyPhotosColor;
- (void)_applyPhotosColorFrom:(id)a3 to:(id)a4 fraction:(double)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyScrubbingForegroundColor:(id)a3 shadowColor:(id)a4;
- (void)_applySlow;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterEditing;
- (void)_cleanupAfterOrb:(BOOL)a3;
- (void)_configureComplicationFactory;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_configureForEditMode:(int64_t)a3;
- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5;
- (void)_endScrubbingAnimationFromUIViewAnimateWithDuration;
- (void)_handleScreenWake;
- (void)_hideCurtainView;
- (void)_invalidatePreloadedPhoto;
- (void)_layoutForegroundContainerView;
- (void)_loadLayoutRules;
- (void)_loadSnapshotContentViews;
- (void)_playIrisOnSingleTap;
- (void)_playPhoto;
- (void)_playStill;
- (void)_playVideo;
- (void)_playVideoForScreenWake:(id)a3;
- (void)_prepareForEditing;
- (void)_prepareForOrb;
- (void)_scheduleSleepPreloadTask;
- (void)_setComplicationsHidden:(BOOL)a3;
- (void)_setDateAttributes:(id)a3 animated:(BOOL)a4;
- (void)_showCurtainView;
- (void)_startScrubbingAnimationFromUIViewAnimateWithDuration;
- (void)_unloadSnapshotContentViews;
- (void)_unpauseFromSwitcher;
- (void)_updatePaused;
- (void)applyPhotosColorRamp:(id)a3 photosMonoColorRamp:(id)a4 monochromeColorMatrix:(id)a5 toPhotosImageView:(id)a6;
- (void)dealloc;
- (void)imageViewDidBeginPlaying:(id)a3;
- (void)layoutSubviews;
- (void)setMonochromeColorMatrix:(id)a3;
- (void)setNoPhotosViewVisible:(BOOL)a3;
- (void)updateWithColorPalette:(id)a3;
@end

@implementation NTKBasePhotosFaceView

- (NTKBasePhotosFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)NTKBasePhotosFaceView;
  v9 = [(NTKFaceView *)&v22 initWithFaceStyle:a3 forDevice:v8 clientIdentifier:a5];
  if (v9)
  {
    if (CLKIsClockFaceApp())
    {
      v10 = objc_alloc_init(NTKTaskScheduler);
      taskScheduler = v9->_taskScheduler;
      v9->_taskScheduler = v10;
    }
    uint64_t v12 = [MEMORY[0x1E4FB1618] whiteColor];
    foregroundColor = v9->_foregroundColor;
    v9->_foregroundColor = (UIColor *)v12;

    uint64_t v14 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:*(double *)off_1E62BD1C0];
    shadowColor = v9->_shadowColor;
    v9->_shadowColor = (UIColor *)v14;

    v16 = [[NTKUtilityComplicationFactory alloc] initForDevice:v8];
    complicationFactory = v9->_complicationFactory;
    v9->_complicationFactory = v16;

    [(NTKBasePhotosFaceView *)v9 _configureComplicationFactory];
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v9 selector:sel__unpauseFromSwitcher name:@"NTKFaceLibraryDismissedNotification" object:0];

    uint64_t v19 = NTKDefaultMonochromeColorMatrix();
    monochromeColorMatrix = v9->_monochromeColorMatrix;
    v9->_monochromeColorMatrix = (NSValue *)v19;
  }
  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"NTKFaceLibraryDismissedNotification" object:0];

  [(NSTimer *)self->_playOnWakeTimeout invalidate];
  [(NTKBasePhotosFaceView *)self _unloadSnapshotContentViews];
  [(NTKTaskScheduler *)self->_taskScheduler cancelAllTasks];
  v4.receiver = self;
  v4.super_class = (Class)NTKBasePhotosFaceView;
  [(NTKFaceView *)&v4 dealloc];
}

- (id)createFaceColorPalette
{
  v2 = [(NTKFaceColorPalette *)[NTKPhotosColorPalette alloc] initWithFaceClass:[(NTKBasePhotosFaceView *)self photosFaceClass]];

  return v2;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NTKBasePhotosFaceView;
  [(NTKDigitalFaceView *)&v12 layoutSubviews];
  v3 = [(NTKFaceView *)self foregroundContainerView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_posterImageView, "ntk_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_cornerView, "ntk_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
  -[UIView ntk_setBoundsAndPositionFromFrame:](self->_noPhotosView, "ntk_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
}

- (unint64_t)dateAlignment
{
  if (self->_noPhotosViewVisible) {
    return 0;
  }
  else {
    return self->_dateAlignment;
  }
}

- (double)_timeTravelYAdjustment
{
  unint64_t v3 = [(NTKBasePhotosFaceView *)self dateAlignment];
  double result = 0.0;
  if (v3 != 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)NTKBasePhotosFaceView;
    [(NTKBackgroundImageFaceView *)&v5 _timeTravelYAdjustment];
  }
  return result;
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v28[8] = *MEMORY[0x1E4F143B8];
  if ([(NTKBasePhotosFaceView *)self dateAlignment] == 1)
  {
    [(NTKBasePhotosFaceView *)self bounds];
    double v10 = [(NTKFaceView *)self device];
    double v11 = [MEMORY[0x1E4F19A40] metricsWithDevice:v10 identitySizeClass:2];
    v27[0] = &unk_1F16E0CD8;
    v27[1] = &unk_1F16E0CF0;
    v28[0] = &unk_1F16E6FC0;
    v28[1] = &unk_1F16E6FD0;
    v27[2] = &unk_1F16E0D08;
    v27[3] = &unk_1F16E0D20;
    v28[2] = &unk_1F16E6FE0;
    v28[3] = &unk_1F16E6FF0;
    v27[4] = &unk_1F16E0D38;
    v27[5] = &unk_1F16E0D50;
    v28[4] = &unk_1F16E7000;
    v28[5] = &unk_1F16E7010;
    v27[6] = &unk_1F16E0D68;
    v27[7] = &unk_1F16E0D80;
    v28[6] = &unk_1F16E7020;
    v28[7] = &unk_1F16E7010;
    objc_super v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:8];
    [v11 scaledValue:v12 withOverrides:99.0];

    CLKAlterRect();
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v21 = [(NTKFaceView *)self device];
    double v22 = NTKDigitalTimeLabelStyleWideRightSideMargin(v21);
    v23 = [(NTKFaceView *)self device];
    v24 = +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:", 1, v23, v14, v16, v18, v20, v22);
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)NTKBasePhotosFaceView;
    v24 = -[NTKBackgroundImageFaceView _digitalTimeLabelStyleFromViewMode:faceBounds:](&v26, sel__digitalTimeLabelStyleFromViewMode_faceBounds_, a3, x, y, width, height);
  }

  return v24;
}

- (void)_layoutForegroundContainerView
{
  v2.receiver = self;
  v2.super_class = (Class)NTKBasePhotosFaceView;
  [(NTKFaceView *)&v2 _layoutForegroundContainerView];
}

- (void)setNoPhotosViewVisible:(BOOL)a3
{
  if (self->_noPhotosViewVisible != a3)
  {
    BOOL noPhotosViewVisible = a3;
    [(UIView *)self->_currentGradientView removeFromSuperview];
    currentGradientView = self->_currentGradientView;
    self->_currentGradientView = 0;

    unint64_t v6 = [(NTKBasePhotosFaceView *)self dateAlignment];
    self->_BOOL noPhotosViewVisible = noPhotosViewVisible;
    if (noPhotosViewVisible)
    {
      if (self->_noPhotosView)
      {
        BOOL v7 = 0;
      }
      else
      {
        double v8 = [NTKAlbumEmptyView alloc];
        double v9 = [(NTKFaceView *)self device];
        double v10 = [(NTKAlbumEmptyView *)v8 initForDevice:v9];
        noPhotosView = self->_noPhotosView;
        self->_noPhotosView = v10;

        [(NTKBasePhotosFaceView *)self insertSubview:self->_noPhotosView atIndex:0];
        [(NTKBasePhotosFaceView *)self setNeedsLayout];
        BOOL v7 = !self->_noPhotosViewVisible;
      }
    }
    else
    {
      BOOL v7 = 1;
    }
    [(NTKAlbumEmptyView *)self->_noPhotosView setHidden:v7];
    [(NTKPhotoImageView *)self->_posterImageView setHidden:self->_noPhotosViewVisible];
    objc_super v12 = [(NTKFaceView *)self timeView];
    [v12 setHidden:self->_noPhotosViewVisible];

    if ([(NTKBasePhotosFaceView *)self dateAlignment] != v6) {
      [(NTKBasePhotosFaceView *)self _applyAlignment];
    }
    if (self->_noPhotosViewVisible != noPhotosViewVisible)
    {
      [(NTKBasePhotosFaceView *)self _applyPhotosColor];
      BOOL noPhotosViewVisible = self->_noPhotosViewVisible;
    }
    [(NTKBasePhotosFaceView *)self _setComplicationsHidden:noPhotosViewVisible];
    if (self->_noPhotosViewVisible)
    {
      id v13 = +[NTKPhotoAnalysis defaultAnalysis];
      [(NTKBasePhotosFaceView *)self _setDateAttributes:v13 animated:0];
    }
  }
}

- (void)_loadLayoutRules
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)NTKBasePhotosFaceView;
  [(NTKFaceView *)&v26 _loadLayoutRules];
  [(NTKBasePhotosFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(NTKBackgroundImageFaceView *)self _shouldAdjustLayoutForTimeTravel])
  {
    [(NTKBasePhotosFaceView *)self _timeTravelYAdjustment];
    CLKAlterRect();
    double v4 = v11;
    double v6 = v12;
    double v8 = v13;
    double v10 = v14;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v27[0] = @"top";
  v27[1] = @"bottom";
  double v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v27, 2, 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v21 = [(NTKFaceView *)self complicationLayoutforSlot:v20];
        -[NTKUtilityComplicationFactory configureComplicationLayout:forSlot:withBounds:](self->_complicationFactory, "configureComplicationLayout:forSlot:withBounds:", v21, [(NTKBasePhotosFaceView *)self _utilitySlotForSlot:v20], v4, v6, v8, v10);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v17);
  }
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  complicationFactordouble y = self->_complicationFactory;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(NTKUtilityComplicationFactory *)complicationFactory newViewForComplication:v10 family:a4 forSlot:[(NTKBasePhotosFaceView *)self _utilitySlotForSlot:v9]];

  [(NTKBasePhotosFaceView *)self _configureComplicationView:v11 forSlot:v9];
  return v11;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([v10 conformsToProtocol:&unk_1FCDFD5E8])
  {
    double v7 = *MEMORY[0x1E4FB09E0];
    id v8 = v10;
    [v8 setFontWeight:v7];
    [v8 setForegroundColor:self->_foregroundColor];
    [v8 setShadowColor:self->_shadowColor];
    [(NTKUtilityComplicationFactory *)self->_complicationFactory foregroundAlphaForEditing:[(NTKFaceView *)self editing]];
    objc_msgSend(v8, "setForegroundAlpha:");
    [(NTKUtilityComplicationFactory *)self->_complicationFactory foregroundImageAlphaForEditing:[(NTKFaceView *)self editing]];
    objc_msgSend(v8, "setForegroundImageAlpha:");
    [v8 setUsesLegibility:(*((unsigned __int8 *)self + 1184) >> 2) & 1];
    objc_msgSend(v8, "setPlacement:", +[NTKUtilityComplicationFactory placementForSlot:](NTKUtilityComplicationFactory, "placementForSlot:", -[NTKBasePhotosFaceView _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v6)));
    [v8 setSuppressesInternalColorOverrides:1];
    [v8 setHidden:self->_noPhotosViewVisible];
    id v9 = [MEMORY[0x1E4FB1618] clearColor];
    [v8 setBackgroundColor:v9];
  }
}

- (double)_foregroundAlphaForEditMode:(int64_t)a3
{
  double result = 0.2;
  if (a3 != 10) {
    return 1.0;
  }
  return result;
}

- (double)_foregroundAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  [(NTKBasePhotosFaceView *)self _foregroundAlphaForEditMode:a4];
  [(NTKBasePhotosFaceView *)self _foregroundAlphaForEditMode:a5];

  CLKInterpolateBetweenFloatsClipped();
  return result;
}

- (void)_applyForegroundAlphaForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  [(NTKBasePhotosFaceView *)self _foregroundAlphaForTransitionFraction:a4 fromEditMode:a5 toEditMode:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __92__NTKBasePhotosFaceView__applyForegroundAlphaForTransitionFraction_fromEditMode_toEditMode___block_invoke;
  v7[3] = &__block_descriptor_40_e56_v24__0__NSString_8__NTKComplicationDisplayWrapperView_16l;
  v7[4] = v6;
  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v7];
}

void __92__NTKBasePhotosFaceView__applyForegroundAlphaForTransitionFraction_fromEditMode_toEditMode___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 display];
  if ([v4 conformsToProtocol:&unk_1FCDFD5E8])
  {
    [v4 setForegroundAlpha:*(double *)(a1 + 32)];
    [v4 setForegroundImageAlpha:*(double *)(a1 + 32)];
  }
}

- (void)_applyComplicationContentSpecificAttributesAnimated:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__NTKBasePhotosFaceView__applyComplicationContentSpecificAttributesAnimated___block_invoke;
  v3[3] = &unk_1E62C2580;
  BOOL v4 = a3;
  v3[4] = self;
  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v3];
}

void __77__NTKBasePhotosFaceView__applyComplicationContentSpecificAttributesAnimated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = [a3 display];
  double v5 = v4;
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v6 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __77__NTKBasePhotosFaceView__applyComplicationContentSpecificAttributesAnimated___block_invoke_2;
    double v12 = &unk_1E62C09C0;
    id v7 = v4;
    uint64_t v8 = *(void *)(a1 + 32);
    id v13 = v7;
    uint64_t v14 = v8;
    [v6 transitionWithView:v7 duration:5242880 options:&v9 animations:0 completion:0.5];
  }
  else
  {
    [v4 setForegroundColor:*(void *)(*(void *)(a1 + 32) + 1152)];
  }
  objc_msgSend(v5, "setShadowColor:", *(void *)(*(void *)(a1 + 32) + 1160), v9, v10, v11, v12);
  [v5 setUsesLegibility:(*(unsigned __int8 *)(*(void *)(a1 + 32) + 1184) >> 2) & 1];
}

void __77__NTKBasePhotosFaceView__applyComplicationContentSpecificAttributesAnimated___block_invoke_2(uint64_t a1)
{
  objc_super v2 = (void *)MEMORY[0x1E4FB1EB0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__NTKBasePhotosFaceView__applyComplicationContentSpecificAttributesAnimated___block_invoke_3;
  v5[3] = &unk_1E62C09C0;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 performWithoutAnimation:v5];
}

uint64_t __77__NTKBasePhotosFaceView__applyComplicationContentSpecificAttributesAnimated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setForegroundColor:*(void *)(*(void *)(a1 + 40) + 1152)];
}

- (void)_setComplicationsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NTKFaceView *)self complicationContainerView];
  [v4 setHidden:v3];
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return (unint64_t)a4 > 1 && (a4 & 0xFFFFFFFFFFFFFFFBLL) != 10;
}

- (void)_prepareForEditing
{
  v4.receiver = self;
  v4.super_class = (Class)NTKBasePhotosFaceView;
  [(NTKBackgroundImageFaceView *)&v4 _prepareForEditing];
  [(NTKBasePhotosFaceView *)self _setComplicationsHidden:0];
  BOOL v3 = +[NTKPhotoAnalysis defaultAnalysis];
  [(NTKBasePhotosFaceView *)self _setDateAttributes:v3 animated:1];
}

- (void)_cleanupAfterEditing
{
  [(NTKBasePhotosFaceView *)self _setComplicationsHidden:self->_noPhotosViewVisible];
  v3.receiver = self;
  v3.super_class = (Class)NTKBasePhotosFaceView;
  [(NTKBackgroundImageFaceView *)&v3 _cleanupAfterEditing];
}

- (double)_backgroundImageAlphaForEditMode:(int64_t)a3
{
  double result = 0.5;
  if (a3 != 14)
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    v6.receiver = self;
    v6.super_class = (Class)NTKBasePhotosFaceView;
    [(NTKBackgroundImageFaceView *)&v6 _backgroundImageAlphaForEditMode:0.5];
  }
  return result;
}

- (double)_timeLabelAlphaForEditMode:(int64_t)a3
{
  if (a3 == 10) {
    return 0.2;
  }
  double result = 1.0;
  if (a3 == 1) {
    return 0.2;
  }
  return result;
}

- (int64_t)_utilitySlotForSlot:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NTKBasePhotosFaceView *)self dateAlignment];
  if ([v4 isEqual:@"top"])
  {
    BOOL v6 = v5 == 0;
    uint64_t v7 = 5;
  }
  else
  {
    if (![v4 isEqual:@"bottom"])
    {
      int64_t v8 = 0;
      goto LABEL_9;
    }
    BOOL v6 = v5 == 0;
    uint64_t v7 = 7;
  }
  if (v6) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = v7 + 1;
  }
LABEL_9:

  return v8;
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  complicationFactordouble y = self->_complicationFactory;
  int64_t v4 = [(NTKBasePhotosFaceView *)self _utilitySlotForSlot:a3];

  [(NTKUtilityComplicationFactory *)complicationFactory keylineCornerRadiusForSlot:v4];
  return result;
}

- (void)_configureComplicationFactory
{
  [(NTKUtilityComplicationFactory *)self->_complicationFactory setForegroundAlpha:1.0];
  complicationFactordouble y = self->_complicationFactory;

  [(NTKUtilityComplicationFactory *)complicationFactory setForegroundImageAlpha:1.0];
}

- (BOOL)_keylineLabelShouldShowIndividualOptionNamesForCustomEditMode:(int64_t)a3
{
  return a3 == 10;
}

- (void)_applyAlignment
{
  [(UIView *)self->_currentGradientView removeFromSuperview];
  currentGradientView = self->_currentGradientView;
  self->_currentGradientView = 0;

  [(NTKBasePhotosFaceView *)self _loadLayoutRules];
  [(NTKBasePhotosFaceView *)self setNeedsLayout];
  int64_t v4 = [(NTKFaceView *)self foregroundContainerView];
  [v4 setNeedsLayout];

  [(NTKDigitalFaceView *)self invalidateDigitalTimeLabelStyle];
  id v5 = [(NTKFaceView *)self delegate];
  [v5 faceViewWantsComplicationKeylineFramesReloaded];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  if (a4 == 10)
  {
    uint64_t v9 = [(NTKBasePhotosFaceView *)self palette];
    [(NTKBasePhotosFaceView *)self updateWithColorPalette:v9];
LABEL_12:

    goto LABEL_13;
  }
  if (a4 != 14)
  {
    if (a4 != 12) {
      goto LABEL_13;
    }
    uint64_t v9 = NTKCompanionClockFaceLocalizedString(@"PHOTOS_FACE_NO_CUSTOM_PHOTOS_TEXT_COMPANION", @"No photos");
    uint64_t v10 = NTKCompanionClockFaceLocalizedString(@"PHOTOS_FACE_NO_SYNCED_ALBUM_TEXT_COMPANION", @"No synced photos");
    id v11 = NTKCompanionClockFaceLocalizedString(@"PHOTOS_FACE_NO_MEMORIES_TEXT_COMPANION", @"No memories");
    if ([v13 photosContent] == 1) {
      [(NTKAlbumEmptyView *)self->_noPhotosView setBodyLabelText:v9];
    }
    if (![v13 photosContent]) {
      [(NTKAlbumEmptyView *)self->_noPhotosView setBodyLabelText:v10];
    }
    if ([v13 photosContent] == 2) {
      [(NTKAlbumEmptyView *)self->_noPhotosView setBodyLabelText:v11];
    }

    goto LABEL_12;
  }
  unint64_t v12 = [(NTKBasePhotosFaceView *)self dateAlignment];
  self->_dateAlignment = [v13 alignment];
  if ([(NTKBasePhotosFaceView *)self dateAlignment] != v12) {
    [(NTKBasePhotosFaceView *)self _applyAlignment];
  }
LABEL_13:
}

- (void)updateWithColorPalette:(id)a3
{
  id v4 = a3;
  id v5 = [v4 colorRampImage];
  photosColorRamp = self->_photosColorRamp;
  self->_photosColorRamp = v5;

  uint64_t v7 = [v4 monocolorRampImage];

  photosMonoColorRamp = self->_photosMonoColorRamp;
  self->_photosMonoColorRamp = v7;

  [(NTKBasePhotosFaceView *)self _applyPhotosColor];
}

- (void)_applyPhotosColor
{
}

- (void)applyPhotosColorRamp:(id)a3 photosMonoColorRamp:(id)a4 monochromeColorMatrix:(id)a5 toPhotosImageView:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  if (NTKIsDefaultMonochromeColorMatrix(v9)) {
    id v13 = v11;
  }
  else {
    id v13 = v12;
  }
  id v14 = v13;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__NTKBasePhotosFaceView_applyPhotosColorRamp_photosMonoColorRamp_monochromeColorMatrix_toPhotosImageView___block_invoke;
  block[3] = &unk_1E62C04F0;
  id v19 = v14;
  id v20 = v9;
  id v21 = v10;
  id v15 = v10;
  id v16 = v9;
  id v17 = v14;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __106__NTKBasePhotosFaceView_applyPhotosColorRamp_photosMonoColorRamp_monochromeColorMatrix_toPhotosImageView___block_invoke(void *a1)
{
  return +[NTKPhotosColorPalette applyColorRamp:a1[4] colorRampAmount:a1[5] monochromeColorMatrix:a1[6] toView:1.0];
}

- (void)_applyPhotosColorFrom:(id)a3 to:(id)a4 fraction:(double)a5
{
  monochromeColorMatridouble x = self->_monochromeColorMatrix;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__NTKBasePhotosFaceView__applyPhotosColorFrom_to_fraction___block_invoke;
  v8[3] = &unk_1E62C25D0;
  v8[4] = self;
  +[NTKPhotosColorPalette colorRampForMonochromeColorMatrix:monochromeColorMatrix fromPalette:a3 toPalette:a4 transitionFraction:v8 completion:a5];
}

void __59__NTKBasePhotosFaceView__applyPhotosColorFrom_to_fraction___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = a2;
  id v8 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__NTKBasePhotosFaceView__applyPhotosColorFrom_to_fraction___block_invoke_2;
  v11[3] = &unk_1E62C25A8;
  double v15 = a4;
  id v12 = v7;
  id v13 = v8;
  uint64_t v14 = *(void *)(a1 + 32);
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

uint64_t __59__NTKBasePhotosFaceView__applyPhotosColorFrom_to_fraction___block_invoke_2(uint64_t a1)
{
  return +[NTKPhotosColorPalette applyColorRamp:*(void *)(a1 + 32) colorRampAmount:*(void *)(a1 + 40) monochromeColorMatrix:*(void *)(*(void *)(a1 + 48) + 1072) toView:*(double *)(a1 + 56)];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  if (a4 == 14)
  {
    double v6 = NTKScaleForRubberBandingFraction(a3);
    id v7 = [(NTKFaceView *)self foregroundContainerView];
    CGAffineTransformMakeScale(&v9, v6, v6);
    [v7 setTransform:&v9];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)NTKBasePhotosFaceView;
    [(NTKBackgroundImageFaceView *)&v8 _applyRubberBandingFraction:a4 forCustomEditMode:a5 slot:a3];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (a6 == 10)
  {
    uint64_t v18 = [(NTKFaceView *)self interpolatedColorPalette];
    id v19 = [v18 fromPalette];
    id v20 = [(NTKFaceView *)self interpolatedColorPalette];
    id v21 = [v20 toPalette];
    [(NTKBasePhotosFaceView *)self _applyPhotosColorFrom:v19 to:v21 fraction:a3];
  }
  else if (a6 == 14)
  {
    if (a3 >= 0.5) {
      id v15 = v13;
    }
    else {
      id v15 = v12;
    }
    [(NTKBasePhotosFaceView *)self _applyOption:v15 forCustomEditMode:14 slot:v14];
    double v16 = (a3 * -2.0 + 1.0) * (a3 * -2.0 + 1.0) * (fabs(a3 * -2.0 + 1.0) * -2.0 + 3.0);
    id v17 = [(NTKFaceView *)self timeView];
    [v17 setAlpha:v16];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __93__NTKBasePhotosFaceView__applyTransitionFraction_fromOption_toOption_forCustomEditMode_slot___block_invoke;
    v22[3] = &__block_descriptor_40_e56_v24__0__NSString_8__NTKComplicationDisplayWrapperView_16l;
    *(double *)&v22[4] = v16;
    [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v22];
  }
}

void __93__NTKBasePhotosFaceView__applyTransitionFraction_fromOption_toOption_forCustomEditMode_slot___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v3 = *(double *)(a1 + 32);
  id v4 = [a3 display];
  [v4 setAlpha:v3];
}

- (double)_editSpeedForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  if (a3 == 14) {
    return 150.0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NTKBasePhotosFaceView;
  [(NTKFaceView *)&v5 _editSpeedForCustomEditMode:a3 slot:a4];
  return result;
}

- (BOOL)_timeLabelUsesLegibility
{
  return 1;
}

- (id)_selectedContentView
{
  if (self->_noPhotosViewVisible) {
    objc_super v2 = &OBJC_IVAR___NTKBasePhotosFaceView__noPhotosView;
  }
  else {
    objc_super v2 = &OBJC_IVAR___NTKBasePhotosFaceView__posterImageView;
  }
  return *(id *)((char *)&self->super.super.super.super.super.super.isa + *v2);
}

- (void)_applyFrozen
{
  v4.receiver = self;
  v4.super_class = (Class)NTKBasePhotosFaceView;
  [(NTKFaceView *)&v4 _applyFrozen];
  if ([(NTKFaceView *)self isFrozen]) {
    char v3 = 0;
  }
  else {
    char v3 = 2;
  }
  *((unsigned char *)self + 1184) = *((unsigned char *)self + 1184) & 0xFD | v3;
  [(NTKBasePhotosFaceView *)self _updatePaused];
}

- (void)_applySlow
{
  v3.receiver = self;
  v3.super_class = (Class)NTKBasePhotosFaceView;
  [(NTKFaceView *)&v3 _applySlow];
  [(NTKBasePhotosFaceView *)self _updatePaused];
}

- (void)_prepareForOrb
{
  v3.receiver = self;
  v3.super_class = (Class)NTKBasePhotosFaceView;
  [(NTKFaceView *)&v3 _prepareForOrb];
  [(NTKBasePhotosFaceView *)self _updatePaused];
}

- (void)_cleanupAfterOrb:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKBasePhotosFaceView;
  [(NTKFaceView *)&v4 _cleanupAfterOrb:a3];
  [(NTKBasePhotosFaceView *)self _updatePaused];
}

- (void)_updatePaused
{
  BOOL v3 = [(NTKFaceView *)self isFrozen]
    || [(NTKFaceView *)self orbing]
    || [(NTKFaceView *)self isSlow]
    || [(NTKFaceView *)self dataMode] != 1;
  if (self->_paused != v3)
  {
    self->_paused = v3;
    if (v3)
    {
      if ([(NTKPhotoImageView *)self->_posterImageView isPlaying]) {
        [(NTKPhotoImageView *)self->_posterImageView interruptPlayback];
      }
      self->_shouldPlayOnWake = 0;
    }
    else if ([(NTKBasePhotosFaceView *)self _screenOn])
    {
      self->_shouldPlayOnWake = 0;
      [(NTKBasePhotosFaceView *)self _playPhoto];
    }
    else
    {
      self->_shouldPlayOnWake = 1;
      [(NSTimer *)self->_playOnWakeTimeout invalidate];
      objc_super v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__playVideoForScreenWake_ selector:0 userInfo:0 repeats:0.25];
      playOnWakeTimeout = self->_playOnWakeTimeout;
      self->_playOnWakeTimeout = v4;
    }
    self->_updateWhenUnpausing = 0;
  }
}

- (BOOL)_screenOn
{
  return 1;
}

- (void)_playIrisOnSingleTap
{
  self->_isStartingPlaybackOnSingleTap = 1;
  [(NTKPhotoImageView *)self->_posterImageView playWithMode:2];
}

- (void)_playPhoto
{
  if ([(NTKPhotoImageView *)self->_posterImageView isPhotoIris]
    && ([(NTKPhotoImageView *)self->_posterImageView irisURL],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    [(NTKBasePhotosFaceView *)self _playVideo];
  }
  else
  {
    [(NTKBasePhotosFaceView *)self _playStill];
  }
}

- (void)_playStill
{
  if (self->_shouldPlayIntro)
  {
    [(NTKBasePhotosFaceView *)self _animateIn];
    self->_shouldPlayIntro = 0;
  }
}

- (void)_playVideo
{
  BOOL shouldPlayIntro = self->_shouldPlayIntro;
  posterImageView = self->_posterImageView;
  if (shouldPlayIntro)
  {
    [(NTKPhotoImageView *)posterImageView playWithMode:2];
    self->_BOOL shouldPlayIntro = 0;
  }
  else if ([(NTKPhotoImageView *)posterImageView isPlaying])
  {
    [(NTKBasePhotosFaceView *)self _hideCurtainView];
    self->_isStartingPlaybackOnSingleTap = 0;
    objc_super v5 = self->_posterImageView;
    [(NTKPhotoImageView *)v5 resumeInterruptedPlayback];
  }
}

- (void)_playVideoForScreenWake:(id)a3
{
  [(NSTimer *)self->_playOnWakeTimeout invalidate];
  if (self->_shouldPlayOnWake && !self->_preLoadingPhotoOnSleep)
  {
    self->_shouldPlayOnWake = 0;
    if ([(NTKPhotoImageView *)self->_posterImageView isPhotoIris])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__NTKBasePhotosFaceView__playVideoForScreenWake___block_invoke;
      block[3] = &unk_1E62BFF20;
      void block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      [(NTKBasePhotosFaceView *)self _playStill];
    }
  }
}

uint64_t __49__NTKBasePhotosFaceView__playVideoForScreenWake___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _playPhoto];
}

- (void)_unpauseFromSwitcher
{
  if (self->_updateWhenUnpausing)
  {
    [(NTKBasePhotosFaceView *)self _updatePaused];
    self->_updateWhenUnpausing = 0;
  }
}

- (void)_loadSnapshotContentViews
{
  v32.receiver = self;
  v32.super_class = (Class)NTKBasePhotosFaceView;
  [(NTKBackgroundImageFaceView *)&v32 _loadSnapshotContentViews];
  if ((*((unsigned char *)self + 1184) & 1) == 0)
  {
    [(NTKBasePhotosFaceView *)self _invalidatePreloadedPhoto];
    [(NTKPhotoImageView *)self->_posterImageView removeFromSuperview];
    BOOL v3 = [NTKPhotoImageView alloc];
    [(NTKBasePhotosFaceView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    id v12 = [(NTKFaceView *)self device];
    id v13 = -[NTKPhotoImageView initWithFrame:forDevice:](v3, "initWithFrame:forDevice:", v12, v5, v7, v9, v11);
    posterImageView = self->_posterImageView;
    self->_posterImageView = v13;

    [(NTKBasePhotosFaceView *)self _applyPhotosColor];
    [(NTKPhotoImageView *)self->_posterImageView setDelegate:self];
    id v15 = [(NTKPhotoImageView *)self->_posterImageView layer];
    [v15 setAllowsEdgeAntialiasing:0];

    double v16 = [(NTKPhotoImageView *)self->_posterImageView layer];
    [v16 setAllowsGroupOpacity:0];

    id v17 = [(NTKFaceView *)self contentView];
    [v17 addSubview:self->_posterImageView];

    uint64_t v18 = [(NTKFaceView *)self contentView];
    [v18 sendSubviewToBack:self->_posterImageView];

    id v19 = [NTKRoundedCornerOverlayView alloc];
    [(NTKBasePhotosFaceView *)self bounds];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    v28 = [(NTKFaceView *)self device];
    uint64_t v29 = -[NTKRoundedCornerOverlayView initWithFrame:forDeviceCornerRadius:](v19, "initWithFrame:forDeviceCornerRadius:", v28, v21, v23, v25, v27);
    cornerView = self->_cornerView;
    self->_cornerView = v29;

    v31 = [(NTKFaceView *)self contentView];
    [v31 insertSubview:self->_cornerView aboveSubview:self->_posterImageView];

    *((unsigned char *)self + 1184) |= 1u;
    *((unsigned char *)self + 1184) |= 2u;
  }
}

- (void)_unloadSnapshotContentViews
{
  v7.receiver = self;
  v7.super_class = (Class)NTKBasePhotosFaceView;
  [(NTKBackgroundImageFaceView *)&v7 _unloadSnapshotContentViews];
  self->_updateWhenUnpausing = 0;
  if (*((unsigned char *)self + 1184))
  {
    [(NTKPhotoImageView *)self->_posterImageView removeFromSuperview];
    [(UIView *)self->_cornerView removeFromSuperview];
    [(UIView *)self->_currentGradientView removeFromSuperview];
    currentGradientView = self->_currentGradientView;
    self->_currentGradientView = 0;

    [(NTKAlbumEmptyView *)self->_noPhotosView removeFromSuperview];
    noPhotosView = self->_noPhotosView;
    self->_noPhotosView = 0;

    posterImageView = self->_posterImageView;
    self->_posterImageView = 0;

    cornerView = self->_cornerView;
    self->_cornerView = 0;

    *((unsigned char *)self + 1184) &= ~1u;
    *((unsigned char *)self + 1184) &= ~2u;
  }
}

- (void)_applyDataMode
{
  v7.receiver = self;
  v7.super_class = (Class)NTKBasePhotosFaceView;
  [(NTKFaceView *)&v7 _applyDataMode];
  int64_t v3 = [(NTKFaceView *)self dataMode];
  int64_t v4 = v3;
  if ((unint64_t)(v3 - 3) >= 3)
  {
    if (v3 == 2)
    {
      double v5 = [(NTKFaceView *)self device];
      if ([v5 isLocked])
      {
      }
      else
      {
        BOOL v6 = [(NTKBasePhotosFaceView *)self screenWillGoDark];

        if (v6)
        {
          [(NTKTaskScheduler *)self->_taskScheduler cancelAllTasks];
          [(NTKBasePhotosFaceView *)self _scheduleSleepPreloadTask];
        }
      }
    }
    else
    {
      if (v3 != 1) {
        goto LABEL_3;
      }
      if (self->_previousDataMode == 3)
      {
        self->_updateWhenUnpausing = 1;
        goto LABEL_3;
      }
    }
  }
  [(NTKBasePhotosFaceView *)self _updatePaused];
LABEL_3:
  self->_previousDataMode = v4;
}

- (void)_scheduleSleepPreloadTask
{
  self->_preloadedPhotoOnSleep = 0;
  objc_initWeak(&location, self);
  taskScheduler = self->_taskScheduler;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__NTKBasePhotosFaceView__scheduleSleepPreloadTask__block_invoke;
  v5[3] = &unk_1E62C25F8;
  objc_copyWeak(&v6, &location);
  void v5[4] = self;
  id v4 = [(NTKTaskScheduler *)taskScheduler scheduleTask:v5 identifier:@"com.apple.ntk.NTKBasePhotosFaceView"];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __50__NTKBasePhotosFaceView__scheduleSleepPreloadTask__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int64_t v3 = WeakRetained;
  if (WeakRetained && [WeakRetained screenWillGoDark] && !v3[1121])
  {
    uint64_t v4 = 1;
    v3[1096] = 1;
    v3[1120] = 1;
    [v3 _preloadNextPhoto];
    v3[1120] = 0;
    v3[1121] = 1;
    if (v3[1097] && [*(id *)(a1 + 32) _screenOn]) {
      [v3 _playVideoForScreenWake:0];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_preloadNextPhoto
{
  return 0;
}

- (void)_invalidatePreloadedPhoto
{
  self->_preloadedPhotoOnSleep = 0;
}

- (void)_animateIn
{
  memset(&v7, 0, sizeof(v7));
  CGAffineTransformMakeScale(&v7, 0.95, 0.95);
  CGAffineTransform v6 = v7;
  [(UIView *)self->_cornerView setTransform:&v6];
  CGAffineTransform v5 = v7;
  [(NTKPhotoImageView *)self->_posterImageView setTransform:&v5];
  [(NTKPhotoImageView *)self->_posterImageView setAlpha:0.0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__NTKBasePhotosFaceView__animateIn__block_invoke;
  v4[3] = &unk_1E62BFF20;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:0x20000 delay:v4 options:0 animations:0.8 completion:0.0];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__NTKBasePhotosFaceView__animateIn__block_invoke_2;
  v3[3] = &unk_1E62BFF20;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v3 options:0 animations:0.25 completion:0.1];
}

uint64_t __35__NTKBasePhotosFaceView__animateIn__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1072) setAlpha:1.0];
}

uint64_t __35__NTKBasePhotosFaceView__animateIn__block_invoke_2(uint64_t a1)
{
  objc_super v2 = *(void **)(*(void *)(a1 + 32) + 1072);
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v9[0] = *MEMORY[0x1E4F1DAB8];
  long long v6 = v9[0];
  v9[1] = v7;
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  long long v5 = v10;
  [v2 setTransform:v9];
  int64_t v3 = *(void **)(*(void *)(a1 + 32) + 1144);
  v8[0] = v6;
  v8[1] = v7;
  v8[2] = v5;
  return [v3 setTransform:v8];
}

- (void)_handleScreenWake
{
  [(NTKTaskScheduler *)self->_taskScheduler cancelAllTasks];

  [(NTKBasePhotosFaceView *)self _playVideoForScreenWake:0];
}

- (void)_showCurtainView
{
  blackView = self->_blackView;
  if (!blackView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(NTKPhotoImageView *)self->_posterImageView bounds];
    long long v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    long long v6 = self->_blackView;
    self->_blackView = v5;

    long long v7 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)self->_blackView setBackgroundColor:v7];

    blackView = self->_blackView;
  }
  id v8 = [(NTKFaceView *)self foregroundContainerView];
  [(NTKBasePhotosFaceView *)self insertSubview:blackView belowSubview:v8];
}

- (void)_hideCurtainView
{
  [(UIView *)self->_blackView removeFromSuperview];
  blackView = self->_blackView;
  self->_blackView = 0;
}

- (BOOL)_curtainViewVisible
{
  objc_super v2 = [(UIView *)self->_blackView superview];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKBackgroundImageFaceView _configureForTransitionFraction:fromEditMode:toEditMode:](&v9, sel__configureForTransitionFraction_fromEditMode_toEditMode_);
  [(NTKBasePhotosFaceView *)self _applyForegroundAlphaForTransitionFraction:a4 fromEditMode:a5 toEditMode:a3];
}

- (void)_configureForEditMode:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKBasePhotosFaceView;
  -[NTKBackgroundImageFaceView _configureForEditMode:](&v6, sel__configureForEditMode_);
  if (a3 == 14 || a3 == 1)
  {
    long long v5 = +[NTKPhotoAnalysis defaultAnalysis];
    [(NTKBasePhotosFaceView *)self _setDateAttributes:v5 animated:1];
  }
  [(NTKBasePhotosFaceView *)self _applyForegroundAlphaForTransitionFraction:a3 fromEditMode:a3 toEditMode:0.0];
}

- (id)_newGradientViewWithColor:(id)a3
{
  id v3 = a3;
  NTKImageNamed(@"PhotoGradient");
}

- (void)setMonochromeColorMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_monochromeColorMatrix, a3);
  id v4 = [(NTKBasePhotosFaceView *)self palette];
  char v5 = [v4 isOriginalColor];

  if ((v5 & 1) == 0)
  {
    [(NTKBasePhotosFaceView *)self _applyPhotosColor];
  }
}

- (void)_setDateAttributes:(id)a3 animated:(BOOL)a4
{
  uint64_t v4 = a4;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v7 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = [(NTKBasePhotosFaceView *)self dateAlignment];
    objc_super v9 = @"Bottom";
    if (!v8) {
      objc_super v9 = @"Top";
    }
    *(_DWORD *)buf = 138412290;
    v59 = v9;
    _os_log_impl(&dword_1BC5A9000, v7, OS_LOG_TYPE_DEFAULT, "Applying color analysis for %@", buf, 0xCu);
  }

  long long v10 = [MEMORY[0x1E4FB1618] whiteColor];
  legibilityGradientColor = self->_legibilityGradientColor;
  self->_legibilityGradientColor = 0;

  if ([v6 isComplexBackground])
  {
    id v12 = (void *)MEMORY[0x1E4FB1618];
    [v6 bgHue];
    double v14 = v13;
    [v6 bgSaturation];
    double v16 = v15;
    [v6 bgBrightness];
    uint64_t v18 = [v12 colorWithHue:v14 saturation:v16 brightness:v17 alpha:0.7];
    id v19 = self->_legibilityGradientColor;
    self->_legibilityGradientColor = v18;
  }
  else if ([v6 isColoredText])
  {
    double v20 = (void *)MEMORY[0x1E4FB1618];
    [v6 textHue];
    double v22 = v21;
    [v6 textSaturation];
    double v24 = v23;
    [v6 textBrightness];
    uint64_t v26 = [v20 colorWithHue:v22 saturation:v24 brightness:v25 alpha:1.0];

    int v27 = 0;
    char v28 = 0;
    uint64_t v29 = 0;
    long long v10 = (void *)v26;
    goto LABEL_10;
  }
  v30 = (void *)MEMORY[0x1E4FB1618];
  [v6 shadowHue];
  double v32 = v31;
  [v6 shadowSaturation];
  double v34 = v33;
  [v6 shadowBrightness];
  uint64_t v29 = [v30 colorWithHue:v32 saturation:v34 brightness:v35 alpha:*(double *)off_1E62BD1C0];
  char v28 = 4;
  int v27 = 1;
LABEL_10:
  objc_storeStrong((id *)&self->_foregroundColor, v10);
  *((unsigned char *)self + 1184) = *((unsigned char *)self + 1184) & 0xFB | v28;
  objc_storeStrong((id *)&self->_shadowColor, v29);
  v36 = [(NTKFaceView *)self timeView];
  v37 = v36;
  if (v4)
  {
    v38 = (void *)MEMORY[0x1E4FB1EB0];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __53__NTKBasePhotosFaceView__setDateAttributes_animated___block_invoke;
    v52[3] = &unk_1E62C2620;
    id v53 = v36;
    id v54 = v10;
    v55 = self;
    char v57 = v27;
    id v56 = v29;
    [v38 transitionWithView:v53 duration:5242880 options:v52 animations:0 completion:0.5];
    v39 = self->_currentGradientView;
    if (v39)
    {
      currentGradientView = self->_currentGradientView;
      self->_currentGradientView = 0;

      v41 = (void *)MEMORY[0x1E4FB1EB0];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __53__NTKBasePhotosFaceView__setDateAttributes_animated___block_invoke_2;
      v50[3] = &unk_1E62BFF20;
      v51 = v39;
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __53__NTKBasePhotosFaceView__setDateAttributes_animated___block_invoke_3;
      v48[3] = &unk_1E62C2648;
      v49 = v51;
      [v41 animateWithDuration:v50 animations:v48 completion:0.5];
    }
    if (self->_legibilityGradientColor)
    {
      v42 = -[NTKBasePhotosFaceView _newGradientViewWithColor:](self, "_newGradientViewWithColor:");
      v43 = self->_currentGradientView;
      self->_currentGradientView = v42;

      [(NTKPhotoImageView *)self->_posterImageView addSubview:self->_currentGradientView];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __53__NTKBasePhotosFaceView__setDateAttributes_animated___block_invoke_4;
      v47[3] = &unk_1E62BFF20;
      v47[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v47 animations:0.5];
    }

    uint64_t v4 = v4;
  }
  else
  {
    [v36 setColor:v10];
    objc_msgSend(v37, "setUsesLegibility:", v27 & -[NTKBasePhotosFaceView _timeLabelUsesLegibility](self, "_timeLabelUsesLegibility"));
    [v37 setShadowColor:v29];
    [(UIView *)self->_currentGradientView removeFromSuperview];
    v44 = self->_currentGradientView;
    self->_currentGradientView = 0;

    if (self->_legibilityGradientColor)
    {
      v45 = -[NTKBasePhotosFaceView _newGradientViewWithColor:](self, "_newGradientViewWithColor:");
      v46 = self->_currentGradientView;
      self->_currentGradientView = v45;

      [(UIView *)self->_currentGradientView setAlpha:1.0];
      [(NTKPhotoImageView *)self->_posterImageView addSubview:self->_currentGradientView];
    }
  }
  [(NTKBasePhotosFaceView *)self _applyComplicationContentSpecificAttributesAnimated:v4];
  [(NTKBasePhotosFaceView *)self setNeedsLayout];
}

uint64_t __53__NTKBasePhotosFaceView__setDateAttributes_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setColor:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 48) _timeLabelUsesLegibility]) {
    BOOL v2 = *(unsigned char *)(a1 + 64) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  [*(id *)(a1 + 32) setUsesLegibility:v2];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);

  return [v3 setShadowColor:v4];
}

uint64_t __53__NTKBasePhotosFaceView__setDateAttributes_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __53__NTKBasePhotosFaceView__setDateAttributes_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __53__NTKBasePhotosFaceView__setDateAttributes_animated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1176) setAlpha:1.0];
}

- (void)imageViewDidBeginPlaying:(id)a3
{
  if (self->_isStartingPlaybackOnSingleTap)
  {
    self->_isStartingPlaybackOnSingleTap = 0;
    [(NTKBasePhotosFaceView *)self _didStartPlayingIrisOnSingleTap];
  }
  else
  {
    if ([(NTKBasePhotosFaceView *)self _curtainViewVisible]) {
      [(NTKBasePhotosFaceView *)self _animateIn];
    }
    [(NTKBasePhotosFaceView *)self _hideCurtainView];
  }
}

- (void)_applyScrubbingForegroundColor:(id)a3 shadowColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(NTKFaceView *)self timeView];
  [v8 setColor:v6];
  [v8 setShadowColor:v7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__NTKBasePhotosFaceView__applyScrubbingForegroundColor_shadowColor___block_invoke;
  v11[3] = &unk_1E62C15B0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NTKFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v11];
}

void __68__NTKBasePhotosFaceView__applyScrubbingForegroundColor_shadowColor___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 display];
  [v4 setForegroundColor:*(void *)(a1 + 32)];
  [v4 setShadowColor:*(void *)(a1 + 40)];
}

- (void)_startScrubbingAnimationFromUIViewAnimateWithDuration
{
  id v4 = [MEMORY[0x1E4FB1618] whiteColor];
  id v3 = [MEMORY[0x1E4FB1618] clearColor];
  [(NTKBasePhotosFaceView *)self _applyScrubbingForegroundColor:v4 shadowColor:v3];
}

- (void)_endScrubbingAnimationFromUIViewAnimateWithDuration
{
}

- (BOOL)screenWillGoDark
{
  return 1;
}

- (UIView)cornerView
{
  return self->_cornerView;
}

- (NTKPhotoImageView)posterImageView
{
  return self->_posterImageView;
}

- (BOOL)isInteractive
{
  return (*((unsigned __int8 *)self + 1184) >> 1) & 1;
}

- (NTKAlbumEmptyView)noPhotosView
{
  return self->_noPhotosView;
}

- (BOOL)isNoPhotosViewVisible
{
  return self->_noPhotosViewVisible;
}

- (UIImage)photosColorRamp
{
  return self->_photosColorRamp;
}

- (UIImage)photosMonoColorRamp
{
  return self->_photosMonoColorRamp;
}

- (NSValue)monochromeColorMatrix
{
  return self->_monochromeColorMatrix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monochromeColorMatrix, 0);
  objc_storeStrong((id *)&self->_photosMonoColorRamp, 0);
  objc_storeStrong((id *)&self->_photosColorRamp, 0);
  objc_storeStrong((id *)&self->_noPhotosView, 0);
  objc_storeStrong((id *)&self->_complicationFactory, 0);
  objc_storeStrong((id *)&self->_currentGradientView, 0);
  objc_storeStrong((id *)&self->_legibilityGradientColor, 0);
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_cornerView, 0);
  objc_storeStrong((id *)&self->_taskScheduler, 0);
  objc_storeStrong((id *)&self->_playOnWakeTimeout, 0);
  objc_storeStrong((id *)&self->_blackView, 0);

  objc_storeStrong((id *)&self->_posterImageView, 0);
}

- (Class)photosFaceClass
{
  return 0;
}

@end