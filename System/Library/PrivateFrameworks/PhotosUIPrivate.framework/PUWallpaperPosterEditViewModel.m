@interface PUWallpaperPosterEditViewModel
- ($9041C250948D1B2A219AAF65C5556C0D)scrollPosition;
- (BOOL)appliesDepthToAllOrientations;
- (BOOL)applySettlingEffectVisibleFrameRestoration;
- (BOOL)canApplyHeadroom;
- (BOOL)depthEnabled;
- (BOOL)headroomEnabled;
- (BOOL)headroomLayoutUsesHeadroomArea;
- (BOOL)isPresentingSingleStyle;
- (BOOL)isUserPanningOrZooming;
- (BOOL)isUsingHeadroom;
- (BOOL)parallaxDisabled;
- (BOOL)settlingEffectEnabled;
- (BOOL)userHasAdjustedLandscapeVisibleFrame;
- (BOOL)userHasAdjustedPortraitVisibleFrame;
- (BOOL)visibleFrameCrossesHeadroomBoundary;
- (CGRect)containerFrame;
- (CGRect)normalizedVisibleFrame;
- (CGRect)settlingEffectStateRestorationLandscapeNormalizedVisibleFrame;
- (CGRect)settlingEffectStateRestorationPortraitNormalizedVisibleFrame;
- (NSArray)availableStyles;
- (NSArray)currentStyleKinds;
- (NSArray)currentStyles;
- (NSArray)visibleLayerStackViewModels;
- (NSMutableDictionary)layerStackViewModelsByStyleKind;
- (NSMutableDictionary)viewModelUpdatersByStyleKind;
- (NSNumber)desiredHeadroomVisibilityAmount;
- (NSSet)activeLayerStackViewModels;
- (NSString)settlingEffectStateRestorationLayerStyleKind;
- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration;
- (PISegmentationItem)segmentationItem;
- (PUParallaxLayerStackViewModel)currentLayerStackViewModel;
- (PUParallaxLayerStackViewModel)originalLayerStackViewModel;
- (PUParallaxLayerStackViewModelUpdater)currentLayerStackViewModelUpdater;
- (PUWallpaperPosterEditViewModel)init;
- (PUWallpaperPosterEditViewModel)initWithInitialLayerStackViewModel:(id)a3 availableStyles:(id)a4;
- (PXNumberAnimator)headroomVisibilityAmountAnimator;
- (PXUpdater)updater;
- (double)currentClockAreaLuminanceForStyleKind:(id)a3;
- (id)_layerStackViewModelForStyleKind:(id)a3;
- (id)_nextStyleKindForStyleKind:(id)a3;
- (id)_previousStyleKindForStyleKind:(id)a3;
- (id)availableLayerStackViewModels;
- (id)posterEditConfigurationRepresentation;
- (int64_t)deviceOrientation;
- (int64_t)stylesChange;
- (void)_createViewModelsWithInitialViewModel:(id)a3;
- (void)_initScrollPositionWithViewModel:(id)a3;
- (void)_invalidateActiveLayerStackViewModels;
- (void)_invalidateAvailableLayerStackViewModelsContainerGeometry;
- (void)_invalidateAvailableLayerStackViewModelsProperties;
- (void)_invalidateCurrentLayerStackViewModel;
- (void)_invalidateCurrentStyles;
- (void)_invalidateDepthEnabled;
- (void)_invalidateDesiredHeadroomVisibilityAmount;
- (void)_invalidateNormalizedVisibleFrame;
- (void)_invalidatePresentingSingleStyle;
- (void)_invalidatePropertiesFromCurrentLayerStackViewModel;
- (void)_invalidateVisibleFrameCrossesHeadroomBoundary;
- (void)_invalidateVisibleLayerStackViewModels;
- (void)_setNeedsUpdate;
- (void)_updateActiveLayerStackViewModels;
- (void)_updateAvailableLayerStackViewModelsContainerGeometry;
- (void)_updateAvailableLayerStackViewModelsProperties;
- (void)_updateCurrentLayerStackViewModel;
- (void)_updateCurrentStyles;
- (void)_updateCurrentStylesWithChange:(int64_t)a3;
- (void)_updateDepthEnabled;
- (void)_updateDesiredHeadroomVisibilityAmount;
- (void)_updateLayerStackViewModelProperties:(id)a3;
- (void)_updateNormalizedVisibleFrame;
- (void)_updatePresentingSingleStyle;
- (void)_updatePropertiesFromCurrentLayerStackViewModel;
- (void)_updateVisibleFrameCrossesHeadroomBoundary;
- (void)_updateVisibleLayerStackViewModels;
- (void)applyChangesFromPosterEditConfiguration:(id)a3;
- (void)didPerformChanges;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performChanges:(id)a3;
- (void)reframeToSettlingEffectBoundsIfNeeded;
- (void)scrollToPosition:(id *)a3;
- (void)setActiveLayerStackViewModels:(id)a3;
- (void)setAppliesDepthToAllOrientations:(BOOL)a3;
- (void)setAvailableStyles:(id)a3;
- (void)setContainerFrame:(CGRect)a3;
- (void)setCurrentLayerStackViewModel:(id)a3;
- (void)setCurrentStyles:(id)a3;
- (void)setDepthEnabled:(BOOL)a3;
- (void)setDesiredHeadroomVisibilityAmount:(id)a3;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setHeadroomEnabled:(BOOL)a3;
- (void)setHeadroomVisibilityAmountAnimator:(id)a3;
- (void)setIsUserPanningOrZooming:(BOOL)a3;
- (void)setNormalizedVisibleFrame:(CGRect)a3;
- (void)setNormalizedVisibleFrameAnimated:(CGRect)a3;
- (void)setParallaxDisabled:(BOOL)a3;
- (void)setPresentingSingleStyle:(BOOL)a3;
- (void)setSettlingEffectEnabled:(BOOL)a3;
- (void)setSettlingEffectStateRestorationLandscapeNormalizedVisibleFrame:(CGRect)a3;
- (void)setSettlingEffectStateRestorationLayerStyleKind:(id)a3;
- (void)setSettlingEffectStateRestorationPortraitNormalizedVisibleFrame:(CGRect)a3;
- (void)setStylesChange:(int64_t)a3;
- (void)setUserHasAdjustedLandscapeVisibleFrame:(BOOL)a3;
- (void)setUserHasAdjustedPortraitVisibleFrame:(BOOL)a3;
- (void)setUsingHeadroom:(BOOL)a3;
- (void)setVisibleFrameCrossesHeadroomBoundary:(BOOL)a3;
- (void)setVisibleLayerStackViewModels:(id)a3;
- (void)shutdownWithTimeout:(double)a3;
- (void)updateSettlingEffectWithSegmentationItem:(id)a3 layerStack:(id)a4;
- (void)userDidAdjustVisibleFrame;
@end

@implementation PUWallpaperPosterEditViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headroomVisibilityAmountAnimator, 0);
  objc_storeStrong((id *)&self->_desiredHeadroomVisibilityAmount, 0);
  objc_storeStrong((id *)&self->_activeLayerStackViewModels, 0);
  objc_storeStrong((id *)&self->_viewModelUpdatersByStyleKind, 0);
  objc_storeStrong((id *)&self->_layerStackViewModelsByStyleKind, 0);
  objc_storeStrong((id *)&self->_availableStyles, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_visibleLayerStackViewModels, 0);
  objc_storeStrong((id *)&self->_settlingEffectStateRestorationLayerStyleKind, 0);
  objc_storeStrong((id *)&self->_currentStyles, 0);
  objc_storeStrong((id *)&self->_currentLayerStackViewModel, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
}

- (void)setSettlingEffectStateRestorationLandscapeNormalizedVisibleFrame:(CGRect)a3
{
  self->_settlingEffectStateRestorationLandscapeNormalizedVisibleFrame = a3;
}

- (CGRect)settlingEffectStateRestorationLandscapeNormalizedVisibleFrame
{
  double x = self->_settlingEffectStateRestorationLandscapeNormalizedVisibleFrame.origin.x;
  double y = self->_settlingEffectStateRestorationLandscapeNormalizedVisibleFrame.origin.y;
  double width = self->_settlingEffectStateRestorationLandscapeNormalizedVisibleFrame.size.width;
  double height = self->_settlingEffectStateRestorationLandscapeNormalizedVisibleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSettlingEffectStateRestorationPortraitNormalizedVisibleFrame:(CGRect)a3
{
  self->_settlingEffectStateRestorationPortraitNormalizedVisibleFrame = a3;
}

- (CGRect)settlingEffectStateRestorationPortraitNormalizedVisibleFrame
{
  double x = self->_settlingEffectStateRestorationPortraitNormalizedVisibleFrame.origin.x;
  double y = self->_settlingEffectStateRestorationPortraitNormalizedVisibleFrame.origin.y;
  double width = self->_settlingEffectStateRestorationPortraitNormalizedVisibleFrame.size.width;
  double height = self->_settlingEffectStateRestorationPortraitNormalizedVisibleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setUserHasAdjustedLandscapeVisibleFrame:(BOOL)a3
{
  self->_userHasAdjustedLandscapeVisibleFrame = a3;
}

- (BOOL)userHasAdjustedLandscapeVisibleFrame
{
  return self->_userHasAdjustedLandscapeVisibleFrame;
}

- (void)setUserHasAdjustedPortraitVisibleFrame:(BOOL)a3
{
  self->_userHasAdjustedPortraitVisibleFrame = a3;
}

- (BOOL)userHasAdjustedPortraitVisibleFrame
{
  return self->_userHasAdjustedPortraitVisibleFrame;
}

- (void)setHeadroomVisibilityAmountAnimator:(id)a3
{
}

- (PXNumberAnimator)headroomVisibilityAmountAnimator
{
  return self->_headroomVisibilityAmountAnimator;
}

- (NSNumber)desiredHeadroomVisibilityAmount
{
  return self->_desiredHeadroomVisibilityAmount;
}

- (BOOL)visibleFrameCrossesHeadroomBoundary
{
  return self->_visibleFrameCrossesHeadroomBoundary;
}

- (NSSet)activeLayerStackViewModels
{
  return self->_activeLayerStackViewModels;
}

- (NSMutableDictionary)viewModelUpdatersByStyleKind
{
  return self->_viewModelUpdatersByStyleKind;
}

- (NSMutableDictionary)layerStackViewModelsByStyleKind
{
  return self->_layerStackViewModelsByStyleKind;
}

- (void)setAvailableStyles:(id)a3
{
}

- (NSArray)availableStyles
{
  return self->_availableStyles;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (BOOL)isPresentingSingleStyle
{
  return self->_presentingSingleStyle;
}

- (NSArray)visibleLayerStackViewModels
{
  return self->_visibleLayerStackViewModels;
}

- (NSString)settlingEffectStateRestorationLayerStyleKind
{
  return self->_settlingEffectStateRestorationLayerStyleKind;
}

- (BOOL)isUsingHeadroom
{
  return self->_usingHeadroom;
}

- (BOOL)parallaxDisabled
{
  return self->_parallaxDisabled;
}

- (BOOL)headroomEnabled
{
  return self->_headroomEnabled;
}

- (BOOL)settlingEffectEnabled
{
  return self->_settlingEffectEnabled;
}

- (BOOL)appliesDepthToAllOrientations
{
  return self->_appliesDepthToAllOrientations;
}

- (BOOL)depthEnabled
{
  return self->_depthEnabled;
}

- (CGRect)normalizedVisibleFrame
{
  double x = self->_normalizedVisibleFrame.origin.x;
  double y = self->_normalizedVisibleFrame.origin.y;
  double width = self->_normalizedVisibleFrame.size.width;
  double height = self->_normalizedVisibleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)containerFrame
{
  double x = self->_containerFrame.origin.x;
  double y = self->_containerFrame.origin.y;
  double width = self->_containerFrame.size.width;
  double height = self->_containerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- ($9041C250948D1B2A219AAF65C5556C0D)scrollPosition
{
  *($BEDB32BBFE39BE12071257E95175E2A8 *)retstr = *($BEDB32BBFE39BE12071257E95175E2A8 *)((char *)self + 224);
  return self;
}

- (BOOL)isUserPanningOrZooming
{
  return self->_isUserPanningOrZooming;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setStylesChange:(int64_t)a3
{
  self->_stylesChange = a3;
}

- (int64_t)stylesChange
{
  return self->_stylesChange;
}

- (NSArray)currentStyles
{
  return self->_currentStyles;
}

- (PUParallaxLayerStackViewModel)currentLayerStackViewModel
{
  return self->_currentLayerStackViewModel;
}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v10 = v9;
  if (a5 == "LayerStackViewModelObservationContext")
  {
    id v14 = v9;
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_16:
        char v22 = [v14 stylePropertiesChange];
        char v23 = [v14 currentLayerStackPropertiesChange];
        if ((v6 & 2) != 0)
        {
          id v24 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];

          if (v24 == v14)
          {
            v40[0] = MEMORY[0x1E4F143A8];
            v40[1] = 3221225472;
            v40[2] = __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke;
            v40[3] = &unk_1E5F26688;
            v40[4] = self;
            [(PUWallpaperPosterEditViewModel *)self performChanges:v40];
          }
        }
        if (v6 < 0)
        {
          id v25 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];

          if (v25 == v14) {
            [(PUWallpaperPosterEditViewModel *)self _updateNormalizedVisibleFrame];
          }
        }
        if (v22)
        {
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_2;
          v39[3] = &unk_1E5F26688;
          v39[4] = self;
          [(PUWallpaperPosterEditViewModel *)self performChanges:v39];
          if ((v22 & 0x10) == 0)
          {
LABEL_24:
            if ((v23 & 0x20) == 0)
            {
LABEL_26:

              goto LABEL_27;
            }
LABEL_25:
            v37[0] = MEMORY[0x1E4F143A8];
            v37[1] = 3221225472;
            v37[2] = __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_4;
            v37[3] = &unk_1E5F26688;
            v37[4] = self;
            [(PUWallpaperPosterEditViewModel *)self performChanges:v37];
            goto LABEL_26;
          }
        }
        else if ((v22 & 0x10) == 0)
        {
          goto LABEL_24;
        }
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_3;
        v38[3] = &unk_1E5F26688;
        v38[4] = self;
        [(PUWallpaperPosterEditViewModel *)self performChanges:v38];
        if ((v23 & 0x20) == 0) {
          goto LABEL_26;
        }
        goto LABEL_25;
      }
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      v29 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v29);
      v30 = objc_msgSend(v14, "px_descriptionForAssertionMessage");
      [v26 handleFailureInMethod:a2, self, @"PUWallpaperPosterEditViewModel.m", 961, @"%@ should be an instance inheriting from %@, but it is %@", @"observable", v28, v30 object file lineNumber description];
    }
    else
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      [v26 handleFailureInMethod:a2, self, @"PUWallpaperPosterEditViewModel.m", 961, @"%@ should be an instance inheriting from %@, but it is nil", @"observable", v28 object file lineNumber description];
    }

    goto LABEL_16;
  }
  if (a5 == "HeadroomVisibilityAmountAnimatorObservationContext" && (v6 & 2) != 0)
  {
    v11 = [(PUWallpaperPosterEditViewModel *)self headroomVisibilityAmountAnimator];
    [v11 presentationValue];
    uint64_t v13 = v12;

    id v14 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_5;
    v36[3] = &__block_descriptor_40_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
    v36[4] = v13;
    [v14 performChanges:v36];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v15 = [(PUWallpaperPosterEditViewModel *)self layerStackViewModelsByStyleKind];
    v16 = [v15 allValues];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(id *)(*((void *)&v32 + 1) + 8 * i);
          if (v21 != v14)
          {
            v31[0] = MEMORY[0x1E4F143A8];
            v31[1] = 3221225472;
            v31[2] = __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_6;
            v31[3] = &__block_descriptor_40_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
            v31[4] = v13;
            [v21 performChanges:v31];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v18);
    }

    goto LABEL_26;
  }
LABEL_27:
}

uint64_t __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidatePropertiesFromCurrentLayerStackViewModel];
  v2 = *(void **)(a1 + 32);
  return [v2 _invalidateVisibleFrameCrossesHeadroomBoundary];
}

uint64_t __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentStylesWithChange:0];
}

uint64_t __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCurrentStylesWithChange:1];
}

uint64_t __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setStylesChange:", objc_msgSend(*(id *)(a1 + 32), "stylesChange") | 4);
  v2 = *(void **)(a1 + 32);
  return [v2 signalChange:512];
}

uint64_t __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setDesiredHeadroomVisibilityAmount:*(double *)(a1 + 32)];
}

uint64_t __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 setDesiredHeadroomVisibilityAmount:ceil(*(double *)(a1 + 32))];
}

- (void)setDesiredHeadroomVisibilityAmount:(id)a3
{
  v5 = (NSNumber *)a3;
  __int16 v6 = self->_desiredHeadroomVisibilityAmount;
  if (v6 == v5)
  {
  }
  else
  {
    v7 = v6;
    char v8 = [(NSNumber *)v6 isEqual:v5];

    if ((v8 & 1) == 0)
    {
      id v9 = self->_desiredHeadroomVisibilityAmount;
      objc_storeStrong((id *)&self->_desiredHeadroomVisibilityAmount, a3);
      if (v9 || [(PUWallpaperPosterEditViewModel *)self isUserPanningOrZooming])
      {
        v10 = [(PUWallpaperPosterEditViewModel *)self headroomVisibilityAmountAnimator];
        v11 = +[PUPosterHeadroomSettings sharedInstance];
        [v11 fadeAnimationDuration];
        double v13 = v12;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __69__PUWallpaperPosterEditViewModel_setDesiredHeadroomVisibilityAmount___block_invoke;
        v17[3] = &unk_1E5F263E8;
        id v14 = (id *)&v18;
        uint64_t v18 = v5;
        [v10 performChangesWithDuration:4 curve:v17 changes:v13];
      }
      else
      {
        v10 = [(PUWallpaperPosterEditViewModel *)self headroomVisibilityAmountAnimator];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __69__PUWallpaperPosterEditViewModel_setDesiredHeadroomVisibilityAmount___block_invoke_2;
        v15[3] = &unk_1E5F263E8;
        id v14 = (id *)&v16;
        v16 = v5;
        [v10 performChangesWithoutAnimation:v15];
      }
    }
  }
}

void __69__PUWallpaperPosterEditViewModel_setDesiredHeadroomVisibilityAmount___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 floatValue];
  [v4 setValue:v3];
}

void __69__PUWallpaperPosterEditViewModel_setDesiredHeadroomVisibilityAmount___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = a2;
  [v2 floatValue];
  [v4 setValue:v3];
}

- (void)_updateDesiredHeadroomVisibilityAmount
{
  if ([(PUWallpaperPosterEditViewModel *)self visibleFrameCrossesHeadroomBoundary])
  {
    float v3 = &unk_1F078D220;
  }
  else
  {
    float v3 = &unk_1F078D230;
  }
  [(PUWallpaperPosterEditViewModel *)self setDesiredHeadroomVisibilityAmount:v3];
}

- (void)_invalidateDesiredHeadroomVisibilityAmount
{
  id v2 = [(PUWallpaperPosterEditViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDesiredHeadroomVisibilityAmount];
}

- (void)setUsingHeadroom:(BOOL)a3
{
  if (self->_usingHeadroom != a3)
  {
    self->_usingHeadroom = a3;
    [(PUWallpaperPosterEditViewModel *)self signalChange:4096];
  }
}

- (void)setVisibleFrameCrossesHeadroomBoundary:(BOOL)a3
{
  if (self->_visibleFrameCrossesHeadroomBoundary != a3)
  {
    self->_visibleFrameCrossesHeadroomBoundardouble y = a3;
    [(PUWallpaperPosterEditViewModel *)self _invalidateDesiredHeadroomVisibilityAmount];
  }
}

- (void)_updateVisibleFrameCrossesHeadroomBoundary
{
  float v3 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
  id v4 = [v3 currentLayerStack];
  v5 = [v4 layout];
  int v6 = [v5 canApplyHeadroom];

  if (v6)
  {
    [(PUWallpaperPosterEditViewModel *)self normalizedVisibleFrame];
    BOOL v7 = CGRectGetMinY(v9) < 0.0;
  }
  else
  {
    BOOL v7 = 0;
  }
  [(PUWallpaperPosterEditViewModel *)self setVisibleFrameCrossesHeadroomBoundary:v7];
  [(PUWallpaperPosterEditViewModel *)self setUsingHeadroom:v7];
}

- (void)_invalidateVisibleFrameCrossesHeadroomBoundary
{
  id v2 = [(PUWallpaperPosterEditViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateVisibleFrameCrossesHeadroomBoundary];
}

- (void)_updateDepthEnabled
{
  id v5 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModelUpdater];
  float v3 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
  id v4 = [(PUWallpaperPosterEditViewModel *)self availableLayerStackViewModels];
  [v5 recalculateClockOverlap:v3 allViewModels:v4 highPriority:1];
}

- (void)_invalidateDepthEnabled
{
  id v2 = [(PUWallpaperPosterEditViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDepthEnabled];
}

- (void)_updateLayerStackViewModelProperties:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__PUWallpaperPosterEditViewModel__updateLayerStackViewModelProperties___block_invoke;
  v3[3] = &unk_1E5F2E420;
  v3[4] = self;
  [a3 performChanges:v3];
}

void __71__PUWallpaperPosterEditViewModel__updateLayerStackViewModelProperties___block_invoke(uint64_t a1, void *a2)
{
  float v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 normalizedVisibleFrame];
  objc_msgSend(v4, "setNormalizedVisibleFrame:");
  objc_msgSend(v4, "setParallaxDisabled:", objc_msgSend(*(id *)(a1 + 32), "parallaxDisabled"));
  objc_msgSend(v4, "setAppliesDepthToAllOrientations:", objc_msgSend(*(id *)(a1 + 32), "appliesDepthToAllOrientations"));
  objc_msgSend(v4, "setDepthEnabled:", objc_msgSend(*(id *)(a1 + 32), "depthEnabled"));
  objc_msgSend(v4, "setSettlingEffectEnabled:", objc_msgSend(*(id *)(a1 + 32), "settlingEffectEnabled"));
  [v4 setShowsDebugHUD:PXPreferencesGetBool()];
}

- (void)_updateAvailableLayerStackViewModelsProperties
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  float v3 = [(PUWallpaperPosterEditViewModel *)self layerStackViewModelsByStyleKind];
  id v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(PUWallpaperPosterEditViewModel *)self _updateLayerStackViewModelProperties:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_invalidateAvailableLayerStackViewModelsProperties
{
  id v2 = [(PUWallpaperPosterEditViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAvailableLayerStackViewModelsProperties];
}

- (void)_updatePropertiesFromCurrentLayerStackViewModel
{
  id v3 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
  [v3 normalizedVisibleFrame];
  -[PUWallpaperPosterEditViewModel setNormalizedVisibleFrame:](self, "setNormalizedVisibleFrame:");
  -[PUWallpaperPosterEditViewModel setDepthEnabled:](self, "setDepthEnabled:", [v3 depthEnabled]);
  -[PUWallpaperPosterEditViewModel setParallaxDisabled:](self, "setParallaxDisabled:", [v3 parallaxDisabled]);
}

- (void)_invalidatePropertiesFromCurrentLayerStackViewModel
{
  id v2 = [(PUWallpaperPosterEditViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePropertiesFromCurrentLayerStackViewModel];
}

- (void)_updateAvailableLayerStackViewModelsContainerGeometry
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(PUWallpaperPosterEditViewModel *)self layerStackViewModelsByStyleKind];
  id v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __87__PUWallpaperPosterEditViewModel__updateAvailableLayerStackViewModelsContainerGeometry__block_invoke;
        v10[3] = &unk_1E5F2E420;
        v10[4] = self;
        [v9 performChanges:v10];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

void __87__PUWallpaperPosterEditViewModel__updateAvailableLayerStackViewModelsContainerGeometry__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 containerFrame];
  objc_msgSend(v4, "setContainerFrame:");
  objc_msgSend(v4, "setDeviceOrientation:", objc_msgSend(*(id *)(a1 + 32), "deviceOrientation"));
}

- (void)_invalidateAvailableLayerStackViewModelsContainerGeometry
{
  id v2 = [(PUWallpaperPosterEditViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAvailableLayerStackViewModelsContainerGeometry];
}

- (void)_updateNormalizedVisibleFrame
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PUWallpaperPosterEditViewModel *)self isUserPanningOrZooming];
  id v4 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __63__PUWallpaperPosterEditViewModel__updateNormalizedVisibleFrame__block_invoke;
  v32[3] = &unk_1E5F2E420;
  v32[4] = self;
  [v4 performChanges:v32];
  uint64_t v5 = +[PUSuggestionsSettings sharedInstance];
  char v6 = [v5 debugDisableFrameUpdates];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [(PUWallpaperPosterEditViewModel *)self viewModelUpdatersByStyleKind];
    uint64_t v8 = [v4 style];
    long long v9 = [v8 kind];
    long long v10 = [v7 objectForKeyedSubscript:v9];

    long long v11 = [(PUWallpaperPosterEditViewModel *)self layerStackViewModelsByStyleKind];
    long long v12 = [v11 allValues];
    [v10 renderOnscreenModelAfterVisibleFrameChange:v4 allViewModels:v12];

    if (!v3)
    {
      id v25 = v10;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v13 = [(PUWallpaperPosterEditViewModel *)self layerStackViewModelsByStyleKind];
      long long v14 = [v13 allValues];

      id obj = v14;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v29;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v29 != v17) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void **)(*((void *)&v28 + 1) + 8 * v18);
            if (v19 != v4)
            {
              v27[0] = MEMORY[0x1E4F143A8];
              v27[1] = 3221225472;
              v27[2] = __63__PUWallpaperPosterEditViewModel__updateNormalizedVisibleFrame__block_invoke_2;
              v27[3] = &unk_1E5F2E420;
              v27[4] = self;
              [v19 performChanges:v27];
              v20 = [(PUWallpaperPosterEditViewModel *)self viewModelUpdatersByStyleKind];
              [v19 style];
              v22 = id v21 = v4;
              char v23 = [v22 kind];
              id v24 = [v20 objectForKeyedSubscript:v23];

              id v4 = v21;
              objc_msgSend(v24, "renderOffscreenModelAfterVisibleFrameChange:highPriority:", v19, -[NSSet containsObject:](self->_activeLayerStackViewModels, "containsObject:", v19));
            }
            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v16);
      }

      long long v10 = v25;
    }
  }
}

void __63__PUWallpaperPosterEditViewModel__updateNormalizedVisibleFrame__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 normalizedVisibleFrame];
  objc_msgSend(v3, "setNormalizedVisibleFrame:");
}

void __63__PUWallpaperPosterEditViewModel__updateNormalizedVisibleFrame__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 normalizedVisibleFrame];
  objc_msgSend(v3, "setNormalizedVisibleFrame:");
}

- (void)_invalidateNormalizedVisibleFrame
{
  id v2 = [(PUWallpaperPosterEditViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateNormalizedVisibleFrame];
}

- (void)_updateCurrentLayerStackViewModel
{
  v13[0] = 0;
  v13[1] = 0;
  uint64_t v14 = 0;
  [(PUWallpaperPosterEditViewModel *)self scrollPosition];
  if (0.0 <= 0.5) {
    id v3 = (id *)v13;
  }
  else {
    id v3 = (id *)&v14;
  }
  id v4 = *v3;
  uint64_t v5 = [(PUWallpaperPosterEditViewModel *)self layerStackViewModelsByStyleKind];
  char v6 = [v5 objectForKeyedSubscript:v4];
  [(PUWallpaperPosterEditViewModel *)self setCurrentLayerStackViewModel:v6];

  uint64_t v7 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
  if ([v7 clockIntersection])
  {
    uint64_t v8 = [(PUWallpaperPosterEditViewModel *)self segmentationItem];
    char v9 = [v8 supportsManualClockIntersectionTolerance];

    if (v9) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  long long v10 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModelUpdater];
  long long v11 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
  long long v12 = [(PUWallpaperPosterEditViewModel *)self availableLayerStackViewModels];
  [v10 recalculateClockIntersection:v11 allViewModels:v12 highPriority:1];

LABEL_9:
}

- (void)_invalidateCurrentLayerStackViewModel
{
  id v2 = [(PUWallpaperPosterEditViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentLayerStackViewModel];
}

- (void)_updatePresentingSingleStyle
{
  [(PUWallpaperPosterEditViewModel *)self scrollPosition];
  [(PUWallpaperPosterEditViewModel *)self setPresentingSingleStyle:fabs(v3) <= 0.00000999999975];
}

- (void)_invalidatePresentingSingleStyle
{
  id v2 = [(PUWallpaperPosterEditViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updatePresentingSingleStyle];
}

- (void)_updateVisibleLayerStackViewModels
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v30[5] = 0;
  v30[6] = 0;
  id v31 = 0;
  [(PUWallpaperPosterEditViewModel *)self scrollPosition];
  id v3 = 0;
  double v4 = 0.0;
  if ((PXFloatEqualToFloatWithTolerance() & 1) == 0)
  {
    double v4 = 1.0;
    if (!PXFloatEqualToFloatWithTolerance()) {
      double v4 = 0.0;
    }
  }
  uint64_t v5 = [(PUWallpaperPosterEditViewModel *)self _layerStackViewModelForStyleKind:v3];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __68__PUWallpaperPosterEditViewModel__updateVisibleLayerStackViewModels__block_invoke;
  v30[3] = &__block_descriptor_40_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
  *(double *)&v30[4] = v4;
  [v5 performChanges:v30];
  id v6 = v31;
  if ([v3 isEqualToString:v6])
  {
    uint64_t v7 = [(PUWallpaperPosterEditViewModel *)self _nextStyleKindForStyleKind:v3];

    id v6 = (id)v7;
  }
  id v24 = v3;
  char v22 = v6;
  if ([v3 isEqualToString:v6])
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [(PUWallpaperPosterEditViewModel *)self _layerStackViewModelForStyleKind:v6];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __68__PUWallpaperPosterEditViewModel__updateVisibleLayerStackViewModels__block_invoke_2;
    v29[3] = &__block_descriptor_40_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
    *(double *)&v29[4] = v4;
    [v8 performChanges:v29];
  }
  id v21 = v8;
  char v23 = v5;
  char v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v5, v8, 0);
  [(PUWallpaperPosterEditViewModel *)self setVisibleLayerStackViewModels:v9];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v10 = [(PUWallpaperPosterEditViewModel *)self availableLayerStackViewModels];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v16 = [(PUWallpaperPosterEditViewModel *)self viewModelUpdatersByStyleKind];
        uint64_t v17 = [v15 style];
        uint64_t v18 = [v17 kind];
        uint64_t v19 = [v16 objectForKeyedSubscript:v18];

        v20 = [(PUWallpaperPosterEditViewModel *)self visibleLayerStackViewModels];
        LODWORD(v18) = [v20 containsObject:v15];

        if (v18) {
          [v19 ensureOnscreenModelIsLoaded:v15];
        }
        else {
          [v19 ensureOffscreenModelIsUnloaded:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v12);
  }
}

void __68__PUWallpaperPosterEditViewModel__updateVisibleLayerStackViewModels__block_invoke(uint64_t a1, void *a2)
{
  double v2 = 1.0 - *(double *)(a1 + 32);
  id v3 = a2;
  [v3 setVisibilityAmount:v2];
  [v3 setLayoutOrder:2];
}

void __68__PUWallpaperPosterEditViewModel__updateVisibleLayerStackViewModels__block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *(double *)(a1 + 32);
  id v3 = a2;
  [v3 setVisibilityAmount:v2];
  [v3 setLayoutOrder:1];
}

- (void)_invalidateVisibleLayerStackViewModels
{
  id v2 = [(PUWallpaperPosterEditViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateVisibleLayerStackViewModels];
}

- (void)_updateActiveLayerStackViewModels
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  [(PUWallpaperPosterEditViewModel *)self scrollPosition];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PUWallpaperPosterEditViewModel__updateActiveLayerStackViewModels__block_invoke;
  aBlock[3] = &unk_1E5F2A1F8;
  aBlock[4] = self;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = (void (**)(void *, void))_Block_copy(aBlock);
  v5[2](v5, v9);
  v5[2](v5, v11);
  id v6 = (void *)[v4 copy];
  [(PUWallpaperPosterEditViewModel *)self setActiveLayerStackViewModels:v6];
}

void __67__PUWallpaperPosterEditViewModel__updateActiveLayerStackViewModels__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v15 = v3;
    char v5 = [v3 isEqualToString:*MEMORY[0x1E4F8D030]];
    id v4 = v15;
    if ((v5 & 1) == 0)
    {
      id v6 = [*(id *)(a1 + 32) _layerStackViewModelForStyleKind:v15];
      uint64_t v7 = *(void **)(a1 + 32);
      id v8 = [v7 _previousStyleKindForStyleKind:v15];
      uint64_t v9 = [v7 _layerStackViewModelForStyleKind:v8];

      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = [v10 _nextStyleKindForStyleKind:v15];
      uint64_t v12 = [v10 _layerStackViewModelForStyleKind:v11];

      uint64_t v13 = *(void **)(a1 + 40);
      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v6, v9, v12, 0);
      [v13 addObjectsFromArray:v14];

      id v4 = v15;
    }
  }
}

- (void)_invalidateActiveLayerStackViewModels
{
  id v2 = [(PUWallpaperPosterEditViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateActiveLayerStackViewModels];
}

- (void)_updateCurrentStyles
{
}

- (void)_invalidateCurrentStyles
{
  id v2 = [(PUWallpaperPosterEditViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentStyles];
}

- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration
{
  id v2 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
  id v3 = [v2 layoutConfiguration];

  return (PFWallpaperCompoundDeviceConfiguration *)v3;
}

- (id)_layerStackViewModelForStyleKind:(id)a3
{
  id v4 = a3;
  if ((id)*MEMORY[0x1E4F8D030] == v4)
  {
    id v6 = 0;
  }
  else
  {
    char v5 = [(PUWallpaperPosterEditViewModel *)self layerStackViewModelsByStyleKind];
    id v6 = [v5 objectForKeyedSubscript:v4];

    if (!v6) {
      _PFAssertContinueHandler();
    }
  }

  return v6;
}

- (id)posterEditConfigurationRepresentation
{
  [(PUWallpaperPosterEditViewModel *)self scrollPosition];
  id v3 = (id *)&v22;
  if (v21 <= 0.5) {
    id v3 = (id *)&v20;
  }
  id v4 = *v3;
  char v5 = [(PUWallpaperPosterEditViewModel *)self layerStackViewModelsByStyleKind];
  id v6 = [v5 objectForKeyedSubscript:v4];

  uint64_t v7 = [v6 compoundLayerStack];
  id v8 = [v7 portraitLayerStack];
  uint64_t v9 = [v7 landscapeLayerStack];
  id v10 = objc_alloc_init(MEMORY[0x1E4F8CD08]);
  uint64_t v11 = [v8 layout];
  [v11 normalizedVisibleFrame];
  PXRectFlippedVertically();
  objc_msgSend(v10, "setNormalizedVisibleFrame:");

  uint64_t v12 = [v9 layout];
  [v12 normalizedVisibleFrame];
  PXRectFlippedVertically();
  objc_msgSend(v10, "setNormalizedLandscapeVisibleFrame:");

  if ([v8 depthEnabled]) {
    uint64_t v13 = [(PUWallpaperPosterEditViewModel *)self settlingEffectEnabled] ^ 1;
  }
  else {
    uint64_t v13 = 0;
  }
  [v10 setIsDepthEnabled:v13];
  uint64_t v14 = [(PUWallpaperPosterEditViewModel *)self segmentationItem];
  id v15 = [v14 segmentationMatte];
  [v10 setIsDepthAvailable:v15 != 0];

  objc_msgSend(v10, "setIsLandscapeDepthEnabled:", objc_msgSend(v9, "depthEnabled"));
  objc_msgSend(v10, "setIsSettlingEffectEnabled:", -[PUWallpaperPosterEditViewModel settlingEffectEnabled](self, "settlingEffectEnabled"));
  uint64_t v16 = [(PUWallpaperPosterEditViewModel *)self segmentationItem];
  objc_msgSend(v10, "setIsSettlingEffectAvailable:", objc_msgSend(v16, "isSettlingEffectAvailable"));

  objc_msgSend(v10, "setIsPerspectiveZoomEnabled:", -[PUWallpaperPosterEditViewModel parallaxDisabled](self, "parallaxDisabled") ^ 1);
  uint64_t v17 = [v6 style];
  uint64_t v18 = [v17 bakedStyle];
  [v10 setStyle:v18];

  return v10;
}

- (void)applyChangesFromPosterEditConfiguration:(id)a3
{
  id v4 = a3;
  char v5 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
  uint64_t v6 = [v5 orientation];

  if (v6 == 2)
  {
    [v4 normalizedLandscapeVisibleFrame];
    uint64_t v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    char v15 = [v4 isLandscapeDepthEnabled];
  }
  else
  {
    [v4 normalizedVisibleFrame];
    uint64_t v8 = v16;
    uint64_t v10 = v17;
    uint64_t v12 = v18;
    uint64_t v14 = v19;
    char v15 = [v4 isDepthEnabled];
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74__PUWallpaperPosterEditViewModel_applyChangesFromPosterEditConfiguration___block_invoke;
  v21[3] = &unk_1E5F263C0;
  uint64_t v24 = v8;
  uint64_t v25 = v10;
  uint64_t v26 = v12;
  uint64_t v27 = v14;
  char v28 = v15;
  id v22 = v4;
  char v23 = self;
  id v20 = v4;
  [(PUWallpaperPosterEditViewModel *)self performChanges:v21];
}

void __74__PUWallpaperPosterEditViewModel_applyChangesFromPosterEditConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!CGRectIsEmpty(*(CGRect *)(a1 + 48))) {
    objc_msgSend(v3, "setNormalizedVisibleFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  [v3 setDepthEnabled:*(unsigned __int8 *)(a1 + 80)];
  if ([*(id *)(a1 + 32) isDepthEnabled])
  {
    id v4 = [*(id *)(a1 + 40) currentLayerStackViewModel];
    int v5 = [v4 clockAppearsAboveForeground];

    if (v5) {
      [v3 setDepthEnabled:0];
    }
  }
  objc_msgSend(v3, "setSettlingEffectEnabled:", objc_msgSend(*(id *)(a1 + 32), "isSettlingEffectEnabled"));
  objc_msgSend(v3, "setParallaxDisabled:", objc_msgSend(*(id *)(a1 + 32), "isPerspectiveZoomEnabled") ^ 1);
  uint64_t v6 = [*(id *)(a1 + 32) style];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 kind];
    uint64_t v9 = *MEMORY[0x1E4F8D030];
    v10[0] = v8;
    v10[1] = 0;
    v10[2] = v9;
    [v3 scrollToPosition:v10];
  }
}

- (id)_nextStyleKindForStyleKind:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(PUWallpaperPosterEditViewModel *)self currentStyleKinds];
  uint64_t v6 = [v5 indexOfObject:v4];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = PLWallpaperGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "styleKind %@ not found in availableStyleKinds", (uint8_t *)&v15, 0xCu);
    }

    id v8 = (id)*MEMORY[0x1E4F8D020];
  }
  else
  {
    uint64_t v9 = v6;
    unint64_t v10 = v6 + 1;
    uint64_t v11 = [v5 count];
    if (v10 < v11 - 1) {
      uint64_t v12 = v9 + 1;
    }
    else {
      uint64_t v12 = v11 - 1;
    }
    id v8 = [v5 objectAtIndexedSubscript:v12];
  }
  uint64_t v13 = v8;

  return v13;
}

- (id)_previousStyleKindForStyleKind:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(PUWallpaperPosterEditViewModel *)self currentStyleKinds];
  uint64_t v6 = [v5 indexOfObject:v4];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = PLWallpaperGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "styleKind %@ not found in availableStyleKinds", (uint8_t *)&v12, 0xCu);
    }

    id v8 = (id)*MEMORY[0x1E4F8D020];
  }
  else
  {
    if (v6 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v6;
    }
    id v8 = [v5 objectAtIndexedSubscript:v9 - 1];
  }
  unint64_t v10 = v8;

  return v10;
}

- (void)_updateCurrentStylesWithChange:(int64_t)a3
{
  uint64_t v6 = [(PUWallpaperPosterEditViewModel *)self availableLayerStackViewModels];
  uint64_t v7 = PXMap();

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int64_t v21 = a3;
  id v8 = [(PUWallpaperPosterEditViewModel *)self currentStyles];
  uint64_t v9 = (void *)[v8 copy];

  if (v9)
  {
    uint64_t v10 = [v9 count];
    if (v10 != [v7 count])
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PUWallpaperPosterEditViewModel.m" lineNumber:605 description:@"Diffing is only supported when number of styles does not change"];
    }
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __65__PUWallpaperPosterEditViewModel__updateCurrentStylesWithChange___block_invoke_2;
    int v15 = &unk_1E5F26398;
    id v16 = v7;
    uint64_t v17 = &v18;
    [v9 enumerateObjectsUsingBlock:&v12];
  }
  -[PUWallpaperPosterEditViewModel setStylesChange:](self, "setStylesChange:", v19[3], v12, v13, v14, v15);
  [(PUWallpaperPosterEditViewModel *)self setCurrentStyles:v7];

  _Block_object_dispose(&v18, 8);
}

void __65__PUWallpaperPosterEditViewModel__updateCurrentStylesWithChange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  int v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  uint64_t v6 = [v5 kind];
  uint64_t v7 = [v15 kind];
  int v8 = [v6 isEqualToString:v7];

  if (!v8)
  {
    uint64_t v14 = 2;
LABEL_8:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v14;
    goto LABEL_9;
  }
  uint64_t v9 = [v5 clockFont];
  uint64_t v10 = [v15 clockFont];
  if (([v9 isEqualToString:v10] & 1) == 0)
  {

    goto LABEL_7;
  }
  uint64_t v11 = [v5 clockColor];
  uint64_t v12 = [v15 clockColor];
  char v13 = [v11 isEqual:v12];

  if ((v13 & 1) == 0)
  {
LABEL_7:
    uint64_t v14 = 1;
    goto LABEL_8;
  }
LABEL_9:
}

uint64_t __65__PUWallpaperPosterEditViewModel__updateCurrentStylesWithChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 style];
}

- (void)setCurrentStyles:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  currentStyles = self->_currentStyles;
  self->_currentStyles = v4;

  [(PUWallpaperPosterEditViewModel *)self signalChange:512];
}

- (NSArray)currentStyleKinds
{
  id v2 = [(PUWallpaperPosterEditViewModel *)self currentStyles];
  id v3 = PXMap();

  return (NSArray *)v3;
}

uint64_t __51__PUWallpaperPosterEditViewModel_currentStyleKinds__block_invoke(uint64_t a1, void *a2)
{
  return [a2 kind];
}

- (void)updateSettlingEffectWithSegmentationItem:(id)a3 layerStack:(id)a4
{
  uint64_t v7 = (PISegmentationItem *)a3;
  id v8 = a4;
  if (self->_segmentationItem != v7)
  {
    objc_storeStrong((id *)&self->_segmentationItem, a3);
    uint64_t v9 = [(PUWallpaperPosterEditViewModel *)self originalLayerStackViewModel];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __86__PUWallpaperPosterEditViewModel_updateSettlingEffectWithSegmentationItem_layerStack___block_invoke;
    char v13 = &unk_1E5F26350;
    uint64_t v14 = v7;
    id v15 = v8;
    [v9 performChanges:&v10];

    -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 0x10000, v10, v11, v12, v13);
  }
}

uint64_t __86__PUWallpaperPosterEditViewModel_updateSettlingEffectWithSegmentationItem_layerStack___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateSettlingEffectWithSegmentationItem:*(void *)(a1 + 32) layerStack:*(void *)(a1 + 40)];
}

- (PUParallaxLayerStackViewModel)originalLayerStackViewModel
{
  return (PUParallaxLayerStackViewModel *)[(PUWallpaperPosterEditViewModel *)self _layerStackViewModelForStyleKind:*MEMORY[0x1E4F8D020]];
}

- (void)setPresentingSingleStyle:(BOOL)a3
{
  if (self->_presentingSingleStyle != a3)
  {
    self->_presentingSingleStyle = a3;
    [(PUWallpaperPosterEditViewModel *)self signalChange:64];
  }
}

- (void)setSettlingEffectStateRestorationLayerStyleKind:(id)a3
{
  int v5 = (NSString *)a3;
  if (self->_settlingEffectStateRestorationLayerStyleKind != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_settlingEffectStateRestorationLayerStyleKind, a3);
    int v5 = v6;
  }
}

- (void)setParallaxDisabled:(BOOL)a3
{
  if (self->_parallaxDisabled != a3)
  {
    self->_parallaxDisabled = a3;
    [(PUWallpaperPosterEditViewModel *)self _invalidateAvailableLayerStackViewModelsProperties];
    [(PUWallpaperPosterEditViewModel *)self signalChange:32];
  }
}

- (void)setHeadroomEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PUWallpaperPosterEditViewModel *)self isUsingHeadroom] != a3)
  {
    self->_headroomEnabled = v3;
    id v34 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
    uint64_t v5 = [v34 orientation];
    uint64_t v6 = [v34 segmentationItem];
    if ([(PUWallpaperPosterEditViewModel *)self isUsingHeadroom]) {
      [v6 originalLayout];
    }
    else {
    uint64_t v7 = [v6 headroomLayout];
    }
    id v8 = v7;
    if (v5 == 2) {
      [v7 landscapeLayout];
    }
    else {
    uint64_t v9 = [v7 portraitLayout];
    }
    [v9 visibleFrame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [v9 imageSize];
    double v20 = 0.0;
    double v21 = 0.0;
    if (v18 != 0.0)
    {
      double v11 = v11 / v18;
      double v21 = v15 / v18;
    }
    if (v19 != 0.0)
    {
      double v13 = v13 / v19;
      double v20 = v17 / v19;
    }
    double v22 = *(double *)(MEMORY[0x1E4F8A248] + 8) + *(double *)(MEMORY[0x1E4F8A248] + 24) - (v20 + v13);
    [v34 normalizedVisibleFrame];
    char v23 = PXRectApproximatelyEqualToRect();
    uint64_t v24 = [v6 headroomLayout];

    int v25 = [v9 isUsingHeadroom];
    if (v3)
    {
      if (v24) {
        char v26 = v23;
      }
      else {
        char v26 = 1;
      }
      if ((v26 & 1) != 0 || v25 != 1)
      {
        [v34 normalizedVisibleFrame];
        PXSizeGetAspectRatio();
        double v27 = 1.0 - *MEMORY[0x1E4F8D150];
        PXRectWithAspectRatioFittingRect();
        double x = v36.origin.x;
        double y = v36.origin.y;
        double width = v36.size.width;
        double height = v36.size.height;
        BOOL v32 = CGRectGetMinY(v36) < 0.0;
        double v33 = v27 * 0.25;
        double v11 = x;
        if (v32) {
          double v22 = v33;
        }
        else {
          double v22 = y;
        }
        double v21 = width;
        double v20 = height;
      }
      -[PUWallpaperPosterEditViewModel setNormalizedVisibleFrameAnimated:](self, "setNormalizedVisibleFrameAnimated:", v11, v22, v21, v20);
      [(PUWallpaperPosterEditViewModel *)self setSettlingEffectEnabled:0];
      [(PUWallpaperPosterEditViewModel *)self setDepthEnabled:1];
    }
    else
    {
      -[PUWallpaperPosterEditViewModel setNormalizedVisibleFrameAnimated:](self, "setNormalizedVisibleFrameAnimated:", v11, v22, v21, v20);
    }
    [(PUWallpaperPosterEditViewModel *)self signalChange:0x2000];
  }
}

- (void)setSettlingEffectEnabled:(BOOL)a3
{
  if (self->_settlingEffectEnabled != a3)
  {
    self->_settlingEffectEnabled = a3;
    [(PUWallpaperPosterEditViewModel *)self _invalidateAvailableLayerStackViewModelsProperties];
    [(PUWallpaperPosterEditViewModel *)self signalChange:1024];
  }
}

- (void)setAppliesDepthToAllOrientations:(BOOL)a3
{
  if (self->_appliesDepthToAllOrientations != a3)
  {
    self->_appliesDepthToAllOrientations = a3;
    [(PUWallpaperPosterEditViewModel *)self _invalidateAvailableLayerStackViewModelsProperties];
    [(PUWallpaperPosterEditViewModel *)self signalChange:2048];
  }
}

- (void)setDepthEnabled:(BOOL)a3
{
  if (self->_depthEnabled != a3)
  {
    self->_depthEnabled = a3;
    [(PUWallpaperPosterEditViewModel *)self _invalidateAvailableLayerStackViewModelsProperties];
    [(PUWallpaperPosterEditViewModel *)self _invalidateDepthEnabled];
    [(PUWallpaperPosterEditViewModel *)self signalChange:128];
  }
}

- (void)setContainerFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_containerFrame = &self->_containerFrame;
  if ((PXRectApproximatelyEqualToRect() & 1) == 0)
  {
    p_containerFrame->origin.CGFloat x = x;
    p_containerFrame->origin.CGFloat y = y;
    p_containerFrame->size.CGFloat width = width;
    p_containerFrame->size.CGFloat height = height;
    [(PUWallpaperPosterEditViewModel *)self _invalidateAvailableLayerStackViewModelsContainerGeometry];
    [(PUWallpaperPosterEditViewModel *)self signalChange:16];
  }
}

- (BOOL)applySettlingEffectVisibleFrameRestoration
{
  BOOL v3 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
  uint64_t v4 = [v3 orientation];
  uint64_t v5 = [v3 compoundLayerStack];
  uint64_t v6 = [v5 landscapeLayerStack];

  if (v4 == 2) {
    [(PUWallpaperPosterEditViewModel *)self settlingEffectStateRestorationLandscapeNormalizedVisibleFrame];
  }
  else {
    [(PUWallpaperPosterEditViewModel *)self settlingEffectStateRestorationPortraitNormalizedVisibleFrame];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  IsEmptCGFloat y = CGRectIsEmpty(*(CGRect *)&v7);
  if (!IsEmpty) {
    -[PUWallpaperPosterEditViewModel setNormalizedVisibleFrameAnimated:](self, "setNormalizedVisibleFrameAnimated:", v11, v12, v13, v14);
  }
  if (v6)
  {
    if (v4 == 2) {
      [(PUWallpaperPosterEditViewModel *)self settlingEffectStateRestorationPortraitNormalizedVisibleFrame];
    }
    else {
      [(PUWallpaperPosterEditViewModel *)self settlingEffectStateRestorationLandscapeNormalizedVisibleFrame];
    }
    uint64_t v20 = v16;
    uint64_t v21 = v17;
    uint64_t v22 = v18;
    uint64_t v23 = v19;
    if (!CGRectIsEmpty(*(CGRect *)&v16))
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __76__PUWallpaperPosterEditViewModel_applySettlingEffectVisibleFrameRestoration__block_invoke;
      v25[3] = &__block_descriptor_64_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
      v25[4] = v20;
      v25[5] = v21;
      v25[6] = v22;
      v25[7] = v23;
      [v3 performChanges:v25];
    }
  }

  return !IsEmpty;
}

uint64_t __76__PUWallpaperPosterEditViewModel_applySettlingEffectVisibleFrameRestoration__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setNormalizedVisibleFrameForInactiveOrientation:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)userDidAdjustVisibleFrame
{
  [(PUWallpaperPosterEditViewModel *)self setSettlingEffectStateRestorationLayerStyleKind:*MEMORY[0x1E4F8D020]];
  BOOL v3 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
  uint64_t v4 = [v3 orientation];

  if (v4 == 2)
  {
    [(PUWallpaperPosterEditViewModel *)self setUserHasAdjustedLandscapeVisibleFrame:1];
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    -[PUWallpaperPosterEditViewModel setSettlingEffectStateRestorationLandscapeNormalizedVisibleFrame:](self, "setSettlingEffectStateRestorationLandscapeNormalizedVisibleFrame:", v9, v10, v11, v12);
  }
  else if (v4 == 1)
  {
    [(PUWallpaperPosterEditViewModel *)self setUserHasAdjustedPortraitVisibleFrame:1];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    -[PUWallpaperPosterEditViewModel setSettlingEffectStateRestorationPortraitNormalizedVisibleFrame:](self, "setSettlingEffectStateRestorationPortraitNormalizedVisibleFrame:", v5, v6, v7, v8);
  }
}

- (void)reframeToSettlingEffectBoundsIfNeeded
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PUWallpaperPosterEditViewModel_reframeToSettlingEffectBoundsIfNeeded__block_invoke;
  aBlock[3] = &unk_1E5F26328;
  aBlock[4] = self;
  BOOL v3 = _Block_copy(aBlock);
  uint64_t v4 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
  uint64_t v5 = [v4 orientation];
  double v6 = [v4 compoundLayerStack];
  double v7 = [v6 landscapeLayerStack];
  uint64_t v8 = [v6 portraitLayerStack];
  double v9 = (void *)v8;
  if (v5 == 2) {
    double v10 = v7;
  }
  else {
    double v10 = (void *)v8;
  }
  if (v5 == 2) {
    double v11 = (void *)v8;
  }
  else {
    double v11 = v7;
  }
  id v12 = v10;
  id v76 = v11;
  double v13 = [v4 segmentationItem];
  double v14 = [v13 settlingEffectLayout];

  v74 = v6;
  v75 = v12;
  if (!v14)
  {
    v44 = (uint64_t (**)(void, void))v3;
    v45 = PLWallpaperGetLog();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v45, OS_LOG_TYPE_ERROR, "Settling effect layout missing, reframe failed", buf, 2u);
    }

    goto LABEL_54;
  }
  double v15 = [v14 portraitLayout];
  [v15 visibleFrame];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  uint64_t v24 = [v14 landscapeLayout];
  [v24 visibleFrame];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  if (v5 == 2) {
    double v33 = v32;
  }
  else {
    double v33 = v23;
  }
  if (v5 == 2) {
    double v34 = v30;
  }
  else {
    double v34 = v21;
  }
  double v70 = v34;
  double v71 = v33;
  if (v5 == 2) {
    double v35 = v28;
  }
  else {
    double v35 = v19;
  }
  if (v5 == 2) {
    double v36 = v26;
  }
  else {
    double v36 = v17;
  }
  double v72 = v35;
  double v73 = v36;
  if (v5 == 2) {
    double v37 = v23;
  }
  else {
    double v37 = v32;
  }
  double v69 = v37;
  if (v5 == 2)
  {
    double v30 = v21;
    double v28 = v19;
    double v38 = v17;
  }
  else
  {
    double v38 = v26;
  }
  int v39 = (*((uint64_t (**)(void *, id))v3 + 2))(v3, v12);
  if (v39)
  {
    [(PUWallpaperPosterEditViewModel *)self normalizedVisibleFrame];
  }
  else
  {
    double v40 = *MEMORY[0x1E4F1DB28];
    double v41 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v42 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v43 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  if (v5 == 2)
  {
    -[PUWallpaperPosterEditViewModel setSettlingEffectStateRestorationLandscapeNormalizedVisibleFrame:](self, "setSettlingEffectStateRestorationLandscapeNormalizedVisibleFrame:", v40, v41, v42, v43);
    if (!v39) {
      goto LABEL_41;
    }
  }
  else
  {
    -[PUWallpaperPosterEditViewModel setSettlingEffectStateRestorationPortraitNormalizedVisibleFrame:](self, "setSettlingEffectStateRestorationPortraitNormalizedVisibleFrame:", v40, v41, v42, v43);
    if (!v39) {
      goto LABEL_41;
    }
  }
  [v4 imageSize];
  double v48 = 0.0;
  double v49 = 0.0;
  double v50 = v73;
  if (v46 != 0.0)
  {
    double v50 = v73 / v46;
    double v49 = v70 / v46;
  }
  double v51 = v72;
  if (v47 != 0.0)
  {
    double v51 = v72 / v47;
    double v48 = v71 / v47;
  }
  -[PUWallpaperPosterEditViewModel setNormalizedVisibleFrameAnimated:](self, "setNormalizedVisibleFrameAnimated:", v50, *(double *)(MEMORY[0x1E4F8A248] + 8) + *(double *)(MEMORY[0x1E4F8A248] + 24) - (v48 + v51), v49);
LABEL_41:
  v44 = (uint64_t (**)(void, void))v3;
  v52 = v76;
  if (v76)
  {
    int v53 = ((uint64_t (**)(void, id))v44)[2](v44, v76);
    if (v53)
    {
      v54 = [v76 layout];
      [v54 normalizedVisibleFrame];
      PXRectFlippedVertically();
      double v56 = v55;
      double v58 = v57;
      double v60 = v59;
      double v62 = v61;
    }
    else
    {
      double v56 = *MEMORY[0x1E4F1DB28];
      double v58 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v60 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v62 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    if (v5 == 2) {
      -[PUWallpaperPosterEditViewModel setSettlingEffectStateRestorationPortraitNormalizedVisibleFrame:](self, "setSettlingEffectStateRestorationPortraitNormalizedVisibleFrame:", v56, v58, v60, v62);
    }
    else {
      -[PUWallpaperPosterEditViewModel setSettlingEffectStateRestorationLandscapeNormalizedVisibleFrame:](self, "setSettlingEffectStateRestorationLandscapeNormalizedVisibleFrame:", v56, v58, v60, v62);
    }
    v52 = v76;
    if (v53)
    {
      v63 = [v76 layout];
      [v63 imageSize];
      double v66 = 0.0;
      double v67 = 0.0;
      if (v64 != 0.0)
      {
        double v38 = v38 / v64;
        double v67 = v30 / v64;
      }
      if (v65 != 0.0)
      {
        double v28 = v28 / v65;
        double v66 = v69 / v65;
      }

      double v68 = *(double *)(MEMORY[0x1E4F8A248] + 8) + *(double *)(MEMORY[0x1E4F8A248] + 24) - (v66 + v28);
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __71__PUWallpaperPosterEditViewModel_reframeToSettlingEffectBoundsIfNeeded__block_invoke_56;
      v77[3] = &__block_descriptor_64_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
      *(double *)&v77[4] = v38;
      *(double *)&v77[5] = v68;
      *(double *)&v77[6] = v67;
      *(double *)&v77[7] = v66;
      [v4 performChanges:v77];
LABEL_54:
      v52 = v76;
    }
  }
}

BOOL __71__PUWallpaperPosterEditViewModel_reframeToSettlingEffectBoundsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 layout];
  uint64_t v5 = [v4 orientation];

  if (v5 != 2)
  {
    if (v5 == 1 && ([*(id *)(a1 + 32) userHasAdjustedPortraitVisibleFrame] & 1) == 0) {
      goto LABEL_4;
    }
LABEL_6:
    double v7 = [*(id *)(a1 + 32) currentLayerStackViewModel];
    uint64_t v8 = [v7 segmentationItem];
    [v8 settlingEffectNormalizedBounds];

    double v9 = [v3 layout];
    [v9 imageSize];
    PXRectWithSize();

    PXRectFlippedVertically();
    double v10 = [v3 layout];
    [v10 visibleFrame];

    NUPixelRectFromCGRect();
    NUPixelRectFromCGRect();
    NUPixelRectToCGRect();
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    NUPixelRectToCGRect();
    v25.origin.CGFloat x = v19;
    v25.origin.CGFloat y = v20;
    v25.size.CGFloat width = v21;
    v25.size.CGFloat height = v22;
    v24.origin.CGFloat x = v12;
    v24.origin.CGFloat y = v14;
    v24.size.CGFloat width = v16;
    v24.size.CGFloat height = v18;
    BOOL v6 = !CGRectContainsRect(v24, v25);
    goto LABEL_7;
  }
  if ([*(id *)(a1 + 32) userHasAdjustedLandscapeVisibleFrame]) {
    goto LABEL_6;
  }
LABEL_4:
  BOOL v6 = 1;
LABEL_7:

  return v6;
}

uint64_t __71__PUWallpaperPosterEditViewModel_reframeToSettlingEffectBoundsIfNeeded__block_invoke_56(double *a1, void *a2)
{
  return objc_msgSend(a2, "setNormalizedVisibleFrameForInactiveOrientation:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)setNormalizedVisibleFrameAnimated:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_normalizedVisibleFrame = &self->_normalizedVisibleFrame;
  if ((PXRectApproximatelyEqualToRect() & 1) == 0)
  {
    p_normalizedVisibleFrame->origin.CGFloat x = x;
    p_normalizedVisibleFrame->origin.CGFloat y = y;
    p_normalizedVisibleFrame->size.CGFloat width = width;
    p_normalizedVisibleFrame->size.CGFloat height = height;
    [(PUWallpaperPosterEditViewModel *)self _invalidateVisibleFrameCrossesHeadroomBoundary];
    [(PUWallpaperPosterEditViewModel *)self signalChange:8];
    double v9 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__PUWallpaperPosterEditViewModel_setNormalizedVisibleFrameAnimated___block_invoke;
    void v10[3] = &__block_descriptor_64_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
    *(CGFloat *)&v10[4] = x;
    *(CGFloat *)&void v10[5] = y;
    *(CGFloat *)&v10[6] = width;
    *(CGFloat *)&v10[7] = height;
    [v9 performChanges:v10];
  }
}

uint64_t __68__PUWallpaperPosterEditViewModel_setNormalizedVisibleFrameAnimated___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setNormalizedVisibleFrame:animated:", 1, a1[4], a1[5], a1[6], a1[7]);
}

- (void)setNormalizedVisibleFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_normalizedVisibleFrame = &self->_normalizedVisibleFrame;
  if ((PXRectApproximatelyEqualToRect() & 1) == 0)
  {
    p_normalizedVisibleFrame->origin.CGFloat x = x;
    p_normalizedVisibleFrame->origin.CGFloat y = y;
    p_normalizedVisibleFrame->size.CGFloat width = width;
    p_normalizedVisibleFrame->size.CGFloat height = height;
    [(PUWallpaperPosterEditViewModel *)self _invalidateNormalizedVisibleFrame];
    [(PUWallpaperPosterEditViewModel *)self _invalidateVisibleFrameCrossesHeadroomBoundary];
    [(PUWallpaperPosterEditViewModel *)self signalChange:8];
  }
}

- (void)setActiveLayerStackViewModels:(id)a3
{
  double v9 = (NSSet *)a3;
  uint64_t v4 = self->_activeLayerStackViewModels;
  activeLayerStackViewModels = v9;
  if (v4 != v9)
  {
    BOOL v6 = v4;
    char v7 = [(NSSet *)v4 isEqual:v9];

    if (v7) {
      goto LABEL_5;
    }
    uint64_t v8 = (NSSet *)[(NSSet *)v9 copy];
    activeLayerStackViewModels = self->_activeLayerStackViewModels;
    self->_activeLayerStackViewModels = v8;
  }

LABEL_5:
}

- (void)setVisibleLayerStackViewModels:(id)a3
{
  uint64_t v8 = (NSArray *)a3;
  uint64_t v4 = self->_visibleLayerStackViewModels;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSArray *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      [(NSArray *)self->_visibleLayerStackViewModels enumerateObjectsUsingBlock:&__block_literal_global_52_36785];
      BOOL v6 = (NSArray *)[(NSArray *)v8 copy];
      visibleLayerStackViewModels = self->_visibleLayerStackViewModels;
      self->_visibleLayerStackViewModels = v6;

      [(PUWallpaperPosterEditViewModel *)self signalChange:4];
    }
  }
}

uint64_t __65__PUWallpaperPosterEditViewModel_setVisibleLayerStackViewModels___block_invoke(uint64_t a1, void *a2)
{
  return [a2 performChanges:&__block_literal_global_54];
}

uint64_t __65__PUWallpaperPosterEditViewModel_setVisibleLayerStackViewModels___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setLayoutOrder:0];
}

- (void)scrollToPosition:(id *)a3
{
  p_scrollPosition = &self->_scrollPosition;
  firstStyle = self->_scrollPosition.firstStyle;
  if (firstStyle != a3->var0
    || (self->_scrollPosition.secondStyleMixFactor == a3->var1 ? (BOOL v7 = firstStyle == a3->var2) : (BOOL v7 = 0), !v7))
  {
    id v13 = [(PUWallpaperPosterEditViewModel *)self currentStyleKinds];
    id v8 = a3->var0;
    id v9 = a3->var2;
    if (v9)
    {
      uint64_t v10 = [v13 indexOfObject:v8];
      if ([v13 indexOfObject:v9] < v10)
      {
        double v11 = 1.0 - a3->var1;
        a3->var0 = v9;
        a3->var1 = v11;
        a3->var2 = v8;
      }
    }
    long long v12 = *(_OWORD *)&a3->var0;
    p_scrollPosition->secondStyle = (NSString *)a3->var2;
    *(_OWORD *)&p_scrollPosition->firstStyle = v12;
    [(PUWallpaperPosterEditViewModel *)self signalChange:256];
    [(PUWallpaperPosterEditViewModel *)self _invalidateActiveLayerStackViewModels];
    [(PUWallpaperPosterEditViewModel *)self _invalidateVisibleLayerStackViewModels];
    [(PUWallpaperPosterEditViewModel *)self _invalidateCurrentLayerStackViewModel];
    [(PUWallpaperPosterEditViewModel *)self _invalidatePresentingSingleStyle];
  }
}

- (void)setIsUserPanningOrZooming:(BOOL)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_isUserPanningOrZooming != a3)
  {
    self->_isUserPanningOrZooming = a3;
    [(PUWallpaperPosterEditViewModel *)self _invalidateVisibleFrameCrossesHeadroomBoundary];
    [(PUWallpaperPosterEditViewModel *)self signalChange:2];
    if (!self->_isUserPanningOrZooming)
    {
      uint64_t v4 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      char v5 = [(PUWallpaperPosterEditViewModel *)self layerStackViewModelsByStyleKind];
      BOOL v6 = [v5 allValues];

      id obj = v6;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v19 != v9) {
              objc_enumerationMutation(obj);
            }
            double v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if (v11 != v4)
            {
              v17[0] = MEMORY[0x1E4F143A8];
              v17[1] = 3221225472;
              v17[2] = __60__PUWallpaperPosterEditViewModel_setIsUserPanningOrZooming___block_invoke;
              v17[3] = &unk_1E5F2E420;
              void v17[4] = self;
              [v11 performChanges:v17];
              long long v12 = [(PUWallpaperPosterEditViewModel *)self viewModelUpdatersByStyleKind];
              id v13 = [v11 style];
              CGFloat v14 = [v13 kind];
              double v15 = [v12 objectForKeyedSubscript:v14];

              objc_msgSend(v15, "renderOffscreenModelAfterVisibleFrameChange:highPriority:", v11, -[NSSet containsObject:](self->_activeLayerStackViewModels, "containsObject:", v11));
            }
          }
          uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v8);
      }
    }
  }
}

void __60__PUWallpaperPosterEditViewModel_setIsUserPanningOrZooming___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 normalizedVisibleFrame];
  objc_msgSend(v3, "setNormalizedVisibleFrame:");
}

- (void)setDeviceOrientation:(int64_t)a3
{
  if (self->_deviceOrientation != a3)
  {
    self->_deviceOrientation = a3;
    [(PUWallpaperPosterEditViewModel *)self _updateAvailableLayerStackViewModelsContainerGeometry];
  }
}

- (id)availableLayerStackViewModels
{
  id v2 = [(PUWallpaperPosterEditViewModel *)self currentStyleKinds];
  id v3 = PXMap();

  return v3;
}

uint64_t __63__PUWallpaperPosterEditViewModel_availableLayerStackViewModels__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _layerStackViewModelForStyleKind:a2];
}

- (void)setCurrentLayerStackViewModel:(id)a3
{
  uint64_t v8 = (PUParallaxLayerStackViewModel *)a3;
  char v5 = self->_currentLayerStackViewModel;
  if (v5 == v8)
  {
  }
  else
  {
    BOOL v6 = v5;
    char v7 = [(PUParallaxLayerStackViewModel *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentLayerStackViewModel, a3);
      [(PUWallpaperPosterEditViewModel *)self signalChange:1];
    }
  }
}

- (BOOL)headroomLayoutUsesHeadroomArea
{
  id v2 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
  char v3 = [v2 headroomLayoutUsesHeadroomArea];

  return v3;
}

- (BOOL)canApplyHeadroom
{
  id v2 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
  char v3 = [v2 canApplyHeadroom];

  return v3;
}

- (PUParallaxLayerStackViewModelUpdater)currentLayerStackViewModelUpdater
{
  viewModelUpdatersByStyleKind = self->_viewModelUpdatersByStyleKind;
  char v3 = [(PUWallpaperPosterEditViewModel *)self currentLayerStackViewModel];
  uint64_t v4 = [v3 style];
  char v5 = [v4 kind];
  BOOL v6 = [(NSMutableDictionary *)viewModelUpdatersByStyleKind objectForKeyedSubscript:v5];

  return (PUParallaxLayerStackViewModelUpdater *)v6;
}

- (void)shutdownWithTimeout:(double)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  char v5 = [MEMORY[0x1E4F1C9C8] now];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v6 = [(PUWallpaperPosterEditViewModel *)self viewModelUpdatersByStyleKind];
  char v7 = [v6 allValues];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * i) cancelPendingRenders];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v9);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v12 = [(PUWallpaperPosterEditViewModel *)self viewModelUpdatersByStyleKind];
  id v13 = [v12 allValues];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    while (2)
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        if (([*(id *)(*((void *)&v22 + 1) + 8 * j) waitForInFlightRenders:a3] & 1) == 0)
        {
          long long v18 = PLWallpaperGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_FAULT, "Timed out waiting for in flight renders", buf, 2u);
          }

          goto LABEL_20;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v32 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_20:

  long long v19 = [MEMORY[0x1E4F1C9C8] now];
  long long v20 = PLWallpaperGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    [v19 timeIntervalSinceDate:v5];
    *(_DWORD *)buf = 134217984;
    uint64_t v31 = v21;
    _os_log_impl(&dword_1AE9F8000, v20, OS_LOG_TYPE_INFO, "Editor canceled render requests in %0.3f s", buf, 0xCu);
  }
}

- (double)currentClockAreaLuminanceForStyleKind:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = *MEMORY[0x1E4F8CFC8];
  BOOL v6 = [(NSMutableDictionary *)self->_layerStackViewModelsByStyleKind objectForKeyedSubscript:v4];
  char v7 = [v6 currentLayerStack];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 clockAreaLuminance];
    double v10 = v9;
    if (v9 != v5) {
      goto LABEL_9;
    }
    double v11 = PLWallpaperGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v4;
      long long v12 = "LuminanceForLook: Layer stack for look \"%@\" has unknown clockAreaLuminance";
LABEL_7:
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    double v11 = PLWallpaperGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v4;
      long long v12 = "LuminanceForLook: Can't find layer stack for look \"%@\"";
      goto LABEL_7;
    }
  }

  double v10 = v5;
LABEL_9:
  id v13 = PLWallpaperGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138412802;
    id v16 = v4;
    __int16 v17 = 2048;
    double v18 = v10;
    __int16 v19 = 2112;
    long long v20 = v6;
    _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_DEBUG, "LuminanceForLook: luminance for %@ is %.2f, viewModel %@", (uint8_t *)&v15, 0x20u);
  }

  return v10;
}

- (void)_setNeedsUpdate
{
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PUWallpaperPosterEditViewModel;
  [(PUWallpaperPosterEditViewModel *)&v4 didPerformChanges];
  char v3 = [(PUWallpaperPosterEditViewModel *)self updater];
  [v3 updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUWallpaperPosterEditViewModel;
  [(PUWallpaperPosterEditViewModel *)&v3 performChanges:a3];
}

- (PUWallpaperPosterEditViewModel)init
{
  objc_super v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUWallpaperPosterEditViewModel.m", 155, @"%s is not available as initializer", "-[PUWallpaperPosterEditViewModel init]");

  abort();
}

- (void)_initScrollPositionWithViewModel:(id)a3
{
  objc_super v4 = [a3 style];
  uint64_t v5 = [v4 kind];
  BOOL v6 = (void *)v5;
  char v7 = (void *)*MEMORY[0x1E4F8D020];
  if (v5) {
    char v7 = (void *)v5;
  }
  id v8 = v7;

  p_scrollPosition = &self->_scrollPosition;
  double v10 = (NSString *)*MEMORY[0x1E4F8D030];

  p_scrollPosition->firstStyle = (NSString *)v8;
  p_scrollPosition->secondStyleMixFactor = 0.0;
  p_scrollPosition->secondStyle = v10;
}

- (void)_createViewModelsWithInitialViewModel:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [[PUParallaxLayerStackViewModelUpdater alloc] initWithSegmentationItem:self->_segmentationItem];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [(PUWallpaperPosterEditViewModel *)self availableStyles];
  uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    long long v26 = v31;
    do
    {
      uint64_t v9 = 0;
      uint64_t v27 = v7;
      do
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        double v10 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v9), "kind", v26);
        double v11 = [v4 style];
        long long v12 = [v11 kind];
        unsigned int v13 = [v10 isEqualToString:v12];

        unsigned int v29 = v13;
        if (v13)
        {
          id v14 = v4;
          int v15 = v5;
        }
        else
        {
          id v14 = (id)[v4 copy];
          int v15 = (PUParallaxLayerStackViewModelUpdater *)[(PUParallaxLayerStackViewModelUpdater *)v5 copy];
          id v16 = (void *)MEMORY[0x1E4F8A340];
          [(PISegmentationItem *)self->_segmentationItem defaultStyleOfKind:v10];
          __int16 v17 = self;
          id v18 = v4;
          uint64_t v19 = v8;
          uint64_t v21 = v20 = v5;
          long long v22 = [v16 styleWithBakedStyle:v21];

          uint64_t v5 = v20;
          uint64_t v8 = v19;
          id v4 = v18;
          self = v17;
          uint64_t v7 = v27;
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v31[0] = __72__PUWallpaperPosterEditViewModel__createViewModelsWithInitialViewModel___block_invoke;
          v31[1] = &unk_1E5F2E420;
          id v32 = v22;
          id v23 = v22;
          [v14 performChanges:v30];
        }
        long long v24 = [(PUWallpaperPosterEditViewModel *)self layerStackViewModelsByStyleKind];
        [v24 setObject:v14 forKeyedSubscript:v10];

        long long v25 = [(PUWallpaperPosterEditViewModel *)self viewModelUpdatersByStyleKind];
        [v25 setObject:v15 forKeyedSubscript:v10];

        [(PUParallaxLayerStackViewModelUpdater *)v15 renderModelAfterStyleInitialization:v14 isOnscreen:v29];
        [v14 registerChangeObserver:self context:"LayerStackViewModelObservationContext"];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v7);
  }
}

uint64_t __72__PUWallpaperPosterEditViewModel__createViewModelsWithInitialViewModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStyle:*(void *)(a1 + 32)];
}

- (PUWallpaperPosterEditViewModel)initWithInitialLayerStackViewModel:(id)a3 availableStyles:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)PUWallpaperPosterEditViewModel;
  uint64_t v9 = [(PUWallpaperPosterEditViewModel *)&v43 init];
  if (v9)
  {
    uint64_t v10 = [v7 segmentationItem];
    segmentationItem = v9->_segmentationItem;
    v9->_segmentationItem = (PISegmentationItem *)v10;

    v9->_deviceOrientation = [v7 deviceOrientation];
    long long v12 = [v7 style];
    unsigned int v13 = v12;
    if (v12)
    {
      uint64_t v38 = MEMORY[0x1E4F143A8];
      uint64_t v39 = 3221225472;
      double v40 = __85__PUWallpaperPosterEditViewModel_initWithInitialLayerStackViewModel_availableStyles___block_invoke;
      double v41 = &unk_1E5F27D98;
      id v4 = &v42;
      id v42 = v12;
      char v14 = PXExists();
    }
    else
    {
      char v14 = 1;
    }
    uint64_t v15 = [v8 copy];
    availableStyles = v9->_availableStyles;
    v9->_availableStyles = (NSArray *)v15;

    if ((v14 & 1) == 0)
    {
      __int16 v17 = v9->_availableStyles;
      id v18 = [v13 bakedStyle];
      uint64_t v19 = [(NSArray *)v17 arrayByAddingObject:v18];
      long long v20 = v9->_availableStyles;
      v9->_availableStyles = (NSArray *)v19;
    }
    uint64_t v21 = PXMap();
    currentStyles = v9->_currentStyles;
    v9->_currentStyles = (NSArray *)v21;

    [v7 normalizedVisibleFrame];
    v9->_normalizedVisibleFrame.origin.CGFloat x = v23;
    v9->_normalizedVisibleFrame.origin.CGFloat y = v24;
    v9->_normalizedVisibleFrame.size.CGFloat width = v25;
    v9->_normalizedVisibleFrame.size.CGFloat height = v26;
    v9->_depthEnabled = [v7 depthEnabled];
    v9->_parallaxDisabled = [v7 parallaxDisabled];
    v9->_settlingEffectEnabled = [v7 settlingEffectEnabled];
    [(PUWallpaperPosterEditViewModel *)v9 _initScrollPositionWithViewModel:v7];
    uint64_t v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    layerStackViewModelsByStyleKind = v9->_layerStackViewModelsByStyleKind;
    v9->_layerStackViewModelsByStyleKind = v27;

    unsigned int v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    viewModelUpdatersByStyleKind = v9->_viewModelUpdatersByStyleKind;
    v9->_viewModelUpdatersByStyleKind = v29;

    [(PUWallpaperPosterEditViewModel *)v9 _createViewModelsWithInitialViewModel:v7];
    uint64_t v31 = (PXNumberAnimator *)objc_alloc_init(MEMORY[0x1E4F912A8]);
    headroomVisibilityAmountAnimator = v9->_headroomVisibilityAmountAnimator;
    v9->_headroomVisibilityAmountAnimator = v31;

    [(PXNumberAnimator *)v9->_headroomVisibilityAmountAnimator registerChangeObserver:v9 context:"HeadroomVisibilityAmountAnimatorObservationContext"];
    uint64_t v33 = [objc_alloc(MEMORY[0x1E4F912F8]) initWithTarget:v9 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v9->_updater;
    v9->_updater = (PXUpdater *)v33;

    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updateActiveLayerStackViewModels];
    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updateCurrentStyles];
    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updateVisibleLayerStackViewModels];
    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updatePresentingSingleStyle];
    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updateCurrentLayerStackViewModel];
    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updateAvailableLayerStackViewModelsContainerGeometry];
    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updatePropertiesFromCurrentLayerStackViewModel];
    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updateAvailableLayerStackViewModelsProperties];
    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updateNormalizedVisibleFrame];
    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updateDepthEnabled];
    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updateVisibleFrameCrossesHeadroomBoundary];
    [(PXUpdater *)v9->_updater addUpdateSelector:sel__updateDesiredHeadroomVisibilityAmount];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __85__PUWallpaperPosterEditViewModel_initWithInitialLayerStackViewModel_availableStyles___block_invoke_3;
    v36[3] = &unk_1E5F26688;
    double v37 = v9;
    [(PUWallpaperPosterEditViewModel *)v37 performChanges:v36];

    if (v13) {
  }
    }

  return v9;
}

uint64_t __85__PUWallpaperPosterEditViewModel_initWithInitialLayerStackViewModel_availableStyles___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = [a2 kind];
  id v4 = [*(id *)(a1 + 32) kind];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

uint64_t __85__PUWallpaperPosterEditViewModel_initWithInitialLayerStackViewModel_availableStyles___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateActiveLayerStackViewModels];
  [*(id *)(a1 + 32) _invalidateCurrentStyles];
  [*(id *)(a1 + 32) _invalidateVisibleLayerStackViewModels];
  [*(id *)(a1 + 32) _invalidatePresentingSingleStyle];
  [*(id *)(a1 + 32) _invalidateCurrentLayerStackViewModel];
  [*(id *)(a1 + 32) _invalidateAvailableLayerStackViewModelsProperties];
  id v2 = *(void **)(a1 + 32);
  return [v2 _invalidateVisibleFrameCrossesHeadroomBoundary];
}

uint64_t __85__PUWallpaperPosterEditViewModel_initWithInitialLayerStackViewModel_availableStyles___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F8A340] styleWithBakedStyle:a2];
}

@end