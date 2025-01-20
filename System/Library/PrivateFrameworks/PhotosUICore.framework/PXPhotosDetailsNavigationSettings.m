@interface PXPhotosDetailsNavigationSettings
+ (BOOL)canUseSystemSwipeToDismiss;
+ (BOOL)shouldAllowZoomFromSheets;
+ (PXPhotosDetailsNavigationSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)allowScreenEdgeSwipeToDismiss;
- (BOOL)allowZoomBounce;
- (BOOL)allowZoomFromSheets;
- (BOOL)customZoomTransitionDimming;
- (BOOL)customZoomTransitionDimmingBlurEffect;
- (BOOL)ensureOpaqueDestination;
- (BOOL)showDebugOverlays;
- (BOOL)useDebugColors;
- (BOOL)useSystemSwipeToDismiss;
- (BOOL)useZoomTransition;
- (BOOL)workAround123679412;
- (BOOL)workAround125263280;
- (double)screenEdgeSwipeForegroundInset;
- (double)screenEdgeSwipeInteractionRelativeDistance;
- (double)screenEdgeSwipeInteractiveFraction;
- (double)screenEdgeSwipeSlideDownDuration;
- (double)zoomBounceDelay;
- (double)zoomBounceRefractoryPeriod;
- (double)zoomBounceScale;
- (double)zoomTransitionDimmingOpacity;
- (double)zoomTransitionDimmingWhite;
- (id)parentSettings;
- (int64_t)zoomTransitionDimmingBlurEffectStyle;
- (void)setAllowScreenEdgeSwipeToDismiss:(BOOL)a3;
- (void)setAllowZoomBounce:(BOOL)a3;
- (void)setAllowZoomFromSheets:(BOOL)a3;
- (void)setCustomZoomTransitionDimming:(BOOL)a3;
- (void)setCustomZoomTransitionDimmingBlurEffect:(BOOL)a3;
- (void)setDefaultValues;
- (void)setEnsureOpaqueDestination:(BOOL)a3;
- (void)setScreenEdgeSwipeForegroundInset:(double)a3;
- (void)setScreenEdgeSwipeInteractionRelativeDistance:(double)a3;
- (void)setScreenEdgeSwipeInteractiveFraction:(double)a3;
- (void)setScreenEdgeSwipeSlideDownDuration:(double)a3;
- (void)setShowDebugOverlays:(BOOL)a3;
- (void)setUseDebugColors:(BOOL)a3;
- (void)setUseSystemSwipeToDismiss:(BOOL)a3;
- (void)setUseZoomTransition:(BOOL)a3;
- (void)setWorkAround123679412:(BOOL)a3;
- (void)setWorkAround125263280:(BOOL)a3;
- (void)setZoomBounceDelay:(double)a3;
- (void)setZoomBounceRefractoryPeriod:(double)a3;
- (void)setZoomBounceScale:(double)a3;
- (void)setZoomTransitionDimmingBlurEffectStyle:(int64_t)a3;
- (void)setZoomTransitionDimmingOpacity:(double)a3;
- (void)setZoomTransitionDimmingWhite:(double)a3;
@end

@implementation PXPhotosDetailsNavigationSettings

- (BOOL)workAround125263280
{
  return self->_workAround125263280;
}

- (BOOL)showDebugOverlays
{
  return self->_showDebugOverlays;
}

+ (PXPhotosDetailsNavigationSettings)sharedInstance
{
  if (sharedInstance_onceToken_169588 != -1) {
    dispatch_once(&sharedInstance_onceToken_169588, &__block_literal_global_169589);
  }
  v2 = (void *)sharedInstance_sharedInstance_169590;
  return (PXPhotosDetailsNavigationSettings *)v2;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsNavigationSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXPhotosDetailsNavigationSettings *)self setUseZoomTransition:1];
  [(PXPhotosDetailsNavigationSettings *)self setCustomZoomTransitionDimming:1];
  [(PXPhotosDetailsNavigationSettings *)self setZoomTransitionDimmingWhite:0.0];
  [(PXPhotosDetailsNavigationSettings *)self setZoomTransitionDimmingOpacity:0.5];
  [(PXPhotosDetailsNavigationSettings *)self setCustomZoomTransitionDimmingBlurEffect:1];
  [(PXPhotosDetailsNavigationSettings *)self setZoomTransitionDimmingBlurEffectStyle:3];
  [(PXPhotosDetailsNavigationSettings *)self setAllowZoomBounce:0];
  [(PXPhotosDetailsNavigationSettings *)self setZoomBounceScale:0.9];
  [(PXPhotosDetailsNavigationSettings *)self setZoomBounceDelay:0.1];
  [(PXPhotosDetailsNavigationSettings *)self setZoomBounceRefractoryPeriod:0.5];
  [(PXPhotosDetailsNavigationSettings *)self setUseSystemSwipeToDismiss:+[PXPhotosDetailsNavigationSettings canUseSystemSwipeToDismiss]];
  [(PXPhotosDetailsNavigationSettings *)self setEnsureOpaqueDestination:1];
  [(PXPhotosDetailsNavigationSettings *)self setUseDebugColors:0];
  [(PXPhotosDetailsNavigationSettings *)self setShowDebugOverlays:0];
  [(PXPhotosDetailsNavigationSettings *)self setAllowScreenEdgeSwipeToDismiss:1];
  [(PXPhotosDetailsNavigationSettings *)self setScreenEdgeSwipeForegroundInset:35.0];
  [(PXPhotosDetailsNavigationSettings *)self setScreenEdgeSwipeSlideDownDuration:0.3];
  [(PXPhotosDetailsNavigationSettings *)self setScreenEdgeSwipeInteractionRelativeDistance:1.0];
  [(PXPhotosDetailsNavigationSettings *)self setScreenEdgeSwipeInteractiveFraction:0.5];
  [(PXPhotosDetailsNavigationSettings *)self setWorkAround123679412:0];
  [(PXPhotosDetailsNavigationSettings *)self setAllowZoomFromSheets:+[PXPhotosDetailsNavigationSettings shouldAllowZoomFromSheets]];
  [(PXPhotosDetailsNavigationSettings *)self setWorkAround125263280:0];
}

- (void)setZoomTransitionDimmingWhite:(double)a3
{
  self->_zoomTransitionDimmingWhite = a3;
}

- (void)setZoomTransitionDimmingOpacity:(double)a3
{
  self->_zoomTransitionDimmingOpacity = a3;
}

- (void)setZoomTransitionDimmingBlurEffectStyle:(int64_t)a3
{
  self->_zoomTransitionDimmingBlurEffectStyle = a3;
}

- (void)setZoomBounceScale:(double)a3
{
  self->_zoomBounceScale = a3;
}

- (void)setZoomBounceRefractoryPeriod:(double)a3
{
  self->_zoomBounceRefractoryPeriod = a3;
}

- (void)setZoomBounceDelay:(double)a3
{
  self->_zoomBounceDelay = a3;
}

- (void)setWorkAround125263280:(BOOL)a3
{
  self->_workAround125263280 = a3;
}

- (void)setWorkAround123679412:(BOOL)a3
{
  self->_workAround123679412 = a3;
}

- (void)setUseZoomTransition:(BOOL)a3
{
  self->_useZoomTransition = a3;
}

- (void)setUseSystemSwipeToDismiss:(BOOL)a3
{
  self->_useSystemSwipeToDismiss = a3;
}

- (void)setUseDebugColors:(BOOL)a3
{
  self->_useDebugColors = a3;
}

- (void)setShowDebugOverlays:(BOOL)a3
{
  self->_showDebugOverlays = a3;
}

- (void)setScreenEdgeSwipeSlideDownDuration:(double)a3
{
  self->_screenEdgeSwipeSlideDownDuration = a3;
}

- (void)setScreenEdgeSwipeInteractiveFraction:(double)a3
{
  self->_screenEdgeSwipeInteractiveFraction = a3;
}

- (void)setScreenEdgeSwipeInteractionRelativeDistance:(double)a3
{
  self->_screenEdgeSwipeInteractionRelativeDistance = a3;
}

- (void)setScreenEdgeSwipeForegroundInset:(double)a3
{
  self->_screenEdgeSwipeForegroundInset = a3;
}

- (void)setEnsureOpaqueDestination:(BOOL)a3
{
  self->_ensureOpaqueDestination = a3;
}

- (void)setCustomZoomTransitionDimmingBlurEffect:(BOOL)a3
{
  self->_customZoomTransitionDimmingBlurEffect = a3;
}

- (void)setCustomZoomTransitionDimming:(BOOL)a3
{
  self->_customZoomTransitionDimming = a3;
}

- (void)setAllowZoomFromSheets:(BOOL)a3
{
  self->_allowZoomFromSheets = a3;
}

- (void)setAllowZoomBounce:(BOOL)a3
{
  self->_allowZoomBounce = a3;
}

- (void)setAllowScreenEdgeSwipeToDismiss:(BOOL)a3
{
  self->_allowScreenEdgeSwipeToDismiss = a3;
}

void __51__PXPhotosDetailsNavigationSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 detailsNavigationSettings];
  v1 = (void *)sharedInstance_sharedInstance_169590;
  sharedInstance_sharedInstance_169590 = v0;
}

+ (BOOL)canUseSystemSwipeToDismiss
{
  return 1;
}

+ (BOOL)shouldAllowZoomFromSheets
{
  return 1;
}

+ (id)settingsControllerModule
{
}

- (BOOL)allowZoomFromSheets
{
  return self->_allowZoomFromSheets;
}

- (BOOL)workAround123679412
{
  return self->_workAround123679412;
}

- (double)screenEdgeSwipeInteractiveFraction
{
  return self->_screenEdgeSwipeInteractiveFraction;
}

- (double)screenEdgeSwipeInteractionRelativeDistance
{
  return self->_screenEdgeSwipeInteractionRelativeDistance;
}

- (double)screenEdgeSwipeSlideDownDuration
{
  return self->_screenEdgeSwipeSlideDownDuration;
}

- (double)screenEdgeSwipeForegroundInset
{
  return self->_screenEdgeSwipeForegroundInset;
}

- (BOOL)allowScreenEdgeSwipeToDismiss
{
  return self->_allowScreenEdgeSwipeToDismiss;
}

- (BOOL)useDebugColors
{
  return self->_useDebugColors;
}

- (BOOL)ensureOpaqueDestination
{
  return self->_ensureOpaqueDestination;
}

- (BOOL)useSystemSwipeToDismiss
{
  return self->_useSystemSwipeToDismiss;
}

- (double)zoomBounceRefractoryPeriod
{
  return self->_zoomBounceRefractoryPeriod;
}

- (double)zoomBounceDelay
{
  return self->_zoomBounceDelay;
}

- (double)zoomBounceScale
{
  return self->_zoomBounceScale;
}

- (BOOL)allowZoomBounce
{
  return self->_allowZoomBounce;
}

- (int64_t)zoomTransitionDimmingBlurEffectStyle
{
  return self->_zoomTransitionDimmingBlurEffectStyle;
}

- (BOOL)customZoomTransitionDimmingBlurEffect
{
  return self->_customZoomTransitionDimmingBlurEffect;
}

- (double)zoomTransitionDimmingOpacity
{
  return self->_zoomTransitionDimmingOpacity;
}

- (double)zoomTransitionDimmingWhite
{
  return self->_zoomTransitionDimmingWhite;
}

- (BOOL)customZoomTransitionDimming
{
  return self->_customZoomTransitionDimming;
}

- (BOOL)useZoomTransition
{
  return self->_useZoomTransition;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

@end