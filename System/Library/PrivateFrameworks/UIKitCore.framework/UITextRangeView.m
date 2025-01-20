@interface UITextRangeView
- (BOOL)_endIsHorizontal;
- (BOOL)_startIsHorizontal;
- (BOOL)animateUpdate;
- (BOOL)areSelectionRectsVisible;
- (BOOL)autoscrolled;
- (BOOL)baseIsStart;
- (BOOL)commandsWereShowing;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)inGesture;
- (BOOL)inputViewIsChanging;
- (BOOL)isClearingRange;
- (BOOL)isDisplayingVerticalSelection;
- (BOOL)isScrolling;
- (BOOL)magnifying;
- (BOOL)pointCloserToEnd:(CGPoint)a3 startEdge:(CGRect)a4 endEdge:(CGRect)a5;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)rotating;
- (BOOL)scaling;
- (BOOL)shouldHitTestGrabbers;
- (BOOL)shouldShowGrabbers;
- (BOOL)shouldStayVisible;
- (BOOL)textRangeAdjustmentInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4;
- (BOOL)textRangeAdjustmentInteraction:(id)a3 shouldDisplayLoupeForTouchType:(int64_t)a4;
- (BOOL)textRangeAdjustmentInteractionShouldApplyTouchOffset:(id)a3;
- (BOOL)willBeginMagnifying;
- (CGPoint)activeTouchPoint;
- (CGPoint)basePoint;
- (CGPoint)convertFromMagnifierPoint:(CGPoint)a3;
- (CGPoint)extentPoint;
- (CGPoint)initialExtentPoint;
- (CGPoint)magnifierPoint;
- (CGRect)_edgeHitRectForEdgeRect:(CGRect)a3 grabber:(id)a4 precision:(unint64_t)a5;
- (CGRect)_endEdgeHitRectWithPrecision:(unint64_t)a3;
- (CGRect)_selectionClipRect;
- (CGRect)_startEdgeHitRectWithPrecision:(unint64_t)a3;
- (CGRect)caretRectForTextRangeAdjustmentInteraction:(id)a3;
- (CGRect)endEdge;
- (CGRect)paddedTextRangeAdjustmentHitRegionForEdge:(unint64_t)a3 precision:(unint64_t)a4;
- (CGRect)startEdge;
- (CGRect)textRangeAdjustmentRectForEdge:(unint64_t)a3;
- (NSArray)rects;
- (UISelectionGrabber)endGrabber;
- (UISelectionGrabber)startGrabber;
- (UISelectionGrabberCustomPath)endCustomPath;
- (UISelectionGrabberCustomPath)startCustomPath;
- (UITextInput)container;
- (UITextRangeView)initWithFrame:(CGRect)a3 selectionView:(id)a4;
- (UITextSelectionView)selectionView;
- (double)inverseScaleForView:(id)a3;
- (id)containerCoordinateSpaceForTextRangeAdjustmentInteraction:(id)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)textRangeAdjustmentViewForEdge:(unint64_t)a3;
- (int)mode;
- (unint64_t)loupeOrientationForTextRangeAdjustmentInteraction:(id)a3;
- (void)_cancelGrabberTransitionOutAnimations:(id)a3;
- (void)_setGrabber:(id)a3 bounds:(CGRect)a4 center:(CGPoint)a5;
- (void)_updateGrabbersVisibility:(BOOL)a3 animated:(BOOL)a4;
- (void)animateHighlighterDelayedFadeInOnLayer:(id)a3;
- (void)animateHighlighterExpanderAnimation;
- (void)animateHighlighterExpanderOnLayer:(id)a3 withOffset:(CGPoint)a4;
- (void)beginMagnifying;
- (void)cancelDelayedActions;
- (void)clearRangeAnimated:(BOOL)a3;
- (void)didRotate;
- (void)didScroll;
- (void)doneMagnifying;
- (void)inputViewDidChange;
- (void)inputViewWillChange;
- (void)prepareForMagnification;
- (void)removeFromSuperview;
- (void)scaleDidChange;
- (void)scaleWillChange;
- (void)setAnimateUpdate:(BOOL)a3;
- (void)setBaseIsStart:(BOOL)a3;
- (void)setCommandsWereShowing:(BOOL)a3;
- (void)setEndCustomPath:(id)a3;
- (void)setEndEdge:(CGRect)a3;
- (void)setEndGrabber:(id)a3;
- (void)setInGesture:(BOOL)a3;
- (void)setInitialExtentPoint:(CGPoint)a3;
- (void)setInputViewIsChanging:(BOOL)a3;
- (void)setIsClearingRange:(BOOL)a3;
- (void)setIsScrolling:(BOOL)a3;
- (void)setMagnifierOrientation;
- (void)setMagnifying:(BOOL)a3;
- (void)setMode:(int)a3;
- (void)setRects:(id)a3;
- (void)setRotating:(BOOL)a3;
- (void)setScaling:(BOOL)a3;
- (void)setShouldStayVisible:(BOOL)a3;
- (void)setStartCustomPath:(id)a3;
- (void)setStartEdge:(CGRect)a3;
- (void)setStartGrabber:(id)a3;
- (void)setWillBeginMagnifying:(BOOL)a3;
- (void)startAnimating;
- (void)stopAnimating;
- (void)textRangeAdjustmentInteraction:(id)a3 didBeginAtPoint:(CGPoint)a4;
- (void)textRangeAdjustmentInteraction:(id)a3 didEndAtPoint:(CGPoint)a4;
- (void)textRangeAdjustmentInteraction:(id)a3 selectionMoved:(CGPoint)a4 withTouchPoint:(CGPoint)a5;
- (void)textRangeAdjustmentInteractionWasCancelled:(id)a3;
- (void)updateAfterEffectiveModeChange;
- (void)updateBaseAndExtentPointsFromEdges;
- (void)updateBaseIsStartWithDocumentPoint:(CGPoint)a3;
- (void)updateDots;
- (void)updateEdges;
- (void)updateGrabbers;
- (void)updateRectViews;
- (void)updateSelectionWithDocumentPoint:(CGPoint)a3;
- (void)willRotate;
- (void)willScroll;
@end

@implementation UITextRangeView

- (UITextRangeView)initWithFrame:(CGRect)a3 selectionView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)UITextRangeView;
  v10 = -[UIView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->m_selectionView, v9);
    v12 = [v9 interactionAssistant];
    v13 = [v12 view];
    objc_storeWeak((id *)&v11->m_container, v13);

    v14 = [UIView alloc];
    uint64_t v15 = -[UIView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    m_rectContainerView = v11->m_rectContainerView;
    v11->m_rectContainerView = (UIView *)v15;

    [(UIView *)v11->m_rectContainerView setOpaque:0];
    [(UIView *)v11->m_rectContainerView setUserInteractionEnabled:0];
    [(UIView *)v11 addSubview:v11->m_rectContainerView];
    v17 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    m_rects = v11->m_rects;
    v11->m_rects = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    m_rectViews = v11->m_rectViews;
    v11->m_rectViews = v19;

    [(UIView *)v11 setOpaque:0];
    [(UIView *)v11 setUserInteractionEnabled:1];
    v21 = [[UIPointerInteraction alloc] initWithDelegate:v11];
    pointerInteraction = v11->_pointerInteraction;
    v11->_pointerInteraction = v21;

    [(UIView *)v11 addInteraction:v11->_pointerInteraction];
    v23 = v11;
  }

  return v11;
}

- (void)removeFromSuperview
{
  [(UITextRangeView *)self cancelDelayedActions];
  v3 = [(UITextRangeView *)self startGrabber];
  [v3 removeFromSuperview];

  v4 = [(UITextRangeView *)self endGrabber];
  [v4 removeFromSuperview];

  v5 = [(UIView *)self superview];

  if (v5)
  {
    v6 = +[UITextMagnifierRanged sharedRangedMagnifier];
    v7 = [v6 target];

    if (v7) {
      [v6 stopMagnifying:0];
    }
  }
  [(UITextRangeView *)self setIsScrolling:0];
  [(UITextRangeView *)self setInGesture:0];
  v8.receiver = self;
  v8.super_class = (Class)UITextRangeView;
  [(UIView *)&v8 removeFromSuperview];
}

- (CGRect)_edgeHitRectForEdgeRect:(CGRect)a3 grabber:(id)a4 precision:(unint64_t)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a4;
  v12 = [(UITextRangeView *)self container];
  v13 = [v12 textInputView];
  [v13 _scaleFromLayerTransforms];
  double v15 = v14;
  double v17 = v16;

  if (v15 >= 1.0) {
    double v18 = v15;
  }
  else {
    double v18 = 1.0;
  }
  if (v17 >= 1.0) {
    double v19 = v17;
  }
  else {
    double v19 = 1.0;
  }
  if (a5 == 2)
  {
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    CGRect v49 = CGRectInset(v48, -6.0 / v18, -6.0 / v19);
    double v20 = v49.origin.x;
    double v21 = v49.origin.y;
    double v22 = v49.size.width;
    double v23 = v49.size.height;
  }
  else if (v11 && ![v11 isVertical])
  {
    v52.origin.CGFloat x = x;
    v52.origin.CGFloat y = y;
    v52.size.CGFloat width = width;
    v52.size.CGFloat height = height;
    CGRect v53 = CGRectInset(v52, -10.0 / v18, -30.0 / v19);
    double v29 = v53.origin.x;
    double v30 = v53.origin.y;
    double v31 = v53.size.width;
    double v23 = v53.size.height;
    int v32 = [v11 isPointedRight];
    double v21 = v30 + 0.0;
    double v33 = -30.0 / v18;
    if (v32) {
      double v20 = v33 + v29;
    }
    else {
      double v20 = v29 + 0.0;
    }
    double v22 = v31 - (v33 + 0.0);
  }
  else
  {
    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    CGRect v51 = CGRectInset(v50, -30.0 / v18, -10.0 / v19);
    double v24 = v51.origin.x;
    double v25 = v51.origin.y;
    double v22 = v51.size.width;
    double v26 = v51.size.height;
    int v27 = [v11 isPointedDown];
    double v20 = v24 + 0.0;
    double v28 = -30.0 / v19;
    if (v27) {
      double v21 = v28 + v25;
    }
    else {
      double v21 = v25 + 0.0;
    }
    double v23 = v26 - (v28 + 0.0);
  }
  v34 = [(UITextRangeView *)self container];
  v35 = [v34 textInputView];
  objc_msgSend(v35, "convertRect:fromView:", self, v20, v21, v22, v23);
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;

  double v44 = v37;
  double v45 = v39;
  double v46 = v41;
  double v47 = v43;
  result.size.CGFloat height = v47;
  result.size.CGFloat width = v46;
  result.origin.CGFloat y = v45;
  result.origin.CGFloat x = v44;
  return result;
}

- (CGRect)_startEdgeHitRectWithPrecision:(unint64_t)a3
{
  [(UITextRangeView *)self startEdge];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(UITextRangeView *)self startGrabber];
  -[UITextRangeView _edgeHitRectForEdgeRect:grabber:precision:](self, "_edgeHitRectForEdgeRect:grabber:precision:", v13, a3, v6, v8, v10, v12);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)_endEdgeHitRectWithPrecision:(unint64_t)a3
{
  [(UITextRangeView *)self endEdge];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(UITextRangeView *)self endGrabber];
  -[UITextRangeView _edgeHitRectForEdgeRect:grabber:precision:](self, "_edgeHitRectForEdgeRect:grabber:precision:", v13, a3, v6, v8, v10, v12);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)textRangeAdjustmentRectForEdge:(unint64_t)a3
{
  if (a3) {
    [(UITextRangeView *)self endEdge];
  }
  else {
    [(UITextRangeView *)self startEdge];
  }
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = [(UITextRangeView *)self container];
  v13 = [v12 textInputView];
  objc_msgSend(v13, "convertRect:fromView:", self, v8, v9, v10, v11);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (id)textRangeAdjustmentViewForEdge:(unint64_t)a3
{
  return 0;
}

- (CGRect)paddedTextRangeAdjustmentHitRegionForEdge:(unint64_t)a3 precision:(unint64_t)a4
{
  if (a3) {
    [(UITextRangeView *)self _endEdgeHitRectWithPrecision:a4];
  }
  else {
    [(UITextRangeView *)self _startEdgeHitRectWithPrecision:a4];
  }
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v7 = [a4 _inputPrecision];
  BOOL v8 = [(UITextRangeView *)self shouldHitTestGrabbers];
  if (v8)
  {
    [(UITextRangeView *)self _startEdgeHitRectWithPrecision:v7];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [(UITextRangeView *)self _endEdgeHitRectWithPrecision:v7];
    uint64_t v30 = v18;
    uint64_t v31 = v17;
    uint64_t v20 = v19;
    uint64_t v22 = v21;
    v34.origin.CGFloat x = v10;
    v34.origin.CGFloat y = v12;
    v34.size.CGFloat width = v14;
    v34.size.CGFloat height = v16;
    v33.CGFloat x = x;
    v33.CGFloat y = y;
    if (CGRectContainsPoint(v34, v33))
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      uint64_t v24 = v30;
      uint64_t v23 = v31;
      uint64_t v25 = v20;
      uint64_t v26 = v22;
      CGFloat v27 = x;
      CGFloat v28 = y;
      LOBYTE(v8) = CGRectContainsPoint(*(CGRect *)&v23, *(CGPoint *)&v27);
    }
  }
  return v8;
}

- (void)setMagnifierOrientation
{
  if ([(UITextRangeView *)self baseIsStart]) {
    BOOL v3 = [(UITextRangeView *)self _endIsHorizontal];
  }
  else {
    BOOL v3 = [(UITextRangeView *)self _startIsHorizontal];
  }
  BOOL v4 = v3;
  id v5 = +[UITextMagnifierRanged sharedRangedMagnifier];
  [v5 setIsHorizontal:v4];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v4 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    objc_opt_class();
    char v6 = objc_opt_isKindOfClass();
    if ((v6 & 1) != 0
      && ([v3 view],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char v8 = objc_opt_isKindOfClass(),
          v7,
          (v8 & 1) != 0))
    {
      double v9 = [v3 view];
      [v9 contentSize];
      double v11 = v10;
      [v9 frame];
      BOOL v13 = v11 <= v12;
    }
    else
    {
      BOOL v13 = 1;
    }
    if (isKindOfClass) {
      char v4 = 1;
    }
    else {
      char v4 = v6 & v13;
    }
  }

  return v4;
}

- (BOOL)textRangeAdjustmentInteraction:(id)a3 shouldBeginAtPoint:(CGPoint)a4
{
  return 1;
}

- (void)textRangeAdjustmentInteraction:(id)a3 didBeginAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(UITextRangeView *)self setInGesture:1];
  [(UITextRangeView *)self updateEdges];
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_selectionView);
  id v11 = [WeakRetained interactionAssistant];

  char v8 = [v11 _editMenuAssistant];
  if ([v8 _editMenuIsVisibleOrDismissedRecently])
  {
    double v9 = [v11 _editMenuAssistant];
    -[UITextRangeView setCommandsWereShowing:](self, "setCommandsWereShowing:", [v9 _hasTextReplacements] ^ 1);
  }
  else
  {
    [(UITextRangeView *)self setCommandsWereShowing:0];
  }

  double v10 = [(UITextRangeView *)self selectionView];
  [v10 hideSelectionCommands];

  [(UITextRangeView *)self cancelDelayedActions];
  objc_msgSend(v11, "rangeSelectionStarted:", x, y);
}

- (void)textRangeAdjustmentInteraction:(id)a3 selectionMoved:(CGPoint)a4 withTouchPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_selectionView);
  double v9 = [WeakRetained interactionAssistant];
  objc_msgSend(v9, "rangeSelectionMoved:withTouchPoint:", v8, v7, x, y);
}

- (void)textRangeAdjustmentInteraction:(id)a3 didEndAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(UITextRangeView *)self setInGesture:0];
  [(UITextRangeView *)self cancelDelayedActions];
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_selectionView);
  double v7 = [WeakRetained interactionAssistant];
  objc_msgSend(v7, "rangeSelectionEnded:", x, y);
}

- (void)textRangeAdjustmentInteractionWasCancelled:(id)a3
{
  [(UITextRangeView *)self setInGesture:0];
  [(UITextRangeView *)self cancelDelayedActions];
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_selectionView);
  id v5 = [WeakRetained interactionAssistant];
  [v5 rangeSelectionCanceled];

  [(UITextRangeView *)self _updateGrabbersVisibility:0 animated:0];
}

- (BOOL)textRangeAdjustmentInteractionShouldApplyTouchOffset:(id)a3
{
  return ![(UITextRangeView *)self isDisplayingVerticalSelection];
}

- (BOOL)textRangeAdjustmentInteraction:(id)a3 shouldDisplayLoupeForTouchType:(int64_t)a4
{
  return 0;
}

- (unint64_t)loupeOrientationForTextRangeAdjustmentInteraction:(id)a3
{
  if ([(UITextRangeView *)self isDisplayingVerticalSelection]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (CGRect)caretRectForTextRangeAdjustmentInteraction:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_selectionView);
  char v4 = [WeakRetained interactionAssistant];
  id v5 = [v4 activeSelectionController];
  [v5 caretRectForCursorPosition];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (id)containerCoordinateSpaceForTextRangeAdjustmentInteraction:(id)a3
{
  id v3 = [(UITextRangeView *)self container];
  char v4 = [v3 textInputView];

  return v4;
}

- (void)updateAfterEffectiveModeChange
{
  [(UIView *)self setUserInteractionEnabled:[(UITextRangeView *)self shouldShowGrabbers]];
  [(UITextRangeView *)self updateRectViews];
  [(UITextRangeView *)self updateGrabbers];
}

- (int)mode
{
  return self->m_mode;
}

- (void)setMode:(int)a3
{
  if (self->m_mode != a3)
  {
    self->m_mode = a3;
    [(UITextRangeView *)self updateAfterEffectiveModeChange];
  }
}

- (UITextSelectionView)selectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_selectionView);
  return (UITextSelectionView *)WeakRetained;
}

- (UITextInput)container
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_container);
  return (UITextInput *)WeakRetained;
}

- (NSArray)rects
{
  return self->m_rects;
}

- (void)updateEdges
{
  char v4 = [(UITextRangeView *)self container];
  id v5 = [v4 textInputView];

  double v6 = [(UITextRangeView *)self rects];
  double v7 = +[UITextSelectionRect startCustomSelectionPathFromRects:v6];
  [(UITextRangeView *)self setStartCustomPath:v7];

  double v8 = +[UITextSelectionRect endCustomSelectionPathFromRects:v6];
  [(UITextRangeView *)self setEndCustomPath:v8];

  if (WebKitFramework)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v9 = [(UITextRangeView *)self rects];
      +[UITextSelectionRect startEdgeFromRects:v9];
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", v5);
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      [v5 bounds];
      v85.origin.double x = v18;
      v85.origin.double y = v19;
      v85.size.CGFloat width = v20;
      v85.size.CGFloat height = v21;
      v80.origin.double x = v11;
      v80.origin.double y = v13;
      v80.size.CGFloat width = v15;
      v80.size.CGFloat height = v17;
      CGRect v81 = CGRectIntersection(v80, v85);
      -[UITextRangeView setStartEdge:](self, "setStartEdge:", v81.origin.x, v81.origin.y, v81.size.width, v81.size.height);

      uint64_t v22 = [(UITextRangeView *)self rects];
      +[UITextSelectionRect endEdgeFromRects:v22];
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", v5);
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      [v5 bounds];
      v86.origin.double x = v31;
      v86.origin.double y = v32;
      v86.size.CGFloat width = v33;
      v86.size.CGFloat height = v34;
      v82.origin.double x = v24;
      v82.origin.double y = v26;
      v82.size.CGFloat width = v28;
      v82.size.CGFloat height = v30;
      CGRect v83 = CGRectIntersection(v82, v86);
      -[UITextRangeView setEndEdge:](self, "setEndEdge:", v83.origin.x, v83.origin.y, v83.size.width, v83.size.height);
LABEL_34:

      goto LABEL_35;
    }
  }
  if (![v5 _usesAsynchronousProtocol])
  {
    uint64_t v22 = [(UITextRangeView *)self startCustomPath];
    v66 = [(UITextRangeView *)self endCustomPath];
    if (v22)
    {
      [v22 boundingEdgeRect];
    }
    else
    {
      v2 = [(UITextRangeView *)self rects];
      +[UITextSelectionRect startEdgeFromRects:v2];
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", v5);
    }
    -[UITextRangeView setStartEdge:](self, "setStartEdge:");
    if (v22)
    {
      if (v66)
      {
LABEL_28:
        [v66 boundingEdgeRect];
LABEL_31:
        -[UITextRangeView setEndEdge:](self, "setEndEdge:");
        if (!v66) {

        }
        goto LABEL_34;
      }
    }
    else
    {

      if (v66) {
        goto LABEL_28;
      }
    }
    v2 = [(UITextRangeView *)self rects];
    +[UITextSelectionRect endEdgeFromRects:v2];
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v5);
    goto LABEL_31;
  }
  [(UITextRangeView *)self inverseScaleForView:v5];
  double v36 = v35;
  double v37 = [(UITextRangeView *)self rects];
  +[UITextSelectionRect startEdgeFromRects:v37];
  double v73 = v38;
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;

  double v45 = [(UITextRangeView *)self rects];
  +[UITextSelectionRect endEdgeFromRects:v45];
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;

  double v54 = 1.0;
  if (v42 >= v44) {
    double v55 = v36;
  }
  else {
    double v55 = 1.0;
  }
  double v56 = v44 * v55;
  if (v42 < v44) {
    double v54 = v36;
  }
  double v57 = v42 * v54;
  BOOL v58 = v51 < v53;
  double v59 = v49 + v53 - v36 * v53;
  double v60 = v36 * v51;
  double v61 = v47 + v51 - v36 * v51;
  if (v51 < v53) {
    double v62 = v53;
  }
  else {
    double v62 = v36 * v53;
  }
  if (v51 < v53) {
    double v63 = v60;
  }
  else {
    double v63 = v51;
  }
  if (v58) {
    double v64 = v49;
  }
  else {
    double v64 = v59;
  }
  if (v58) {
    double v65 = v61;
  }
  else {
    double v65 = v47;
  }
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v5, v73, v40, v57, v56, v60, v61, *(void *)&v73);
  -[UITextRangeView setStartEdge:](self, "setStartEdge:");
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v5, v65, v64, v63, v62);
  -[UITextRangeView setEndEdge:](self, "setEndEdge:");
LABEL_35:
  v67 = [(UITextRangeView *)self rects];
  v68 = [v67 firstObject];
  int v69 = [v68 isMemberOfClass:objc_opt_class()];

  if (v69)
  {
    uint64_t v75 = 0;
    v76 = (double *)&v75;
    uint64_t v77 = 0x3010000000;
    v78 = &unk_186D7DBA7;
    long long v79 = *MEMORY[0x1E4F1DAD8];
    v70 = [(UITextRangeView *)self rects];
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __30__UITextRangeView_updateEdges__block_invoke;
    v74[3] = &unk_1E530ACB0;
    v74[4] = &v75;
    [v70 enumerateObjectsUsingBlock:v74];

    if (v76[5] > 0.0)
    {
      [(UITextRangeView *)self endEdge];
      if (CGRectGetMidY(v84) > v76[5])
      {
        [(UITextRangeView *)self startEdge];
        -[UITextRangeView setEndEdge:](self, "setEndEdge:", v76[4] - v71, v76[5] - v72);
      }
    }
    _Block_object_dispose(&v75, 8);
  }
}

void __30__UITextRangeView_updateEdges__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 rect];
  if (CGRectGetWidth(v8) > 0.0)
  {
    [v6 rect];
    if (CGRectGetMaxY(v9) > *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      [v6 rect];
      CGFloat MaxX = CGRectGetMaxX(v10);
      [v6 rect];
      CGFloat MaxY = CGRectGetMaxY(v11);
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      *(CGFloat *)(v5 + 32) = MaxX;
      *(CGFloat *)(v5 + 40) = MaxY;
    }
  }
}

- (void)setRects:(id)a3
{
  id obj = a3;
  if ([obj count])
  {
    if ((unint64_t)[obj count] >= 0xB)
    {
      char v4 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:obj];
      uint64_t v5 = [v4 array];

      id obj = (id)v5;
    }
    if ([(UITextRangeView *)self isClearingRange]) {
      [(UITextRangeView *)self setShouldStayVisible:1];
    }
    objc_storeStrong((id *)&self->m_rects, obj);
    [(UITextRangeView *)self updateEdges];
    [(UITextRangeView *)self updateRectViews];
    [(UITextRangeView *)self updateGrabbers];
  }
}

- (void)updateSelectionWithDocumentPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_selectionView);
  uint64_t v5 = [WeakRetained interactionAssistant];
  objc_msgSend(v5, "updateSelectionWithPoint:", x, y);
}

- (void)updateBaseIsStartWithDocumentPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(UITextRangeView *)self container];
  double v7 = [v6 textInputView];
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v7, x, y);
  double v9 = v8;
  double v11 = v10;

  [(UITextRangeView *)self startEdge];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(UITextRangeView *)self endEdge];
  BOOL v24 = -[UITextRangeView pointCloserToEnd:startEdge:endEdge:](self, "pointCloserToEnd:startEdge:endEdge:", v9, v11, v13, v15, v17, v19, v20, v21, v22, v23);
  [(UITextRangeView *)self setBaseIsStart:v24];
}

- (void)updateBaseAndExtentPointsFromEdges
{
  p_m_basePoint = &self->m_basePoint;
  if ([(UITextRangeView *)self baseIsStart])
  {
    [(UITextRangeView *)self startEdge];
    p_m_basePoint->double x = v5 + v4 * 0.5;
    self->m_basePoint.double y = v7 + v6 * 0.5;
    [(UITextRangeView *)self endEdge];
  }
  else
  {
    [(UITextRangeView *)self endEdge];
    p_m_basePoint->double x = v13 + v12 * 0.5;
    self->m_basePoint.double y = v15 + v14 * 0.5;
    [(UITextRangeView *)self startEdge];
  }
  self->m_extentPoint.double x = v8 + v10 * 0.5;
  self->m_extentPoint.double y = v9 + v11 * 0.5;
}

- (void)prepareForMagnification
{
  [(UITextRangeView *)self setMagnifying:1];
  id v3 = [(UITextRangeView *)self startGrabber];
  [v3 setIsDotted:0];

  double v4 = [(UITextRangeView *)self endGrabber];
  [v4 setIsDotted:0];

  [(UITextRangeView *)self updateGrabbers];
}

- (void)doneMagnifying
{
  [(UITextRangeView *)self setMagnifying:0];
  id v3 = [(UITextRangeView *)self startGrabber];
  [v3 setIsDotted:1];

  double v4 = [(UITextRangeView *)self endGrabber];
  [v4 setIsDotted:1];

  [(UITextRangeView *)self updateGrabbers];
}

- (void)willScroll
{
  [(UITextRangeView *)self setIsScrolling:1];
  [(UITextRangeView *)self updateDots];
}

- (void)didScroll
{
  [(UITextRangeView *)self setIsScrolling:0];
  [(UITextRangeView *)self updateDots];
}

- (void)scaleWillChange
{
  [(UITextRangeView *)self setScaling:1];
  [(UITextRangeView *)self updateDots];
}

- (void)scaleDidChange
{
  [(UITextRangeView *)self setScaling:0];
  [(UITextRangeView *)self updateDots];
}

- (void)willRotate
{
  [(UITextRangeView *)self setRotating:1];
  [(UITextRangeView *)self updateDots];
}

- (void)didRotate
{
  [(UITextRangeView *)self setRotating:0];
  [(UITextRangeView *)self performSelector:sel_updateDots withObject:0 afterDelay:0.0];
}

- (void)inputViewWillChange
{
  [(UITextRangeView *)self setInputViewIsChanging:1];
  [(UITextRangeView *)self updateDots];
}

- (void)inputViewDidChange
{
  [(UITextRangeView *)self setInputViewIsChanging:0];
  [(UITextRangeView *)self updateDots];
}

- (void)clearRangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(UITextRangeView *)self isClearingRange])
  {
    if (v3 && !_AXSReduceMotionEnabled())
    {
      if (self->m_endGrabber) {
        [(UITextRangeView *)self setIsClearingRange:1];
      }
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      double v5 = self->m_rectViews;
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v12 + 1) + 8 * i) setHidden:1];
          }
          uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }

      if (self->m_endGrabber)
      {
        [(UISelectionGrabber *)self->m_startGrabber transitionDot:2 completion:0];
        m_endGrabber = self->m_endGrabber;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __38__UITextRangeView_clearRangeAnimated___block_invoke;
        v11[3] = &unk_1E52D9F70;
        v11[4] = self;
        [(UISelectionGrabber *)m_endGrabber transitionDot:2 completion:v11];
      }
      else
      {
        [(UITextRangeView *)self removeFromSuperview];
      }
    }
    else
    {
      [(UITextRangeView *)self removeFromSuperview];
    }
  }
}

uint64_t __38__UITextRangeView_clearRangeAnimated___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) shouldStayVisible] & 1) == 0) {
    [*(id *)(a1 + 32) removeFromSuperview];
  }
  [*(id *)(a1 + 32) setShouldStayVisible:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setIsClearingRange:0];
}

- (void)updateDots
{
  if ([(UITextRangeView *)self shouldShowGrabbers])
  {
    BOOL v3 = [(UITextRangeView *)self startGrabber];
    [v3 updateDot];

    uint64_t v6 = [(UITextRangeView *)self endGrabber];
    [(UISelectionGrabber *)v6 updateDot];
    m_endGrabber = v6;
  }
  else
  {
    [(UISelectionGrabber *)self->m_startGrabber removeFromSuperview];
    [(UISelectionGrabber *)self->m_endGrabber removeFromSuperview];
    m_startGrabber = self->m_startGrabber;
    self->m_startGrabber = 0;

    m_endGrabber = self->m_endGrabber;
    self->m_endGrabber = 0;
  }
}

- (void)startAnimating
{
  BOOL v3 = [(UITextRangeView *)self startGrabber];
  [v3 setAnimating:1];

  id v4 = [(UITextRangeView *)self endGrabber];
  [v4 setAnimating:1];
}

- (void)stopAnimating
{
  BOOL v3 = [(UITextRangeView *)self startGrabber];
  [v3 setAnimating:0];

  id v4 = [(UITextRangeView *)self endGrabber];
  [v4 setAnimating:0];
}

- (void)_updateGrabbersVisibility:(BOOL)a3 animated:(BOOL)a4
{
  if (a4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__UITextRangeView__updateGrabbersVisibility_animated___block_invoke;
    v7[3] = &unk_1E52D9FC0;
    BOOL v8 = a3;
    v7[4] = self;
    +[UIView animateWithDuration:v7 animations:0.15];
  }
  else
  {
    double v5 = [(UITextRangeView *)self startGrabber];
    [v5 updateDot];

    uint64_t v6 = [(UITextRangeView *)self endGrabber];
    [v6 updateDot];

    [(UITextRangeView *)self updateGrabbers];
  }
}

uint64_t __54__UITextRangeView__updateGrabbersVisibility_animated___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  BOOL v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 startAnimating];
  }
  else {
    [v3 stopAnimating];
  }
  id v4 = *(void **)(a1 + 32);
  return [v4 updateGrabbers];
}

- (void)cancelDelayedActions
{
}

- (BOOL)pointCloserToEnd:(CGPoint)a3 startEdge:(CGRect)a4 endEdge:(CGRect)a5
{
  return sqrt((a5.origin.x + a5.size.width - a3.x) * (a5.origin.x + a5.size.width - a3.x)+ (a5.origin.y + a5.size.height - a3.y) * (a5.origin.y + a5.size.height - a3.y)) < sqrt((a4.origin.x - a3.x)* (a4.origin.x - a3.x)+ (a4.origin.y - a3.y)* (a4.origin.y - a3.y));
}

- (BOOL)autoscrolled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_selectionView);
  BOOL v3 = [WeakRetained interactionAssistant];
  char v4 = [v3 autoscrolled];

  return v4;
}

- (void)animateHighlighterExpanderAnimation
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  BOOL v3 = self->m_rectViews;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v4) {
    goto LABEL_20;
  }
  uint64_t v5 = v4;
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)v34;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v34 != v7) {
        objc_enumerationMutation(v3);
      }
      v6 += objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "isHidden", (void)v33) ^ 1;
    }
    uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v33 objects:v37 count:16];
  }
  while (v5);

  if (v6 == 1)
  {
    BOOL v3 = [(NSMutableArray *)self->m_rectViews firstObject];
    double v9 = [(NSMutableArray *)v3 layer];
    -[UITextRangeView animateHighlighterExpanderOnLayer:withOffset:](self, "animateHighlighterExpanderOnLayer:withOffset:", v9, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

    [(NSMutableArray *)v3 bounds];
    LODWORD(v9) = [(UITextRangeView *)self _startIsHorizontal];
    [(NSMutableArray *)v3 frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    [(UIView *)self->m_startGrabber frame];
    if (v9)
    {
      if (v18 < v11 + v15 * 0.5)
      {
LABEL_14:
        BOOL v20 = [(UITextRangeView *)self _endIsHorizontal];
        [(NSMutableArray *)v3 frame];
        double v22 = v21;
        double v24 = v23;
        double v26 = v25;
        double v28 = v27;
        [(UIView *)self->m_endGrabber frame];
        if (v20)
        {
          if (v29 < v22 + v26 * 0.5) {
            goto LABEL_19;
          }
        }
        else if (v30 < v24 + v28 * 0.5)
        {
LABEL_19:
          CGFloat v31 = [(UIView *)self->m_startGrabber layer];
          [(UITextRangeView *)self animateHighlighterDelayedFadeInOnLayer:v31];

          CGFloat v32 = [(UIView *)self->m_endGrabber layer];
          [(UITextRangeView *)self animateHighlighterDelayedFadeInOnLayer:v32];

LABEL_20:
          return;
        }
        [(UIView *)self->m_endGrabber frame];
        goto LABEL_19;
      }
    }
    else if (v19 < v13 + v17 * 0.5)
    {
      goto LABEL_14;
    }
    [(UIView *)self->m_startGrabber frame];
    goto LABEL_14;
  }
}

- (void)animateHighlighterExpanderOnLayer:(id)a3 withOffset:(CGPoint)a4
{
  id v4 = a3;
  [v4 bounds];
  double v6 = v5;
  uint64_t v7 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform"];
  [v7 setFrameInterval:0.0166666667];
  uint64_t v8 = *MEMORY[0x1E4F39F98];
  [v7 setFillMode:*MEMORY[0x1E4F39F98]];
  [v4 bounds];
  double v11 = 1.0;
  double v12 = 1.0;
  if (v9 > 0.0)
  {
    float v13 = v6 + 300.0;
    if (v13 < 350.0) {
      float v13 = 350.0;
    }
    double v12 = v13 / v9;
  }
  if (v10 > 0.0) {
    double v11 = (v10 + 100.0) / v10;
  }
  long long v14 = 0uLL;
  memset(&v22, 0, sizeof(v22));
  if (v4)
  {
    [v4 transform];
    long long v14 = 0uLL;
  }
  *(_OWORD *)&v21.m41 = v14;
  *(_OWORD *)&v21.m43 = v14;
  *(_OWORD *)&v21.m31 = v14;
  *(_OWORD *)&v21.m33 = v14;
  *(_OWORD *)&v21.m21 = v14;
  *(_OWORD *)&v21.m23 = v14;
  *(_OWORD *)&v21.m11 = v14;
  *(_OWORD *)&v21.m13 = v14;
  CATransform3D v20 = v22;
  CATransform3DScale(&v21, &v20, v12, v11, 1.0);
  CATransform3D v20 = v21;
  double v15 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v20];
  [v7 setFromValue:v15];

  CATransform3D v20 = v22;
  double v16 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v20];
  [v7 setToValue:v16];

  [v7 setMass:1.0];
  [v7 setStiffness:445.100006];
  [v7 setDamping:36.6100006];
  [v7 settlingDuration];
  objc_msgSend(v7, "setDuration:");
  [v4 addAnimation:v7 forKey:@"transform"];
  double v17 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"cornerRadius"];
  [v17 setFromValue:&unk_1ED3F6CD8];
  [v17 setToValue:&unk_1ED3F6CF0];
  [v17 setMass:1.0];
  [v17 setStiffness:445.100006];
  [v17 setDamping:36.6100006];
  [v7 settlingDuration];
  objc_msgSend(v17, "setDuration:");
  [v4 addAnimation:v17 forKey:@"cornerRadius"];
  double v18 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
  [v18 setFrameInterval:0.0166666667];
  [v18 setFillMode:v8];
  [v18 setFromValue:&unk_1ED3F6CF0];
  [v18 setToValue:&unk_1ED3F6D08];
  [v18 setMass:1.0];
  [v18 setStiffness:445.100006];
  [v18 setDamping:36.6100006];
  [v7 settlingDuration];
  objc_msgSend(v18, "setDuration:");
  [v4 addAnimation:v18 forKey:@"opacity"];
  LODWORD(v19) = 1.0;
  [v4 setOpacity:v19];
}

- (void)animateHighlighterDelayedFadeInOnLayer:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F39C90];
  id v4 = a3;
  id v7 = [v3 animationWithKeyPath:@"transform.scale"];
  [v7 setFrameInterval:0.0166666667];
  uint64_t v5 = *MEMORY[0x1E4F39F98];
  [v7 setFillMode:*MEMORY[0x1E4F39F98]];
  [v7 setFromValue:&unk_1ED3F26E8];
  [v7 setToValue:&unk_1ED3F6D08];
  [v7 setMass:1.0];
  [v7 setStiffness:586.0];
  [v7 setDamping:31.7];
  [v7 settlingDuration];
  objc_msgSend(v7, "setDuration:");
  [v7 setBeginTime:CACurrentMediaTime() + 0.2];
  [v4 addAnimation:v7 forKey:0];
  double v6 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
  [v6 setFrameInterval:0.0166666667];
  [v6 setFillMode:v5];
  [v6 setFromValue:&unk_1ED3F6CF0];
  [v6 setToValue:&unk_1ED3F6D08];
  [v6 setMass:1.0];
  [v6 setStiffness:586.0];
  [v6 setDamping:31.7];
  [v6 settlingDuration];
  objc_msgSend(v6, "setDuration:");
  [v6 setBeginTime:CACurrentMediaTime() + 0.2];
  [v6 setFillMode:v5];
  [v4 addAnimation:v6 forKey:0];
}

- (void)beginMagnifying
{
  self->m_willBeginMagnifying = 0;
  [(UITextRangeView *)self cancelDelayedActions];
  id v3 = +[UITextMagnifierRanged sharedRangedMagnifier];
  [(UITextRangeView *)self setMagnifierOrientation];
}

- (CGRect)_selectionClipRect
{
  int v2 = [(UITextRangeView *)self container];
  if (!v2) {
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      [v2 _selectionClipRect];
      goto LABEL_6;
    }
LABEL_7:
    double v7 = *MEMORY[0x1E4F1DB20];
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    goto LABEL_8;
  }
  [v2 selectionClipRect];
LABEL_6:
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
LABEL_8:

  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)updateRectViews
{
  if ((![(UITextRangeView *)self mode]
     || [(UITextRangeView *)self mode] == 5
     || [(UITextRangeView *)self mode] == 4)
    && !_AXSReduceMotionEnabled())
  {
    double v3 = [(UITextRangeView *)self container];
    if ([v3 _conformsToProtocolUIAsyncTextInputClient])
    {
LABEL_6:

      goto LABEL_12;
    }
    double v4 = [(UITextRangeView *)self container];
    char v5 = [v4 _conformsToProtocolBETextInput];

    if ((v5 & 1) == 0)
    {
      double v6 = [(UITextRangeView *)self container];
      char v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) == 0
        || ([(UITextRangeView *)self container],
            double v8 = objc_claimAutoreleasedReturnValue(),
            int v9 = [v8 _allowAnimatedUpdateSelectionRectViews],
            v8,
            v9))
      {
        double v10 = [(UIView *)self->m_rectContainerView layer];
        double v3 = [v10 animationForKey:@"transition"];

        if (!v3)
        {
          double v11 = [MEMORY[0x1E4F39D18] animation];
          [v11 setFrameInterval:0.0333333333];
          [v11 setType:*MEMORY[0x1E4F3A5B8]];
          [v11 setDuration:0.25];
          [v11 setFillMode:*MEMORY[0x1E4F39F98]];
          double v12 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
          [v11 setTimingFunction:v12];

          double v13 = [(UIView *)self->m_rectContainerView layer];
          [v13 addAnimation:v11 forKey:@"transition"];

          double v3 = 0;
        }
        goto LABEL_6;
      }
    }
  }
LABEL_12:
  int v14 = [(NSArray *)self->m_rects count];
  int v15 = v14 - [(NSMutableArray *)self->m_rectViews count];
  if (v15 >= 1)
  {
    double v16 = *MEMORY[0x1E4F1DB28];
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      CATransform3D v20 = -[UIView initWithFrame:]([UITextSelectionRectView alloc], "initWithFrame:", v16, v17, v18, v19);
      [(UIView *)v20 setUserInteractionEnabled:0];
      [(UIView *)self->m_rectContainerView addSubview:v20];
      [(NSMutableArray *)self->m_rectViews addObject:v20];

      --v15;
    }
    while (v15);
  }
  CATransform3D v21 = [(UITextRangeView *)self container];
  CATransform3D v22 = [v21 textInputView];
  [(UITextRangeView *)self _selectionClipRect];
  double x = v81.origin.x;
  double y = v81.origin.y;
  double width = v81.size.width;
  double height = v81.size.height;
  BOOL IsNull = CGRectIsNull(v81);
  if (!IsNull)
  {
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v22, x, y, width, height);
    double x = v28;
    double y = v29;
    double width = v30;
    double height = v31;
  }
  if (objc_opt_respondsToSelector())
  {
    CGFloat v32 = +[UIKeyboard currentDocumentState];
    long long v33 = [v32 autocorrectTextBackgroundColor];

    if (v33)
    {
      long long v34 = [v32 autocorrectTextBackgroundColor];
      uint64_t v77 = +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", [v34 cgColor]);
    }
    else
    {
      uint64_t v77 = [v21 selectionHighlightColor];
    }
  }
  else
  {
    uint64_t v77 = +[UIColor selectionHighlightColor];
  }
  id v79 = v21;
  if (objc_opt_respondsToSelector())
  {
    long long v35 = [v79 selectionBorderColor];
    BOOL v76 = v35 != 0;
  }
  else
  {
    BOOL v76 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    [v79 selectionBorderWidth];
    BOOL v75 = v36 > 0.0;
  }
  else
  {
    BOOL v75 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    [v79 selectionCornerRadius];
    BOOL v74 = v37 > 0.0;
  }
  else
  {
    BOOL v74 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    [v79 selectionEdgeInsets];
    BOOL v41 = v40 != 0.0;
    if (v42 != 0.0) {
      BOOL v41 = 1;
    }
    if (v39 != 0.0) {
      BOOL v41 = 1;
    }
    int v43 = v38 != 0.0 || v41;
  }
  else
  {
    int v43 = 0;
  }
  if ([(NSArray *)self->m_rects count])
  {
    CGFloat v78 = width;
    uint64_t v44 = 0;
    double v73 = 0.2;
    while (1)
    {
      double v45 = -[NSArray objectAtIndex:](self->m_rects, "objectAtIndex:", v44, *(void *)&v73);
      [v45 rect];
      double v46 = v82.origin.x;
      double v47 = v82.origin.y;
      double v48 = v82.size.width;
      double v49 = v82.size.height;
      double v50 = CGRectGetWidth(v82);
      if (v50 <= 2.0 || v43 == 0)
      {
        if (!v22) {
          goto LABEL_53;
        }
      }
      else
      {
        [v79 selectionEdgeInsets];
        double v46 = v46 + v53;
        double v47 = v47 + v52;
        double v48 = v48 - (v53 + v55);
        double v49 = v49 - (v52 + v54);
        if (!v22) {
          goto LABEL_53;
        }
      }
      -[UIView convertRect:fromView:](self, "convertRect:fromView:", v22, v46, v47, v48, v49);
      double v46 = v56;
      double v47 = v57;
      double v48 = v58;
      double v49 = v59;
      if (!IsNull)
      {
        v83.origin.double x = x;
        v83.size.double width = v78;
        v83.origin.double y = y;
        v83.size.double height = height;
        v86.origin.double x = v46;
        v86.origin.double y = v47;
        v86.size.double width = v48;
        v86.size.double height = v49;
        CGRect v84 = CGRectIntersection(v83, v86);
        double v46 = v84.origin.x;
        double v47 = v84.origin.y;
        double v48 = v84.size.width;
        double v49 = v84.size.height;
      }
LABEL_53:
      double v60 = [(NSMutableArray *)self->m_rectViews objectAtIndex:v44];
      [v60 frame];
      if (v62 != v48 || v61 != v49)
      {
        double v64 = [v60 layer];
        [v64 removeAllAnimations];
      }
      if (([v45 _drawsOwnHighlight] & 1) == 0)
      {
        v85.origin.double x = v46;
        v85.origin.double y = v47;
        v85.size.double width = v48;
        v85.size.double height = v49;
        if (!CGRectIsEmpty(v85) && UIRectIsDiscrete(v46, v47, v48, v49))
        {
          [v60 setHidden:0];
          objc_msgSend(v60, "setFrame:", v46, v47, v48, v49);
          double v65 = [v45 _path];
          [v60 setPath:v65];

          if ([(UITextRangeView *)self mode] == 2)
          {
            double v66 = 1.0;
            double v67 = 0.0;
            goto LABEL_68;
          }
          if ([(UITextRangeView *)self mode] == 3)
          {
            double v66 = 0.0;
            double v67 = 1.0;
LABEL_68:
            uint64_t v68 = +[UIColor colorWithRed:v66 green:0.0 blue:v67 alpha:0.15];
LABEL_69:
            int v69 = (void *)v68;
            [v60 setSelectionColor:v68];
          }
          else
          {
            if ([(UITextRangeView *)self mode] == 5)
            {
              uint64_t v68 = +[UIColor colorWithWhite:0.5 alpha:v73];
              goto LABEL_69;
            }
            [v60 setSelectionColor:v77];
          }
          if (v50 > 2.0)
          {
            if (v76)
            {
              v70 = [v79 selectionBorderColor];
              [v60 setSelectionBorderColor:v70];
            }
            if (v75)
            {
              [v79 selectionBorderWidth];
              objc_msgSend(v60, "setSelectionBorderWidth:");
            }
            if (v74)
            {
              [v79 selectionCornerRadius];
              objc_msgSend(v60, "setSelectionCornerRadius:");
            }
          }
          goto LABEL_64;
        }
      }
      [v60 setHidden:1];
LABEL_64:

      if ([(NSArray *)self->m_rects count] <= ++v44)
      {
        unint64_t v71 = v44;
        goto LABEL_82;
      }
    }
  }
  unint64_t v71 = 0;
LABEL_82:
  while ([(NSMutableArray *)self->m_rectViews count] > v71)
  {
    double v72 = [(NSMutableArray *)self->m_rectViews objectAtIndex:v71];
    [v72 setHidden:1];

    ++v71;
  }
}

- (BOOL)isDisplayingVerticalSelection
{
  if ([(UITextRangeView *)self _startIsHorizontal]) {
    return ![(UITextRangeView *)self _endIsHorizontal];
  }
  else {
    return 1;
  }
}

- (BOOL)_startIsHorizontal
{
  int v2 = [(UITextRangeView *)self rects];
  BOOL v3 = +[UITextSelectionRect startIsHorizontal:v2];

  return v3;
}

- (BOOL)_endIsHorizontal
{
  int v2 = [(UITextRangeView *)self rects];
  BOOL v3 = +[UITextSelectionRect endIsHorizontal:v2];

  return v3;
}

- (BOOL)shouldHitTestGrabbers
{
  return [(UITextRangeView *)self mode] != 4 && [(UITextRangeView *)self mode] != 5;
}

- (BOOL)shouldShowGrabbers
{
  return [(UITextRangeView *)self mode] == 0;
}

- (void)updateGrabbers
{
  BOOL v3 = [(UITextRangeView *)self selectionView];
  int v4 = [v3 shouldSuppressSelectionHandles];

  char v5 = [(UITextRangeView *)self container];
  if (objc_opt_respondsToSelector())
  {
    if (([v5 _shouldSuppressSelectionHandles] | v4)) {
      goto LABEL_19;
    }
  }
  else if (v4)
  {
LABEL_19:
    [(UISelectionGrabber *)self->m_startGrabber removeFromSuperview];
    [(UISelectionGrabber *)self->m_endGrabber removeFromSuperview];
    m_startGrabber = self->m_startGrabber;
    self->m_startGrabber = 0;

    m_endGrabber = self->m_endGrabber;
    self->m_endGrabber = 0;

    goto LABEL_20;
  }
  if (![(UITextRangeView *)self shouldShowGrabbers]) {
    goto LABEL_19;
  }
  double v6 = [(UITextRangeView *)self rects];
  uint64_t v7 = [v6 count];

  if (!v7) {
    goto LABEL_20;
  }
  BOOL v8 = [(UITextRangeView *)self _startIsHorizontal];
  BOOL v9 = [(UITextRangeView *)self _endIsHorizontal];
  if (!self->m_startGrabber)
  {
    double v10 = [UISelectionGrabber alloc];
    double v11 = -[UISelectionGrabber initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v12 = self->m_startGrabber;
    self->m_startGrabber = v11;

    [(UISelectionGrabber *)self->m_startGrabber setHidden:1];
    if (v8) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = 3;
    }
    [(UISelectionGrabber *)self->m_startGrabber setOrientation:v13];
  }
  if (!self->m_endGrabber)
  {
    int v14 = [UISelectionGrabber alloc];
    int v15 = -[UISelectionGrabber initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v16 = self->m_endGrabber;
    self->m_endGrabber = v15;

    [(UISelectionGrabber *)self->m_endGrabber setHidden:1];
    if (v9) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
    [(UISelectionGrabber *)self->m_endGrabber setOrientation:v17];
  }
  double v18 = [(UIView *)self window];

  if (v18)
  {
    double v19 = [(UIView *)self window];
    objc_msgSend(v19, "convertRect:toView:", self, 0.0, 0.0, 1.0, 1.0);
    double v21 = v20;
    double v23 = v22;
  }
  else
  {
    double v23 = 1.0;
    double v21 = 1.0;
  }
  [(UITextRangeView *)self startEdge];
  if (v8)
  {
    CGFloat v30 = -0.5;
    CGFloat v31 = 0.0;
  }
  else
  {
    CGFloat v30 = 0.0;
    CGFloat v31 = -0.5;
  }
  CGRect v125 = CGRectInset(*(CGRect *)&v26, v30, v31);
  CGFloat x = v125.origin.x;
  double width = v125.size.width;
  double height = v125.size.height;
  CGFloat y = v125.origin.y;
  [(UITextRangeView *)self endEdge];
  double v38 = v23 * height;
  double v39 = v21 * width;
  if (v8) {
    double v40 = v21 * width;
  }
  else {
    double v40 = v23 * height;
  }
  double v109 = width;
  double v112 = v40;
  if (v8) {
    double v41 = height;
  }
  else {
    double v41 = v23 * height;
  }
  CGFloat rect = v41;
  if (v8) {
    double v42 = v21 * width;
  }
  else {
    double v42 = width;
  }
  CGFloat v120 = v42;
  if (v9)
  {
    CGRect v126 = CGRectInset(*(CGRect *)&v34, -0.5, 0.0);
    double v115 = v126.origin.y;
    double v116 = v126.size.height;
    double v117 = v21 * v126.size.width;
    double v114 = v126.origin.x + v126.size.width - v21 * v126.size.width;
  }
  else
  {
    CGRect v127 = CGRectInset(*(CGRect *)&v34, 0.0, -0.5);
    double v114 = v127.origin.x;
    double v116 = v23 * v127.size.height;
    double v117 = v127.size.width;
    double v115 = v127.origin.y + v127.size.height - v23 * v127.size.height;
  }
  if (v8) {
    double v43 = v21;
  }
  else {
    double v43 = v23;
  }
  uint64_t v44 = [(UITextRangeView *)self container];
  double v45 = [v44 textInputView];

  [(UITextRangeView *)self _selectionClipRect];
  double v46 = v128.origin.x;
  double v47 = v128.origin.y;
  double v48 = v128.size.width;
  double v49 = v128.size.height;
  if (!CGRectIsNull(v128))
  {
    objc_msgSend(v45, "convertRect:toView:", self, v46, v47, v48, v49);
    double v46 = v50;
    double v47 = v51;
    double v48 = v52;
    double v49 = v53;
  }
  if (v45)
  {
    v129.origin.CGFloat x = v46;
    v129.origin.CGFloat y = v47;
    v129.size.double width = v48;
    v129.size.double height = v49;
    if (!CGRectIsNull(v129))
    {
      double v113 = v43 * v112;
      if (v8)
      {
        v130.size.double width = v120;
        v130.origin.CGFloat x = x;
        v130.origin.CGFloat y = y;
        v130.size.double height = rect;
        double MinX = CGRectGetMinX(v130);
        v131.origin.CGFloat x = v46;
        v131.origin.CGFloat y = v47;
        v131.size.double width = v48;
        v131.size.double height = v49;
        if (MinX >= CGRectGetMinX(v131))
        {
          double v64 = v120;
          CGFloat v66 = x;
          CGFloat v65 = rect;
        }
        else
        {
          v132.origin.CGFloat x = x;
          v132.origin.CGFloat y = y;
          v132.size.double width = v120;
          v132.size.double height = rect;
          double v110 = CGRectGetMinX(v132);
          v133.origin.CGFloat x = v46;
          v133.origin.CGFloat y = v47;
          v133.size.double width = v48;
          v133.size.double height = v49;
          BOOL v63 = v110 < CGRectGetMinX(v133) - v113;
          double v64 = v120;
          CGFloat v65 = rect;
          CGFloat v66 = x;
          if (!v63)
          {
            v134.origin.CGFloat x = v46;
            v134.origin.CGFloat y = v47;
            v134.size.double width = v48;
            v134.size.double height = v49;
            CGFloat v66 = CGRectGetMinX(v134);
            double v64 = v39;
            CGFloat v65 = height;
          }
        }
        CGFloat v72 = v66;
        CGFloat v73 = y;
        CGFloat v111 = v64;
        CGFloat v74 = v65;
        double MaxX = CGRectGetMaxX(*(CGRect *)&v66);
        v140.origin.CGFloat x = v46;
        v140.origin.CGFloat y = v47;
        v140.size.double width = v48;
        v140.size.double height = v49;
        if (MaxX <= v113 + CGRectGetMaxX(v140))
        {
          v145.origin.CGFloat x = v72;
          v145.origin.CGFloat y = y;
          v145.size.double width = v111;
          v145.size.double height = v65;
          double v84 = CGRectGetMaxX(v145);
          v146.origin.CGFloat x = v46;
          v146.origin.CGFloat y = v47;
          v146.size.double width = v48;
          v146.size.double height = v49;
          if (v84 >= CGRectGetMaxX(v146))
          {
            v147.origin.CGFloat x = v46;
            v147.origin.CGFloat y = v47;
            v147.size.double width = v48;
            v147.size.double height = v49;
            double v76 = CGRectGetMaxX(v147) - v113;
            double v71 = y;
          }
          else
          {
            double v71 = y;
            double v76 = v72;
          }
        }
        else
        {
          double v71 = y;
          double v76 = v72;
        }
      }
      else
      {
        v135.origin.CGFloat x = x;
        v135.origin.CGFloat y = y;
        v135.size.double width = v120;
        v135.size.double height = rect;
        double MinY = CGRectGetMinY(v135);
        v136.origin.CGFloat x = v46;
        v136.origin.CGFloat y = v47;
        v136.size.double width = v48;
        v136.size.double height = v49;
        if (MinY >= CGRectGetMinY(v136))
        {
          double v70 = v120;
          CGFloat v68 = rect;
          double v71 = y;
        }
        else
        {
          v137.origin.CGFloat x = x;
          v137.origin.CGFloat y = y;
          v137.size.double width = v120;
          CGFloat v68 = rect;
          v137.size.double height = rect;
          double v108 = CGRectGetMinY(v137);
          v138.origin.CGFloat x = v46;
          v138.origin.CGFloat y = v47;
          v138.size.double width = v48;
          v138.size.double height = v49;
          CGFloat v69 = CGRectGetMinY(v138);
          double v70 = v120;
          double v71 = y;
          if (v108 >= v69 - v113)
          {
            v139.origin.CGFloat x = v46;
            v139.origin.CGFloat y = v47;
            v139.size.double width = v48;
            v139.size.double height = v49;
            double v71 = CGRectGetMinY(v139);
            double v70 = v109;
            CGFloat v68 = v38;
          }
        }
        double v76 = x;
        CGFloat v77 = x;
        double v78 = v71;
        CGFloat v119 = v70;
        CGFloat v79 = v68;
        double MaxY = CGRectGetMaxY(*(CGRect *)(&v70 - 2));
        v141.origin.CGFloat x = v46;
        v141.origin.CGFloat y = v47;
        v141.size.double width = v48;
        v141.size.double height = v49;
        if (MaxY >= CGRectGetMaxY(v141))
        {
          v142.origin.CGFloat x = x;
          v142.origin.CGFloat y = v71;
          v142.size.double width = v119;
          v142.size.double height = v68;
          double v81 = CGRectGetMaxY(v142);
          v143.origin.CGFloat x = v46;
          v143.origin.CGFloat y = v47;
          v143.size.double width = v48;
          v143.size.double height = v49;
          BOOL v82 = v81 > v113 + CGRectGetMaxY(v143);
          CGFloat v83 = v120;
          if (!v82)
          {
            v144.origin.CGFloat x = v46;
            v144.origin.CGFloat y = v47;
            v144.size.double width = v48;
            v144.size.double height = v49;
            double v71 = v113 + CGRectGetMaxY(v144);
          }
          goto LABEL_63;
        }
      }
      CGFloat v83 = v120;
LABEL_63:
      v148.origin.CGFloat x = v46;
      v148.origin.CGFloat y = v47;
      v148.size.double width = v48;
      v148.size.double height = v49;
      v155.origin.CGFloat x = v76;
      v155.origin.CGFloat y = v71;
      v155.size.double width = v83;
      v155.size.double height = rect;
      CGRect v149 = CGRectIntersection(v148, v155);
      double v60 = v149.origin.x;
      double v58 = v149.origin.y;
      double v59 = v149.size.width;
      double v61 = v149.size.height;
      v149.origin.CGFloat x = v46;
      v149.origin.CGFloat y = v47;
      v149.size.double width = v48;
      v149.size.double height = v49;
      v156.origin.CGFloat x = v114;
      v156.origin.CGFloat y = v115;
      v156.size.double height = v116;
      v156.size.double width = v117;
      CGRect v150 = CGRectIntersection(v149, v156);
      double v57 = v150.origin.x;
      double v56 = v150.origin.y;
      double v54 = v150.size.width;
      double v55 = v150.size.height;
      goto LABEL_64;
    }
  }
  double v55 = v116;
  double v54 = v117;
  double v57 = v114;
  double v56 = v115;
  double v58 = y;
  double v59 = v120;
  double v60 = x;
  double v61 = rect;
LABEL_64:
  int v85 = _AXSReduceMotionEnabled();
  if ([(UIView *)self->m_startGrabber isHidden])
  {
    BOOL v86 = 1;
  }
  else
  {
    v87 = [(UIView *)self->m_startGrabber superview];
    BOOL v86 = v87 == 0;
  }
  v151.origin.CGFloat x = v60;
  v151.origin.CGFloat y = v58;
  v151.size.double width = v59;
  v151.size.double height = v61;
  if (CGRectIsNull(v151) || !UIRectIsDiscrete(v60, v58, v59, v61))
  {
    if (v85) {
      int v93 = 1;
    }
    else {
      int v93 = v86;
    }
    if (v93) {
      uint64_t v94 = 0;
    }
    else {
      uint64_t v94 = 2;
    }
    v95 = self->m_startGrabber;
    v124[0] = MEMORY[0x1E4F143A8];
    v124[1] = 3221225472;
    v124[2] = __33__UITextRangeView_updateGrabbers__block_invoke;
    v124[3] = &unk_1E52D9F70;
    v124[4] = self;
    -[UISelectionGrabber transitionDot:completion:](v95, "transitionDot:completion:", v94, v124, *(void *)&v108);
  }
  else
  {
    [(UIView *)self->m_startGrabber frame];
    v157.origin.CGFloat x = v60;
    v157.origin.CGFloat y = v58;
    v157.size.double width = v59;
    v157.size.double height = v61;
    if (!CGRectEqualToRect(v152, v157)) {
      [(UITextRangeView *)self _cancelGrabberTransitionOutAnimations:self->m_startGrabber];
    }
    v88 = [(UITextRangeView *)self startCustomPath];
    [v88 setLineWidth:v59];
    double v89 = v59;
    double v90 = v61;
    if (v88)
    {
      [v88 boundingRect];
      objc_msgSend(v45, "convertRect:toView:", self);
    }
    -[UITextRangeView _setGrabber:bounds:center:](self, "_setGrabber:bounds:center:", self->m_startGrabber, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v89, v90, v59 * 0.5 + v60, v61 * 0.5 + v58);
    if (v88) {
      [(UIView *)self->m_startGrabber setNeedsDisplay];
    }
    [(UISelectionGrabber *)self->m_startGrabber setCustomPath:v88];
    [(UISelectionGrabber *)self->m_startGrabber setHidden:0];
    [(UISelectionGrabber *)self->m_startGrabber updateDot];
    v91 = [(UIView *)self->m_startGrabber superview];

    if (!v91) {
      [(UIView *)self addSubview:self->m_startGrabber];
    }
    if (v85) {
      BOOL v92 = 0;
    }
    else {
      BOOL v92 = v86;
    }
    [(UISelectionGrabber *)self->m_startGrabber transitionDot:v92 completion:0];
  }
  if ([(UIView *)self->m_endGrabber isHidden])
  {
    BOOL v96 = 1;
  }
  else
  {
    v97 = [(UIView *)self->m_endGrabber superview];
    BOOL v96 = v97 == 0;
  }
  v153.origin.CGFloat x = v57;
  v153.origin.CGFloat y = v56;
  v153.size.double width = v54;
  v153.size.double height = v55;
  if (CGRectIsNull(v153) || !UIRectIsDiscrete(v57, v56, v54, v55))
  {
    if (v85) {
      int v105 = 1;
    }
    else {
      int v105 = v96;
    }
    if (v105) {
      uint64_t v106 = 0;
    }
    else {
      uint64_t v106 = 2;
    }
    v107 = self->m_endGrabber;
    v123[0] = MEMORY[0x1E4F143A8];
    v123[1] = 3221225472;
    v123[2] = __33__UITextRangeView_updateGrabbers__block_invoke_2;
    v123[3] = &unk_1E52D9F70;
    v123[4] = self;
    [(UISelectionGrabber *)v107 transitionDot:v106 completion:v123];
  }
  else
  {
    [(UIView *)self->m_endGrabber frame];
    v158.origin.CGFloat x = v57;
    v158.origin.CGFloat y = v56;
    v158.size.double width = v54;
    v158.size.double height = v55;
    if (!CGRectEqualToRect(v154, v158)) {
      [(UITextRangeView *)self _cancelGrabberTransitionOutAnimations:self->m_endGrabber];
    }
    v98 = [(UITextRangeView *)self endCustomPath];
    [v98 setLineWidth:v54];
    [(UISelectionGrabber *)self->m_endGrabber setCustomPath:v98];
    if (v98)
    {
      [v98 boundingRect];
      double v57 = v99;
      double v56 = v100;
      double v54 = v101;
      double v55 = v102;
    }
    -[UITextRangeView _setGrabber:bounds:center:](self, "_setGrabber:bounds:center:", self->m_endGrabber, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v54, v55, v57 + v54 * 0.5, v56 + v55 * 0.5);
    [(UISelectionGrabber *)self->m_endGrabber setHidden:0];
    [(UISelectionGrabber *)self->m_endGrabber updateDot];
    v103 = [(UIView *)self->m_endGrabber superview];

    if (!v103) {
      [(UIView *)self addSubview:self->m_endGrabber];
    }
    if (v85) {
      BOOL v104 = 0;
    }
    else {
      BOOL v104 = v96;
    }
    [(UISelectionGrabber *)self->m_endGrabber transitionDot:v104 completion:0];
  }
LABEL_20:
}

uint64_t __33__UITextRangeView_updateGrabbers__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 528) setHidden:1];
}

uint64_t __33__UITextRangeView_updateGrabbers__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 536) setHidden:1];
}

- (void)_setGrabber:(id)a3 bounds:(CGRect)a4 center:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v9 = a4.origin.y;
  double v10 = a4.origin.x;
  id v11 = a3;
  objc_msgSend(v11, "setBounds:", v10, v9, width, height);
  objc_msgSend(v11, "setCenter:", x, y);
}

- (void)_cancelGrabberTransitionOutAnimations:(id)a3
{
  id v3 = a3;
  id v6 = [v3 layer];
  [v6 removeAnimationForKey:@"stemView transition out"];
  [v6 removeAnimationForKey:@"stemView opacity transition out"];
  int v4 = [v3 _dotView];

  char v5 = [v4 layer];

  [v5 removeAnimationForKey:@"dotView transition out"];
  [v5 removeAnimationForKey:@"dotView opacity transition out"];
}

- (CGPoint)magnifierPoint
{
  if ([(UITextRangeView *)self baseIsStart])
  {
    BOOL v3 = [(UITextRangeView *)self _endIsHorizontal];
    [(UITextRangeView *)self endEdge];
    double v5 = v4;
    [(UITextRangeView *)self endEdge];
    double v8 = v6 + v7;
    double v9 = v6 + v7 * 0.5;
    if (v3) {
      double v10 = v9;
    }
    else {
      double v10 = v8;
    }
  }
  else
  {
    BOOL v11 = [(UITextRangeView *)self _startIsHorizontal];
    [(UITextRangeView *)self startEdge];
    double v5 = v12;
    [(UITextRangeView *)self startEdge];
    if (v11) {
      double v10 = v13 + v14 * 0.5;
    }
    else {
      double v10 = v13;
    }
  }
  int v15 = [(UITextRangeView *)self container];
  double v16 = [v15 textInputView];
  if (v16)
  {
    uint64_t v17 = [(UITextRangeView *)self container];
    double v18 = [v17 textInputView];
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v18, v5, v10);
    double v5 = v19;
    double v10 = v20;
  }
  double v21 = v5;
  double v22 = v10;
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (CGPoint)convertFromMagnifierPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(UITextRangeView *)self container];
  double v7 = [v6 textInputView];
  if (v7)
  {
    double v8 = [(UITextRangeView *)self container];
    double v9 = [v8 textInputView];
    -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v9, x, y);
    double x = v10;
    double y = v11;
  }
  double v12 = x;
  double v13 = y;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (BOOL)areSelectionRectsVisible
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  int v2 = self->m_rectViews;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isHidden", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (double)inverseScaleForView:(id)a3
{
  uint64_t v3 = [a3 layer];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 transform];
    double v5 = v8;
  }
  else
  {
    double v5 = 0.0;
  }
  double v6 = 1.0 / v5;

  return v6;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [(UITextRangeView *)self _startEdgeHitRectWithPrecision:2];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(UITextRangeView *)self _endEdgeHitRectWithPrecision:2];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  [v7 location];
  v33.double x = v25;
  v33.double y = v26;
  v35.origin.double x = v10;
  v35.origin.double y = v12;
  v35.size.double width = v14;
  v35.size.double height = v16;
  if (CGRectContainsPoint(v35, v33))
  {
    double v27 = @"_UITextCursorStartGrabberRegion";
  }
  else
  {
    [v7 location];
    v34.double x = v28;
    v34.double y = v29;
    v36.origin.double x = v18;
    v36.origin.double y = v20;
    v36.size.double width = v22;
    v36.size.double height = v24;
    CGFloat v30 = v8;
    if (!CGRectContainsPoint(v36, v34)) {
      goto LABEL_6;
    }
    double v10 = v18;
    double v12 = v20;
    double v14 = v22;
    double v16 = v24;
    double v27 = @"_UITextCursorEndGrabberRegion";
  }
  CGFloat v30 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v27, v10, v12, v14, v16);

LABEL_6:
  return v30;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return 0;
}

- (CGRect)startEdge
{
  double x = self->m_startEdge.origin.x;
  double y = self->m_startEdge.origin.y;
  double width = self->m_startEdge.size.width;
  double height = self->m_startEdge.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setStartEdge:(CGRect)a3
{
  self->m_startEdge = a3;
}

- (CGRect)endEdge
{
  double x = self->m_endEdge.origin.x;
  double y = self->m_endEdge.origin.y;
  double width = self->m_endEdge.size.width;
  double height = self->m_endEdge.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setEndEdge:(CGRect)a3
{
  self->m_endEdge = a3;
}

- (CGPoint)basePoint
{
  double x = self->m_basePoint.x;
  double y = self->m_basePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)extentPoint
{
  double x = self->m_extentPoint.x;
  double y = self->m_extentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)initialExtentPoint
{
  double x = self->m_initialExtentPoint.x;
  double y = self->m_initialExtentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialExtentPoint:(CGPoint)a3
{
  self->m_initialExtentPoint = a3;
}

- (UISelectionGrabber)startGrabber
{
  return self->m_startGrabber;
}

- (void)setStartGrabber:(id)a3
{
}

- (UISelectionGrabber)endGrabber
{
  return self->m_endGrabber;
}

- (void)setEndGrabber:(id)a3
{
}

- (BOOL)animateUpdate
{
  return self->m_animateUpdate;
}

- (void)setAnimateUpdate:(BOOL)a3
{
  self->m_animateUpdate = a3;
}

- (BOOL)commandsWereShowing
{
  return self->m_commandsWereShowing;
}

- (void)setCommandsWereShowing:(BOOL)a3
{
  self->m_commandsWereShowing = a3;
}

- (BOOL)willBeginMagnifying
{
  return self->m_willBeginMagnifying;
}

- (void)setWillBeginMagnifying:(BOOL)a3
{
  self->m_willBeginMagnifying = a3;
}

- (BOOL)magnifying
{
  return self->m_magnifying;
}

- (void)setMagnifying:(BOOL)a3
{
  self->m_magnifying = a3;
}

- (BOOL)inGesture
{
  return self->m_inGesture;
}

- (void)setInGesture:(BOOL)a3
{
  self->m_inGesture = a3;
}

- (BOOL)isScrolling
{
  return self->m_scrolling;
}

- (void)setIsScrolling:(BOOL)a3
{
  self->m_scrolling = a3;
}

- (BOOL)scaling
{
  return self->m_scaling;
}

- (void)setScaling:(BOOL)a3
{
  self->m_scaling = a3;
}

- (BOOL)rotating
{
  return self->m_rotating;
}

- (void)setRotating:(BOOL)a3
{
  self->m_rotating = a3;
}

- (BOOL)inputViewIsChanging
{
  return self->m_inputViewIsChanging;
}

- (void)setInputViewIsChanging:(BOOL)a3
{
  self->m_inputViewIsChanging = a3;
}

- (BOOL)isClearingRange
{
  return self->m_isClearingRange;
}

- (void)setIsClearingRange:(BOOL)a3
{
  self->m_isClearingRange = a3;
}

- (BOOL)shouldStayVisible
{
  return self->m_shouldStayVisible;
}

- (void)setShouldStayVisible:(BOOL)a3
{
  self->m_shouldStayVisible = a3;
}

- (BOOL)baseIsStart
{
  return self->_baseIsStart;
}

- (void)setBaseIsStart:(BOOL)a3
{
  self->_baseIsStart = a3;
}

- (CGPoint)activeTouchPoint
{
  double x = self->_activeTouchPoint.x;
  double y = self->_activeTouchPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UISelectionGrabberCustomPath)startCustomPath
{
  return self->_startCustomPath;
}

- (void)setStartCustomPath:(id)a3
{
}

- (UISelectionGrabberCustomPath)endCustomPath
{
  return self->_endCustomPath;
}

- (void)setEndCustomPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endCustomPath, 0);
  objc_storeStrong((id *)&self->_startCustomPath, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->m_endGrabber, 0);
  objc_storeStrong((id *)&self->m_startGrabber, 0);
  objc_storeStrong((id *)&self->m_rectContainerView, 0);
  objc_storeStrong((id *)&self->m_activeTouch, 0);
  objc_storeStrong((id *)&self->m_rectViews, 0);
  objc_storeStrong((id *)&self->m_rects, 0);
  objc_destroyWeak((id *)&self->m_container);
  objc_destroyWeak((id *)&self->m_selectionView);
}

@end