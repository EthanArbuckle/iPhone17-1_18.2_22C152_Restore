@interface SKUIMenuBarNavigationBarController
- (UIView)titleView;
- (id)fallbackTitleView;
- (void)fallbackTitleView;
- (void)setTitleView:(id)a3;
@end

@implementation SKUIMenuBarNavigationBarController

- (id)fallbackTitleView
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMenuBarNavigationBarController fallbackTitleView]();
  }
  titleView = self->_titleView;

  return titleView;
}

- (UIView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)fallbackTitleView
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIMenuBarNavigationBarController fallbackTitleView]";
}

@end