@interface SKUILoadingTemplateViewElement
- (SKUIActivityIndicatorViewElement)activityIndicator;
- (void)activityIndicator;
@end

@implementation SKUILoadingTemplateViewElement

- (SKUIActivityIndicatorViewElement)activityIndicator
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILoadingTemplateViewElement activityIndicator]();
  }
  v3 = [(SKUIViewElement *)self firstChildForElementType:4];

  return (SKUIActivityIndicatorViewElement *)v3;
}

- (void)activityIndicator
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILoadingTemplateViewElement activityIndicator]";
}

@end