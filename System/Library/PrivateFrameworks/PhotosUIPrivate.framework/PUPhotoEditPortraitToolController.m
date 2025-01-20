@interface PUPhotoEditPortraitToolController
- (BOOL)_canRenderPortraitEffect;
- (BOOL)_setupApertureControlsIfNeeded;
- (BOOL)_setupDepthControlsIfNeeded;
- (BOOL)_setupLightingControlsIfNeeded;
- (BOOL)_shouldShowPortraitFocusEditingUI;
- (BOOL)_shouldShowPortraitV2;
- (BOOL)apertureToolbarIsDepthActive;
- (BOOL)apertureToolbarShouldRotateLabelsWithOrientation:(id)a3;
- (BOOL)canResetToDefaultValue;
- (BOOL)wantsScrubberKeyControl;
- (BOOL)wantsSecondaryToolbarVisible;
- (BOOL)wantsSliderKeyControl;
- (BOOL)wantsTapToToggleOriginalEnabled;
- (BOOL)wantsZoomAndPanEnabled;
- (CEKLightingControl)lightingControl;
- (CGRect)currentFocusRect;
- (PUPhotoEditApertureToolbar)apertureToolbar;
- (id)_depthButtonTitle;
- (id)accessibilityHUDItemForButton:(id)a3;
- (id)centerToolbarView;
- (id)leadingToolbarViews;
- (id)localizedName;
- (id)selectedToolbarIconGlyphName;
- (id)toolbarIconAccessibilityLabel;
- (id)toolbarIconGlyphName;
- (int64_t)_defaultPortraitTool;
- (int64_t)toolControllerTag;
- (int64_t)toolSelection;
- (unint64_t)depthInfoMajorVersion;
- (unint64_t)depthInfoMinorVersion;
- (unint64_t)majorVersion;
- (unint64_t)minorVersion;
- (unint64_t)sDOFRenderingVersion;
- (void)_createFocusOverlayIfNeeded;
- (void)_didModifyLightingIntensity;
- (void)_handlePortraitEffectButton:(id)a3;
- (void)_handlePortraitNavigationButtons:(id)a3;
- (void)_refreshFromValuesCalculator;
- (void)_removeFocusOverlayIfNeeded;
- (void)_resetDefaultToolMode;
- (void)_restoreCachedLightingIntensity;
- (void)_selectNextEffectType:(BOOL)a3;
- (void)_setShowLightingControl:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateApertureSliderLength;
- (void)_updateCompositionWithLightingIntensity;
- (void)_updateFocusOverlay;
- (void)_updateFocusOverlayConstraints;
- (void)_updateLabelOrientation;
- (void)_updateLightingControl;
- (void)_updateLightingIntensityCache;
- (void)_updateLightingMarkerForType:(int64_t)a3;
- (void)_updateLightingNameBadgeForOrientation:(int64_t)a3 expanded:(BOOL)a4;
- (void)_updateLightingSliderAnimated:(BOOL)a3;
- (void)_updateNavigationButtonsAnimated:(BOOL)a3;
- (void)_updateToolConstraints;
- (void)_updateToolContainerConstraints;
- (void)_updateToolVisibilityAnimated:(BOOL)a3;
- (void)apertureToolbar:(id)a3 didChangeValue:(double)a4;
- (void)apertureToolbar:(id)a3 didUpdateDepthActive:(BOOL)a4;
- (void)apertureToolbarDidStartSliding:(id)a3;
- (void)apertureToolbarDidStopSliding:(id)a3;
- (void)compositionControllerDidChangeForAdjustments:(id)a3;
- (void)decreaseScrubberValue:(BOOL)a3;
- (void)decreaseSliderValue:(BOOL)a3;
- (void)focusRectChanged:(CGRect)a3;
- (void)increaseScrubberValue:(BOOL)a3;
- (void)increaseSliderValue:(BOOL)a3;
- (void)lightingControl:(id)a3 willChangeExpanded:(BOOL)a4;
- (void)lightingControlDidChangeExpanded:(id)a3;
- (void)lightingControlDidChangeSelectedLightingType:(id)a3;
- (void)longPressed:(id)a3;
- (void)mediaView:(id)a3 didZoom:(double)a4;
- (void)mediaViewDidScroll:(id)a3;
- (void)mediaViewIsReady;
- (void)navigateToNextTab:(id)a3;
- (void)navigateToPreviousTab:(id)a3;
- (void)previewingOriginalDidStart;
- (void)previewingOriginalDidStop;
- (void)reactivate;
- (void)setBackdropViewGroupName:(id)a3;
- (void)setDepthInfoMajorVersion:(unint64_t)a3;
- (void)setDepthInfoMinorVersion:(unint64_t)a3;
- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4;
- (void)setMajorVersion:(unint64_t)a3;
- (void)setMinorVersion:(unint64_t)a3;
- (void)setPhotoEditSpec:(id)a3;
- (void)setSDOFRenderingVersion:(unint64_t)a3;
- (void)setToolSelection:(int64_t)a3;
- (void)setToolSelection:(int64_t)a3 animated:(BOOL)a4;
- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6;
- (void)sliderDidEndScrolling:(id)a3;
- (void)sliderDidScroll:(id)a3;
- (void)sliderWillBeginScrolling:(id)a3;
- (void)sliderWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)toolControllerWantsToShowOriginal:(BOOL)a3;
- (void)updateViewConstraints;
- (void)validateCommand:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willBecomeActiveTool;
@end

@implementation PUPhotoEditPortraitToolController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightingControl, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_focusOverlayControllerConstraints, 0);
  objc_storeStrong((id *)&self->_focusOverlayController, 0);
  objc_storeStrong((id *)&self->_lightingIntensityCache, 0);
  objc_storeStrong((id *)&self->_cachedSpillMatteAllowed, 0);
  objc_storeStrong((id *)&self->_cachedPortraitEffectSettings, 0);
  objc_storeStrong((id *)&self->_toolConstraints, 0);
  objc_storeStrong((id *)&self->_apertureToolbar, 0);
  objc_storeStrong((id *)&self->_lightingSlider, 0);
  objc_storeStrong((id *)&self->_lightingControlConstraints, 0);
  objc_storeStrong((id *)&self->_lightingNameBadgeConstraints, 0);
  objc_storeStrong((id *)&self->_lightingNameBadge, 0);
  objc_storeStrong((id *)&self->_lightingGradient, 0);
  objc_storeStrong((id *)&self->_portraitToolbarButton, 0);
  objc_storeStrong((id *)&self->_containerConstraints, 0);
  objc_storeStrong((id *)&self->_apertureContainer, 0);
  objc_storeStrong((id *)&self->_lightingContainer, 0);
  objc_storeStrong((id *)&self->_lightingIntensityButton, 0);
  objc_storeStrong((id *)&self->_apertureButton, 0);
}

- (void)setDepthInfoMinorVersion:(unint64_t)a3
{
  self->_depthInfoMinorVersion = a3;
}

- (unint64_t)depthInfoMinorVersion
{
  return self->_depthInfoMinorVersion;
}

- (void)setDepthInfoMajorVersion:(unint64_t)a3
{
  self->_depthInfoMajorVersion = a3;
}

- (unint64_t)depthInfoMajorVersion
{
  return self->_depthInfoMajorVersion;
}

- (void)setSDOFRenderingVersion:(unint64_t)a3
{
  self->_sDOFRenderingVersion = a3;
}

- (unint64_t)sDOFRenderingVersion
{
  return self->_sDOFRenderingVersion;
}

- (void)setMinorVersion:(unint64_t)a3
{
  self->_minorVersion = a3;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (void)setMajorVersion:(unint64_t)a3
{
  self->_majorVersion = a3;
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (int64_t)toolSelection
{
  return self->_toolSelection;
}

- (CEKLightingControl)lightingControl
{
  return self->_lightingControl;
}

- (PUPhotoEditApertureToolbar)apertureToolbar
{
  return self->_apertureToolbar;
}

- (void)mediaViewDidScroll:(id)a3
{
  focusOverlayController = self->_focusOverlayController;
  if (focusOverlayController)
  {
    v5 = [(PUPhotoEditPortraitFocusOverlayViewController *)focusOverlayController view];
    [v5 setNeedsLayout];

    id v7 = [(PUPhotoEditPortraitFocusOverlayViewController *)self->_focusOverlayController view];
    v6 = [v7 layer];
    [v6 setNeedsDisplay];
  }
}

- (void)mediaView:(id)a3 didZoom:(double)a4
{
  focusOverlayController = self->_focusOverlayController;
  if (focusOverlayController)
  {
    v6 = [(PUPhotoEditPortraitFocusOverlayViewController *)focusOverlayController view];
    [v6 setNeedsLayout];

    id v8 = [(PUPhotoEditPortraitFocusOverlayViewController *)self->_focusOverlayController view];
    id v7 = [v8 layer];
    [v7 setNeedsDisplay];
  }
}

- (void)mediaViewIsReady
{
  focusOverlayController = self->_focusOverlayController;
  if (focusOverlayController) {
    [(PUPhotoEditPortraitFocusOverlayViewController *)focusOverlayController mediaViewIsReady];
  }
}

- (void)toolControllerWantsToShowOriginal:(BOOL)a3
{
  id v4 = [(PUPhotoEditToolController *)self delegate];
  [v4 toolControllerWantsToToggleOriginal:self];
}

- (CGRect)currentFocusRect
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v6 = [(PUPhotoEditToolController *)self compositionController];
  id v7 = [v6 depthAdjustmentController];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 focusRect];
    if (v9
      || ([v8 depthInfo],
          v10 = objc_claimAutoreleasedReturnValue(),
          [v10 objectForKeyedSubscript:@"focusRect"],
          v9 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9))
    {
      v11 = [v9 objectForKeyedSubscript:@"x"];
      v12 = [v9 objectForKeyedSubscript:@"y"];
      v13 = [v9 objectForKeyedSubscript:@"w"];
      v14 = [v9 objectForKeyedSubscript:@"h"];
      [v11 floatValue];
      double v2 = v15;
      [v12 floatValue];
      double v3 = v16;
      [v13 floatValue];
      double v4 = v17;
      [v14 floatValue];
      double v5 = v18;
    }
  }

  double v19 = v2;
  double v20 = v3;
  double v21 = v4;
  double v22 = v5;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)focusRectChanged:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(PUPhotoEditToolController *)self willModifyAdjustment];
  id v8 = [(PUPhotoEditToolController *)self compositionController];
  v9 = [v8 adjustmentConstants];
  v10 = [v9 PIDepthAdjustmentKey];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__PUPhotoEditPortraitToolController_focusRectChanged___block_invoke;
  v13[3] = &__block_descriptor_64_e32_v16__0__PIAdjustmentController_8l;
  *(CGFloat *)&v13[4] = x;
  *(CGFloat *)&v13[5] = y;
  *(CGFloat *)&v13[6] = width;
  *(CGFloat *)&v13[7] = height;
  [v8 modifyAdjustmentWithKey:v10 modificationBlock:v13];

  v11 = PULocalizedString(@"PHOTOEDIT_PORTRAIT_FOCUS_RECT_ACTION_TITLE");
  id v12 = [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v11];
}

void __54__PUPhotoEditPortraitToolController_focusRectChanged___block_invoke(double *a1, void *a2)
{
  double v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v9 = [v3 dictionary];
  double v5 = [NSNumber numberWithDouble:a1[7]];
  [v9 setObject:v5 forKeyedSubscript:@"h"];

  v6 = [NSNumber numberWithDouble:a1[6]];
  [v9 setObject:v6 forKeyedSubscript:@"w"];

  id v7 = [NSNumber numberWithDouble:a1[4]];
  [v9 setObject:v7 forKeyedSubscript:@"x"];

  id v8 = [NSNumber numberWithDouble:a1[5]];
  [v9 setObject:v8 forKeyedSubscript:@"y"];

  [v4 setFocusRect:v9];
}

- (BOOL)apertureToolbarIsDepthActive
{
  double v2 = [(PUPhotoEditToolController *)self compositionController];
  double v3 = [v2 depthAdjustmentController];
  char v4 = [v3 enabled];

  return v4;
}

- (void)apertureToolbar:(id)a3 didUpdateDepthActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = [(PUPhotoEditToolController *)self compositionController];
  v6 = [(PUPhotoEditToolController *)self delegate];
  id v7 = [v6 livePortraitBehaviorController];

  +[PUPhotoEditEffectsSupport updateCompositionController:v8 withDepthEnabled:v4 livePortraitBehaviorController:v7];
}

- (BOOL)apertureToolbarShouldRotateLabelsWithOrientation:(id)a3
{
  double v3 = [(PUPhotoEditToolController *)self photoEditSpec];
  BOOL v4 = [v3 currentLayoutStyle] == 4;

  return v4;
}

- (void)apertureToolbarDidStopSliding:(id)a3
{
  [(PUPhotoEditToolController *)self setActivelyAdjusting:0];
  [(PUPhotoEditToolController *)self setPerformingLiveInteraction:0];
  BOOL v4 = PULocalizedString(@"PHOTOEDIT_PORTRAIT_APERTURE_ACTION_TITLE");
  id v5 = [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v4];

  id v11 = [(PUPhotoEditPortraitToolController *)self apertureToolbar];
  [v11 apertureValue];
  if (v6 == 0.0)
  {
    double lastKnownAperture = self->_lastKnownAperture;

    if (lastKnownAperture > 0.0)
    {
      self->_suspendUIUpdatesFromComposition = 1;
      id v8 = [(PUPhotoEditToolController *)self compositionController];
      id v9 = [v8 adjustmentConstants];
      v10 = [v9 PIDepthAdjustmentKey];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __67__PUPhotoEditPortraitToolController_apertureToolbarDidStopSliding___block_invoke;
      v12[3] = &unk_1E5F28540;
      v12[4] = self;
      [v8 modifyAdjustmentWithKey:v10 modificationBlock:v12];

      self->_suspendUIUpdatesFromComposition = 0;
    }
  }
  else
  {
  }
}

uint64_t __67__PUPhotoEditPortraitToolController_apertureToolbarDidStopSliding___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAperture:*(double *)(*(void *)(a1 + 32) + 1296)];
}

- (void)apertureToolbarDidStartSliding:(id)a3
{
  [(PUPhotoEditToolController *)self setActivelyAdjusting:1];
  [(PUPhotoEditToolController *)self setPerformingLiveInteraction:1];
  [(PUPhotoEditToolController *)self willModifyAdjustment];
  [(PUPhotoEditApertureToolbar *)self->_apertureToolbar apertureValue];
  if (v4 > 0.0)
  {
    id v6 = [(PUPhotoEditPortraitToolController *)self apertureToolbar];
    [v6 apertureValue];
    self->_double lastKnownAperture = v5;
  }
}

- (void)apertureToolbar:(id)a3 didChangeValue:(double)a4
{
  double v5 = [(PUPhotoEditToolController *)self compositionController];
  id v6 = [v5 adjustmentConstants];
  id v7 = [v6 PIDepthAdjustmentKey];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__PUPhotoEditPortraitToolController_apertureToolbar_didChangeValue___block_invoke;
  v8[3] = &__block_descriptor_40_e37_v16__0__PIDepthAdjustmentController_8l;
  *(double *)&v8[4] = a4;
  [v5 modifyAdjustmentWithKey:v7 modificationBlock:v8];
}

uint64_t __68__PUPhotoEditPortraitToolController_apertureToolbar_didChangeValue___block_invoke(uint64_t a1, void *a2)
{
  float v2 = *(double *)(a1 + 32);
  return [a2 setAperture:v2];
}

- (void)_updateLightingIntensityCache
{
  if (self->_lightingSlider)
  {
    double v3 = [(PUPhotoEditPortraitToolController *)self lightingControl];
    uint64_t v4 = [v3 selectedLightingType];

    if (v4)
    {
      lightingIntensityCache = self->_lightingIntensityCache;
      id v6 = NSNumber;
      [(CEKSlider *)self->_lightingSlider value];
      objc_msgSend(v6, "numberWithDouble:");
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v7 = [NSNumber numberWithInteger:v4];
      [(NSMutableDictionary *)lightingIntensityCache setObject:v8 forKey:v7];
    }
  }
}

- (void)_restoreCachedLightingIntensity
{
  [(PUPhotoEditPortraitToolController *)self _updateLightingSliderAnimated:1];
  double v3 = [(PUPhotoEditPortraitToolController *)self lightingControl];
  uint64_t v4 = [v3 selectedLightingType];

  if (v4)
  {
    lightingIntensityCache = self->_lightingIntensityCache;
    id v6 = [NSNumber numberWithInteger:v4];
    id v9 = [(NSMutableDictionary *)lightingIntensityCache objectForKey:v6];

    if (v9)
    {
      [v9 floatValue];
      double v8 = v7;
    }
    else
    {
      double v8 = 0.5;
    }
    if ([(CEKSlider *)self->_lightingSlider isEnabled])
    {
      [(CEKSlider *)self->_lightingSlider setValue:v8];
      [(PUPhotoEditPortraitToolController *)self _updateCompositionWithLightingIntensity];
    }
  }
}

- (void)_updateCompositionWithLightingIntensity
{
  double v3 = [(PUPhotoEditToolController *)self compositionController];
  uint64_t v4 = [v3 adjustmentConstants];
  double v5 = [v4 PIPortraitAdjustmentKey];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__PUPhotoEditPortraitToolController__updateCompositionWithLightingIntensity__block_invoke;
  v6[3] = &unk_1E5F2E620;
  v6[4] = self;
  [v3 modifyAdjustmentWithKey:v5 modificationBlock:v6];
}

void __76__PUPhotoEditPortraitToolController__updateCompositionWithLightingIntensity__block_invoke(uint64_t a1, void *a2)
{
  float v2 = *(void **)(*(void *)(a1 + 32) + 1280);
  id v4 = a2;
  [v2 value];
  *(float *)&double v3 = v3;
  [v4 setStrength:*(float *)&v3];
}

- (void)_updateLightingNameBadgeForOrientation:(int64_t)a3 expanded:(BOOL)a4
{
  BOOL v4 = a4;
  float v7 = [(PUPhotoEditPortraitToolController *)self view];

  if (!v7) {
    return;
  }
  uint64_t v8 = a3 != 1 || !v4;
  [(CEKLightingControl *)self->_lightingControl setNameBadgeHidden:v8 animated:1];
  lightingNameBadge = self->_lightingNameBadge;
  if (a3 == 1)
  {
    if (!lightingNameBadge) {
      return;
    }
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_lightingNameBadgeConstraints];
    [(CEKLightingNameBadge *)self->_lightingNameBadge removeFromSuperview];
    float v17 = self->_lightingNameBadge;
    self->_lightingNameBadge = 0;

    lightingNameBadgeConstraints = self->_lightingNameBadgeConstraints;
    self->_lightingNameBadgeConstraints = 0;
    goto LABEL_14;
  }
  if (!lightingNameBadge)
  {
    v10 = (CEKLightingNameBadge *)objc_alloc_init(MEMORY[0x1E4F57D60]);
    id v11 = self->_lightingNameBadge;
    self->_lightingNameBadge = v10;

    [(CEKLightingNameBadge *)self->_lightingNameBadge setHighlighted:1];
    [(CEKLightingNameBadge *)self->_lightingNameBadge setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CEKLightingNameBadge *)self->_lightingNameBadge setLightingType:[(CEKLightingControl *)self->_lightingControl selectedLightingType]];
    id v12 = [(PUPhotoEditPortraitToolController *)self view];
    [v12 addSubview:self->_lightingNameBadge];

    int v13 = [(CEKLightingControl *)self->_lightingControl isExpanded];
    double v14 = 0.0;
    if (v13) {
      double v14 = 1.0;
    }
    [(CEKLightingNameBadge *)self->_lightingNameBadge setAlpha:v14];
  }
  if (self->_lightingNameBadgeConstraints)
  {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    float v15 = self->_lightingNameBadgeConstraints;
    self->_lightingNameBadgeConstraints = 0;

    float v18 = [(PUPhotoEditPortraitToolController *)self view];
    [(NSArray *)v18 setNeedsUpdateConstraints];
    lightingNameBadgeConstraints = v18;
LABEL_14:
  }
}

- (void)_updateLabelOrientation
{
  double v3 = [(PUPhotoEditToolController *)self photoEditSpec];
  uint64_t v4 = [v3 currentLayoutStyle];

  if (v4 == 4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v5 = 2 * ([(PUPhotoEditToolController *)self layoutOrientation] == 2);
    lightingSlider = self->_lightingSlider;
    [(CEKSlider *)lightingSlider setTextOrientation:v5 animated:1];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PUPhotoEditPortraitToolController;
  id v7 = a4;
  -[PUPhotoEditToolController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__PUPhotoEditPortraitToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5F2B9D0;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

void __88__PUPhotoEditPortraitToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setNeedsDisplay];
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUPhotoEditPortraitToolController;
  [(PUPhotoEditToolController *)&v12 setLayoutOrientation:a3 withTransitionCoordinator:v6];
  [(PUPhotoEditPortraitToolController *)self _updateLabelOrientation];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__PUPhotoEditPortraitToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke;
  aBlock[3] = &unk_1E5F2E0A8;
  aBlock[4] = self;
  aBlock[5] = a3;
  id v7 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v8 = v7;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__PUPhotoEditPortraitToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2;
    v9[3] = &unk_1E5F28AC0;
    v10 = v7;
    [v6 animateAlongsideTransition:v9 completion:0];
  }
  else
  {
    v7[2](v7);
  }
}

void __84__PUPhotoEditPortraitToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateLightingNameBadgeForOrientation:expanded:", *(void *)(a1 + 40), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1368), "isExpanded"));
  float v2 = *(void **)(a1 + 32);
  if (v2[157])
  {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 1256);
    *(void *)(v3 + 1256) = 0;

    uint64_t v5 = [*(id *)(a1 + 32) view];
    [v5 setNeedsUpdateConstraints];

    float v2 = *(void **)(a1 + 32);
  }
  if (v2[151])
  {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 1208);
    *(void *)(v6 + 1208) = 0;

    float v2 = *(void **)(a1 + 32);
  }
  if (v2[163])
  {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    uint64_t v8 = *(void *)(a1 + 32);
    objc_super v9 = *(void **)(v8 + 1304);
    *(void *)(v8 + 1304) = 0;

    v10 = [*(id *)(a1 + 32) view];
    [v10 setNeedsUpdateConstraints];

    float v2 = *(void **)(a1 + 32);
  }
  [v2 _updateApertureSliderLength];
  id v11 = [*(id *)(a1 + 32) view];
  [v11 setNeedsUpdateConstraints];
}

uint64_t __84__PUPhotoEditPortraitToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPhotoEditSpec:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditPortraitToolController;
  [(PUPhotoEditToolController *)&v4 setPhotoEditSpec:a3];
  [(PUPhotoEditPortraitToolController *)self _updateLabelOrientation];
}

- (void)_didModifyLightingIntensity
{
  [(PUPhotoEditPortraitToolController *)self _updateLightingIntensityCache];
  [(PUPhotoEditPortraitToolController *)self _setShowLightingControl:1 animated:1];
  PULocalizedString(@"PHOTOEDIT_PORTRAIT_LIGHTING_INTENSITY_ACTION_TITLE");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v4];
}

- (void)sliderDidEndScrolling:(id)a3
{
  [(PUPhotoEditToolController *)self setActivelyAdjusting:0];
  [(PUPhotoEditToolController *)self setPerformingLiveInteraction:0];
  [(PUPhotoEditPortraitToolController *)self _didModifyLightingIntensity];
}

- (void)sliderWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  -[PUPhotoEditToolController setPerformingLiveInteraction:](self, "setPerformingLiveInteraction:", 0, a5, a4.x, a4.y);
  if (x == 0.0)
  {
    [(PUPhotoEditPortraitToolController *)self _didModifyLightingIntensity];
  }
}

- (void)sliderDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUPhotoEditToolController *)self compositionController];
  uint64_t v6 = [v5 portraitAdjustmentController];
  [v6 strength];
  [v4 value];

  LOBYTE(v4) = PXFloatEqualToFloatWithTolerance();
  if ((v4 & 1) == 0)
  {
    [(PUPhotoEditPortraitToolController *)self _updateCompositionWithLightingIntensity];
  }
}

- (void)sliderWillBeginScrolling:(id)a3
{
  [(PUPhotoEditToolController *)self setActivelyAdjusting:1];
  [(PUPhotoEditToolController *)self setPerformingLiveInteraction:1];
  if (objc_opt_respondsToSelector())
  {
    [(PUPhotoEditToolController *)self willModifyAdjustment];
    [(PUPhotoEditPortraitToolController *)self _setShowLightingControl:0 animated:1];
  }
}

- (void)_setShowLightingControl:(BOOL)a3 animated:(BOOL)a4
{
  if (a3) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  if (!a4 || (BOOL v6 = a3, [(CEKLightingControl *)self->_lightingControl alpha], v7 == v5))
  {
    lightingControl = self->_lightingControl;
    [(CEKLightingControl *)lightingControl setAlpha:v5];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__PUPhotoEditPortraitToolController__setShowLightingControl_animated___block_invoke;
    v10[3] = &unk_1E5F2E0A8;
    if (v6) {
      uint64_t v8 = 0x10000;
    }
    else {
      uint64_t v8 = 0x20000;
    }
    v10[4] = self;
    *(double *)&v10[5] = v5;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v8 delay:v10 options:0 animations:0.5 completion:0.0];
  }
}

uint64_t __70__PUPhotoEditPortraitToolController__setShowLightingControl_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1368) setAlpha:*(double *)(a1 + 40)];
}

- (void)lightingControlDidChangeExpanded:(id)a3
{
  uint64_t v4 = [(CEKLightingControl *)self->_lightingControl isExpanded];
  [(PUPhotoEditToolController *)self setActivelyAdjusting:v4];
  [(PUPhotoEditToolController *)self setPerformingLiveInteraction:v4];
  if ((v4 & 1) == 0)
  {
    double v5 = PULocalizedString(@"PHOTOEDIT_PORTRAIT_LIGHTING_ACTION_TITLE");
    id v6 = [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v5];

    lightingControl = self->_lightingControl;
    [(CEKLightingControl *)lightingControl setMaskView:0];
  }
}

- (void)lightingControl:(id)a3 willChangeExpanded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(PUPhotoEditToolController *)self setActivelyAdjusting:v4];
  [(PUPhotoEditToolController *)self setPerformingLiveInteraction:v4];
  if (v4)
  {
    [(PUPhotoEditToolController *)self willModifyAdjustment];
    [(CEKLightingControl *)self->_lightingControl frame];
    PXRectWithOriginAndSize();
    -[_PULightingGradientView setFrame:](self->_lightingGradient, "setFrame:");
    [(CEKLightingControl *)self->_lightingControl setMaskView:self->_lightingGradient];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__PUPhotoEditPortraitToolController_lightingControl_willChangeExpanded___block_invoke;
  v20[3] = &unk_1E5F2E0A8;
  v20[4] = self;
  *(double *)&v20[5] = (double)v4;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v20 animations:0.25];
  [(PUPhotoEditPortraitToolController *)self _updateLightingNameBadgeForOrientation:[(PUPhotoEditToolController *)self layoutOrientation] expanded:v4];
  double v7 = [(PUPhotoEditToolController *)self delegate];
  uint64_t v8 = [v7 livePortraitBehaviorController];

  if ([v8 hasLivePortrait])
  {
    if (v4)
    {
      objc_super v9 = [(PUPhotoEditToolController *)self delegate];
      self->_livePhotoOnBeforeAdjustingLighting = [v9 isVideoOn];
LABEL_6:

      goto LABEL_7;
    }
    uint64_t v15 = [v6 selectedLightingType];
    float v16 = +[PUPhotoEditProtoSettings sharedInstance];
    int v17 = [v16 changeLightingDisablesLive];

    if (v17)
    {
      if ((unint64_t)(v15 - 2) < 5) {
        goto LABEL_7;
      }
    }
    else if ((unint64_t)(v15 - 4) < 3)
    {
      goto LABEL_7;
    }
    if (self->_livePhotoOnBeforeAdjustingLighting)
    {
      float v18 = [(PUPhotoEditToolController *)self delegate];
      char v19 = [v18 isVideoOn];

      if ((v19 & 1) == 0)
      {
        objc_super v9 = [(PUPhotoEditToolController *)self delegate];
        [v9 toggleLivePhotoActive];
        goto LABEL_6;
      }
    }
  }
LABEL_7:
  v10 = [(PUPhotoEditToolController *)self compositionController];
  id v11 = [v10 portraitAdjustmentController];

  if (v4 && ([v11 enabled] & 1) == 0)
  {
    if ([(PUPhotoEditPortraitToolController *)self _shouldShowPortraitV2]) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }
    int v13 = +[PUPhotoEditEffectsSupport identifierForLightingType:lightingVersion:](PUPhotoEditEffectsSupport, "identifierForLightingType:lightingVersion:", [v6 selectedLightingType], v12);
    double v14 = [(PUPhotoEditToolController *)self compositionController];
    +[PUPhotoEditEffectsSupport updateCompositionController:v14 withLightingIdentifier:v13 portraitInfo:self->_cachedPortraitEffectSettings spillMatteAllowed:self->_cachedSpillMatteAllowed];
  }
}

uint64_t __72__PUPhotoEditPortraitToolController_lightingControl_willChangeExpanded___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1248) setAlpha:*(double *)(a1 + 40)];
}

- (void)lightingControlDidChangeSelectedLightingType:(id)a3
{
  id v4 = a3;
  double v5 = [(PUPhotoEditToolController *)self compositionController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__PUPhotoEditPortraitToolController_lightingControlDidChangeSelectedLightingType___block_invoke;
  v7[3] = &unk_1E5F2ECC8;
  id v8 = v4;
  objc_super v9 = self;
  id v6 = v4;
  [v5 performChanges:v7];
}

void __82__PUPhotoEditPortraitToolController_lightingControlDidChangeSelectedLightingType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) selectedLightingType];
  if ([*(id *)(a1 + 40) _shouldShowPortraitV2]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  id v11 = +[PUPhotoEditEffectsSupport identifierForLightingType:v2 lightingVersion:v3];
  id v4 = [*(id *)(a1 + 40) compositionController];
  +[PUPhotoEditEffectsSupport updateCompositionController:v4 withLightingIdentifier:v11 portraitInfo:*(void *)(*(void *)(a1 + 40) + 1312) spillMatteAllowed:*(void *)(*(void *)(a1 + 40) + 1320)];

  [*(id *)(*(void *)(a1 + 40) + 1248) setLightingType:v2];
  [*(id *)(*(void *)(a1 + 40) + 1248) invalidateIntrinsicContentSize];
  double v5 = [*(id *)(a1 + 40) delegate];
  id v6 = [v5 livePortraitBehaviorController];

  double v7 = +[PUPhotoEditProtoSettings sharedInstance];
  char v8 = [v7 apertureSliderHasOffPosition];

  if ((v8 & 1) == 0)
  {
    objc_super v9 = [*(id *)(a1 + 40) compositionController];
    +[PUPhotoEditEffectsSupport updateCompositionController:v9 withDepthEnabled:1 livePortraitBehaviorController:v6];
  }
  v10 = [*(id *)(a1 + 40) compositionController];
  [v6 applySideEffectsForAction:1 compositionController:v10];

  [*(id *)(a1 + 40) _restoreCachedLightingIntensity];
  [*(id *)(a1 + 40) _updateLightingMarkerForType:v2];
  [*(id *)(a1 + 40) _updateFocusOverlay];
}

- (void)navigateToNextTab:(id)a3
{
  [(PUPhotoEditPortraitToolController *)self setToolSelection:2 animated:1];
  [(PUPhotoEditPortraitToolController *)self _updateNavigationButtonsAnimated:1];
}

- (void)navigateToPreviousTab:(id)a3
{
  [(PUPhotoEditPortraitToolController *)self setToolSelection:1 animated:1];
  [(PUPhotoEditPortraitToolController *)self _updateNavigationButtonsAnimated:1];
}

- (void)decreaseSliderValue:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(UIView *)self->_lightingContainer isHidden])
  {
    +[PUPhotoEditSupport changeValueOfSlider:self->_lightingSlider reverse:0 coarse:v3];
    [(PUPhotoEditPortraitToolController *)self _updateCompositionWithLightingIntensity];
  }
}

- (void)increaseSliderValue:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(UIView *)self->_lightingContainer isHidden])
  {
    +[PUPhotoEditSupport changeValueOfSlider:self->_lightingSlider reverse:1 coarse:v3];
    [(PUPhotoEditPortraitToolController *)self _updateCompositionWithLightingIntensity];
  }
}

- (BOOL)wantsSliderKeyControl
{
  return 1;
}

- (void)decreaseScrubberValue:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIView *)self->_lightingContainer isHidden])
  {
    if (![(UIView *)self->_apertureContainer isHidden]
      && [(PUPhotoEditApertureToolbar *)self->_apertureToolbar setNextApertureValue:0 coarse:v3])
    {
      apertureToolbar = self->_apertureToolbar;
      [(PUPhotoEditApertureToolbar *)apertureToolbar apertureValue];
      -[PUPhotoEditPortraitToolController apertureToolbar:didChangeValue:](self, "apertureToolbar:didChangeValue:", apertureToolbar);
    }
  }
  else
  {
    [(PUPhotoEditPortraitToolController *)self _selectNextEffectType:0];
  }
}

- (void)increaseScrubberValue:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIView *)self->_lightingContainer isHidden])
  {
    if (![(UIView *)self->_apertureContainer isHidden]
      && [(PUPhotoEditApertureToolbar *)self->_apertureToolbar setNextApertureValue:1 coarse:v3])
    {
      apertureToolbar = self->_apertureToolbar;
      [(PUPhotoEditApertureToolbar *)apertureToolbar apertureValue];
      -[PUPhotoEditPortraitToolController apertureToolbar:didChangeValue:](self, "apertureToolbar:didChangeValue:", apertureToolbar);
    }
  }
  else
  {
    [(PUPhotoEditPortraitToolController *)self _selectNextEffectType:1];
  }
}

- (BOOL)wantsScrubberKeyControl
{
  return 1;
}

- (BOOL)wantsTapToToggleOriginalEnabled
{
  BOOL v3 = [(PUPhotoEditToolController *)self compositionController];
  id v4 = [v3 depthAdjustmentController];

  if ([(PUPhotoEditPortraitToolController *)self _shouldShowPortraitFocusEditingUI]) {
    int v5 = [v4 enabled] ^ 1;
  }
  else {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (BOOL)wantsZoomAndPanEnabled
{
  return 1;
}

- (int64_t)toolControllerTag
{
  return 1000;
}

- (id)centerToolbarView
{
  return self->_portraitToolbarButton;
}

- (id)leadingToolbarViews
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = v3;
  if (self->_lightingIntensityButton) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_apertureButton) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  id v4 = a3;
  if (self->_suspendUIUpdatesFromComposition) {
    goto LABEL_26;
  }
  id v33 = v4;
  int v5 = [(PUPhotoEditToolController *)self compositionController];
  id v6 = [v5 adjustmentConstants];
  double v7 = [v6 PIDepthAdjustmentKey];
  if ([v33 containsObject:v7])
  {

    goto LABEL_5;
  }
  char v8 = [v6 PIPortraitAdjustmentKey];
  int v9 = [v33 containsObject:v8];

  if (v9)
  {
LABEL_5:
    v10 = [v5 depthAdjustmentController];
    uint64_t v11 = [v10 enabled];
    [(PUPhotoEditToolActivationButton *)self->_portraitToolbarButton setSelected:v11];
    [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer setEnabled:v11];
    uint64_t v12 = (void *)MEMORY[0x1E4F90858];
    if ([(PUPhotoEditToolActivationButton *)self->_portraitToolbarButton isSelected]) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 1;
    }
    double v14 = [v12 configurationWithCursorEffect:v13];
    [(PXUIButton *)self->_portraitToolbarButton setPx_configuration:v14];

    uint64_t v15 = +[PUPhotoEditProtoSettings sharedInstance];
    char v16 = [v15 apertureSliderHasOffPosition];

    if ((v16 & 1) == 0)
    {
      int v17 = [(PUPhotoEditPortraitToolController *)self apertureToolbar];
      [v17 setEnabled:v11];
    }
    [(PUPhotoEditPortraitToolController *)self _updateNavigationButtonsAnimated:1];
    float v18 = +[PUPhotoEditProtoSettings sharedInstance];
    char v19 = [v18 apertureSliderHasOffPosition];

    if (v19)
    {
      if (v11)
      {
        [v10 aperture];
        if (v20 > 0.0)
        {
          double v21 = v20;
          double v22 = [(PUPhotoEditPortraitToolController *)self apertureToolbar];
          [v22 setApertureValueClosestTo:v21];

          v23 = [(PUPhotoEditPortraitToolController *)self apertureToolbar];
          [v23 apertureValue];
          -[CEKApertureButton setApertureValue:](self->_apertureButton, "setApertureValue:");

          BOOL v24 = self->_focusOverlayController == 0;
          goto LABEL_19;
        }
LABEL_18:
        BOOL v24 = 0;
LABEL_19:
        if (v24 || self->_focusOverlayController)
        {
          [(PUPhotoEditPortraitToolController *)self _updateFocusOverlay];
          v29 = [(PUPhotoEditPortraitFocusOverlayViewController *)self->_focusOverlayController view];
          v30 = [v29 layer];
          [v30 setNeedsDisplay];
        }
        goto LABEL_23;
      }
      v28 = [(PUPhotoEditPortraitToolController *)self apertureToolbar];
      [v28 setDepthIsOn:0];
    }
    else
    {
      [v10 aperture];
      if (v25 <= 0.0) {
        goto LABEL_18;
      }
      double v26 = v25;
      v27 = [(PUPhotoEditPortraitToolController *)self apertureToolbar];
      [v27 setApertureValueClosestTo:v26];

      v28 = [(PUPhotoEditPortraitToolController *)self apertureToolbar];
      [v28 apertureValue];
      -[CEKApertureButton setApertureValue:](self->_apertureButton, "setApertureValue:");
    }

    goto LABEL_18;
  }
LABEL_23:
  v31 = [v6 PIPortraitAdjustmentKey];
  int v32 = [v33 containsObject:v31];

  if (v32)
  {
    [(PUPhotoEditPortraitToolController *)self _updateLightingControl];
    [(PUPhotoEditPortraitToolController *)self _updateLightingSliderAnimated:0];
  }

  id v4 = v33;
LABEL_26:
}

- (id)accessibilityHUDItemForButton:(id)a3
{
  if ([a3 isEqual:self->_portraitToolbarButton])
  {
    id v4 = [(PUPhotoEditPortraitToolController *)self _depthButtonTitle];
    int v5 = [v4 localizedUppercaseString];

    id v6 = objc_alloc(MEMORY[0x1E4FB13E0]);
    double v7 = objc_msgSend(v6, "initWithTitle:image:imageInsets:scaleImage:", v5, 0, 1, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  }
  else
  {
    double v7 = 0;
  }
  return v7;
}

- (BOOL)wantsSecondaryToolbarVisible
{
  return 1;
}

- (void)setBackdropViewGroupName:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditPortraitToolController;
  [(PUPhotoEditToolController *)&v7 setBackdropViewGroupName:v4];
  int v5 = [(PUPhotoEditPortraitToolController *)self apertureToolbar];

  if (v5)
  {
    id v6 = [(PUPhotoEditPortraitToolController *)self apertureToolbar];
    [v6 setBackdropViewGroupName:v4];
  }
}

- (void)reactivate
{
  if (self->_lightingIntensityButton && self->_apertureButton) {
    [(PUPhotoEditPortraitToolController *)self _handlePortraitNavigationButtons:0];
  }
  else {
    [(PUPhotoEditPortraitToolController *)self _resetDefaultToolMode];
  }
  id v3 = [(PUPhotoEditToolController *)self ppt_didBecomeActiveToolBlock];

  if (v3)
  {
    id v4 = [(PUPhotoEditToolController *)self ppt_didBecomeActiveToolBlock];
    v4[2]();
  }
}

- (void)willBecomeActiveTool
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditPortraitToolController;
  [(PUPhotoEditToolController *)&v3 willBecomeActiveTool];
  [(PUPhotoEditPortraitToolController *)self _resetDefaultToolMode];
  [(PUPhotoEditPortraitToolController *)self _updateLightingControl];
  [(PUPhotoEditPortraitToolController *)self _updateLightingSliderAnimated:0];
}

- (BOOL)canResetToDefaultValue
{
  return 0;
}

- (id)toolbarIconAccessibilityLabel
{
  return PULocalizedString(@"PHOTOEDIT_PORTRAIT_TOOLBAR_BUTTON_AX_LABEL");
}

- (id)selectedToolbarIconGlyphName
{
  return @"f.cursive.circle.fill";
}

- (id)toolbarIconGlyphName
{
  return @"f.cursive.circle";
}

- (id)localizedName
{
  return PULocalizedString(@"PHOTOEDIT_PORTRAIT_TOOL_BUTTON");
}

- (id)_depthButtonTitle
{
  return PULocalizedString(@"PHOTOEDIT_PORTRAIT_SWITCH");
}

- (void)_handlePortraitEffectButton:(id)a3
{
  id v10 = [(PUPhotoEditToolController *)self compositionController];
  id v4 = [v10 depthAdjustmentController];
  int v5 = [v4 enabled];

  [(PUPhotoEditToolController *)self willModifyAdjustment];
  id v6 = [(PUPhotoEditToolController *)self delegate];
  objc_super v7 = [v6 livePortraitBehaviorController];

  +[PUPhotoEditEffectsSupport updateCompositionController:v10 withDepthEnabled:v5 ^ 1u livePortraitBehaviorController:v7];
  char v8 = PULocalizedString(@"PHOTOEDIT_PORTRAIT_SWITCH");
  id v9 = [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v8];

  [(PUPhotoEditPortraitToolController *)self _updateLightingControl];
  [(PUPhotoEditPortraitToolController *)self _updateLightingSliderAnimated:0];
  [(PUPhotoEditPortraitToolController *)self _updateFocusOverlay];
}

- (void)_updateFocusOverlay
{
  objc_super v3 = [(PUPhotoEditToolController *)self compositionController];
  id v7 = [v3 depthAdjustmentController];

  if ([v7 enabled]
    && [(PUPhotoEditPortraitToolController *)self _shouldShowPortraitFocusEditingUI])
  {
    if (self->_focusOverlayController)
    {
      uint64_t v4 = 0;
      goto LABEL_9;
    }
    [(PUPhotoEditPortraitToolController *)self _createFocusOverlayIfNeeded];
    uint64_t v4 = 0;
    goto LABEL_7;
  }
  if (self->_focusOverlayController)
  {
    [(PUPhotoEditPortraitToolController *)self _removeFocusOverlayIfNeeded];
    uint64_t v4 = 1;
LABEL_7:
    int v5 = [(PUPhotoEditPortraitToolController *)self view];
    [v5 setNeedsUpdateConstraints];

    goto LABEL_9;
  }
  uint64_t v4 = 1;
LABEL_9:
  id v6 = [(PUPhotoEditToolController *)self delegate];
  [v6 toolControllerDidChangeWantsTapToToggleOriginalEnabled:self enabled:v4];
}

- (void)_updateLightingSliderAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PUPhotoEditToolController *)self compositionController];
  id v6 = [v5 portraitAdjustmentController];

  if (v6)
  {
    [v6 strength];
    -[CEKSlider setValue:](self->_lightingSlider, "setValue:");
  }
  unint64_t v7 = [(CEKLightingControl *)self->_lightingControl selectedLightingType];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __67__PUPhotoEditPortraitToolController__updateLightingSliderAnimated___block_invoke;
  uint64_t v13 = &unk_1E5F2E120;
  double v14 = self;
  BOOL v15 = v7 > 1;
  char v8 = _Block_copy(&v10);
  id v9 = v8;
  if (v3) {
    objc_msgSend(MEMORY[0x1E4FB1EB0], "animateWithDuration:delay:options:animations:completion:", 4, v8, 0, 0.25, 0.0, v10, v11, v12, v13);
  }
  else {
    (*((void (**)(void *))v8 + 2))(v8);
  }
}

uint64_t __67__PUPhotoEditPortraitToolController__updateLightingSliderAnimated___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 1280) setAlpha:v1];
}

- (void)_updateLightingMarkerForType:(int64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    if (self->_initialLightingType == a3) {
      initialLightingIntensitCGFloat y = self->_initialLightingIntensity;
    }
    else {
      initialLightingIntensitCGFloat y = 1.79769313e308;
    }
    lightingSlider = self->_lightingSlider;
    [(CEKSlider *)lightingSlider setMarkedValue:initialLightingIntensity];
  }
}

- (void)_updateLightingControl
{
  id v6 = [(PUPhotoEditToolController *)self compositionController];
  BOOL v3 = [v6 portraitAdjustmentController];
  uint64_t v4 = [v3 kind];
  if (![v3 enabled]
    || (uint64_t v5 = +[PUPhotoEditEffectsSupport lightingEffectTypeForIdentifier:v4]) == 0)
  {
    uint64_t v5 = [(CEKLightingControl *)self->_lightingControl defaultLightingType];
  }
  [(PUPhotoEditPortraitToolController *)self _updateLightingMarkerForType:v5];
  [(CEKLightingControl *)self->_lightingControl setSelectedLightingType:v5];
  [(CEKLightingNameBadge *)self->_lightingNameBadge setLightingType:v5];
  [(PUPhotoEditPortraitToolController *)self _updateLightingNameBadgeForOrientation:[(PUPhotoEditToolController *)self layoutOrientation] expanded:[(CEKLightingControl *)self->_lightingControl isExpanded]];
}

- (void)_updateNavigationButtonsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(PUPhotoEditPortraitToolController *)self toolSelection];
  if (v3)
  {
    id v6 = [(CEKApertureButton *)self->_apertureButton superview];
    [v6 layoutIfNeeded];
  }
  [(PUPhotoEditToolbarButton *)self->_lightingIntensityButton setSelected:v5 != 2];
  [(CEKApertureButton *)self->_apertureButton setActive:v5 == 2];
  if (v5 == 2)
  {
    uint64_t v10 = 0;
  }
  else
  {
    unint64_t v7 = [(PUPhotoEditPortraitToolController *)self apertureToolbar];
    [v7 apertureValue];
    -[CEKApertureButton setApertureValue:](self->_apertureButton, "setApertureValue:");

    char v8 = [(PUPhotoEditToolController *)self compositionController];
    id v9 = [v8 depthAdjustmentController];

    uint64_t v10 = [v9 enabled];
  }
  [(CEKApertureButton *)self->_apertureButton setShouldShowApertureValue:v10 animated:v3];
  uint64_t v11 = [(CEKApertureButton *)self->_apertureButton superview];
  [v11 setNeedsLayout];

  uint64_t v12 = +[PUInterfaceManager currentTheme];
  if ([(PUPhotoEditToolbarButton *)self->_lightingIntensityButton isSelected]) {
    [v12 photoEditingToolbarButtonSelectedColor];
  }
  else {
  uint64_t v13 = [v12 photoEditingToolbarButtonColor];
  }
  [(PUPhotoEditToolbarButton *)self->_lightingIntensityButton setTintColor:v13];
  if (v3)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __70__PUPhotoEditPortraitToolController__updateNavigationButtonsAnimated___block_invoke;
    v14[3] = &unk_1E5F2ED10;
    v14[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v14 animations:0.25];
  }
}

void __70__PUPhotoEditPortraitToolController__updateNavigationButtonsAnimated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1176) superview];
  [v1 layoutIfNeeded];
}

- (int64_t)_defaultPortraitTool
{
  uint64_t v2 = [(PUPhotoEditToolController *)self compositionController];
  BOOL v3 = [v2 depthAdjustmentController];

  if (v3)
  {
    if ([v3 canAdjustApertureValue]) {
      int64_t v4 = 2;
    }
    else {
      int64_t v4 = 1;
    }
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)_resetDefaultToolMode
{
  [(PUPhotoEditPortraitToolController *)self setToolSelection:[(PUPhotoEditPortraitToolController *)self _defaultPortraitTool] animated:1];
  [(PUPhotoEditPortraitToolController *)self _updateNavigationButtonsAnimated:1];
}

- (void)_removeFocusOverlayIfNeeded
{
  if (self->_focusOverlayController)
  {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_focusOverlayControllerConstraints];
    focusOverlayControllerConstraints = self->_focusOverlayControllerConstraints;
    self->_focusOverlayControllerConstraints = 0;

    [(PUPhotoEditPortraitFocusOverlayViewController *)self->_focusOverlayController willMoveToParentViewController:0];
    [(PUPhotoEditPortraitToolController *)self removeChildViewController:self->_focusOverlayController];
    int64_t v4 = [(PUPhotoEditPortraitFocusOverlayViewController *)self->_focusOverlayController view];
    [v4 removeFromSuperview];

    focusOverlayController = self->_focusOverlayController;
    self->_focusOverlayController = 0;
  }
}

- (void)_createFocusOverlayIfNeeded
{
  if (!self->_focusOverlayController)
  {
    BOOL v3 = [(PUPhotoEditToolController *)self compositionController];
    uint64_t v4 = [v3 composition];

    char v19 = (void *)v4;
    int64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F7A520]) initWithComposition:v4];
    [v5 setName:@"PUPhotoEditPortraitToolController-imageProperties"];
    id v20 = 0;
    id v6 = [v5 submitSynchronous:&v20];
    id v18 = v20;
    unint64_t v7 = [v6 properties];
    if ([v7 isHDR]) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = [v7 hasGainMap];
    }
    id v9 = [PUPhotoEditPortraitFocusOverlayViewController alloc];
    uint64_t v10 = [(PUPhotoEditToolController *)self delegate];
    uint64_t v11 = [v10 mediaView];
    uint64_t v12 = [(PUPhotoEditToolController *)self delegate];
    uint64_t v13 = [(PUPhotoEditPortraitFocusOverlayViewController *)v9 initWithMediaView:v11 isHDR:v8 delegate:v12];
    focusOverlayController = self->_focusOverlayController;
    self->_focusOverlayController = v13;

    [(PUPhotoEditPortraitFocusOverlayViewController *)self->_focusOverlayController setPortraitFocusDelegate:self];
    BOOL v15 = [(PUPhotoEditPortraitFocusOverlayViewController *)self->_focusOverlayController view];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    [(PUPhotoEditPortraitToolController *)self addChildViewController:self->_focusOverlayController];
    [(PUPhotoEditPortraitFocusOverlayViewController *)self->_focusOverlayController didMoveToParentViewController:self];
    char v16 = [(PUPhotoEditPortraitToolController *)self view];
    int v17 = [(PUPhotoEditPortraitFocusOverlayViewController *)self->_focusOverlayController view];

    [v16 insertSubview:v17 atIndex:0];
  }
}

- (void)_handlePortraitNavigationButtons:(id)a3
{
  if ([(PUPhotoEditPortraitToolController *)self toolSelection] == 1) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  [(PUPhotoEditPortraitToolController *)self setToolSelection:v4 animated:1];
  [(PUPhotoEditPortraitToolController *)self _updateNavigationButtonsAnimated:1];
}

- (void)_selectNextEffectType:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(CEKLightingControl *)self->_lightingControl lightingEffectSet];
  if (v5 > 3) {
    id v6 = 0;
  }
  else {
    id v6 = (void *)qword_1E5F28580[v5];
  }
  uint64_t v7 = [(CEKLightingControl *)self->_lightingControl selectedLightingType];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    BOOL v16 = v3;
    uint64_t v10 = 0;
    BOOL v11 = 0;
    uint64_t v12 = *(void *)v18;
LABEL_6:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v6);
      }
      double v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
      uint64_t v8 = [v14 integerValue];
      if (v11) {
        break;
      }
      BOOL v11 = v7 == v8;
      if (v7 != v8) {
        uint64_t v10 = [v14 integerValue];
      }
      if (v9 == ++v13)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        uint64_t v9 = v8;
        if (v8) {
          goto LABEL_6;
        }
        break;
      }
    }
    BOOL v3 = v16;
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (v3) {
    uint64_t v15 = v10;
  }
  else {
    uint64_t v15 = v8;
  }
  if (v15)
  {
    [(CEKLightingControl *)self->_lightingControl setSelectedLightingType:v15 animated:1];
    [(PUPhotoEditPortraitToolController *)self lightingControlDidChangeSelectedLightingType:self->_lightingControl];
  }
}

- (BOOL)_setupApertureControlsIfNeeded
{
  BOOL v3 = [(PUPhotoEditToolController *)self compositionController];
  uint64_t v4 = [v3 depthAdjustmentController];

  int v5 = [v4 canAdjustApertureValue];
  p_apertureToolbar = &self->_apertureToolbar;
  apertureToolbar = self->_apertureToolbar;
  if (v5)
  {
    BOOL v8 = apertureToolbar == 0;
    if (!apertureToolbar)
    {
      uint64_t v9 = objc_alloc_init(PUPhotoEditApertureToolbar);
      [(PUPhotoEditApertureToolbar *)v9 setDelegate:self];
      [(PUPhotoEditApertureToolbar *)v9 setLayoutOrientation:[(PUPhotoEditToolController *)self layoutOrientation]];
      [v4 minimumAperture];
      -[PUPhotoEditApertureToolbar setMinimumApertureValue:](v9, "setMinimumApertureValue:");
      [v4 maximumAperture];
      -[PUPhotoEditApertureToolbar setMaximumApertureValue:](v9, "setMaximumApertureValue:");
      [v4 aperture];
      if (v10 > 0.0) {
        -[PUPhotoEditApertureToolbar setApertureValueClosestTo:](v9, "setApertureValueClosestTo:");
      }
      apertureContainer = self->_apertureContainer;
      uint64_t v12 = [(PUPhotoEditApertureToolbar *)v9 view];
      [(UIView *)apertureContainer addSubview:v12];

      uint64_t v13 = [v4 depthInfo];
      double v14 = [v13 objectForKeyedSubscript:@"capturedAperture"];

      [v14 floatValue];
      if (v14 && v15 > 0.0) {
        [(PUPhotoEditApertureToolbar *)v9 setOriginalApertureValueClosestTo:v15];
      }
      objc_storeStrong((id *)&self->_apertureToolbar, v9);
      BOOL v16 = +[PUPhotoEditProtoSettings sharedInstance];
      int v17 = [v16 apertureSliderHasOffPosition];

      if (v17) {
        -[PUPhotoEditApertureToolbar setDepthIsOn:](*p_apertureToolbar, "setDepthIsOn:", [v4 enabled]);
      }
      else {
        -[PUPhotoEditApertureToolbar setEnabled:](*p_apertureToolbar, "setEnabled:", [v4 enabled]);
      }
    }
    if (!self->_apertureButton)
    {
      long long v18 = +[PUInterfaceManager currentTheme];
      long long v19 = objc_alloc_init(PUPhotoEditApertureButton);
      apertureButton = self->_apertureButton;
      self->_apertureButton = &v19->super;

      double v21 = [(PUPhotoEditPortraitToolController *)self view];
      BOOL v22 = [v21 effectiveUserInterfaceLayoutDirection] != 1;

      [(CEKApertureButton *)self->_apertureButton setExpansionDirection:v22];
      -[CEKApertureButton setTappableEdgeInsets:](self->_apertureButton, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
      [(CEKApertureButton *)self->_apertureButton setTranslatesAutoresizingMaskIntoConstraints:0];
      v23 = [v18 photoEditingToolbarMainButtonColor];
      [(CEKApertureButton *)self->_apertureButton setTintColor:v23];

      [(CEKApertureButton *)self->_apertureButton addTarget:self action:sel__handlePortraitNavigationButtons_ forControlEvents:64];
      [(PUPhotoEditPortraitToolController *)self _updateNavigationButtonsAnimated:0];
      goto LABEL_18;
    }
  }
  else
  {
    BOOL v8 = apertureToolbar != 0;
    if (apertureToolbar)
    {
      *p_apertureToolbar = 0;
    }
    long long v18 = self->_apertureButton;
    if (v18)
    {
      self->_apertureButton = 0;
LABEL_18:

      BOOL v8 = 1;
    }
  }

  return v8;
}

- (BOOL)_setupLightingControlsIfNeeded
{
  BOOL v3 = [(PUPhotoEditPortraitToolController *)self _canRenderPortraitEffect];
  lightingControl = self->_lightingControl;
  if (!v3)
  {
    if (lightingControl)
    {
      [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_lightingControlConstraints];
      lightingControlConstraints = self->_lightingControlConstraints;
      self->_lightingControlConstraints = 0;

      [(CEKLightingControl *)self->_lightingControl removeFromSuperview];
      float v15 = self->_lightingControl;
      self->_lightingControl = 0;

      BOOL v8 = 1;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (lightingControl)
  {
LABEL_11:
    BOOL v8 = 0;
    goto LABEL_12;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F57D50]);
  id v6 = (CEKLightingControl *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v7 = self->_lightingControl;
  self->_lightingControl = v6;

  [(UIView *)self->_lightingContainer addSubview:self->_lightingControl];
  [(CEKLightingControl *)self->_lightingControl setDelegate:self];
  [(CEKLightingControl *)self->_lightingControl preloadEffectChangeAnimation];
  [(CEKLightingControl *)self->_lightingControl setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v8 = 1;
  [(CEKLightingControl *)self->_lightingControl setHighlighted:1];
  [(CEKLightingControl *)self->_lightingControl setNameBadgeHidden:1];
  BOOL v9 = [(PUPhotoEditPortraitToolController *)self _shouldShowPortraitV2];
  uint64_t v10 = 2;
  if (v9) {
    uint64_t v10 = 3;
  }
  if (self->_isStageLightEnabled) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 1;
  }
  [(CEKLightingControl *)self->_lightingControl setLightingEffectSet:v11];
  uint64_t v12 = objc_alloc_init(_PULightingGradientView);
  lightingGradient = self->_lightingGradient;
  self->_lightingGradient = v12;

  [(_PULightingGradientView *)self->_lightingGradient setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PUPhotoEditPortraitToolController *)self _updateLightingControl];
  self->_initialLightingType = [(CEKLightingControl *)self->_lightingControl selectedLightingType];
LABEL_12:
  BOOL v16 = [(PUPhotoEditPortraitToolController *)self _shouldShowPortraitV2];
  lightingIntensityButton = self->_lightingIntensityButton;
  if (v16)
  {
    if (!lightingIntensityButton)
    {
      objc_initWeak(&location, self);
      long long v18 = [(PUPhotoEditToolController *)self photoEditSpec];
      long long v19 = +[PUPhotoEditToolbarButton buttonWithImageNamed:@"camera.lightcontrol" selectedImageNamed:0 accessibilityLabel:&stru_1F06BE7B8 spec:v18];
      long long v20 = self->_lightingIntensityButton;
      self->_lightingIntensityButton = v19;

      [(PUPhotoEditToolbarButton *)self->_lightingIntensityButton setSelectedGlyphHasHighlightColor:1];
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      int v32 = __67__PUPhotoEditPortraitToolController__setupLightingControlsIfNeeded__block_invoke;
      id v33 = &unk_1E5F28D98;
      objc_copyWeak(&v34, &location);
      [(PUPhotoEditToolbarButton *)self->_lightingIntensityButton setActionBlock:&v30];
      -[PUPhotoEditPortraitToolController _updateNavigationButtonsAnimated:](self, "_updateNavigationButtonsAnimated:", 0, v30, v31, v32, v33);
      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
      BOOL v8 = 1;
    }
    if (!self->_lightingSlider)
    {
      double v21 = +[PUPhotoEditSupport createEditSlider];
      lightingSlider = self->_lightingSlider;
      self->_lightingSlider = v21;

      v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      lightingIntensityCache = self->_lightingIntensityCache;
      self->_lightingIntensityCache = v23;

      [(CEKSlider *)self->_lightingSlider setDelegate:self];
      [(CEKSlider *)self->_lightingSlider setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_lightingContainer addSubview:self->_lightingSlider];
      double v25 = [(PUPhotoEditToolController *)self compositionController];
      double v26 = [v25 portraitAdjustmentController];

      if (v26)
      {
        [v26 strength];
        -[CEKSlider setValue:](self->_lightingSlider, "setValue:");
      }
      [(CEKSlider *)self->_lightingSlider setMinimumValue:0.0];
      [(CEKSlider *)self->_lightingSlider setMaximumValue:1.0];
      if (objc_opt_respondsToSelector()) {
        [(CEKSlider *)self->_lightingSlider setLabelVerticalPadding:-35.0];
      }
      if (objc_opt_respondsToSelector()) {
        [(CEKSlider *)self->_lightingSlider setValueLabelVisibility:1];
      }
      if (objc_opt_respondsToSelector()) {
        [(CEKSlider *)self->_lightingSlider setAnimationDuration:0.5];
      }
      [(PUPhotoEditPortraitToolController *)self _updateLightingSliderAnimated:0];
      [(PUPhotoEditPortraitToolController *)self _updateLightingIntensityCache];
      [(CEKSlider *)self->_lightingSlider value];
      self->_initialLightingIntensitCGFloat y = v27;

      return 1;
    }
  }
  else
  {
    if (lightingIntensityButton)
    {
      self->_lightingIntensityButton = 0;

      BOOL v8 = 1;
    }
    v28 = self->_lightingSlider;
    if (v28)
    {
      self->_lightingSlider = 0;

      return 1;
    }
  }
  return v8;
}

void __67__PUPhotoEditPortraitToolController__setupLightingControlsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handlePortraitNavigationButtons:v3];
}

- (BOOL)_setupDepthControlsIfNeeded
{
  id v3 = [(PUPhotoEditToolController *)self compositionController];
  uint64_t v4 = [v3 depthAdjustmentController];

  int v5 = [v4 canRenderDepth];
  uint64_t v6 = [v4 enabled];
  portraitToolbarButton = self->_portraitToolbarButton;
  if (v5)
  {
    if (!portraitToolbarButton)
    {
      uint64_t v8 = v6;
      BOOL v9 = [(PUPhotoEditPortraitToolController *)self _depthButtonTitle];
      uint64_t v10 = [v9 localizedUppercaseString];
      uint64_t v11 = +[PUPhotoEditToolActivationButton buttonWithTitle:v10];
      uint64_t v12 = self->_portraitToolbarButton;
      self->_portraitToolbarButton = v11;

      [(PUPhotoEditToolActivationButton *)self->_portraitToolbarButton setTranslatesAutoresizingMaskIntoConstraints:0];
      objc_initWeak(&location, self);
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      double v21 = __64__PUPhotoEditPortraitToolController__setupDepthControlsIfNeeded__block_invoke;
      BOOL v22 = &unk_1E5F28B10;
      objc_copyWeak(&v23, &location);
      [(PUPhotoEditToolActivationButton *)self->_portraitToolbarButton setActionBlock:&v19];
      -[PUPhotoEditToolActivationButton setSelected:](self->_portraitToolbarButton, "setSelected:", v8, v19, v20, v21, v22);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
LABEL_6:
      BOOL v13 = 1;
      goto LABEL_8;
    }
  }
  else if (portraitToolbarButton)
  {
    self->_portraitToolbarButton = 0;

    goto LABEL_6;
  }
  BOOL v13 = 0;
LABEL_8:
  if ([(PUPhotoEditPortraitToolController *)self _shouldShowPortraitFocusEditingUI])
  {
    double v14 = [(PUPhotoEditToolController *)self compositionController];
    float v15 = [v14 depthAdjustmentController];

    int v16 = [v15 enabled];
    focusOverlayController = self->_focusOverlayController;
    if (v16)
    {
      if (!focusOverlayController) {
        goto LABEL_13;
      }
    }
    else if (focusOverlayController)
    {
LABEL_13:
      BOOL v13 = 1;
    }
    [(PUPhotoEditPortraitToolController *)self _updateFocusOverlay];
  }
  return v13;
}

void __64__PUPhotoEditPortraitToolController__setupDepthControlsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handlePortraitEffectButton:v3];
}

- (void)_refreshFromValuesCalculator
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUPhotoEditToolController *)self valuesCalculator];
  if (![v3 hasImageValues]) {
    goto LABEL_50;
  }
  uint64_t v4 = [v3 portraitValuesWithAccuracy:0];
  int v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8A448]];
  id obj = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8A4C0]];
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8A4D0]];
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8A3F8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v8 = (void *)v7;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = *MEMORY[0x1E4F8A400];
  id v10 = v8;
  uint64_t v11 = [v4 objectForKeyedSubscript:v9];
  objc_opt_class();
  v75 = (void *)v11;
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = (void *)v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;
  uint64_t v14 = [v10 unsignedIntegerValue];

  [(PUPhotoEditPortraitToolController *)self setMajorVersion:v14];
  uint64_t v15 = [v13 unsignedIntegerValue];

  [(PUPhotoEditPortraitToolController *)self setMinorVersion:v15];
  uint64_t v16 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8A450]];
  objc_opt_class();
  v74 = (void *)v16;
  if (objc_opt_isKindOfClass()) {
    int v17 = (void *)v16;
  }
  else {
    int v17 = 0;
  }
  uint64_t v18 = *MEMORY[0x1E4F8A458];
  id v19 = v17;
  uint64_t v20 = [v4 objectForKeyedSubscript:v18];
  objc_opt_class();
  v73 = (void *)v20;
  if (objc_opt_isKindOfClass()) {
    double v21 = (void *)v20;
  }
  else {
    double v21 = 0;
  }
  id v22 = v21;
  uint64_t v23 = [v19 unsignedIntegerValue];

  [(PUPhotoEditPortraitToolController *)self setDepthInfoMajorVersion:v23];
  uint64_t v24 = [v22 unsignedIntegerValue];

  [(PUPhotoEditPortraitToolController *)self setDepthInfoMinorVersion:v24];
  v79 = v5;
  uint64_t v25 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8A4C8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v26 = (void *)v25;
  }
  else {
    double v26 = 0;
  }
  -[PUPhotoEditPortraitToolController setSDOFRenderingVersion:](self, "setSDOFRenderingVersion:", [v26 unsignedIntegerValue]);
  double v27 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8A4D8]];
  [v27 floatValue];
  int v29 = v28;

  uint64_t v30 = [(PUPhotoEditToolController *)self compositionController];
  uint64_t v31 = [v30 portraitAdjustmentController];
  int v32 = [v31 portraitInfo];

  v76 = (void *)v7;
  v77 = v6;
  v72 = (void *)v25;
  if (v32 || !obj)
  {
    id v34 = [v31 portraitInfo];
    cachedPortraitEffectSettings = self->_cachedPortraitEffectSettings;
    self->_cachedPortraitEffectSettings = v34;

    v36 = [v31 spillMatteAllowed];
    cachedSpillMatteAllowed = self->_cachedSpillMatteAllowed;
    self->_cachedSpillMatteAllowed = v36;
  }
  else
  {
    objc_storeStrong((id *)&self->_cachedPortraitEffectSettings, obj);
    objc_storeStrong((id *)&self->_cachedSpillMatteAllowed, v6);
    if (v31)
    {
      uint64_t v33 = *MEMORY[0x1E4F8A4B0];
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __65__PUPhotoEditPortraitToolController__refreshFromValuesCalculator__block_invoke;
      v87[3] = &unk_1E5F284D0;
      id v88 = obj;
      int v90 = v29;
      id v89 = v4;
      [v30 modifyAdjustmentWithKey:v33 modificationBlock:v87];
    }
  }
  uint64_t v38 = *MEMORY[0x1E4F8A430];
  v39 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8A430]];
  [v39 floatValue];
  int v41 = v40;

  v78 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8A438]];
  v42 = [v30 depthAdjustmentController];
  uint64_t v43 = [v42 depthInfo];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [v42 depthInfo];
    v46 = [v45 objectForKeyedSubscript:@"focusRect"];
    if (v46)
    {

      goto LABEL_28;
    }
  }
  if (!v79) {
    goto LABEL_29;
  }
  v47 = [v30 adjustmentConstants];
  v48 = [v47 PIDepthAdjustmentKey];
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __65__PUPhotoEditPortraitToolController__refreshFromValuesCalculator__block_invoke_2;
  v81[3] = &unk_1E5F284F8;
  id v82 = v79;
  int v86 = v41;
  id v83 = v78;
  id v84 = v4;
  id v85 = v42;
  [v30 modifyAdjustmentWithKey:v48 modificationBlock:v81];

  v44 = v82;
LABEL_28:

LABEL_29:
  v71 = v31;
  v49 = [v3 apertureValuesWithAccuracy:0];
  v50 = [v49 objectForKeyedSubscript:v38];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v51 = [v42 depthInfo];
    v52 = [v51 objectForKey:@"capturedAperture"];

    if (!v52)
    {
      v53 = [v42 depthInfo];
      v54 = (void *)[v53 mutableCopy];

      [v54 setObject:v50 forKeyedSubscript:@"capturedAperture"];
      [v42 setDepthInfo:v54];
    }
  }
  v55 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v56 = [(PUPhotoEditPortraitToolController *)self _canRenderPortraitEffect];
    v57 = @"N";
    if (v56) {
      v57 = @"Y";
    }
    *(_DWORD *)buf = 138412290;
    v92 = v57;
    _os_log_impl(&dword_1AE9F8000, v55, OS_LOG_TYPE_DEFAULT, "PUPhotoEditPortraitToolCOntroller: has portrait? %@", buf, 0xCu);
  }

  v58 = [(PUPhotoEditToolController *)self valuesCalculator];
  int v59 = [v58 hasImageValues];

  if (v59)
  {
    v70 = v30;
    v60 = [(PUPhotoEditToolController *)self valuesCalculator];
    v61 = [v60 portraitValuesWithAccuracy:0];

    v62 = [v61 objectForKeyedSubscript:*MEMORY[0x1E4F8A4B8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      self->_isStageLightEnabled = [v62 BOOLValue] ^ 1;
    }
    v63 = [v61 objectForKeyedSubscript:*MEMORY[0x1E4F8A4E0]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      self->_tapToFocusEnabled = [v63 BOOLValue];
    }

    uint64_t v30 = v70;
  }
  BOOL v64 = [(PUPhotoEditPortraitToolController *)self _setupDepthControlsIfNeeded];
  BOOL v65 = [(PUPhotoEditPortraitToolController *)self _setupLightingControlsIfNeeded];
  BOOL v66 = [(PUPhotoEditPortraitToolController *)self _setupApertureControlsIfNeeded];
  if (v64 || v65 || v66)
  {
    v67 = [(PUPhotoEditToolController *)self delegate];
    [v67 toolControllerDidUpdateToolbar:self];

    v68 = [(PUPhotoEditPortraitToolController *)self view];
    [v68 setNeedsUpdateConstraints];
  }
  int64_t v69 = [(PUPhotoEditPortraitToolController *)self toolSelection];
  if (v42 && !v69) {
    [(PUPhotoEditPortraitToolController *)self _resetDefaultToolMode];
  }

LABEL_50:
}

void __65__PUPhotoEditPortraitToolController__refreshFromValuesCalculator__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setPortraitInfo:v3];
  [v4 setStrength:*(float *)(a1 + 48)];
  id v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F8A4D0]];
  [v4 setSpillMatteAllowed:v5];
}

void __65__PUPhotoEditPortraitToolController__refreshFromValuesCalculator__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setDepthInfo:*(void *)(a1 + 32)];
  [v5 setAperture:*(float *)(a1 + 64)];
  [v5 setFocusRect:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F8A440]];
  [v5 setGlassesMatteAllowed:v3];

  id v4 = [*(id *)(a1 + 56) depthInfo];

  if (!v4) {
    [v5 setEnabled:0];
  }
}

- (void)validateCommand:(id)a3
{
  id v5 = a3;
  if ((char *)[v5 action] == sel_navigateToPreviousTab_)
  {
    uint64_t v3 = @"PHOTOEDIT_PORTRAIT_LIGHTING_EFFECTS_KEY_COMMAND_TITLE";
  }
  else
  {
    if ((char *)[v5 action] != sel_navigateToNextTab_) {
      goto LABEL_6;
    }
    uint64_t v3 = @"PHOTOEDIT_PORTRAIT_APERTURE_KEY_COMMAND_TITLE";
  }
  id v4 = PULocalizedString(v3);
  [v5 setDiscoverabilityTitle:v4];

LABEL_6:
}

- (BOOL)_shouldShowPortraitFocusEditingUI
{
  return self->_tapToFocusEnabled;
}

- (BOOL)_shouldShowPortraitV2
{
  return [(PUPhotoEditPortraitToolController *)self majorVersion] > 1;
}

- (void)_updateApertureSliderLength
{
  uint64_t v3 = [(PUPhotoEditPortraitToolController *)self apertureToolbar];

  if (v3)
  {
    id v4 = [(PUPhotoEditToolController *)self photoEditSpec];
    int v5 = [v4 shouldDisplayCompactToolbar];

    if (v5)
    {
      uint64_t v6 = [(PUPhotoEditPortraitToolController *)self apertureToolbar];
      double v7 = 0.0;
      id v13 = v6;
    }
    else
    {
      uint64_t v8 = [(PUPhotoEditToolController *)self photoEditSpec];
      uint64_t v9 = [v8 currentLayoutStyle];

      int64_t v10 = [(PUPhotoEditToolController *)self layoutOrientation];
      if (v9 != 4 && v10 == 1) {
        double v12 = 275.0;
      }
      else {
        double v12 = 375.0;
      }
      uint64_t v6 = [(PUPhotoEditPortraitToolController *)self apertureToolbar];
      id v13 = v6;
      double v7 = v12;
    }
    [v6 setSliderWidth:v7];
  }
}

- (void)_updateToolVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PUPhotoEditPortraitToolController *)self toolSelection] == 1;
  BOOL v6 = [(PUPhotoEditPortraitToolController *)self toolSelection] == 2;
  [(PUPhotoEditToolController *)self setToolGradientDistance:dbl_1AEFF7C10[v5]];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PUPhotoEditPortraitToolController__updateToolVisibilityAnimated___block_invoke;
  aBlock[3] = &unk_1E5F2BD48;
  aBlock[4] = self;
  BOOL v13 = v5;
  BOOL v14 = v6;
  double v7 = (void (**)(void))_Block_copy(aBlock);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__PUPhotoEditPortraitToolController__updateToolVisibilityAnimated___block_invoke_2;
  v9[3] = &unk_1E5F284A8;
  void v9[4] = self;
  BOOL v10 = v5;
  BOOL v11 = v6;
  uint64_t v8 = (void (**)(void *, uint64_t))_Block_copy(v9);
  if (v3)
  {
    [(UIView *)self->_lightingContainer setHidden:0];
    [(UIView *)self->_apertureContainer setHidden:0];
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v7 options:v8 animations:0.25 completion:0.0];
  }
  else
  {
    v7[2](v7);
    v8[2](v8, 1);
  }
}

uint64_t __67__PUPhotoEditPortraitToolController__updateToolVisibilityAnimated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 1192) setAlpha:v2];
  if (*(unsigned char *)(a1 + 41)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  id v4 = *(void **)(*(void *)(a1 + 32) + 1200);
  return [v4 setAlpha:v3];
}

uint64_t __67__PUPhotoEditPortraitToolController__updateToolVisibilityAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1192) setHidden:*(unsigned char *)(a1 + 40) == 0];
  BOOL v2 = *(unsigned char *)(a1 + 41) == 0;
  double v3 = *(void **)(*(void *)(a1 + 32) + 1200);
  return [v3 setHidden:v2];
}

- (void)setToolSelection:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_toolSelection != a3)
  {
    self->_toolSelection = a3;
    [(PUPhotoEditPortraitToolController *)self _updateToolVisibilityAnimated:a4];
  }
}

- (void)setToolSelection:(int64_t)a3
{
}

- (BOOL)_canRenderPortraitEffect
{
  int v3 = PECanRenderPortrait();
  id v4 = [(PUPhotoEditToolController *)self compositionController];
  BOOL v5 = [v4 portraitAdjustmentController];

  if (v3) {
    BOOL v6 = ([v5 canRenderPortraitEffect] & 1) != 0
  }
      || [(NSDictionary *)self->_cachedPortraitEffectSettings count] != 0;
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)longPressed:(id)a3
{
  if ([a3 state] != 2)
  {
    id v4 = [(PUPhotoEditToolController *)self delegate];
    [v4 toolControllerWantsToToggleOriginal:self];
  }
}

- (void)previewingOriginalDidStop
{
  id v2 = [(PUPhotoEditPortraitFocusOverlayViewController *)self->_focusOverlayController view];
  [v2 setHidden:0];
}

- (void)previewingOriginalDidStart
{
  id v2 = [(PUPhotoEditPortraitFocusOverlayViewController *)self->_focusOverlayController view];
  [v2 setHidden:1];
}

- (void)updateViewConstraints
{
  [(PUPhotoEditPortraitToolController *)self _updateToolContainerConstraints];
  [(PUPhotoEditPortraitToolController *)self _updateToolConstraints];
  [(PUPhotoEditPortraitToolController *)self _updateFocusOverlayConstraints];
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditPortraitToolController;
  [(PUPhotoEditPortraitToolController *)&v3 updateViewConstraints];
}

- (void)_updateFocusOverlayConstraints
{
  v24[4] = *MEMORY[0x1E4F143B8];
  if (self->_focusOverlayController)
  {
    if (!self->_focusOverlayControllerConstraints)
    {
      objc_super v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      focusOverlayControllerConstraints = self->_focusOverlayControllerConstraints;
      self->_focusOverlayControllerConstraints = v3;

      BOOL v5 = [(PUPhotoEditPortraitFocusOverlayViewController *)self->_focusOverlayController view];
      uint64_t v16 = self->_focusOverlayControllerConstraints;
      id v22 = [v5 leadingAnchor];
      uint64_t v23 = [(PUPhotoEditPortraitToolController *)self view];
      double v21 = [v23 leadingAnchor];
      uint64_t v20 = [v22 constraintEqualToAnchor:v21];
      v24[0] = v20;
      uint64_t v18 = [v5 trailingAnchor];
      id v19 = [(PUPhotoEditPortraitToolController *)self view];
      int v17 = [v19 trailingAnchor];
      uint64_t v15 = [v18 constraintEqualToAnchor:v17];
      v24[1] = v15;
      BOOL v13 = [v5 topAnchor];
      BOOL v14 = [(PUPhotoEditPortraitToolController *)self view];
      BOOL v6 = [v14 topAnchor];
      double v7 = [v13 constraintEqualToAnchor:v6];
      v24[2] = v7;
      uint64_t v8 = [v5 bottomAnchor];
      uint64_t v9 = [(PUPhotoEditPortraitToolController *)self view];
      BOOL v10 = [v9 bottomAnchor];
      BOOL v11 = [v8 constraintEqualToAnchor:v10];
      v24[3] = v11;
      double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
      [(NSMutableArray *)v16 addObjectsFromArray:v12];

      [MEMORY[0x1E4F28DC8] activateConstraints:self->_focusOverlayControllerConstraints];
    }
  }
}

- (void)_updateToolConstraints
{
  v55[4] = *MEMORY[0x1E4F143B8];
  if (!self->_toolConstraints)
  {
    objc_super v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    toolConstraints = self->_toolConstraints;
    self->_toolConstraints = v3;

    lightingControl = self->_lightingControl;
    if (lightingControl)
    {
      v39 = self->_toolConstraints;
      v49 = [(CEKLightingControl *)lightingControl heightAnchor];
      v46 = [v49 constraintEqualToConstant:140.0];
      v55[0] = v46;
      uint64_t v43 = [(UIView *)self->_lightingContainer widthAnchor];
      int v41 = [(CEKLightingControl *)self->_lightingControl widthAnchor];
      v37 = [v43 constraintEqualToAnchor:v41];
      v55[1] = v37;
      BOOL v6 = [(UIView *)self->_lightingContainer centerXAnchor];
      double v7 = [(CEKLightingControl *)self->_lightingControl centerXAnchor];
      uint64_t v8 = [v6 constraintEqualToAnchor:v7];
      v55[2] = v8;
      uint64_t v9 = [(UIView *)self->_lightingContainer topAnchor];
      BOOL v10 = [(CEKLightingControl *)self->_lightingControl topAnchor];
      BOOL v11 = [v9 constraintEqualToAnchor:v10];
      v55[3] = v11;
      double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:4];
      [(NSMutableArray *)v39 addObjectsFromArray:v12];

      BOOL v13 = self->_toolConstraints;
      lightingContainer = self->_lightingContainer;
      if (self->_lightingSlider)
      {
        v42 = [(UIView *)lightingContainer widthAnchor];
        uint64_t v38 = [(CEKSlider *)self->_lightingSlider widthAnchor];
        uint64_t v44 = [v42 constraintEqualToAnchor:v38];
        v54[0] = v44;
        v50 = [(UIView *)self->_lightingContainer centerXAnchor];
        v47 = [(CEKSlider *)self->_lightingSlider centerXAnchor];
        int v40 = [v50 constraintEqualToAnchor:v47];
        v54[1] = v40;
        v36 = [(UIView *)self->_lightingContainer bottomAnchor];
        v35 = [(CEKSlider *)self->_lightingSlider bottomAnchor];
        uint64_t v15 = [v36 constraintEqualToAnchor:v35];
        v54[2] = v15;
        uint64_t v16 = [(CEKLightingControl *)self->_lightingControl bottomAnchor];
        [(CEKSlider *)self->_lightingSlider topAnchor];
        v18 = int v17 = v13;
        id v19 = [v16 constraintEqualToAnchor:v18 constant:10.0];
        v54[3] = v19;
        uint64_t v20 = [(CEKSlider *)self->_lightingSlider heightAnchor];
        double v21 = [v20 constraintEqualToConstant:66.0];
        v54[4] = v21;
        id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:5];
        [(NSMutableArray *)v17 addObjectsFromArray:v22];

        uint64_t v23 = (void *)v38;
        uint64_t v24 = v42;

        uint64_t v25 = (void *)v44;
      }
      else
      {
        uint64_t v24 = [(UIView *)lightingContainer bottomAnchor];
        uint64_t v23 = [(CEKLightingControl *)self->_lightingControl bottomAnchor];
        uint64_t v25 = [v24 constraintEqualToAnchor:v23 constant:66.0];
        [(NSMutableArray *)v13 addObject:v25];
      }
    }
    apertureToolbar = self->_apertureToolbar;
    if (apertureToolbar)
    {
      double v27 = [(PUPhotoEditApertureToolbar *)apertureToolbar view];
      v45 = self->_toolConstraints;
      v52 = [(UIView *)self->_apertureContainer widthAnchor];
      v51 = [v27 widthAnchor];
      v48 = [v52 constraintEqualToAnchor:v51];
      v53[0] = v48;
      int v28 = [(UIView *)self->_apertureContainer centerXAnchor];
      int v29 = [v27 centerXAnchor];
      uint64_t v30 = [v28 constraintEqualToAnchor:v29];
      v53[1] = v30;
      uint64_t v31 = [(UIView *)self->_apertureContainer bottomAnchor];
      int v32 = [v27 bottomAnchor];
      uint64_t v33 = [v31 constraintEqualToAnchor:v32];
      v53[2] = v33;
      id v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:3];
      [(NSMutableArray *)v45 addObjectsFromArray:v34];
    }
    [MEMORY[0x1E4F28DC8] activateConstraints:self->_toolConstraints];
  }
}

- (void)_updateToolContainerConstraints
{
  v97[3] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(PUPhotoEditToolController *)self toolContainerView];
  if (!self->_containerConstraints && self->_lightingContainer)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    containerConstraints = self->_containerConstraints;
    self->_containerConstraints = v4;

    BOOL v6 = [(PUPhotoEditToolController *)self photoEditSpec];
    uint64_t v7 = [v6 currentLayoutStyle];

    int v86 = v3;
    if ([(PUPhotoEditToolController *)self layoutOrientation] != 1 || v7 == 4)
    {
      uint64_t v82 = v7;
      id v18 = objc_alloc_init(MEMORY[0x1E4FB1940]);
      id v19 = [(PUPhotoEditPortraitToolController *)self view];
      [v19 addLayoutGuide:v18];

      uint64_t v20 = self->_containerConstraints;
      double v21 = [v18 heightAnchor];
      id v22 = [v3 heightAnchor];
      uint64_t v23 = [v21 constraintEqualToAnchor:v22];
      v96[0] = v23;
      uint64_t v24 = [v18 centerYAnchor];
      uint64_t v25 = [v3 centerYAnchor];
      double v26 = [v24 constraintEqualToAnchor:v25];
      v96[1] = v26;
      double v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v96 count:2];
      [(NSMutableArray *)v20 addObjectsFromArray:v27];

      int64_t v28 = [(PUPhotoEditToolController *)self layoutOrientation];
      int v29 = self->_containerConstraints;
      if (v28 == 2 || v82 == 4)
      {
        uint64_t v30 = [v18 rightAnchor];
        uint64_t v31 = [v86 rightAnchor];
      }
      else
      {
        uint64_t v30 = [v18 leftAnchor];
        uint64_t v31 = [v86 leftAnchor];
      }
      int v32 = (void *)v31;
      uint64_t v33 = [v30 constraintEqualToAnchor:v31];
      [(NSMutableArray *)v29 addObject:v33];

      v68 = self->_containerConstraints;
      v77 = [(UIView *)self->_lightingContainer centerXAnchor];
      v74 = [v18 centerXAnchor];
      v72 = [v77 constraintEqualToAnchor:v74];
      v95[0] = v72;
      v70 = [(UIView *)self->_lightingContainer centerYAnchor];
      int64_t v69 = [v18 centerYAnchor];
      id v34 = [v70 constraintEqualToAnchor:v69];
      v95[1] = v34;
      v35 = [(UIView *)self->_lightingContainer widthAnchor];
      v36 = [v18 heightAnchor];
      v37 = [v35 constraintEqualToAnchor:v36];
      v95[2] = v37;
      uint64_t v38 = [(UIView *)self->_lightingContainer heightAnchor];
      id v84 = v18;
      v39 = [v18 widthAnchor];
      int v40 = [v38 constraintEqualToAnchor:v39];
      v95[3] = v40;
      int v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:4];
      [(NSMutableArray *)v68 addObjectsFromArray:v41];

      int64_t v42 = [(PUPhotoEditToolController *)self layoutOrientation];
      BOOL v43 = v82 == 4 || v42 == 2;
      double v44 = 1.57079633;
      if (v43) {
        double v44 = -1.57079633;
      }
      CGAffineTransformMakeRotation(&v92, v44);
      lightingContainer = self->_lightingContainer;
      CGAffineTransform v91 = v92;
      [(UIView *)lightingContainer setTransform:&v91];
    }
    else
    {
      uint64_t v8 = self->_lightingContainer;
      long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v93[0] = *MEMORY[0x1E4F1DAB8];
      v93[1] = v9;
      v93[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(UIView *)v8 setTransform:v93];
      v76 = self->_containerConstraints;
      BOOL v10 = [v3 widthAnchor];
      v81 = [(UIView *)self->_lightingContainer widthAnchor];
      id v84 = v10;
      v79 = [v10 constraintEqualToAnchor:v81];
      v97[0] = v79;
      BOOL v11 = [v3 centerXAnchor];
      double v12 = [(UIView *)self->_lightingContainer centerXAnchor];
      BOOL v13 = [v11 constraintEqualToAnchor:v12];
      v97[1] = v13;
      BOOL v14 = [v3 bottomAnchor];
      uint64_t v15 = [(UIView *)self->_lightingContainer bottomAnchor];
      uint64_t v16 = [v14 constraintEqualToAnchor:v15];
      v97[2] = v16;
      int v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:3];
      [(NSMutableArray *)v76 addObjectsFromArray:v17];
    }
    v73 = self->_containerConstraints;
    id v85 = [(UIView *)self->_lightingContainer topAnchor];
    id v83 = [(UIView *)self->_apertureContainer topAnchor];
    v80 = [v85 constraintEqualToAnchor:v83];
    v94[0] = v80;
    v78 = [(UIView *)self->_lightingContainer bottomAnchor];
    v75 = [(UIView *)self->_apertureContainer bottomAnchor];
    v71 = [v78 constraintEqualToAnchor:v75];
    v94[1] = v71;
    v46 = [(UIView *)self->_lightingContainer leftAnchor];
    v47 = [(UIView *)self->_apertureContainer leftAnchor];
    v48 = [v46 constraintEqualToAnchor:v47];
    v94[2] = v48;
    v49 = [(UIView *)self->_lightingContainer rightAnchor];
    v50 = [(UIView *)self->_apertureContainer rightAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    v94[3] = v51;
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:4];
    [(NSMutableArray *)v73 addObjectsFromArray:v52];

    v53 = self->_lightingContainer;
    if (v53)
    {
      [(UIView *)v53 transform];
    }
    else
    {
      long long v89 = 0u;
      long long v90 = 0u;
      long long v88 = 0u;
    }
    objc_super v3 = v86;
    apertureContainer = self->_apertureContainer;
    v87[0] = v88;
    v87[1] = v89;
    v87[2] = v90;
    [(UIView *)apertureContainer setTransform:v87];
    [MEMORY[0x1E4F28DC8] activateConstraints:self->_containerConstraints];
  }
  lightingNameBadge = self->_lightingNameBadge;
  if (lightingNameBadge)
  {
    if (!self->_lightingNameBadgeConstraints)
    {
      BOOL v56 = [(CEKLightingNameBadge *)lightingNameBadge window];

      if (v56)
      {
        v57 = [MEMORY[0x1E4F1CA48] array];
        v58 = [(PUPhotoEditToolController *)self delegate];
        int v59 = [v58 mediaView];
        v60 = [v59 _scrollView];

        v61 = [(CEKLightingNameBadge *)self->_lightingNameBadge bottomAnchor];
        v62 = [v60 bottomAnchor];
        v63 = [v61 constraintEqualToAnchor:v62 constant:-10.0];
        [(NSArray *)v57 addObject:v63];

        BOOL v64 = [(CEKLightingNameBadge *)self->_lightingNameBadge centerXAnchor];
        BOOL v65 = [v60 centerXAnchor];
        BOOL v66 = [v64 constraintEqualToAnchor:v65 constant:0.0];
        [(NSArray *)v57 addObject:v66];

        [MEMORY[0x1E4F28DC8] activateConstraints:v57];
        lightingNameBadgeConstraints = self->_lightingNameBadgeConstraints;
        self->_lightingNameBadgeConstraints = v57;
      }
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditPortraitToolController;
  [(PUPhotoEditPortraitToolController *)&v6 viewWillDisappear:a3];
  [(PUPhotoEditPortraitToolController *)self _removeFocusOverlayIfNeeded];
  id v4 = [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer view];
  [v4 removeGestureRecognizer:self->_longPressGestureRecognizer];

  longPressGestureRecognizer = self->_longPressGestureRecognizer;
  self->_longPressGestureRecognizer = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PUPhotoEditPortraitToolController;
  [(PUPhotoEditToolController *)&v12 viewWillAppear:a3];
  [(PUPhotoEditPortraitToolController *)self _updateFocusOverlay];
  id v4 = [(PUPhotoEditToolController *)self asset];
  char v5 = [v4 isLivePhoto];

  if ((v5 & 1) == 0)
  {
    objc_super v6 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel_longPressed_];
    longPressGestureRecognizer = self->_longPressGestureRecognizer;
    self->_longPressGestureRecognizer = v6;

    [(UILongPressGestureRecognizer *)self->_longPressGestureRecognizer setDelegate:0];
    uint64_t v8 = [(PUPhotoEditToolController *)self compositionController];
    long long v9 = [v8 depthAdjustmentController];
    -[UILongPressGestureRecognizer setEnabled:](self->_longPressGestureRecognizer, "setEnabled:", [v9 enabled]);
    BOOL v10 = [(PUPhotoEditToolController *)self delegate];
    BOOL v11 = [v10 mediaView];
    [v11 addGestureRecognizer:self->_longPressGestureRecognizer];
  }
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PUPhotoEditPortraitToolController;
  [(PUPhotoEditPortraitToolController *)&v9 viewDidLoad];
  objc_super v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  lightingContainer = self->_lightingContainer;
  self->_lightingContainer = v3;

  [(UIView *)self->_lightingContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  char v5 = [(PUPhotoEditToolController *)self toolContainerView];
  [v5 addSubview:self->_lightingContainer];

  objc_super v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  apertureContainer = self->_apertureContainer;
  self->_apertureContainer = v6;

  [(UIView *)self->_apertureContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v8 = [(PUPhotoEditToolController *)self toolContainerView];
  [v8 addSubview:self->_apertureContainer];
}

- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditPortraitToolController;
  [(PUPhotoEditToolController *)&v7 setupWithAsset:a3 compositionController:a4 editSource:a5 valuesCalculator:a6];
  [(PUPhotoEditPortraitToolController *)self setToolSelection:[(PUPhotoEditPortraitToolController *)self _defaultPortraitTool]];
  [(PUPhotoEditPortraitToolController *)self _refreshFromValuesCalculator];
  [(PUPhotoEditPortraitToolController *)self _updateApertureSliderLength];
  [(PUPhotoEditPortraitToolController *)self _updateToolVisibilityAnimated:0];
}

@end