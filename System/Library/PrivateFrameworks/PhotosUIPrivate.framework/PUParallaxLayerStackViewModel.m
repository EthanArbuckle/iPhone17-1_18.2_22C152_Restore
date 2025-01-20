@interface PUParallaxLayerStackViewModel
+ (unint64_t)_changeDescriptorBetweenOldStyle:(id)a3 newStyle:(id)a4;
- (BOOL)appliesDepthToAllOrientations;
- (BOOL)canApplyHeadroom;
- (BOOL)canApplyParallax;
- (BOOL)canCreateSettlingEffectLayerView;
- (BOOL)canEnableDepthEffect;
- (BOOL)canEnableSettlingEffect;
- (BOOL)clockAppearsAboveForeground;
- (BOOL)depthEnabled;
- (BOOL)didSetContainerFrame;
- (BOOL)hasEnoughRoomForParallax;
- (BOOL)hasMatte;
- (BOOL)headroomLayoutUsesHeadroomArea;
- (BOOL)mainLayersArePruned;
- (BOOL)needsToAdjustVisibleFrame;
- (BOOL)parallaxDisabled;
- (BOOL)representsPureStyle;
- (BOOL)settlingEffectEnabled;
- (BOOL)shouldLoopSettlingEffectForGallery;
- (BOOL)showsDebugHUD;
- (BOOL)visibleFrameCrossesHeadroomBoundary;
- (CGPoint)parallaxVector;
- (CGRect)_layoutRectForViewRect:(CGRect)a3;
- (CGRect)_viewRectForLayoutRect:(CGRect)a3;
- (CGRect)containerFrame;
- (CGRect)contentRect;
- (CGRect)currentNormalizedVisibleFrame;
- (CGRect)extendedImageRect;
- (CGRect)inactiveFrame;
- (CGRect)landscapeVisibleFrame;
- (CGRect)normalizedVisibleFrame;
- (CGRect)portraitVisibleFrame;
- (CGRect)settlingEffectBounds;
- (CGRect)visibleFrame;
- (CGSize)imageSize;
- (NSDictionary)debugHUDRepresentation;
- (NSString)clockLayerOrder;
- (NSString)debugDescription;
- (PFParallaxLayerStack)currentLayerStack;
- (PFParallaxLayerStack)landscapeLayerStack;
- (PFParallaxLayerStack)portraitLayerStack;
- (PFPosterOrientedLayout)currentLayout;
- (PFPosterOrientedLayout)initialPortraitLayout;
- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration;
- (PFWallpaperCompoundLayerStack)compoundLayerStack;
- (PIParallaxStyle)style;
- (PISegmentationItem)segmentationItem;
- (PUParallaxLayerStackViewManager)viewManager;
- (PUParallaxLayerStackViewModel)init;
- (PUParallaxLayerStackViewModel)initWithCompoundLayerStack:(id)a3 style:(id)a4 deviceOrientation:(int64_t)a5;
- (PUParallaxLayerStackViewModel)initWithSegmentationItem:(id)a3 compoundLayerStack:(id)a4 style:(id)a5 deviceOrientation:(int64_t)a6;
- (PUParallaxLayerStackViewModel)initWithSegmentationItem:(id)a3 initialStyle:(id)a4 compoundLayerStack:(id)a5 deviceOrientation:(int64_t)a6;
- (PXUpdater)updater;
- (double)desiredHeadroomVisibilityAmount;
- (double)headroomVisibilityAmount;
- (double)visibilityAmount;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)backlightLuminance;
- (int64_t)deviceOrientation;
- (int64_t)environment;
- (int64_t)layoutOrder;
- (int64_t)orientation;
- (unint64_t)clockIntersection;
- (unint64_t)currentLayerStackPropertiesChange;
- (unint64_t)stylePropertiesChange;
- (void)_invalidateClockAppearsAboveForeground;
- (void)_invalidateCurrentLayerStack;
- (void)_invalidateCurrentLayout;
- (void)_invalidateCurrentNormalizedVisibleRect;
- (void)_invalidateDebugHUDRepresentation;
- (void)_invalidateDesiredHeadroomVisibilityAmount;
- (void)_invalidateHeadroomVisibilityAmount;
- (void)_invalidateInitialPortraitLayout;
- (void)_invalidateLayoutConfiguration;
- (void)_invalidateOrientation;
- (void)_invalidateVisibleFrameCrossesHeadroomBoundary;
- (void)_invalidateVisibleFrameWithContainerFrame;
- (void)_setNeedsUpdate;
- (void)_signalLayerStackPropertiesChange:(unint64_t)a3;
- (void)_signalStylePropertiesChange:(unint64_t)a3;
- (void)_updateClockAppearsAboveForeground;
- (void)_updateCurrentLayerStack;
- (void)_updateCurrentLayerStackProperties:(id)a3 changeDescriptor:(unint64_t)a4;
- (void)_updateCurrentLayout;
- (void)_updateCurrentNormalizedVisibleRect;
- (void)_updateDebugHUDRepresentation;
- (void)_updateDesiredHeadroomVisibilityAmount;
- (void)_updateHeadroomVisibilityAmount;
- (void)_updateInitialPortraitLayout;
- (void)_updateLayerStackPropertiesForAllOrientations:(id)a3 changeDescriptor:(unint64_t)a4;
- (void)_updateLayoutConfiguration;
- (void)_updateOrientation;
- (void)_updateVisibleFrameCrossesHeadroomBoundary;
- (void)_updateVisibleFrameWithContainerFrame;
- (void)_updateVisibleFrameWithContainerFrameSetFirstTime:(BOOL)a3;
- (void)didEndChangeHandling;
- (void)didPerformChanges;
- (void)performChanges:(id)a3;
- (void)pruneMainLayers;
- (void)setAppliesDepthToAllOrientations:(BOOL)a3;
- (void)setBacklightLuminance:(int64_t)a3;
- (void)setClockAppearsAboveForeground:(BOOL)a3;
- (void)setClockAreaLuminance:(double)a3;
- (void)setClockIntersection:(unint64_t)a3;
- (void)setClockLayerOrder:(id)a3;
- (void)setContainerFrame:(CGRect)a3;
- (void)setCurrentLayerStack:(id)a3;
- (void)setCurrentLayerStackPropertiesChange:(unint64_t)a3;
- (void)setCurrentLayout:(id)a3;
- (void)setCurrentNormalizedVisibleFrame:(CGRect)a3;
- (void)setDebugHUDRepresentation:(id)a3;
- (void)setDepthEnabled:(BOOL)a3;
- (void)setDesiredHeadroomVisibilityAmount:(double)a3;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setDidSetContainerFrame:(BOOL)a3;
- (void)setHeadroomVisibilityAmount:(double)a3;
- (void)setInitialPortraitLayout:(id)a3;
- (void)setLandscapeLayerStack:(id)a3;
- (void)setLandscapeVisibleFrame:(CGRect)a3;
- (void)setLayoutConfiguration:(id)a3;
- (void)setLayoutOrder:(int64_t)a3;
- (void)setNeedsToAdjustVisibleFrame:(BOOL)a3;
- (void)setNormalizedVisibleFrame:(CGRect)a3;
- (void)setNormalizedVisibleFrame:(CGRect)a3 animated:(BOOL)a4;
- (void)setNormalizedVisibleFrameForInactiveOrientation:(CGRect)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setParallaxDisabled:(BOOL)a3;
- (void)setParallaxVector:(CGPoint)a3;
- (void)setPortraitLayerStack:(id)a3;
- (void)setPortraitVisibleFrame:(CGRect)a3;
- (void)setSegmentationItem:(id)a3;
- (void)setSettlingEffectEnabled:(BOOL)a3;
- (void)setShouldLoopSettlingEffectForGallery:(BOOL)a3;
- (void)setShowsDebugHUD:(BOOL)a3;
- (void)setStyle:(id)a3;
- (void)setStylePropertiesChange:(unint64_t)a3;
- (void)setVisibilityAmount:(double)a3;
- (void)setVisibleFrame:(CGRect)a3;
- (void)setVisibleFrameCrossesHeadroomBoundary:(BOOL)a3;
- (void)updateBackfillLayersFromLayerStack:(id)a3;
- (void)updateHeadroomLayerFromLayerStack:(id)a3;
- (void)updateLayerStack:(id)a3;
- (void)updateSettlingEffectWithSegmentationItem:(id)a3 layerStack:(id)a4;
@end

@implementation PUParallaxLayerStackViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayout, 0);
  objc_storeStrong((id *)&self->_initialPortraitLayout, 0);
  objc_storeStrong((id *)&self->_landscapeLayerStack, 0);
  objc_storeStrong((id *)&self->_portraitLayerStack, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_debugHUDRepresentation, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_currentLayerStack, 0);
  objc_storeStrong((id *)&self->_viewManager, 0);
  objc_storeStrong((id *)&self->_layoutConfiguration, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
}

- (PFPosterOrientedLayout)currentLayout
{
  return self->_currentLayout;
}

- (void)setInitialPortraitLayout:(id)a3
{
}

- (PFPosterOrientedLayout)initialPortraitLayout
{
  return self->_initialPortraitLayout;
}

- (BOOL)visibleFrameCrossesHeadroomBoundary
{
  return self->_visibleFrameCrossesHeadroomBoundary;
}

- (void)setNeedsToAdjustVisibleFrame:(BOOL)a3
{
  self->_needsToAdjustVisibleFrame = a3;
}

- (BOOL)needsToAdjustVisibleFrame
{
  return self->_needsToAdjustVisibleFrame;
}

- (void)setLandscapeVisibleFrame:(CGRect)a3
{
  self->_landscapeVisibleFrame = a3;
}

- (CGRect)landscapeVisibleFrame
{
  double x = self->_landscapeVisibleFrame.origin.x;
  double y = self->_landscapeVisibleFrame.origin.y;
  double width = self->_landscapeVisibleFrame.size.width;
  double height = self->_landscapeVisibleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPortraitVisibleFrame:(CGRect)a3
{
  self->_portraitVisibleFrame = a3;
}

- (CGRect)portraitVisibleFrame
{
  double x = self->_portraitVisibleFrame.origin.x;
  double y = self->_portraitVisibleFrame.origin.y;
  double width = self->_portraitVisibleFrame.size.width;
  double height = self->_portraitVisibleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDidSetContainerFrame:(BOOL)a3
{
  self->_didSetContainerFrame = a3;
}

- (BOOL)didSetContainerFrame
{
  return self->_didSetContainerFrame;
}

- (CGRect)currentNormalizedVisibleFrame
{
  double x = self->_currentNormalizedVisibleFrame.origin.x;
  double y = self->_currentNormalizedVisibleFrame.origin.y;
  double width = self->_currentNormalizedVisibleFrame.size.width;
  double height = self->_currentNormalizedVisibleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PFParallaxLayerStack)landscapeLayerStack
{
  return self->_landscapeLayerStack;
}

- (PFParallaxLayerStack)portraitLayerStack
{
  return self->_portraitLayerStack;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (BOOL)shouldLoopSettlingEffectForGallery
{
  return self->_shouldLoopSettlingEffectForGallery;
}

- (NSDictionary)debugHUDRepresentation
{
  return self->_debugHUDRepresentation;
}

- (BOOL)showsDebugHUD
{
  return self->_showsDebugHUD;
}

- (double)visibilityAmount
{
  return self->_visibilityAmount;
}

- (int64_t)backlightLuminance
{
  return self->_backlightLuminance;
}

- (double)headroomVisibilityAmount
{
  return self->_headroomVisibilityAmount;
}

- (CGPoint)parallaxVector
{
  double x = self->_parallaxVector.x;
  double y = self->_parallaxVector.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)appliesDepthToAllOrientations
{
  return self->_appliesDepthToAllOrientations;
}

- (BOOL)clockAppearsAboveForeground
{
  return self->_clockAppearsAboveForeground;
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

- (void)setStylePropertiesChange:(unint64_t)a3
{
  self->_stylePropertiesChange = a3;
}

- (unint64_t)stylePropertiesChange
{
  return self->_stylePropertiesChange;
}

- (PIParallaxStyle)style
{
  return self->_style;
}

- (int64_t)layoutOrder
{
  return self->_layoutOrder;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setCurrentLayerStackPropertiesChange:(unint64_t)a3
{
  self->_currentLayerStackPropertiesChange = a3;
}

- (unint64_t)currentLayerStackPropertiesChange
{
  return self->_currentLayerStackPropertiesChange;
}

- (PFParallaxLayerStack)currentLayerStack
{
  return self->_currentLayerStack;
}

- (PUParallaxLayerStackViewManager)viewManager
{
  return self->_viewManager;
}

- (void)setLayoutConfiguration:(id)a3
{
}

- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration
{
  return self->_layoutConfiguration;
}

- (void)setSegmentationItem:(id)a3
{
}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (double)desiredHeadroomVisibilityAmount
{
  return self->_desiredHeadroomVisibilityAmount;
}

- (void)_signalStylePropertiesChange:(unint64_t)a3
{
  [(PUParallaxLayerStackViewModel *)self setStylePropertiesChange:[(PUParallaxLayerStackViewModel *)self stylePropertiesChange] | a3];
  [(PUParallaxLayerStackViewModel *)self signalChange:16];
}

- (void)_signalLayerStackPropertiesChange:(unint64_t)a3
{
  [(PUParallaxLayerStackViewModel *)self setCurrentLayerStackPropertiesChange:[(PUParallaxLayerStackViewModel *)self currentLayerStackPropertiesChange] | a3];
  [(PUParallaxLayerStackViewModel *)self signalChange:4];
}

- (void)_updateLayerStackPropertiesForAllOrientations:(id)a3 changeDescriptor:(unint64_t)a4
{
  id v7 = a3;
  v8 = [(PUParallaxLayerStackViewModel *)self portraitLayerStack];
  v9 = (*((void (**)(id, void *))a3 + 2))(v7, v8);
  [(PUParallaxLayerStackViewModel *)self setPortraitLayerStack:v9];

  v10 = [(PUParallaxLayerStackViewModel *)self landscapeLayerStack];
  v11 = (*((void (**)(id, void *))a3 + 2))(v7, v10);

  [(PUParallaxLayerStackViewModel *)self setLandscapeLayerStack:v11];
  int64_t v12 = [(PUParallaxLayerStackViewModel *)self orientation];
  if (v12 == 2)
  {
    v13 = [(PUParallaxLayerStackViewModel *)self landscapeLayerStack];
  }
  else
  {
    if (v12 != 1) {
      goto LABEL_6;
    }
    v13 = [(PUParallaxLayerStackViewModel *)self portraitLayerStack];
  }
  currentLayerStack = self->_currentLayerStack;
  self->_currentLayerStack = v13;

LABEL_6:
  [(PUParallaxLayerStackViewModel *)self _signalLayerStackPropertiesChange:a4];
  [(PUParallaxLayerStackViewModel *)self _invalidateDebugHUDRepresentation];
}

- (void)_updateCurrentLayerStackProperties:(id)a3 changeDescriptor:(unint64_t)a4
{
  p_currentLayerStack = &self->_currentLayerStack;
  (*((void (**)(id, PFParallaxLayerStack *))a3 + 2))(a3, self->_currentLayerStack);
  id v7 = (PFParallaxLayerStack *)objc_claimAutoreleasedReturnValue();
  if (*p_currentLayerStack != v7)
  {
    v9 = v7;
    objc_storeStrong((id *)p_currentLayerStack, v7);
    int64_t v8 = [(PUParallaxLayerStackViewModel *)self orientation];
    if (v8 == 2)
    {
      [(PUParallaxLayerStackViewModel *)self setLandscapeLayerStack:v9];
    }
    else if (v8 == 1)
    {
      [(PUParallaxLayerStackViewModel *)self setPortraitLayerStack:v9];
    }
    [(PUParallaxLayerStackViewModel *)self _signalLayerStackPropertiesChange:a4];
    [(PUParallaxLayerStackViewModel *)self _invalidateDebugHUDRepresentation];
    id v7 = v9;
    if ((a4 & 2) != 0)
    {
      [(PUParallaxLayerStackViewModel *)self _invalidateHeadroomVisibilityAmount];
      id v7 = v9;
    }
  }
}

- (void)setDebugHUDRepresentation:(id)a3
{
  int64_t v8 = (NSDictionary *)a3;
  v4 = self->_debugHUDRepresentation;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSDictionary *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)[(NSDictionary *)v8 copy];
      debugHUDRepresentation = self->_debugHUDRepresentation;
      self->_debugHUDRepresentation = v6;

      [(PUParallaxLayerStackViewModel *)self signalChange:0x40000];
    }
  }
}

- (void)_updateDebugHUDRepresentation
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if ([(PUParallaxLayerStackViewModel *)self showsDebugHUD])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v18[0] = @"Device Orientation";
    int64_t v4 = [(PUParallaxLayerStackViewModel *)self deviceOrientation];
    char v5 = @"unknown";
    if ((unint64_t)(v4 - 1) <= 3) {
      char v5 = off_1E5F224E0[v4 - 1];
    }
    v6 = v5;
    v18[1] = @"Layout Orientation";
    v19[0] = v6;
    int64_t v7 = [(PUParallaxLayerStackViewModel *)self orientation];
    int64_t v8 = @"portrait";
    if (v7 != 1) {
      int64_t v8 = @"unknown";
    }
    if (v7 == 2) {
      int64_t v8 = @"landscape";
    }
    v9 = v8;
    v19[1] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    [v3 addEntriesFromDictionary:v10];

    if ([(PUParallaxLayerStackViewModel *)self environment] == 2)
    {
      v16 = @"Style";
      v11 = [(PUParallaxLayerStackViewModel *)self style];
      uint64_t v12 = [v11 debugDescription];
      v13 = (void *)v12;
      v14 = @"none";
      if (v12) {
        v14 = (__CFString *)v12;
      }
      v17 = v14;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      [v3 addEntriesFromDictionary:v15];
    }
    [(PUParallaxLayerStackViewModel *)self setDebugHUDRepresentation:v3];
  }
}

- (void)_invalidateDebugHUDRepresentation
{
  id v2 = [(PUParallaxLayerStackViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDebugHUDRepresentation];
}

- (void)setHeadroomVisibilityAmount:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_headroomVisibilityAmount = a3;
    [(PUParallaxLayerStackViewModel *)self signalChange:0x100000];
  }
}

- (void)_updateHeadroomVisibilityAmount
{
  id v3 = [(PUParallaxLayerStackViewModel *)self currentLayerStack];
  char v4 = [v3 mayContainBakedHeadroom];

  BOOL v5 = [(PUParallaxLayerStackViewModel *)self representsPureStyle];
  v6 = [(PUParallaxLayerStackViewModel *)self currentLayerStack];
  int64_t v7 = [v6 layout];
  int v8 = [v7 canApplyHeadroom];

  double v9 = 0.0;
  if ((v4 & 1) == 0 && v8 && !v5) {
    [(PUParallaxLayerStackViewModel *)self desiredHeadroomVisibilityAmount];
  }
  [(PUParallaxLayerStackViewModel *)self setHeadroomVisibilityAmount:v9];
}

- (void)_invalidateHeadroomVisibilityAmount
{
  id v2 = [(PUParallaxLayerStackViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateHeadroomVisibilityAmount];
}

- (void)setDesiredHeadroomVisibilityAmount:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_desiredHeadroomVisibilityAmount = a3;
    [(PUParallaxLayerStackViewModel *)self _invalidateHeadroomVisibilityAmount];
  }
}

- (void)_updateDesiredHeadroomVisibilityAmount
{
  BOOL v3 = [(PUParallaxLayerStackViewModel *)self visibleFrameCrossesHeadroomBoundary];
  double v4 = 0.0;
  if (v3) {
    double v4 = 1.0;
  }
  [(PUParallaxLayerStackViewModel *)self setDesiredHeadroomVisibilityAmount:v4];
}

- (void)_invalidateDesiredHeadroomVisibilityAmount
{
  id v2 = [(PUParallaxLayerStackViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateDesiredHeadroomVisibilityAmount];
}

- (void)setVisibleFrameCrossesHeadroomBoundary:(BOOL)a3
{
  if (self->_visibleFrameCrossesHeadroomBoundary != a3)
  {
    self->_visibleFrameCrossesHeadroomBoundardouble y = a3;
    [(PUParallaxLayerStackViewModel *)self _invalidateDesiredHeadroomVisibilityAmount];
  }
}

- (void)_updateVisibleFrameCrossesHeadroomBoundary
{
  if ([(PUParallaxLayerStackViewModel *)self environment] == 1)
  {
    [(PUParallaxLayerStackViewModel *)self normalizedVisibleFrame];
    BOOL v3 = CGRectGetMinY(v5) < 0.0;
    [(PUParallaxLayerStackViewModel *)self setVisibleFrameCrossesHeadroomBoundary:v3];
  }
}

- (void)_invalidateVisibleFrameCrossesHeadroomBoundary
{
  id v2 = [(PUParallaxLayerStackViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateVisibleFrameCrossesHeadroomBoundary];
}

- (void)_updateLayoutConfiguration
{
  id v3 = objc_alloc(MEMORY[0x1E4F8CE48]);
  id v10 = [(PUParallaxLayerStackViewModel *)self portraitLayerStack];
  double v4 = [v10 layout];
  CGRect v5 = [v4 configuration];
  v6 = [(PUParallaxLayerStackViewModel *)self landscapeLayerStack];
  int64_t v7 = [v6 layout];
  int v8 = [v7 configuration];
  double v9 = (void *)[v3 initWithPortraitConfiguration:v5 landscapeConfiguration:v8];
  [(PUParallaxLayerStackViewModel *)self setLayoutConfiguration:v9];
}

- (void)_invalidateLayoutConfiguration
{
  id v2 = [(PUParallaxLayerStackViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateLayoutConfiguration];
}

- (PFWallpaperCompoundLayerStack)compoundLayerStack
{
  id v3 = objc_alloc(MEMORY[0x1E4F8CE50]);
  double v4 = [(PUParallaxLayerStackViewModel *)self portraitLayerStack];
  CGRect v5 = [(PUParallaxLayerStackViewModel *)self landscapeLayerStack];
  v6 = (void *)[v3 initWithPortraitLayerStack:v4 landscapeLayerStack:v5];

  return (PFWallpaperCompoundLayerStack *)v6;
}

- (void)setClockAppearsAboveForeground:(BOOL)a3
{
  if (self->_clockAppearsAboveForeground != a3)
  {
    self->_clockAppearsAboveForeground = a3;
    [(PUParallaxLayerStackViewModel *)self signalChange:4096];
  }
}

- (void)_updateClockAppearsAboveForeground
{
  id v3 = [(PUParallaxLayerStackViewModel *)self clockLayerOrder];

  if (v3)
  {
    id v5 = [(PUParallaxLayerStackViewModel *)self clockLayerOrder];
    BOOL v4 = ([v5 isEqualToString:*MEMORY[0x1E4F8D098]] & 1) != 0
      || ![(PUParallaxLayerStackViewModel *)self depthEnabled]
      || [(PUParallaxLayerStackViewModel *)self settlingEffectEnabled];
    [(PUParallaxLayerStackViewModel *)self setClockAppearsAboveForeground:v4];
  }
}

- (void)_invalidateClockAppearsAboveForeground
{
  id v2 = [(PUParallaxLayerStackViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateClockAppearsAboveForeground];
}

- (void)_updateInitialPortraitLayout
{
  id v6 = [(PUParallaxLayerStackViewModel *)self currentLayout];
  [v6 normalizedVisibleFrame];
  PXSizeGetAspectRatio();
  double v4 = v3;
  id v5 = [(PUParallaxLayerStackViewModel *)self initialPortraitLayout];

  if (!v5 && v4 <= 1.0) {
    [(PUParallaxLayerStackViewModel *)self setInitialPortraitLayout:v6];
  }
}

- (void)_invalidateInitialPortraitLayout
{
  id v2 = [(PUParallaxLayerStackViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateInitialPortraitLayout];
}

- (void)setCurrentNormalizedVisibleFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_currentNormalizedVisibleFrame = &self->_currentNormalizedVisibleFrame;
  if ((PXRectApproximatelyEqualToRect() & 1) == 0)
  {
    p_currentNormalizedVisibleFrame->origin.CGFloat x = x;
    p_currentNormalizedVisibleFrame->origin.CGFloat y = y;
    p_currentNormalizedVisibleFrame->size.CGFloat width = width;
    p_currentNormalizedVisibleFrame->size.CGFloat height = height;
    [(PUParallaxLayerStackViewModel *)self _invalidateVisibleFrameCrossesHeadroomBoundary];
    [(PUParallaxLayerStackViewModel *)self signalChange:0x4000];
  }
}

- (void)_updateCurrentNormalizedVisibleRect
{
  double v3 = [(PUParallaxLayerStackViewModel *)self currentLayout];
  [v3 normalizedVisibleFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v31.origin.CGFloat x = v5;
  v31.origin.CGFloat y = v7;
  v31.size.CGFloat width = v9;
  v31.size.CGFloat height = v11;
  if (CGRectIsEmpty(v31))
  {
    uint64_t v12 = [(PUParallaxLayerStackViewModel *)self currentLayout];
    [v12 imageSize];
    PXRectWithOriginAndSize();
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    v21 = [(PUParallaxLayerStackViewModel *)self currentLayout];
    [v21 deviceResolution];
    PXSizeGetAspectRatio();
    PXRectWithAspectRatioFittingRect();
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;

    double v5 = v23 - v14;
    double v11 = 0.0;
    double v9 = 0.0;
    if (v18 != 0.0)
    {
      double v5 = v5 / v18;
      double v9 = v27 / v18;
    }
    double v7 = v25 - v16;
    if (v20 != 0.0)
    {
      double v7 = v7 / v20;
      double v11 = v29 / v20;
    }
  }
  -[PUParallaxLayerStackViewModel setCurrentNormalizedVisibleFrame:](self, "setCurrentNormalizedVisibleFrame:", v5, v7, v9, v11);
}

- (void)_invalidateCurrentNormalizedVisibleRect
{
  id v2 = [(PUParallaxLayerStackViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentNormalizedVisibleRect];
}

- (void)setCurrentLayout:(id)a3
{
  double v8 = (PFPosterOrientedLayout *)a3;
  double v5 = self->_currentLayout;
  if (v5 == v8)
  {
  }
  else
  {
    double v6 = v5;
    char v7 = [(PFPosterOrientedLayout *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentLayout, a3);
      [(PUParallaxLayerStackViewModel *)self _invalidateClockAppearsAboveForeground];
      [(PUParallaxLayerStackViewModel *)self _invalidateInitialPortraitLayout];
      [(PUParallaxLayerStackViewModel *)self signalChange:8];
    }
  }
}

- (void)_updateCurrentLayout
{
  id v4 = [(PUParallaxLayerStackViewModel *)self currentLayerStack];
  double v3 = [v4 layout];
  [(PUParallaxLayerStackViewModel *)self setCurrentLayout:v3];
}

- (void)_invalidateCurrentLayout
{
  id v2 = [(PUParallaxLayerStackViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentLayout];
}

- (void)setCurrentLayerStack:(id)a3
{
  double v8 = (PFParallaxLayerStack *)a3;
  double v5 = self->_currentLayerStack;
  if (v5 == v8)
  {
  }
  else
  {
    double v6 = v5;
    char v7 = [(PFParallaxLayerStack *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentLayerStack, a3);
      [(PUParallaxLayerStackViewModel *)self _invalidateCurrentLayout];
      [(PUParallaxLayerStackViewModel *)self _invalidateCurrentNormalizedVisibleRect];
      [(PUParallaxLayerStackViewModel *)self _invalidateHeadroomVisibilityAmount];
      [(PUParallaxLayerStackViewModel *)self signalChange:2];
    }
  }
}

- (void)_updateCurrentLayerStack
{
  int64_t v3 = [(PUParallaxLayerStackViewModel *)self orientation];
  if (!v3) {
    goto LABEL_4;
  }
  if (v3 == 2)
  {
    double v5 = [(PUParallaxLayerStackViewModel *)self landscapeLayerStack];
    double v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [(PUParallaxLayerStackViewModel *)self portraitLayerStack];
    }
    id v8 = v7;

    uint64_t v4 = (uint64_t)v8;
    goto LABEL_10;
  }
  if (v3 != 1)
  {
    uint64_t v4 = 0;
  }
  else
  {
LABEL_4:
    uint64_t v4 = [(PUParallaxLayerStackViewModel *)self portraitLayerStack];
  }
LABEL_10:
  id v9 = (id)v4;
  [(PUParallaxLayerStackViewModel *)self setCurrentLayerStack:v4];
}

- (void)_invalidateCurrentLayerStack
{
  id v2 = [(PUParallaxLayerStackViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateCurrentLayerStack];
}

- (void)_updateVisibleFrameWithContainerFrame
{
  if ([MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration])
  {
    if ([(PUParallaxLayerStackViewModel *)self needsToAdjustVisibleFrame])
    {
      [(PUParallaxLayerStackViewModel *)self containerFrame];
      if (!CGRectIsEmpty(v4))
      {
        [(PUParallaxLayerStackViewModel *)self _updateVisibleFrameWithContainerFrameSetFirstTime:0];
      }
    }
  }
}

- (void)_invalidateVisibleFrameWithContainerFrame
{
  id v2 = [(PUParallaxLayerStackViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateVisibleFrameWithContainerFrame];
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    [(PUParallaxLayerStackViewModel *)self _invalidateCurrentLayerStack];
    [(PUParallaxLayerStackViewModel *)self _invalidateVisibleFrameWithContainerFrame];
    [(PUParallaxLayerStackViewModel *)self _invalidateDebugHUDRepresentation];
    [(PUParallaxLayerStackViewModel *)self signalChange:32];
  }
}

- (void)_updateOrientation
{
  [(PUParallaxLayerStackViewModel *)self containerFrame];
  PXSizeGetAspectRatio();
  if (v3 <= 1.0)
  {
    if ([(PUParallaxLayerStackViewModel *)self deviceOrientation])
    {
      if ((unint64_t)([(PUParallaxLayerStackViewModel *)self deviceOrientation] - 3) >= 2) {
        uint64_t v4 = 1;
      }
      else {
        uint64_t v4 = 2;
      }
    }
    else
    {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 2;
  }
  [(PUParallaxLayerStackViewModel *)self setOrientation:v4];
}

- (void)_invalidateOrientation
{
  id v2 = [(PUParallaxLayerStackViewModel *)self updater];
  [v2 setNeedsUpdateOf:sel__updateOrientation];
}

- (void)didEndChangeHandling
{
  v3.receiver = self;
  v3.super_class = (Class)PUParallaxLayerStackViewModel;
  [(PUParallaxLayerStackViewModel *)&v3 didEndChangeHandling];
  [(PUParallaxLayerStackViewModel *)self setCurrentLayerStackPropertiesChange:0];
  [(PUParallaxLayerStackViewModel *)self setStylePropertiesChange:0];
}

- (void)_setNeedsUpdate
{
}

- (void)didPerformChanges
{
  v4.receiver = self;
  v4.super_class = (Class)PUParallaxLayerStackViewModel;
  [(PUParallaxLayerStackViewModel *)&v4 didPerformChanges];
  objc_super v3 = [(PUParallaxLayerStackViewModel *)self updater];
  [v3 updateIfNeeded];
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUParallaxLayerStackViewModel;
  [(PUParallaxLayerStackViewModel *)&v3 performChanges:a3];
}

- (void)updateSettlingEffectWithSegmentationItem:(id)a3 layerStack:(id)a4
{
  id v7 = (PISegmentationItem *)a3;
  if (self->_segmentationItem != v7)
  {
    objc_storeStrong((id *)&self->_segmentationItem, a3);
    id v8 = a4;
    id v9 = [v8 settlingEffectLayer];

    if (v9)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __85__PUParallaxLayerStackViewModel_updateSettlingEffectWithSegmentationItem_layerStack___block_invoke;
      v10[3] = &unk_1E5F281F8;
      id v11 = v9;
      [(PUParallaxLayerStackViewModel *)self _updateLayerStackPropertiesForAllOrientations:v10 changeDescriptor:2];
    }
  }
}

id __85__PUParallaxLayerStackViewModel_updateSettlingEffectWithSegmentationItem_layerStack___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *(void *)(a1 + 32);
  id v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  objc_super v4 = [v2 arrayWithObjects:&v7 count:1];
  objc_msgSend(v3, "size", v7, v8);
  double v5 = objc_msgSend(v3, "layerStackByUpdatingLayers:imageSize:", v4);

  return v5;
}

- (void)setClockIntersection:(unint64_t)a3
{
  if ([(PUParallaxLayerStackViewModel *)self clockIntersection] != a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__PUParallaxLayerStackViewModel_setClockIntersection___block_invoke;
    v5[3] = &__block_descriptor_40_e52___PFParallaxLayerStack_16__0__PFParallaxLayerStack_8l;
    v5[4] = a3;
    [(PUParallaxLayerStackViewModel *)self _updateCurrentLayerStackProperties:v5 changeDescriptor:0];
    [(PUParallaxLayerStackViewModel *)self signalChange:256];
    [(PUParallaxLayerStackViewModel *)self _invalidateCurrentLayout];
  }
}

id __54__PUParallaxLayerStackViewModel_setClockIntersection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [v3 layout];
  double v5 = [v4 layoutByUpdatingClockIntersection:*(void *)(a1 + 32)];

  double v6 = [v3 layerStackByUpdatingLayout:v5];

  return v6;
}

- (unint64_t)clockIntersection
{
  id v2 = [(PUParallaxLayerStackViewModel *)self currentLayout];
  unint64_t v3 = [v2 clockIntersection];

  return v3;
}

- (void)setClockAreaLuminance:(double)a3
{
  double v5 = [(PUParallaxLayerStackViewModel *)self currentLayerStack];
  [v5 clockAreaLuminance];
  double v7 = vabdd_f64(a3, v6);

  if (v7 > 0.00000999999975)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__PUParallaxLayerStackViewModel_setClockAreaLuminance___block_invoke;
    v8[3] = &__block_descriptor_40_e52___PFParallaxLayerStack_16__0__PFParallaxLayerStack_8l;
    *(double *)&v8[4] = a3;
    [(PUParallaxLayerStackViewModel *)self _updateCurrentLayerStackProperties:v8 changeDescriptor:32];
  }
}

uint64_t __55__PUParallaxLayerStackViewModel_setClockAreaLuminance___block_invoke(uint64_t a1, void *a2)
{
  return [a2 layerStackByUpdatingClockAreaLuminance:*(double *)(a1 + 32)];
}

- (void)setClockLayerOrder:(id)a3
{
  id v4 = a3;
  id v5 = [(PUParallaxLayerStackViewModel *)self clockLayerOrder];

  if (v5 != v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__PUParallaxLayerStackViewModel_setClockLayerOrder___block_invoke;
    v6[3] = &unk_1E5F281F8;
    id v7 = v4;
    [(PUParallaxLayerStackViewModel *)self _updateCurrentLayerStackProperties:v6 changeDescriptor:16];
    [(PUParallaxLayerStackViewModel *)self _invalidateCurrentLayout];
  }
}

uint64_t __52__PUParallaxLayerStackViewModel_setClockLayerOrder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 layerStackByUpdatingClockLayerOrder:*(void *)(a1 + 32)];
}

- (NSString)clockLayerOrder
{
  id v2 = [(PUParallaxLayerStackViewModel *)self currentLayout];
  unint64_t v3 = [v2 clockLayerOrder];

  return (NSString *)v3;
}

- (void)pruneMainLayers
{
}

uint64_t __48__PUParallaxLayerStackViewModel_pruneMainLayers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 layerStackByRemovingLayersWithOptions:1];
}

- (void)updateHeadroomLayerFromLayerStack:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__PUParallaxLayerStackViewModel_updateHeadroomLayerFromLayerStack___block_invoke;
  v6[3] = &unk_1E5F281F8;
  id v7 = v4;
  id v5 = v4;
  [(PUParallaxLayerStackViewModel *)self _updateCurrentLayerStackProperties:v6 changeDescriptor:2];
}

id __67__PUParallaxLayerStackViewModel_updateHeadroomLayerFromLayerStack___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 layers];
  [v3 size];
  id v5 = objc_msgSend(v3, "layerStackByUpdatingLayers:imageSize:", v4);

  return v5;
}

- (void)updateBackfillLayersFromLayerStack:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PUParallaxLayerStackViewModel_updateBackfillLayersFromLayerStack___block_invoke;
  v6[3] = &unk_1E5F281F8;
  id v7 = v4;
  id v5 = v4;
  [(PUParallaxLayerStackViewModel *)self _updateLayerStackPropertiesForAllOrientations:v6 changeDescriptor:2];
}

id __68__PUParallaxLayerStackViewModel_updateBackfillLayersFromLayerStack___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 layers];
  [v3 size];
  id v5 = objc_msgSend(v3, "layerStackByUpdatingLayers:imageSize:", v4);

  return v5;
}

- (void)updateLayerStack:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PUParallaxLayerStackViewModel_updateLayerStack___block_invoke;
  v6[3] = &unk_1E5F281F8;
  id v5 = v4;
  id v7 = v5;
  [(PUParallaxLayerStackViewModel *)self _updateCurrentLayerStackProperties:v6 changeDescriptor:2];
  if ([MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration]
    && [(PUParallaxLayerStackViewModel *)self needsToAdjustVisibleFrame]
    && [(PUParallaxLayerStackViewModel *)self orientation] == 2)
  {
    [(PUParallaxLayerStackViewModel *)self setNeedsToAdjustVisibleFrame:0];
  }
}

id __50__PUParallaxLayerStackViewModel_updateLayerStack___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 layers];
  [*(id *)(a1 + 32) size];
  double v6 = objc_msgSend(v4, "layerStackByUpdatingLayers:imageSize:", v5);

  return v6;
}

- (void)setShowsDebugHUD:(BOOL)a3
{
  if (self->_showsDebugHUD != a3)
  {
    self->_showsDebugHUD = a3;
    [(PUParallaxLayerStackViewModel *)self _invalidateDebugHUDRepresentation];
    [(PUParallaxLayerStackViewModel *)self signalChange:0x80000];
  }
}

- (void)setShouldLoopSettlingEffectForGallery:(BOOL)a3
{
  if (self->_shouldLoopSettlingEffectForGallery != a3)
  {
    self->_shouldLoopSettlingEffectForGallerCGFloat y = a3;
    [(PUParallaxLayerStackViewModel *)self signalChange:0x200000];
  }
}

- (void)setLayoutOrder:(int64_t)a3
{
  if (self->_layoutOrder != a3)
  {
    self->_layoutOrder = a3;
    [(PUParallaxLayerStackViewModel *)self signalChange:64];
  }
}

- (void)setDeviceOrientation:(int64_t)a3
{
  if (self->_deviceOrientation != a3)
  {
    self->_deviceOrientation = a3;
    [(PUParallaxLayerStackViewModel *)self _invalidateOrientation];
    [(PUParallaxLayerStackViewModel *)self _invalidateDebugHUDRepresentation];
    [(PUParallaxLayerStackViewModel *)self signalChange:0x20000];
  }
}

- (void)setBacklightLuminance:(int64_t)a3
{
  if (self->_backlightLuminance != a3)
  {
    self->_backlightLuminance = a3;
    [(PUParallaxLayerStackViewModel *)self signalChange:128];
  }
}

- (void)setVisibilityAmount:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_visibilityAmount = a3;
    [(PUParallaxLayerStackViewModel *)self signalChange:1024];
  }
}

- (void)setParallaxVector:(CGPoint)a3
{
  if (self->_parallaxVector.x != a3.x || self->_parallaxVector.y != a3.y)
  {
    self->_parallaxVector = a3;
    [(PUParallaxLayerStackViewModel *)self signalChange:0x2000];
  }
}

- (void)_updateVisibleFrameWithContainerFrameSetFirstTime:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(PUParallaxLayerStackViewModel *)self orientation];
  [(PUParallaxLayerStackViewModel *)self containerFrame];
  int v6 = [MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration];
  char v7 = v6;
  if (v6 && [(PUParallaxLayerStackViewModel *)self needsToAdjustVisibleFrame] && v5 == 2) {
    PXRectTransposed();
  }
  PXRectTransposed();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__PUParallaxLayerStackViewModel__updateVisibleFrameWithContainerFrameSetFirstTime___block_invoke;
  v9[3] = &unk_1E5F28240;
  char v10 = v7;
  v9[4] = self;
  uint64_t v8 = (void (**)(void))_Block_copy(v9);
  if (v3)
  {
    [(PUParallaxLayerStackViewModel *)self visibleFrame];
    -[PUParallaxLayerStackViewModel setPortraitVisibleFrame:](self, "setPortraitVisibleFrame:");
    [(PUParallaxLayerStackViewModel *)self portraitVisibleFrame];
    v8[2](v8);
    -[PUParallaxLayerStackViewModel setLandscapeVisibleFrame:](self, "setLandscapeVisibleFrame:");
  }
  if (v5 == 2) {
    [(PUParallaxLayerStackViewModel *)self landscapeVisibleFrame];
  }
  else {
    [(PUParallaxLayerStackViewModel *)self portraitVisibleFrame];
  }
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    [(PUParallaxLayerStackViewModel *)self portraitVisibleFrame];
    v8[2](v8);
    -[PUParallaxLayerStackViewModel setPortraitVisibleFrame:](self, "setPortraitVisibleFrame:");
    [(PUParallaxLayerStackViewModel *)self portraitVisibleFrame];
    v8[2](v8);
    -[PUParallaxLayerStackViewModel setLandscapeVisibleFrame:](self, "setLandscapeVisibleFrame:");
    [(PUParallaxLayerStackViewModel *)self setNeedsToAdjustVisibleFrame:1];
  }
  if ([(PUParallaxLayerStackViewModel *)self needsToAdjustVisibleFrame])
  {
    if (v5 == 2) {
      [(PUParallaxLayerStackViewModel *)self landscapeVisibleFrame];
    }
    else {
      [(PUParallaxLayerStackViewModel *)self portraitVisibleFrame];
    }
    -[PUParallaxLayerStackViewModel setVisibleFrame:](self, "setVisibleFrame:");
  }
}

double __83__PUParallaxLayerStackViewModel__updateVisibleFrameWithContainerFrameSetFirstTime___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  if (*(unsigned char *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "needsToAdjustVisibleFrame", a2, 0.5);
  }
  return a2 + (a4 - a8 * (1.0 / fmax(a8 / a4, a9 / a5))) * 0.5;
}

- (void)setContainerFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_containerFrame = &self->_containerFrame;
  if (!CGRectEqualToRect(self->_containerFrame, a3))
  {
    p_containerFrame->origin.CGFloat x = x;
    p_containerFrame->origin.CGFloat y = y;
    p_containerFrame->size.CGFloat width = width;
    p_containerFrame->size.CGFloat height = height;
    uint64_t v9 = [(PUParallaxLayerStackViewModel *)self didSetContainerFrame] ^ 1;
    [(PUParallaxLayerStackViewModel *)self setDidSetContainerFrame:1];
    [(PUParallaxLayerStackViewModel *)self _updateVisibleFrameWithContainerFrameSetFirstTime:v9];
    [(PUParallaxLayerStackViewModel *)self _invalidateOrientation];
    [(PUParallaxLayerStackViewModel *)self signalChange:512];
  }
}

- (void)setStyle:(id)a3
{
  uint64_t v9 = (PIParallaxStyle *)a3;
  int64_t v5 = self->_style;
  if (v5 == v9)
  {
  }
  else
  {
    int v6 = v5;
    char v7 = [(PIParallaxStyle *)v5 isEqual:v9];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = [(id)objc_opt_class() _changeDescriptorBetweenOldStyle:self->_style newStyle:v9];
      objc_storeStrong((id *)&self->_style, a3);
      if (v8)
      {
        [(PUParallaxLayerStackViewModel *)self _invalidateDebugHUDRepresentation];
        [(PUParallaxLayerStackViewModel *)self _invalidateHeadroomVisibilityAmount];
        [(PUParallaxLayerStackViewModel *)self _signalStylePropertiesChange:v8];
      }
    }
  }
}

- (BOOL)headroomLayoutUsesHeadroomArea
{
  int64_t v3 = [(PUParallaxLayerStackViewModel *)self orientation];
  id v4 = [(PUParallaxLayerStackViewModel *)self segmentationItem];
  int64_t v5 = [v4 headroomLayout];
  int v6 = v5;
  if (v3 == 2) {
    [v5 landscapeLayout];
  }
  else {
  char v7 = [v5 portraitLayout];
  }

  char v8 = [v7 isUsingHeadroom];
  return v8;
}

- (BOOL)canApplyHeadroom
{
  id v2 = [(PUParallaxLayerStackViewModel *)self currentLayerStack];
  int64_t v3 = [v2 layout];
  char v4 = [v3 canApplyHeadroom];

  return v4;
}

- (BOOL)representsPureStyle
{
  id v2 = [(PUParallaxLayerStackViewModel *)self style];
  int64_t v3 = [v2 kind];

  if (([v3 isEqualToString:*MEMORY[0x1E4F8D000]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F8D018]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F8D008]] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:*MEMORY[0x1E4F8D010]];
  }

  return v4;
}

- (BOOL)mainLayersArePruned
{
  int64_t v3 = [(PUParallaxLayerStackViewModel *)self portraitLayerStack];
  if ([v3 hasMainLayers])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int64_t v5 = [(PUParallaxLayerStackViewModel *)self landscapeLayerStack];
    int v4 = [v5 hasMainLayers] ^ 1;
  }
  return v4;
}

- (BOOL)canCreateSettlingEffectLayerView
{
  if ([(PUParallaxLayerStackViewModel *)self environment] == 2
    || [(PUParallaxLayerStackViewModel *)self shouldLoopSettlingEffectForGallery])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    int v4 = [MEMORY[0x1E4F28F80] processInfo];
    int v3 = [v4 isLowPowerModeEnabled] ^ 1;
  }
  return v3;
}

- (BOOL)canEnableSettlingEffect
{
  int v3 = [(PUParallaxLayerStackViewModel *)self segmentationItem];
  int v4 = [v3 isSettlingEffectAvailable];

  if (!v4) {
    return 0;
  }
  int64_t v5 = [(PUParallaxLayerStackViewModel *)self segmentationItem];
  [v5 settlingEffectNormalizedBounds];
  IsEmptCGFloat y = CGRectIsEmpty(v8);

  return !IsEmpty;
}

- (BOOL)canEnableDepthEffect
{
  BOOL result = [(PUParallaxLayerStackViewModel *)self environment] == 2
        && [(PUParallaxLayerStackViewModel *)self clockIntersection] != 3
        && ([(PUParallaxLayerStackViewModel *)self segmentationItem],
            int v3 = objc_claimAutoreleasedReturnValue(),
            [v3 segmentationMatte],
            int v4 = objc_claimAutoreleasedReturnValue(),
            v4,
            v3,
            v4)
        && [(PUParallaxLayerStackViewModel *)self clockIntersection] == 1;
  return result;
}

- (BOOL)hasMatte
{
  id v2 = [(PUParallaxLayerStackViewModel *)self segmentationItem];
  int v3 = [v2 segmentationMatte];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)hasEnoughRoomForParallax
{
  id v2 = [(PUParallaxLayerStackViewModel *)self currentLayout];
  char v3 = [v2 canApplyParallax];

  return v3;
}

- (BOOL)canApplyParallax
{
  if ([(PUParallaxLayerStackViewModel *)self parallaxDisabled]) {
    return 0;
  }
  return [(PUParallaxLayerStackViewModel *)self hasEnoughRoomForParallax];
}

- (void)setParallaxDisabled:(BOOL)a3
{
  if ([(PUParallaxLayerStackViewModel *)self parallaxDisabled] != a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53__PUParallaxLayerStackViewModel_setParallaxDisabled___block_invoke;
    v5[3] = &__block_descriptor_33_e52___PFParallaxLayerStack_16__0__PFParallaxLayerStack_8l;
    BOOL v6 = a3;
    [(PUParallaxLayerStackViewModel *)self _updateLayerStackPropertiesForAllOrientations:v5 changeDescriptor:1];
  }
}

uint64_t __53__PUParallaxLayerStackViewModel_setParallaxDisabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 layerStackByUpdatingParallaxDisabled:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)parallaxDisabled
{
  id v2 = [(PUParallaxLayerStackViewModel *)self currentLayerStack];
  char v3 = [v2 parallaxDisabled];

  return v3;
}

- (void)setSettlingEffectEnabled:(BOOL)a3
{
  if ([(PUParallaxLayerStackViewModel *)self settlingEffectEnabled] != a3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __58__PUParallaxLayerStackViewModel_setSettlingEffectEnabled___block_invoke;
    v5[3] = &__block_descriptor_33_e52___PFParallaxLayerStack_16__0__PFParallaxLayerStack_8l;
    BOOL v6 = a3;
    [(PUParallaxLayerStackViewModel *)self _updateLayerStackPropertiesForAllOrientations:v5 changeDescriptor:8];
    [(PUParallaxLayerStackViewModel *)self _invalidateClockAppearsAboveForeground];
  }
}

uint64_t __58__PUParallaxLayerStackViewModel_setSettlingEffectEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 layerStackByUpdatingSettlingEffectEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)settlingEffectEnabled
{
  id v2 = [(PUParallaxLayerStackViewModel *)self currentLayerStack];
  char v3 = [v2 settlingEffectEnabled];

  return v3;
}

- (void)setAppliesDepthToAllOrientations:(BOOL)a3
{
  if (self->_appliesDepthToAllOrientations != a3) {
    self->_appliesDepthToAllOrientations = a3;
  }
}

- (void)setDepthEnabled:(BOOL)a3
{
  int v3 = a3;
  if ([(PUParallaxLayerStackViewModel *)self appliesDepthToAllOrientations])
  {
    int64_t v5 = [(PUParallaxLayerStackViewModel *)self portraitLayerStack];
    if ([v5 depthEnabled] == v3)
    {
      BOOL v6 = [(PUParallaxLayerStackViewModel *)self landscapeLayerStack];
      int v7 = [v6 depthEnabled];

      if (v7 == v3) {
        return;
      }
    }
    else
    {
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__PUParallaxLayerStackViewModel_setDepthEnabled___block_invoke;
    v10[3] = &__block_descriptor_33_e52___PFParallaxLayerStack_16__0__PFParallaxLayerStack_8l;
    char v11 = v3;
    [(PUParallaxLayerStackViewModel *)self _updateLayerStackPropertiesForAllOrientations:v10 changeDescriptor:4];
  }
  else
  {
    if ([(PUParallaxLayerStackViewModel *)self depthEnabled] == v3) {
      return;
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49__PUParallaxLayerStackViewModel_setDepthEnabled___block_invoke_2;
    v8[3] = &__block_descriptor_33_e52___PFParallaxLayerStack_16__0__PFParallaxLayerStack_8l;
    char v9 = v3;
    [(PUParallaxLayerStackViewModel *)self _updateCurrentLayerStackProperties:v8 changeDescriptor:4];
  }
  [(PUParallaxLayerStackViewModel *)self _invalidateClockAppearsAboveForeground];
}

uint64_t __49__PUParallaxLayerStackViewModel_setDepthEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 layerStackByUpdatingDepthEnabled:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __49__PUParallaxLayerStackViewModel_setDepthEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 layerStackByUpdatingDepthEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)depthEnabled
{
  id v2 = [(PUParallaxLayerStackViewModel *)self currentLayerStack];
  char v3 = [v2 depthEnabled];

  return v3;
}

- (void)setLandscapeLayerStack:(id)a3
{
  int64_t v5 = (PFParallaxLayerStack *)a3;
  if (self->_landscapeLayerStack != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_landscapeLayerStack, a3);
    [(PUParallaxLayerStackViewModel *)self _invalidateLayoutConfiguration];
    int64_t v5 = v6;
  }
}

- (void)setPortraitLayerStack:(id)a3
{
  int64_t v5 = (PFParallaxLayerStack *)a3;
  if (self->_portraitLayerStack != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_portraitLayerStack, a3);
    [(PUParallaxLayerStackViewModel *)self _invalidateLayoutConfiguration];
    int64_t v5 = v6;
  }
}

- (CGRect)inactiveFrame
{
  char v3 = [(PUParallaxLayerStackViewModel *)self currentLayout];
  [v3 inactiveFrame];
  [(PUParallaxLayerStackViewModel *)self _viewRectForLayoutRect:"_viewRectForLayoutRect:"];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)setNormalizedVisibleFrameForInactiveOrientation:(CGRect)a3
{
  PXRectFlippedVertically();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  int64_t v12 = [(PUParallaxLayerStackViewModel *)self orientation];
  if (v12 == 2)
  {
    id v19 = [(PUParallaxLayerStackViewModel *)self portraitLayerStack];
    double v17 = [v19 layout];
    double v14 = objc_msgSend(v17, "layoutByUpdatingNormalizedVisibleFrame:", v5, v7, v9, v11);

    double v15 = [v19 layerStackByUpdatingLayout:v14];
    uint64_t v16 = 232;
  }
  else
  {
    if (v12 != 1) {
      return;
    }
    id v19 = [(PUParallaxLayerStackViewModel *)self landscapeLayerStack];
    double v13 = [v19 layout];
    double v14 = objc_msgSend(v13, "layoutByUpdatingNormalizedVisibleFrame:", v5, v7, v9, v11);

    double v15 = [v19 layerStackByUpdatingLayout:v14];
    uint64_t v16 = 240;
  }
  double v18 = *(Class *)((char *)&self->super.super.isa + v16);
  *(Class *)((char *)&self->super.super.isa + v16) = v15;
}

- (void)setNormalizedVisibleFrame:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  PXRectFlippedVertically();
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  p_currentNormalizedVisibleFrame = &self->_currentNormalizedVisibleFrame;
  if (vabdd_f64(v6, self->_currentNormalizedVisibleFrame.origin.x) > 0.0001
    || vabdd_f64(v7, self->_currentNormalizedVisibleFrame.origin.y) > 0.0001
    || vabdd_f64(v8, self->_currentNormalizedVisibleFrame.size.width) > 0.0001
    || vabdd_f64(v9, self->_currentNormalizedVisibleFrame.size.height) > 0.0001)
  {
    p_currentNormalizedVisibleFrame->origin.CGFloat x = v6;
    self->_currentNormalizedVisibleFrame.origin.CGFloat y = v7;
    self->_currentNormalizedVisibleFrame.size.CGFloat width = v8;
    self->_currentNormalizedVisibleFrame.size.CGFloat height = v9;
    if (v4)
    {
      objc_initWeak(&location, self);
      double v15 = [(PUParallaxLayerStackViewModel *)self viewManager];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __68__PUParallaxLayerStackViewModel_setNormalizedVisibleFrame_animated___block_invoke;
      v27[3] = &unk_1E5F281D0;
      objc_copyWeak(v28, &location);
      v28[1] = *(id *)&v10;
      v28[2] = *(id *)&v11;
      v28[3] = *(id *)&v12;
      v28[4] = *(id *)&v13;
      [v15 layoutViewsAnimated:v27];

      objc_destroyWeak(v28);
      objc_destroyWeak(&location);
    }
    else
    {
      [(PUParallaxLayerStackViewModel *)self signalChange:0x4000];
    }
    uint64_t v16 = [(PUParallaxLayerStackViewModel *)self initialPortraitLayout];
    [v16 normalizedVisibleFrame];
    if (vabdd_f64(v20, p_currentNormalizedVisibleFrame->origin.x) <= 0.0001
      && vabdd_f64(v17, self->_currentNormalizedVisibleFrame.origin.y) <= 0.0001
      && vabdd_f64(v18, self->_currentNormalizedVisibleFrame.size.width) <= 0.0001)
    {
      double v24 = vabdd_f64(v19, self->_currentNormalizedVisibleFrame.size.height);

      if (v24 <= 0.0001)
      {
        double v22 = [(PUParallaxLayerStackViewModel *)self initialPortraitLayout];
        if (v22) {
          goto LABEL_13;
        }
      }
    }
    else
    {
    }
    v21 = [(PUParallaxLayerStackViewModel *)self currentLayout];
    double v22 = objc_msgSend(v21, "layoutByUpdatingNormalizedVisibleFrame:", v10, v11, v12, v13);

LABEL_13:
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __68__PUParallaxLayerStackViewModel_setNormalizedVisibleFrame_animated___block_invoke_3;
    v25[3] = &unk_1E5F281F8;
    id v26 = v22;
    id v23 = v22;
    [(PUParallaxLayerStackViewModel *)self _updateCurrentLayerStackProperties:v25 changeDescriptor:0];
    [(PUParallaxLayerStackViewModel *)self _invalidateCurrentLayout];
  }
}

void __68__PUParallaxLayerStackViewModel_setNormalizedVisibleFrame_animated___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained currentNormalizedVisibleFrame];
  LODWORD(v1) = CGRectEqualToRect(v7, *(CGRect *)(v1 + 40));

  if (v1)
  {
    id v4 = objc_loadWeakRetained(v2);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68__PUParallaxLayerStackViewModel_setNormalizedVisibleFrame_animated___block_invoke_2;
    v5[3] = &unk_1E5F281A8;
    objc_copyWeak(&v6, v2);
    [v4 performChanges:v5];

    objc_destroyWeak(&v6);
  }
}

uint64_t __68__PUParallaxLayerStackViewModel_setNormalizedVisibleFrame_animated___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 layerStackByUpdatingLayout:*(void *)(a1 + 32)];
}

void __68__PUParallaxLayerStackViewModel_setNormalizedVisibleFrame_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained signalChange:0x8000];

  id v3 = objc_loadWeakRetained(v1);
  [v3 signalChange:0x4000];
}

- (void)setNormalizedVisibleFrame:(CGRect)a3
{
}

- (CGRect)normalizedVisibleFrame
{
  [(PUParallaxLayerStackViewModel *)self currentNormalizedVisibleFrame];
  PXRectFlippedVertically();
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setVisibleFrame:(CGRect)a3
{
  double v4 = [(PUParallaxLayerStackViewModel *)self currentLayout];
  [v4 imageSize];

  PXRectNormalize();
  -[PUParallaxLayerStackViewModel setNormalizedVisibleFrame:](self, "setNormalizedVisibleFrame:");
}

- (CGRect)visibleFrame
{
  double v3 = [(PUParallaxLayerStackViewModel *)self currentLayout];
  [v3 imageSize];

  [(PUParallaxLayerStackViewModel *)self normalizedVisibleFrame];
  PXRectDenormalize();
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)contentRect
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([(PUParallaxLayerStackViewModel *)self settlingEffectEnabled]) {
    [(PUParallaxLayerStackViewModel *)self settlingEffectBounds];
  }
  else {
    [(PUParallaxLayerStackViewModel *)self extendedImageRect];
  }
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  if (CGRectIsEmpty(*(CGRect *)&v3))
  {
    double v11 = PLWallpaperGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = [(PUParallaxLayerStackViewModel *)self settlingEffectEnabled];
      [(PUParallaxLayerStackViewModel *)self settlingEffectBounds];
      double v13 = NSStringFromCGRect(v29);
      [(PUParallaxLayerStackViewModel *)self extendedImageRect];
      double v14 = NSStringFromCGRect(v30);
      v23[0] = 67109634;
      v23[1] = v12;
      __int16 v24 = 2114;
      double v25 = v13;
      __int16 v26 = 2114;
      double v27 = v14;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "Empty content rect. Settling effect enabled: %d, settlingEffectBounds: %{public}@, extendedImageRect: %{public}@", (uint8_t *)v23, 0x1Cu);
    }
    [(PUParallaxLayerStackViewModel *)self extendedImageRect];
    double v7 = v15;
    double v8 = v16;
    double v9 = v17;
    double v10 = v18;
  }
  double v19 = v7;
  double v20 = v8;
  double v21 = v9;
  double v22 = v10;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGRect)settlingEffectBounds
{
  double v3 = [(PUParallaxLayerStackViewModel *)self segmentationItem];
  [v3 settlingEffectNormalizedBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  BOOL v12 = [(PUParallaxLayerStackViewModel *)self currentLayout];
  [v12 imageSize];
  double v14 = v13;
  double v16 = v15;

  -[PUParallaxLayerStackViewModel _viewRectForLayoutRect:](self, "_viewRectForLayoutRect:", v5 * v14 + 0.0, v7 * v16 + 0.0, v9 * v14, v11 * v16);
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (CGRect)extendedImageRect
{
  double v3 = [(PUParallaxLayerStackViewModel *)self currentLayout];
  [v3 extendedImageExtent];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[PUParallaxLayerStackViewModel _viewRectForLayoutRect:](self, "_viewRectForLayoutRect:", v5, v7, v9, v11);
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGSize)imageSize
{
  double v2 = [(PUParallaxLayerStackViewModel *)self currentLayout];
  [v2 imageSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (CGRect)_viewRectForLayoutRect:(CGRect)a3
{
  double v3 = [(PUParallaxLayerStackViewModel *)self currentLayout];
  [v3 imageSize];

  PXRectFlippedVertically();
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)_layoutRectForViewRect:(CGRect)a3
{
  double v3 = [(PUParallaxLayerStackViewModel *)self currentLayout];
  [v3 imageSize];

  PXRectFlippedVertically();
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (int64_t)environment
{
  double v2 = [(PUParallaxLayerStackViewModel *)self segmentationItem];
  if (v2) {
    int64_t v3 = 2;
  }
  else {
    int64_t v3 = 1;
  }

  return v3;
}

- (NSString)debugDescription
{
  v8.receiver = self;
  v8.super_class = (Class)PUParallaxLayerStackViewModel;
  int64_t v3 = [(PUParallaxLayerStackViewModel *)&v8 debugDescription];
  double v4 = [(PUParallaxLayerStackViewModel *)self currentLayerStack];
  double v5 = [(PUParallaxLayerStackViewModel *)self style];
  double v6 = [v3 stringByAppendingFormat:@" currentLayerStack = %@, style = %@", v4, v5];

  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = [(PUParallaxLayerStackViewModel *)self updater];
  [v4 updateIfNeeded];

  double v5 = [(PUParallaxLayerStackViewModel *)self segmentationItem];

  id v6 = objc_alloc((Class)objc_opt_class());
  if (v5)
  {
    double v7 = [(PUParallaxLayerStackViewModel *)self segmentationItem];
    objc_super v8 = [(PUParallaxLayerStackViewModel *)self style];
    double v9 = [v8 bakedStyle];
    double v10 = [(PUParallaxLayerStackViewModel *)self compoundLayerStack];
    double v11 = objc_msgSend(v6, "initWithSegmentationItem:initialStyle:compoundLayerStack:deviceOrientation:", v7, v9, v10, -[PUParallaxLayerStackViewModel deviceOrientation](self, "deviceOrientation"));
  }
  else
  {
    double v7 = [(PUParallaxLayerStackViewModel *)self compoundLayerStack];
    objc_super v8 = [(PUParallaxLayerStackViewModel *)self style];
    double v9 = [v8 bakedStyle];
    double v11 = objc_msgSend(v6, "initWithCompoundLayerStack:style:deviceOrientation:", v7, v9, -[PUParallaxLayerStackViewModel deviceOrientation](self, "deviceOrientation"));
  }

  [(PUParallaxLayerStackViewModel *)self containerFrame];
  objc_msgSend(v11, "setContainerFrame:");
  return v11;
}

- (PUParallaxLayerStackViewModel)init
{
  double v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PUParallaxLayerStackViewModel.m", 118, @"%s is not available as initializer", "-[PUParallaxLayerStackViewModel init]");

  abort();
}

- (PUParallaxLayerStackViewModel)initWithSegmentationItem:(id)a3 compoundLayerStack:(id)a4 style:(id)a5 deviceOrientation:(int64_t)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v13)
  {
    double v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PUParallaxLayerStackViewModel.m", 78, @"Invalid parameter not satisfying: %@", @"compoundLayerStack != nil" object file lineNumber description];
  }
  v30.receiver = self;
  v30.super_class = (Class)PUParallaxLayerStackViewModel;
  double v15 = [(PUParallaxLayerStackViewModel *)&v30 init];
  if (v15)
  {
    uint64_t v16 = [v13 portraitLayerStack];
    portraitLayerStack = v15->_portraitLayerStack;
    v15->_portraitLayerStack = (PFParallaxLayerStack *)v16;

    uint64_t v18 = [v13 landscapeLayerStack];
    landscapeLayerStack = v15->_landscapeLayerStack;
    v15->_landscapeLayerStack = (PFParallaxLayerStack *)v18;

    v15->_needsToAdjustVisibleFrame = v15->_landscapeLayerStack == 0;
    objc_storeStrong((id *)&v15->_segmentationItem, a3);
    if (v14)
    {
      double v20 = [MEMORY[0x1E4F8A340] styleWithBakedStyle:v14];
    }
    else
    {
      double v20 = 0;
    }
    objc_storeStrong((id *)&v15->_style, v20);
    if (v14) {

    }
    double v21 = [[PUParallaxLayerStackViewManager alloc] initWithViewModel:v15];
    viewManager = v15->_viewManager;
    v15->_viewManager = v21;

    v15->_visibilityAmount = 1.0;
    v15->_backlightLuminance = -1;
    v15->_deviceOrientation = a6;
    uint64_t v23 = 1;
    if ((unint64_t)(a6 - 3) < 2) {
      uint64_t v23 = 2;
    }
    v15->_orientation = v23;
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F912F8]) initWithTarget:v15 needsUpdateSelector:sel__setNeedsUpdate];
    updater = v15->_updater;
    v15->_updater = (PXUpdater *)v24;

    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateOrientation];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateVisibleFrameWithContainerFrame];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateCurrentLayerStack];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateCurrentLayout];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateCurrentNormalizedVisibleRect];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateVisibleFrameCrossesHeadroomBoundary];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateDesiredHeadroomVisibilityAmount];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateHeadroomVisibilityAmount];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateInitialPortraitLayout];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateClockAppearsAboveForeground];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateLayoutConfiguration];
    [(PXUpdater *)v15->_updater addUpdateSelector:sel__updateDebugHUDRepresentation];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __101__PUParallaxLayerStackViewModel_initWithSegmentationItem_compoundLayerStack_style_deviceOrientation___block_invoke;
    v28[3] = &unk_1E5F2E420;
    CGRect v29 = v15;
    [(PUParallaxLayerStackViewModel *)v29 performChanges:v28];
  }
  return v15;
}

uint64_t __101__PUParallaxLayerStackViewModel_initWithSegmentationItem_compoundLayerStack_style_deviceOrientation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidateCurrentLayerStack];
  double v2 = *(void **)(a1 + 32);
  return [v2 _invalidateLayoutConfiguration];
}

- (PUParallaxLayerStackViewModel)initWithCompoundLayerStack:(id)a3 style:(id)a4 deviceOrientation:(int64_t)a5
{
  return [(PUParallaxLayerStackViewModel *)self initWithSegmentationItem:0 compoundLayerStack:a3 style:a4 deviceOrientation:a5];
}

- (PUParallaxLayerStackViewModel)initWithSegmentationItem:(id)a3 initialStyle:(id)a4 compoundLayerStack:(id)a5 deviceOrientation:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUParallaxLayerStackViewModel.m", 69, @"Invalid parameter not satisfying: %@", @"item != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v16 = [v11 originalStyle];
    id v14 = [(PUParallaxLayerStackViewModel *)self initWithSegmentationItem:v11 compoundLayerStack:v13 style:v16 deviceOrientation:a6];

    goto LABEL_6;
  }
  if (!v12) {
    goto LABEL_5;
  }
LABEL_3:
  id v14 = [(PUParallaxLayerStackViewModel *)self initWithSegmentationItem:v11 compoundLayerStack:v13 style:v12 deviceOrientation:a6];
LABEL_6:

  return v14;
}

+ (unint64_t)_changeDescriptorBetweenOldStyle:(id)a3 newStyle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = [v5 kind];
  objc_super v8 = [v6 kind];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    if ([v6 hasTonalityMode])
    {
      uint64_t v10 = [v5 tonality];
      unint64_t v11 = 2 * (v10 != [v6 tonality]);
    }
    else
    {
      unint64_t v11 = 0;
    }
    if ([v6 hasColorParameter])
    {
      id v12 = [v5 color];
      id v13 = [v6 color];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        v11 |= 4uLL;
      }
    }
    if ([v6 hasBackgroundParameter])
    {
      int v15 = [v5 showsBackground];
      if (v15 != [v6 showsBackground]) {
        v11 |= 8uLL;
      }
    }
  }
  else
  {
    unint64_t v11 = 1;
  }
  uint64_t v16 = [v5 clockColor];
  uint64_t v17 = [v6 clockColor];
  if (v16 == (void *)v17)
  {
  }
  else
  {
    uint64_t v18 = (void *)v17;
    int v19 = [v16 isEqual:v17];

    if (!v19) {
      v11 |= 0x10uLL;
    }
  }

  return v11;
}

@end