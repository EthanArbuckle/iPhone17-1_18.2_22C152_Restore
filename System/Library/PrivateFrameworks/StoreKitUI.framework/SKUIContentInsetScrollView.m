@interface SKUIContentInsetScrollView
- (void)setScrollIndicatorInsets:(UIEdgeInsets)a3;
@end

@implementation SKUIContentInsetScrollView

- (void)setScrollIndicatorInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIContentInsetScrollView setScrollIndicatorInsets:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIContentInsetScrollView;
  -[SKUIContentInsetScrollView setScrollIndicatorInsets:](&v9, sel_setScrollIndicatorInsets_, top, left, bottom, right);
  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"SKUIScrollViewContentInsetDidChangeNotification" object:self];
}

- (void)setScrollIndicatorInsets:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIContentInsetScrollView setScrollIndicatorInsets:]";
}

@end