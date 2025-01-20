@interface SUUIQuicklinksPageComponent
- (NSArray)links;
- (NSString)title;
- (SUUIQuicklinksPageComponent)initWithCustomPageContext:(id)a3;
- (SUUIQuicklinksPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4;
- (id)metricsElementName;
- (id)valueForMetricsField:(id)a3;
- (int64_t)componentType;
- (void)_setLinksWithLinksArray:(id)a3 context:(id)a4;
@end

@implementation SUUIQuicklinksPageComponent

- (SUUIQuicklinksPageComponent)initWithCustomPageContext:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIQuicklinksPageComponent;
  v5 = [(SUUIPageComponent *)&v12 initWithCustomPageContext:v4];
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
      [(SUUIQuicklinksPageComponent *)v5 _setLinksWithLinksArray:v10 context:v4];
    }
  }
  return v5;
}

- (SUUIQuicklinksPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUUIQuicklinksPageComponent;
  v7 = [(SUUIPageComponent *)&v17 initWithFeaturedContentContext:v6 kind:a4];
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
      [(SUUIQuicklinksPageComponent *)v7 _setLinksWithLinksArray:v15 context:v6];
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
  if (([v4 isEqualToString:*MEMORY[0x263F7BB78]] & 1) != 0
    || ([v4 isEqualToString:*MEMORY[0x263F7BB80]] & 1) != 0)
  {
    v5 = [(SUUIQuicklinksPageComponent *)self title];
    if (v5) {
      goto LABEL_8;
    }
  }
  else if ([v4 isEqualToString:*MEMORY[0x263F7BB70]])
  {
    v5 = &unk_2705D0D48;
    goto LABEL_8;
  }
  v7.receiver = self;
  v7.super_class = (Class)SUUIQuicklinksPageComponent;
  v5 = [(SUUIPageComponent *)&v7 valueForMetricsField:v4];
LABEL_8:

  return v5;
}

- (void)_setLinksWithLinksArray:(id)a3 context:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
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
          v15 = [[SUUILink alloc] initWithComponentContext:v14];
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

@end