@interface UIWebScrollView
- (BOOL)touchesShouldCancelInContentView:(id)a3;
- (UIWebScrollView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
@end

@implementation UIWebScrollView

- (UIWebScrollView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIWebScrollView;
  v3 = -[UIScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIScrollView *)v3 setDirectionalLockEnabled:1];
    [(UIScrollView *)v4 setAlwaysBounceVertical:1];
  }
  return v4;
}

- (BOOL)touchesShouldCancelInContentView:(id)a3
{
  return 1;
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)UIWebScrollView;
  [(UIView *)&v6 didMoveToWindow];
  v3 = [(UIView *)self window];
  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    v3 = objc_loadWeakRetained(&self->super._delegate);
    [v3 performSelector:sel_scrollViewWasRemoved_ withObject:self];
  }
}

@end