@interface THWGalleryRep
- (BCProgressTrackingRepTracker)progressTracker;
- (BOOL)allowSelectionPopoverForPagedCanvasController:(id)a3;
- (BOOL)buttonControlAdjustImageWhenHighlighted:(id)a3;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)control:(id)a3 isInteractionEnabledForRep:(id)a4;
- (BOOL)expandableShouldPreloadExpanded;
- (BOOL)expandedAllowFreeTransform;
- (BOOL)expandedHasContentForPanel:(int)a3;
- (BOOL)expandedIsRelatedCanvasScrolling;
- (BOOL)expandedShouldCombineBottomAndControlPanels;
- (BOOL)freeTransformUseTracedShadowPath;
- (BOOL)handleGesture:(id)a3;
- (BOOL)handlingPress;
- (BOOL)isExpanded;
- (BOOL)isFreeTransformInProgress;
- (BOOL)meetsStageDimensionRequirementForExpanded;
- (BOOL)p_canMoveToNextPage;
- (BOOL)p_canMoveToPreviousPage;
- (BOOL)p_isExpanding;
- (BOOL)p_moveToNextPage;
- (BOOL)p_moveToPreviousPage;
- (BOOL)p_shouldPageOnGesture:(id)a3 toLeft:(BOOL *)a4 toRight:(BOOL *)a5;
- (BOOL)p_shouldSuppressRenderingDuringExpansion;
- (BOOL)p_supportZoom;
- (BOOL)pagedCanvasController:(id)a3 allowsEditMenuForRep:(id)a4;
- (BOOL)pagedCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5;
- (BOOL)pagedCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4;
- (BOOL)pagedCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5;
- (BOOL)pagedCanvasController:(id)a3 shouldDisableScrollingAtContentEdgesForScrollView:(id)a4;
- (BOOL)pagedCanvasController:(id)a3 shouldDisableScrollingWhenCursorIsHiddenForScrollView:(id)a4;
- (BOOL)pagedCanvasControllerDeferViewCreation:(id)a3;
- (BOOL)pagedCanvasControllerIsRelatedCanvasScrolling:(id)a3;
- (BOOL)pagedCanvasControllerRestrictVisibleToRenderedContent:(id)a3;
- (BOOL)panelDescriptionExpanded;
- (BOOL)shouldAnimateTargetLayer:(id)a3;
- (BOOL)shouldFadeInTargetLayer:(id)a3;
- (BOOL)shouldFadeOutAnimationLayer:(id)a3;
- (BOOL)shouldRecognizePressOnRep:(id)a3;
- (BOOL)tracksScore;
- (BOOL)wantsPressAction;
- (BOOL)wantsPressAnimation;
- (BOOL)widgetInteractionAllowOnPageForCompact;
- (BOOL)zoomableCanvasController:(id)a3 allowsEditMenuForRep:(id)a4;
- (BOOL)zoomableCanvasControllerIsRelatedCanvasScrolling:(id)a3;
- (CALayer)pressableAnimationLayer;
- (CALayer)pressableAnimationShadowLayer;
- (CGAffineTransform)freeTransform;
- (CGAffineTransform)shadowAnimationLayerDestinationTransform:(SEL)a3 uniformTargetScale:(id)a4;
- (CGRect)ftcTargetFrame;
- (CGRect)p_contentsRectForItem:(id)a3;
- (CGRect)rectForCompletion;
- (CGRect)resizeOriginalLayoutFrame;
- (CGSize)sizeOfCanvasForZoomableCanvasController:(id)a3;
- (NSMutableSet)progressSet;
- (THAnimationController)animationController;
- (THWExpandedRepController)expandedRepController;
- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler;
- (THWGalleryRep)initWithLayout:(id)a3 canvas:(id)a4;
- (THWImageCropAnimationController)imageCropAnimationController;
- (THWPagedCanvasController)stageCanvasController;
- (THWPagedCanvasController)thumbnailTrackCanvasController;
- (THWPressableRepGestureTargetHandler)pressableHandler;
- (UIEdgeInsets)expandedStackedControlContainerInsetsForPanel:(int)a3 withDefault:(UIEdgeInsets)a4;
- (__CTFont)pageControlCreateFont:(id)a3;
- (double)expandedLeftRightInsetForTextLayout:(id)a3 inPanel:(int)a4;
- (double)expandedMinHeightForPanel:(int)a3 withDefault:(double)result;
- (double)expandedVerticalPaddingAfterForLayout:(id)a3 inPanel:(int)a4;
- (double)p_expandedPaddingAfterCaption;
- (double)p_integralScaledThumbnailHighlightWidth;
- (double)pagedCanvasController:(id)a3 adjustScale:(double)a4 andFrame:(CGRect *)a5;
- (double)pagedCanvasControllerContentsScale:(id)a3;
- (double)pagedCanvasControllerVerticalOverflow:(id)a3;
- (double)resizeOriginalViewScale;
- (double)zoomableCanvasControllerContentsScale:(id)a3;
- (id)animationLayer;
- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5;
- (id)currentItem;
- (id)expandedAdditionalChildLayoutsForPanel:(int)a3;
- (id)expandedChildInfosForPanel:(int)a3;
- (id)expandedLayoutGeometryForLayout:(id)a3 inPanel:(int)a4 withWidth:(double)a5 insets:(UIEdgeInsets)a6;
- (id)expandedPanel:(int)a3 primaryTargetForGesture:(id)a4;
- (id)expandedRotationAnimationController;
- (id)expandedZoomableInteractiveCanvasController;
- (id)hostICC;
- (id)infosToDisplayForContainerInZoomableCanvasController:(id)a3;
- (id)p_currentImageContentLayer;
- (id)p_currentImageRep;
- (id)p_highlightLayerForThumbnailSize:(CGSize)a3;
- (id)p_imageRepForItem:(id)a3;
- (id)p_itemAtIndex:(unint64_t)a3;
- (id)p_itemForZoomableCanvasController:(id)a3;
- (id)p_layerForItem:(id)a3;
- (id)p_zoomableCanvasControlRepForItemIndex:(unint64_t)a3;
- (id)p_zoomableCanvasControllerForItem:(id)a3;
- (id)p_zoomableCanvasControllerForItemIndex:(unint64_t)a3;
- (id)pageControl:(id)a3 layerForState:(int)a4;
- (id)pageControl:(id)a3 layerForState:(int)a4 pageIndex:(unint64_t)a5;
- (id)pageControlTextColor:(id)a3;
- (id)pagedCanvasController:(id)a3 infosToDisplayForPageRange:(_NSRange)a4;
- (id)pagedCanvasController:(id)a3 primaryTargetForGesture:(id)a4;
- (id)pagedCanvasController:(id)a3 renderedPageIndexSetFromReps:(id)a4;
- (id)shadowAnimationLayer;
- (id)shadowPath;
- (id)targetLayer;
- (id)zoomableCanvasController:(id)a3 infosToDisplayForViewport:(CGRect)a4;
- (int)expandedAppearance;
- (int)expandedAppearanceForPanel:(int)a3;
- (int)positionForChildView:(id)a3;
- (int)pressableAction;
- (unint64_t)currentPage;
- (unint64_t)hitTestOptions;
- (unint64_t)p_itemIndexForZoomableCanvasController:(id)a3;
- (unint64_t)pageCountForPagedCanvasController:(id)a3;
- (unsigned)expandedAlignmentForLayout:(id)a3 inPanel:(int)a4;
- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5;
- (void)animationControllerDidAddContentAnimations:(id)a3 uniformTargetScale:(double)a4;
- (void)animationControllerDidPresent:(id)a3;
- (void)animationControllerSetupTarget:(id)a3;
- (void)animationControllerTeardownTarget:(id)a3;
- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4;
- (void)buttonControlInteractionDidEnd:(id)a3;
- (void)buttonControlInteractionWillStart:(id)a3;
- (void)buttonControlWasPressed:(id)a3;
- (void)control:(id)a3 repWasAdded:(id)a4;
- (void)control:(id)a3 repWillBeRemoved:(id)a4;
- (void)dealloc;
- (void)didPresentExpanded;
- (void)didPresentExpandedPostCommit;
- (void)expandedContentHandleDoubleTapZoomDirectlyAtPoint:(CGPoint)a3;
- (void)expandedDidEndWidgetLayoutFrameResize;
- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4;
- (void)expandedWillPresentWithController:(id)a3;
- (void)expandedWillStartWidgetLayoutFrameResize:(CGRect)a3;
- (void)freeTransformDidEnd;
- (void)freeTransformWillBegin;
- (void)handleNavigateNextCommand;
- (void)handleNavigatePreviousCommand;
- (void)p_goToPage:(unint64_t)a3;
- (void)p_rasterizeCanvases:(BOOL)a3;
- (void)p_relaxMinimizeInfosNextFrame;
- (void)p_resetViewScaleForItemsExcept:(id)a3;
- (void)p_setupImageCropAnimationControllerWithDestinationRep:(id)a3;
- (void)p_toggleCurrentItemZoomableWithStageRelativeTouch:(CGPoint)a3;
- (void)p_togglePanelDescriptionExpanded;
- (void)p_updateMinMaxViewScaleForItem:(id)a3 forceMinScale:(BOOL)a4;
- (void)p_updateStageCornerRadius;
- (void)p_updateToPageIndex:(unint64_t)a3 usingCachedImagedFromRep:(id)a4;
- (void)p_updateUserInteractionForController:(id)a3;
- (void)pageControl:(id)a3 didChangeInteractivelyFromPageIndex:(unint64_t)a4 toPageIndex:(unint64_t)a5;
- (void)pagedCanvasController:(id)a3 customizeLayerHost:(id)a4;
- (void)pagedCanvasController:(id)a3 didScrollToPageIndex:(unint64_t)a4;
- (void)pagedCanvasController:(id)a3 mostVisiblePageChangedToPageIndex:(unint64_t)a4;
- (void)replaceContentsFromRep:(id)a3;
- (void)screenScaleDidChange;
- (void)setHandlingPress:(BOOL)a3;
- (void)setPanelDescriptionExpanded:(BOOL)a3;
- (void)setProgressSet:(id)a3;
- (void)setResizeOriginalLayoutFrame:(CGRect)a3;
- (void)setResizeOriginalViewScale:(double)a3;
- (void)viewScaleDidChange;
- (void)viewScrollWillChange;
- (void)viewScrollingEnded;
- (void)willBeginHandlingGesture:(id)a3;
- (void)willReplaceContentsFromRep:(id)a3;
- (void)zoomableCanvasControllerCustomizeLayerHost:(id)a3;
@end

@implementation THWGalleryRep

- (THWGalleryRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THWGalleryRep;
  v4 = [(THWGalleryRep *)&v7 initWithLayout:a3 canvas:a4];
  if (v4)
  {
    objc_opt_class();
    [(THWGalleryRep *)v4 interactiveCanvasController];
    id v5 = [(id)TSUDynamicCast() pressHandlerForPressableReps];
    v4->_currentPage = 0x7FFFFFFFFFFFFFFFLL;
    if (v5) {
      v4->_pressableHandler = [[THWPressableRepGestureTargetHandler alloc] initWithPressableRep:v4 pressHandler:v5];
    }
    if ([(THWGalleryRep *)v4 isExpanded]) {
      [(-[THWGalleryRep hostICC](v4, "hostICC")) delegate];
    }
    else {
      [(THWGalleryRep *)v4 interactiveCanvasController];
    }
    v4->_progressTracker = (BCProgressTrackingRepTracker *)TSUProtocolCast();
    v4->_progressSet = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    if (objc_msgSend(objc_msgSend(-[THWGalleryRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler")) {
      v4->_freeTransformableHandler = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:]([THWFreeTransformableRepGestureTargetHandler alloc], "initWithFreeTransformableRep:handler:", v4, objc_msgSend(objc_msgSend(-[THWGalleryRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler"));
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWGalleryRep;
  [(THWGalleryRep *)&v3 dealloc];
}

- (BOOL)p_supportZoom
{
  id v2 = [(THWGalleryRep *)self layout];

  return [v2 useZoom];
}

- (void)screenScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)THWGalleryRep;
  [(THWGalleryRep *)&v3 screenScaleDidChange];
  [self canvas].contentsScale;
  -[CAShapeLayer setContentsScale:](self->_thumbnailHighlightLayer, "setContentsScale:");
}

- (double)p_integralScaledThumbnailHighlightWidth
{
  [self canvas].viewScale;
  return round(v2 * 4.0);
}

- (id)p_highlightLayerForThumbnailSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (!self->_thumbnailHighlightLayer)
  {
    self->_thumbnailHighlightLayer = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
    [(CAShapeLayer *)self->_thumbnailHighlightLayer setDelegate:+[THNoAnimationLayerDelegate sharedInstance]];
    -[CAShapeLayer setAnchorPoint:](self->_thumbnailHighlightLayer, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
    [(CAShapeLayer *)self->_thumbnailHighlightLayer setFillColor:[+[TSUColor colorWithRed:1.0 green:0.796078431 blue:0.211764706 alpha:1.0] CGColor]];
    [(CAShapeLayer *)self->_thumbnailHighlightLayer setFillRule:kCAFillRuleEvenOdd];
    [self canvas].contentsScale;
    -[CAShapeLayer setContentsScale:](self->_thumbnailHighlightLayer, "setContentsScale:");
  }
  [(THWGalleryRep *)self p_integralScaledThumbnailHighlightWidth];
  double v7 = v6;
  double v8 = floor(width);
  double v9 = floor(height);
  double v10 = v8 + v6 * 2.0;
  double v11 = v9 + v6 * 2.0;
  [(CAShapeLayer *)self->_thumbnailHighlightLayer bounds];
  if (v13 != v10 || v12 != v11)
  {
    Mutable = CGPathCreateMutable();
    v17.origin.x = v7;
    v17.origin.y = v7;
    v17.size.double width = v8;
    v17.size.double height = v9;
    CGPathAddRect(Mutable, 0, v17);
    v18.origin.x = 0.0;
    v18.origin.y = 0.0;
    v18.size.double width = v8 + v7 * 2.0;
    v18.size.double height = v9 + v7 * 2.0;
    CGPathAddRect(Mutable, 0, v18);
    [(CAShapeLayer *)self->_thumbnailHighlightLayer setPath:Mutable];
    CGPathRelease(Mutable);
    -[CAShapeLayer setBounds:](self->_thumbnailHighlightLayer, "setBounds:", 0.0, 0.0, v8 + v7 * 2.0, v9 + v7 * 2.0);
  }
  return self->_thumbnailHighlightLayer;
}

- (unint64_t)currentPage
{
  if (self->_currentPage != 0x7FFFFFFFFFFFFFFFLL) {
    return self->_currentPage;
  }
  id v2 = [[self layout] pageControl];

  return (unint64_t)[v2 currentPage];
}

- (void)viewScaleDidChange
{
  [(THWGalleryRep *)self p_updateStageCornerRadius];
  [(THWGalleryRep *)self p_updateUserInteractionForController:self->_stageCanvasController];
  thumbnailTrackCanvasController = self->_thumbnailTrackCanvasController;

  [(THWGalleryRep *)self p_updateUserInteractionForController:thumbnailTrackCanvasController];
}

- (void)p_updateStageCornerRadius
{
  [self layout].stageCornerRadius;
  double v4 = v3;
  [self canvas].viewScale;
  double v6 = v4 * v5;
  id v7 = [[-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController") layerHost] clippingLayer];

  [v7 setCornerRadius:v6];
}

- (BOOL)p_shouldPageOnGesture:(id)a3 toLeft:(BOOL *)a4 toRight:(BOOL *)a5
{
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  return 0;
}

- (void)p_goToPage:(unint64_t)a3
{
  if ([self pageCountForPagedCanvasController:self->_stageCanvasController] <= a3)[[TSUAssertionHandler currentHandler] handleFailureInFunction:@"-[THWGalleryRep p_goToPage:]" file:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Gallery/THWGalleryRep.m" lineNumber:334 description:@"page index is out of bounds: %lu", a3]; {
  unint64_t v5 = [(THWPagedCanvasController *)self->_stageCanvasController pageIndex];
  }
  if (v5 != a3)
  {
    unint64_t v6 = v5 >= a3 ? v5 - a3 : a3 - v5;
    [(THWPagedCanvasController *)self->_stageCanvasController setMinimizeInfoChange:1];
    [(THWPagedCanvasController *)self->_stageCanvasController setPageIndex:a3 animated:v6 < 2];
    if (v6 >= 2)
    {
      [self layout].updateCurrentItemIndex:a3;
      [(THWExpandedRepController *)self->_expandedRepController expandedRepControllerInvalidateChildrenInPanel:1 invalidateWPAuto:0];
      [(THWGalleryRep *)self p_relaxMinimizeInfosNextFrame];
    }
  }
}

- (BOOL)p_canMoveToNextPage
{
  double v3 = (char *)[(THWPagedCanvasController *)self->_stageCanvasController pageIndex] + 1;
  return v3 < (char *)[(THWGalleryRep *)self pageCountForPagedCanvasController:self->_stageCanvasController];
}

- (BOOL)p_moveToNextPage
{
  BOOL v3 = [(THWGalleryRep *)self p_canMoveToNextPage];
  if (v3) {
    [(THWGalleryRep *)self p_goToPage:(char *)[(THWPagedCanvasController *)self->_stageCanvasController pageIndex] + 1];
  }
  return v3;
}

- (BOOL)p_canMoveToPreviousPage
{
  return [(THWPagedCanvasController *)self->_stageCanvasController pageIndex] != 0;
}

- (BOOL)p_moveToPreviousPage
{
  BOOL v3 = [(THWGalleryRep *)self p_canMoveToPreviousPage];
  if (v3) {
    [(THWGalleryRep *)self p_goToPage:(char *)[(THWPagedCanvasController *)self->_stageCanvasController pageIndex] - 1];
  }
  return v3;
}

- (int)positionForChildView:(id)a3
{
  return 2;
}

- (unint64_t)hitTestOptions
{
  return 4;
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  switch((unint64_t)[a3 tag])
  {
    case 0uLL:

      self->_stageCanvasController = 0;
      objc_opt_class();
      self->_stageCanvasController = (THWPagedCanvasController *)[(id)TSUDynamicCast() pagedCanvasController];
      [self layout].stageCornerRadius
      if (v8 <= 0.0) {
        id v9 = 0;
      }
      else {
        id v9 = [[self interactiveCanvasController] currentlyScrolling];
      }
      [(THWPagedCanvasController *)self->_stageCanvasController setRasterize:v9];
      [(THWPagedCanvasController *)self->_stageCanvasController setMinimizeInfoChange:1];
      stageCanvasController = self->_stageCanvasController;
      goto LABEL_15;
    case 1uLL:

      self->_thumbnailTrackCanvasController = 0;
      objc_opt_class();
      v14 = (THWPagedCanvasController *)[(id)TSUDynamicCast() pagedCanvasController];
      self->_thumbnailTrackCanvasController = v14;
      [(THWPagedCanvasController *)v14 setDelegate:self];
      thumbnailTrackCanvasController = self->_thumbnailTrackCanvasController;
      [(THWPagedCanvasController *)thumbnailTrackCanvasController setDisableThreadedLayoutAndRenderDuringAnimation:0];
      break;
    case 3uLL:
    case 4uLL:
      objc_opt_class();
      unint64_t v6 = (void *)TSUDynamicCast();
      [v6 setDelegate:self];
      [v6 setPageDirectlyToIndex:0];
      id v7 = [v6 layout];
      [v7 setSpacing:9.0];
      break;
    case 5uLL:
      objc_opt_class();
      stageCanvasController = (void *)TSUDynamicCast();
LABEL_15:
      [stageCanvasController setDelegate:self];
      break;
    case 7uLL:
      objc_opt_class();
      double v10 = (void *)TSUDynamicCast();
      objc_msgSend(objc_msgSend(v10, "zoomableCanvasController"), "setInstanceData:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "index")));
      objc_msgSend(objc_msgSend(v10, "zoomableCanvasController"), "setDelegate:", self);
      id v11 = objc_msgSend(objc_msgSend(v10, "zoomableCanvasController"), "interactiveCanvasController");
      id v12 = [a3 index];
      BOOL v13 = v12 == (id)[(THWPagedCanvasController *)self->_stageCanvasController pageIndex]
         && [(THWGalleryRep *)self p_shouldSuppressRenderingDuringExpansion];
      [v11 setShouldSuppressRendering:v13 animated:0];
      break;
    default:
      return;
  }
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  if ([a3 tag] == (char *)&dword_4 + 3)
  {
    objc_opt_class();
    id v4 = [(id)TSUDynamicCast() zoomableCanvasController];
    [v4 setDelegate:0];
  }
}

- (BOOL)control:(id)a3 isInteractionEnabledForRep:(id)a4
{
  if (![(THWGalleryRep *)self pressableHandler]) {
    return 1;
  }
  unint64_t v5 = [(THWGalleryRep *)self pressableHandler];

  return [(THWPressableRepGestureTargetHandler *)v5 widgetInteractionEnabled];
}

- (BOOL)pagedCanvasController:(id)a3 shouldDisableScrollingAtContentEdgesForScrollView:(id)a4
{
  return ![(THWGalleryRep *)self isExpanded];
}

- (BOOL)pagedCanvasController:(id)a3 shouldDisableScrollingWhenCursorIsHiddenForScrollView:(id)a4
{
  return ![(THWGalleryRep *)self isExpanded];
}

- (unint64_t)pageCountForPagedCanvasController:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self->_stageCanvasController == a3)
  {
    id v4 = [(THWGalleryRep *)self layout];
    return (unint64_t)[v4 numberOfStagePages];
  }
  else
  {
    if (self->_thumbnailTrackCanvasController != a3) {
      return 0;
    }
    id v5 = [(THWGalleryRep *)self layout];
    return (unint64_t)[v5 numberOfThumbnailTrackPages];
  }
}

- (id)pagedCanvasController:(id)a3 infosToDisplayForPageRange:(_NSRange)a4
{
  if (!a3) {
    return 0;
  }
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (self->_stageCanvasController == a3)
  {
    id v7 = [(THWGalleryRep *)self layout];
    return [v7 infosForStagePages:location length];
  }
  else
  {
    if (self->_thumbnailTrackCanvasController != a3) {
      return 0;
    }
    id v8 = [(THWGalleryRep *)self layout];
    return [v8 infosForThumbnailTrackPages:location length:length];
  }
}

- (void)pagedCanvasController:(id)a3 mostVisiblePageChangedToPageIndex:(unint64_t)a4
{
  if (a3 && self->_stageCanvasController == a3)
  {
    expandedRepController = self->_expandedRepController;
    if (expandedRepController) {
      [(THWExpandedRepController *)expandedRepController expandedRepControllerAnimatePanel:1 withCrossFadeContent:0 backgroundLayout:1 duration:0.15];
    }
    else {
      [self.interactiveCanvasController forceBackgroundLayout];
    }
    [self layout].updateCurrentItemIndex:a4;
    [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)self->_thumbnailTrackCanvasController interactiveCanvasController] forceBackgroundLayout];
    objc_msgSend(objc_msgSend(-[THWGalleryRep layout](self, "layout"), "pageControl"), "setCurrentPage:", a4);
    thumbnailTrackCanvasController = self->_thumbnailTrackCanvasController;
    [(THWPagedCanvasController *)thumbnailTrackCanvasController invalidateLayers];
  }
}

- (void)pagedCanvasController:(id)a3 didScrollToPageIndex:(unint64_t)a4
{
  if (a3)
  {
    id v7 = [(THWGalleryRep *)self layout];
    id v8 = v7;
    if (self->_stageCanvasController == a3)
    {
      [(THWGalleryRep *)self p_relaxMinimizeInfosNextFrame];
      [v8 updateCurrentItemIndex:a4];
      [(THWExpandedRepController *)self->_expandedRepController expandedRepControllerInvalidateChildrenInPanel:1 invalidateWPAuto:0];
      if (self->_thumbnailTrackCanvasController)
      {
        -[THWPagedCanvasController setPageIndex:](self->_thumbnailTrackCanvasController, "setPageIndex:", [v8 thumbnailPageIndexForItemIndex:a4]);
        [(THWPagedCanvasController *)self->_thumbnailTrackCanvasController invalidateLayers];
      }
      id v9 = [(THWGalleryRep *)self currentItem];
      [(THWGalleryRep *)self p_resetViewScaleForItemsExcept:v9];
    }
    else if (self->_thumbnailTrackCanvasController == a3)
    {
      id v10 = [v7 thumbnailPageControl];
      [v10 setCurrentPage:a4];
    }
  }
}

- (id)pagedCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  if (*((id *)self + 40) != a3) {
    return 0;
  }
  return self;
}

- (void)p_rasterizeCanvases:(BOOL)a3
{
  if (a3) {
    [self layout].stageCornerRadius
  }
  stageCanvasController = self->_stageCanvasController;

  -[THWPagedCanvasController setRasterize:](stageCanvasController, "setRasterize:");
}

- (void)viewScrollWillChange
{
}

- (void)viewScrollingEnded
{
}

- (double)pagedCanvasControllerVerticalOverflow:(id)a3
{
  if (self->_thumbnailTrackCanvasController != a3) {
    return 0.0;
  }
  id v4 = [(THWGalleryRep *)self layout];

  [v4 thumbnailTrackVerticalPadding];
  return result;
}

- (void)p_updateUserInteractionForController:(id)a3
{
  if (a3)
  {
    if ([(THWGalleryRep *)self p_isExpanding])
    {
      BOOL v5 = 0;
    }
    else if ([(THWGalleryRep *)self pressableHandler])
    {
      BOOL v5 = [(THWPressableRepGestureTargetHandler *)[(THWGalleryRep *)self pressableHandler] widgetInteractionEnabled];
    }
    else
    {
      BOOL v5 = 1;
    }
    [a3 setUserInteractionEnabled:v5];
  }
}

- (void)pagedCanvasController:(id)a3 customizeLayerHost:(id)a4
{
  if (self->_stageCanvasController == a3)
  {
    id v5 = [(THWGalleryRep *)self layout];
    [(THWPagedCanvasController *)self->_stageCanvasController setPageIndex:[(THWGalleryRep *)self currentPage] animated:0];
    if (([v5 isExpanded] & 1) == 0) {
      -[THWPagedCanvasController setupImmediatePressGestureWithSimultaneousGestures:](self->_stageCanvasController, "setupImmediatePressGestureWithSimultaneousGestures:", objc_msgSend(objc_msgSend(objc_msgSend(-[THWGalleryRep interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "asiOSCVC"), "panGestureRecognizers"));
    }
    -[THScrollView setHandleNaturally:](-[THWPagedCanvasController scrollView](self->_stageCanvasController, "scrollView"), "setHandleNaturally:", objc_msgSend(objc_msgSend(-[THWGalleryRep interactiveCanvasController](self, "interactiveCanvasController"), "widgetHost"), "widgetHostingShouldAllowNaturalHorizontalScrollForRep:", self));
    [(THWGalleryRep *)self p_updateUserInteractionForController:self->_stageCanvasController];
    [(THWGalleryRep *)self p_updateStageCornerRadius];
  }
  else if (self->_thumbnailTrackCanvasController == a3)
  {
    objc_msgSend(a3, "setPageIndex:animated:", objc_msgSend(objc_msgSend(-[THWGalleryRep layout](self, "layout"), "thumbnailPageControl"), "currentPage"), 0);
    [(THWPagedCanvasController *)self->_thumbnailTrackCanvasController setupImmediatePressGesture];
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWPagedCanvasController interactiveCanvasController](self->_thumbnailTrackCanvasController, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "setMasksToBounds:", 0);
    -[THScrollView setHandleNaturally:](-[THWPagedCanvasController scrollView](self->_thumbnailTrackCanvasController, "scrollView"), "setHandleNaturally:", objc_msgSend(objc_msgSend(-[THWGalleryRep interactiveCanvasController](self, "interactiveCanvasController"), "widgetHost"), "widgetHostingShouldAllowNaturalHorizontalScrollForRep:", self));
    thumbnailTrackCanvasController = self->_thumbnailTrackCanvasController;
    [(THWGalleryRep *)self p_updateUserInteractionForController:thumbnailTrackCanvasController];
  }
}

- (BOOL)pagedCanvasControllerIsRelatedCanvasScrolling:(id)a3
{
  id v3 = [(THWGalleryRep *)self interactiveCanvasController];

  return [v3 currentlyScrolling];
}

- (BOOL)pagedCanvasControllerDeferViewCreation:(id)a3
{
  id v3 = [(THWGalleryRep *)self interactiveCanvasController];

  return [v3 currentlyScrolling];
}

- (BOOL)pagedCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (BOOL)pagedCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  return 0;
}

- (BOOL)pagedCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5
{
  return 0;
}

- (BOOL)allowSelectionPopoverForPagedCanvasController:(id)a3
{
  return 0;
}

- (double)pagedCanvasControllerContentsScale:(id)a3
{
  id v3 = [self interactiveCanvasController:a3].canvas;

  [v3 contentsScale];
  return result;
}

- (double)pagedCanvasController:(id)a3 adjustScale:(double)a4 andFrame:(CGRect *)a5
{
  if (!a5) {
    return a4;
  }
  double Width = CGRectGetWidth(*a5);
  if (self->_stageCanvasController == a3)
  {
    [self layout:Width stageFrame];
  }
  else
  {
    double v10 = Width;
    if (self->_thumbnailTrackCanvasController != a3) {
      goto LABEL_7;
    }
    [self layout].thumbnailTrackFrame;
  }
  double v10 = CGRectGetWidth(*(CGRect *)&v11);
LABEL_7:
  if (v10 > 0.0)
  {
    objc_msgSend(objc_msgSend(-[THWGalleryRep interactiveCanvasController](self, "interactiveCanvasController"), "canvas"), "contentsScale");
    TSDRoundedRectForScale();
    *a5 = v16;
    return CGRectGetWidth(v16) / v10;
  }
  return a4;
}

- (BOOL)pagedCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4
{
  return 0;
}

- (id)pagedCanvasController:(id)a3 renderedPageIndexSetFromReps:(id)a4
{
  if (self->_stageCanvasController != a3) {
    return 0;
  }
  id v6 = [(THWGalleryRep *)self layout];

  return [v6 pageIndexesFromStageReps:a4];
}

- (BOOL)pagedCanvasControllerRestrictVisibleToRenderedContent:(id)a3
{
  return self->_stageCanvasController == a3;
}

- (BOOL)widgetInteractionAllowOnPageForCompact
{
  return 1;
}

- (id)p_itemAtIndex:(unint64_t)a3
{
  id v4 = [[self info] items];
  if ((unint64_t)[v4 count] <= a3) {
    return 0;
  }

  return [v4 objectAtIndex:a3];
}

- (CALayer)pressableAnimationLayer
{
  id v2 = [(THWPagedCanvasController *)self->_stageCanvasController view];

  return [(UIView *)v2 layer];
}

- (CALayer)pressableAnimationShadowLayer
{
  return 0;
}

- (int)pressableAction
{
  return 2;
}

- (BOOL)wantsPressAnimation
{
  id v2 = [(THWGalleryRep *)self pressableHandler];

  return [(THWPressableRepGestureTargetHandler *)v2 widgetInteractionDisabledOnPage];
}

- (BOOL)wantsPressAction
{
  return 1;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  return 1;
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  return 0;
}

- (id)animationLayer
{
  if (![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWGalleryRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress]|| (id result = [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWGalleryRep *)self freeTransformableHandler] ftc] freeTransformLayer]) == 0)
  {
    imageCropAnimationController = self->_imageCropAnimationController;
    return [(THWImageCropAnimationController *)imageCropAnimationController wrapperLayer];
  }
  return result;
}

- (id)shadowAnimationLayer
{
  if (![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWGalleryRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress])return 0; {
  id v3 = [(THWFreeTransformableRepGestureTargetHandler *)[(THWGalleryRep *)self freeTransformableHandler] ftc];
  }

  return [(THWFreeTransformController *)v3 shadowLayer];
}

- (CGAffineTransform)shadowAnimationLayerDestinationTransform:(SEL)a3 uniformTargetScale:(id)a4
{
  long long v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  imageCropAnimationController = self->_imageCropAnimationController;
  if (imageCropAnimationController)
  {
    [(THWImageCropAnimationController *)imageCropAnimationController sourceContentsRect];
    [(THWImageCropAnimationController *)self->_imageCropAnimationController targetContentsRect];
    [self shadowAnimationLayer].bounds
    TSDMultiplyRectBySize();
    double v31 = v10;
    double v32 = v9;
    TSDMultiplyRectBySize();
    double v29 = v12;
    double v30 = v11;
    TSDCenterOfRect();
    TSDCenterOfRect();
    TSDRectWithSize();
    TSDCenterOfRect();
    TSDSubtractPoints();
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    TSDSubtractPoints();
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGAffineTransformMakeTranslation(retstr, v14, v16);
    CGAffineTransformMakeScale(&t2, v30 / v32, v29 / v31);
    long long v21 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v21;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v37, &t1, &t2);
    long long v22 = *(_OWORD *)&v37.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v37.a;
    *(_OWORD *)&retstr->c = v22;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v37.tx;
    CGAffineTransformMakeTranslation(&v34, v18, v20);
    long long v23 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v23;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v37, &t1, &v34);
    long long v24 = *(_OWORD *)&v37.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v37.a;
    *(_OWORD *)&retstr->c = v24;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v37.tx;
  }
  id result = (CGAffineTransform *)self->_freeTransformableHandler;
  if (result)
  {
    id v26 = [(CGAffineTransform *)result ftc];
    if (v26) {
      [v26 originalShadowTransform];
    }
    else {
      memset(&v33, 0, sizeof(v33));
    }
    long long v27 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v27;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    id result = CGAffineTransformConcat(&v37, &t1, &v33);
    long long v28 = *(_OWORD *)&v37.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v37.a;
    *(_OWORD *)&retstr->c = v28;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v37.tx;
  }
  return result;
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  return 0;
}

- (CGAffineTransform)freeTransform
{
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  id result = (CGAffineTransform *)[(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWGalleryRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress];
  if (result)
  {
    id result = [(THWFreeTransformableRepGestureTargetHandler *)[(THWGalleryRep *)self freeTransformableHandler] ftc];
    if (result)
    {
      id result = (CGAffineTransform *)[(CGAffineTransform *)result currentTransform];
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
    *(_OWORD *)&retstr->tx = v10;
  }
  return result;
}

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 0;
}

- (id)targetLayer
{
  if ([(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWGalleryRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress]&& ![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWGalleryRep *)self freeTransformableHandler] ftc] passedThreshold])
  {
    return 0;
  }

  return [(THWGalleryRep *)self p_currentImageContentLayer];
}

- (CGRect)ftcTargetFrame
{
  if ([(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWGalleryRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress])
  {
    [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWGalleryRep *)self freeTransformableHandler] ftc] completionTargetRect];
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

- (BOOL)expandableShouldPreloadExpanded
{
  return 1;
}

- (id)hostICC
{
  return [*(id *)&self->super.TSDContainerRep_opaque[OBJC_IVAR___TSDRep_mCanvas] canvasController];
}

- (THAnimationController)animationController
{
  CGRect result = self->_animationController;
  if (!result)
  {
    id v4 = objc_alloc_init(THAnimationController);
    self->_animationController = v4;
    [(THAnimationController *)v4 addObserver:self];
    [(THAnimationController *)self->_animationController setSource:self];
    [(THAnimationController *)self->_animationController setShadowFadeOutDurationScale:1.0];
    [(THAnimationController *)self->_animationController setShadowTransformDurationScale:0.5];
    return self->_animationController;
  }
  return result;
}

- (void)p_setupImageCropAnimationControllerWithDestinationRep:(id)a3
{
  id v5 = [(THWGalleryRep *)self p_currentImageContentLayer];
  if (v5 && !self->_imageCropAnimationController)
  {
    id v11 = v5;
    id v12 = [(THWGalleryRep *)self currentItem];
    [(THWGalleryRep *)self p_contentsRectForItem:v12];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    if (a3)
    {
      [a3 p_contentsRectForItem:v12];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
    }
    else
    {
      double v26 = 1.0;
      double v22 = 0.0;
      double v24 = 0.0;
      double v28 = 1.0;
    }
    double v29 = [[THWImageCropAnimationController alloc] initWithImageContentLayer:v11];
    self->_imageCropAnimationController = v29;
    -[THWImageCropAnimationController setSourceContentsRect:](v29, "setSourceContentsRect:", v14, v16, v18, v20);
    [self layout].stageCornerRadius;
    double v31 = v30;
    [self canvas].viewScale;
    [(THWImageCropAnimationController *)self->_imageCropAnimationController setSourceCornerRadius:v31 * v32];
    -[THWImageCropAnimationController setTargetContentsRect:](self->_imageCropAnimationController, "setTargetContentsRect:", v22, v24, v26, v28);
    objc_msgSend(objc_msgSend(a3, "layout"), "stageCornerRadius");
    double v34 = v33;
    objc_msgSend(objc_msgSend(a3, "canvas"), "viewScale");
    [(THWImageCropAnimationController *)self->_imageCropAnimationController setTargetCornerRadius:v34 * v35];
    [(THWImageCropAnimationController *)self->_imageCropAnimationController setCropDurationScale:0.5];
    [(THWImageCropAnimationController *)self->_imageCropAnimationController setCornerRadiusDurationScale:0.5];
    imageCropAnimationController = self->_imageCropAnimationController;
    [(THWImageCropAnimationController *)imageCropAnimationController setupWrapperLayer];
  }
  else if (a3)
  {
    [a3 p_contentsRectForItem:[self currentItem]];
    -[THWImageCropAnimationController setTargetContentsRect:](self->_imageCropAnimationController, "setTargetContentsRect:");
    objc_msgSend(objc_msgSend(a3, "layout"), "stageCornerRadius");
    double v7 = v6;
    objc_msgSend(objc_msgSend(a3, "canvas"), "viewScale");
    double v9 = v7 * v8;
    long long v10 = self->_imageCropAnimationController;
    [(THWImageCropAnimationController *)v10 setTargetCornerRadius:v9];
  }
}

- (void)animationControllerSetupTarget:(id)a3
{
  objc_opt_class();
  [a3 destination];
  uint64_t v5 = TSUDynamicCast();

  [(THWGalleryRep *)self p_setupImageCropAnimationControllerWithDestinationRep:v5];
}

- (void)animationControllerTeardownTarget:(id)a3
{
  if (![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWGalleryRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress])
  {
    [(THWImageCropAnimationController *)self->_imageCropAnimationController teardownWrapperLayer];

    self->_imageCropAnimationController = 0;
  }
}

- (void)animationControllerDidPresent:(id)a3
{
  self->_animationController = 0;
}

- (void)animationControllerDidAddContentAnimations:(id)a3 uniformTargetScale:(double)a4
{
  imageCropAnimationController = self->_imageCropAnimationController;
  [a3 animationDuration];

  -[THWImageCropAnimationController addAnimationWithDuration:targetScale:](imageCropAnimationController, "addAnimationWithDuration:targetScale:");
}

- (void)expandedWillStartWidgetLayoutFrameResize:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_msgSend(objc_msgSend(objc_msgSend(-[THWGalleryRep p_zoomableCanvasControlRepForItemIndex:](self, "p_zoomableCanvasControlRepForItemIndex:", -[THWPagedCanvasController pageIndex](self->_stageCanvasController, "pageIndex")), "zoomableCanvasController"), "interactiveCanvasController"), "viewScale");
  -[THWGalleryRep setResizeOriginalViewScale:](self, "setResizeOriginalViewScale:");
  -[THWGalleryRep setResizeOriginalLayoutFrame:](self, "setResizeOriginalLayoutFrame:", x, y, width, height);
  stageCanvasController = self->_stageCanvasController;

  [(THWPagedCanvasController *)stageCanvasController setPadInfos:0];
}

- (void)expandedDidEndWidgetLayoutFrameResize
{
}

- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  [(THWPagedCanvasController *)self->_stageCanvasController forceStopScrollingAtCurrentPageIndex];
  id v7 = [[self p_zoomableCanvasControlRepForItemIndex:[self pageIndex]] zoomableCanvasController];
  [v7 setInResize:1];
  [v7 contentOffsetForAnchor:0.5, 0.5];
  double v9 = v8;
  double v11 = v10;
  id v12 = [(THWGalleryRep *)self layout];
  [v12 invalidateFrame];
  [v12 invalidateChildren];
  [self.interactiveCanvasController layoutIfNeeded];
  [(THWPagedCanvasController *)self->_stageCanvasController invalidateLayoutsAndFrames];
  [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)self->_stageCanvasController interactiveCanvasController] layoutIfNeeded];
  [(THWPagedCanvasController *)self->_thumbnailTrackCanvasController invalidateLayoutsAndFrames];
  [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)self->_thumbnailTrackCanvasController interactiveCanvasController] layoutIfNeeded];
  if (v7)
  {
    objc_msgSend(objc_msgSend(v7, "interactiveCanvasController"), "layoutIfNeeded");
    objc_msgSend(objc_msgSend(v7, "interactiveCanvasController"), "viewScale");
    double v14 = v13;
    id v15 = [(THWGalleryRep *)self p_itemAtIndex:[(THWPagedCanvasController *)self->_stageCanvasController pageIndex]];
    if (v15)
    {
      id v16 = v15;
      [(THWGalleryRep *)self resizeOriginalViewScale];
      double v18 = v17;
      [(THWGalleryRep *)self resizeOriginalLayoutFrame];
      double v21 = v18 * THScaleNeededToFitSizeInSize(v19, v20, width, height);
      if (v21 <= 1.5) {
        double v22 = v21;
      }
      else {
        double v22 = 1.5;
      }
      [self layout].zoomableItemMinimumViewScaleForItem:v16;
      if (v23 >= v22) {
        double v14 = v23;
      }
      else {
        double v14 = v22;
      }
    }
    [v7 setViewScale:v14 contentOffset:v9 anchor:0.5, 0.5];
  }

  [v7 setInResize:0];
}

- (void)expandedWillPresentWithController:(id)a3
{
  self->_expandedRepController = (THWExpandedRepController *)a3;
}

- (id)expandedZoomableInteractiveCanvasController
{
  id v2 = [(THWGalleryRep *)self p_zoomableCanvasControllerForItemIndex:[(THWGalleryRep *)self currentPage]];

  return [v2 interactiveCanvasController];
}

- (void)didPresentExpanded
{
  [(THWPagedCanvasController *)self->_stageCanvasController setMinimizeInfoChange:0];
  id v3 = [[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItemIndex:[self p_zoomableCanvasControllerForItem

  [v3 setShouldSuppressRendering:0 animated:0];
}

- (void)didPresentExpandedPostCommit
{
  [(THWGalleryRep *)self p_updateUserInteractionForController:self->_stageCanvasController];
  thumbnailTrackCanvasController = self->_thumbnailTrackCanvasController;

  [(THWGalleryRep *)self p_updateUserInteractionForController:thumbnailTrackCanvasController];
}

- (int)expandedAppearance
{
  return 0;
}

- (int)expandedAppearanceForPanel:(int)a3
{
  return 0;
}

- (BOOL)expandedAllowFreeTransform
{
  id v2 = [self p_zoomableCanvasControlRepForItemIndex:[self pageIndex] zoomableCanvasController];
  if (!v2) {
    return 1;
  }

  return [v2 isZoomedOut];
}

- (id)expandedRotationAnimationController
{
  id v2 = [[THWGalleryExpandedRotationController alloc] initWithRep:self pagedCanvasController:self->_stageCanvasController zoomableCanvasController:[(THWGalleryRep *)self p_zoomableCanvasControllerForItem:[(THWGalleryRep *)self currentItem]]];

  return v2;
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(THWGalleryRep *)self layout];

  return [v4 expandedHasContentForPanel:v3];
}

- (UIEdgeInsets)expandedStackedControlContainerInsetsForPanel:(int)a3 withDefault:(UIEdgeInsets)a4
{
  CGFloat right = a4.right;
  double bottom = a4.bottom;
  CGFloat left = a4.left;
  double top = a4.top;
  if (a3 == 2)
  {
    [(THWGalleryRep *)self expandedHasContentForPanel:1];
  }
  else if (a3 == 1)
  {
    if ([(THWGalleryRep *)self expandedHasContentForPanel:2])
    {
      [(THWGalleryRep *)self p_expandedPaddingAfterCaption];
      double bottom = fmax(v9, top) - top;
    }
    if (!objc_msgSend(-[THWGalleryRep layout](self, "layout"), "currentCaptionStorage"))
    {
      double bottom = 0.0;
      double top = 0.0;
    }
  }
  double v10 = top;
  double v11 = left;
  double v12 = bottom;
  double v13 = right;
  result.CGFloat right = v13;
  result.double bottom = v12;
  result.CGFloat left = v11;
  result.double top = v10;
  return result;
}

- (double)expandedMinHeightForPanel:(int)a3 withDefault:(double)result
{
  double v4 = result;
  if (a3 == 1)
  {
    unsigned __int8 v6 = [(THWGalleryRep *)self expandedHasContentForPanel:2];
    UIEdgeInsets result = 0.0;
    if ((v6 & 1) == 0)
    {
      id v7 = [self layout:0.0 currentCaptionStorage];
      UIEdgeInsets result = 0.0;
      if (v7) {
        return v4;
      }
    }
  }
  return result;
}

- (BOOL)expandedShouldCombineBottomAndControlPanels
{
  return 1;
}

- (id)expandedLayoutGeometryForLayout:(id)a3 inPanel:(int)a4 withWidth:(double)a5 insets:(UIEdgeInsets)a6
{
  double v9 = (void *)TSUProtocolCast();
  if (!v9) {
    return 0;
  }
  double v10 = (int *)[v9 tag];
  if (v10 == &dword_4)
  {
    if ((a4 - 1) <= 1)
    {
      double x = CGPointZero.x;
      double y = CGPointZero.y;
      double v15 = 15.0;
      goto LABEL_8;
    }
    return 0;
  }
  if (v10 != (int *)((char *)&dword_0 + 1) || (a4 - 1) > 1) {
    return 0;
  }
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  [self layout].thumbnailTrackSizeWithPanelWidth:a5;
  a5 = v13;
  double v15 = v14;
LABEL_8:
  id v16 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:x, y, a5, v15];

  return v16;
}

- (unsigned)expandedAlignmentForLayout:(id)a3 inPanel:(int)a4
{
  double v4 = (void *)TSUProtocolCast();
  if (v4 && ((uint64_t v5 = v4, [v4 tag] == (char *)&dword_0 + 1) || objc_msgSend(v5, "tag") == &dword_4)) {
    return 2;
  }
  else {
    return 4;
  }
}

- (id)expandedChildInfosForPanel:(int)a3
{
  if (a3 == 1)
  {
    id v3 = [[-[THWGalleryRep layout](self, "layout") sharedCaptionStorage]];
  }
  else
  {
    if (a3) {
      return 0;
    }
    id v3 = [[[self info] adornmentInfo] title].containedStorage;
  }
  if (!v3) {
    return 0;
  }

  return +[NSArray arrayWithObject:v3];
}

- (id)expandedAdditionalChildLayoutsForPanel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(THWGalleryRep *)self layout];

  return [v4 thumbnailTrackAdditionalLayoutsInExpandedPanel:v3];
}

- (void)expandedContentHandleDoubleTapZoomDirectlyAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [self layout].stageFrame;
  double v6 = v10.origin.x;
  double v7 = v10.origin.y;
  v9.double x = x;
  v9.double y = y;
  if (CGRectContainsPoint(v10, v9))
  {
    -[THWGalleryRep p_toggleCurrentItemZoomableWithStageRelativeTouch:](self, "p_toggleCurrentItemZoomableWithStageRelativeTouch:", x - v6, y - v7);
  }
}

- (double)expandedLeftRightInsetForTextLayout:(id)a3 inPanel:(int)a4
{
  if (!a4) {
    return 10.0;
  }
  if (a4 != 1) {
    return 0.0;
  }
  id v6 = [(THWGalleryRep *)self layout];
  [v6 expandedLeftRightInsetForCaption];
  return result;
}

- (double)p_expandedPaddingAfterCaption
{
  int v2 = TSUPhoneUI();
  double result = 28.0;
  if (v2) {
    return 10.0;
  }
  return result;
}

- (double)expandedVerticalPaddingAfterForLayout:(id)a3 inPanel:(int)a4
{
  if (a4 != 1) {
    return 10.0;
  }
  id v6 = [self layout].currentCaptionStorage;
  if (!v6 || [a3 info] != v6) {
    return 10.0;
  }

  [(THWGalleryRep *)self p_expandedPaddingAfterCaption];
  return result;
}

- (BOOL)expandedIsRelatedCanvasScrolling
{
  int v2 = [(THWPagedCanvasController *)self->_stageCanvasController interactiveCanvasController];

  return [(TSDInteractiveCanvasController *)v2 currentlyScrolling];
}

- (void)p_togglePanelDescriptionExpanded
{
  [(THWGalleryRep *)self setPanelDescriptionExpanded:[(THWGalleryRep *)self panelDescriptionExpanded] ^ 1];
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
  v7[2] = sub_155D80;
  v7[3] = &unk_456DE0;
  v7[4] = self;
  return [[THWTapGestureAction alloc] initWithAction:v7];
}

- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5
{
  if (a4 == 1 && !self->_panelDescriptionExpanded)
  {
    id v6 = [self layout:a3 layoutController];
    if ([v6 isCompactHeight])
    {
      return 2;
    }
    else if ([v6 isCompactWidth])
    {
      return 5;
    }
  }
  return a5;
}

- (void)handleNavigateNextCommand
{
}

- (void)handleNavigatePreviousCommand
{
}

- (void)pageControl:(id)a3 didChangeInteractivelyFromPageIndex:(unint64_t)a4 toPageIndex:(unint64_t)a5
{
  id v8 = [a3 layout];
  if (v8)
  {
    id v9 = v8;
    if (v8 == objc_msgSend(-[THWGalleryRep layout](self, "layout"), "pageControl"))
    {
      stageCanvasController = self->_stageCanvasController;
      unint64_t v11 = a4 - a5;
      if ((uint64_t)(a4 - a5) < 0) {
        unint64_t v11 = a5 - a4;
      }
      [(THWPagedCanvasController *)stageCanvasController setPageIndex:a5 animated:v11 < 2];
    }
    else if (v9 == objc_msgSend(-[THWGalleryRep layout](self, "layout"), "thumbnailPageControl"))
    {
      thumbnailTrackCanvasController = self->_thumbnailTrackCanvasController;
      [(THWPagedCanvasController *)thumbnailTrackCanvasController setPageIndex:a5];
    }
  }
}

- (__CTFont)pageControlCreateFont:(id)a3
{
  double result = (__CTFont *)[self layout:@"layout" a3];
  if (!result)
  {
    return CTFontCreateWithName(@"LucidaGrande", 0.0, 0);
  }
  return result;
}

- (id)pageControlTextColor:(id)a3
{
  id result = [-[THWGalleryRep layout](self, "layout", a3) colorFromCaption];
  if (!result)
  {
    return +[TSUColor colorWithWhite:0.0980392173 alpha:1.0];
  }
  return result;
}

- (id)pageControl:(id)a3 layerForState:(int)a4
{
  return [(THWGalleryRep *)self pageControl:a3 layerForState:*(void *)&a4 pageIndex:0];
}

- (id)pageControl:(id)a3 layerForState:(int)a4 pageIndex:(unint64_t)a5
{
  if ((char *)objc_msgSend(objc_msgSend(a3, "layout"), "tag") - 3 > (unsigned char *)&dword_0 + 1) {
    return 0;
  }
  id v7 = [[-[THWGalleryRep layout](self, "layout")] colorFromCaption];
  unsigned int v8 = [self layout].isExpanded;
  if (v8)
  {
    id v9 = +[TSUColor whiteColor];
  }
  else
  {
    if (v7) {
      goto LABEL_7;
    }
    id v9 = +[TSUColor blackColor];
  }
  id v7 = v9;
LABEL_7:
  if (a4 == 1)
  {
    double v10 = 0.8;
    if (!v8) {
      double v10 = 1.0;
    }
  }
  else
  {
    if (a4) {
      return 0;
    }
    double v10 = 0.3;
    if (v8) {
      double v10 = 0.4;
    }
  }
  id v11 = [v7 colorWithAlphaComponent:v10];
  if (!v11) {
    return 0;
  }

  return +[THWPageControlRep dotLayerUsingColor:v11 diameter:7.0];
}

- (BOOL)isExpanded
{
  id v2 = [(THWGalleryRep *)self layout];

  return [v2 isExpanded];
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  [self layout].stageFrame;
  return v3 < 660.0 || v2 < 960.0;
}

- (BOOL)isFreeTransformInProgress
{
  double v2 = [(THWFreeTransformableRepGestureTargetHandler *)[(THWGalleryRep *)self freeTransformableHandler] ftc];

  return [(THWFreeTransformController *)v2 isFreeTransformInProgress];
}

- (void)p_updateToPageIndex:(unint64_t)a3 usingCachedImagedFromRep:(id)a4
{
  objc_msgSend(objc_msgSend(-[THWGalleryRep layout](self, "layout"), "pageControl"), "setCurrentPage:", a3);
  if (self->_stageCanvasController)
  {
    id v7 = [(THWGalleryRep *)self p_itemAtIndex:a3];
    [(THWPagedCanvasController *)self->_stageCanvasController setPadInfos:0];
    [(THWPagedCanvasController *)self->_stageCanvasController setPageIndex:a3 animated:0];
    [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)self->_stageCanvasController interactiveCanvasController] setShouldSuppressRendering:1 animated:0];
    [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)self->_stageCanvasController interactiveCanvasController] layoutIfNeeded];
    id v8 = [(THWGalleryRep *)self p_imageRepForItem:v7];
    id v9 = [a4 p_imageRepForItem:v7];
    if (v8)
    {
      if (v9)
      {
        id v10 = [v9 newCachedSizedImage];
        if (v10)
        {
          id v11 = v10;
          [v8 useCachedSizedImage:v10];
          [v8 generateSizedImageOnBackgroundThread];
        }
      }
    }
    [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)self->_stageCanvasController interactiveCanvasController] setShouldSuppressRendering:0 animated:0];
    [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)self->_stageCanvasController interactiveCanvasController] layoutIfNeeded];
  }
  else
  {
    self->_currentPage = a3;
  }
  id v12 = [(THWGalleryRep *)self interactiveCanvasController];

  [v12 layoutIfNeeded];
}

- (void)freeTransformWillBegin
{
  [self p_currentImageRep].pauseLayerUpdates;
  objc_opt_class();
  [(THWExpandedRepController *)self->_expandedRepController expandedRepSourceRep];
  double v3 = (void *)TSUDynamicCast();
  [v3 p_updateToPageIndex:[-[THWGalleryRep stageCanvasController](self, "stageCanvasController") pageIndex] usingCachedImagedFromRep:self];

  [(THWGalleryRep *)self p_setupImageCropAnimationControllerWithDestinationRep:v3];
}

- (id)shadowPath
{
  if (!objc_msgSend(-[THWGalleryRep currentItem](self, "currentItem"), "isOpaque")) {
    return 0;
  }
  imageCropAnimationController = self->_imageCropAnimationController;

  return [(THWImageCropAnimationController *)imageCropAnimationController sourceShadowPath];
}

- (BOOL)freeTransformUseTracedShadowPath
{
  return [[self currentItem] isOpaque] ^ 1;
}

- (void)freeTransformDidEnd
{
  [(THWPagedCanvasController *)self->_stageCanvasController setPadInfos:1];
  [(THWImageCropAnimationController *)self->_imageCropAnimationController teardownWrapperLayer];

  self->_imageCropAnimationController = 0;
  id v3 = [(THWGalleryRep *)self p_currentImageRep];

  [v3 resumeLayerUpdatesAndLayoutImmediately];
}

- (CGRect)rectForCompletion
{
  [self p_currentImageRep].layout;

  [v2 frameInParent];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)canHandleGesture:(id)a3
{
  if ([(THWFreeTransformableRepGestureTargetHandler *)[(THWGalleryRep *)self freeTransformableHandler] canHandleGesture:a3])
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    [a3 naturalLocationForRep:self];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    [self layout].stageFrame;
    v13.double x = v7;
    v13.double y = v9;
    BOOL v5 = CGRectContainsPoint(v14, v13);
    if (v5)
    {
      pressableHandler = self->_pressableHandler;
      LOBYTE(v5) = [(THWPressableRepGestureTargetHandler *)pressableHandler canHandleGesture:a3];
    }
  }
  return v5;
}

- (BOOL)handleGesture:(id)a3
{
  [a3 naturalLocationForRep:self];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  [self layout].stageFrame;
  v12.double x = v6;
  v12.double y = v8;
  if (CGRectContainsPoint(v13, v12)
    && [(THWPressableRepGestureTargetHandler *)self->_pressableHandler handleGesture:a3])
  {
    return 1;
  }
  id v10 = [(THWGalleryRep *)self freeTransformableHandler];

  return [(THWFreeTransformableRepGestureTargetHandler *)v10 handleGesture:a3];
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v5 = [a3 gestureKind];
  if (v5 == (id)TSDFreeTransform)
  {
    CGFloat v6 = [(THWGalleryRep *)self freeTransformableHandler];
    [(THWFreeTransformableRepGestureTargetHandler *)v6 willBeginHandlingGesture:a3];
  }
}

- (void)buttonControlWasPressed:(id)a3
{
  id v4 = [a3 layout];
  if ([v4 tag] == (char *)&dword_4 + 1)
  {
    id v5 = [v4 index];
    [(THWGalleryRep *)self p_goToPage:v5];
  }
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  id v6 = [a3 layout];
  if ([v6 tag] != (char *)&dword_4 + 1) {
    return 0;
  }
  id v7 = [self p_itemAtIndex:[v6 index]].thumbnailImageData;
  if (!v7) {
    return 0;
  }

  return +[TSDBitmapImageProvider TSUImageForImageData:v7];
}

- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4
{
  id v6 = [a3 layout];
  if ([v6 tag] == (char *)&dword_4 + 1)
  {
    id v7 = objc_msgSend(objc_msgSend(-[THWGalleryRep layout](self, "layout"), "pageControl"), "currentPage");
    if (v7 == [v6 index])
    {
      [a4 setBorderWidth:0.0];
      [a4 bounds];
      id v10 = -[THWGalleryRep p_highlightLayerForThumbnailSize:](self, "p_highlightLayerForThumbnailSize:", v8, v9);
      id v11 = v10;
      if (v10 && [v10 superlayer] != a4)
      {
        [v11 removeFromSuperlayer];
        [a4 addSublayer:v11];
      }
      [(THWGalleryRep *)self p_integralScaledThumbnailHighlightWidth];
      [v11 setPosition:];
    }
    else
    {
      objc_msgSend(a4, "setBorderColor:", objc_msgSend(objc_msgSend(-[THWGalleryRep layout](self, "layout"), "thumbnailBorderColor"), "CGColor"));
      [a4 setBorderWidth:1.0];
    }
  }
}

- (BOOL)buttonControlAdjustImageWhenHighlighted:(id)a3
{
  return 1;
}

- (void)buttonControlInteractionWillStart:(id)a3
{
  id v4 = [a3 layout];
  if ([v4 tag] == (char *)&dword_4 + 1)
  {
    [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)self->_stageCanvasController interactiveCanvasController] setStaticLayoutAndRenderOnThread:1];
    id v5 = [v4 index];
    stageCanvasController = self->_stageCanvasController;
    [(THWPagedCanvasController *)stageCanvasController setPreloadPageIndex:v5];
  }
}

- (void)buttonControlInteractionDidEnd:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "layout"), "tag") == (char *)&dword_4 + 1)
  {
    [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)self->_stageCanvasController interactiveCanvasController] setStaticLayoutAndRenderOnThread:0];
    [(THWPagedCanvasController *)self->_stageCanvasController setPreloadPageIndex:0x7FFFFFFFFFFFFFFFLL];
    if (([(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)self->_stageCanvasController interactiveCanvasController] currentlyScrolling] & 1) == 0&& ([(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)self->_thumbnailTrackCanvasController interactiveCanvasController] currentlyScrolling] & 1) == 0)
    {
      stageCanvasController = self->_stageCanvasController;
      id v5 = [(THWPagedCanvasController *)stageCanvasController pageIndex];
      [(THWGalleryRep *)self pagedCanvasController:stageCanvasController didScrollToPageIndex:v5];
    }
  }
}

- (void)willReplaceContentsFromRep:(id)a3
{
  objc_opt_class();
  id v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    id v5 = objc_msgSend(objc_msgSend(v4, "stageCanvasController"), "pageIndex");
    objc_msgSend(objc_msgSend(-[THWGalleryRep layout](self, "layout"), "pageControl"), "setCurrentPage:", v5);
    stageCanvasController = self->_stageCanvasController;
    if (stageCanvasController)
    {
      [(THWPagedCanvasController *)stageCanvasController setPageIndex:v5 animated:0];
      id v7 = [(THWPagedCanvasController *)self->_stageCanvasController interactiveCanvasController];
      [(TSDInteractiveCanvasController *)v7 layoutIfNeeded];
    }
    else
    {
      self->_currentPage = (unint64_t)v5;
    }
  }
}

- (void)replaceContentsFromRep:(id)a3
{
}

- (CGSize)sizeOfCanvasForZoomableCanvasController:(id)a3
{
  id v5 = [(THWGalleryRep *)self layout];
  id v6 = [(THWGalleryRep *)self p_itemForZoomableCanvasController:a3];

  [v5 zoomableCanvasSizeForItem:v6];
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (id)zoomableCanvasController:(id)a3 infosToDisplayForViewport:(CGRect)a4
{
  id result = [[self p_itemForZoomableCanvasController:a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height] imageInfo];
  if (result)
  {
    return +[NSArray arrayWithObject:result];
  }
  return result;
}

- (id)infosToDisplayForContainerInZoomableCanvasController:(id)a3
{
  return +[NSArray array];
}

- (BOOL)zoomableCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (double)zoomableCanvasControllerContentsScale:(id)a3
{
  id v3 = [(THWGalleryRep *)self canvas];

  [v3 contentsScale];
  return result;
}

- (void)zoomableCanvasControllerCustomizeLayerHost:(id)a3
{
  id v5 = -[THWGalleryRep p_itemForZoomableCanvasController:](self, "p_itemForZoomableCanvasController:");
  [self layout].zoomableItemMinimumViewScaleForItem:v5;
  double v7 = v6;
  objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "unscaledSize");
  [(THWGalleryRep *)self p_updateMinMaxViewScaleForItem:v5 forceMinScale:0];
  TSDRectWithSize();
  TSDCenterOfRect();

  [a3 setViewScale:v7 contentOffset:v8 anchor:0.5, 0.5];
}

- (BOOL)zoomableCanvasControllerIsRelatedCanvasScrolling:(id)a3
{
  id v3 = [(THWPagedCanvasController *)self->_stageCanvasController interactiveCanvasController];

  return [(TSDInteractiveCanvasController *)v3 currentlyScrolling];
}

- (unint64_t)p_itemIndexForZoomableCanvasController:(id)a3
{
  objc_opt_class();
  [a3 instanceData];
  id v4 = (void *)TSUDynamicCast();

  return (unint64_t)[v4 unsignedIntegerValue];
}

- (id)p_itemForZoomableCanvasController:(id)a3
{
  id v5 = [(THWGalleryRep *)self info];
  unint64_t v6 = [(THWGalleryRep *)self p_itemIndexForZoomableCanvasController:a3];

  return [v5 itemAtIndex:v6];
}

- (void)p_updateMinMaxViewScaleForItem:(id)a3 forceMinScale:(BOOL)a4
{
  BOOL v4 = a4;
  [self layout].zoomableItemMinimumViewScaleForItem:a3;
  double v8 = v7;
  id v9 = [(THWGalleryRep *)self p_zoomableCanvasControllerForItem:a3];
  id v10 = [[[v9 interactiveCanvasController] layerHost] canvasLayer];
  [v10 setMinimumPinchViewScale:v8];
  [v10 setMaximumPinchViewScale:fmax(v8, 1.5)];
  [v10 setAllowsPinchZoom:1];
  if (v4)
  {
    id v11 = [v9 interactiveCanvasController];
    [v11 setViewScale:v8];
  }
}

- (void)p_toggleCurrentItemZoomableWithStageRelativeTouch:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(THWGalleryRep *)self currentItem];
  if (v6)
  {
    id v7 = v6;
    id v8 = [(THWGalleryRep *)self p_zoomableCanvasControllerForItem:v6];
    id v9 = [v8 interactiveCanvasController];
    id v10 = [(THWGalleryRep *)self layout];
    [v9 viewScale];
    double v12 = v11;
    [v10 zoomableItemMinimumViewScaleForItem:v7];
    double v14 = v13;
    int v15 = TSUPhoneUI();
    double v16 = 1.5;
    double v17 = 1.0;
    if (!v15) {
      double v17 = 1.5;
    }
    if (v14 >= v17) {
      double v17 = v14;
    }
    double v18 = vabdd_f64(v17, v14);
    if (v17 + v17 <= 1.5) {
      double v16 = v17 + v17;
    }
    if (v18 >= 0.00999999978) {
      double v19 = v17;
    }
    else {
      double v19 = v16;
    }
    [v9 contentOffset];
    double v21 = x / v12 + v20;
    double v23 = y / v12 + v22;
    if (v12 >= (v14 + v19) * 0.5) {
      double v24 = v14;
    }
    else {
      double v24 = v19;
    }
    objc_msgSend(objc_msgSend(v8, "scrollView"), "bounds");
    [v9 setViewScale:1 contentOffset:1 clampOffset:v24 v21 - v25 * 0.5 / v24 v23 - v26 * 0.5 / v24];
  }
}

- (id)p_currentImageRep
{
  id v3 = -[THWGalleryRep p_itemAtIndex:](self, "p_itemAtIndex:", objc_msgSend(objc_msgSend(-[THWGalleryRep layout](self, "layout"), "pageControl"), "currentPage"));

  return [(THWGalleryRep *)self p_imageRepForItem:v3];
}

- (id)p_imageRepForItem:(id)a3
{
  id v5 = [(THWPagedCanvasController *)self->_stageCanvasController interactiveCanvasController];
  id v6 = [[v5 layoutController] layoutForInfo:[a3 imageInfo]];
  if (!v6)
  {
    if (![(THWGalleryRep *)self p_supportZoom]) {
      return 0;
    }
    id v5 = [[-[THWGalleryRep p_zoomableCanvasControllerForItem:](self, "p_zoomableCanvasControllerForItem:", a3) interactiveCanvasController];
    id v6 = [[v5 layoutController] layoutForInfo:[a3 imageInfo]];
    if (!v6) {
      return 0;
    }
  }
  id v7 = v6;
  objc_opt_class();
  [v5 canvas] repForLayout:v7];

  return (id)TSUDynamicCast();
}

- (id)p_layerForItem:(id)a3
{
  id v3 = [(THWGalleryRep *)self p_imageRepForItem:a3];
  id v4 = [v3 interactiveCanvasController];

  return [v4 layerForRep:v3];
}

- (id)p_currentImageContentLayer
{
  id v2 = [(THWGalleryRep *)self p_currentImageRep];

  return [v2 contentsLayer];
}

- (CGRect)p_contentsRectForItem:(id)a3
{
  if (a3)
  {
    if (objc_msgSend(-[THWGalleryRep layout](self, "layout"), "isExpanded"))
    {
      double v4 = 1.0;
      double v5 = 0.0;
      double v6 = 0.0;
      double v7 = 1.0;
    }
    else
    {
      objc_msgSend(objc_msgSend(a3, "imageInfo"), "naturalSize");
      double v9 = v8;
      double v11 = v10;
      [a3 cropRect];
      double v5 = v12 / v9;
      double v6 = v13 / v11;
      double v4 = v14 / v9;
      double v7 = v15 / v11;
    }
  }
  else
  {
    double v4 = 1.0;
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 1.0;
  }
  result.size.double height = v7;
  result.size.double width = v4;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (id)p_zoomableCanvasControlRepForItemIndex:(unint64_t)a3
{
  objc_opt_class();
  -[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController") repForLayout:[THWGalleryRep layout](self, "layout") zoomableCanvasControlLayoutForItemIndex:a3];

  return (id)TSUDynamicCast();
}

- (id)p_zoomableCanvasControllerForItemIndex:(unint64_t)a3
{
  id v3 = [(THWGalleryRep *)self p_zoomableCanvasControlRepForItemIndex:a3];

  return [v3 zoomableCanvasController];
}

- (id)p_zoomableCanvasControllerForItem:(id)a3
{
  id v3 = -[THWGalleryRep p_zoomableCanvasControlRepForItemIndex:](self, "p_zoomableCanvasControlRepForItemIndex:", objc_msgSend(-[THWGalleryRep info](self, "info"), "indexOfItem:", a3));

  return [v3 zoomableCanvasController];
}

- (void)p_resetViewScaleForItemsExcept:(id)a3
{
  if ([(THWGalleryRep *)self p_supportZoom])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [[self info:0] items];
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        double v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(id *)(*((void *)&v11 + 1) + 8 * (void)v9);
          if (v10 != a3) {
            [(THWGalleryRep *)self p_updateMinMaxViewScaleForItem:v10 forceMinScale:1];
          }
          double v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)p_shouldSuppressRenderingDuringExpansion
{
  BOOL v3 = [(THWGalleryRep *)self p_isExpanding];
  if (v3)
  {
    objc_opt_class();
    [(THWExpandedRepController *)self->_expandedRepController expandedRepSourceRep];
    LOBYTE(v3) = TSUDynamicCast() != 0;
  }
  return v3;
}

- (BOOL)p_isExpanding
{
  expandedRepController = self->_expandedRepController;
  if (expandedRepController) {
    LOBYTE(expandedRepController) = [(THWExpandedRepController *)expandedRepController expandedRepControllerState] == 1;
  }
  return (char)expandedRepController;
}

- (void)p_relaxMinimizeInfosNextFrame
{
  expandedRepController = self->_expandedRepController;
  if (!expandedRepController
    || [(THWExpandedRepController *)expandedRepController expandedRepControllerState] == 2)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1573C8;
    v4[3] = &unk_456DE0;
    v4[4] = self;
    [self.interactiveCanvasController performBlockNextFrame:v4];
  }
}

- (id)currentItem
{
  unint64_t v3 = [(THWPagedCanvasController *)self->_stageCanvasController pageIndex];

  return [(THWGalleryRep *)self p_itemAtIndex:v3];
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

- (THWPagedCanvasController)stageCanvasController
{
  return self->_stageCanvasController;
}

- (THWPagedCanvasController)thumbnailTrackCanvasController
{
  return self->_thumbnailTrackCanvasController;
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  return self->_pressableHandler;
}

- (BCProgressTrackingRepTracker)progressTracker
{
  return self->_progressTracker;
}

- (NSMutableSet)progressSet
{
  return self->_progressSet;
}

- (void)setProgressSet:(id)a3
{
}

- (THWExpandedRepController)expandedRepController
{
  return self->_expandedRepController;
}

- (THWImageCropAnimationController)imageCropAnimationController
{
  return self->_imageCropAnimationController;
}

- (double)resizeOriginalViewScale
{
  return self->_resizeOriginalViewScale;
}

- (void)setResizeOriginalViewScale:(double)a3
{
  self->_resizeOriginalViewScale = a3;
}

- (CGRect)resizeOriginalLayoutFrame
{
  double x = self->_resizeOriginalLayoutFrame.origin.x;
  double y = self->_resizeOriginalLayoutFrame.origin.y;
  double width = self->_resizeOriginalLayoutFrame.size.width;
  double height = self->_resizeOriginalLayoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setResizeOriginalLayoutFrame:(CGRect)a3
{
  self->_resizeOriginalLayoutFrame = a3;
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