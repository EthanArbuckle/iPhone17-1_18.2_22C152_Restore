@interface SKUIGalleryPageComponent
- (BOOL)hidesPageIndicator;
- (NSArray)childComponents;
- (SKUIGalleryPageComponent)initWithCustomPageContext:(id)a3;
- (double)cycleInterval;
- (id)metricsElementName;
- (int64_t)componentType;
- (void)setCycleInterval:(double)a3;
- (void)setHidesPageIndicator:(BOOL)a3;
@end

@implementation SKUIGalleryPageComponent

- (SKUIGalleryPageComponent)initWithCustomPageContext:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGalleryPageComponent initWithCustomPageContext:]();
  }
  v31.receiver = self;
  v31.super_class = (Class)SKUIGalleryPageComponent;
  v5 = [(SKUIPageComponent *)&v31 initWithCustomPageContext:v4];
  if (v5)
  {
    v6 = [v4 componentDictionary];
    v7 = [v6 objectForKey:@"cycleInterval"];
    if (objc_opt_respondsToSelector())
    {
      [v7 floatValue];
      v5->_cycleInterval = v8;
    }
    v9 = [v6 objectForKey:@"hidesPageIndicator"];

    if (objc_opt_respondsToSelector()) {
      v5->_hidesPageIndicator = [v9 BOOLValue];
    }
    v10 = [v6 objectForKey:@"children"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = v9;
      v25 = v6;
      v11 = (void *)[v4 copy];
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      v23 = v10;
      id v12 = v10;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v18 = [v17 objectForKey:@"type"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && SKUIPageComponentTypeForBlockType(v18) == 10)
              {
                [v11 setComponentDictionary:v17];
                v19 = (void *)[objc_alloc((Class)SKUIPageComponentClassForComponentType(10)) initWithCustomPageContext:v11];
                if (v19) {
                  [v26 addObject:v19];
                }
              }
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v14);
      }

      uint64_t v20 = [v26 copy];
      childComponents = v5->_childComponents;
      v5->_childComponents = (NSArray *)v20;

      v9 = v24;
      v6 = v25;
      v10 = v23;
    }
  }
  return v5;
}

- (int64_t)componentType
{
  return 7;
}

- (id)metricsElementName
{
  return @"gallery";
}

- (NSArray)childComponents
{
  return self->_childComponents;
}

- (double)cycleInterval
{
  return self->_cycleInterval;
}

- (void)setCycleInterval:(double)a3
{
  self->_cycleInterval = a3;
}

- (BOOL)hidesPageIndicator
{
  return self->_hidesPageIndicator;
}

- (void)setHidesPageIndicator:(BOOL)a3
{
  self->_hidesPageIndicator = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithCustomPageContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGalleryPageComponent initWithCustomPageContext:]";
}

@end