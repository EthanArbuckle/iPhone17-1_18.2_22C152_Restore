@interface SXTextComponentView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)userInteractable;
- (CGRect)absoluteTextViewFrame;
- (CGSize)calculatedSize;
- (SXTangierController)tangierController;
- (SXTextComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 tangierController:(id)a7;
- (SXTextView)textView;
- (id)accessibilityContextualLabelForTextView:(id)a3;
- (id)accessibilityCustomRotorMembershipForTextView:(id)a3;
- (id)componentIdentifierForTextView:(id)a3;
- (id)textRulesForTextView:(id)a3;
- (id)textSource;
- (void)animationDidFinish:(id)a3;
- (void)animationDidStart:(id)a3;
- (void)didApplyBehavior:(id)a3;
- (void)didMoveToWindow;
- (void)presentComponentWithChanges:(id)a3;
- (void)provideInfosLayoutTo:(id)a3;
- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4;
- (void)setAbsoluteFrame:(CGRect)a3;
- (void)setCalculatedSize:(CGSize)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPresentationFrame:(CGRect)a3;
- (void)setTextView:(id)a3;
- (void)setupTextView;
@end

@implementation SXTextComponentView

- (SXTextComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 tangierController:(id)a7
{
  id v12 = a7;
  v16.receiver = self;
  v16.super_class = (Class)SXTextComponentView;
  v13 = [(SXComponentView *)&v16 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegate:a5 componentStyleRendererFactory:a6];
  v14 = v13;
  if (v13) {
    objc_storeWeak((id *)&v13->_tangierController, v12);
  }

  return v14;
}

- (void)presentComponentWithChanges:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SXTextComponentView;
  [(SXComponentView *)&v12 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  [(SXTextComponentView *)self setupTextView];
  v4 = [(SXTextComponentView *)self textView];
  [(SXComponentView *)self contentFrame];
  objc_msgSend(v4, "setFrame:");

  v5 = [(SXTextComponentView *)self textView];
  [(SXTextComponentView *)self absoluteTextViewFrame];
  objc_msgSend(v5, "setFrameInCanvas:");

  v6 = [(SXTextComponentView *)self textView];
  [(SXTextComponentView *)self frame];
  objc_msgSend(v6, "setParentFrame:");

  v7 = [(SXTextComponentView *)self textView];
  [v7 invalidate];

  v8 = [(SXTextComponentView *)self textView];
  v9 = [v8 superview];

  if (!v9)
  {
    v10 = [(SXComponentView *)self contentView];
    v11 = [(SXTextComponentView *)self textView];
    [v10 addSubview:v11];
  }
}

- (void)didMoveToWindow
{
  v16.receiver = self;
  v16.super_class = (Class)SXTextComponentView;
  [(SXComponentView *)&v16 didMoveToWindow];
  v3 = [(SXTextComponentView *)self window];

  v4 = [(SXTextComponentView *)self textView];
  v5 = v4;
  if (!v3)
  {

    if (!v5) {
      return;
    }
    v13 = [(SXComponentView *)self presentationDelegate];
    v14 = [v13 tangierController];
    v15 = [(SXTextComponentView *)self textView];
    [v14 didStopPresentingTextView:v15];
    goto LABEL_8;
  }
  v6 = [v4 rep];
  int v7 = [v6 updateFromVisualPosition];

  if (v7)
  {
    v8 = [(SXTextComponentView *)self textView];
    v9 = [v8 rep];
    v10 = [v9 icc];
    [v10 invalidateLayers];
  }
  v11 = [(SXTextComponentView *)self textView];

  if (v11)
  {
    objc_super v12 = [(SXTextComponentView *)self textView];
    [(SXTextComponentView *)self absoluteTextViewFrame];
    objc_msgSend(v12, "setFrameInCanvas:");

    v13 = [(SXComponentView *)self presentationDelegate];
    v14 = [v13 tangierController];
    v15 = [(SXTextComponentView *)self textView];
    [v14 didStartPresentingTextView:v15];
LABEL_8:
  }
}

- (void)setAbsoluteFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXTextComponentView;
  -[SXComponentView setAbsoluteFrame:](&v5, sel_setAbsoluteFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [(SXTextComponentView *)self textView];
  [(SXTextComponentView *)self absoluteTextViewFrame];
  objc_msgSend(v4, "setFrameInCanvas:");
}

- (void)setPresentationFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXTextComponentView;
  -[SXComponentView setPresentationFrame:](&v5, sel_setPresentationFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [(SXTextComponentView *)self textView];
  [(SXTextComponentView *)self absoluteTextViewFrame];
  objc_msgSend(v4, "setFrameInCanvas:");
}

- (void)setupTextView
{
  v3 = [(SXTextComponentView *)self textView];

  if (!v3)
  {
    v4 = objc_alloc_init(SXTextView);
    textView = self->_textView;
    self->_textView = v4;

    v6 = self->_textView;
    [(SXTextComponentView *)self absoluteTextViewFrame];
    -[SXTextView setFrameInCanvas:](v6, "setFrameInCanvas:");
    [(SXTextView *)self->_textView setDelegate:self];
    int v7 = [(SXComponentView *)self component];
    v8 = [v7 classification];
    v9 = [v8 textRules];
    -[SXTextView setIsSelectable:](self->_textView, "setIsSelectable:", [v9 isSelectable]);

    id v12 = [(SXComponentView *)self presentationDelegate];
    v10 = [v12 tangierController];
    v11 = [(SXTextComponentView *)self textView];
    [v10 didStartPresentingTextView:v11];
  }
}

- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SXTextComponentView;
  id v7 = a4;
  [(SXComponentView *)&v10 receivedInfo:v6 fromLayoutingPhaseWithIdentifier:v7];
  int v8 = objc_msgSend(v7, "isEqualToString:", @"TextLayouter", v10.receiver, v10.super_class);

  if (v8)
  {
    [(SXTextComponentView *)self setupTextView];
    v9 = [(SXTextComponentView *)self textView];
    [v9 setTextLayouter:v6];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v39 = *MEMORY[0x263EF8340];
  v37.receiver = self;
  v37.super_class = (Class)SXTextComponentView;
  BOOL v7 = -[SXTextComponentView pointInside:withEvent:](&v37, sel_pointInside_withEvent_, a4);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  int v8 = [(SXTextComponentView *)self textView];
  v9 = [v8 textLayouter];
  objc_super v10 = [v9 exclusionPaths];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(double **)(*((void *)&v33 + 1) + 8 * i);
        objc_super v16 = -[SXTextExclusionPath path](v15);
        [v16 bounds];
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        double v25 = -[SXTextExclusionPath actualPosition]((uint64_t)v15);
        -[SXTextExclusionPath actualPosition]((uint64_t)v15);
        CGFloat v27 = v26;
        v41.origin.CGFloat x = v18;
        v41.origin.CGFloat y = v20;
        v41.size.CGFloat width = v22;
        v41.size.CGFloat height = v24;
        CGRect v42 = CGRectOffset(v41, v25, v27);
        CGFloat v28 = v42.origin.x;
        CGFloat v29 = v42.origin.y;
        CGFloat width = v42.size.width;
        CGFloat height = v42.size.height;

        v43.origin.CGFloat x = v28;
        v43.origin.CGFloat y = v29;
        v43.size.CGFloat width = width;
        v43.size.CGFloat height = height;
        v40.CGFloat x = x;
        v40.CGFloat y = y;
        if (CGRectContainsPoint(v43, v40))
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (CGRect)absoluteTextViewFrame
{
  [(SXComponentView *)self absoluteFrame];
  double MinX = CGRectGetMinX(v17);
  v4 = [(SXComponentView *)self contentView];
  [v4 frame];
  double v5 = MinX + CGRectGetMinX(v18);
  [(SXComponentView *)self contentFrame];
  double v6 = v5 + CGRectGetMinX(v19);
  [(SXComponentView *)self absoluteFrame];
  double MinY = CGRectGetMinY(v20);
  int v8 = [(SXComponentView *)self contentView];
  [v8 frame];
  double v9 = MinY + CGRectGetMinY(v21);
  [(SXComponentView *)self contentFrame];
  double v10 = v9 + CGRectGetMinY(v22);
  [(SXComponentView *)self contentFrame];
  CGFloat Width = CGRectGetWidth(v23);
  [(SXComponentView *)self contentFrame];
  CGFloat Height = CGRectGetHeight(v24);

  double v13 = v6;
  double v14 = v10;
  double v15 = Width;
  double v16 = Height;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (id)textSource
{
  v2 = [(SXTextComponentView *)self textView];
  v3 = [v2 textSource];

  return v3;
}

- (void)animationDidStart:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXTextComponentView;
  [(SXComponentView *)&v5 animationDidStart:a3];
  v4 = [(SXTextComponentView *)self textView];
  [v4 setMightBeVisuallyMisplaced:1];
}

- (void)animationDidFinish:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXTextComponentView;
  [(SXComponentView *)&v5 animationDidFinish:a3];
  v4 = [(SXTextComponentView *)self textView];
  [v4 setMightBeVisuallyMisplaced:0];
}

- (void)didApplyBehavior:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SXTextComponentView;
  -[SXComponentView didApplyBehavior:](&v6, sel_didApplyBehavior_);
  objc_super v5 = [(SXTextComponentView *)self textView];
  [v5 setMightBeVisuallyMisplaced:a3 != 0];
}

- (BOOL)userInteractable
{
  return 0;
}

- (id)componentIdentifierForTextView:(id)a3
{
  v3 = [(SXComponentView *)self component];
  v4 = [v3 identifier];

  return v4;
}

- (id)textRulesForTextView:(id)a3
{
  v3 = [(SXComponentView *)self component];
  v4 = [v3 classification];
  objc_super v5 = [v4 textRules];

  return v5;
}

- (id)accessibilityCustomRotorMembershipForTextView:(id)a3
{
  v3 = [(SXComponentView *)self component];
  v4 = [v3 classification];
  objc_super v5 = [v4 accessibilityCustomRotorMembership];

  return v5;
}

- (id)accessibilityContextualLabelForTextView:(id)a3
{
  v3 = [(SXComponentView *)self component];
  v4 = [v3 classification];
  objc_super v5 = [v4 accessibilityContextualLabel];

  return v5;
}

- (void)provideInfosLayoutTo:(id)a3
{
  id v4 = a3;
  id v5 = [(SXTextComponentView *)self textView];
  [v5 provideInfosLayoutTo:v4];
}

- (void)setHighlighted:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXTextComponentView;
  [(SXComponentView *)&v5 setHighlighted:a3];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__SXTextComponentView_setHighlighted___block_invoke;
  v4[3] = &unk_2646511F8;
  v4[4] = self;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v4];
}

void __38__SXTextComponentView_setHighlighted___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) highlightView];
  v3 = [v2 layer];
  [v3 setCornerRadius:5.0];

  id v5 = [*(id *)(a1 + 32) highlightView];
  id v4 = [*(id *)(a1 + 32) highlightView];
  [v4 frame];
  CGRect v8 = CGRectInset(v7, -10.0, -10.0);
  objc_msgSend(v5, "setFrame:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
}

- (SXTangierController)tangierController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tangierController);
  return (SXTangierController *)WeakRetained;
}

- (SXTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (CGSize)calculatedSize
{
  double width = self->_calculatedSize.width;
  double height = self->_calculatedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCalculatedSize:(CGSize)a3
{
  self->_calculatedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_destroyWeak((id *)&self->_tangierController);
}

@end