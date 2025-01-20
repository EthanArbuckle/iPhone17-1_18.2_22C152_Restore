@interface UIDictationATVLinearView
- (BOOL)drawsOwnBackground;
- (BOOL)isShowing;
- (void)_applyRenderConfig:(id)a3;
- (void)layoutSubviews;
- (void)removeFromSuperview;
- (void)returnToKeyboard;
- (void)setRenderConfig:(id)a3;
- (void)setState:(int)a3;
@end

@implementation UIDictationATVLinearView

- (void)setRenderConfig:(id)a3
{
  v5 = (UIKBRenderConfig *)a3;
  if (self->_renderConfig != v5)
  {
    objc_storeStrong((id *)&self->_renderConfig, a3);
    [(UIDictationATVLinearView *)self _applyRenderConfig:v5];
  }
}

- (void)_applyRenderConfig:(id)a3
{
  id v4 = a3;
  if ([v4 lightKeyboard]) {
    double v5 = 0.4;
  }
  else {
    double v5 = 0.5;
  }
  char v6 = [v4 lightKeyboard];

  if (v6) {
    +[UIColor blackColor];
  }
  else {
  id v7 = +[UIColor whiteColor];
  }
  if (objc_opt_respondsToSelector())
  {
    [(SUICFlamesView *)self->super._flamesView setDictationColor:v7];
    [(SUICFlamesView *)self->super._flamesView setAlpha:v5];
  }
}

- (BOOL)drawsOwnBackground
{
  return 1;
}

- (void)setState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 2)
  {
    [(SUICFlamesView *)self->super._flamesView setState:1];
  }
  else if (a3 == 1)
  {
    [(UIView *)self bounds];
    double v6 = v5;
    SUICFlamesViewClass = (objc_class *)getSUICFlamesViewClass();
    flamesView = self->super._flamesView;
    if (flamesView)
    {
      -[SUICFlamesView setFrame:](flamesView, "setFrame:", 0.0, 0.0, v6, 100.0);
    }
    else
    {
      id v9 = [SUICFlamesViewClass alloc];
      v10 = +[UIScreen mainScreen];
      v11 = (SUICFlamesView *)objc_msgSend(v9, "initWithFrame:screen:fidelity:", v10, 2, 0.0, 0.0, v6, 100.0);
      v12 = self->super._flamesView;
      self->super._flamesView = v11;
    }
    [(SUICFlamesView *)self->super._flamesView setDelegate:self];
    [(SUICFlamesView *)self->super._flamesView setMode:1];
    [(SUICFlamesView *)self->super._flamesView setState:1];
    [(SUICFlamesView *)self->super._flamesView setNeedsLayout];
    [(UIView *)self addSubview:self->super._flamesView];
    if (self->_renderConfig) {
      -[UIDictationATVLinearView _applyRenderConfig:](self, "_applyRenderConfig:");
    }
    [(UIView *)self setNeedsLayout];
  }
  v13.receiver = self;
  v13.super_class = (Class)UIDictationATVLinearView;
  [(UIDictationView *)&v13 setState:v3];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)UIDictationATVLinearView;
  [(UIView *)&v14 layoutSubviews];
  [(UIView *)self size];
  double v4 = v3;
  [(UIView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(UIView *)self contentScaleFactor];
  [(SUICFlamesView *)self->super._flamesView setFrame:UIRectCenteredIntegralRectScale(0.0, 0.0, v4, 100.0, v6, v8, v10, v12, v13)];
  [(SUICFlamesView *)self->super._flamesView setNeedsLayout];
}

- (void)removeFromSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)UIDictationATVLinearView;
  [(UIView *)&v4 removeFromSuperview];
  [(SUICFlamesView *)self->super._flamesView removeFromSuperview];
  [(SUICFlamesView *)self->super._flamesView setDelegate:0];
  flamesView = self->super._flamesView;
  self->super._flamesView = 0;
}

- (void)returnToKeyboard
{
  double v3 = +[UIDictationController sharedInstance];
  int v4 = [v3 state];

  if (v4 != 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIDictationATVLinearView;
    [(UIDictationView *)&v5 returnToKeyboard];
  }
}

- (BOOL)isShowing
{
  v2 = [(UIView *)self superview];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void).cxx_destruct
{
}

@end