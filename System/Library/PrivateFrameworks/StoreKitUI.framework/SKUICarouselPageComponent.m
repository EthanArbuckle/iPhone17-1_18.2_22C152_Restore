@interface SKUICarouselPageComponent
- (BOOL)isMissingItemData;
- (NSArray)carouselItems;
- (SKUICarouselPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4;
- (SKUICarouselPageComponent)initWithViewElement:(id)a3;
- (double)cycleInterval;
- (id)metricsElementName;
- (id)valueForMetricsField:(id)a3;
- (int64_t)componentType;
- (void)enumerateMissingItemIdentifiersFromIndex:(int64_t)a3 usingBlock:(id)a4;
- (void)updateWithMissingItems:(id)a3;
@end

@implementation SKUICarouselPageComponent

- (SKUICarouselPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICarouselPageComponent initWithFeaturedContentContext:kind:]();
  }
  v32.receiver = self;
  v32.super_class = (Class)SKUICarouselPageComponent;
  v27 = [(SKUIPageComponent *)&v32 initWithFeaturedContentContext:v6 kind:a4];
  if (v27)
  {
    v7 = [v6 componentDictionary];
    v8 = [v7 objectForKey:@"children"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = v7;
      v9 = (void *)[v6 copy];
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v24 = v8;
      id v11 = v8;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v29 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v9 setComponentDictionary:v16];
              v17 = [[SKUICarouselItem alloc] initWithComponentContext:v9];
              v18 = [(SKUICarouselItem *)v17 link];
              if ([v18 isActionable])
              {
                [v10 addObject:v17];
              }
              else
              {
                v19 = [v18 itemIdentifier];
                if (v19 && ([v6 isUnavailableItemIdentifier:v19] & 1) == 0)
                {
                  ++v27->_missingItemCount;
                  [v10 addObject:v17];
                }
              }
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v13);
      }

      if ([v6 layoutStyle] == 1 && (unint64_t)objc_msgSend(v10, "count") >= 3)
      {
        v20 = [v10 objectAtIndex:1];
        [v10 removeObjectAtIndex:1];
        [v10 addObject:v20];
      }
      uint64_t v21 = objc_msgSend(v10, "copy", v24);
      carouselItems = v27->_carouselItems;
      v27->_carouselItems = (NSArray *)v21;

      v8 = v25;
      v7 = v26;
    }
    v27->_cycleInterval = 5.0;
  }
  return v27;
}

- (SKUICarouselPageComponent)initWithViewElement:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICarouselPageComponent initWithViewElement:]();
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUICarouselPageComponent;
  v5 = [(SKUIPageComponent *)&v8 initWithViewElement:v4];
  if (v5)
  {
    [v4 displayInterval];
    if (v6 < 0.0) {
      double v6 = 5.0;
    }
    v5->_cycleInterval = v6;
  }

  return v5;
}

- (void)updateWithMissingItems:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = self->_carouselItems;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "link", (void)v14);
        uint64_t v12 = [v11 itemIdentifier];
        if (v12 && ([v11 isActionable] & 1) == 0)
        {
          uint64_t v13 = [v4 objectForKey:v12];
          if (v13)
          {
            [v10 _setLinkItem:v13];
            --self->_missingItemCount;
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (int64_t)componentType
{
  return 18;
}

- (void)enumerateMissingItemIdentifiersFromIndex:(int64_t)a3 usingBlock:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_carouselItems;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "link", (void)v14);
        [v7 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(SKUIPageComponent *)self _enumerateMissingItemIdentifiersFromLinks:v7 startIndex:a3 usingBlock:v6];
}

- (BOOL)isMissingItemData
{
  return self->_missingItemCount > 0;
}

- (id)metricsElementName
{
  return @"carousel";
}

- (id)valueForMetricsField:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4FA8898]])
  {
    v5 = &unk_1F1D61FE8;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SKUICarouselPageComponent;
    v5 = [(SKUIPageComponent *)&v7 valueForMetricsField:v4];
  }

  return v5;
}

- (NSArray)carouselItems
{
  return self->_carouselItems;
}

- (double)cycleInterval
{
  return self->_cycleInterval;
}

- (void).cxx_destruct
{
}

- (void)initWithFeaturedContentContext:kind:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICarouselPageComponent initWithFeaturedContentContext:kind:]";
}

- (void)initWithViewElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICarouselPageComponent initWithViewElement:]";
}

@end