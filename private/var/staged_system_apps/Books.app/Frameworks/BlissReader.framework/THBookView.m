@interface THBookView
- (THBookView)initWithFrame:(CGRect)a3 expandedLayout:(BOOL)a4;
- (THBookViewDelegate)bookDelegate;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)insertSubviewAtBack:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBookDelegate:(id)a3;
@end

@implementation THBookView

- (THBookView)initWithFrame:(CGRect)a3 expandedLayout:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)THBookView;
  result = -[THBookView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->mExpandedLayout = a4;
  }
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THBookView;
  -[THBookView setBackgroundColor:](&v6, "setBackgroundColor:");
  effectView = self->_effectView;
  if (a3)
  {
    if (effectView)
    {
      [(UIVisualEffectView *)effectView removeFromSuperview];

      self->_effectView = 0;
    }
  }
  else if (!effectView)
  {
    self->_effectView = [objc_alloc((Class)UIVisualEffectView) initWithEffect:+[_UIBlurThroughEffect _blurThroughWithStyle:](_UIBlurThroughEffect, "_blurThroughWithStyle:", 1)];
    [(THBookView *)self bounds];
    -[UIVisualEffectView setFrame:](self->_effectView, "setFrame:");
    [(UIVisualEffectView *)self->_effectView setAutoresizingMask:18];
    [(THBookView *)self insertSubview:self->_effectView atIndex:0];
  }
}

- (void)insertSubviewAtBack:(id)a3
{
  if (self->_effectView) {
    -[THBookView insertSubview:above:](self, "insertSubview:above:", a3);
  }
  else {
    -[THBookView insertSubview:atIndex:](self, "insertSubview:atIndex:", a3);
  }
}

- (void)dealloc
{
  [(THBookView *)self setBookDelegate:0];

  self->_effectView = 0;
  v3.receiver = self;
  v3.super_class = (Class)THBookView;
  [(THBookView *)&v3 dealloc];
}

- (void)didMoveToWindow
{
  id v3 = [(THBookView *)self window];
  if (v3)
  {
    id v4 = +[TSKKeyboardMonitor sharedKeyboardMonitor];
    if (![v4 rootWindow]) {
      [v4 setRootWindow:v3];
    }
  }
  v5 = [(THBookView *)self bookDelegate];

  [(THBookViewDelegate *)v5 bookView:self didMoveToWindow:v3];
}

- (THBookViewDelegate)bookDelegate
{
  return self->_bookDelegate;
}

- (void)setBookDelegate:(id)a3
{
  self->_bookDelegate = (THBookViewDelegate *)a3;
}

@end