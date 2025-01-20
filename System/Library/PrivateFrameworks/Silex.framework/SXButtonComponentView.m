@interface SXButtonComponentView
- (BOOL)accessibilityActivate;
- (CGRect)absoluteTextViewFrame;
- (CGRect)typographicBounds;
- (SXButtonComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6;
- (SXTextView)textView;
- (id)accessibilityContextualLabelForTextView:(id)a3;
- (id)accessibilityCustomRotorMembershipForTextView:(id)a3;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (id)componentIdentifierForTextView:(id)a3;
- (id)textRulesForTextView:(id)a3;
- (void)didMoveToSuperview;
- (void)presentComponentWithChanges:(id)a3;
- (void)provideInfosLayoutTo:(id)a3;
- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4;
- (void)setAbsoluteFrame:(CGRect)a3;
- (void)setPresentationFrame:(CGRect)a3;
- (void)setTypographicBounds:(CGRect)a3;
@end

@implementation SXButtonComponentView

- (SXButtonComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)SXButtonComponentView;
  v6 = [(SXComponentView *)&v11 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegate:a5 componentStyleRendererFactory:a6];
  if (v6)
  {
    v7 = objc_alloc_init(SXTextView);
    textView = v6->_textView;
    v6->_textView = v7;

    [(SXTextView *)v6->_textView setDelegate:v6];
    v9 = [(SXComponentView *)v6 contentView];
    [v9 addSubview:v6->_textView];

    [(SXButtonComponentView *)v6 setIsAccessibilityElement:1];
    [(SXButtonComponentView *)v6 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  }
  return v6;
}

- (id)accessibilityLabel
{
  v2 = [(SXButtonComponentView *)self textView];
  v3 = [v2 rep];
  v4 = [v3 accessibilityLabel];

  return v4;
}

- (id)accessibilityValue
{
  v2 = [(SXButtonComponentView *)self textView];
  v3 = [v2 rep];
  v4 = [v3 accessibilityValue];

  return v4;
}

- (id)accessibilityUserInputLabels
{
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  v9.receiver = self;
  v9.super_class = (Class)SXButtonComponentView;
  v4 = [(SXButtonComponentView *)&v9 accessibilityUserInputLabels];
  v5 = (void *)[v3 initWithArray:v4];

  v6 = [(SXButtonComponentView *)self accessibilityLabel];
  if (v6) {
    [v5 addObject:v6];
  }
  v7 = [(SXButtonComponentView *)self accessibilityValue];
  if (v7) {
    [v5 addObject:v7];
  }

  return v5;
}

- (BOOL)accessibilityActivate
{
  id v3 = [(SXComponentView *)self presentationDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(SXComponentView *)self presentationDelegate];
    char v6 = [v5 accessibilityShouldHandleInteractionForView:self];

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SXButtonComponentView;
    return [(SXButtonComponentView *)&v8 accessibilityActivate];
  }
}

- (id)accessibilityHint
{
  v2 = [(SXButtonComponentView *)self textView];
  id v3 = [v2 accessibilityHint];

  return v3;
}

- (void)presentComponentWithChanges:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SXButtonComponentView;
  [(SXComponentView *)&v16 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  char v4 = [(SXButtonComponentView *)self textView];
  [(SXComponentView *)self contentFrame];
  double v6 = v5;
  [(SXComponentView *)self contentFrame];
  double v8 = v7;
  [(SXButtonComponentView *)self typographicBounds];
  double v10 = v8 - v9;
  [(SXComponentView *)self contentFrame];
  double v12 = v11;
  [(SXComponentView *)self contentFrame];
  objc_msgSend(v4, "setFrame:", v6, v10, v12);

  v13 = [(SXButtonComponentView *)self textView];
  [(SXButtonComponentView *)self absoluteTextViewFrame];
  objc_msgSend(v13, "setFrameInCanvas:");

  v14 = [(SXButtonComponentView *)self textView];
  [(SXComponentView *)self absoluteFrame];
  objc_msgSend(v14, "setParentFrame:");

  v15 = [(SXButtonComponentView *)self textView];
  [v15 invalidate];
}

- (void)didMoveToSuperview
{
  v7.receiver = self;
  v7.super_class = (Class)SXButtonComponentView;
  [(SXButtonComponentView *)&v7 didMoveToSuperview];
  id v3 = [(SXButtonComponentView *)self superview];

  char v4 = [(SXComponentView *)self presentationDelegate];
  double v5 = [v4 tangierController];
  double v6 = [(SXButtonComponentView *)self textView];
  if (v3) {
    [v5 didStartPresentingTextView:v6];
  }
  else {
    [v5 didStopPresentingTextView:v6];
  }
}

- (void)setAbsoluteFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXButtonComponentView;
  -[SXComponentView setAbsoluteFrame:](&v5, sel_setAbsoluteFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  char v4 = [(SXButtonComponentView *)self textView];
  [(SXButtonComponentView *)self absoluteTextViewFrame];
  objc_msgSend(v4, "setFrameInCanvas:");
}

- (void)setPresentationFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SXButtonComponentView;
  -[SXComponentView setPresentationFrame:](&v5, sel_setPresentationFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  char v4 = [(SXButtonComponentView *)self textView];
  [(SXButtonComponentView *)self absoluteTextViewFrame];
  objc_msgSend(v4, "setFrameInCanvas:");
}

- (void)receivedInfo:(id)a3 fromLayoutingPhaseWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SXButtonComponentView;
  [(SXComponentView *)&v9 receivedInfo:v6 fromLayoutingPhaseWithIdentifier:v7];
  if ([v7 isEqualToString:@"TextLayouter"])
  {
    double v8 = [(SXButtonComponentView *)self textView];
    [v8 setTextLayouter:v6];
  }
  else if ([v7 isEqualToString:@"TypographicBounds"])
  {
    [v6 CGRectValue];
    -[SXButtonComponentView setTypographicBounds:](self, "setTypographicBounds:");
  }
}

- (void)provideInfosLayoutTo:(id)a3
{
  id v4 = a3;
  id v5 = [(SXButtonComponentView *)self textView];
  [v5 provideInfosLayoutTo:v4];
}

- (id)componentIdentifierForTextView:(id)a3
{
  id v3 = [(SXComponentView *)self component];
  id v4 = [v3 identifier];

  return v4;
}

- (id)textRulesForTextView:(id)a3
{
  id v3 = [(SXComponentView *)self component];
  id v4 = [v3 classification];
  id v5 = [v4 textRules];

  return v5;
}

- (id)accessibilityCustomRotorMembershipForTextView:(id)a3
{
  id v3 = [(SXComponentView *)self component];
  id v4 = [v3 classification];
  id v5 = [v4 accessibilityCustomRotorMembership];

  return v5;
}

- (id)accessibilityContextualLabelForTextView:(id)a3
{
  id v3 = [(SXComponentView *)self component];
  id v4 = [v3 classification];
  id v5 = [v4 accessibilityContextualLabel];

  return v5;
}

- (CGRect)absoluteTextViewFrame
{
  [(SXComponentView *)self absoluteFrame];
  double MinX = CGRectGetMinX(v17);
  id v4 = [(SXComponentView *)self contentView];
  [v4 frame];
  double v5 = MinX + CGRectGetMinX(v18);
  [(SXComponentView *)self contentFrame];
  double v6 = v5 + CGRectGetMinX(v19);
  [(SXComponentView *)self absoluteFrame];
  double MinY = CGRectGetMinY(v20);
  double v8 = [(SXComponentView *)self contentView];
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
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (SXTextView)textView
{
  return self->_textView;
}

- (CGRect)typographicBounds
{
  double x = self->_typographicBounds.origin.x;
  double y = self->_typographicBounds.origin.y;
  double width = self->_typographicBounds.size.width;
  double height = self->_typographicBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTypographicBounds:(CGRect)a3
{
  self->_typographicBounds = a3;
}

- (void).cxx_destruct
{
}

@end