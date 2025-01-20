@interface SKUIProxyScrollView
- (void)didMoveToWindow;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SKUIProxyScrollView

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProxyScrollView setContentInset:]();
  }
  [(SKUIProxyScrollView *)self contentInset];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v24.receiver = self;
  v24.super_class = (Class)SKUIProxyScrollView;
  -[SKUIProxyScrollView setContentInset:](&v24, sel_setContentInset_, top, left, bottom, right);
  [(SKUIProxyScrollView *)self contentInset];
  if (v19 != v11 || v16 != v9 || v18 != v15 || v17 != v13)
  {
    v23 = [(SKUIProxyScrollView *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v23 scrollViewDidChangeContentInset:self];
    }
  }
}

- (void)didMoveToWindow
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProxyScrollView didMoveToWindow]";
}

- (void)setContentInset:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProxyScrollView setContentInset:]";
}

@end