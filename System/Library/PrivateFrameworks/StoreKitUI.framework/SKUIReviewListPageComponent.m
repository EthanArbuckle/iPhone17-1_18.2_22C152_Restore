@interface SKUIReviewListPageComponent
- (SKUIReviewListPageComponent)initWithViewElement:(id)a3;
- (int64_t)componentType;
@end

@implementation SKUIReviewListPageComponent

- (SKUIReviewListPageComponent)initWithViewElement:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReviewListPageComponent initWithViewElement:]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIReviewListPageComponent;
  v5 = [(SKUIPageComponent *)&v7 initWithViewElement:v4];

  return v5;
}

- (int64_t)componentType
{
  return 21;
}

- (void)initWithViewElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIReviewListPageComponent initWithViewElement:]";
}

@end