@interface UIDictationPopUpView
- (BOOL)drawsOwnBackground;
- (void)layoutSubviews;
- (void)returnToKeyboard;
- (void)setState:(int)a3;
@end

@implementation UIDictationPopUpView

- (void)returnToKeyboard
{
  v3 = +[UIDictationController sharedInstance];
  int v4 = [v3 state];

  if (v4 != 1)
  {
    v5 = +[UIKeyboardDictationMenu sharedInstance];
    [v5 hide];

    [(SUICFlamesView *)self->super._flamesView removeFromSuperview];
    [(SUICFlamesView *)self->super._flamesView setDelegate:0];
    flamesView = self->super._flamesView;
    self->super._flamesView = 0;

    v7.receiver = self;
    v7.super_class = (Class)UIDictationPopUpView;
    [(UIDictationView *)&v7 returnToKeyboard];
  }
}

- (BOOL)drawsOwnBackground
{
  return 1;
}

- (void)setState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 1)
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
    [(UIView *)self addSubview:self->super._endpointButton];
    [(UIView *)self addSubview:self->super._endpointButtonLandscape];
    [(UIView *)self setNeedsLayout];
  }
  v13.receiver = self;
  v13.super_class = (Class)UIDictationPopUpView;
  [(UIDictationView *)&v13 setState:v3];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)UIDictationPopUpView;
  [(UIView *)&v6 layoutSubviews];
  [(UIView *)self size];
  double v4 = v3 * 0.5;
  [(UIView *)self size];
  -[SUICFlamesView setFrame:](self->super._flamesView, "setFrame:", 0.0, v4, v5, 100.0);
  [(SUICFlamesView *)self->super._flamesView setNeedsLayout];
}

@end