@interface SUUIScrollForwardingView
- (UIScrollView)scrollView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setScrollView:(id)a3;
@end

@implementation SUUIScrollForwardingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIScrollForwardingView;
  -[SUUIScrollForwardingView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (SUUIScrollForwardingView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    v5 = [(SUUIScrollForwardingView *)self scrollView];
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