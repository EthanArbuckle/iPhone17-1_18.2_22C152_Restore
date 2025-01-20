@interface SKUIDividerPageComponent
- (NSString)dividerTitle;
- (SKUIDividerPageComponent)initWithCustomPageContext:(id)a3;
- (SKUIDividerPageComponent)initWithDividerTitle:(id)a3;
- (SKUIDividerPageComponent)initWithViewElement:(id)a3;
- (int64_t)componentType;
@end

@implementation SKUIDividerPageComponent

- (SKUIDividerPageComponent)initWithCustomPageContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDividerPageComponent initWithCustomPageContext:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIDividerPageComponent;
  v5 = [(SKUIPageComponent *)&v11 initWithCustomPageContext:v4];
  if (v5)
  {
    v6 = [v4 componentDictionary];
    v7 = [v6 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v7 copy];
      title = v5->_title;
      v5->_title = (NSString *)v8;
    }
  }

  return v5;
}

- (SKUIDividerPageComponent)initWithDividerTitle:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDividerPageComponent initWithDividerTitle:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIDividerPageComponent;
  v5 = [(SKUIDividerPageComponent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    title = v5->_title;
    v5->_title = (NSString *)v6;
  }
  return v5;
}

- (SKUIDividerPageComponent)initWithViewElement:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIDividerPageComponent initWithViewElement:]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIDividerPageComponent;
  v5 = [(SKUIPageComponent *)&v7 initWithViewElement:v4];

  return v5;
}

- (int64_t)componentType
{
  return 4;
}

- (NSString)dividerTitle
{
  return self->_title;
}

- (void).cxx_destruct
{
}

- (void)initWithCustomPageContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDividerPageComponent initWithCustomPageContext:]";
}

- (void)initWithDividerTitle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDividerPageComponent initWithDividerTitle:]";
}

- (void)initWithViewElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDividerPageComponent initWithViewElement:]";
}

@end