@interface THWAdornmentPanel
- (BOOL)allowSelectionPopoverForAutosizedCanvasController:(id)a3;
- (BOOL)animatingPanel;
- (BOOL)autosizedCanvasController:(id)a3 allowsEditMenuForRep:(id)a4;
- (BOOL)autosizedCanvasController:(id)a3 allowsSelectionForRep:(id)a4;
- (BOOL)autosizedCanvasControllerIsRelatedCanvasScrolling:(id)a3;
- (BOOL)hasBeenSized;
- (BOOL)hasBeenSizedDuringAnimation;
- (BOOL)stackedControlContainer:(id)a3 allowsLastLineTruncationForLayout:(id)a4;
- (CGPoint)stackedControlContainerOrigin:(id)a3;
- (THWAdornmentPanel)initWithDelegate:(id)a3 kind:(int)a4 expandedRep:(id)a5 documentRoot:(id)a6;
- (THWAdornmentPanelDelegate)delegate;
- (THWAutosizedCanvasController)autosizedCanvasController;
- (THWExpandedRep)expandedRep;
- (THWStackedControlContainer)stackedControlContainer;
- (TSWOverlayPanelView)view;
- (UIEdgeInsets)stackedControlContainerInsets:(id)a3;
- (double)animationDuration;
- (double)height;
- (double)stackedControlContainer:(id)a3 leftRightInsetForTextLayout:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalPaddingBefore:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalSpacingAfter:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalSpacingBefore:(id)a4;
- (double)stackedControlContainerMinHeight:(id)a3;
- (double)stackedControlContainerWidth:(id)a3;
- (id)autosizedCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5;
- (id)autosizedCanvasController:(id)a3 geometryProviderForLayout:(id)a4;
- (id)autosizedCanvasController:(id)a3 primaryTargetForGesture:(id)a4;
- (id)controlContainerAdditionalChildLayouts:(id)a3;
- (id)controlContainerChildInfosForLayout:(id)a3;
- (id)interactiveCanvasController;
- (id)p_styleProviderForLayout:(id)a3 inPanel:(int)a4;
- (id)stackedControlContainer:(id)a3 layoutGeometryForLayout:(id)a4;
- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4;
- (int)kind;
- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4;
- (unsigned)stackedControlContainer:(id)a3 maxLineCountForLayout:(id)a4;
- (unsigned)stackedControlContainerVerticalAlignment:(id)a3;
- (void)animateWithCrossFadeContent:(BOOL)a3 backgroundLayout:(BOOL)a4 duration:(double)a5;
- (void)autosizedCanvasControllerDidResize:(id)a3;
- (void)dealloc;
- (void)invalidateChildren;
- (void)invalidateLayoutsAndFrames;
- (void)invalidateWPAuto;
- (void)layoutIfNeeded;
- (void)layoutPanel;
- (void)p_didLayout;
- (void)p_unhideViewIfNeeded;
- (void)teardown;
@end

@implementation THWAdornmentPanel

- (THWAdornmentPanel)initWithDelegate:(id)a3 kind:(int)a4 expandedRep:(id)a5 documentRoot:(id)a6
{
  v20.receiver = self;
  v20.super_class = (Class)THWAdornmentPanel;
  v10 = [(THWAdornmentPanel *)&v20 init];
  v11 = v10;
  if (v10)
  {
    v10->_delegate = (THWAdornmentPanelDelegate *)a3;
    v10->_kind = a4;
    v10->_stackedControlContainer = [[THWStackedControlContainer alloc] initWithDelegate:v10];
    v11->_autosizedCanvasController = [[THWAutosizedCanvasController alloc] initWithDelegate:v11 documentRoot:a6];
    v11->_expandedRep = (THWExpandedRep *)a5;
    v12 = [TSWOverlayPanelView alloc];
    [(THWAdornmentPanelDelegate *)v11->_delegate adornmentPanelWidth:v11];
    double v14 = v13;
    [(THWAdornmentPanelDelegate *)v11->_delegate adornmentPanelMinHeight:v11];
    v16 = -[TSWOverlayPanelView initWithFrame:](v12, "initWithFrame:", 0.0, 0.0, v14, v15);
    v11->_view = v16;
    [(TSWOverlayPanelView *)v16 setAutoresizingMask:2];
    [(TSWOverlayPanelView *)v11->_view setTsdAlpha:0.0];
    v17 = [(THWAutosizedCanvasController *)v11->_autosizedCanvasController canvasView];
    [v17 setTsdBackgroundColor:[+[TSUColor clearColor](TSUColor, "clearColor") platformColor]];
    [(TSDCanvasView *)v17 setUserInteractionEnabled:1];
    [(TSDCanvasView *)v17 setClipsToBounds:0];
    [(TSDInteractiveCanvasController *)[(THWAutosizedCanvasController *)v11->_autosizedCanvasController interactiveCanvasController] setCreateRepsForOffscreenLayouts:1];
    [(TSWOverlayPanelView *)v11->_view addSubview:v17];
    if (v11->_stackedControlContainer) {
      [(TSDInteractiveCanvasController *)[(THWAutosizedCanvasController *)v11->_autosizedCanvasController interactiveCanvasController] setInfosToDisplay:+[NSArray arrayWithObject:](NSArray, "arrayWithObject:")];
    }
    if (objc_opt_respondsToSelector()) {
      id v18 = [(THWExpandedRep *)v11->_expandedRep expandedAppearanceForPanel:v11->_kind];
    }
    else {
      id v18 = &dword_0 + 1;
    }
    [(TSWOverlayPanelView *)v11->_view setAppearance:v18];
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWAdornmentPanel;
  [(THWAdornmentPanel *)&v3 dealloc];
}

- (void)teardown
{
}

- (id)interactiveCanvasController
{
  return [(THWAutosizedCanvasController *)self->_autosizedCanvasController interactiveCanvasController];
}

- (void)invalidateChildren
{
  id v2 = objc_msgSend(objc_msgSend(-[THWAdornmentPanel interactiveCanvasController](self, "interactiveCanvasController"), "layoutController"), "layoutForInfo:", self->_stackedControlContainer);

  [v2 invalidateChildren];
}

- (void)invalidateWPAuto
{
  id v2 = objc_msgSend(objc_msgSend(-[THWAdornmentPanel interactiveCanvasController](self, "interactiveCanvasController"), "layoutController"), "layoutForInfo:", self->_stackedControlContainer);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [v2 children];
  v4 = (char *)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        v8 = (void *)TSUDynamicCast();
        [v8 invalidateTextLayout];
        [v8 invalidateMaxAutoGrowWidth];
        ++v7;
      }
      while (v5 != v7);
      v5 = (char *)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)layoutIfNeeded
{
  id v2 = [(THWAdornmentPanel *)self interactiveCanvasController];

  [v2 layoutIfNeeded];
}

- (void)invalidateLayoutsAndFrames
{
  [(THWAutosizedCanvasController *)self->_autosizedCanvasController invalidateLayoutsAndFrames];

  [(THWAdornmentPanel *)self p_unhideViewIfNeeded];
}

- (double)height
{
  view = self->_view;
  if (!view) {
    return 0.0;
  }
  [(TSWOverlayPanelView *)view frame];
  return v3;
}

- (void)p_unhideViewIfNeeded
{
  if ([(TSWOverlayPanelView *)self->_view isHidden])
  {
    [(TSWOverlayPanelView *)self->_view setHidden:0];
    id v3 = [(TSWOverlayPanelView *)self->_view layer];
    [v3 setOpacity:0.0];
  }
}

- (void)animateWithCrossFadeContent:(BOOL)a3 backgroundLayout:(BOOL)a4 duration:(double)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  [(THWAdornmentPanel *)self p_unhideViewIfNeeded];
  *(_WORD *)&self->_hasBeenSizedDuringAnimation = 256;
  self->_animationDuration = a5;
  long long v9 = [(THWAutosizedCanvasController *)self->_autosizedCanvasController interactiveCanvasController];
  if (v6) {
    [(TSDInteractiveCanvasController *)v9 forceBackgroundLayout];
  }
  if (v7)
  {
    id v10 = +[CATransition animation];
    [v10 setType:kCATransitionFade];
    [v10 setDuration:a5];
    id v11 = [(TSDCanvasView *)[(THWAutosizedCanvasController *)self->_autosizedCanvasController canvasView] layer];
    [v11 addAnimation:v10 forKey:@"fadeAnimation"];
  }
}

- (id)autosizedCanvasController:(id)a3 geometryProviderForLayout:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  expandedRep = self->_expandedRep;

  return [(THWExpandedRep *)expandedRep expandedLayoutGeometryProvider];
}

- (id)autosizedCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  expandedRep = self->_expandedRep;
  uint64_t kind = self->_kind;

  return [(THWExpandedRep *)expandedRep expandedPanel:kind primaryTargetForGesture:a4];
}

- (BOOL)autosizedCanvasControllerIsRelatedCanvasScrolling:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  expandedRep = self->_expandedRep;

  return [(THWExpandedRep *)expandedRep expandedIsRelatedCanvasScrolling];
}

- (void)layoutPanel
{
  [(THWAutosizedCanvasController *)self->_autosizedCanvasController canvasLayoutSize];
  if (!self->_hasBeenSized) {
    [(THWAdornmentPanelDelegate *)self->_delegate adornmentPanelWidth:self];
  }
  -[THWAdornmentPanelDelegate adornmentPanel:frameForSize:](self->_delegate, "adornmentPanel:frameForSize:", self);
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(TSWOverlayPanelView *)self->_view frame];
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  if (CGRectEqualToRect(v13, v14))
  {
    if (self->_hasBeenSizedDuringAnimation) {
      self->_animatingPanel = 0;
    }
    self->_hasBeenSizedDuringAnimation = 0;
  }
  else if (self->_animatingPanel && self->_animationDuration > 0.0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_14D344;
    v12[3] = &unk_457188;
    v12[4] = self;
    *(double *)&v12[5] = v4;
    *(double *)&v12[6] = v6;
    *(double *)&v12[7] = v8;
    *(double *)&v12[8] = v10;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_14D358;
    v11[3] = &unk_457140;
    v11[4] = self;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v12, v11);
  }
  else
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    -[TSWOverlayPanelView setFrame:](self->_view, "setFrame:", v4, v6, v8, v10);
    +[CATransaction commit];
    *(_WORD *)&self->_hasBeenSizedDuringAnimation = 0;
  }
}

- (void)p_didLayout
{
  self->_hasBeenSized = 1;
  if (self->_animatingPanel) {
    self->_hasBeenSizedDuringAnimation = 1;
  }
  [(THWAdornmentPanelDelegate *)self->_delegate adornmentPanelDidLayout:self];
}

- (void)autosizedCanvasControllerDidResize:(id)a3
{
  if (+[NSThread isMainThread])
  {
    [(THWAdornmentPanel *)self p_didLayout];
  }
}

- (id)autosizedCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  id result = [a5 parentRep];
  if (result)
  {
    if (protocol_isEqual((Protocol *)a4, (Protocol *)&OBJC_PROTOCOL___TSDLayoutGeometryProvider)
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      expandedRep = self->_expandedRep;
      return [(THWExpandedRep *)expandedRep expandedLayoutGeometryProvider];
    }
    else if ([(THWExpandedRep *)self->_expandedRep conformsToProtocol:a4])
    {
      return self->_expandedRep;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)autosizedCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (BOOL)autosizedCanvasController:(id)a3 allowsSelectionForRep:(id)a4
{
  return 0;
}

- (BOOL)allowSelectionPopoverForAutosizedCanvasController:(id)a3
{
  return 0;
}

- (id)controlContainerChildInfosForLayout:(id)a3
{
  return [(THWExpandedRep *)self->_expandedRep expandedChildInfosForPanel:self->_kind];
}

- (id)controlContainerAdditionalChildLayouts:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  expandedRep = self->_expandedRep;
  uint64_t kind = self->_kind;

  return [(THWExpandedRep *)expandedRep expandedAdditionalChildLayoutsForPanel:kind];
}

- (double)stackedControlContainerWidth:(id)a3
{
  [(THWAdornmentPanelDelegate *)self->_delegate adornmentPanelWidth:self];
  return result;
}

- (CGPoint)stackedControlContainerOrigin:(id)a3
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIEdgeInsets)stackedControlContainerInsets:(id)a3
{
  char v4 = objc_opt_respondsToSelector();
  double v5 = 10.0;
  double v6 = 10.0;
  double v7 = 10.0;
  double v8 = 10.0;
  if (v4) {
    -[THWExpandedRep expandedStackedControlContainerInsetsForPanel:withDefault:](self->_expandedRep, "expandedStackedControlContainerInsetsForPanel:withDefault:", self->_kind, 10.0, 10.0, 10.0, 10.0);
  }
  result.right = v5;
  result.bottom = v6;
  result.left = v7;
  result.top = v8;
  return result;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 10.0;
  }
  expandedRep = self->_expandedRep;
  uint64_t kind = self->_kind;

  [(THWExpandedRep *)expandedRep expandedVerticalPaddingAfterForLayout:a4 inPanel:kind];
  return result;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingBefore:(id)a4
{
  return 0.0;
}

- (double)stackedControlContainer:(id)a3 verticalSpacingAfter:(id)a4
{
  return 0.0;
}

- (double)stackedControlContainer:(id)a3 verticalSpacingBefore:(id)a4
{
  return 0.0;
}

- (id)stackedControlContainer:(id)a3 layoutGeometryForLayout:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  [(THWAdornmentPanel *)self stackedControlContainerInsets:a3];
  expandedRep = self->_expandedRep;
  uint64_t kind = self->_kind;
  [(THWAdornmentPanelDelegate *)self->_delegate adornmentPanelWidth:self];

  return -[THWExpandedRep expandedLayoutGeometryForLayout:inPanel:withWidth:insets:](expandedRep, "expandedLayoutGeometryForLayout:inPanel:withWidth:insets:", a4, kind);
}

- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 4;
  }
  expandedRep = self->_expandedRep;
  uint64_t kind = self->_kind;

  return [(THWExpandedRep *)expandedRep expandedAlignmentForLayout:a4 inPanel:kind];
}

- (id)p_styleProviderForLayout:(id)a3 inPanel:(int)a4
{
  double v5 = -[THWAdornmentWPStyleProvider initWithStorage:]([THWAdornmentWPStyleProvider alloc], "initWithStorage:", [a3 info]);
  if ([(TSWOverlayPanelView *)self->_view appearance]) {
    BOOL v6 = [(TSWOverlayPanelView *)self->_view appearance] == 2
  }
      && [(THWAdornmentPanelDelegate *)[(THWAdornmentPanel *)self delegate] adornmentPanelBackgroundAppearance:self] == 0;
  else {
    BOOL v6 = 1;
  }
  [(THWAdornmentWPStyleProvider *)v5 setUseDarkAppearance:v6];
  [(THWAdornmentPanelDelegate *)self->_delegate adornmentPanelFontSize:self];
  -[THWAdornmentWPStyleProvider setFontSize:](v5, "setFontSize:");
  [(THWAdornmentWPStyleProvider *)v5 setFontName:[(THWAdornmentPanelDelegate *)self->_delegate adornmentPanelFontName:self]];
  [(THWAdornmentWPStyleProvider *)v5 setTextAlignment:0];
  return v5;
}

- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4
{
  id v7 = [(THWAdornmentPanel *)self p_styleProviderForLayout:a4 inPanel:self->_kind];
  uint64_t v8 = [(THWAdornmentPanel *)self stackedControlContainer:a3 alignmentForLayout:a4];
  if (self->_kind)
  {
    uint64_t v9 = v8;
    double v10 = 0.0;
  }
  else
  {
    id v11 = [objc_alloc((Class)TSWPText) initWithParagraphStyle:[v7 paragraphStyleAtParIndex:0 effectiveRange:0]];
    [v11 setStyleProvider:v7];
    [v11 measureStorage:[a4 info]];
    double v13 = v12;
    [(THWAdornmentPanel *)self stackedControlContainerWidth:a3];
    double v15 = v14;
    [(THWAdornmentPanel *)self stackedControlContainerInsets:a3];
    double v18 = (v15 - v16 - v17 - v13) * 0.5;
    [(THWAdornmentPanelDelegate *)self->_delegate adornmentPanelTitleLeftIndent:self];
    BOOL v20 = v18 > v19;
    if (v18 <= v19) {
      double v10 = v19;
    }
    else {
      double v10 = 0.0;
    }
    uint64_t v9 = (2 * v20);
  }
  [v7 setTextAlignment:v9];
  [v7 setLeftIndent:v10];
  return v7;
}

- (BOOL)stackedControlContainer:(id)a3 allowsLastLineTruncationForLayout:(id)a4
{
  return 1;
}

- (unsigned)stackedControlContainer:(id)a3 maxLineCountForLayout:(id)a4
{
  if (self->_kind)
  {
    uint64_t v6 = 0;
  }
  else if (TSUPadUI())
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 10;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v6;
  }
  expandedRep = self->_expandedRep;
  uint64_t kind = self->_kind;

  return [(THWExpandedRep *)expandedRep expandedMaxLineCountForTextLayout:a4 inPanel:kind withDefault:v6];
}

- (double)stackedControlContainer:(id)a3 leftRightInsetForTextLayout:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 10.0;
  }
  expandedRep = self->_expandedRep;
  uint64_t kind = self->_kind;

  [(THWExpandedRep *)expandedRep expandedLeftRightInsetForTextLayout:a4 inPanel:kind];
  return result;
}

- (double)stackedControlContainerMinHeight:(id)a3
{
  if (self->_kind > 1u) {
    return 0.0;
  }
  [(THWAdornmentPanelDelegate *)self->_delegate adornmentPanelMinHeight:self];
  return result;
}

- (unsigned)stackedControlContainerVerticalAlignment:(id)a3
{
  return self->_kind < 2u;
}

- (THWAdornmentPanelDelegate)delegate
{
  return self->_delegate;
}

- (TSWOverlayPanelView)view
{
  return self->_view;
}

- (THWAutosizedCanvasController)autosizedCanvasController
{
  return self->_autosizedCanvasController;
}

- (THWStackedControlContainer)stackedControlContainer
{
  return self->_stackedControlContainer;
}

- (BOOL)hasBeenSized
{
  return self->_hasBeenSized;
}

- (int)kind
{
  return self->_kind;
}

- (THWExpandedRep)expandedRep
{
  return self->_expandedRep;
}

- (BOOL)hasBeenSizedDuringAnimation
{
  return self->_hasBeenSizedDuringAnimation;
}

- (BOOL)animatingPanel
{
  return self->_animatingPanel;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

@end