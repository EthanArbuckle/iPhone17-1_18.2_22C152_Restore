@interface SKUIScrollForwardingView
- (UIScrollView)scrollView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setScrollView:(id)a3;
@end

@implementation SKUIScrollForwardingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIScrollForwardingView hitTest:withEvent:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIScrollForwardingView;
  -[SKUIScrollForwardingView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  v8 = (SKUIScrollForwardingView *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    v8 = [(SKUIScrollForwardingView *)self scrollView];
  }

  return v8;
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

- (void)hitTest:withEvent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIScrollForwardingView hitTest:withEvent:]";
}

@end