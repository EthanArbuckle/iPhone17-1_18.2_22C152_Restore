@interface THWReviewRep
- (BCProgressTrackingRepTracker)progressTracker;
- (BOOL)allowSelectionPopover;
- (BOOL)allowSelectionPopoverForPagedCanvasController:(id)a3;
- (BOOL)canExpand;
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)control:(id)a3 isInteractionEnabledForRep:(id)a4;
- (BOOL)controlContainer:(id)a3 allowTrackingContainedRep:(id)a4;
- (BOOL)deferViewCreationForScrollableCanvasController:(id)a3;
- (BOOL)expandedHasContentForPanel:(int)a3;
- (BOOL)expandedIsRelatedCanvasScrolling;
- (BOOL)expandedPanelAlwaysVisible;
- (BOOL)expandedShouldDismissOnChangeFromSizeClassPairWithController:(id)a3 flowMode:(BOOL)a4;
- (BOOL)expandedWantsContentsRectAnimation;
- (BOOL)freeTransformUseTracedShadowPath;
- (BOOL)handleGesture:(id)a3;
- (BOOL)handlingPress;
- (BOOL)infosChangeForViewportChangeInScrollableCanvasController:(id)a3;
- (BOOL)isExpanded;
- (BOOL)isFreeTransformInProgress;
- (BOOL)isRelatedCanvasScrollingForScrollableCanvasController:(id)a3;
- (BOOL)meetsStageDimensionRequirementForExpanded;
- (BOOL)p_questionCanBeChecked:(id)a3;
- (BOOL)pagedCanvasController:(id)a3 allowsEditMenuForRep:(id)a4;
- (BOOL)pagedCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5;
- (BOOL)pagedCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4;
- (BOOL)pagedCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5;
- (BOOL)pagedCanvasController:(id)a3 shouldDisableScrollingAtContentEdgesForScrollView:(id)a4;
- (BOOL)pagedCanvasController:(id)a3 shouldDisableScrollingWhenCursorIsHiddenForScrollView:(id)a4;
- (BOOL)pagedCanvasControllerDeferViewCreation:(id)a3;
- (BOOL)pagedCanvasControllerIsRelatedCanvasScrolling:(id)a3;
- (BOOL)reviewQuestionIsCurrentlyInView:(id)a3;
- (BOOL)scrollableCanvasController:(id)a3 allowsEditMenuForRep:(id)a4;
- (BOOL)scrollableCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5;
- (BOOL)scrollableCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5;
- (BOOL)scrollableCanvasControllerUseOverlayScrollerOnly:(id)a3;
- (BOOL)shouldAnimateTargetLayer:(id)a3;
- (BOOL)shouldFadeInTargetLayer:(id)a3;
- (BOOL)shouldFadeOutAnimationLayer:(id)a3;
- (BOOL)shouldRecognizePressOnRep:(id)a3;
- (BOOL)tracksScore;
- (BOOL)wantsPressAction;
- (BOOL)wantsPressAnimation;
- (CALayer)pressableAnimationLayer;
- (CALayer)pressableAnimationShadowLayer;
- (CALayer)stageFillLayer;
- (CAShapeLayer)stageStrokeLayer;
- (CGAffineTransform)freeTransform;
- (CGRect)ftcTargetFrame;
- (CGRect)pressableNaturalBounds;
- (CGRect)rectForCompletion;
- (CGSize)expandedMinimumContentSize;
- (CGSize)sizeOfCanvasForScrollableCanvasController:(id)a3;
- (NSMutableDictionary)cachedImages;
- (NSMutableDictionary)scrollableCanvasControllers;
- (THAnimationController)animationController;
- (THWExpandedRepController)expandedRepController;
- (THWFreeTransformableRepGestureTargetHandler)freeTransformableHandler;
- (THWPagedCanvasController)stageCanvasController;
- (THWPressableRepGestureTargetHandler)pressableHandler;
- (THWReviewControlsRep)controlsRep;
- (THWReviewRep)initWithLayout:(id)a3 canvas:(id)a4;
- (UIEdgeInsets)contentInsetsForScrollableCanvasController:(id)a3;
- (double)contentsScaleForScrollableCanvasController:(id)a3;
- (double)pagedCanvasController:(id)a3 adjustScale:(double)a4 andFrame:(CGRect *)a5;
- (double)pagedCanvasControllerContentsScale:(id)a3;
- (id)animationLayer;
- (id)bookNavigatorForScrollableCanvasController:(id)a3;
- (id)documentNavigatorForScrollableCanvasController:(id)a3;
- (id)expandedAdditionalChildLayoutsForPanel:(int)a3;
- (id)expandedChildInfosForPanel:(int)a3;
- (id)expandedLayoutGeometryForLayout:(id)a3 inPanel:(int)a4 withWidth:(double)a5 insets:(UIEdgeInsets)a6;
- (id)expandedRotationAnimationController;
- (id)hostICC;
- (id)maskLayerForScrollableCanvasController:(id)a3;
- (id)pAnimationLayer;
- (id)pAnimationView;
- (id)p_currentQuestion;
- (id)p_currentScrollableCanvasController;
- (id)p_dataController;
- (id)p_matchingAnswerStateForQuestion:(id)a3 temporaryMOC:(id)a4;
- (id)p_repForPage:(unint64_t)a3;
- (id)p_repForQuestion:(id)a3;
- (id)p_responseController;
- (id)pagedCanvasController:(id)a3 infosToDisplayForPageRange:(_NSRange)a4;
- (id)pagedCanvasController:(id)a3 primaryTargetForGesture:(id)a4;
- (id)reviewQuestion:(id)a3 cachedImageNamed:(id)a4;
- (id)reviewQuestionDraggingHostView:(id)a3;
- (id)scrollableCanvasController:(id)a3 actionForHyperlink:(id)a4 inRep:(id)a5 gesture:(id)a6;
- (id)scrollableCanvasController:(id)a3 infosToDisplayForViewport:(CGRect)a4;
- (id)scrollableCanvasController:(id)a3 primaryTargetForGesture:(id)a4;
- (id)scrollableCanvasHost;
- (id)shadowAnimationLayer;
- (id)shadowPath;
- (id)strokeLayerForScrollableCanvasController:(id)a3;
- (id)targetLayer;
- (id)transformLayer;
- (int)expandedAppearance;
- (int)expandedAppearanceForPanel:(int)a3;
- (int)p_computeCheckButtonStateDisabled:(BOOL *)a3;
- (int)p_evaluateAnswerToQuestion:(id)a3 updateScore:(BOOL)a4;
- (int)pressableAction;
- (int)reviewQuestion:(id)a3 radioStateForChoice:(unint64_t)a4 pressed:(BOOL)a5;
- (int)reviewQuestionInitialState:(id)a3;
- (unint64_t)pageCountForPagedCanvasController:(id)a3;
- (unint64_t)reviewQuestion:(id)a3 placardForTarget:(unint64_t)a4;
- (unint64_t)reviewQuestion:(id)a3 targetForPlacard:(unint64_t)a4;
- (unsigned)expandedAlignmentForLayout:(id)a3 inPanel:(int)a4;
- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5;
- (void)addAdditionalChildLayersToArray:(id)a3;
- (void)animationControllerDidPresent:(id)a3;
- (void)control:(id)a3 repWasAdded:(id)a4;
- (void)control:(id)a3 repWillBeRemoved:(id)a4;
- (void)dealloc;
- (void)didPresentExpandedPostCommit;
- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4;
- (void)expandedWillPresentWithController:(id)a3;
- (void)freeTransformDidEnd;
- (void)freeTransformWillBegin;
- (void)p_answersUpdated;
- (void)p_checkAllAnswers;
- (void)p_checkQuestionAnswer:(id)a3;
- (void)p_clearQuestionAnswer:(id)a3;
- (void)p_invalidateLayouts;
- (void)p_refreshQuestions;
- (void)p_relaxMinimizeInfosNextFrame;
- (void)p_resetQuestions;
- (void)p_updateButtonStates;
- (void)p_updatePersitentQuestionIndex:(unint64_t)a3;
- (void)p_updateQuestionIndex:(unint64_t)a3 animate:(BOOL)a4;
- (void)pagedCanvasController:(id)a3 customizeLayerHost:(id)a4;
- (void)pagedCanvasController:(id)a3 didScrollToPageIndex:(unint64_t)a4;
- (void)pagedCanvasController:(id)a3 mostVisiblePageChangedToPageIndex:(unint64_t)a4;
- (void)performanceModeChanged;
- (void)queryScore:(id)a3;
- (void)reparentAnimationLayerIfBackedByView:(id)a3;
- (void)reparentTargetLayerIfBackedByView:(id)a3;
- (void)reviewControls:(id)a3 buttonPressed:(int)a4;
- (void)reviewQuestion:(id)a3 associatePlacard:(unint64_t)a4 withTarget:(unint64_t)a5;
- (void)reviewQuestion:(id)a3 selectChoice:(unint64_t)a4;
- (void)reviewQuestion:(id)a3 unassociateTargets:(id)a4;
- (void)reviewQuestionDidUpdateState:(id)a3;
- (void)reviewQuestionInvalidateLayers:(id)a3;
- (void)scrollableCanvasController:(id)a3 customizeLayerHost:(id)a4;
- (void)setHandlingPress:(BOOL)a3;
- (void)setPressableHandler:(id)a3;
- (void)updateFromLayout;
- (void)viewScaleDidChange;
- (void)viewScrollWillChange;
- (void)viewScrollingEnded;
- (void)willBeginHandlingGesture:(id)a3;
- (void)willReplaceContentsFromRep:(id)a3;
@end

@implementation THWReviewRep

- (THWReviewRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)THWReviewRep;
  v4 = [(THWReviewRep *)&v6 initWithLayout:a3 canvas:a4];
  if (v4)
  {
    v4->_scrollableCanvasControllers = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->_cachedImages = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if ([(THWReviewRep *)v4 isExpanded]) {
      [THWReviewRep hostICC:v4 delegate];
    }
    else {
      [(THWReviewRep *)v4 interactiveCanvasController];
    }
    v4->_progressTracker = (BCProgressTrackingRepTracker *)TSUProtocolCast();
    v4->_tracksScore = 1;
    if (objc_msgSend(objc_msgSend(-[THWReviewRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler")) {
      v4->_freeTransformableHandler = -[THWFreeTransformableRepGestureTargetHandler initWithFreeTransformableRep:handler:]([THWFreeTransformableRepGestureTargetHandler alloc], "initWithFreeTransformableRep:handler:", v4, objc_msgSend(objc_msgSend(-[THWReviewRep hostICC](v4, "hostICC"), "widgetHost"), "freeTransformRepHandler"));
    }
  }
  return v4;
}

- (void)dealloc
{
  [(NSMutableDictionary *)self->_scrollableCanvasControllers enumerateKeysAndObjectsUsingBlock:&stru_45A3F8];

  v3.receiver = self;
  v3.super_class = (Class)THWReviewRep;
  [(THWReviewRep *)&v3 dealloc];
}

- (THWPressableRepGestureTargetHandler)pressableHandler
{
  if (!self->_pressableHandler)
  {
    objc_opt_class();
    [(THWReviewRep *)self interactiveCanvasController];
    id v3 = [(id)TSUDynamicCast() pressHandlerForPressableReps];
    if (v3)
    {
      v4 = [[THWPressableRepGestureTargetHandler alloc] initWithPressableRep:self pressHandler:v3];
      self->_pressableHandler = v4;
      [(THWPressableRepGestureTargetHandler *)v4 setEnabledOnlyIfWidgetInteractionDisabledOnPage:1];
    }
  }
  return self->_pressableHandler;
}

- (void)willReplaceContentsFromRep:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THWReviewRep;
  -[THWReviewRep willReplaceContentsFromRep:](&v6, "willReplaceContentsFromRep:");
  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    v5 = v4;
    if ([v4 isExpanded])
    {
      -[THWReviewRep p_updateQuestionIndex:animate:](self, "p_updateQuestionIndex:animate:", objc_msgSend(objc_msgSend(v5, "layout"), "questionIndex"), 0);
      -[self->_stageCanvasController setPageIndex:[-[THWReviewRep layout](self, "layout") questionIndex] animated:0];
      [(THWReviewRep *)self p_refreshQuestions];
    }
  }
}

- (void)updateFromLayout
{
  v30.receiver = self;
  v30.super_class = (Class)THWReviewRep;
  [(THWReviewRep *)&v30 updateFromLayout];
  unsigned __int8 v3 = [self layout].isExpanded;
  char v4 = v3;
  if (!self->_stageFillLayer && (v3 & 1) == 0)
  {
    self->_stageFillLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    [self->_stageFillLayer setBackgroundColor:[+[TSUColor whiteColor](TSUColor, "whiteColor") CGColor]];
    [(CALayer *)self->_stageFillLayer setOpaque:1];
    [(CALayer *)self->_stageFillLayer setDelegate:[(THWReviewRep *)self interactiveCanvasController]];
  }
  if (self->_stageStrokeLayer) {
    char v5 = 1;
  }
  else {
    char v5 = v4;
  }
  if ((v5 & 1) == 0)
  {
    objc_super v6 = (CAShapeLayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionShapeLayer);
    self->_stageStrokeLayer = v6;
    [(CAShapeLayer *)v6 setFillColor:0];
    [(CAShapeLayer *)self->_stageStrokeLayer setLineWidth:1.0];
    [(CAShapeLayer *)self->_stageStrokeLayer setStrokeColor:[+[TSUColor colorWithWhite:0.0 alpha:0.100000001] CGColor]];
    [(CAShapeLayer *)self->_stageStrokeLayer setDelegate:[(THWReviewRep *)self interactiveCanvasController]];
  }
  [self canvas].viewScale;
  memset(&v29, 0, sizeof(v29));
  CGAffineTransformMakeScale(&v29, v7, v7);
  [self layout].stageFrame;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  TSDCenterOfRect();
  float64x2_t v26 = vaddq_f64(*(float64x2_t *)&v29.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v29.c, v16), *(float64x2_t *)&v29.a, v17));
  v31.origin.double x = v9;
  v31.origin.double y = v11;
  v31.size.double width = v13;
  v31.size.double height = v15;
  CGRectInset(v31, 1.0, 1.0);
  TSDRectWithSize();
  -[CALayer setBounds:](self->_stageFillLayer, "setBounds:");
  -[CALayer setPosition:](self->_stageFillLayer, "setPosition:");
  CGAffineTransform v28 = v29;
  [(CALayer *)self->_stageFillLayer setAffineTransform:&v28];
  if (self->_stageStrokeLayer)
  {
    TSDRectWithSize();
    double x = v32.origin.x;
    double y = v32.origin.y;
    double width = v32.size.width;
    double height = v32.size.height;
    CGRect v33 = CGRectInset(v32, 0.5, 0.5);
    double v22 = v33.origin.x;
    double v23 = v33.origin.y;
    double v24 = v33.size.width;
    double v25 = v33.size.height;
    -[CAShapeLayer setBounds:](self->_stageStrokeLayer, "setBounds:", x, y, width, height);
    [(CAShapeLayer *)self->_stageStrokeLayer setPath:[+[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", v22, v23, v24, v25) CGPath]];
    [(CAShapeLayer *)self->_stageStrokeLayer setPosition:*(_OWORD *)&v26];
    CGAffineTransform v27 = v29;
    [(CAShapeLayer *)self->_stageStrokeLayer setAffineTransform:&v27];
  }
}

- (void)viewScaleDidChange
{
  if ([(THWReviewRep *)self pressableHandler]) {
    BOOL v3 = [(THWPressableRepGestureTargetHandler *)[(THWReviewRep *)self pressableHandler] widgetInteractionEnabled];
  }
  else {
    BOOL v3 = 1;
  }
  stageCanvasController = self->_stageCanvasController;

  [(THWPagedCanvasController *)stageCanvasController setUserInteractionEnabled:v3];
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWReviewRep;
  -[THWReviewRep addAdditionalChildLayersToArray:](&v5, "addAdditionalChildLayersToArray:");
  if (self->_stageFillLayer) {
    [a3 addObject:];
  }
  if (self->_stageStrokeLayer) {
    [a3 addObject:];
  }
}

- (BOOL)control:(id)a3 isInteractionEnabledForRep:(id)a4
{
  if (![(THWReviewRep *)self pressableHandler]) {
    return 1;
  }
  objc_super v5 = [(THWReviewRep *)self pressableHandler];

  return [(THWPressableRepGestureTargetHandler *)v5 widgetInteractionEnabled];
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  switch((unint64_t)[a3 tag])
  {
    case 0uLL:

      self->_stageCanvasController = 0;
      objc_opt_class();
      self->_stageCanvasController = (THWPagedCanvasController *)[(id)TSUDynamicCast() pagedCanvasController];
      if ([(THWReviewRep *)self performanceMode]) {
        [(THWPagedCanvasController *)self->_stageCanvasController setMinimizeInfoChange:1];
      }
      stageCanvasController = self->_stageCanvasController;
      goto LABEL_10;
    case 1uLL:
      objc_opt_class();
      CGFloat v7 = (THWReviewControlsRep *)TSUDynamicCast();
      self->_controlsRep = v7;
      [(THWReviewControlsRep *)v7 setDelegate:self];
      [(THWReviewRep *)self p_updateButtonStates];
      return;
    case 3uLL:
      id v8 = [a3 index];
      [(NSMutableDictionary *)self->_scrollableCanvasControllers removeObjectForKey:+[NSNumber numberWithUnsignedInteger:v8]];
      objc_opt_class();
      id v9 = [(id)TSUDynamicCast() scrollableCanvasController];
      [(NSMutableDictionary *)self->_scrollableCanvasControllers setObject:v9 forKeyedSubscript:+[NSNumber numberWithUnsignedInteger:v8]];
      [v9 setInstanceData:[NSNumber numberWithUnsignedInteger:v8]];
      [v9 setUpdateCanvasSizeOnLayout:1];
      stageCanvasController = v9;
      goto LABEL_10;
    case 4uLL:
    case 5uLL:
      objc_opt_class();
      stageCanvasController = (void *)TSUDynamicCast();
LABEL_10:
      [stageCanvasController setDelegate:self];
      break;
    default:
      return;
  }
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  if ([(THWReviewControlsRep *)self->_controlsRep layout] == a3)
  {
    self->_controlsRep = 0;
  }
  else if ([a3 tag] == (char *)&dword_0 + 3)
  {
    id v6 = [a3 index];
    [self->_scrollableCanvasControllers[+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v6)] setDelegate:0];
    scrollableCanvasControllers = self->_scrollableCanvasControllers;
    id v8 = +[NSNumber numberWithUnsignedInteger:v6];
    [(NSMutableDictionary *)scrollableCanvasControllers removeObjectForKey:v8];
  }
}

- (void)performanceModeChanged
{
  if (![(THWReviewRep *)self performanceMode])
  {
    [(THWReviewRep *)self p_relaxMinimizeInfosNextFrame];
  }
}

- (void)p_relaxMinimizeInfosNextFrame
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_185350;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  [self.interactiveCanvasController performBlockNextFrame:v2];
}

- (void)viewScrollWillChange
{
}

- (void)viewScrollingEnded
{
}

- (BOOL)controlContainer:(id)a3 allowTrackingContainedRep:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [a4 allowTrackingInControlContainer:a3];
}

- (BOOL)pagedCanvasController:(id)a3 shouldDisableScrollingAtContentEdgesForScrollView:(id)a4
{
  return 1;
}

- (BOOL)pagedCanvasController:(id)a3 shouldDisableScrollingWhenCursorIsHiddenForScrollView:(id)a4
{
  return [self layout:a3, a4].isExpanded ^ 1;
}

- (unint64_t)pageCountForPagedCanvasController:(id)a3
{
  if (self->_stageCanvasController != a3) {
    return 0;
  }
  id v4 = [(THWReviewRep *)self layout];

  return (unint64_t)[v4 numberOfStagePages];
}

- (id)pagedCanvasController:(id)a3 infosToDisplayForPageRange:(_NSRange)a4
{
  if (self->_stageCanvasController != a3) {
    return 0;
  }
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = [(THWReviewRep *)self layout];

  return [v7 infosForStagePages:location length];
}

- (void)p_updateQuestionIndex:(unint64_t)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  if (objc_msgSend(-[THWReviewRep layout](self, "layout"), "questionIndex") != (id)a3)
  {
    [self layout].setQuestionIndex:a3;
    if (self->_expandedRepController
      && objc_msgSend(-[THWReviewRep layout](self, "layout"), "usePhoneLayout"))
    {
      if (v4) {
        [(THWExpandedRepController *)self->_expandedRepController expandedRepControllerAnimatePanel:0 withCrossFadeContent:1 backgroundLayout:1 duration:0.15];
      }
      [(THWExpandedRepController *)self->_expandedRepController expandedRepControllerInvalidateChildrenInPanel:0 invalidateWPAuto:0];
    }
    [(THWReviewRep *)self p_updatePersitentQuestionIndex:a3];
    [(THWReviewRep *)self p_updateButtonStates];
  }
}

- (void)pagedCanvasController:(id)a3 mostVisiblePageChangedToPageIndex:(unint64_t)a4
{
}

- (void)pagedCanvasController:(id)a3 didScrollToPageIndex:(unint64_t)a4
{
  [(THWReviewRep *)self p_updateQuestionIndex:a4 animate:0];
  if (objc_msgSend(objc_msgSend(-[THWReviewRep info](self, "info"), "questions"), "count") == (id)a4)
  {
    [(THWReviewRep *)self p_checkAllAnswers];
  }
}

- (id)pagedCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  if (![(THWPressableRepGestureTargetHandler *)[(THWReviewRep *)self pressableHandler] canHandleGesture:a4])return 0; {

  }
  return [(THWReviewRep *)self pressableHandler];
}

- (void)pagedCanvasController:(id)a3 customizeLayerHost:(id)a4
{
  if (self->_stageCanvasController == a3)
  {
    [a3 setPageIndex:[-[THWReviewRep layout](self, "layout") questionIndex] animated:0];
    [self layout].stageCornerRadius;
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "layerHost"), "clippingLayer"), "setCornerRadius:", v6);
    objc_msgSend(objc_msgSend(a4, "layer"), "setBackgroundColor:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "CGColor"));
    objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "setAllowsPinchZoom:", 0);
    if ([(THWReviewRep *)self pressableHandler]) {
      BOOL v7 = [(THWPressableRepGestureTargetHandler *)[(THWReviewRep *)self pressableHandler] widgetInteractionEnabled];
    }
    else {
      BOOL v7 = 1;
    }
    stageCanvasController = self->_stageCanvasController;
    [(THWPagedCanvasController *)stageCanvasController setUserInteractionEnabled:v7];
  }
}

- (BOOL)pagedCanvasControllerDeferViewCreation:(id)a3
{
  id v3 = [(THWReviewRep *)self interactiveCanvasController];

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
  return 1;
}

- (double)pagedCanvasControllerContentsScale:(id)a3
{
  id v3 = [[self interactiveCanvasController] canvas];

  [v3 contentsScale];
  return result;
}

- (BOOL)pagedCanvasControllerIsRelatedCanvasScrolling:(id)a3
{
  id v3 = [(THWReviewRep *)self interactiveCanvasController];

  return [v3 currentlyScrolling];
}

- (BOOL)pagedCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4
{
  return 0;
}

- (double)pagedCanvasController:(id)a3 adjustScale:(double)a4 andFrame:(CGRect *)a5
{
  if (a5)
  {
    double Width = CGRectGetWidth(*a5);
    if (self->_stageCanvasController == a3)
    {
      [self layout:Width stageFrame];
      double Width = CGRectGetWidth(v12);
    }
    double v10 = Width;
    if (Width > 0.0)
    {
      objc_msgSend(objc_msgSend(-[THWReviewRep interactiveCanvasController](self, "interactiveCanvasController"), "canvas"), "contentsScale");
      TSDRoundedRectForScale();
      *a5 = v13;
      return CGRectGetWidth(v13) / v10;
    }
  }
  return a4;
}

- (void)reviewControls:(id)a3 buttonPressed:(int)a4
{
  if (a4 == 2)
  {
    unsigned int v8 = [(THWReviewRep *)self p_computeCheckButtonStateDisabled:0];
    if (v8)
    {
      if (v8 == 3)
      {
        [(THWReviewRep *)self p_resetQuestions];
      }
      else
      {
        id v12 = [(THWReviewRep *)self p_currentQuestion];
        [(THWReviewRep *)self p_clearQuestionAnswer:v12];
      }
    }
    else
    {
      id v11 = [(THWReviewRep *)self p_currentQuestion];
      [(THWReviewRep *)self p_checkQuestionAnswer:v11];
    }
  }
  else
  {
    if (a4 == 1)
    {
      double v10 = (char *)[self layout:a3 numberOfStagePages];
      double v6 = (char *)[(THWPagedCanvasController *)self->_stageCanvasController pageIndex] + 1;
      if (v6 >= v10) {
        return;
      }
      stageCanvasController = self->_stageCanvasController;
    }
    else
    {
      if (a4) {
        return;
      }
      unint64_t v5 = [(THWPagedCanvasController *)self->_stageCanvasController pageIndex];
      if (!v5) {
        return;
      }
      double v6 = (char *)(v5 - 1);
      stageCanvasController = self->_stageCanvasController;
    }
    [(THWPagedCanvasController *)stageCanvasController setPageIndex:v6 animated:1];
  }
}

- (id)pAnimationView
{
  id v2 = [(NSMutableDictionary *)self->_scrollableCanvasControllers objectForKeyedSubscript:+[NSNumber numberWithUnsignedInteger:[(THWPagedCanvasController *)self->_stageCanvasController pageIndex]]];

  return [v2 mainView];
}

- (id)pAnimationLayer
{
  id v2 = [(THWReviewRep *)self pAnimationView];

  return [v2 layer];
}

- (BOOL)shouldAnimateTargetLayer:(id)a3
{
  return 0;
}

- (id)animationLayer
{
  if (![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWReviewRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress]|| (id result = [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWReviewRep *)self freeTransformableHandler] ftc] freeTransformLayer]) == 0)
  {
    return [(THWReviewRep *)self pAnimationLayer];
  }
  return result;
}

- (void)reparentAnimationLayerIfBackedByView:(id)a3
{
  id v4 = [(THWReviewRep *)self pAnimationView];
  if (v4)
  {
    id v5 = v4;
    id v6 = [(TSDCanvasLayerHosting *)[(THWPagedCanvasController *)self->_stageCanvasController layerHost] subviewsController];
    id v7 = v5;
    [v6 addSubviews:[NSArray arrayWithObjects:count:&v7, 1]];
  }
}

- (id)shadowAnimationLayer
{
  if (![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWReviewRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress])return 0; {
  id v3 = [(THWFreeTransformableRepGestureTargetHandler *)[(THWReviewRep *)self freeTransformableHandler] ftc];
  }

  return [(THWFreeTransformController *)v3 shadowLayer];
}

- (BOOL)shouldFadeOutAnimationLayer:(id)a3
{
  if (![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWReviewRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress])return 1; {
  id v4 = [(THWFreeTransformableRepGestureTargetHandler *)[(THWReviewRep *)self freeTransformableHandler] ftc];
  }

  return [(THWFreeTransformController *)v4 passedThreshold];
}

- (CGAffineTransform)freeTransform
{
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  id result = (CGAffineTransform *)[(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWReviewRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress];
  if (result)
  {
    id result = [(THWFreeTransformableRepGestureTargetHandler *)[(THWReviewRep *)self freeTransformableHandler] ftc];
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
    *(_OWORD *)&retstr->tdouble x = v10;
  }
  return result;
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

- (BOOL)wantsPressAnimation
{
  id v2 = [(THWReviewRep *)self pressableHandler];

  return [(THWPressableRepGestureTargetHandler *)v2 widgetInteractionDisabledOnPage];
}

- (BOOL)wantsPressAction
{
  if ([(THWReviewRep *)self meetsStageDimensionRequirementForExpanded]
    || (BOOL v3 = [(THWPressableRepGestureTargetHandler *)[(THWReviewRep *)self pressableHandler] widgetInteractionDisabledOnPage]))
  {
    LOBYTE(v3) = [(THWReviewRep *)self pressableAction] != 0;
  }
  return v3;
}

- (BOOL)shouldRecognizePressOnRep:(id)a3
{
  return [self layout:@"layout" a3].isExpanded ^ 1;
}

- (int)pressableAction
{
  return 2;
}

- (CGRect)pressableNaturalBounds
{
  id v2 = [(THWReviewRep *)self layout];

  [v2 stageFrame];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)queryScore:(id)a3
{
  [(THWReviewRep *)self layout];
  double v4 = (void *)TSUProtocolCast();
  if (v4)
  {
    double v5 = v4;
    double v6 = (double)(unint64_t)[v4 reviewSummaryCorrectCount];
    double v7 = (double)(unint64_t)[v5 reviewSummaryQuestionCount];
    if (!a3) {
      return;
    }
  }
  else
  {
    double v6 = 0.0;
    double v7 = 0.0;
    if (!a3) {
      return;
    }
  }
  long long v8 = +[NSNumber numberWithDouble:v6];
  long long v9 = +[NSNumber numberWithDouble:v7];
  long long v10 = (void (*)(id, NSNumber *, NSNumber *))*((void *)a3 + 2);

  v10(a3, v8, v9);
}

- (BOOL)shouldFadeInTargetLayer:(id)a3
{
  return 1;
}

- (id)targetLayer
{
  if ([(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWReviewRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress]&& ![(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWReviewRep *)self freeTransformableHandler] ftc] passedThreshold])
  {
    return 0;
  }

  return [(THWReviewRep *)self pAnimationLayer];
}

- (void)reparentTargetLayerIfBackedByView:(id)a3
{
  id v4 = [(THWReviewRep *)self pAnimationView];
  if (v4)
  {
    id v5 = v4;
    id v6 = [(TSDCanvasLayerHosting *)[(THWPagedCanvasController *)self->_stageCanvasController layerHost] subviewsController];
    id v7 = v5;
    [v6 addSubviews:[NSArray arrayWithObjects:count:&v7, 1]];
  }
}

- (CGRect)ftcTargetFrame
{
  if ([(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWReviewRep *)self freeTransformableHandler] ftc] isFreeTransformInProgress])
  {
    [(THWFreeTransformController *)[(THWFreeTransformableRepGestureTargetHandler *)[(THWReviewRep *)self freeTransformableHandler] ftc] completionTargetRect];
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

- (id)hostICC
{
  return [*(id *)&self->super.TSDContainerRep_opaque[OBJC_IVAR___TSDRep_mCanvas] canvasController];
}

- (BOOL)expandedWantsContentsRectAnimation
{
  return 1;
}

- (BOOL)expandedPanelAlwaysVisible
{
  return 1;
}

- (BOOL)expandedIsRelatedCanvasScrolling
{
  id v2 = [(THWPagedCanvasController *)self->_stageCanvasController interactiveCanvasController];

  return [(TSDInteractiveCanvasController *)v2 currentlyScrolling];
}

- (BOOL)expandedShouldDismissOnChangeFromSizeClassPairWithController:(id)a3 flowMode:(BOOL)a4
{
  id v5 = [(THWReviewRep *)self layout];
  if (v5)
  {
    id v6 = v5;
    if ([v5 isExpandedOnly]) {
      LOBYTE(v5) = 0;
    }
    else {
      LOBYTE(v5) = ([v6 usePhoneLayout] | a4) ^ 1;
    }
  }
  return (char)v5;
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
    return self->_animationController;
  }
  return result;
}

- (void)animationControllerDidPresent:(id)a3
{
  self->_animationController = 0;
}

- (void)expandedWillPresentWithController:(id)a3
{
  self->_expandedRepController = (THWExpandedRepController *)a3;
}

- (unsigned)expandedMaxLineCountForTextLayout:(id)a3 inPanel:(int)a4 withDefault:(unsigned int)a5
{
  if (!a4 && objc_msgSend(-[THWReviewRep layout](self, "layout", a3), "usePhoneLayout")) {
    return 1;
  }
  return a5;
}

- (void)p_invalidateLayouts
{
  id v3 = [(THWReviewRep *)self layout];
  [v3 invalidateFrame];
  [v3 invalidateChildren];
  [self interactiveCanvasController].layoutIfNeeded;
  [(THWPagedCanvasController *)[(THWReviewRep *)self stageCanvasController] invalidateLayoutsAndFrames];
  id v4 = [(THWPagedCanvasController *)[(THWReviewRep *)self stageCanvasController] interactiveCanvasController];

  [(TSDInteractiveCanvasController *)v4 layoutIfNeeded];
}

- (void)expandedWidgetLayoutFrameDidChangeFromFrame:(CGRect)a3 toFrame:(CGRect)a4
{
}

- (int)expandedAppearance
{
  return 1;
}

- (int)expandedAppearanceForPanel:(int)a3
{
  return 1;
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  if (a3 == 1) {
    return 1;
  }
  if (a3) {
    return 0;
  }
  if (objc_msgSend(-[THWReviewRep layout](self, "layout"), "usePhoneLayout")) {
    return 1;
  }
  id v5 = [(THWReviewRep *)self layout];

  return [v5 hasTitle];
}

- (id)expandedLayoutGeometryForLayout:(id)a3 inPanel:(int)a4 withWidth:(double)a5 insets:(UIEdgeInsets)a6
{
  long long v9 = (char *)[(id)TSUProtocolCast() tag];
  if (a4 != 1 || v9 != (unsigned char *)&dword_0 + 1) {
    return 0;
  }
  double y = CGPointZero.y;
  [self layout].controlsSizeWithPanelWidth:a5;
  id v13 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:CGPointZero.x, y, v11, v12];

  return v13;
}

- (unsigned)expandedAlignmentForLayout:(id)a3 inPanel:(int)a4
{
  if ([(id)TSUProtocolCast() tag] == (char *)&dword_0 + 1) {
    return 2;
  }
  else {
    return 4;
  }
}

- (id)expandedChildInfosForPanel:(int)a3
{
  if (a3) {
    return 0;
  }
  id v5 = objc_msgSend(objc_msgSend(-[THWReviewRep info](self, "info"), "questions"), "count");
  unint64_t v6 = [(THWPagedCanvasController *)self->_stageCanvasController pageIndex];
  if (objc_msgSend(-[THWReviewRep layout](self, "layout"), "usePhoneLayout") && (unint64_t)v5 >= 2)
  {
    id v7 = [(THWReviewRep *)self layout];
    if (v6 >= (unint64_t)v5)
    {
      id v8 = [v7 summaryTitleStorage];
    }
    else
    {
      id v8 = [v7 questionNumberStorageAtPageIndex:v6];
      if (!v8) {
        return 0;
      }
    }
  }
  else
  {
    id v8 = [[[self info] adornmentInfo] title].containedStorage;
    if (!v8) {
      return 0;
    }
  }

  return +[NSArray arrayWithObject:v8];
}

- (id)expandedAdditionalChildLayoutsForPanel:(int)a3
{
  if (a3 != 1) {
    return 0;
  }
  id v3 = [[self layout] controlsLayout];
  if (!v3) {
    return 0;
  }

  return +[NSArray arrayWithObject:v3];
}

- (id)expandedRotationAnimationController
{
  id v2 = [[THWReviewRotationAnimationController alloc] initWithRep:self];

  return v2;
}

- (CGSize)expandedMinimumContentSize
{
  id v2 = [(THWReviewRep *)self layout];

  [v2 minimumContentSize];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)didPresentExpandedPostCommit
{
}

- (BOOL)canHandleGesture:(id)a3
{
  if ([(THWReviewRep *)self isExpanded]
    && [(THWFreeTransformableRepGestureTargetHandler *)[(THWReviewRep *)self freeTransformableHandler] canHandleGesture:a3]|| [(THWPressableRepGestureTargetHandler *)[(THWReviewRep *)self pressableHandler] canHandleGesture:a3])
  {
    return 1;
  }
  [a3 naturalLocationForRep:self];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [self layout].stageFrame;
  v12.double x = v7;
  v12.double y = v9;
  BOOL v10 = CGRectContainsPoint(v13, v12);
  id v11 = [a3 gestureKind];
  return v11 == (id)TSWPImmediateDoubleTap && v10;
}

- (BOOL)handleGesture:(id)a3
{
  if ((![(THWFreeTransformableRepGestureTargetHandler *)[(THWReviewRep *)self freeTransformableHandler] canHandleGesture:a3]|| ![(THWFreeTransformableRepGestureTargetHandler *)[(THWReviewRep *)self freeTransformableHandler] handleGesture:a3])&& (![(THWPressableRepGestureTargetHandler *)[(THWReviewRep *)self pressableHandler] canHandleGesture:a3]|| ![(THWPressableRepGestureTargetHandler *)[(THWReviewRep *)self pressableHandler] handleGesture:a3]))
  {
    [a3 naturalLocationForRep:self];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    [self layout].stageFrame;
    v13.double x = v6;
    v13.double y = v8;
    BOOL v9 = CGRectContainsPoint(v14, v13);
    id v10 = [a3 gestureKind];
    if (v10 != (id)TSWPImmediateDoubleTap || !v9) {
      return 0;
    }
    [a3 gestureState];
  }
  return 1;
}

- (void)willBeginHandlingGesture:(id)a3
{
  id v5 = [a3 gestureKind];
  if (v5 == (id)TSDFreeTransform)
  {
    CGFloat v6 = [(THWReviewRep *)self freeTransformableHandler];
    [(THWFreeTransformableRepGestureTargetHandler *)v6 willBeginHandlingGesture:a3];
  }
}

- (id)reviewQuestion:(id)a3 cachedImageNamed:(id)a4
{
  if (!a4) {
    return 0;
  }
  id v6 = [(NSMutableDictionary *)self->_cachedImages objectForKey:a4];
  if (!v6)
  {
    id v6 = +[TSUImage imageNamed:a4 inBundle:THBundle()];
    if (v6) {
      [(NSMutableDictionary *)self->_cachedImages setObject:v6 forKey:a4];
    }
  }
  return v6;
}

- (int)reviewQuestionInitialState:(id)a3
{
  id v5 = [(THWReviewRep *)self p_responseController];
  id v6 = objc_msgSend(objc_msgSend(a3, "questionLayout"), "question");
  id v7 = [v5 newTemporateReviewResponseMOC];
  id v8 = [v5 responseForQuestionID:[v6 questionID] temporaryMOC:v7];
  if ([v8 userHasCheckedAnswer])
  {
    int v9 = [(THWReviewRep *)self p_evaluateAnswerToQuestion:v6 updateScore:0];
  }
  else if (objc_msgSend(objc_msgSend(v8, "answerState"), "hasUserSelected"))
  {
    int v9 = 2;
  }
  else
  {
    int v9 = 1;
  }

  return v9;
}

- (void)reviewQuestionDidUpdateState:(id)a3
{
}

- (void)reviewQuestion:(id)a3 selectChoice:(unint64_t)a4
{
  id v7 = objc_msgSend(objc_msgSend(a3, "questionLayout"), "question");
  id v8 = [(THWReviewRep *)self p_responseController];
  id v9 = [v8 responseForQuestionID:[v7 questionID]];
  objc_opt_class();
  [v9 answerState];
  id v10 = objc_msgSend(objc_msgSend((id)TSUDynamicCast(), "selectedChoices"), "mutableCopy");
  if (!v10) {
    id v10 = objc_alloc_init((Class)NSMutableIndexSet);
  }
  if ([v7 cardinality] == 2)
  {
    if ([v10 containsIndex:a4]) {
      [v10 removeIndex:a4];
    }
    else {
      [v10 addIndex:a4];
    }
    id v11 = (char *)objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "questionLayout"), "question"), "choices"), "count");
    if (v11)
    {
      CGPoint v12 = v11;
      for (i = 0; i != v12; ++i)
      {
        if ((char *)a4 != i && [a3 reviewQuestionStateForChoiceIndex:i] == 2) {
          [v10 removeIndex:i];
        }
      }
    }
  }
  else
  {
    [v10 removeAllIndexes];
    [v10 addIndex:a4];
  }
  [a3 setQuestionState:2];
  if ([v10 count])
  {
    CGRect v14 = objc_alloc_init(TSWReviewMultiChoiceAnswerState);
    -[TSWReviewMultiChoiceAnswerState setSelectedChoices:](v14, "setSelectedChoices:", [v10 copy]);
  }
  else
  {
    CGRect v14 = 0;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_186A94;
  v15[3] = &unk_456E38;
  v15[4] = v9;
  v15[5] = v14;
  [v8 mutateResponse:v9 block:v15];

  [(THWReviewRep *)self p_answersUpdated];
  [a3 reviewQuestionAnswerUpdated];
  [(THWReviewRep *)self reviewQuestionInvalidateLayers:a3];
}

- (int)reviewQuestion:(id)a3 radioStateForChoice:(unint64_t)a4 pressed:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = objc_msgSend(objc_msgSend(a3, "questionLayout"), "question");
  id v10 = [(THWReviewRep *)self reviewQuestionResponseController:a3];
  id v11 = [v10 newTemporateReviewResponseMOC];
  id v12 = [v10 responseForQuestionID:[v9 questionID] temporaryMOC:v11];
  objc_opt_class();
  [v12 answerState];
  CGPoint v13 = (void *)TSUDynamicCast();
  CGRect v14 = v13;
  if (v5)
  {
    int v15 = [v9 cardinality] != 2
       || ([v14 selectedChoices] containsIndex:a4) & 1) == 0;
  }
  else if (objc_msgSend(objc_msgSend(v13, "selectedChoices"), "containsIndex:", a4))
  {
    int v15 = 2;
  }
  else
  {
    int v15 = 0;
  }

  return v15;
}

- (void)reviewQuestionInvalidateLayers:(id)a3
{
  double v3 = [(THWPagedCanvasController *)self->_stageCanvasController interactiveCanvasController];

  [(TSDInteractiveCanvasController *)v3 invalidateLayers];
}

- (BOOL)reviewQuestionIsCurrentlyInView:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "questionLayout"), "questionIndex");
  return v4 == (id)[(THWPagedCanvasController *)self->_stageCanvasController pageIndex];
}

- (void)reviewQuestion:(id)a3 unassociateTargets:(id)a4
{
  id v7 = objc_msgSend(objc_msgSend(a3, "questionLayout"), "question");
  id v8 = [(THWReviewRep *)self p_responseController];
  id v9 = [v8 newTemporateReviewResponseMOC];
  id v10 = [v8 responseForQuestionID:[v7 questionID]];
  id v11 = [(THWReviewRep *)self p_matchingAnswerStateForQuestion:a3 temporaryMOC:v9];
  if (!v11) {
    id v11 = objc_alloc_init(TSWReviewMatchingAnswerState);
  }
  id v12 = [a4 firstIndex];
  if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    for (id i = v12; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a4 indexGreaterThanIndex:i])
    {
      id v14 = [(TSWReviewMatchingAnswerState *)v11 placardForTarget:i];
      if (v14 != (id)0x7FFFFFFFFFFFFFFFLL) {
        [(TSWReviewMatchingAnswerState *)v11 setTarget:0x7FFFFFFFFFFFFFFFLL forPlacard:v14];
      }
    }
  }
  [a3 setQuestionState:2];
  id v15 = [(NSArray *)[(TSWReviewMatchingAnswerState *)v11 placardToTargetMap] copy];
  double v16 = objc_alloc_init(TSWReviewMatchingAnswerState);
  [(TSWReviewMatchingAnswerState *)v16 setPlacardToTargetMap:v15];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_186E1C;
  v17[3] = &unk_456E38;
  v17[4] = v10;
  v17[5] = v16;
  [v8 mutateResponse:v10 block:v17];

  [(THWReviewRep *)self p_answersUpdated];
  [a3 reviewQuestionAnswerUpdated];
  [(THWReviewRep *)self reviewQuestionInvalidateLayers:a3];
  [(THWReviewRep *)self reviewQuestionDidUpdateState:a3];
}

- (void)reviewQuestion:(id)a3 associatePlacard:(unint64_t)a4 withTarget:(unint64_t)a5
{
  id v9 = objc_msgSend(objc_msgSend(a3, "questionLayout"), "question");
  id v10 = [(THWReviewRep *)self p_responseController];
  id v11 = [v10 newTemporateReviewResponseMOC];
  id v12 = [v10 responseForQuestionID:[v9 questionID]];
  CGPoint v13 = [(THWReviewRep *)self p_matchingAnswerStateForQuestion:a3 temporaryMOC:v11];
  if (!v13) {
    CGPoint v13 = objc_alloc_init(TSWReviewMatchingAnswerState);
  }
  id v14 = [(TSWReviewMatchingAnswerState *)v13 targetForPlacard:a4];
  uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (a5 != 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v15 = [(TSWReviewMatchingAnswerState *)v13 placardForTarget:a5];
  }
  if (v14 != (id)a5)
  {
    if (v14 != (id)0x7FFFFFFFFFFFFFFFLL && v15 != 0x7FFFFFFFFFFFFFFFLL) {
      -[TSWReviewMatchingAnswerState setTarget:forPlacard:](v13, "setTarget:forPlacard:", v14);
    }
    [(TSWReviewMatchingAnswerState *)v13 setTarget:a5 forPlacard:a4];
    [a3 setQuestionState:2];
    id v16 = [(NSArray *)[(TSWReviewMatchingAnswerState *)v13 placardToTargetMap] copy];
    double v17 = objc_alloc_init(TSWReviewMatchingAnswerState);
    [(TSWReviewMatchingAnswerState *)v17 setPlacardToTargetMap:v16];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_18703C;
    v18[3] = &unk_456E38;
    v18[4] = v12;
    v18[5] = v17;
    [v10 mutateResponse:v12 block:v18];
  }
  [(THWReviewRep *)self p_answersUpdated];
  [a3 reviewQuestionAnswerUpdated];
  [(THWReviewRep *)self reviewQuestionInvalidateLayers:a3];
  [(THWReviewRep *)self reviewQuestionDidUpdateState:a3];
}

- (id)reviewQuestionDraggingHostView:(id)a3
{
  id v3 = [(THWReviewRep *)self interactiveCanvasController];

  return [v3 canvasView];
}

- (id)p_matchingAnswerStateForQuestion:(id)a3 temporaryMOC:(id)a4
{
  id v4 = objc_msgSend(-[THWReviewRep p_responseController](self, "p_responseController"), "responseForQuestionID:temporaryMOC:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "questionLayout"), "question"), "questionID"), a4);
  objc_opt_class();
  [v4 answerState];

  return (id)TSUDynamicCast();
}

- (unint64_t)reviewQuestion:(id)a3 placardForTarget:(unint64_t)a4
{
  id v7 = [[self p_responseController] newTemporateReviewResponseMOC];
  id v8 = [(THWReviewRep *)self p_matchingAnswerStateForQuestion:a3 temporaryMOC:v7];
  if (v8) {
    unint64_t v9 = (unint64_t)[v8 placardForTarget:a4];
  }
  else {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (unint64_t)reviewQuestion:(id)a3 targetForPlacard:(unint64_t)a4
{
  id v7 = [[self p_responseController] newTemporateReviewResponseMOC];
  id v8 = [(THWReviewRep *)self p_matchingAnswerStateForQuestion:a3 temporaryMOC:v7];
  if (v8) {
    unint64_t v9 = (unint64_t)[v8 targetForPlacard:a4];
  }
  else {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (id)p_responseController
{
  objc_opt_class();
  [self interactiveCanvasController].documentRoot;

  return (id)TSUDynamicCast();
}

- (id)p_dataController
{
  objc_opt_class();
  [self interactiveCanvasController].documentRoot;

  return (id)TSUDynamicCast();
}

- (id)p_currentQuestion
{
  unint64_t v3 = [(THWPagedCanvasController *)self->_stageCanvasController pageIndex];
  id v4 = [(THWReviewRep *)self info];

  return [v4 questionAtIndex:v3];
}

- (id)p_repForQuestion:(id)a3
{
  return (id)TSUClassAndProtocolCast();
}

- (id)p_repForPage:(unint64_t)a3
{
  id v4 = objc_msgSend(-[TSDInteractiveCanvasController layoutController](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController"), "layoutController"), "layoutForInfo:", objc_msgSend(objc_msgSend(-[THWReviewRep layout](self, "layout"), "infosForStagePages:", a3, 1), "lastObject"));
  objc_opt_class();
  [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)self->_stageCanvasController interactiveCanvasController] repForLayout:v4];

  return (id)TSUDynamicCast();
}

- (int)p_evaluateAnswerToQuestion:(id)a3 updateScore:(BOOL)a4
{
  BOOL v4 = a4;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1874FC;
  v8[3] = &unk_45A420;
  v8[4] = -[THWReviewRep p_repForQuestion:](self, "p_repForQuestion:");
  return [a3 evaluateAnswerWithResponseController:[self p_responseController] updateScore:v4 choiceBlock:v8];
}

- (void)p_updateButtonStates
{
  unsigned __int8 v7 = 0;
  [(THWReviewControlsRep *)self->_controlsRep setCheckAnswerButtonState:[(THWReviewRep *)self p_computeCheckButtonStateDisabled:&v7]];
  [(THWReviewControlsRep *)self->_controlsRep setCheckAnswerButtonDisabled:v7];
  unint64_t v3 = [(char *)-[THWReviewRep layout](self, "layout") questionCount];
  if (objc_msgSend(-[THWReviewRep layout](self, "layout"), "questionIndex") == (id)0x7FFFFFFFFFFFFFFFLL) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [self layout].questionIndex;
  }
  BOOL v5 = v3 == (unsigned char *)&dword_0 + 1 || v4 == 0;
  [(THWReviewControlsRep *)self->_controlsRep setPrevButtonHidden:v5];
  BOOL v6 = v4 >= v3 || v3 == (unsigned char *)&dword_0 + 1;
  [(THWReviewControlsRep *)self->_controlsRep setNextButtonHidden:v6];
}

- (int)p_computeCheckButtonStateDisabled:(BOOL *)a3
{
  id v5 = [(THWPagedCanvasController *)self->_stageCanvasController pageIndex];
  if (v5 == objc_msgSend(objc_msgSend(-[THWReviewRep info](self, "info"), "questions"), "count"))
  {
    char v6 = 0;
    LODWORD(v7) = 3;
    if (!a3) {
      return (int)v7;
    }
LABEL_15:
    *a3 = v6;
    return (int)v7;
  }
  id v7 = [(THWReviewRep *)self p_repForQuestion:[(THWReviewRep *)self p_currentQuestion]];
  if (!v7)
  {
LABEL_14:
    char v6 = 0;
    if (!a3) {
      return (int)v7;
    }
    goto LABEL_15;
  }
  id v8 = v7;
  switch([v7 questionState])
  {
    case 0u:
    case 1u:
      LODWORD(v7) = 0;
      char v6 = 1;
      if (a3) {
        goto LABEL_15;
      }
      break;
    case 2u:
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_13;
      }
      unsigned __int8 v9 = [v8 reviewQuestionIsAnswerCheckable];
      LODWORD(v7) = 0;
      char v6 = v9 ^ 1;
      if (a3) {
        goto LABEL_15;
      }
      break;
    case 3u:
    case 4u:
    case 5u:
      char v6 = 0;
      LODWORD(v7) = 1;
      if (a3) {
        goto LABEL_15;
      }
      break;
    case 6u:
      char v6 = 0;
      LODWORD(v7) = 2;
      if (a3) {
        goto LABEL_15;
      }
      break;
    default:
LABEL_13:
      LODWORD(v7) = 0;
      goto LABEL_14;
  }
  return (int)v7;
}

- (BOOL)p_questionCanBeChecked:(id)a3
{
  id v4 = [(THWReviewRep *)self p_responseController];
  id v5 = [v4 newTemporateReviewResponseMOC];
  id v6 = [v4 responseForQuestionID:[a3 questionID] temporaryMOC:v5];
  if (v6)
  {
    if ([a3 type] == 2)
    {
      objc_opt_class();
      [v6 answerState];
      id v7 = (void *)TSUDynamicCast();
      if (!v7) {
        [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:@"-[THWReviewRep p_questionCanBeChecked:]"] file:+[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewRep.m"] lineNumber:1561 description:@"invalid nil value for '%s'", "matchingAnswerState"];
      }
      id v8 = [v7 numSelectedTargets];
      if (v8 != objc_msgSend(objc_msgSend(a3, "choices"), "count")) {
        goto LABEL_6;
      }
    }
    else if (!objc_msgSend(objc_msgSend(v6, "answerState"), "hasUserSelected"))
    {
LABEL_6:
      LOBYTE(v6) = 0;
      goto LABEL_9;
    }
    LODWORD(v6) = [v6 userHasCheckedAnswer] ^ 1;
  }
LABEL_9:

  return (char)v6;
}

- (void)p_checkQuestionAnswer:(id)a3
{
  id v5 = [(THWReviewRep *)self p_responseController];
  id v6 = [v5 responseForQuestionID:[a3 questionID]];
  if (objc_msgSend(objc_msgSend(v6, "answerState"), "hasUserSelected"))
  {
    [self p_repForQuestion:a3 setQuestionState:[self p_evaluateAnswerToQuestion:a3 updateScore:1]];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_187968;
    v7[3] = &unk_456DE0;
    v7[4] = v6;
    [v5 mutateResponse:v6 block:v7];
    [(THWReviewRep *)self p_answersUpdated];
  }
}

- (void)p_clearQuestionAnswer:(id)a3
{
  id v5 = [(THWReviewRep *)self p_responseController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_187A50;
  v7[3] = &unk_456DE0;
  id v8 = [v5 responseForQuestionID:[a3 questionID]];
  [v5 mutateResponse:v8 block:v7];
  [self p_repForQuestion:a3 setQuestionState:1];
  id v6 = [(THWReviewRep *)self p_repForQuestion:a3];
  [(THWReviewRep *)self p_answersUpdated];
  [v6 reviewQuestionAnswerUpdated];
}

- (void)p_answersUpdated
{
  objc_msgSend(objc_msgSend(-[THWReviewRep layout](self, "layout"), "summaryLayout"), "answersUpdated");
  id v3 = [(TSDInteractiveCanvasController *)[(THWPagedCanvasController *)self->_stageCanvasController interactiveCanvasController] canvas];

  [v3 invalidateLayers];
}

- (void)p_updatePersitentQuestionIndex:(unint64_t)a3
{
  id v5 = [(THWReviewRep *)self p_dataController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_187BA8;
  v6[3] = &unk_457250;
  v6[5] = a3;
  [v5 mutateReviewWidgetData:[v5 reviewWidgetDataForWidgetID:[-[THWReviewRep info](self, "info") reviewID]] block:v6];
}

- (void)p_refreshQuestions
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [[self info] questions];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(THWReviewRep *)self p_repForQuestion:*(void *)(*((void *)&v9 + 1) + 8 * (void)v7)];
        objc_opt_class();
        id v8 = (void *)TSUClassAndProtocolCast();
        [v8 setQuestionState:0];
        [v8 updateChildrenFromLayout];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [(THWReviewRep *)self p_answersUpdated];
}

- (void)p_resetQuestions
{
  [(THWPagedCanvasController *)self->_stageCanvasController setPageIndex:0 animated:[(THWPagedCanvasController *)self->_stageCanvasController pageIndex] < 3];
  id v3 = [(THWReviewRep *)self p_responseController];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [[self info:0] questions];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (id i = 0; i != v6; id i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [(THWReviewRep *)self p_repForQuestion:v9];
        [v10 setQuestionState:1];
        [v3 removeResponseForQuestionID:[v9 questionID]];
        if (v10)
        {
          long long v11 = v10;
        }
        else
        {
          [self layoutForQuestion:v9];
          long long v11 = (void *)TSUProtocolCast();
        }
        [v11 reviewQuestionAnswerUpdated];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  [(THWReviewRep *)self p_answersUpdated];
  [(BCProgressTrackingRepTracker *)self->_progressTracker resetAttemptForRep:self];
}

- (void)p_checkAllAnswers
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [self info:0 questions];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (id i = 0; i != v5; id i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ([(THWReviewRep *)self p_questionCanBeChecked:v8]) {
          [(THWReviewRep *)self p_checkQuestionAnswer:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  [(THWReviewRep *)self layout];
  long long v9 = (void *)TSUProtocolCast();
  if (v9)
  {
    id v10 = v9;
    if ([v9 reviewSummaryShouldShowResults]) {
      [self->_progressTracker scoreDidChangeForRep:self +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 reviewSummaryCorrectCount]) total:[v10 reviewSummaryQuestionCount]];
    }
  }
}

- (CGSize)sizeOfCanvasForScrollableCanvasController:(id)a3
{
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "interactiveCanvasController"), "layoutController"), "rectOfTopLevelLayouts");
  double v5 = 1.0;
  if (v3 <= 0.0) {
    double v6 = 1.0;
  }
  else {
    double v6 = v3;
  }
  if (v4 > 0.0) {
    double v5 = v4;
  }
  result.double height = v5;
  result.double width = v6;
  return result;
}

- (BOOL)infosChangeForViewportChangeInScrollableCanvasController:(id)a3
{
  return 0;
}

- (id)scrollableCanvasController:(id)a3 infosToDisplayForViewport:(CGRect)a4
{
  objc_opt_class();
  [a3 instanceData];
  id v6 = [(id)TSUDynamicCast() unsignedIntegerValue];
  id v7 = [(THWReviewRep *)self layout];

  return [v7 infosForScrollablePage:v6];
}

- (UIEdgeInsets)contentInsetsForScrollableCanvasController:(id)a3
{
  double v3 = TSDEdgeInsetsZero[0];
  double v4 = TSDEdgeInsetsZero[1];
  double v5 = TSDEdgeInsetsZero[2];
  double v6 = TSDEdgeInsetsZero[3];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)scrollableCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  if (![(THWPressableRepGestureTargetHandler *)[(THWReviewRep *)self pressableHandler] canHandleGesture:a4])return 0; {

  }
  return [(THWReviewRep *)self pressableHandler];
}

- (id)scrollableCanvasHost
{
  id v2 = [(THWReviewRep *)self interactiveCanvasController];

  return [v2 scrollableCanvasHost];
}

- (id)strokeLayerForScrollableCanvasController:(id)a3
{
  return 0;
}

- (id)maskLayerForScrollableCanvasController:(id)a3
{
  return 0;
}

- (BOOL)scrollableCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (BOOL)scrollableCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  return 0;
}

- (BOOL)scrollableCanvasController:(id)a3 allowsHyperlinkWithGesture:(id)a4 forRep:(id)a5
{
  return 0;
}

- (double)contentsScaleForScrollableCanvasController:(id)a3
{
  id v3 = [(THWReviewRep *)self canvas];

  [v3 contentsScale];
  return result;
}

- (BOOL)deferViewCreationForScrollableCanvasController:(id)a3
{
  return 0;
}

- (BOOL)allowSelectionPopover
{
  return 0;
}

- (id)scrollableCanvasController:(id)a3 actionForHyperlink:(id)a4 inRep:(id)a5 gesture:(id)a6
{
  [self interactiveCanvasController].delegate
  long long v9 = (void *)TSUProtocolCast();

  return [v9 actionForHyperlink:a4 inRep:a5 gesture:a6];
}

- (BOOL)isRelatedCanvasScrollingForScrollableCanvasController:(id)a3
{
  id v3 = [(THWReviewRep *)self interactiveCanvasController];

  return [v3 currentlyScrolling];
}

- (void)scrollableCanvasController:(id)a3 customizeLayerHost:(id)a4
{
  objc_msgSend(a3, "setupImmediatePressGestureWithSimultaneousGestures:", objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWPagedCanvasController interactiveCanvasController](self->_stageCanvasController, "interactiveCanvasController", a3, a4), "layerHost"), "asiOSCVC"), "panGestureRecognizers"));
  if ([(THWReviewRep *)self pressableHandler]) {
    BOOL v6 = [(THWPressableRepGestureTargetHandler *)[(THWReviewRep *)self pressableHandler] widgetInteractionEnabled];
  }
  else {
    BOOL v6 = 1;
  }

  [a3 setUserInteractionEnabled:v6];
}

- (BOOL)scrollableCanvasControllerUseOverlayScrollerOnly:(id)a3
{
  return 1;
}

- (id)bookNavigatorForScrollableCanvasController:(id)a3
{
  objc_opt_class();
  [(THWReviewRep *)self interactiveCanvasController];
  double v4 = (void *)TSUDynamicCast();

  return [v4 bookNavigator];
}

- (id)documentNavigatorForScrollableCanvasController:(id)a3
{
  objc_opt_class();
  [(THWReviewRep *)self interactiveCanvasController];
  double v4 = (void *)TSUDynamicCast();

  return [v4 documentNavigator];
}

- (id)p_currentScrollableCanvasController
{
  unint64_t v3 = [(THWPagedCanvasController *)self->_stageCanvasController pageIndex];
  scrollableCanvasControllers = self->_scrollableCanvasControllers;
  double v5 = +[NSNumber numberWithUnsignedInteger:v3];

  return [(NSMutableDictionary *)scrollableCanvasControllers objectForKeyedSubscript:v5];
}

- (void)freeTransformWillBegin
{
  id v3 = [+[TSUColor whiteColor](TSUColor, "whiteColor") platformColor];
  id v4 = [(THWReviewRep *)self pAnimationView];

  [v4 setTsdBackgroundColor:v3];
}

- (void)freeTransformDidEnd
{
  id v3 = [+[TSUColor clearColor](TSUColor, "clearColor") platformColor];
  id v4 = [(THWReviewRep *)self pAnimationView];

  [v4 setTsdBackgroundColor:v3];
}

- (BOOL)isFreeTransformInProgress
{
  id v2 = [(THWFreeTransformableRepGestureTargetHandler *)[(THWReviewRep *)self freeTransformableHandler] ftc];

  return [(THWFreeTransformController *)v2 isFreeTransformInProgress];
}

- (id)transformLayer
{
  return [(THWReviewRep *)self pAnimationLayer];
}

- (BOOL)isExpanded
{
  id v2 = [(THWReviewRep *)self layout];

  return [v2 isExpanded];
}

- (BOOL)meetsStageDimensionRequirementForExpanded
{
  return 1;
}

- (id)shadowPath
{
  [self transformLayer].bounds

  return +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:");
}

- (BOOL)freeTransformUseTracedShadowPath
{
  return 0;
}

- (CGRect)rectForCompletion
{
  id v2 = [(THWReviewRep *)self layout];

  [v2 frameInParent];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)canExpand
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewRep;
  return [(THWReviewRep *)&v3 canExpand];
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

- (NSMutableDictionary)cachedImages
{
  return self->_cachedImages;
}

- (THWReviewControlsRep)controlsRep
{
  return self->_controlsRep;
}

- (CALayer)stageFillLayer
{
  return self->_stageFillLayer;
}

- (CAShapeLayer)stageStrokeLayer
{
  return self->_stageStrokeLayer;
}

- (THWExpandedRepController)expandedRepController
{
  return self->_expandedRepController;
}

- (void)setPressableHandler:(id)a3
{
}

- (BCProgressTrackingRepTracker)progressTracker
{
  return self->_progressTracker;
}

- (NSMutableDictionary)scrollableCanvasControllers
{
  return self->_scrollableCanvasControllers;
}

@end