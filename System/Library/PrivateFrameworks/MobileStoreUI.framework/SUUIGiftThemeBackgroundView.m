@interface SUUIGiftThemeBackgroundView
- (UIScrollView)scrollView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setScrollView:(id)a3;
@end

@implementation SUUIGiftThemeBackgroundView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIGiftThemeBackgroundView;
  -[SUUIGiftThemeBackgroundView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UIScrollView *)objc_claimAutoreleasedReturnValue();
  if (v5 == (UIScrollView *)self)
  {
    v5 = self->_scrollView;
  }

  return v5;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end