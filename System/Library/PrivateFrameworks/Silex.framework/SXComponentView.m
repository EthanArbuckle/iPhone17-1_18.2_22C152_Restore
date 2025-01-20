@interface SXComponentView
- ($EB925890EBEBD6850280D1FB85A9BD43)presentationChanges;
- (BOOL)allowViewHierarchyRemoval;
- (BOOL)animationsAndBehaviorsEnabled;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureShouldBegin:(id)a3;
- (BOOL)hasAnimation;
- (BOOL)hasBehaviors;
- (BOOL)hasRenderedComponentStyle;
- (BOOL)hasRenderedContents;
- (BOOL)isDraggable;
- (BOOL)isHighlighted;
- (BOOL)isTransitionable;
- (BOOL)requiresThoroughFrameCalculations;
- (BOOL)transitionViewIsVisible;
- (BOOL)transitionViewShouldFadeInContent;
- (BOOL)userInteractable;
- (BOOL)usesThumbnailWithImageIdentifier:(id)a3;
- (CGRect)absoluteFrame;
- (CGRect)backgroundViewFrame;
- (CGRect)contentFrame;
- (CGRect)originalFrame;
- (CGRect)originalFrameForContentView:(id)a3 behavior:(id)a4;
- (CGRect)presentationFrame;
- (CGRect)transitionContainerFrame;
- (CGRect)transitionContentFrame;
- (CGRect)transitionVisibleFrame;
- (NSString)description;
- (SXColumnLayout)documentColumnLayout;
- (SXComponent)component;
- (SXComponentHosting)componentHost;
- (SXComponentLayout)componentLayout;
- (SXComponentState)state;
- (SXComponentStyle)componentStyle;
- (SXComponentStyleRenderer)componentStyleRenderer;
- (SXComponentStyleRendererFactory)componentStyleRendererFactory;
- (SXComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6;
- (SXDOMObjectProviding)DOMObjectProvider;
- (SXFillView)fillView;
- (SXPresentationDelegate)presentationDelegate;
- (SXUnitConverter)unitConverter;
- (SXViewport)viewport;
- (UIEdgeInsets)borderInsets;
- (UIEdgeInsets)componentLayoutMargins;
- (UIView)backgroundView;
- (UIView)contentView;
- (UIView)highlightView;
- (UIView)transitionContentView;
- (id)classification;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)presentationState;
- (int64_t)visibilityState;
- (unint64_t)componentIndex;
- (void)animationDidFinish:(id)a3;
- (void)animationDidStart:(id)a3;
- (void)assistiveTechnologyStatusDidChange;
- (void)dealloc;
- (void)didApplyBehavior:(id)a3;
- (void)didMoveToWindow;
- (void)didReceiveMemoryWarning;
- (void)discardContents;
- (void)invalidateComponentStyle;
- (void)loadComponent:(id)a3;
- (void)prepareComponentStyleRendererForStyle:(id)a3;
- (void)prepareForTransitionType:(unint64_t)a3;
- (void)presentComponentWithChanges:(id)a3;
- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4;
- (void)renderComponentStyle;
- (void)renderContents;
- (void)renderContentsIfNeeded;
- (void)restoreBehavior;
- (void)setAbsoluteFrame:(CGRect)a3;
- (void)setAllowViewHierarchyRemoval:(BOOL)a3;
- (void)setAnimationsAndBehaviorsEnabled:(BOOL)a3;
- (void)setBackgroundViewFrame:(CGRect)a3;
- (void)setBorderInsets:(UIEdgeInsets)a3;
- (void)setComponentHost:(id)a3;
- (void)setComponentIndex:(unint64_t)a3;
- (void)setComponentLayoutMargins:(UIEdgeInsets)a3;
- (void)setComponentStyle:(id)a3;
- (void)setContentFrame:(CGRect)a3;
- (void)setDocumentColumnLayout:(id)a3;
- (void)setFillView:(id)a3;
- (void)setHasAnimation:(BOOL)a3;
- (void)setHasBehaviors:(BOOL)a3;
- (void)setHasRenderedComponentStyle:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setOriginalFrame:(CGRect)a3;
- (void)setPresentationChanges:(id)a3;
- (void)setPresentationFrame:(CGRect)a3;
- (void)setPresentationState:(int64_t)a3;
- (void)setRequiresThoroughFrameCalculations:(BOOL)a3;
- (void)setState:(id)a3;
- (void)setVisibilityState:(int64_t)a3;
- (void)setupComponentStyleRendererForStyle:(id)a3;
- (void)updateAllowHierarchyRemovalWithComponent:(id)a3 componentStyle:(id)a4;
- (void)visibilityStateDidChangeFromState:(int64_t)a3;
- (void)willPresentComponentWithChanges:(id)a3;
@end

@implementation SXComponentView

- (SXComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)SXComponentView;
  double v15 = *MEMORY[0x263F001A8];
  double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v17 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v18 = *(double *)(MEMORY[0x263F001A8] + 24);
  v19 = -[SXComponentView initWithFrame:](&v30, sel_initWithFrame_, *MEMORY[0x263F001A8], v16, v17, v18);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v20->_viewport, a4);
    objc_storeWeak((id *)&v20->_presentationDelegate, v13);
    objc_storeStrong((id *)&v20->_componentStyleRendererFactory, a6);
    uint64_t v21 = objc_opt_new();
    state = v20->_state;
    v20->_state = (SXComponentState *)v21;

    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v15, v16, v17, v18);
    contentView = v20->_contentView;
    v20->_contentView = (UIView *)v23;

    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v15, v16, v17, v18);
    backgroundView = v20->_backgroundView;
    v20->_backgroundView = (UIView *)v25;

    [(UIView *)v20->_backgroundView addSubview:v20->_contentView];
    [(SXComponentView *)v20 addSubview:v20->_backgroundView];
    v27 = [(SXComponentView *)v20 layer];
    [v27 setAllowsGroupOpacity:0];

    v28 = [MEMORY[0x263F08A00] defaultCenter];
    [v28 addObserver:v20 selector:sel_didReceiveMemoryWarning name:*MEMORY[0x263F1D060] object:0];
  }
  return v20;
}

- (void)didReceiveMemoryWarning
{
  if ([(SXComponentView *)self visibilityState] != 1)
  {
    [(SXComponentView *)self discardContents];
    if (!self->_hasBehaviors && !self->_hasAnimation)
    {
      [(SXComponentView *)self invalidateComponentStyle];
    }
  }
}

- (void)loadComponent:(id)a3
{
  objc_storeStrong((id *)&self->_component, a3);
  id v5 = a3;
  self->_animationsAndBehaviorsEnabled = 1;
  v6 = [v5 behaviors];
  self->_hasBehaviors = [v6 count] != 0;

  id v7 = [v5 animation];

  self->_hasAnimation = v7 != 0;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)SXComponentView;
  [(SXComponentView *)&v4 didMoveToWindow];
  v3 = [(SXComponentView *)self window];

  if (!v3) {
    -[SXComponentView setPresentationFrame:](self, "setPresentationFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
}

- (void)dealloc
{
  v3 = [(SXComponentView *)self presentationDelegate];
  objc_super v4 = [v3 behaviorController];
  [v4 unregisterComponentView:self];

  id v5 = [(SXComponentView *)self presentationDelegate];
  v6 = [v5 animationController];
  [v6 unregisterComponentView:self];

  id v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 removeObserver:self name:*MEMORY[0x263F1D060] object:0];

  v8.receiver = self;
  v8.super_class = (Class)SXComponentView;
  [(SXComponentView *)&v8 dealloc];
}

- (void)renderContents
{
  self->_hasRenderedContents = 1;
}

- (void)discardContents
{
  self->_hasRenderedContents = 0;
}

- (void)renderContentsIfNeeded
{
  if (!self->_hasRenderedContents) {
    [(SXComponentView *)self renderContents];
  }
  if (self->_componentStyle)
  {
    if (self->_componentStyleRenderer
      || (-[SXComponentView setupComponentStyleRendererForStyle:](self, "setupComponentStyleRendererForStyle:"),
          [(SXComponentView *)self prepareComponentStyleRendererForStyle:self->_componentStyle], self->_componentStyle))
    {
      if (!self->_hasRenderedComponentStyle)
      {
        [(SXComponentView *)self renderComponentStyle];
      }
    }
  }
}

- (void)willPresentComponentWithChanges:(id)a3
{
  if ((*(_WORD *)&a3.var0 & 0x101) != 0) {
    self->_hasRenderedComponentStyle = 0;
  }
  objc_super v4 = [(SXComponentView *)self DOMObjectProvider];
  id v5 = [(SXComponentView *)self component];
  id v12 = [v4 componentStyleForComponent:v5];

  [(SXComponentView *)self setupComponentStyleRendererForStyle:v12];
  v6 = [(SXComponentView *)self DOMObjectProvider];
  id v7 = [(SXComponentView *)self component];
  objc_super v8 = [v7 layout];
  v9 = [v6 componentLayoutForIdentifier:v8];
  componentLayout = self->_componentLayout;
  self->_componentLayout = v9;

  id v11 = [(SXComponentView *)self component];
  [(SXComponentView *)self updateAllowHierarchyRemovalWithComponent:v11 componentStyle:v12];
}

- (void)presentComponentWithChanges:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  [(SXComponentView *)self frame];
  -[SXComponentView setOriginalFrame:](self, "setOriginalFrame:");
  [(SXComponentView *)self prepareComponentStyleRendererForStyle:self->_componentStyle];
  if ([(SXComponentView *)self hasAnimation]
    && [(SXComponentView *)self animationsAndBehaviorsEnabled])
  {
    objc_super v4 = [(SXComponentView *)self presentationDelegate];
    id v5 = [v4 animationController];
    v6 = [(SXComponentView *)self component];
    id v7 = [v6 animation];
    [v5 registerComponentView:self animation:v7];
  }
  else
  {
    objc_super v4 = [(SXComponentView *)self presentationDelegate];
    id v5 = [v4 animationController];
    [v5 unregisterComponentView:self];
  }

  if ([(SXComponentView *)self hasBehaviors]
    && [(SXComponentView *)self animationsAndBehaviorsEnabled])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    objc_super v8 = [(SXComponentView *)self component];
    v9 = [v8 behaviors];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          double v15 = [(SXComponentView *)self presentationDelegate];
          double v16 = [v15 behaviorController];
          [v16 registerComponentView:self behavior:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }
  }
  else
  {
    id v18 = [(SXComponentView *)self presentationDelegate];
    double v17 = [v18 behaviorController];
    [v17 unregisterComponentView:self];
  }
}

- (void)setVisibilityState:(int64_t)a3
{
  int64_t visibilityState = self->_visibilityState;
  if (visibilityState != a3)
  {
    self->_int64_t visibilityState = a3;
    [(SXComponentView *)self visibilityStateDidChangeFromState:visibilityState];
  }
}

- (void)visibilityStateDidChangeFromState:(int64_t)a3
{
  id v5 = [(SXComponentView *)self component];
  v6 = [v5 animation];

  if (v6)
  {
    if ([(SXComponentView *)self visibilityState] == 1
      && [(SXComponentView *)self animationsAndBehaviorsEnabled])
    {
      id v7 = [(SXComponentView *)self presentationDelegate];
      objc_super v8 = [v7 animationController];
      [v8 startUpdatingAnimationForComponentView:self];
LABEL_8:

      goto LABEL_9;
    }
    int64_t v9 = [(SXComponentView *)self visibilityState];
    if (a3 == 1 && v9 == 2)
    {
      id v7 = [(SXComponentView *)self presentationDelegate];
      objc_super v8 = [v7 animationController];
      [v8 stopUpdatingAnimationForComponentView:self];
      goto LABEL_8;
    }
  }
LABEL_9:
  id v10 = [(SXComponentView *)self componentStyleRenderer];
  [v10 componentVisiblityStateDidChange:a3];
}

- (CGRect)originalFrameForContentView:(id)a3 behavior:(id)a4
{
  id v5 = a3;
  id v6 = [(SXComponentView *)self fillView];

  if (v6 == v5) {
    [(SXComponentView *)self contentFrame];
  }
  else {
    [(SXComponentView *)self originalFrame];
  }
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)restoreBehavior
{
  id v3 = [(SXComponentView *)self presentationDelegate];
  [v3 updateBehaviorForComponentView:self];
}

- (void)updateAllowHierarchyRemovalWithComponent:(id)a3 componentStyle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = !UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning();
  double v9 = [v7 animation];

  double v10 = [v7 behaviors];

  uint64_t v11 = [v10 count];
  uint64_t v12 = [v6 fill];

  uint64_t v13 = [v12 attachment];
  if (v11) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = v13 == 1;
  }
  BOOL v15 = !v14;
  if (v9) {
    BOOL v15 = 0;
  }
  if (!v8) {
    BOOL v15 = 0;
  }
  self->_allowViewHierarchyRemoval = v15;
}

- (void)setRequiresThoroughFrameCalculations:(BOOL)a3
{
  self->_requiresThoroughFrameCalculations = a3;
  if (!a3) {
    -[SXComponentView setPresentationFrame:](self, "setPresentationFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SXComponentView *)self highlightView];
  id v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      id v7 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
      highlightView = self->_highlightView;
      self->_highlightView = v7;

      double v9 = [(SXComponentView *)self highlightView];
      double v10 = [MEMORY[0x263F1C550] blackColor];
      uint64_t v11 = [v10 colorWithAlphaComponent:0.1];
      [v9 setBackgroundColor:v11];
    }
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __34__SXComponentView_setHighlighted___block_invoke;
    v15[3] = &unk_2646511F8;
    v15[4] = self;
    [MEMORY[0x263F1CB60] performWithoutAnimation:v15];
    uint64_t v12 = [(SXComponentView *)self contentView];
    uint64_t v13 = [(SXComponentView *)self highlightView];
    [v12 addSubview:v13];

    BOOL v14 = [(SXComponentView *)self highlightView];
    [v14 setAlpha:1.0];
  }
  else
  {
    [v5 setAlpha:0.0];

    BOOL v14 = [(SXComponentView *)self highlightView];
    [v14 removeFromSuperview];
  }

  self->_highlighted = v3;
}

void __34__SXComponentView_setHighlighted___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) highlightView];
  [v2 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) highlightView];
  BOOL v3 = [*(id *)(a1 + 32) contentView];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (void)setupComponentStyleRendererForStyle:(id)a3
{
  id v7 = a3;
  if (!self->_componentStyleRenderer || ![(SXJSONObject *)self->_componentStyle isEqual:v7])
  {
    objc_storeStrong((id *)&self->_componentStyle, a3);
    id v5 = [(SXComponentStyleRendererFactory *)self->_componentStyleRendererFactory componentStyleRendererForComponentStyle:v7];
    componentStyleRenderer = self->_componentStyleRenderer;
    self->_componentStyleRenderer = v5;

    self->_hasRenderedComponentStyle = 0;
  }
}

- (void)prepareComponentStyleRendererForStyle:(id)a3
{
}

- (void)renderComponentStyle
{
  if (!self->_hasRenderedComponentStyle)
  {
    [(SXComponentStyleRenderer *)self->_componentStyleRenderer applyComponentStyle];
    self->_hasRenderedComponentStyle = 1;
  }
}

- (void)invalidateComponentStyle
{
  componentStyleRenderer = self->_componentStyleRenderer;
  self->_componentStyleRenderer = 0;

  self->_hasRenderedComponentStyle = 0;
}

- (CGRect)transitionContentFrame
{
  double v2 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)transitionViewIsVisible
{
  [(SXComponentView *)self absoluteFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  uint64_t v11 = [(SXComponentView *)self viewport];
  [v11 dynamicBounds];
  v19.origin.x = v12;
  v19.origin.y = v13;
  v19.size.width = v14;
  v19.size.height = v15;
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  BOOL v16 = CGRectIntersectsRect(v18, v19);

  return v16;
}

- (CGRect)transitionVisibleFrame
{
  [(SXComponentView *)self absoluteFrame];
  double v4 = v3;
  double v6 = v5;
  [(SXComponentView *)self frame];
  BOOL v10 = v9 == v6 && v8 == v4;
  double v11 = 0.0;
  if (!v10) {
    double v11 = v7;
  }
  double v12 = v6 - v11;
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = v4;
  result.size.height = v12;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)transitionContainerFrame
{
  double v3 = [(SXComponentView *)self viewport];
  [(SXComponentView *)self frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(SXComponentView *)self superview];
  objc_msgSend(v3, "convertRect:fromView:", v12, v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (BOOL)usesThumbnailWithImageIdentifier:(id)a3
{
  return 0;
}

- (UIView)transitionContentView
{
  return 0;
}

- (BOOL)transitionViewShouldFadeInContent
{
  return 0;
}

- (void)prepareForTransitionType:(unint64_t)a3
{
  id v10 = [(SXComponentView *)self component];
  uint64_t v4 = [v10 animation];
  if (v4)
  {
    double v5 = (void *)v4;
    double v6 = [(SXComponentView *)self component];
    double v7 = [v6 animation];
    int v8 = [v7 transitionBehavior];

    if (v8 != 1) {
      return;
    }
    id v10 = [(SXComponentView *)self presentationDelegate];
    double v9 = [v10 animationController];
    [v9 stopUpdatingAnimationForComponentView:self finishAnimation:1];
  }
}

- (BOOL)isTransitionable
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureShouldBegin:(id)a3
{
  return 1;
}

- (void)setAnimationsAndBehaviorsEnabled:(BOOL)a3
{
  self->_animationsAndBehaviorsEnabled = a3;
  if (!a3)
  {
    uint64_t v4 = [(SXComponentView *)self component];
    double v5 = [v4 animation];

    if (v5)
    {
      double v6 = [(SXComponentView *)self presentationDelegate];
      double v7 = [v6 animationController];
      [v7 stopUpdatingAnimationForComponentView:self finishAnimation:1];
    }
    int v8 = [(SXComponentView *)self component];
    double v9 = [v8 behaviors];
    id v12 = [v9 firstObject];

    if (v12)
    {
      id v10 = [(SXComponentView *)self presentationDelegate];
      double v11 = [v10 behaviorController];
      [v11 unregisterComponentView:self];
    }
  }
}

- (void)animationDidStart:(id)a3
{
}

- (void)animationDidFinish:(id)a3
{
}

- (void)didApplyBehavior:(id)a3
{
  [(SXComponentView *)self setRequiresThoroughFrameCalculations:a3 != 0];
}

- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4
{
  id v7 = a3;
  if ([a4 isEqualToString:@"unitConverter"]) {
    objc_storeStrong((id *)&self->_unitConverter, a3);
  }
}

- (CGRect)absoluteFrame
{
  CGFloat x = self->_absoluteFrame.origin.x;
  CGFloat y = self->_absoluteFrame.origin.y;
  CGFloat width = self->_absoluteFrame.size.width;
  CGFloat height = self->_absoluteFrame.size.height;
  if ([(SXComponentView *)self requiresThoroughFrameCalculations])
  {
    [(SXComponentView *)self presentationFrame];
    if (!CGRectEqualToRect(v15, *MEMORY[0x263F001A8]))
    {
      [(SXComponentView *)self presentationFrame];
      CGFloat x = v7;
      CGFloat y = v8;
      CGFloat width = v9;
      CGFloat height = v10;
    }
  }
  double v11 = x;
  double v12 = y;
  double v13 = width;
  double v14 = height;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)setAbsoluteFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[SXComponentView setPresentationFrame:](self, "setPresentationFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  self->_absoluteFrame.origin.CGFloat x = x;
  self->_absoluteFrame.origin.CGFloat y = y;
  self->_absoluteFrame.size.CGFloat width = width;
  self->_absoluteFrame.size.CGFloat height = height;
}

- (id)classification
{
  double v2 = [(SXComponentView *)self component];
  double v3 = [v2 classification];

  return v3;
}

- (NSString)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(SXComponentView *)self component];
  double v6 = [v5 identifier];
  [(SXComponentView *)self contentFrame];
  double v7 = NSStringFromCGRect(v11);
  double v8 = [v3 stringWithFormat:@"<%@: %p; identifier: '%@', contentFrame: %@>", v4, self, v6, v7];

  return (NSString *)v8;
}

- (BOOL)userInteractable
{
  return 1;
}

- (void)assistiveTechnologyStatusDidChange
{
  id v4 = [(SXComponentView *)self component];
  double v3 = [(SXComponentView *)self componentStyle];
  [(SXComponentView *)self updateAllowHierarchyRemovalWithComponent:v4 componentStyle:v3];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)SXComponentView;
  -[SXComponentView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (SXComponentView *)objc_claimAutoreleasedReturnValue();
  if (v5 != self)
  {
    uint64_t v6 = [(SXComponentView *)self contentView];
    double v7 = v5;
    if (v5 != (SXComponentView *)v6)
    {
      double v8 = (SXComponentView *)v6;
      uint64_t v9 = [(SXComponentView *)self backgroundView];
      if (v5 != (SXComponentView *)v9)
      {
        double v10 = (void *)v9;
        CGRect v11 = [(SXComponentView *)self fillView];

        if (v5 != v11) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }

      double v7 = v8;
    }
  }
LABEL_8:

  double v5 = 0;
LABEL_9:
  return v5;
}

- (SXComponentLayout)componentLayout
{
  return self->_componentLayout;
}

- (SXComponent)component
{
  return self->_component;
}

- (SXComponentState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (SXPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  return (SXPresentationDelegate *)WeakRetained;
}

- (int64_t)visibilityState
{
  return self->_visibilityState;
}

- (int64_t)presentationState
{
  return self->_presentationState;
}

- (void)setPresentationState:(int64_t)a3
{
  self->_presentationState = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (SXFillView)fillView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fillView);
  return (SXFillView *)WeakRetained;
}

- (void)setFillView:(id)a3
{
}

- (BOOL)hasRenderedContents
{
  return self->_hasRenderedContents;
}

- (UIEdgeInsets)componentLayoutMargins
{
  double top = self->_componentLayoutMargins.top;
  double left = self->_componentLayoutMargins.left;
  double bottom = self->_componentLayoutMargins.bottom;
  double right = self->_componentLayoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setComponentLayoutMargins:(UIEdgeInsets)a3
{
  self->_componentLayoutMargins = a3;
}

- (UIEdgeInsets)borderInsets
{
  double top = self->_borderInsets.top;
  double left = self->_borderInsets.left;
  double bottom = self->_borderInsets.bottom;
  double right = self->_borderInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBorderInsets:(UIEdgeInsets)a3
{
  self->_borderInsets = a3;
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (CGRect)backgroundViewFrame
{
  double x = self->_backgroundViewFrame.origin.x;
  double y = self->_backgroundViewFrame.origin.y;
  double width = self->_backgroundViewFrame.size.width;
  double height = self->_backgroundViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBackgroundViewFrame:(CGRect)a3
{
  self->_backgroundViewFrame = a3;
}

- (BOOL)requiresThoroughFrameCalculations
{
  return self->_requiresThoroughFrameCalculations;
}

- (BOOL)isDraggable
{
  return self->_isDraggable;
}

- (BOOL)animationsAndBehaviorsEnabled
{
  return self->_animationsAndBehaviorsEnabled;
}

- (SXColumnLayout)documentColumnLayout
{
  return self->_documentColumnLayout;
}

- (void)setDocumentColumnLayout:(id)a3
{
}

- (SXUnitConverter)unitConverter
{
  return self->_unitConverter;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (SXComponentStyleRendererFactory)componentStyleRendererFactory
{
  return self->_componentStyleRendererFactory;
}

- (SXComponentStyleRenderer)componentStyleRenderer
{
  return self->_componentStyleRenderer;
}

- (SXComponentStyle)componentStyle
{
  return self->_componentStyle;
}

- (void)setComponentStyle:(id)a3
{
}

- (CGRect)originalFrame
{
  double x = self->_originalFrame.origin.x;
  double y = self->_originalFrame.origin.y;
  double width = self->_originalFrame.size.width;
  double height = self->_originalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginalFrame:(CGRect)a3
{
  self->_originalFrame = a3;
}

- (BOOL)allowViewHierarchyRemoval
{
  return self->_allowViewHierarchyRemoval;
}

- (void)setAllowViewHierarchyRemoval:(BOOL)a3
{
  self->_allowViewHierarchyRemoval = a3;
}

- (BOOL)hasAnimation
{
  return self->_hasAnimation;
}

- (void)setHasAnimation:(BOOL)a3
{
  self->_hasAnimation = a3;
}

- (BOOL)hasBehaviors
{
  return self->_hasBehaviors;
}

- (void)setHasBehaviors:(BOOL)a3
{
  self->_hasBehaviors = a3;
}

- (BOOL)hasRenderedComponentStyle
{
  return self->_hasRenderedComponentStyle;
}

- (void)setHasRenderedComponentStyle:(BOOL)a3
{
  self->_hasRenderedComponentStyle = a3;
}

- (SXComponentHosting)componentHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_componentHost);
  return (SXComponentHosting *)WeakRetained;
}

- (void)setComponentHost:(id)a3
{
}

- (unint64_t)componentIndex
{
  return self->_componentIndex;
}

- (void)setComponentIndex:(unint64_t)a3
{
  self->_componentIndedouble x = a3;
}

- (CGRect)presentationFrame
{
  double x = self->_presentationFrame.origin.x;
  double y = self->_presentationFrame.origin.y;
  double width = self->_presentationFrame.size.width;
  double height = self->_presentationFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPresentationFrame:(CGRect)a3
{
  self->_presentationFrame = a3;
}

- ($EB925890EBEBD6850280D1FB85A9BD43)presentationChanges
{
  return ($EB925890EBEBD6850280D1FB85A9BD43)(*(unsigned __int16 *)&self->_presentationChanges.size | (self->_presentationChanges.state << 16));
}

- (void)setPresentationChanges:(id)a3
{
  self->_presentationChanges = ($F5F5F7F27064974DACF8CA0609184423)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_componentHost);
  objc_storeStrong((id *)&self->_componentStyle, 0);
  objc_storeStrong((id *)&self->_componentStyleRenderer, 0);
  objc_storeStrong((id *)&self->_componentStyleRendererFactory, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_unitConverter, 0);
  objc_storeStrong((id *)&self->_documentColumnLayout, 0);
  objc_destroyWeak((id *)&self->_fillView);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_componentLayout, 0);
}

@end