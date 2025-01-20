@interface SKUIQuicklinksPageComponent
- (NSArray)links;
- (NSString)title;
- (SKUIQuicklinksPageComponent)initWithCustomPageContext:(id)a3;
- (SKUIQuicklinksPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4;
- (id)metricsElementName;
- (id)valueForMetricsField:(id)a3;
- (int64_t)componentType;
- (void)_setLinksWithLinksArray:(id)a3 context:(id)a4;
@end

@implementation SKUIQuicklinksPageComponent

- (SKUIQuicklinksPageComponent)initWithCustomPageContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIQuicklinksPageComponent initWithCustomPageContext:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIQuicklinksPageComponent;
  v5 = [(SKUIPageComponent *)&v12 initWithCustomPageContext:v4];
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
    v10 = [v6 objectForKey:@"children"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SKUIQuicklinksPageComponent *)v5 _setLinksWithLinksArray:v10 context:v4];
    }
  }
  return v5;
}

- (SKUIQuicklinksPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIQuicklinksPageComponent initWithFeaturedContentContext:kind:]();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIQuicklinksPageComponent;
  v7 = [(SKUIPageComponent *)&v17 initWithFeaturedContentContext:v6 kind:a4];
  if (v7)
  {
    uint64_t v8 = [v6 componentDictionary];
    v9 = [v8 objectForKey:@"children"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 count])
    {
      v10 = [v9 objectAtIndex:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;

        uint64_t v8 = v11;
      }
    }
    objc_super v12 = [v8 objectForKey:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 copy];
      title = v7->_title;
      v7->_title = (NSString *)v13;
    }
    v15 = [v8 objectForKey:@"links"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SKUIQuicklinksPageComponent *)v7 _setLinksWithLinksArray:v15 context:v6];
    }
  }
  return v7;
}

- (int64_t)componentType
{
  return 12;
}

- (id)metricsElementName
{
  return @"quicklink";
}

- (id)valueForMetricsField:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:*MEMORY[0x1E4FA88A0]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x1E4FA88A8]] & 1) != 0)
  {
    v5 = [(SKUIQuicklinksPageComponent *)self title];
    if (v5) {
      goto LABEL_8;
    }
  }
  else if ([v4 isEqualToString:*MEMORY[0x1E4FA8898]])
  {
    v5 = &unk_1F1D61FD0;
    goto LABEL_8;
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIQuicklinksPageComponent;
  v5 = [(SKUIPageComponent *)&v7 valueForMetricsField:v4];
LABEL_8:

  return v5;
}

- (void)_setLinksWithLinksArray:(id)a3 context:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v14 = (void *)[v6 copy];
          [v14 setComponentDictionary:v13];
          v15 = [[SKUILink alloc] initWithComponentContext:v14];
          if (v15) {
            [v7 addObject:v15];
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  v16 = (NSArray *)[v7 copy];
  links = self->_links;
  self->_links = v16;
}

- (NSArray)links
{
  return self->_links;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_links, 0);
}

- (void)initWithCustomPageContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIQuicklinksPageComponent initWithCustomPageContext:]";
}

- (void)initWithFeaturedContentContext:kind:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIQuicklinksPageComponent initWithFeaturedContentContext:kind:]";
}

@end