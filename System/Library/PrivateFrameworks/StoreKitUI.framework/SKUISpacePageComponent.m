@interface SKUISpacePageComponent
- (SKUISpacePageComponent)initWithCustomPageContext:(id)a3;
- (double)height;
- (int64_t)componentType;
@end

@implementation SKUISpacePageComponent

- (SKUISpacePageComponent)initWithCustomPageContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISpacePageComponent initWithCustomPageContext:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUISpacePageComponent;
  v5 = [(SKUIPageComponent *)&v12 initWithCustomPageContext:v4];
  if (v5)
  {
    v6 = [v4 componentDictionary];
    v7 = [v6 objectForKey:@"size"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v8 = SKUISpacePageComponentHeightForString(v7);
    }
    else
    {
      char v9 = objc_opt_respondsToSelector();
      double v8 = 7.0;
      if (v9)
      {
        objc_msgSend(v7, "floatValue", 7.0);
        double v8 = v10;
      }
    }
    v5->_height = v8;
  }
  return v5;
}

- (int64_t)componentType
{
  return 14;
}

- (double)height
{
  return self->_height;
}

- (void)initWithCustomPageContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISpacePageComponent initWithCustomPageContext:]";
}

@end