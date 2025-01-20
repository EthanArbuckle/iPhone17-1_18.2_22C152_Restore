@interface THWInteractiveImageWidgetRep
- (BOOL)animatingCallouts;
- (BOOL)calloutsHidden;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)directlyManagesLayerContent;
- (BOOL)expandableShouldPreloadExpanded;
- (BOOL)expandedContentAllowDoubleTapZoom;
- (BOOL)expandedContentHandlesDoubleTapZoomDirectly;
- (BOOL)expandedHasContentForPanel:(int)a3;
- (BOOL)expandedPanel:(int)a3 isVisibleWithDefault:(BOOL)a4;
- (BOOL)expandedPanelAllowVisible;
- (BOOL)expandedPanelUseDarkAppearance;
- (BOOL)expandedShouldCombineBottomAndControlPanels;
- (BOOL)expandedWantsSingleTapBehavior;
- (BOOL)freeTransformUseTracedShadowPath;
- (BOOL)handleGesture:(id)a3;
- (BOOL)handlingPress;
- (BOOL)interactiveImageCalloutIsAnimating:(id)a3;
- (BOOL)interactiveImageCalloutIsScrollViewDragging:(id)a3;
- (BOOL)isExpanded;
- (BOOL)isFreeTransformInProgress;
- (BOOL)meetsStageDimensionRequirementForExpanded;
- (BOOL)overlayableZoomableCanvasController:(id)a3 allowsEditMenuForRep:(id)a4;
- (BOOL)overlayableZoomableCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4;
- (BOOL)overlayableZoomableCanvasController:(id)a3 shouldDisableScrollingAtContentEdgesForScrollView:(id)a4;
- (BOOL)overlayableZoomableCanvasController:(id)a3 shouldDisableScrollingWhenCursorIsHiddenForScrollView:(id)a4;
- (BOOL)overlayableZoomableCanvasControllerDeferViewCreation:(id)a3;
- (BOOL)overlayableZoomableCanvasControllerIsRelatedCanvasScrolling:(id)a3;
- (BOOL)overlayableZoomableCanvasControllerShouldResampleImages:(id)a3;
- (BOOL)p_createViewIfNeededWithFrame:(CGRect)a3;
- (BOOL)p_isExpanding;
- (BOOL)p_isStageBackgroundTransparent;
- (BOOL)p_singleTapResetsToDefaultZoom;
- (BOOL)p_widgetInteractionDisabledOnPage;
- (BOOL)panelDescriptionExpanded;
- (BOOL)shouldAnimateTargetLayer:(id)a3;
- (BOOL)shouldFadeInTargetLayer:(id)a3;
- (BOOL)shouldFadeOutAnimationLayer:(id)a3;
- (BOOL)shouldRecognizePressOnRep:(id)a3;
- (BOOL)tracksScore;
- (BOOL)useStoredViewportIndex;
- (BOOL)userInteractionEnabled;
- (BOOL)wantsCachedImage;
- (BOOL)wantsPressAction;
- (BOOL)wantsPressAnimation;
- (CALayer)pressableAnimationLayer;
- (CALayer)pressableAnimationShadowLayer;
- (CALayer)sourceOverlayLayer;
- (CALayer)stageBackgroundLayer;
- (CGAffineTransform)freeTransform;
- (CGAffineTransform)shadowAnimationLayerDestinationTransform:(SEL)a3 uniformTargetScale:(id)a4;
- (CGColor)borderColor;
- (CGPoint)contentOffset;
- (CGPoint)convertContentPointToUnscaledOverlayPoint:(CGPoint)a3;
- (CGPoint)interactiveImageCallout:(id)a3 convertContentPointToUnscaledOverlayPoint:(CGPoint)a4;
- (CGPoint)p_clientScaledContentOffsetFromScrollview;
- (CGPoint)p_clientScaledFromScrollScaledPoint:(CGPoint)a3;
- (CGPoint)p_scrollScaledFromClientScaledPoint:(CGPoint)a3;
- (CGPoint)p_wingOffsetForPortalRect:(CGRect)a3;
- (CGRect)ftcTargetFrame;
- (CGRect)naturalBoundsForHitTesting;
- (CGRect)p_backgroundImageContentsRect;
- (CGRect)p_bufferedHullFrameForImageFrame:(CGRect)a3 calloutFrame:(CGRect)a4;
- (CGRect)p_calloutFrameWithViewScale:(double)a3;
- (CGRect)p_diagramFrame;
- (CGRect)p_diagramFrameWithViewScale:(double)a3;
- (CGRect)p_expandedViewportFrameInPortalRect:(CGRect)a3;
- (CGRect)p_imageFrame;
- (CGRect)p_imageFrameWithViewScale:(double)a3;
- (CGRect)p_portalFrame;
- (CGRect)p_stageBackgroundFrameRelativeToImageContentLayer;
- (CGRect)p_viewportFrame;
- (CGRect)pressableNaturalBounds;
- (CGRect)rectForCompletion;
- (CGSize)sizeOfContentCanvasForOverlayableZoomableCanvasController:(id)a3;
- (THAnimationController)animationController;
- (THWExpandedRepController)expandedRepController;
- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler;
- (THWImageCropAnimationController)imageCropAnimationController;
- (THWInteractiveImageWidgetController)controller;
- (THWInteractiveImageWidgetRep)initWithLayout:(id)a3 canvas:(id)a4;
- (THWOverlayableZoomableCanvasController)stageCanvasController;
- (THWPressableRepGestureTargetHandler)pressableHandler;
- (TSDImageRepCachedSizedImage)cachedImage;
- (TSUImage)stageBackgroundImage;
- (UIEdgeInsets)expandedStackedControlContainerInsetsForPanel:(int)a3 withDefault:(UIEdgeInsets)a4;
- (UIEdgeInsets)p_insetsForInnerFrame:(CGRect)a3 inOuterFrame:(CGRect)a4;
- (UIEdgeInsets)p_insetsWithViewScale:(double)a3 viewportBounds:(CGRect)a4;
- (double)baseViewScale;
- (double)expandedMinHeightForPanel:(int)a3 withDefault:(double)a4;
- (double)overlayableZoomableCanvasControllerContentsScale:(id)a3;
- (double)p_maxCalloutViewScale;
- (double)rotationDuration;
- (double)targetViewScale;
- (double)zoomDuration;
- (id)additionalGestureTargetsForZoomableCanvasController:(id)a3 gesture:(id)a4;
- (id)animationLayer;
- (id)calloutInfoForDisplay;
- (id)calloutReps;
- (id)documentRootForOverlayableZoomableCanvasController:(id)a3;
- (id)expandedAdditionalChildLayoutsForPanel:(int)a3;
- (id)expandedChildInfosForPanel:(int)a3;
- (id)expandedLayoutGeometryForLayout:(id)a3 inPanel:(int)a4 withWidth:(double)a5 insets:(UIEdgeInsets)a6;
- (id)expandedPanel:(int)a3 primaryTargetForGesture:(id)a4;
- (id)expandedRotationAnimationController;
- (id)expandedSupportedGestureKinds;
- (id)infosToDisplayForContainerInOverlayableZoomableCanvasController:(id)a3;
- (id)overlayableZoomableCanvasController:(id)a3 infosToDisplayForContentViewport:(CGRect)a4;
- (id)overlayableZoomableCanvasController:(id)a3 primaryTargetForGesture:(id)a4;
- (id)p_backgroundImageContentLayer;
- (id)p_backgroundImageRep;
- (id)p_imageRep;
- (id)p_sidebarRep;
- (id)shadowAnimationLayer;
- (id)shadowPath;
- (id)styledRep;
- (id)targetLayer;
- (id)viewControllerForView:(id)a3;
- (int)expandedAppearance;
- (int)expandedAppearanceForPanel:(int)a3;
- (int)positionForChildView:(id)a3;
- (int)pressableAction;
- (unint64_t)selectedCalloutIndex;
- (unint64_t)storedViewportIndex;
- (unint64_t)viewportIndex;
- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5;
- (void)addAlternateLayersForChildViewsToArray:(id)a3;
- (void)addChildViewsToArray:(id)a3;
- (void)animatableDestinationSetupTarget:(id)a3;
- (void)animationControllerDidAddContentAnimations:(id)a3 uniformTargetScale:(double)a4;
- (void)animationControllerDidPresent:(id)a3;
- (void)animationControllerDidPresentPostCommit:(id)a3;
- (void)animationControllerSetupTarget:(id)a3;
- (void)animationControllerTeardownTarget:(id)a3;
- (void)applyScrollingPolicy;
- (void)changeToViewport:(unint64_t)a3 previousCalloutIndex:(unint64_t)a4 contentOffset:(CGPoint)a5 animated:(BOOL)a6;
- (void)control:(id)a3 repWasAdded:(id)a4;
- (void)control:(id)a3 repWillBeRemoved:(id)a4;
- (void)dealloc;
- (void)didExitExpanded;
- (void)didPresentExpanded;
- (void)didUpdateLayer:(id)a3;
- (void)expandedContentHandleDoubleTapZoomDirectlyAtPoint:(CGPoint)a3;
- (void)expandedPanel:(int)a3 willAnimateToVisible:(BOOL)a4 duration:(double)a5;
- (void)expandedPanel:(int)a3 willChangeToVisible:(BOOL)a4;
- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4;
- (void)expandedWillPresentWithController:(id)a3;
- (void)freeTransformDidEnd;
- (void)freeTransformWillBegin;
- (void)handleNavigateCommandWithNumber:(unint64_t)a3;
- (void)handleNavigateNextCommand;
- (void)handleNavigatePreviousCommand;
- (void)interactiveImageCalloutPressed:(id)a3;
- (void)interactiveImageCalloutUpdatedHovering:(id)a3;
- (void)overlayableZoomableCanvasController:(id)a3 willLayoutRep:(id)a4;
- (void)p_adjustScrollViewContentInsets;
- (void)p_invalidateCalloutReps;
- (void)p_setupAsAnimationDestination;
- (void)p_setupBorderAndBackground;
- (void)p_setupImageCropAnimationControllerWithDestinationRep:(id)a3;
- (void)p_setupInitialZoom;
- (void)p_setupMinimumViewScale;
- (void)p_supressRendering:(BOOL)a3;
- (void)p_teardownAsAnimationDestination;
- (void)p_teardownImageCropAnimationControllerWithDestinationRep:(id)a3;
- (void)p_togglePanelDescriptionExpanded;
- (void)p_updateDiagramAnimated:(BOOL)a3 completion:(id)a4;
- (void)p_updateDiagramWithZoom:(double)a3 offset:(CGPoint)a4 animated:(BOOL)a5 previousCalloutIndex:(unint64_t)a6 completion:(id)a7;
- (void)p_updateStageBackgroundLayer;
- (void)p_updateStageBackgroundLayerFromLayout;
- (void)replaceContentsFromRep:(id)a3;
- (void)screenScaleDidChange;
- (void)selectedCalloutIndexUpdatedAnimated:(BOOL)a3;
- (void)setAnimatingCallouts:(BOOL)a3;
- (void)setBorderColor:(CGColor *)a3;
- (void)setCachedImage:(id)a3;
- (void)setCalloutsHidden:(BOOL)a3;
- (void)setCalloutsVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setController:(id)a3;
- (void)setHandlingPress:(BOOL)a3;
- (void)setImageCropAnimationController:(id)a3;
- (void)setPanelDescriptionExpanded:(BOOL)a3;
- (void)setPressableHandler:(id)a3;
- (void)setRotationDuration:(double)a3;
- (void)setSourceOverlayLayer:(id)a3;
- (void)setStageBackgroundImage:(id)a3;
- (void)setStageBackgroundLayer:(id)a3;
- (void)setStageCanvasController:(id)a3;
- (void)setStoredViewportIndex:(unint64_t)a3;
- (void)setTargetViewScale:(double)a3;
- (void)setUseStoredViewportIndex:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)setWantsCachedImage:(BOOL)a3;
- (void)updateDiagramAnimated:(BOOL)a3;
- (void)updateFromLayout;
- (void)updatedHovering;
- (void)viewScaleDidChange;
- (void)viewScrollWillChange;
- (void)viewScrollingEnded;
- (void)widgetInteractionModeChanged;
- (void)willBeRemoved;
- (void)willBeginHandlingGesture:(id)a3;
- (void)willRemoveChildView:(id)a3;
- (void)willReplaceContentsFromRep:(id)a3;
@end

@implementation THWInteractiveImageWidgetRep

- (THWInteractiveImageWidgetRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)THWInteractiveImageWidgetRep;
  v4 = [(THWInteractiveImageWidgetRep *)&v21 initWithLayout:a3 canvas:a4];
  if (v4)
  {
    v4->_freeTransformableHandler = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:]([THWFreeTransformableRepGestureTargetHandler alloc], "initWithFreeTransformableRep:handler:", v4, objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler"));
    v5 = [[THWInteractiveImageWidgetController alloc] initWithLayout:[(THWInteractiveImageWidgetRep *)v4 layout]];
    v4->_controller = v5;
    [(THWInteractiveImageWidgetController *)v5 setDelegate:v4];
    v4->_borderColor = [(CGColor *)[TSUColor clearColor] CGColor];
    v4->_animationPreviousCalloutIndex = 0x7FFFFFFFFFFFFFFFLL;
    id v6 = [(THWInteractiveImageWidgetRep *)v4 layout];
    [v6 stageFrame];
    [v6 rectInRoot:];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    v15 = -[THWOverlayableZoomableCanvasController initWithFrame:documentRoot:delegate:]([THWOverlayableZoomableCanvasController alloc], "initWithFrame:documentRoot:delegate:", objc_msgSend(-[THWInteractiveImageWidgetRep interactiveCanvasController](v4, "interactiveCanvasController"), "documentRoot"), v4, v7, v9, v11, v13);
    v4->_stageCanvasController = v15;
    -[THWOverlayableZoomableCanvasController createLayerHostIfNeededWithFrame:](v15, "createLayerHostIfNeededWithFrame:", v8, v10, v12, v14);
    [(THWOverlayableZoomableCanvasController *)v4->_stageCanvasController setDelegate:v4];
    stageCanvasController = v4->_stageCanvasController;
    [v4 canvas].viewScale;
    -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](stageCanvasController, "setNaturalFrame:scale:", v8, v10, v12, v14, v17);
    [(THWInteractiveImageWidgetRep *)v4 p_setupInitialZoom];
    [(THWInteractiveImageWidgetRep *)v4 p_setupBorderAndBackground];
    [(-[THWInteractiveImageWidgetRep layout](v4, "layout")) setStageCanvasController:v4->_stageCanvasController];
    objc_opt_class();
    [(THWInteractiveImageWidgetRep *)v4 interactiveCanvasController];
    id v18 = [(id)TSUDynamicCast() pressHandlerForPressableReps];
    if (v18)
    {
      v19 = [[THWPressableRepGestureTargetHandler alloc] initWithPressableRep:v4 pressHandler:v18];
      v4->_pressableHandler = v19;
      [(THWPressableRepGestureTargetHandler *)v19 setEnabledOnlyIfWidgetInteractionDisabledOnPage:1];
    }
    [(THWInteractiveImageWidgetRep *)v4 widgetInteractionModeChanged];
    if ([(THWInteractiveImageWidgetRep *)v4 isExpanded])
    {
      v4->_calloutsHidden = 1;
      v4->_wantsCachedImage = 1;
    }
  }
  return v4;
}

- (void)dealloc
{
  self->mAnimationController = 0;
  [(THWInteractiveImageWidgetController *)self->_controller setDelegate:0];

  [(THWImageCropAnimationController *)self->_imageCropAnimationController teardownWrapperLayer];
  self->_imageCropAnimationController = 0;
  [(THWOverlayableZoomableCanvasController *)self->_stageCanvasController setDelegate:0];
  [(THWOverlayableZoomableCanvasController *)self->_stageCanvasController teardownController];
  [(THWOverlayableZoomableCanvasController *)self->_stageCanvasController teardownView];

  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageWidgetRep;
  [(THWInteractiveImageWidgetRep *)&v3 dealloc];
}

- (void)willBeRemoved
{
  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageWidgetRep;
  [(THWInteractiveImageWidgetRep *)&v3 willBeRemoved];
  [(CALayer *)self->_stageBackgroundLayer setDelegate:0];
}

- (CGRect)naturalBoundsForHitTesting
{
  id v2 = [(THWInteractiveImageWidgetRep *)self layout];

  [v2 stageFrame];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)p_createViewIfNeededWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(THWInteractiveImageWidgetRep *)self layout];
  if (self->_stageCanvasController)
  {
    double v9 = v8;
    unsigned int v10 = [self layout].stageVisible;
    if (v10)
    {
      unsigned int v10 = -[THWOverlayableZoomableCanvasController createViewIfNeededWithFrame:](self->_stageCanvasController, "createViewIfNeededWithFrame:", x, y, width, height);
      if (v10)
      {
        [v9 stageCornerRadius];
        [(CALayer *)[(UIView *)[(THWOverlayableZoomableCanvasController *)self->_stageCanvasController view] layer] setCornerRadius:v11];
        [(THWOverlayableZoomableCanvasController *)self->_stageCanvasController setupImmediatePressGesture];
        stageCanvasController = self->_stageCanvasController;
        [self canvas].viewScale;
        -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](stageCanvasController, "setNaturalFrame:scale:", x, y, width, height, v13);
        [(THWInteractiveImageWidgetRep *)self p_setupInitialZoom];
        [(THWInteractiveImageWidgetRep *)self p_setupBorderAndBackground];
        [(THWInteractiveImageWidgetRep *)self p_adjustScrollViewContentInsets];
        [(THWInteractiveImageWidgetRep *)self widgetInteractionModeChanged];
        LOBYTE(v10) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (id)calloutReps
{
  id v3 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [[self layout:0] calloutLayouts];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self->_stageCanvasController scrollContainerICC] repForLayout:*(void *)(*((void *)&v11 + 1) + 8 * (void)v8)];
        if (v9) {
          [v3 addObject:v9];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (void)setCalloutsVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [(THWInteractiveImageWidgetRep *)self calloutReps];
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v11) setVisible:v5 animated:v4];
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
  id v12 = [(THWInteractiveImageWidgetRep *)self p_sidebarRep];
  if (v12) {
    [v12 setVisible:v5 animated:v4];
  }
  else {
    objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "sidebarLayout"), "setHidden:", v5 ^ 1);
  }
}

- (unint64_t)viewportIndex
{
  id v2 = [(THWInteractiveImageWidgetRep *)self controller];

  return [(THWInteractiveImageWidgetController *)v2 calloutIndex];
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (double)zoomDuration
{
  [(THWInteractiveImageWidgetRep *)self rotationDuration];
  if (v3 == 0.0) {
    return 0.5;
  }

  [(THWInteractiveImageWidgetRep *)self rotationDuration];
  return result;
}

- (id)p_imageRep
{
  objc_opt_class();
  -[TSDInteractiveCanvasController repForInfo:](-[THWOverlayableZoomableCanvasController scrollContentICC](self->_stageCanvasController, "scrollContentICC"), "repForInfo:", objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundImageInfo"));

  return (id)TSUDynamicCast();
}

- (void)willReplaceContentsFromRep:(id)a3
{
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  if (v4)
  {
    BOOL v5 = (void *)v4;
    [(THWInteractiveImageWidgetRep *)self setUseStoredViewportIndex:1];
    -[THWInteractiveImageWidgetRep setStoredViewportIndex:](self, "setStoredViewportIndex:", [v5 viewportIndex]);
    objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "setSelectedCalloutIndex:", objc_msgSend(objc_msgSend(v5, "layout"), "selectedCalloutIndex"));
    -[THWInteractiveImageWidgetRep setStageBackgroundImage:](self, "setStageBackgroundImage:", [v5 stageBackgroundImage]);
    if ([(THWInteractiveImageWidgetRep *)self isExpanded])
    {
      id v6 = [v5 p_imageRep];

      self->_cachedImage = 0;
      self->_cachedImage = (TSDImageRepCachedSizedImage *)[v6 newCachedSizedImage];
    }
    else
    {
      id v7 = [(THWInteractiveImageWidgetRep *)self p_imageRep];
      [v7 pushDisableImageSizing];
      id v8 = [v5 viewportIndex];
      if (v8 == (id)[(THWInteractiveImageWidgetController *)self->_controller calloutIndex]
        || (id v9 = objc_msgSend(objc_msgSend(v5, "p_imageRep"), "newCachedSizedImage")) == 0)
      {
        controller = self->_controller;
        id v12 = [v5 viewportIndex];
        [(THWInteractiveImageWidgetController *)controller selectOption:v12 force:1 animated:0];
      }
      else
      {
        uint64_t v10 = v9;
        [v7 useCachedSizedImage:v9];

        -[THWInteractiveImageWidgetController selectOption:force:animated:](self->_controller, "selectOption:force:animated:", [v5 viewportIndex], 1, 0);
        objc_msgSend(objc_msgSend(v7, "interactiveCanvasController"), "layoutIfNeeded");
        [v7 generateSizedImageOnBackgroundThread];
      }
    }
  }
}

- (void)replaceContentsFromRep:(id)a3
{
  objc_opt_class();
  uint64_t v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    BOOL v5 = v4;
    objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "setSelectedCalloutIndex:", objc_msgSend(objc_msgSend(v4, "layout"), "selectedCalloutIndex"));
    [(THWExpandedRepController *)self->_expandedRepController expandedRepControllerInvalidateChildrenInPanel:1 invalidateWPAuto:1];
    -[THWInteractiveImageWidgetController selectOption:force:animated:](self->_controller, "selectOption:force:animated:", [v5 viewportIndex], 1, 0);
  }
  if (![(THWInteractiveImageWidgetRep *)self isExpanded])
  {
    id v6 = [(THWInteractiveImageWidgetRep *)self p_imageRep];
    [v6 popDisableImageSizing];
  }
}

- (void)widgetInteractionModeChanged
{
  if ([(THWInteractiveImageWidgetRep *)self pressableHandler]) {
    BOOL v3 = [(THWPressableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self pressableHandler] widgetInteractionEnabled];
  }
  else {
    BOOL v3 = 1;
  }

  [(THWInteractiveImageWidgetRep *)self setUserInteractionEnabled:v3];
}

- (void)viewScaleDidChange
{
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] scrollContentICC] contentOffset];
  v20.receiver = self;
  v20.super_class = (Class)THWInteractiveImageWidgetRep;
  [(THWInteractiveImageWidgetRep *)&v20 updateFromLayout];
  id v3 = [(THWInteractiveImageWidgetRep *)self layout];
  [self layout].stageFrame;
  [v3 rectInRoot:];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  stageCanvasController = self->_stageCanvasController;
  [self interactiveCanvasController].viewScale;
  -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](stageCanvasController, "setNaturalFrame:scale:", v5, v7, v9, v11, v13);
  [(THWInteractiveImageWidgetRep *)self p_invalidateCalloutReps];
  id v14 = [[-[THWInteractiveImageWidgetRep info](self, "info") calloutAtIndex:[self viewportIndex]]];
  [v14 viewScale];
  TSDMultiplyPointScalar();
  double v16 = v15;
  double v18 = v17;
  [v14 viewScale];
  -[THWInteractiveImageWidgetRep p_updateDiagramWithZoom:offset:animated:previousCalloutIndex:completion:](self, "p_updateDiagramWithZoom:offset:animated:previousCalloutIndex:completion:", 0, [(THWInteractiveImageWidgetRep *)self viewportIndex], 0, v19, v16, v18);
}

- (void)screenScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageWidgetRep;
  [(THWInteractiveImageWidgetRep *)&v3 screenScaleDidChange];
  [(THWOverlayableZoomableCanvasController *)self->_stageCanvasController screenScaleDidChange];
  [self canvas].contentsScale;
  -[CALayer setContentsScale:](self->_stageBackgroundLayer, "setContentsScale:");
  [(THWInteractiveImageWidgetRep *)self setStageBackgroundImage:0];
}

- (void)didUpdateLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWInteractiveImageWidgetRep;
  [(THWInteractiveImageWidgetRep *)&v4 didUpdateLayer:a3];
  [(THWInteractiveImageWidgetRep *)self p_updateStageBackgroundLayer];
}

- (void)p_updateStageBackgroundLayerFromLayout
{
  id v3 = [(THWInteractiveImageWidgetRep *)self layout];
  [self layout].stageFrame;
  [v3 rectInRoot:];
  -[CALayer setPosition:](self->_stageBackgroundLayer, "setPosition:", CGPointZero.x, CGPointZero.y);
  [self canvas].viewScale;
  TSDMultiplySizeScalar();
  TSDRectWithSize();
  TSDRoundedRect();
  stageBackgroundLayer = self->_stageBackgroundLayer;

  -[CALayer setBounds:](stageBackgroundLayer, "setBounds:");
}

- (void)updateFromLayout
{
  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageWidgetRep;
  [(THWInteractiveImageWidgetRep *)&v3 updateFromLayout];
  [(THWInteractiveImageWidgetRep *)self p_updateStageBackgroundLayerFromLayout];
}

- (BOOL)p_isStageBackgroundTransparent
{
  objc_opt_class();
  [self info].backgroundFill
  objc_super v3 = (void *)TSUDynamicCast();
  if (!v3) {
    return 1;
  }
  objc_super v4 = v3;
  if ([v3 fillType]) {
    return 0;
  }
  objc_msgSend(objc_msgSend(v4, "referenceColor"), "alphaComponent");
  return v6 == 0.0;
}

- (void)p_updateStageBackgroundLayer
{
  if (!self->_stageBackgroundLayer)
  {
    objc_super v3 = (CALayer *)objc_alloc_init((Class)CALayer);
    self->_stageBackgroundLayer = v3;
    double y = CGPointZero.y;
    -[CALayer setAnchorPoint:](v3, "setAnchorPoint:", CGPointZero.x, y);
    -[CALayer setPosition:](self->_stageBackgroundLayer, "setPosition:", CGPointZero.x, y);
    [self canvas].contentsScale
    -[CALayer setContentsScale:](self->_stageBackgroundLayer, "setContentsScale:");
    [(CALayer *)self->_stageBackgroundLayer setDelegate:[(THWInteractiveImageWidgetRep *)self interactiveCanvasController]];
    [(THWOverlayableZoomableCanvasController *)self->_stageCanvasController setBackgroundLayer:self->_stageBackgroundLayer];
  }
  [(THWInteractiveImageWidgetRep *)self p_updateStageBackgroundLayerFromLayout];
  objc_opt_class();
  [self info].backgroundFill
  double v5 = (void *)TSUDynamicCast();
  id v6 = 0;
  CGColorRef v7 = 0;
  if (![(THWInteractiveImageWidgetRep *)self p_isStageBackgroundTransparent] && v5)
  {
    if ([v5 fillType])
    {
      stageBackgroundImage = self->_stageBackgroundImage;
      if (!stageBackgroundImage)
      {
        [(CALayer *)self->_stageBackgroundLayer contentsScale];
        objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "stageGeometry"), "frame");
        TSDMultiplySizeScalar();
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_173FF8;
        v11[3] = &unk_45A048;
        v11[4] = v5;
        v11[5] = v9;
        v11[6] = v10;
        [(THWInteractiveImageWidgetRep *)self setStageBackgroundImage:+[TSUImage imageWithSize:drawnUsingBlock:](TSUImage, "imageWithSize:drawnUsingBlock:", v11)];
        stageBackgroundImage = self->_stageBackgroundImage;
      }
      id v6 = [(TSUImage *)stageBackgroundImage CGImage];
      [(CALayer *)self->_stageBackgroundLayer setContentsGravity:kCAGravityResize];
      CGColorRef v7 = 0;
    }
    else
    {
      CGColorRef v7 = (CGColorRef)objc_msgSend(objc_msgSend(v5, "referenceColor"), "CGColor");
      id v6 = 0;
    }
  }
  if (v7 != [(CALayer *)self->_stageBackgroundLayer backgroundColor]) {
    [(CALayer *)self->_stageBackgroundLayer setBackgroundColor:v7];
  }
  if (v6 != [(CALayer *)self->_stageBackgroundLayer contents]) {
    [(CALayer *)self->_stageBackgroundLayer setContents:v6];
  }
}

- (void)addChildViewsToArray:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWInteractiveImageWidgetRep addChildViewsToArray:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/InteractiveImage/THWInteractiveImageWidgetRep.m") lineNumber:587 description:@"This operation must only be performed on the main thread."];
  }
  id v5 = [(THWInteractiveImageWidgetRep *)self layout];
  if (v5)
  {
    id v6 = v5;
    [v5 stageFrame];
    [v6 rectInRoot:];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    -[THWInteractiveImageWidgetRep p_createViewIfNeededWithFrame:](self, "p_createViewIfNeededWithFrame:");
    double v15 = [(THWInteractiveImageWidgetRep *)self stageCanvasController];
    [self canvas].viewScale
    -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](v15, "setNaturalFrame:scale:", v8, v10, v12, v14, v16);
    double v17 = [(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] view];
    if (v17)
    {
      [a3 addObject:v17];
    }
  }
}

- (id)viewControllerForView:(id)a3
{
  objc_super v4 = [(THWInteractiveImageWidgetRep *)self stageCanvasController];
  if ([(THWOverlayableZoomableCanvasController *)v4 view] != a3) {
    return 0;
  }

  return [(THWOverlayableZoomableCanvasController *)v4 viewController];
}

- (int)positionForChildView:(id)a3
{
  return 2;
}

- (void)willRemoveChildView:(id)a3
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWInteractiveImageWidgetRep willRemoveChildView:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/InteractiveImage/THWInteractiveImageWidgetRep.m") lineNumber:645 description:@"This operation must only be performed on the main thread."];
  }
  stageCanvasController = self->_stageCanvasController;
  if (stageCanvasController && [(THWOverlayableZoomableCanvasController *)stageCanvasController view] == a3)
  {
    id v6 = self->_stageCanvasController;
    [(THWOverlayableZoomableCanvasController *)v6 teardownView];
  }
}

- (double)baseViewScale
{
  id v2 = [(THWInteractiveImageWidgetRep *)self layout];

  [v2 baseViewScale];
  return result;
}

- (CGPoint)p_clientScaledContentOffsetFromScrollview
{
  [(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] contentOffset];

  -[THWInteractiveImageWidgetRep p_clientScaledFromScrollScaledPoint:](self, "p_clientScaledFromScrollScaledPoint:");
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)contentOffset
{
  [(THWInteractiveImageWidgetRep *)self p_clientScaledContentOffsetFromScrollview];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  double y = a4.y;
  double x = a4.x;
  [(THWInteractiveImageWidgetRep *)self baseViewScale];
  double v13 = v12;
  double v14 = 0.0;
  if (v7)
  {
    [(THWInteractiveImageWidgetRep *)self zoomDuration];
    double v14 = v15;
  }
  [(THWInteractiveImageWidgetRep *)self rotationDuration];
  if (v16 != 0.0)
  {
    [(THWInteractiveImageWidgetRep *)self rotationDuration];
    double v14 = v17;
  }
  -[THWInteractiveImageWidgetRep p_scrollScaledFromClientScaledPoint:](self, "p_scrollScaledFromClientScaledPoint:", x, y);
  double v19 = v18;
  double v21 = v20;
  v22 = [(THWInteractiveImageWidgetRep *)self stageCanvasController];

  -[THWOverlayableZoomableCanvasController setViewScale:contentOffset:animationDuration:completion:](v22, "setViewScale:contentOffset:animationDuration:completion:", a6, v13 * a3, v19, v21, v14);
}

- (void)addAlternateLayersForChildViewsToArray:(id)a3
{
  double v4 = [(THWOverlayableZoomableCanvasController *)self->_stageCanvasController alternateLayerForView];
  if (v4)
  {
    [a3 addObject:v4];
  }
}

- (void)viewScrollWillChange
{
}

- (void)viewScrollingEnded
{
}

- (BOOL)expandableShouldPreloadExpanded
{
  return 1;
}

- (BOOL)expandedPanelUseDarkAppearance
{
  return 1;
}

- (id)expandedSupportedGestureKinds
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", TSWPImmediatePress, 0);
}

- (THAnimationController)animationController
{
  CGPoint result = self->mAnimationController;
  if (!result)
  {
    double v4 = objc_alloc_init(THAnimationController);
    self->mAnimationController = v4;
    [(THAnimationController *)v4 addObserver:self];
    [(THAnimationController *)self->mAnimationController setSource:self];
    [(THAnimationController *)self->mAnimationController setShadowFadeOutDurationScale:1.0];
    [(THAnimationController *)self->mAnimationController setShadowTransformDurationScale:0.5];
    return self->mAnimationController;
  }
  return result;
}

- (void)animationControllerSetupTarget:(id)a3
{
  objc_opt_class();
  [a3 destination];
  uint64_t v5 = TSUDynamicCast();

  [(THWInteractiveImageWidgetRep *)self p_setupImageCropAnimationControllerWithDestinationRep:v5];
}

- (void)p_teardownImageCropAnimationControllerWithDestinationRep:(id)a3
{
  self->_imageCropAnimationController = 0;
}

- (void)animationControllerTeardownTarget:(id)a3
{
  if (![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress])
  {
    objc_opt_class();
    [a3 destination];
    [(THWInteractiveImageWidgetRep *)self p_teardownImageCropAnimationControllerWithDestinationRep:TSUDynamicCast()];
  }
  [(CALayer *)[(THWInteractiveImageWidgetRep *)self sourceOverlayLayer] setSublayers:0];

  [(THWInteractiveImageWidgetRep *)self setSourceOverlayLayer:0];
}

- (void)animationControllerDidPresent:(id)a3
{
  objc_opt_class();
  [a3 destination];
  uint64_t v5 = (THWInteractiveImageWidgetRep *)TSUDynamicCast();
  id v6 = v5;
  if (v5 != self) {
    [(THWInteractiveImageWidgetRep *)v5 setCalloutsVisible:0 animated:0];
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_174780;
  v7[3] = &unk_456E38;
  v7[4] = v6;
  v7[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)animationControllerDidPresentPostCommit:(id)a3
{
  self->mAnimationController = 0;
}

- (void)animationControllerDidAddContentAnimations:(id)a3 uniformTargetScale:(double)a4
{
  [a3 animationDuration];
  double v8 = v7;
  -[THWImageCropAnimationController addAnimationWithDuration:targetScale:](self->_imageCropAnimationController, "addAnimationWithDuration:targetScale:");
  objc_opt_class();
  [a3 destination];
  if (TSUDynamicCast()) {
    double v9 = a4;
  }
  else {
    double v9 = 1.0;
  }
  imageCropAnimationController = self->_imageCropAnimationController;

  [(THWImageCropAnimationController *)imageCropAnimationController addBackgroundAnimationWithDuration:v8 targetScale:v9];
}

- (CGAffineTransform)freeTransform
{
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGPoint result = (CGAffineTransform *)[(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress];
  if (result)
  {
    CGPoint result = [(THWFreeTransformableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self freeTransformableHandler] ftc];
    if (result)
    {
      CGPoint result = (CGAffineTransform *)[(CGAffineTransform *)result currentTransform];
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
      long long v8 = 0u;
    }
    long long v7 = v9;
    *(_OWORD *)&retstr->a = v8;
    *(_OWORD *)&retstr->c = v7;
    *(_OWORD *)&retstr->tdouble x = v10;
  }
  return result;
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  return 0;
}

- (id)animationLayer
{
  if (![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress]|| (id result = [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self freeTransformableHandler] ftc] freeTransformLayer]) == 0)
  {
    imageCropAnimationController = self->_imageCropAnimationController;
    return [(THWImageCropAnimationController *)imageCropAnimationController wrapperLayer];
  }
  return result;
}

- (id)shadowAnimationLayer
{
  if (![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress])return 0; {
  double v3 = [(THWFreeTransformableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self freeTransformableHandler] ftc];
  }

  return [(THWFreeTransformController *)v3 shadowLayer];
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  return 0;
}

- (void)animatableDestinationSetupTarget:(id)a3
{
  objc_opt_class();
  [(THWExpandedRepController *)self->_expandedRepController expandedRepSourceRep];
  if (!TSUDynamicCast())
  {
    [(THWInteractiveImageWidgetRep *)self p_supressRendering:0];
    [self interactiveCanvasController].layoutIfNeeded;
    [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self->_stageCanvasController scrollContainerICC] layoutIfNeeded];
    double v4 = [(THWOverlayableZoomableCanvasController *)self->_stageCanvasController scrollContentICC];
    [(TSDInteractiveCanvasController *)v4 layoutIfNeeded];
  }
}

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 0;
}

- (id)targetLayer
{
  if ([(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress]&& ![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self freeTransformableHandler] ftc] passedThreshold])
  {
    return 0;
  }

  return [(THWInteractiveImageWidgetRep *)self p_backgroundImageContentLayer];
}

- (CGRect)ftcTargetFrame
{
  if ([(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress])
  {
    [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self freeTransformableHandler] ftc] completionTargetRect];
  }
  else
  {
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isExpanded
{
  id v2 = [(THWInteractiveImageWidgetRep *)self layout];

  return [v2 isExpanded];
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "geometry"), "size");
  return v3 < 660.0 || v2 < 960.0;
}

- (id)shadowPath
{
  if ([(THWInteractiveImageWidgetRep *)self p_isStageBackgroundTransparent])
  {
    if (objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundImageInfo"), "isOpaque"))
    {
      imageCropAnimationController = self->_imageCropAnimationController;
      return [(THWImageCropAnimationController *)imageCropAnimationController sourceShadowPath];
    }
    else
    {
      return 0;
    }
  }
  else
  {
    double v4 = self->_imageCropAnimationController;
    return [(THWImageCropAnimationController *)v4 backgroundShadowPath];
  }
}

- (BOOL)freeTransformUseTracedShadowPath
{
  return [[-[THWInteractiveImageWidgetRep info](self, "info") backgroundImageInfo] isOpaque] ^ 1;
}

- (BOOL)isFreeTransformInProgress
{
  double v2 = [(THWFreeTransformableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self freeTransformableHandler] ftc];

  return [(THWFreeTransformController *)v2 isFreeTransformInProgress];
}

- (void)freeTransformWillBegin
{
  objc_opt_class();
  [(THWExpandedRepController *)self->_expandedRepController expandedRepSourceRep];
  uint64_t v3 = TSUDynamicCast();

  [(THWInteractiveImageWidgetRep *)self p_setupImageCropAnimationControllerWithDestinationRep:v3];
}

- (void)freeTransformDidEnd
{
  objc_opt_class();
  [(THWExpandedRepController *)self->_expandedRepController expandedRepSourceRep];
  uint64_t v3 = TSUDynamicCast();

  [(THWInteractiveImageWidgetRep *)self p_teardownImageCropAnimationControllerWithDestinationRep:v3];
}

- (id)styledRep
{
  objc_opt_class();
  [(THWInteractiveImageWidgetRep *)self p_backgroundImageRep];

  return (id)TSUDynamicCast();
}

- (CGRect)rectForCompletion
{
  id v2 = [(THWInteractiveImageWidgetRep *)self layout];

  [v2 frameInParent];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)p_isExpanding
{
  expandedRepController = self->_expandedRepController;
  if (expandedRepController) {
    LOBYTE(expandedRepController) = [(THWExpandedRepController *)expandedRepController expandedRepControllerState] == 1;
  }
  return (char)expandedRepController;
}

- (void)expandedWillPresentWithController:(id)a3
{
  self->_expandedRepController = (THWExpandedRepController *)a3;
  if ([(THWInteractiveImageWidgetRep *)self p_shouldSuppressRenderingDuringExpansion])
  {
    [(THWInteractiveImageWidgetRep *)self p_supressRendering:1];
  }
}

- (void)p_supressRendering:(BOOL)a3
{
  BOOL v3 = a3;
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self->_stageCanvasController scrollContainerICC] setShouldSuppressRendering:a3 animated:0];
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self->_stageCanvasController scrollContentICC] setShouldSuppressRendering:v3 animated:0];
  id v5 = [(THWInteractiveImageWidgetRep *)self interactiveCanvasController];

  [v5 setShouldSuppressRendering:v3 animated:0];
}

- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  [self layout:a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height];
  [self interactiveCanvasController].layoutIfNeeded;
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] scrollContainerICC] layoutIfNeeded];
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] scrollContentICC] layoutIfNeeded];
  id v5 = [(THWInteractiveImageWidgetRep *)self stageCanvasController];
  id v6 = [(THWInteractiveImageWidgetRep *)self layout];
  [self layout].stageFrame;
  [v6 rectInRoot:];
  -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](v5, "setNaturalFrame:scale:");

  [(THWInteractiveImageWidgetRep *)self updateDiagramAnimated:0];
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(THWInteractiveImageWidgetRep *)self layout];

  return [v4 hasContentForPanel:v3];
}

- (id)expandedChildInfosForPanel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(THWInteractiveImageWidgetRep *)self layout];

  return [v4 infosForPanel:v3];
}

- (id)expandedAdditionalChildLayoutsForPanel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(THWInteractiveImageWidgetRep *)self layout];

  return [v4 additionalLayoutsForPanel:v3];
}

- (double)expandedMinHeightForPanel:(int)a3 withDefault:(double)a4
{
  if (a3 == 2)
  {
    if (objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "hasContentForPanel:", 2)
      && !objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "additionalLayoutsForPanel:", 2), "count"))
    {
      return 0.0;
    }
  }
  else if (a3 == 1 {
         && objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "hasContentForPanel:", 1))
  }
  {
    return 0.0;
  }
  return a4;
}

- (id)expandedLayoutGeometryForLayout:(id)a3 inPanel:(int)a4 withWidth:(double)a5 insets:(UIEdgeInsets)a6
{
  double right = a6.right;
  double left = a6.left;
  long long v10 = (char *)[(id)TSUProtocolCast() tag];
  if (a4 != 2 || v10 != (unsigned char *)&dword_0 + 3) {
    return 0;
  }
  id v11 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:CGPointZero.x, CGPointZero.y, a5 - left - right, 31.0];

  return v11;
}

- (id)expandedRotationAnimationController
{
  id v2 = [[THWInteractiveImageExpandedRotationController alloc] initWithRep:self canvas:[(THWInteractiveImageWidgetRep *)self canvas] stageCanvasController:[(THWInteractiveImageWidgetRep *)self stageCanvasController]];

  return v2;
}

- (BOOL)expandedPanelAllowVisible
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(THWInteractiveImageWidgetRep *)self calloutReps];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) hovering]) {
          return 0;
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  return 1;
}

- (void)updatedHovering
{
  id v2 = [(THWInteractiveImageWidgetRep *)self expandedRepController];

  [(THWExpandedRepController *)v2 expandedRepControllerUpdatePanelVisibility];
}

- (BOOL)canHandleGesture:(id)a3
{
  id v5 = [a3 gestureKind];
  if ([(THWPressableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self pressableHandler] canHandleGesture:a3])
  {
    goto LABEL_2;
  }
  unsigned int v6 = [(THWInteractiveImageWidgetRep *)self userInteractionEnabled];
  if (!v6) {
    return v6;
  }
  if (-[THWFreeTransformableRepGestureTargetHandler canHandleGesture:](-[THWInteractiveImageWidgetRep freeTransformableHandler](self, "freeTransformableHandler"), "canHandleGesture:", a3)|| (objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "isExpanded") & 1) == 0&& (objc_msgSend(v5, "isEqual:", TSDShortTap) & 1) != 0)
  {
LABEL_2:
    LOBYTE(v6) = 1;
  }
  else
  {
    unsigned int v6 = [(THWInteractiveImageWidgetRep *)self p_singleTapResetsToDefaultZoom];
    if (v6)
    {
      unsigned int v6 = [v5 isEqual:TSWPImmediatePress];
      if (v6) {
        LOBYTE(v6) = [(THWInteractiveImageWidgetRep *)self viewportIndex] != 0;
      }
    }
  }
  return v6;
}

- (BOOL)p_singleTapResetsToDefaultZoom
{
  return [self layout].isExpanded ^ 1;
}

- (BOOL)handleGesture:(id)a3
{
  id v5 = [a3 gestureKind];
  if ([(THWPressableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self pressableHandler] canHandleGesture:a3])
  {
    unsigned int v6 = [(THWInteractiveImageWidgetRep *)self pressableHandler];
LABEL_5:
    LOBYTE(v7) = [(THWPressableRepGestureTargetHandler *)v6 handleGesture:a3];
    return v7;
  }
  if ([(THWFreeTransformableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self freeTransformableHandler] canHandleGesture:a3])
  {
    unsigned int v6 = [(THWInteractiveImageWidgetRep *)self freeTransformableHandler];
    goto LABEL_5;
  }
  if ([a3 gestureState] == 2
    && -[THWOverlayableZoomableCanvasController isDragging](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "isDragging")&& [v5 isEqualToString:TSWPImmediatePress])
  {
    objc_opt_class();
    [(id)TSUDynamicCast() cancel];
  }
  if (([v5 isEqual:TSDShortTap] & 1) != 0
    || (unsigned int v7 = [v5 isEqual:TSWPImmediatePress]) != 0)
  {
    if ([a3 gestureState] == 3
      && ![(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] isDragging])
    {
      [self layout].stageFrame;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      [a3 naturalLocationForRep:self];
      v20.double x = v16;
      v20.double y = v17;
      v21.origin.double x = v9;
      v21.origin.double y = v11;
      v21.size.double width = v13;
      v21.size.double height = v15;
      if (CGRectContainsPoint(v21, v20)) {
        [(THWInteractiveImageWidgetController *)self->_controller selectOption:0];
      }
    }
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v5 = [a3 gestureKind];
  if (v5 == (id)TSDFreeTransform)
  {
    unsigned int v6 = [(THWInteractiveImageWidgetRep *)self freeTransformableHandler];
    [(THWFreeTransformableRepGestureTargetHandler *)v6 willBeginHandlingGesture:a3];
  }
}

- (void)p_togglePanelDescriptionExpanded
{
  [(THWInteractiveImageWidgetRep *)self setPanelDescriptionExpanded:[(THWInteractiveImageWidgetRep *)self panelDescriptionExpanded] ^ 1];
  [(THWExpandedRepController *)self->_expandedRepController expandedRepControllerAnimatePanel:1 withCrossFadeContent:1 backgroundLayout:0 duration:0.25];
  expandedRepController = self->_expandedRepController;

  [(THWExpandedRepController *)expandedRepController expandedRepControllerInvalidateChildrenInPanel:1 invalidateWPAuto:1];
}

- (id)expandedPanel:(int)a3 primaryTargetForGesture:(id)a4
{
  if (a3 != 1) {
    return 0;
  }
  v7[7] = v4;
  v7[8] = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_17576C;
  v7[3] = &unk_456DE0;
  v7[4] = self;
  return [[THWTapGestureAction alloc] initWithAction:v7];
}

- (void)handleNavigateNextCommand
{
  id v3 = [self layout].selectedCalloutIndex;
  if (v3 == (char *)objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "calloutCount") - 1) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v3 + 1;
  }
  controller = self->_controller;

  [(THWInteractiveImageWidgetController *)controller selectOption:v4];
}

- (void)handleNavigatePreviousCommand
{
  id v3 = [-[THWInteractiveImageWidgetRep layout](self, "layout") selectedCalloutIndex];
  uint64_t v4 = (char *)[self info].calloutCount;
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v4;
  }
  controller = self->_controller;

  [(THWInteractiveImageWidgetController *)controller selectOption:v5 - 1];
}

- (void)handleNavigateCommandWithNumber:(unint64_t)a3
{
  if ((char *)objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "calloutCount") - 1 >= (char *)a3) {
    unint64_t v5 = a3;
  }
  else {
    unint64_t v5 = 0;
  }
  controller = self->_controller;

  [(THWInteractiveImageWidgetController *)controller selectOption:v5];
}

- (int)expandedAppearance
{
  return 0;
}

- (int)expandedAppearanceForPanel:(int)a3
{
  return 0;
}

- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5
{
  if (a4 == 1 && !self->_panelDescriptionExpanded)
  {
    if ([self layout:a3 with:v5 and:v6].isCompactHeight)return 2; {
    else
    }
      return 5;
  }
  return a5;
}

- (UIEdgeInsets)expandedStackedControlContainerInsetsForPanel:(int)a3 withDefault:(UIEdgeInsets)a4
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  if (a3 == 1)
  {
    if (objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "infosForPanel:", 1), "count"))
    {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (a3 == 2)
  {
    if (objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "additionalLayoutsForPanel:", 2), "count"))
    {
      CGFloat top = 7.0;
      CGFloat bottom = 6.0;
      CGFloat right = 5.0;
      CGFloat left = 5.0;
      goto LABEL_7;
    }
LABEL_6:
    CGFloat top = TSDEdgeInsetsZero[0].f64[0];
    CGFloat left = TSDEdgeInsetsZero[0].f64[1];
    CGFloat bottom = TSDEdgeInsetsZero[1].f64[0];
    CGFloat right = TSDEdgeInsetsZero[1].f64[1];
  }
LABEL_7:
  double v8 = top;
  double v9 = left;
  double v10 = bottom;
  double v11 = right;
  result.CGFloat right = v11;
  result.CGFloat bottom = v10;
  result.CGFloat left = v9;
  result.CGFloat top = v8;
  return result;
}

- (BOOL)expandedShouldCombineBottomAndControlPanels
{
  return 1;
}

- (BOOL)expandedContentAllowDoubleTapZoom
{
  return 1;
}

- (BOOL)expandedPanel:(int)a3 isVisibleWithDefault:(BOOL)a4
{
  if ((a3 - 1) > 1) {
    return a4;
  }
  id v6 = [(THWInteractiveImageWidgetRep *)self layout];
  return [v6 isCombinedPanelVisible];
}

- (void)expandedPanel:(int)a3 willAnimateToVisible:(BOOL)a4 duration:(double)a5
{
  if (a3 == 1) {
    [(THWExpandedRepController *)self->_expandedRepController expandedRepControllerAnimatePanel:*(void *)&a3 withCrossFadeContent:1 backgroundLayout:0 duration:a5];
  }
}

- (void)expandedPanel:(int)a3 willChangeToVisible:(BOOL)a4
{
  if (a3 == 1)
  {
    [self layout].setCaptionPanelVisible:a4;
    expandedRepController = self->_expandedRepController;
    [(THWExpandedRepController *)expandedRepController expandedRepControllerInvalidateChildrenInPanel:1 invalidateWPAuto:0];
  }
}

- (BOOL)expandedContentHandlesDoubleTapZoomDirectly
{
  return 1;
}

- (void)expandedContentHandleDoubleTapZoomDirectlyAtPoint:(CGPoint)a3
{
}

- (BOOL)expandedWantsSingleTapBehavior
{
  if ([(THWInteractiveImageWidgetRep *)self viewportIndex]) {
    return 0;
  }
  uint64_t v4 = [(THWInteractiveImageWidgetRep *)self stageCanvasController];

  return [(THWOverlayableZoomableCanvasController *)v4 isZoomedOut];
}

- (BOOL)overlayableZoomableCanvasController:(id)a3 shouldDisableScrollingAtContentEdgesForScrollView:(id)a4
{
  return ![(THWInteractiveImageWidgetRep *)self isExpanded];
}

- (BOOL)overlayableZoomableCanvasController:(id)a3 shouldDisableScrollingWhenCursorIsHiddenForScrollView:(id)a4
{
  return ![(THWInteractiveImageWidgetRep *)self isExpanded];
}

- (id)documentRootForOverlayableZoomableCanvasController:(id)a3
{
  id v3 = [(THWInteractiveImageWidgetRep *)self interactiveCanvasController];

  return [v3 documentRoot];
}

- (CGSize)sizeOfContentCanvasForOverlayableZoomableCanvasController:(id)a3
{
  id v3 = [(THWInteractiveImageWidgetRep *)self layout];

  [v3 zoomableCanvasSize];
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (id)overlayableZoomableCanvasController:(id)a3 infosToDisplayForContentViewport:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if ([(THWInteractiveImageWidgetRep *)self stageCanvasController] != a3) {
    return 0;
  }
  id v10 = [(THWInteractiveImageWidgetRep *)self layout];

  return [v10 infosForStageContentViewport:x, y, width, height];
}

- (id)infosToDisplayForContainerInOverlayableZoomableCanvasController:(id)a3
{
  if (self->_calloutsHidden) {
    return 0;
  }
  id v4 = [(THWInteractiveImageWidgetRep *)self layout];

  return [v4 infosForContainer];
}

- (id)overlayableZoomableCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  id v6 = [(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] scrollContainerICC];
  [a4 unscaledLocationForICC:v6];
  -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](v6, "hitRep:withGesture:passingTest:", a4, &stru_45A068);
  uint64_t v7 = TSUProtocolCast();
  if (v7) {
    double v8 = (THWInteractiveImageWidgetRep *)v7;
  }
  else {
    double v8 = self;
  }
  if (![(THWPressableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self pressableHandler] canHandleGesture:a4])return v8; {

  }
  return [(THWInteractiveImageWidgetRep *)self pressableHandler];
}

- (void)overlayableZoomableCanvasController:(id)a3 willLayoutRep:(id)a4
{
  id v5 = [a4 info:a3];
  if (v5 == objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundImageInfo"))
  {
    objc_opt_class();
    id v6 = (void *)TSUDynamicCast();
    if (v6)
    {
      uint64_t v7 = v6;
      if (!self->_cachedImage && self->_wantsCachedImage) {
        self->_cachedImage = (TSDImageRepCachedSizedImage *)[v6 newCachedSizedImageWithNaturalSize];
      }
      self->_wantsCachedImage = 0;
      if (self->_cachedImage)
      {
        [v7 useCachedSizedImage:];
        [v7 generateSizedImageOnBackgroundThread];

        self->_cachedImage = 0;
      }
    }
  }
}

- (BOOL)overlayableZoomableCanvasControllerShouldResampleImages:(id)a3
{
  return ![(THWInteractiveImageWidgetRep *)self isExpanded];
}

- (BOOL)overlayableZoomableCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (BOOL)overlayableZoomableCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4
{
  return 0;
}

- (id)additionalGestureTargetsForZoomableCanvasController:(id)a3 gesture:(id)a4
{
  [self interactiveCanvasController:a3 delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v6 = [[self interactiveCanvasController] delegate];
  id v7 = [(THWInteractiveImageWidgetRep *)self interactiveCanvasController];

  return [v6 additionalGestureTargetsForInteractiveCanvasController:v7 gesture:a4];
}

- (BOOL)overlayableZoomableCanvasControllerDeferViewCreation:(id)a3
{
  id v3 = [(THWInteractiveImageWidgetRep *)self interactiveCanvasController];

  return [v3 currentlyScrolling];
}

- (double)overlayableZoomableCanvasControllerContentsScale:(id)a3
{
  id v3 = [[self interactiveCanvasController] canvas];

  [v3 contentsScale];
  return result;
}

- (BOOL)overlayableZoomableCanvasControllerIsRelatedCanvasScrolling:(id)a3
{
  id v3 = [(THWInteractiveImageWidgetRep *)self interactiveCanvasController];

  return [v3 currentlyScrolling];
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    id v5 = (void *)TSUDynamicCast();
    [v5 setTransportControlDelegate:self->_controller];
    controller = self->_controller;
    [(THWInteractiveImageWidgetController *)controller setTransportControlsRep:v5];
  }
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    controller = self->_controller;
    [(THWInteractiveImageWidgetController *)controller setTransportControlsRep:0];
  }
}

- (CGPoint)convertContentPointToUnscaledOverlayPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(THWInteractiveImageWidgetRep *)self stageCanvasController];

  -[THWOverlayableZoomableCanvasController unscaledContainerPointFromUnscaledContentPoint:](v5, "unscaledContainerPointFromUnscaledContentPoint:", x, y);
  result.double y = v7;
  result.double x = v6;
  return result;
}

- (id)calloutInfoForDisplay
{
  id result = [self layout].selectedCalloutIndex;
  if (result)
  {
    id v4 = [[self layout] info];
    id v5 = [self layout].selectedCalloutIndex;
    return [v4 calloutAtIndex:v5];
  }
  return result;
}

- (unint64_t)selectedCalloutIndex
{
  id v2 = [(THWInteractiveImageWidgetRep *)self layout];

  return (unint64_t)[v2 selectedCalloutIndex];
}

- (void)applyScrollingPolicy
{
  BOOL v3 = [(THWInteractiveImageWidgetRep *)self viewportIndex]
    || [self layout].isExpanded;
  id v4 = [(THWInteractiveImageWidgetRep *)self stageCanvasController];

  [(THWOverlayableZoomableCanvasController *)v4 setScrollEnabled:v3];
}

- (CALayer)pressableAnimationLayer
{
  id v2 = [(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] view];

  return [(UIView *)v2 layer];
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (BOOL)wantsPressAnimation
{
  id v2 = [(THWInteractiveImageWidgetRep *)self pressableHandler];

  return [(THWPressableRepGestureTargetHandler *)v2 widgetInteractionDisabledOnPage];
}

- (BOOL)wantsPressAction
{
  if ([(THWInteractiveImageWidgetRep *)self meetsStageDimensionRequirementForExpanded]|| (BOOL v3 = [(THWPressableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self pressableHandler] widgetInteractionDisabledOnPage]))
  {
    LOBYTE(v3) = [(THWInteractiveImageWidgetRep *)self pressableAction] != 0;
  }
  return v3;
}

- (BOOL)p_widgetInteractionDisabledOnPage
{
  id v2 = [(THWInteractiveImageWidgetRep *)self pressableHandler];

  return [(THWPressableRepGestureTargetHandler *)v2 widgetInteractionDisabledOnPage];
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  return [self layout:a3].isExpanded ^ 1;
}

- (int)pressableAction
{
  return 2;
}

- (CGRect)pressableNaturalBounds
{
  id v2 = [(THWInteractiveImageWidgetRep *)self layout];

  [v2 stageFrame];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGAffineTransform)shadowAnimationLayerDestinationTransform:(SEL)a3 uniformTargetScale:(id)a4
{
  long long v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  id v8 = [(THWInteractiveImageWidgetRep *)self shadowAnimationLayer];
  if (self->_imageCropAnimationController) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    id v10 = v8;
    [v8 bounds];
    unsigned int v11 = [(THWInteractiveImageWidgetRep *)self p_isStageBackgroundTransparent];
    imageCropAnimationController = self->_imageCropAnimationController;
    if (v11)
    {
      [(THWImageCropAnimationController *)imageCropAnimationController sourceContentsRect];
      [(THWImageCropAnimationController *)self->_imageCropAnimationController targetContentsRect];
      TSDMultiplyRectBySize();
      double v47 = v14;
      double v48 = v13;
      TSDMultiplyRectBySize();
    }
    else
    {
      [(THWImageCropAnimationController *)imageCropAnimationController backgroundSourceFrame];
      [v10 convertRect:-[self->_imageCropAnimationController wrapperLayer] fromLayer:v20, v21, v22, v23];
      double v47 = v25;
      double v48 = v24;
      [(THWImageCropAnimationController *)self->_imageCropAnimationController backgroundTargetFrame];
      TSDMultiplyRectScalar();
      [v10 convertRect:-[self _imageCropAnimationController] wrapperLayer:v26, v27, v28, v29];
    }
    uint64_t v46 = v15;
    double v18 = v16;
    double v19 = v17;
    TSDCenterOfRect();
    TSDCenterOfRect();
    TSDRectWithSize();
    TSDCenterOfRect();
    TSDSubtractPoints();
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    TSDSubtractPoints();
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGAffineTransformMakeTranslation(retstr, v31, v33);
    CGAffineTransformMakeScale(&t2, v18 / v48, v19 / v47);
    long long v38 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v38;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v53, &t1, &t2);
    long long v39 = *(_OWORD *)&v53.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v53.a;
    *(_OWORD *)&retstr->c = v39;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v53.tx;
    CGAffineTransformMakeTranslation(&v50, v35, v37);
    long long v40 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v40;
    *(_OWORD *)&t1.tdouble x = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v53, &t1, &v50);
    long long v41 = *(_OWORD *)&v53.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v53.a;
    *(_OWORD *)&retstr->c = v41;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v53.tx;
  }
  v42 = [(THWFreeTransformableRepGestureTargetHandler *)self->_freeTransformableHandler ftc];
  if (v42) {
    [(THWFreeTransformController *)v42 originalShadowTransform];
  }
  else {
    memset(&v49, 0, sizeof(v49));
  }
  long long v43 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v43;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&retstr->tx;
  CGRect result = CGAffineTransformConcat(&v53, &t1, &v49);
  long long v45 = *(_OWORD *)&v53.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v53.a;
  *(_OWORD *)&retstr->c = v45;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v53.tx;
  return result;
}

- (void)p_setupAsAnimationDestination
{
}

- (void)p_teardownAsAnimationDestination
{
}

- (CGRect)p_stageBackgroundFrameRelativeToImageContentLayer
{
  id v3 = [(THWInteractiveImageWidgetRep *)self p_backgroundImageContentLayer];
  [(CALayer *)self->_stageBackgroundLayer bounds];
  stageBackgroundLayer = self->_stageBackgroundLayer;

  [v3 convertRect:stageBackgroundLayer];
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (void)p_setupImageCropAnimationControllerWithDestinationRep:(id)a3
{
  id v5 = [(THWInteractiveImageWidgetRep *)self p_backgroundImageContentLayer];
  [a3 setCalloutsVisible:0 animated:0];
  [(THWInteractiveImageWidgetRep *)self setCalloutsVisible:0 animated:0];
  if (v5 && !self->_imageCropAnimationController)
  {
    [(THWInteractiveImageWidgetRep *)self p_backgroundImageContentsRect];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    if (a3)
    {
      [a3 p_backgroundImageContentsRect];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
    }
    else
    {
      double v23 = 1.0;
      double v19 = 0.0;
      double v21 = 0.0;
      double v25 = 1.0;
    }
    CGFloat v31 = [[THWImageCropAnimationController alloc] initWithImageContentLayer:v5];
    self->_imageCropAnimationController = v31;
    -[THWImageCropAnimationController setSourceContentsRect:](v31, "setSourceContentsRect:", v11, v13, v15, v17);
    [self layout].stageCornerRadius
    double v33 = v32;
    [self canvas].viewScale;
    [(THWImageCropAnimationController *)self->_imageCropAnimationController setSourceCornerRadius:v33 * v34];
    -[THWImageCropAnimationController setTargetContentsRect:](self->_imageCropAnimationController, "setTargetContentsRect:", v19, v21, v23, v25);
    objc_msgSend(objc_msgSend(a3, "layout"), "stageCornerRadius");
    double v36 = v35;
    objc_msgSend(objc_msgSend(a3, "canvas"), "viewScale");
    [(THWImageCropAnimationController *)self->_imageCropAnimationController setTargetCornerRadius:v36 * v37];
    [(THWImageCropAnimationController *)self->_imageCropAnimationController setCropDurationScale:0.5];
    [(THWImageCropAnimationController *)self->_imageCropAnimationController setBackgroundDurationScale:0.5];
    [(THWImageCropAnimationController *)self->_imageCropAnimationController setCornerRadiusDurationScale:0.5];
    [(THWImageCropAnimationController *)self->_imageCropAnimationController setupWrapperLayer];
    long long v38 = [(THWImageCropAnimationController *)self->_imageCropAnimationController wrapperLayer];
    [(CALayer *)self->_stageBackgroundLayer bounds];
    -[CALayer convertRect:fromLayer:](v38, "convertRect:fromLayer:", self->_stageBackgroundLayer);
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    [(THWOverlayableZoomableCanvasController *)self->_stageCanvasController setBackgroundLayer:0];
    [(THWImageCropAnimationController *)self->_imageCropAnimationController setBackgroundLayer:self->_stageBackgroundLayer];
    -[CALayer setFrame:](self->_stageBackgroundLayer, "setFrame:", v40, v42, v44, v46);
    [(CALayer *)self->_stageBackgroundLayer removeAllAnimations];
    [a3 p_setupAsAnimationDestination];
    double v47 = v40;
    double v48 = v42;
    double v49 = v44;
    double v50 = v46;
    if (a3)
    {
      [a3 p_stageBackgroundFrameRelativeToImageContentLayer];
      double v47 = v51;
      double v48 = v52;
      double v49 = v53;
      double v50 = v54;
    }
    -[THWImageCropAnimationController setBackgroundSourceFrame:](self->_imageCropAnimationController, "setBackgroundSourceFrame:", v40, v42, v44, v46);
    imageCropAnimationController = self->_imageCropAnimationController;
    double v26 = v47;
    double v27 = v48;
    double v28 = v49;
    double v29 = v50;
  }
  else
  {
    if (!a3) {
      return;
    }
    [a3 p_backgroundImageContentsRect];
    if (a3 == self)
    {
      [(THWImageCropAnimationController *)self->_imageCropAnimationController sourceContentsRect];
      -[THWImageCropAnimationController setTargetContentsRect:](self->_imageCropAnimationController, "setTargetContentsRect:");
      [(THWImageCropAnimationController *)self->_imageCropAnimationController sourceCornerRadius];
    }
    else
    {
      -[THWImageCropAnimationController setTargetContentsRect:](self->_imageCropAnimationController, "setTargetContentsRect:");
      objc_msgSend(objc_msgSend(a3, "layout"), "stageCornerRadius");
      double v7 = v6;
      objc_msgSend(objc_msgSend(a3, "canvas"), "viewScale");
      double v9 = v7 * v8;
    }
    [(THWImageCropAnimationController *)self->_imageCropAnimationController setTargetCornerRadius:v9];
    [a3 p_stageBackgroundFrameRelativeToImageContentLayer];
    imageCropAnimationController = self->_imageCropAnimationController;
  }

  -[THWImageCropAnimationController setBackgroundTargetFrame:](imageCropAnimationController, "setBackgroundTargetFrame:", v26, v27, v28, v29);
}

- (CGPoint)p_scrollScaledFromClientScaledPoint:(CGPoint)a3
{
  [(THWInteractiveImageWidgetRep *)self baseViewScale];

  TSDMultiplyPointScalar();
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)p_clientScaledFromScrollScaledPoint:(CGPoint)a3
{
  [(THWInteractiveImageWidgetRep *)self baseViewScale];

  TSDMultiplyPointScalar();
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (UIEdgeInsets)p_insetsWithViewScale:(double)a3 viewportBounds:(CGRect)a4
{
  CGFloat width = a4.size.width;
  CGFloat height = a4.size.height;
  CGFloat y = a4.origin.y;
  CGFloat rect = a4.origin.x;
  -[THWInteractiveImageWidgetRep p_imageFrameWithViewScale:](self, "p_imageFrameWithViewScale:");
  double v43 = v6;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(THWInteractiveImageWidgetRep *)self p_calloutFrameWithViewScale:a3];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(THWInteractiveImageWidgetRep *)self p_diagramFrameWithViewScale:a3];
  double v49 = v22;
  double v50 = v21;
  double v47 = v24;
  double v48 = v23;
  -[THWInteractiveImageWidgetRep p_bufferedHullFrameForImageFrame:calloutFrame:](self, "p_bufferedHullFrameForImageFrame:calloutFrame:", v43, v8, v10, v12, v14, v16, v18, v20);
  CGFloat x = v53.origin.x;
  CGFloat v26 = v53.origin.y;
  CGFloat v27 = v53.size.width;
  CGFloat v28 = v53.size.height;
  double v29 = CGRectGetWidth(v53);
  v54.origin.CGFloat x = rect;
  v54.origin.CGFloat y = y;
  v54.size.CGFloat width = width;
  v54.size.CGFloat height = height;
  if (v29 >= CGRectGetWidth(v54))
  {
    v58.origin.CGFloat x = x;
    v58.origin.CGFloat y = v26;
    v58.size.CGFloat width = v27;
    v58.size.CGFloat height = v28;
    double MinX = CGRectGetMinX(v58);
    v59.origin.CGFloat x = rect;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    double v31 = fmin(MinX, CGRectGetMinX(v59));
    v60.origin.CGFloat x = x;
    v60.origin.CGFloat y = v26;
    v60.size.CGFloat width = v27;
    v60.size.CGFloat height = v28;
    double v32 = CGRectGetMaxX(v60) - v31;
  }
  else
  {
    v55.origin.CGFloat x = x;
    v55.origin.CGFloat y = v26;
    v55.size.CGFloat width = v27;
    v55.size.CGFloat height = v28;
    double MidX = CGRectGetMidX(v55);
    v56.origin.CGFloat x = rect;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = width;
    v56.size.CGFloat height = height;
    double v31 = MidX + CGRectGetWidth(v56) * -0.5;
    v57.origin.CGFloat x = rect;
    v57.origin.CGFloat y = y;
    v57.size.CGFloat width = width;
    v57.size.CGFloat height = height;
    double v32 = CGRectGetWidth(v57);
  }
  v61.origin.CGFloat x = v31;
  v61.origin.CGFloat y = v26;
  v61.size.CGFloat width = v32;
  v61.size.CGFloat height = v28;
  double v34 = CGRectGetHeight(v61);
  v62.origin.CGFloat x = rect;
  v62.origin.CGFloat y = y;
  v62.size.CGFloat width = width;
  v62.size.CGFloat height = height;
  if (v34 >= CGRectGetHeight(v62))
  {
    v66.origin.CGFloat x = v31;
    v66.origin.CGFloat y = v26;
    v66.size.CGFloat width = v32;
    v66.size.CGFloat height = v28;
    double MinY = CGRectGetMinY(v66);
    v67.origin.CGFloat x = rect;
    v67.origin.CGFloat y = y;
    v67.size.CGFloat width = width;
    v67.size.CGFloat height = height;
    double v36 = fmin(MinY, CGRectGetMinY(v67));
    v68.origin.CGFloat x = v31;
    v68.origin.CGFloat y = v26;
    v68.size.CGFloat width = v32;
    v68.size.CGFloat height = v28;
    double v37 = CGRectGetMaxY(v68) - v36;
  }
  else
  {
    v63.origin.CGFloat x = v31;
    v63.origin.CGFloat y = v26;
    v63.size.CGFloat width = v32;
    v63.size.CGFloat height = v28;
    double MidY = CGRectGetMidY(v63);
    v64.origin.CGFloat x = rect;
    v64.origin.CGFloat y = y;
    v64.size.CGFloat width = width;
    v64.size.CGFloat height = height;
    double v36 = MidY + CGRectGetHeight(v64) * -0.5;
    v65.origin.CGFloat x = rect;
    v65.origin.CGFloat y = y;
    v65.size.CGFloat width = width;
    v65.size.CGFloat height = height;
    double v37 = CGRectGetHeight(v65);
  }

  -[THWInteractiveImageWidgetRep p_insetsForInnerFrame:inOuterFrame:](self, "p_insetsForInnerFrame:inOuterFrame:", v31, v36, v32, v37, v50, v49, v48, v47);
  result.CGFloat right = v42;
  result.CGFloat bottom = v41;
  result.CGFloat left = v40;
  result.CGFloat top = v39;
  return result;
}

- (double)p_maxCalloutViewScale
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [[self info:0] calloutEnumerator];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) viewScale];
        double v6 = fmax(v6, v8);
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }
  double result = 1.0;
  if (v6 > 0.0) {
    return v6;
  }
  return result;
}

- (CGRect)p_expandedViewportFrameInPortalRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "stageGeometry"), "frame");
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double v14 = THScaleNeededToFitSizeInSize(v10, v12, width, height);
  double v15 = THRectCenterRectInRect(v7, v9, v11, v13, x, y, width, height);

  double v19 = THRectMultiplyRectCenteredScalar(v15, v16, v17, v18, v14);
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGPoint)p_wingOffsetForPortalRect:(CGRect)a3
{
  -[THWInteractiveImageWidgetRep p_expandedViewportFrameInPortalRect:](self, "p_expandedViewportFrameInPortalRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  TSDSubtractPoints();
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (id)p_backgroundImageRep
{
  double v3 = [(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] scrollContentICC];
  id v4 = [[self info] backgroundImageInfo];

  return [(TSDInteractiveCanvasController *)v3 repForInfo:v4];
}

- (id)p_backgroundImageContentLayer
{
  objc_opt_class();
  [(THWInteractiveImageWidgetRep *)self p_backgroundImageRep];
  double v3 = (void *)TSUDynamicCast();

  return [v3 contentsLayer];
}

- (CGRect)p_backgroundImageContentsRect
{
  id v3 = [(THWInteractiveImageWidgetRep *)self p_backgroundImageContentLayer];
  if (v3)
  {
    id v4 = v3;
    [(THWInteractiveImageWidgetRep *)self p_portalFrame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [v4 frame];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v29.origin.CGFloat x = v6;
    v29.origin.CGFloat y = v8;
    v29.size.double width = v10;
    v29.size.double height = v12;
    v31.origin.CGFloat x = v14;
    v31.origin.CGFloat y = v16;
    v31.size.double width = v18;
    v31.size.double height = v20;
    CGRectIntersection(v29, v31);
    TSDSubtractPoints();
    TSDRectWithOriginAndSize();
    double v22 = v21 / v18;
    double v24 = v23 / v20;
    double v26 = v25 / v18;
    double v28 = v27 / v20;
  }
  else
  {
    double v26 = 1.0;
    double v22 = 0.0;
    double v24 = 0.0;
    double v28 = 1.0;
  }
  result.size.double height = v28;
  result.size.double width = v26;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v22;
  return result;
}

- (void)p_setupBorderAndBackground
{
  id v3 = [(THWInteractiveImageWidgetRep *)self info];
  id v4 = [(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] layer];
  [self info].stageCornerRadius;
  -[CALayer setCornerRadius:](v4, "setCornerRadius:");
  objc_opt_class();
  objc_msgSend(objc_msgSend(v3, "viewportStyle"), "valueForProperty:", 517);
  double v5 = (void *)TSUDynamicCast();
  if (v5)
  {
    CGFloat v6 = v5;
    [v5 width];
    -[CALayer setBorderWidth:](v4, "setBorderWidth:");
    -[CALayer setBorderColor:](v4, "setBorderColor:", objc_msgSend(objc_msgSend(v6, "color"), "CGColor"));
    -[THWInteractiveImageWidgetRep setBorderColor:](self, "setBorderColor:", objc_msgSend(objc_msgSend(v6, "color"), "CGColor"));
  }
  [self info].stageCornerRadius;
  double v8 = v7;
  double v9 = [(UIView *)[(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] view] layer];

  [(CALayer *)v9 setCornerRadius:v8];
}

- (void)didExitExpanded
{
  id v3 = [(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] layer];
  id v4 = [(THWInteractiveImageWidgetRep *)self borderColor];

  [(CALayer *)v3 setBorderColor:v4];
}

- (void)didPresentExpanded
{
  -[[-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController") layer] setBorderColor:[+[TSUColor clearColor](TSUColor, "clearColor") CGColor]];
  [self interactiveCanvasController].shouldSuppressRendering = 0;
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self->_stageCanvasController scrollContainerICC] setShouldSuppressRendering:0 animated:0];
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self->_stageCanvasController scrollContentICC] setShouldSuppressRendering:0 animated:0];
  self->_calloutsHidden = 0;
  [(THWOverlayableZoomableCanvasController *)self->_stageCanvasController updateContainerInfosToDisplay];
  id v3 = [(THWOverlayableZoomableCanvasController *)self->_stageCanvasController scrollContainerICC];

  [(TSDInteractiveCanvasController *)v3 layoutIfNeeded];
}

- (CGRect)p_imageFrame
{
  objc_msgSend(objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundImageInfo"), "geometry"), "boundsBeforeRotation");
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(THWInteractiveImageWidgetRep *)self stageCanvasController];
  if (v11) {
    [(THWOverlayableZoomableCanvasController *)v11 contentViewTransform];
  }
  else {
    memset(&v12, 0, sizeof(v12));
  }
  v13.origin.CGFloat x = v4;
  v13.origin.CGFloat y = v6;
  v13.size.double width = v8;
  v13.size.double height = v10;
  return CGRectApplyAffineTransform(v13, &v12);
}

- (CGRect)p_imageFrameWithViewScale:(double)a3
{
  memset(&v5, 0, sizeof(v5));
  CGAffineTransformMakeScale(&v5, a3, a3);
  objc_msgSend(objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "backgroundImageInfo"), "geometry"), "boundsBeforeRotation");
  CGAffineTransform v4 = v5;
  return CGRectApplyAffineTransform(v6, &v4);
}

- (CGRect)p_diagramFrame
{
  [self info].backgroundSize;
  CGFloat v4 = v3;
  [self info].backgroundSize;
  CGFloat v6 = v5;
  double v7 = [(THWInteractiveImageWidgetRep *)self stageCanvasController];
  if (v7) {
    [(THWOverlayableZoomableCanvasController *)v7 contentViewTransform];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  v9.origin.CGFloat x = 0.0;
  v9.origin.CGFloat y = 0.0;
  v9.size.double width = v4;
  v9.size.double height = v6;
  return CGRectApplyAffineTransform(v9, &v8);
}

- (CGRect)p_diagramFrameWithViewScale:(double)a3
{
  memset(&v8, 0, sizeof(v8));
  CGAffineTransformMakeScale(&v8, a3, a3);
  [self info].backgroundSize
  CGFloat v5 = v4;
  [self info].backgroundSize;
  v9.size.double height = v6;
  CGAffineTransform v7 = v8;
  v9.origin.CGFloat x = 0.0;
  v9.origin.CGFloat y = 0.0;
  v9.size.double width = v5;
  return CGRectApplyAffineTransform(v9, &v7);
}

- (CGRect)p_calloutFrameWithViewScale:(double)a3
{
  id v4 = [(THWInteractiveImageWidgetRep *)self layout];

  [v4 calloutFrameWithViewScale:a3];
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (CGRect)p_viewportFrame
{
  [(THWInteractiveImageWidgetRep *)self p_portalFrame];

  -[THWInteractiveImageWidgetRep p_expandedViewportFrameInPortalRect:](self, "p_expandedViewportFrameInPortalRect:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CGRect)p_portalFrame
{
  [(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] contentOffset];
  double v4 = v3;
  [(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] contentOffset];
  double v6 = v5;
  [(UIView *)[(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] view] bounds];
  double v8 = v7;
  [(UIView *)[(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] view] bounds];
  double v10 = v4;
  double v11 = v6;
  double v12 = v8;
  result.size.double height = v9;
  result.size.double width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (CGRect)p_bufferedHullFrameForImageFrame:(CGRect)a3 calloutFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v30 = a3.origin.x;
  CGFloat v31 = a3.origin.y;
  CGRect v32 = CGRectUnion(a3, a4);
  double v24 = v32.origin.y;
  double v25 = v32.origin.x;
  double v23 = v32.size.width;
  double v26 = v32.size.height;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  double v29 = 0.0;
  double v10 = 0.0;
  if (CGRectGetWidth(v32) > 0.0)
  {
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v33);
    v34.origin.CGFloat x = v30;
    v34.origin.CGFloat y = v31;
    v34.size.CGFloat width = v9;
    v34.size.CGFloat height = v8;
    if (MinX >= CGRectGetMinX(v34)) {
      double v10 = 0.0;
    }
    else {
      double v10 = 30.0;
    }
  }
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  if (CGRectGetHeight(v35) > 0.0)
  {
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v36);
    v37.origin.CGFloat x = v30;
    v37.origin.CGFloat y = v31;
    v37.size.CGFloat width = v9;
    v37.size.CGFloat height = v8;
    BOOL v13 = MinY < CGRectGetMinY(v37);
    double v14 = 0.0;
    if (v13) {
      double v14 = 30.0;
    }
    double v29 = v14;
  }
  CGFloat v27 = v9;
  CGFloat v28 = v8;
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  double v15 = 0.0;
  double v16 = 0.0;
  if (CGRectGetWidth(v38) > 0.0)
  {
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v39);
    v40.origin.CGFloat x = v30;
    v40.origin.CGFloat y = v31;
    v40.size.CGFloat width = v27;
    v40.size.CGFloat height = v28;
    if (MaxX <= CGRectGetMaxX(v40)) {
      double v16 = 0.0;
    }
    else {
      double v16 = 30.0;
    }
  }
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  if (CGRectGetHeight(v41) > 0.0)
  {
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v42);
    v43.origin.CGFloat x = v30;
    v43.origin.CGFloat y = v31;
    v43.size.CGFloat width = v27;
    v43.size.CGFloat height = v28;
    if (MaxY <= CGRectGetMaxY(v43)) {
      double v15 = 0.0;
    }
    else {
      double v15 = 30.0;
    }
  }
  double v19 = v25 - v10;
  double v20 = v24 - v29;
  double v21 = v23 + v10 + v16;
  double v22 = v26 + v29 + v15;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (UIEdgeInsets)p_insetsForInnerFrame:(CGRect)a3 inOuterFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v7 = a3.size.height;
  CGFloat v8 = a3.size.width;
  CGFloat v9 = a3.origin.y;
  CGFloat v10 = a3.origin.x;
  CGFloat v21 = a4.size.width;
  double MinY = CGRectGetMinY(a4);
  v24.origin.CGFloat x = v10;
  v24.origin.CGFloat y = v9;
  v24.size.CGFloat width = v8;
  v24.size.CGFloat height = v7;
  double v23 = MinY - CGRectGetMinY(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v25);
  v26.origin.CGFloat x = v10;
  v26.origin.CGFloat y = v9;
  v26.size.CGFloat width = v8;
  v26.size.CGFloat height = v7;
  double v22 = MinX - CGRectGetMinX(v26);
  v27.origin.CGFloat x = v10;
  v27.origin.CGFloat y = v9;
  v27.size.CGFloat width = v8;
  v27.size.CGFloat height = v7;
  double MaxY = CGRectGetMaxY(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = v21;
  v28.size.CGFloat height = height;
  double v14 = MaxY - CGRectGetMaxY(v28);
  v29.origin.CGFloat x = v10;
  v29.origin.CGFloat y = v9;
  v29.size.CGFloat width = v8;
  v29.size.CGFloat height = v7;
  double MaxX = CGRectGetMaxX(v29);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = v21;
  v30.size.CGFloat height = height;
  double v16 = MaxX - CGRectGetMaxX(v30);
  double v18 = v22;
  double v17 = v23;
  double v19 = v14;
  result.CGFloat right = v16;
  result.CGFloat bottom = v19;
  result.CGFloat left = v18;
  result.CGFloat top = v17;
  return result;
}

- (void)p_setupMinimumViewScale
{
  objc_opt_class();
  [(THWInteractiveImageWidgetRep *)self info];
  double v3 = (void *)TSUDynamicCast();
  double v4 = (char *)[v3 calloutCount];
  if (v4)
  {
    double v5 = v4;
    double v6 = 0;
    double v7 = 0.0;
    do
    {
      objc_msgSend(objc_msgSend(v3, "calloutAtIndex:", v6), "viewScale");
      if (v7 >= v8) {
        double v9 = v8;
      }
      else {
        double v9 = v7;
      }
      if (v7 == 0.0) {
        double v7 = v8;
      }
      else {
        double v7 = v9;
      }
      ++v6;
    }
    while (v5 != v6);
  }
  else
  {
    double v7 = 0.0;
  }
  [(THWInteractiveImageWidgetRep *)self baseViewScale];
  double v11 = v7 * v10;
  if (v11 > 0.0)
  {
    id v12 = [[-[TSDInteractiveCanvasController canvasView](-[THWOverlayableZoomableCanvasController scrollContentICC](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "scrollContentICC"), "canvasView") canvasLayer];
    [v12 setMinimumPinchViewScale:v11];
  }
}

- (void)p_setupInitialZoom
{
  objc_opt_class();
  [(THWInteractiveImageWidgetRep *)self info];
  double v3 = (void *)TSUDynamicCast();
  if ([(THWInteractiveImageWidgetRep *)self useStoredViewportIndex])
  {
    [(THWInteractiveImageWidgetController *)self->_controller selectOption:[(THWInteractiveImageWidgetRep *)self storedViewportIndex] force:1 animated:0];
  }
  else
  {
    id v4 = [v3 calloutAtIndex:[self viewportIndex]];
    [v4 viewScale];
    double v6 = v5;
    [v4 contentOffset];
    -[THWInteractiveImageWidgetRep p_updateDiagramWithZoom:offset:animated:previousCalloutIndex:completion:](self, "p_updateDiagramWithZoom:offset:animated:previousCalloutIndex:completion:", 0, [(THWInteractiveImageWidgetRep *)self viewportIndex], 0, v6, v7, v8);
  }
  [(THWInteractiveImageWidgetRep *)self applyScrollingPolicy];

  [(THWInteractiveImageWidgetRep *)self p_setupMinimumViewScale];
}

- (void)p_adjustScrollViewContentInsets
{
  [(THWInteractiveImageWidgetRep *)self p_portalFrame];
  [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] scrollContentICC] viewScale];
  -[THWInteractiveImageWidgetRep p_insetsWithViewScale:viewportBounds:](self, "p_insetsWithViewScale:viewportBounds:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(THWInteractiveImageWidgetRep *)self stageCanvasController];

  -[THWOverlayableZoomableCanvasController setContentInset:](v11, "setContentInset:", v4, v6, v8, v10);
}

- (void)p_invalidateCalloutReps
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [self layout:0 calloutLayouts];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      double v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) invalidateFrame];
        double v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)p_updateDiagramWithZoom:(double)a3 offset:(CGPoint)a4 animated:(BOOL)a5 previousCalloutIndex:(unint64_t)a6 completion:(id)a7
{
  -[THWInteractiveImageWidgetRep setTargetViewScale:](self, "setTargetViewScale:");
  TSDRoundedPoint();
  double v13 = v12;
  double v15 = v14;
  [(THWInteractiveImageWidgetRep *)self baseViewScale];
  double v17 = v16 * a3;
  -[THWInteractiveImageWidgetRep p_scrollScaledFromClientScaledPoint:](self, "p_scrollScaledFromClientScaledPoint:", v13, v15);
  double v20 = v18;
  double v21 = v19;
  if (a5)
  {
    self->_animationPreviousCalloutIndeCGFloat x = a6;
    double v22 = [(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] scrollContainerICC];
    -[THWInteractiveImageWidgetRep setAnimatingCallouts:](self, "setAnimatingCallouts:", 1, _NSConcreteStackBlock, 3221225472, sub_177E84, &unk_45A090, self, v22, a7, a6);
    [v22 trackingController].pushDisableUpdates;
    objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep interactiveCanvasController](self, "interactiveCanvasController"), "trackingController"), "pushDisableUpdates");
    [(-[TSDInteractiveCanvasController trackingController](-[THWOverlayableZoomableCanvasController scrollContentICC](-[THWInteractiveImageWidgetRep stageCanvasController](self, "stageCanvasController"), "scrollContentICC"), "trackingController")) pushDisableUpdates];
    +[CATransaction begin];
    [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self->_stageCanvasController scrollContentICC] beginAnimations:@"view-scale" context:0];
    [(TSDInteractiveCanvasController *)v22 beginAnimations:@"callout-bounds" context:0];
    [(THWInteractiveImageWidgetRep *)self zoomDuration];
    -[TSDInteractiveCanvasController setAnimationDuration:](v22, "setAnimationDuration:");
    [(TSDInteractiveCanvasController *)v22 setAnimationUseRepFiltering:1];
    [self layout setViewScale:1 contentOffset:v17 animated:v20];
    -[THWInteractiveImageWidgetRep setViewScale:contentOffset:animated:completion:](self, "setViewScale:contentOffset:animated:completion:", 1, &v24, a3, v13, v15);
    [(THWInteractiveImageWidgetRep *)self p_invalidateCalloutReps];
    objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "sidebarLayout"), "updateCallout:", -[THWInteractiveImageWidgetRep calloutInfoForDisplay](self, "calloutInfoForDisplay"));
    [(TSDInteractiveCanvasController *)v22 layoutIfNeeded];
    [(TSDInteractiveCanvasController *)v22 commitAnimations];
    [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self->_stageCanvasController scrollContentICC] commitAnimations];
    [(THWInteractiveImageWidgetRep *)self setAnimatingCallouts:0];
    +[CATransaction commit];
    self->_animationPreviousCalloutIndeCGFloat x = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    [self layout].setViewScale:contentOffset:animated:0, v17, v18, v19];
    -[THWInteractiveImageWidgetRep setViewScale:contentOffset:animated:completion:](self, "setViewScale:contentOffset:animated:completion:", 0, 0, a3, v13, v15);
    [(THWInteractiveImageWidgetRep *)self p_invalidateCalloutReps];
    objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "sidebarLayout"), "updateCallout:", -[THWInteractiveImageWidgetRep calloutInfoForDisplay](self, "calloutInfoForDisplay"));
    objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetRep layout](self, "layout"), "sidebarLayout"), "clearPreviousCallout");
    [(THWInteractiveImageWidgetRep *)self p_adjustScrollViewContentInsets];
    if (a7)
    {
      double v23 = (void (*)(id, uint64_t))*((void *)a7 + 2);
      v23(a7, 1);
    }
  }
}

- (id)p_sidebarRep
{
  objc_opt_class();
  -[THWOverlayableZoomableCanvasController scrollContainerICC](self->_stageCanvasController, "scrollContainerICC") repForLayout:[self layout] sidebarLayout];

  return (id)TSUDynamicCast();
}

- (void)p_updateDiagramAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  objc_opt_class();
  [(THWInteractiveImageWidgetRep *)self info];
  id v7 = [TSUDynamicCast calloutAtIndex:[self viewportIndex]];
  [v7 viewScale];
  double v9 = v8;
  [v7 contentOffset];
  double v11 = v10;
  double v13 = v12;
  unint64_t v14 = [(THWInteractiveImageWidgetRep *)self viewportIndex];

  -[THWInteractiveImageWidgetRep p_updateDiagramWithZoom:offset:animated:previousCalloutIndex:completion:](self, "p_updateDiagramWithZoom:offset:animated:previousCalloutIndex:completion:", v5, v14, a4, v9, v11, v13);
}

- (void)updateDiagramAnimated:(BOOL)a3
{
}

- (void)changeToViewport:(unint64_t)a3 previousCalloutIndex:(unint64_t)a4 contentOffset:(CGPoint)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = [[self info] calloutAtIndex:a3];
  [(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] setScrollEnabled:0];
  [self layout updateSelectedCallout:v9];
  [v9 viewScale];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1781A0;
  v10[3] = &unk_457140;
  v10[4] = self;
  -[THWInteractiveImageWidgetRep p_updateDiagramWithZoom:offset:animated:previousCalloutIndex:completion:](self, "p_updateDiagramWithZoom:offset:animated:previousCalloutIndex:completion:", v6, a4, v10);
}

- (void)selectedCalloutIndexUpdatedAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(THWInteractiveImageWidgetRep *)self setPanelDescriptionExpanded:0];
  if (v3)
  {
    expandedRepController = self->_expandedRepController;
    [(THWInteractiveImageWidgetRep *)self zoomDuration];
    -[THWExpandedRepController expandedRepControllerAnimatePanel:withCrossFadeContent:backgroundLayout:duration:](expandedRepController, "expandedRepControllerAnimatePanel:withCrossFadeContent:backgroundLayout:duration:", 1, 1, 0);
  }
  BOOL v6 = self->_expandedRepController;

  [(THWExpandedRepController *)v6 expandedRepControllerInvalidateChildrenInPanel:1 invalidateWPAuto:1];
}

- (BOOL)userInteractionEnabled
{
  id v2 = [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] scrollContainerICC] canvasView];

  return [v2 isUserInteractionEnabled];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  if (a3)
  {
    if ([(THWInteractiveImageWidgetRep *)self pressableHandler]) {
      BOOL v4 = [(THWPressableRepGestureTargetHandler *)[(THWInteractiveImageWidgetRep *)self pressableHandler] widgetInteractionEnabled];
    }
    else {
      BOOL v4 = 1;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  id v5 = [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)[(THWInteractiveImageWidgetRep *)self stageCanvasController] scrollContainerICC] canvasView];

  [v5 setUserInteractionEnabled:v4];
}

- (void)interactiveImageCalloutUpdatedHovering:(id)a3
{
}

- (CGPoint)interactiveImageCallout:(id)a3 convertContentPointToUnscaledOverlayPoint:(CGPoint)a4
{
  -[THWInteractiveImageWidgetRep convertContentPointToUnscaledOverlayPoint:](self, "convertContentPointToUnscaledOverlayPoint:", a3, a4.x, a4.y);
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (BOOL)interactiveImageCalloutIsAnimating:(id)a3
{
  return [(THWInteractiveImageWidgetRep *)self animatingCallouts];
}

- (void)interactiveImageCalloutPressed:(id)a3
{
  id v4 = objc_msgSend(-[THWInteractiveImageWidgetRep info](self, "info"), "indexOfCallout:", objc_msgSend(objc_msgSend(a3, "layout"), "calloutInfo"));
  controller = self->_controller;

  [(THWInteractiveImageWidgetController *)controller selectOption:v4];
}

- (BOOL)interactiveImageCalloutIsScrollViewDragging:(id)a3
{
  id v3 = [(TSDInteractiveCanvasController *)[(THWOverlayableZoomableCanvasController *)self->_stageCanvasController scrollContentICC] canvasView];

  return [v3 isAncestorScrollViewDragging];
}

- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler
{
  return self->_freeTransformableHandler;
}

- (BOOL)handlingPress
{
  return self->_handlingPress;
}

- (void)setHandlingPress:(BOOL)a3
{
  self->_handlingPress = a3;
}

- (BOOL)tracksScore
{
  return self->_tracksScore;
}

- (THWOverlayableZoomableCanvasController)stageCanvasController
{
  return self->_stageCanvasController;
}

- (void)setStageCanvasController:(id)a3
{
}

- (BOOL)animatingCallouts
{
  return self->_animatingCallouts;
}

- (void)setAnimatingCallouts:(BOOL)a3
{
  self->_animatingCallouts = a3;
}

- (THWInteractiveImageWidgetController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (double)targetViewScale
{
  return self->_targetViewScale;
}

- (void)setTargetViewScale:(double)a3
{
  self->_targetViewScale = a3;
}

- (CALayer)sourceOverlayLayer
{
  return self->_sourceOverlayLayer;
}

- (void)setSourceOverlayLayer:(id)a3
{
}

- (BOOL)useStoredViewportIndex
{
  return self->_useStoredViewportIndex;
}

- (void)setUseStoredViewportIndex:(BOOL)a3
{
  self->_useStoredViewportIndeCGFloat x = a3;
}

- (unint64_t)storedViewportIndex
{
  return self->_storedViewportIndex;
}

- (void)setStoredViewportIndex:(unint64_t)a3
{
  self->_storedViewportIndeCGFloat x = a3;
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  return self->_pressableHandler;
}

- (void)setPressableHandler:(id)a3
{
}

- (THWImageCropAnimationController)imageCropAnimationController
{
  return self->_imageCropAnimationController;
}

- (void)setImageCropAnimationController:(id)a3
{
}

- (THWExpandedRepController)expandedRepController
{
  return self->_expandedRepController;
}

- (double)rotationDuration
{
  return self->_rotationDuration;
}

- (void)setRotationDuration:(double)a3
{
  self->_rotationDuration = a3;
}

- (CGColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(CGColor *)a3
{
  self->_borderColor = a3;
}

- (BOOL)calloutsHidden
{
  return self->_calloutsHidden;
}

- (void)setCalloutsHidden:(BOOL)a3
{
  self->_calloutsHidden = a3;
}

- (TSDImageRepCachedSizedImage)cachedImage
{
  return self->_cachedImage;
}

- (void)setCachedImage:(id)a3
{
}

- (BOOL)wantsCachedImage
{
  return self->_wantsCachedImage;
}

- (void)setWantsCachedImage:(BOOL)a3
{
  self->_wantsCachedImage = a3;
}

- (CALayer)stageBackgroundLayer
{
  return self->_stageBackgroundLayer;
}

- (void)setStageBackgroundLayer:(id)a3
{
}

- (TSUImage)stageBackgroundImage
{
  return self->_stageBackgroundImage;
}

- (void)setStageBackgroundImage:(id)a3
{
}

- (BOOL)panelDescriptionExpanded
{
  return self->_panelDescriptionExpanded;
}

- (void)setPanelDescriptionExpanded:(BOOL)a3
{
  self->_panelDescriptionExpanded = a3;
}

@end