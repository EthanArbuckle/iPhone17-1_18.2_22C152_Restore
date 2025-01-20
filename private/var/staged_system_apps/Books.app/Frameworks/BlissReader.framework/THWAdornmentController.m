@interface THWAdornmentController
- (BOOL)adornmentDisablePanelAnimation:(id)a3;
- (BOOL)adornmentsVisible;
- (BOOL)attemptToPerformCloseButtonAction;
- (BOOL)buttonVisible;
- (BOOL)controlsVisible;
- (BOOL)disablePanelFrameAnimation;
- (BOOL)hasRoomForPanels;
- (BOOL)p_combineBottomAndControlPanels;
- (BOOL)p_controlsVisibleWithAdornmentsVisible:(BOOL)a3;
- (BOOL)p_forceButtonVisible;
- (BOOL)p_panelVisible:(int)a3 default:(BOOL)a4 forced:(BOOL)a5;
- (BOOL)tornDown;
- (CGRect)adornmentPanel:(id)a3 frameForSize:(CGSize)a4;
- (CGRect)closeButtonFrame;
- (CGRect)layoutFrame;
- (THWAdornmentCloseButton)closeButton;
- (THWAdornmentController)initWithExpandedRep:(id)a3 documentRoot:(id)a4;
- (THWAdornmentControllerDelegate)delegate;
- (THWAdornmentPanel)bottomPanel;
- (THWAdornmentPanel)controlPanel;
- (THWAdornmentPanel)topPanel;
- (THWExpandedRep)expandedRep;
- (TSKDocumentRoot)documentRoot;
- (double)adornmentPanelFontSize:(id)a3;
- (double)adornmentPanelMinHeight:(id)a3;
- (double)adornmentPanelTitleLeftIndent:(id)a3;
- (double)adornmentPanelWidth:(id)a3;
- (double)animationDuration;
- (double)heightForPanel:(int)a3 allowDefault:(BOOL)a4;
- (double)p_statusBarOffset;
- (id)adornmentPanelFontName:(id)a3;
- (id)adornmentTrackingRects;
- (id)p_panelForKind:(int)a3;
- (int)appearance;
- (unint64_t)animatingVisibilityCount;
- (unint64_t)panelLayoutDisabledCount;
- (void)addAdornmentViewsToView:(id)a3;
- (void)adornmentPanelDidLayout:(id)a3;
- (void)animatePanel:(int)a3 withCrossFadeContent:(BOOL)a4 backgroundLayout:(BOOL)a5 duration:(double)a6;
- (void)controllerWillAnimateToSize:(CGSize)a3 duration:(double)a4 inFrame:(CGRect)a5;
- (void)dealloc;
- (void)invalidateChildrenInPanel:(int)a3;
- (void)invalidateLayouts;
- (void)invalidateWPAutoInPanel:(int)a3;
- (void)layoutInFrame:(CGRect)a3;
- (void)p_createViews;
- (void)p_handleClose:(id)a3;
- (void)p_layoutPanels;
- (void)p_updateAdornmentVisibilityAnimated:(BOOL)a3 forced:(BOOL)a4 completionBlock:(id)a5;
- (void)p_updateCloseButton;
- (void)setAdornmentsVisible:(BOOL)a3;
- (void)setAdornmentsVisible:(BOOL)a3 animated:(BOOL)a4 completionBlock:(id)a5;
- (void)setAdornmentsVisible:(BOOL)a3 buttonVisible:(BOOL)a4 controlsVisible:(BOOL)a5 forceVisibility:(BOOL)a6 animated:(BOOL)a7 completionBlock:(id)a8;
- (void)setAnimatingVisibilityCount:(unint64_t)a3;
- (void)setAnimationDuration:(double)a3;
- (void)setAppearance:(int)a3;
- (void)setButtonVisible:(BOOL)a3;
- (void)setCloseButton:(id)a3;
- (void)setControlsVisible:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisablePanelFrameAnimation:(BOOL)a3;
- (void)setDocumentRoot:(id)a3;
- (void)setLayoutFrame:(CGRect)a3;
- (void)setPanelLayoutDisabledCount:(unint64_t)a3;
- (void)setTornDown:(BOOL)a3;
- (void)teardown;
- (void)toggleVisibility;
- (void)updateVisibility;
@end

@implementation THWAdornmentController

- (THWAdornmentController)initWithExpandedRep:(id)a3 documentRoot:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THWAdornmentController;
  v6 = [(THWAdornmentController *)&v8 init];
  if (v6)
  {
    v6->_expandedRep = (THWExpandedRep *)a3;
    v6->_documentRoot = (TSKDocumentRoot *)a4;
  }
  return v6;
}

- (void)dealloc
{
  if (![(THWAdornmentController *)self tornDown]) {
    [(THWAdornmentController *)self teardown];
  }

  v3.receiver = self;
  v3.super_class = (Class)THWAdornmentController;
  [(THWAdornmentController *)&v3 dealloc];
}

- (void)teardown
{
  [(THWAdornmentCloseButton *)[(THWAdornmentController *)self closeButton] setTarget:0 action:0];
  [(THWAdornmentPanel *)self->_topPanel teardown];
  [(THWAdornmentPanel *)self->_bottomPanel teardown];
  [(THWAdornmentPanel *)self->_controlPanel teardown];

  [(THWAdornmentController *)self setTornDown:1];
}

- (void)p_createViews
{
  if (self->_topPanel) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:@"-[THWAdornmentController p_createViews]"] file:+[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWAdornmentController.m"] lineNumber:813 description:@"expected nil value for '%s'", "_topPanel"];
  }
  if (self->_bottomPanel) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWAdornmentController p_createViews]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWAdornmentController.m"] lineNumber:814 description:@"expected nil value for '%s'", "_bottomPanel"];
  }
  if (self->_controlPanel) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWAdornmentController p_createViews]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWAdornmentController.m") lineNumber:815 description:@"expected nil value for '%s'", "_controlPanel"];
  }
  if (self->_closeButton) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:@"-[THWAdornmentController p_createViews]"] file:+[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWAdornmentController.m"] lineNumber:816 description:@"expected nil value for '%s'", "_closeButton"];
  }
  if (objc_opt_respondsToSelector()) {
    id v3 = [(THWExpandedRep *)self->_expandedRep expandedAppearance];
  }
  else {
    id v3 = &dword_0 + 1;
  }
  [(THWAdornmentController *)self setAppearance:v3];
  if ([(THWExpandedRep *)self->_expandedRep expandedHasContentForPanel:0])
  {
    self->_topPanel = [[THWAdornmentPanel alloc] initWithDelegate:self kind:0 expandedRep:self->_expandedRep documentRoot:[(THWAdornmentController *)self documentRoot]];
    if ([(THWAdornmentControllerDelegate *)[(THWAdornmentController *)self delegate] adornmentController:self allowWindowMoveForPanel:0])[(TSWOverlayPanelView *)[(THWAdornmentPanel *)self->_topPanel view] setAllowWindowMoveForPanel:1]; {
  }
    }
  if ([(THWExpandedRep *)self->_expandedRep expandedHasContentForPanel:1])
  {
    self->_bottomPanel = [[THWAdornmentPanel alloc] initWithDelegate:self kind:1 expandedRep:self->_expandedRep documentRoot:[(THWAdornmentController *)self documentRoot]];
    if ([(THWAdornmentControllerDelegate *)[(THWAdornmentController *)self delegate] adornmentController:self allowWindowMoveForPanel:1])[(TSWOverlayPanelView *)[(THWAdornmentPanel *)self->_bottomPanel view] setAllowWindowMoveForPanel:1]; {
    [(THWAutosizedCanvasController *)[(THWAdornmentPanel *)self->_bottomPanel autosizedCanvasController] setupImmediatePressGesture];
    }
    v4 = [(THWAutosizedCanvasController *)[(THWAdornmentPanel *)self->_bottomPanel autosizedCanvasController] interactiveCanvasController];
    v5 = [THShortTapGestureRecognizer alloc];
    id v6 = [(TSDInteractiveCanvasController *)v4 gestureDispatcher];
    v7 = [(THShortTapGestureRecognizer *)v5 initWithGestureDispatcher:v6 gestureKind:TSDShortTap];
    [(-[THWAutosizedCanvasController canvasViewController](-[THWAdornmentPanel autosizedCanvasController](self->_bottomPanel, "autosizedCanvasController"), "canvasViewController"), "viewForGestureRecognizer:", v7) addGestureRecognizer:v7];
    [(THShortTapGestureRecognizer *)v7 requireGestureRecognizerToFail:[(THWAutosizedCanvasController *)[(THWAdornmentPanel *)self->_bottomPanel autosizedCanvasController] immediatePressGesture]];
  }
  if ([(THWExpandedRep *)self->_expandedRep expandedHasContentForPanel:2])
  {
    self->_controlPanel = [[THWAdornmentPanel alloc] initWithDelegate:self kind:2 expandedRep:self->_expandedRep documentRoot:[(THWAdornmentController *)self documentRoot]];
    if ([(THWAdornmentControllerDelegate *)[(THWAdornmentController *)self delegate] adornmentController:self allowWindowMoveForPanel:2])[(TSWOverlayPanelView *)[(THWAdornmentPanel *)self->_controlPanel view] setAllowWindowMoveForPanel:1]; {
    [(THWAutosizedCanvasController *)[(THWAdornmentPanel *)self->_controlPanel autosizedCanvasController] setupImmediatePressGesture];
    }
    objc_super v8 = [(THWAutosizedCanvasController *)[(THWAdornmentPanel *)self->_controlPanel autosizedCanvasController] interactiveCanvasController];
    v9 = [THShortTapGestureRecognizer alloc];
    id v10 = [(TSDInteractiveCanvasController *)v8 gestureDispatcher];
    v11 = [(THShortTapGestureRecognizer *)v9 initWithGestureDispatcher:v10 gestureKind:TSDShortTap];
    [-[THWAutosizedCanvasController canvasViewController](-[THWAdornmentPanel autosizedCanvasController](self->_controlPanel, "autosizedCanvasController"), "canvasViewController") viewForGestureRecognizer:v11].addGestureRecognizer:v11;
    [(THShortTapGestureRecognizer *)v11 requireGestureRecognizerToFail:[(THWAutosizedCanvasController *)[(THWAdornmentPanel *)self->_controlPanel autosizedCanvasController] immediatePressGesture]];
  }
  [(TSWOverlayPanelView *)[(THWAdornmentPanel *)self->_topPanel view] setBottomHairlineEnabled:1];
  [(THWAdornmentController *)self p_combineBottomAndControlPanels];
  bottomPanel = self->_bottomPanel;
  if (bottomPanel || (bottomPanel = self->_controlPanel) != 0) {
    [(TSWOverlayPanelView *)[(THWAdornmentPanel *)bottomPanel view] setTopHairlineEnabled:1];
  }
  if ([(THWAdornmentController *)self appearance] == 1) {
    uint64_t v13 = [(THWAdornmentController *)self hasRoomForPanels] ^ 1;
  }
  else {
    uint64_t v13 = 1;
  }
  v14 = [THWAdornmentCloseButton alloc];
  [(THWAdornmentController *)self closeButtonFrame];
  -[THWAdornmentController setCloseButton:](self, "setCloseButton:", -[THWAdornmentCloseButton initWithFrame:theme:](v14, "initWithFrame:theme:", v13));
  [(THWAdornmentCloseButton *)[(THWAdornmentController *)self closeButton] setTarget:self action:"p_handleClose:"];
  v15 = [(THWAdornmentController *)self closeButton];

  [(THWAdornmentCloseButton *)v15 setEnabled:1];
}

- (double)p_statusBarOffset
{
  return 0.0;
}

- (CGRect)closeButtonFrame
{
  CGFloat v3 = CGRectGetMinX(self->_layoutFrame) + 5.0;
  CGFloat v4 = CGRectGetMinY(self->_layoutFrame) + 0.0;
  [(THWAdornmentController *)self p_statusBarOffset];
  double v6 = v4 + v5;
  double v7 = 100.0;
  double v8 = v3;
  double v9 = 100.0;
  result.size.height = v9;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v8;
  return result;
}

- (void)p_updateCloseButton
{
  [(THWAdornmentController *)self closeButtonFrame];
  double v4 = v3;
  double v6 = v5;
  [(THWAdornmentCloseButton *)[(THWAdornmentController *)self closeButton] frame];
  -[THWAdornmentCloseButton setFrame:]([(THWAdornmentController *)self closeButton], "setFrame:", v4, v6, v7, v8);
  double v9 = [(THWAdornmentController *)self closeButton];

  [(THWAdornmentCloseButton *)v9 updateImage];
}

- (BOOL)attemptToPerformCloseButtonAction
{
  double v3 = [(THWAdornmentController *)self closeButton];
  if (v3)
  {
    if (([(THWAdornmentCloseButton *)[(THWAdornmentController *)self closeButton] isHidden] & 1) != 0|| [(THWAdornmentController *)self animatingVisibilityCount])
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      [(THWAdornmentCloseButton *)[(THWAdornmentController *)self closeButton] sendActionsForControlEvents:64];
      LOBYTE(v3) = 1;
    }
  }
  return (char)v3;
}

- (BOOL)p_panelVisible:(int)a3 default:(BOOL)a4 forced:(BOOL)a5
{
  BOOL v5 = a4;
  if (a5) {
    return v5;
  }
  uint64_t v6 = *(void *)&a3;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v5;
  }
  expandedRep = self->_expandedRep;

  return [(THWExpandedRep *)expandedRep expandedPanel:v6 isVisibleWithDefault:v5];
}

- (void)p_updateAdornmentVisibilityAnimated:(BOOL)a3 forced:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  BOOL v9 = self->_adornmentsVisible && [(THWAdornmentController *)self hasRoomForPanels];
  BOOL v10 = [(THWAdornmentController *)self p_panelVisible:0 default:v9 forced:v6];
  BOOL v11 = self->_adornmentsVisible && [(THWAdornmentController *)self hasRoomForPanels];
  BOOL v12 = [(THWAdornmentController *)self p_panelVisible:1 default:v11 forced:v6];
  BOOL v13 = [(THWAdornmentController *)self p_panelVisible:2 default:self->_controlsVisible forced:v6];
  BOOL v14 = v13;
  if (self->_buttonVisible) {
    double v15 = 1.0;
  }
  else {
    double v15 = 0.0;
  }
  if (v10) {
    double v16 = 1.0;
  }
  else {
    double v16 = 0.0;
  }
  if (v12) {
    double v17 = 1.0;
  }
  else {
    double v17 = 0.0;
  }
  if (v13) {
    double v18 = 1.0;
  }
  else {
    double v18 = 0.0;
  }
  [(THWAdornmentController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![(THWAdornmentControllerDelegate *)[(THWAdornmentController *)self delegate] shouldShowCloseButton])
  {
    double v15 = 0.0;
  }
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v24 = sub_14E7C0;
  v25 = &unk_457278;
  v26 = self;
  BOOL v27 = v10;
  if (v7)
  {
    unint64_t animatingVisibilityCount = self->_animatingVisibilityCount;
    if (!animatingVisibilityCount)
    {
      [(TSWOverlayPanelView *)[(THWAdornmentPanel *)[(THWAdornmentController *)self topPanel] view] alphaAnimationWillBegin];
      [(TSWOverlayPanelView *)[(THWAdornmentPanel *)[(THWAdornmentController *)self bottomPanel] view] alphaAnimationWillBegin];
      [(TSWOverlayPanelView *)[(THWAdornmentPanel *)[(THWAdornmentController *)self controlPanel] view] alphaAnimationWillBegin];
      unint64_t animatingVisibilityCount = self->_animatingVisibilityCount;
    }
    self->_unint64_t animatingVisibilityCount = animatingVisibilityCount + 1;
    +[CATransaction begin];
    +[CATransaction setAnimationTimingFunction:](CATransaction, "setAnimationTimingFunction:", +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]);
    +[CATransaction setAnimationDuration:0.4];
    if (objc_opt_respondsToSelector())
    {
      if (self->_topPanel) {
        [(THWExpandedRep *)self->_expandedRep expandedPanel:0 willAnimateToVisible:v10 duration:0.4];
      }
      if (self->_bottomPanel) {
        [(THWExpandedRep *)self->_expandedRep expandedPanel:1 willAnimateToVisible:v12 duration:0.4];
      }
      if (self->_controlPanel) {
        [(THWExpandedRep *)self->_expandedRep expandedPanel:2 willAnimateToVisible:v14 duration:0.4];
      }
    }
    v24((uint64_t)v23);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_14E864;
    v22[3] = &unk_459F20;
    *(double *)&v22[6] = v15;
    *(double *)&v22[7] = v16;
    *(double *)&v22[8] = v17;
    *(double *)&v22[9] = v18;
    v22[4] = self;
    v22[5] = a5;
    +[CATransaction setCompletionBlock:v22];
    [(THWAdornmentCloseButton *)[(THWAdornmentController *)self closeButton] setHidden:0];
    [(TSWOverlayPanelView *)[(THWAdornmentPanel *)[(THWAdornmentController *)self topPanel] view] setHidden:0];
    [(TSWOverlayPanelView *)[(THWAdornmentPanel *)[(THWAdornmentController *)self bottomPanel] view] setHidden:0];
    [(TSWOverlayPanelView *)[(THWAdornmentPanel *)[(THWAdornmentController *)self controlPanel] view] setHidden:0];
    id v20 = [(THWAdornmentCloseButton *)[(THWAdornmentController *)self closeButton] layer];
    double v21 = 0.0;
    if (v15 == 0.0) {
      double v21 = 0.3;
    }
    [v20 addCABasicOpacityAnimationToValue:0 duration:v15 removedOnCompletion:v21];
    [(-[THWAdornmentController topPanel](self, "topPanel"), "view"), "layer"] addCABasicOpacityAnimationToValue:0 duration:v16 removedOnCompletion:0.0];
    [(-[TSWOverlayPanelView layer](-[THWAdornmentPanel view](-[THWAdornmentController bottomPanel](self, "bottomPanel"), "view"), "layer")) addCABasicOpacityAnimationToValue:0 duration:v17 removedOnCompletion:0.0];
    [(-[TSWOverlayPanelView layer](-[THWAdornmentPanel view](-[THWAdornmentController controlPanel](self, "controlPanel"), "view"), "layer")) addCABasicOpacityAnimationToValue:0 duration:v18 removedOnCompletion:0.0];
  }
  else
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    v24((uint64_t)v23);
    [[-[THWAdornmentController closeButton](self, "closeButton") layer] removeAnimationForKey:@"opacity"];
    [(-[TSWOverlayPanelView layer](-[THWAdornmentPanel view](-[THWAdornmentController topPanel](self, "topPanel"), "view"), "layer")) removeAnimationForKey:@"opacity"];
    [(-[TSWOverlayPanelView layer](-[THWAdornmentPanel view](-[THWAdornmentController bottomPanel](self, "bottomPanel"), "view"), "layer")) removeAnimationForKey:@"opacity"];
    [(-[TSWOverlayPanelView layer](-[THWAdornmentPanel view](-[THWAdornmentController controlPanel](self, "controlPanel"), "view"), "layer")) removeAnimationForKey:@"opacity"];
    [(THWAdornmentCloseButton *)[(THWAdornmentController *)self closeButton] setTsdAlpha:v15];
    [(TSWOverlayPanelView *)[(THWAdornmentPanel *)[(THWAdornmentController *)self topPanel] view] setTsdAlpha:v16];
    [(TSWOverlayPanelView *)[(THWAdornmentPanel *)[(THWAdornmentController *)self bottomPanel] view] setTsdAlpha:v17];
    [(TSWOverlayPanelView *)[(THWAdornmentPanel *)[(THWAdornmentController *)self controlPanel] view] setTsdAlpha:v18];
    [(THWAdornmentCloseButton *)[(THWAdornmentController *)self closeButton] setHidden:v15 == 0.0];
    [(TSWOverlayPanelView *)[(THWAdornmentPanel *)[(THWAdornmentController *)self topPanel] view] setHidden:v16 == 0.0];
    [(TSWOverlayPanelView *)[(THWAdornmentPanel *)[(THWAdornmentController *)self bottomPanel] view] setHidden:v17 == 0.0];
    [(TSWOverlayPanelView *)[(THWAdornmentPanel *)[(THWAdornmentController *)self controlPanel] view] setHidden:v18 == 0.0];
    if (a5) {
      (*((void (**)(id))a5 + 2))(a5);
    }
  }
  +[CATransaction commit];
}

- (void)p_handleClose:(id)a3
{
  if (![(THWAdornmentController *)self animatingVisibilityCount])
  {
    double v4 = [(THWAdornmentController *)self delegate];
    [(THWAdornmentControllerDelegate *)v4 handleCloseForAdornmentController:self];
  }
}

- (void)p_layoutPanels
{
  if (self->_panelLayoutDisabledCount) {
    return;
  }
  [(THWAdornmentControllerDelegate *)[(THWAdornmentController *)self delegate] safeAreaInsetsForAdornmentController:self];
  double v4 = v3;
  double v7 = -v6;
  double v9 = -v8;
  -[TSWOverlayPanelView setAdditionalBackgroundInset:]([(THWAdornmentPanel *)self->_topPanel view], "setAdditionalBackgroundInset:", -v5, -v6, 0.0, -v8);
  bottomPanel = self->_bottomPanel;
  if (!bottomPanel)
  {
    double v11 = -v4;
    bottomPanel = self->_controlPanel;
    goto LABEL_7;
  }
  double v11 = -v4;
  if (!self->_controlPanel)
  {
LABEL_7:
    BOOL v12 = [(THWAdornmentPanel *)bottomPanel view];
    double v14 = v7;
    double v13 = v11;
    goto LABEL_8;
  }
  -[TSWOverlayPanelView setAdditionalBackgroundInset:]([(THWAdornmentPanel *)self->_controlPanel view], "setAdditionalBackgroundInset:", 0.0, v7, v11, v9);
  BOOL v12 = [(THWAdornmentPanel *)self->_bottomPanel view];
  double v13 = 0.0;
  double v14 = v7;
LABEL_8:
  -[TSWOverlayPanelView setAdditionalBackgroundInset:](v12, "setAdditionalBackgroundInset:", 0.0, v14, v13, v9);
  [(THWAdornmentPanel *)self->_topPanel layoutPanel];
  [(THWAdornmentPanel *)self->_controlPanel layoutPanel];
  [(THWAdornmentPanel *)self->_bottomPanel layoutPanel];
  if (self->_bottomPanel
    && self->_controlPanel
    && [(THWAdornmentController *)self p_combineBottomAndControlPanels])
  {
    [(THWAdornmentPanel *)self->_controlPanel height];
    -[TSWOverlayPanelView setAdditionalShadowInset:]([(THWAdornmentPanel *)self->_bottomPanel view], "setAdditionalShadowInset:", 0.0, 0.0, -v15, 0.0);
    [(TSWOverlayPanelView *)[(THWAdornmentPanel *)self->_controlPanel view] setBackdropGroupName:@"THWAdornmentControllerSharedBackdrop"];
    double v16 = [(THWAdornmentPanel *)self->_bottomPanel view];
    [(TSWOverlayPanelView *)v16 setBackdropGroupName:@"THWAdornmentControllerSharedBackdrop"];
  }
}

- (void)layoutInFrame:(CGRect)a3
{
  self->_layoutFrame = a3;
  [(THWAdornmentController *)self p_layoutPanels];
  [(THWAdornmentController *)self p_updateCloseButton];
  [(THWAdornmentController *)self invalidateLayouts];

  [(THWAdornmentController *)self p_updateAdornmentVisibilityAnimated:0 forced:0 completionBlock:0];
}

- (void)addAdornmentViewsToView:(id)a3
{
  +[CATransaction begin];
  if (![(THWAdornmentController *)self closeButton]
    || [(THWExpandedRep *)self->_expandedRep expandedHasContentForPanel:0]&& !self->_topPanel|| [(THWExpandedRep *)self->_expandedRep expandedHasContentForPanel:1]&& !self->_bottomPanel|| [(THWExpandedRep *)self->_expandedRep expandedHasContentForPanel:2]&& !self->_controlPanel)
  {
    [(THWAdornmentController *)self p_createViews];
  }
  topPanel = self->_topPanel;
  if (topPanel) {
    [a3 addSubview:[topPanel view]];
  }
  bottomPanel = self->_bottomPanel;
  if (bottomPanel) {
    [a3 addSubview:[bottomPanel view]];
  }
  controlPanel = self->_controlPanel;
  if (controlPanel) {
    [a3 addSubview:[controlPanel view]];
  }
  if (self->_closeButton) {
    [a3 addSubview:];
  }
  if (self->_bottomPanel
    && self->_controlPanel
    && [(THWAdornmentController *)self p_combineBottomAndControlPanels])
  {
    [(TSWOverlayPanelView *)[(THWAdornmentPanel *)self->_controlPanel view] setShadowOpacity:0.0];
  }
  [(THWAdornmentController *)self setAdornmentsVisible:0 buttonVisible:0 controlsVisible:0 forceVisibility:0 animated:0 completionBlock:0];

  +[CATransaction commit];
}

- (id)adornmentTrackingRects
{
  id v3 = +[NSMutableArray array];
  if (self->_topPanel)
  {
    unsigned int v4 = [(THWAdornmentPanel *)[(THWAdornmentController *)self topPanel] hasBeenSized];
    double v5 = [(THWAdornmentPanel *)[(THWAdornmentController *)self topPanel] view];
    if (v4)
    {
      [(TSWOverlayPanelView *)v5 frame];
    }
    else
    {
      [v5 superview].frame;
      double v6 = 0.0;
      double v7 = 0.0;
    }
    [v3 addObject:[NSValue valueWithCGRect:v6, v7]];
  }
  bottomPanel = self->_bottomPanel;
  if (bottomPanel)
  {
    if (self->_controlPanel)
    {
      if ([(THWAdornmentPanel *)bottomPanel hasBeenSized])
      {
        [(TSWOverlayPanelView *)[(THWAdornmentPanel *)self->_bottomPanel view] frame];
        CGFloat v10 = v9;
        double v12 = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
      }
      else
      {
        [(-[THWAdornmentPanel view](-[THWAdornmentController bottomPanel](self, "bottomPanel"), "view"), "superview") frame];
        double v12 = v20 + -44.0;
        [[[self bottomPanel] view] superview].frame;
        CGFloat v14 = v21;
        CGFloat v10 = 0.0;
        CGFloat v16 = 44.0;
      }
      if ([(THWAdornmentPanel *)self->_controlPanel hasBeenSized])
      {
        [(TSWOverlayPanelView *)[(THWAdornmentPanel *)self->_controlPanel view] frame];
        uint64_t v23 = v22;
        double v25 = v24;
        uint64_t v27 = v26;
        uint64_t v29 = v28;
      }
      else
      {
        [[-[THWAdornmentPanel view](-[THWAdornmentController controlPanel](self, "controlPanel"), "view"), "superview"] frame];
        double v25 = v30 + -44.0;
        [(-[THWAdornmentPanel view](-[THWAdornmentController controlPanel](self, "controlPanel"), "view"), "superview") frame];
        uint64_t v27 = v31;
        uint64_t v23 = 0;
        uint64_t v29 = 0x4046000000000000;
      }
      v43.origin.x = v10;
      v43.origin.double y = v12;
      v43.size.width = v14;
      v43.size.height = v16;
      double v32 = v25;
      CGRect v44 = CGRectUnion(v43, *(CGRect *)&v23);
      double y = v44.origin.y;
      goto LABEL_23;
    }
    if ([(THWAdornmentPanel *)bottomPanel hasBeenSized])
    {
      [(TSWOverlayPanelView *)[(THWAdornmentPanel *)self->_bottomPanel view] frame];
      double v19 = v18;
    }
    else
    {
      [[[[self bottomPanel] view] superview] frame];
      double v19 = v34 + -44.0;
      [[[[self bottomPanel] view] superview] frame];
      double v17 = 0.0;
    }
    [v3 addObject:[NSValue valueWithCGRect:v17, v19]];
  }
  controlPanel = self->_controlPanel;
  if (controlPanel)
  {
    if ([(THWAdornmentPanel *)controlPanel hasBeenSized])
    {
      [(TSWOverlayPanelView *)[(THWAdornmentPanel *)self->_controlPanel view] frame];
      double y = v36;
    }
    else
    {
      [(-[THWAdornmentPanel view](-[THWAdornmentController controlPanel](self, "controlPanel"), "view"), "superview") frame];
      double y = v37 + -44.0;
      [[[self controlPanel] view] superview].frame;
      v44.origin.x = 0.0;
      v44.size.height = 44.0;
    }
LABEL_23:
    [v3 addObject:[NSValue valueWithCGRect:v44.origin.x, y, v44.size.width, v44.size.height]];
  }
  if (!self->_topPanel && [(THWAdornmentController *)self closeButton])
  {
    [(THWAdornmentCloseButton *)[(THWAdornmentController *)self closeButton] frame];
    double v39 = v38;
    [(-[THWAdornmentController closeButton](self, "closeButton"), "superview") frame];
    double v41 = v40;
    [(THWAdornmentCloseButton *)[(THWAdornmentController *)self closeButton] frame];
    [v3 addObject:[NSValue valueWithCGRect:0.0, v39, v41]];
  }
  return v3;
}

- (void)controllerWillAnimateToSize:(CGSize)a3 duration:(double)a4 inFrame:(CGRect)a5
{
  self->_layoutFrame = a5;
  ++self->_panelLayoutDisabledCount;
  uint64_t v7 = 1;
  -[THWAdornmentPanel animateWithCrossFadeContent:backgroundLayout:duration:](self->_topPanel, "animateWithCrossFadeContent:backgroundLayout:duration:", 1, 0, a4, a3.height);
  [(THWAdornmentPanel *)self->_bottomPanel animateWithCrossFadeContent:1 backgroundLayout:0 duration:a4];
  [(THWAdornmentPanel *)self->_controlPanel animateWithCrossFadeContent:1 backgroundLayout:0 duration:a4];
  [(THWAdornmentController *)self invalidateLayouts];
  if (![(THWAdornmentController *)self adornmentsVisible]) {
    uint64_t v7 = [(THWAdornmentController *)self hasRoomForPanels] ^ 1;
  }
  [(THWAdornmentController *)self setAdornmentsVisible:v7];
  --self->_panelLayoutDisabledCount;

  [(THWAdornmentController *)self p_layoutPanels];
}

- (void)invalidateLayouts
{
  [(THWAdornmentPanel *)self->_topPanel invalidateLayoutsAndFrames];
  [(THWAdornmentPanel *)self->_bottomPanel invalidateLayoutsAndFrames];
  [(THWAdornmentPanel *)self->_controlPanel invalidateLayoutsAndFrames];
  [(THWAdornmentPanel *)self->_topPanel layoutIfNeeded];
  [(THWAdornmentPanel *)self->_bottomPanel layoutIfNeeded];
  [(THWAdornmentPanel *)self->_controlPanel layoutIfNeeded];

  [(THWAdornmentController *)self p_updateCloseButton];
}

- (void)toggleVisibility
{
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWAdornmentController toggleVisibility]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWAdornmentController.m") lineNumber:1292 description:@"Manipulating UI outside main thread."];
  }
  uint64_t v3 = [(THWAdornmentController *)self adornmentsVisible] ^ 1;

  [(THWAdornmentController *)self setAdornmentsVisible:v3 animated:1 completionBlock:0];
}

- (BOOL)p_combineBottomAndControlPanels
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  expandedRep = self->_expandedRep;

  return [(THWExpandedRep *)expandedRep expandedShouldCombineBottomAndControlPanels];
}

- (BOOL)p_controlsVisibleWithAdornmentsVisible:(BOOL)a3
{
  return ![(THWAdornmentController *)self p_combineBottomAndControlPanels] || a3;
}

- (void)setAdornmentsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  self->_adornmentsVisible = a3;
  self->_buttonVisible = [(THWAdornmentController *)self p_forceButtonVisible] || a3;
  self->_controlsVisible = [(THWAdornmentController *)self p_controlsVisibleWithAdornmentsVisible:v3];

  [(THWAdornmentController *)self p_updateAdornmentVisibilityAnimated:0 forced:0 completionBlock:0];
}

- (void)updateVisibility
{
}

- (void)setAdornmentsVisible:(BOOL)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  BOOL v9 = -[THWAdornmentController p_controlsVisibleWithAdornmentsVisible:](self, "p_controlsVisibleWithAdornmentsVisible:");

  [(THWAdornmentController *)self setAdornmentsVisible:v7 buttonVisible:v7 controlsVisible:v9 forceVisibility:0 animated:v6 completionBlock:a5];
}

- (void)setAdornmentsVisible:(BOOL)a3 buttonVisible:(BOOL)a4 controlsVisible:(BOOL)a5 forceVisibility:(BOOL)a6 animated:(BOOL)a7 completionBlock:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWAdornmentController setAdornmentsVisible:buttonVisible:controlsVisible:forceVisibility:animated:completionBlock:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWAdornmentController.m") lineNumber:1337 description:@"Manipulating UI outside main thread."];
  }
  self->_adornmentsVisible = a3;
  if (!v10)
  {
    a4 |= [(THWAdornmentController *)self p_forceButtonVisible];
    a5 |= a3;
  }
  self->_buttonVisible = a4;
  self->_controlsVisible = a5;

  [(THWAdornmentController *)self p_updateAdornmentVisibilityAnimated:v9 forced:v10 completionBlock:a8];
}

- (BOOL)hasRoomForPanels
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  [(THWAdornmentPanel *)self->_topPanel layoutIfNeeded];
  [(THWAdornmentPanel *)self->_bottomPanel layoutIfNeeded];
  [(THWAdornmentPanel *)self->_controlPanel layoutIfNeeded];
  [(THWAdornmentPanel *)self->_topPanel height];
  double v4 = v3;
  [(THWAdornmentPanel *)self->_bottomPanel height];
  double v6 = v4 + v5;
  [(THWAdornmentPanel *)self->_controlPanel height];
  double v8 = v6 + v7;
  if (v8 == 0.0) {
    double v8 = 44.0;
  }
  expandedRep = self->_expandedRep;
  double x = self->_layoutFrame.origin.x;
  double y = self->_layoutFrame.origin.y;
  double width = self->_layoutFrame.size.width;
  double height = self->_layoutFrame.size.height;

  return -[THWExpandedRep expandedHasRoomForPanelsWithHeight:inFrame:](expandedRep, "expandedHasRoomForPanelsWithHeight:inFrame:", v8, x, y, width, height);
}

- (BOOL)p_forceButtonVisible
{
  if ((objc_opt_respondsToSelector() & 1) == 0 || [(THWAdornmentController *)self hasRoomForPanels]) {
    return 0;
  }
  expandedRep = self->_expandedRep;

  return [(THWExpandedRep *)expandedRep expandedWantsButtonVisibleWhenNoPanels];
}

- (double)adornmentPanelMinHeight:(id)a3
{
  if ([a3 kind] >= 3) {
    double v5 = 0.0;
  }
  else {
    double v5 = 44.0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return v5;
  }
  expandedRep = self->_expandedRep;
  id v7 = [a3 kind];

  [(THWExpandedRep *)expandedRep expandedMinHeightForPanel:v7 withDefault:v5];
  return result;
}

- (CGRect)adornmentPanel:(id)a3 frameForSize:(CGSize)a4
{
  TSDRoundedSize();
  TSDRectWithSize();
  CGFloat v7 = v6;
  double v9 = v8;
  [(THWAdornmentController *)self adornmentPanelMinHeight:a3];
  double v11 = fmax(v9, v10);
  CGFloat MinX = CGRectGetMinX(self->_layoutFrame);
  double MinY = CGRectGetMinY(self->_layoutFrame);
  unsigned int v14 = [a3 kind];
  if (v14 == 2)
  {
    double MaxY = CGRectGetMaxY(self->_layoutFrame);
    v24.origin.double x = MinX;
    v24.origin.double y = MinY;
    v24.size.double width = v7;
    v24.size.double height = v11;
    double MinY = MaxY - CGRectGetHeight(v24);
  }
  else if (v14 == 1)
  {
    double v15 = CGRectGetMaxY(self->_layoutFrame);
    v23.origin.double x = MinX;
    v23.origin.double y = MinY;
    v23.size.double width = v7;
    v23.size.double height = v11;
    double v16 = v15 - CGRectGetHeight(v23);
    [(THWAdornmentPanel *)self->_controlPanel height];
    double MinY = v16 - v17;
  }
  double v19 = MinX;
  double v20 = MinY;
  double v21 = v7;
  double v22 = v11;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (BOOL)adornmentDisablePanelAnimation:(id)a3
{
  return self->_disablePanelFrameAnimation;
}

- (void)adornmentPanelDidLayout:(id)a3
{
  [(THWAdornmentController *)self p_layoutPanels];
  [(THWAdornmentController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v4 = [(THWAdornmentController *)self delegate];
    [(THWAdornmentControllerDelegate *)v4 updateTrackingRectsForAdornmentController:self];
  }
}

- (double)adornmentPanelWidth:(id)a3
{
  return self->_layoutFrame.size.width;
}

- (double)adornmentPanelFontSize:(id)a3
{
  unsigned int v3 = [a3 kind];
  double result = 10.0;
  if (v3 < 3) {
    return 14.0;
  }
  return result;
}

- (id)adornmentPanelFontName:(id)a3
{
  if ([a3 kind] || !TSUPhoneUI()) {
    return 0;
  }
  id v3 = +[TSUFont systemFontOfSize:14.0];

  return [v3 fontName];
}

- (double)adornmentPanelTitleLeftIndent:(id)a3
{
  return 34.0;
}

- (id)p_panelForKind:(int)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return (id)*((void *)&self->_topPanel + a3);
  }
}

- (void)invalidateChildrenInPanel:(int)a3
{
  id v3 = [(THWAdornmentController *)self p_panelForKind:*(void *)&a3];

  [v3 invalidateChildren];
}

- (void)invalidateWPAutoInPanel:(int)a3
{
  id v3 = [(THWAdornmentController *)self p_panelForKind:*(void *)&a3];

  [v3 invalidateWPAuto];
}

- (double)heightForPanel:(int)a3 allowDefault:(BOOL)a4
{
  id v6 = -[THWAdornmentController p_panelForKind:](self, "p_panelForKind:");
  [v6 height];
  if (v6) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = a4;
  }
  if (v8 && a3 < 3) {
    return 44.0;
  }
  return result;
}

- (void)animatePanel:(int)a3 withCrossFadeContent:(BOOL)a4 backgroundLayout:(BOOL)a5 duration:(double)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = [(THWAdornmentController *)self p_panelForKind:*(void *)&a3];

  [v9 animateWithCrossFadeContent:v8 backgroundLayout:v7 duration:a6];
}

- (BOOL)disablePanelFrameAnimation
{
  return self->_disablePanelFrameAnimation;
}

- (void)setDisablePanelFrameAnimation:(BOOL)a3
{
  self->_disablePanelFrameAnimation = a3;
}

- (BOOL)adornmentsVisible
{
  return self->_adornmentsVisible;
}

- (BOOL)buttonVisible
{
  return self->_buttonVisible;
}

- (void)setButtonVisible:(BOOL)a3
{
  self->_buttonVisible = a3;
}

- (BOOL)controlsVisible
{
  return self->_controlsVisible;
}

- (void)setControlsVisible:(BOOL)a3
{
  self->_controlsVisible = a3;
}

- (THWAdornmentControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWAdornmentControllerDelegate *)a3;
}

- (THWExpandedRep)expandedRep
{
  return self->_expandedRep;
}

- (TSKDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (void)setDocumentRoot:(id)a3
{
  self->_documentRoot = (TSKDocumentRoot *)a3;
}

- (THWAdornmentCloseButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (CGRect)layoutFrame
{
  double x = self->_layoutFrame.origin.x;
  double y = self->_layoutFrame.origin.y;
  double width = self->_layoutFrame.size.width;
  double height = self->_layoutFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLayoutFrame:(CGRect)a3
{
  self->_layoutFrame = a3;
}

- (unint64_t)panelLayoutDisabledCount
{
  return self->_panelLayoutDisabledCount;
}

- (void)setPanelLayoutDisabledCount:(unint64_t)a3
{
  self->_panelLayoutDisabledCount = a3;
}

- (int)appearance
{
  return self->_appearance;
}

- (void)setAppearance:(int)a3
{
  self->_appearance = a3;
}

- (unint64_t)animatingVisibilityCount
{
  return self->_animatingVisibilityCount;
}

- (void)setAnimatingVisibilityCount:(unint64_t)a3
{
  self->_unint64_t animatingVisibilityCount = a3;
}

- (THWAdornmentPanel)topPanel
{
  return self->_topPanel;
}

- (THWAdornmentPanel)bottomPanel
{
  return self->_bottomPanel;
}

- (THWAdornmentPanel)controlPanel
{
  return self->_controlPanel;
}

- (BOOL)tornDown
{
  return self->_tornDown;
}

- (void)setTornDown:(BOOL)a3
{
  self->_tornDown = a3;
}

@end