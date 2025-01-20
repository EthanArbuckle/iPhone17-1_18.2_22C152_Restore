@interface SKUIPageComponent
- (BOOL)isMissingItemData;
- (NSString)metricsElementName;
- (SKUIPageComponent)initWithCustomPageContext:(id)a3;
- (SKUIPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4;
- (SKUIPageComponent)initWithViewElement:(id)a3;
- (SKUIViewElement)viewElement;
- (id)valueForMetricsField:(id)a3;
- (int64_t)componentType;
- (int64_t)metricsLocationPosition;
- (void)_enumerateMissingItemIdentifiersFromBricks:(id)a3 startIndex:(int64_t)a4 usingBlock:(id)a5;
- (void)_enumerateMissingItemIdentifiersFromLinks:(id)a3 startIndex:(int64_t)a4 usingBlock:(id)a5;
- (void)_enumerateMissingItemIdentifiersFromLockups:(id)a3 startIndex:(int64_t)a4 usingBlock:(id)a5;
- (void)_setMetricsLocationPosition:(int64_t)a3;
@end

@implementation SKUIPageComponent

- (SKUIPageComponent)initWithCustomPageContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIPageComponent initWithCustomPageContext:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = [v4 componentDictionary];
  v14 = [v13 objectForKey:@"startTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 pageGenerationTime];
    double v16 = v15;
    [v14 doubleValue];
    BOOL v18 = v16 < v17;
  }
  else
  {
    BOOL v18 = 0;
  }
  v19 = [v13 objectForKey:@"endTime"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v18) {
      goto LABEL_10;
    }
LABEL_12:

    v23 = 0;
    goto LABEL_13;
  }
  [v4 pageGenerationTime];
  double v21 = v20;
  [v19 doubleValue];
  if (v21 > v22) {
    goto LABEL_12;
  }
LABEL_10:
  v25.receiver = self;
  v25.super_class = (Class)SKUIPageComponent;
  v23 = [(SKUIPageComponent *)&v25 init];
LABEL_13:

  return v23;
}

- (SKUIPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIPageComponent initWithFeaturedContentContext:kind:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIPageComponent;
  return [(SKUIPageComponent *)&v14 init];
}

- (SKUIPageComponent)initWithViewElement:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIPageComponent initWithViewElement:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIPageComponent;
  uint64_t v6 = [(SKUIPageComponent *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewElement, a3);
  }

  return v7;
}

- (int64_t)componentType
{
  int64_t result = (int64_t)self->_viewElement;
  if (result) {
    return [(id)result pageComponentType];
  }
  return result;
}

- (BOOL)isMissingItemData
{
  return 0;
}

- (NSString)metricsElementName
{
  return 0;
}

- (id)valueForMetricsField:(id)a3
{
  return 0;
}

- (void)_enumerateMissingItemIdentifiersFromBricks:(id)a3 startIndex:(int64_t)a4 usingBlock:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *, int64_t, unsigned char *))a5;
  int64_t v9 = [v7 count];
  if (v9 > a4)
  {
    int64_t v10 = v9 - 1;
    do
    {
      uint64_t v11 = (void *)MEMORY[0x1C8749310]();
      unsigned __int8 v17 = 0;
      uint64_t v12 = [v7 objectAtIndex:a4];
      v13 = [v12 link];
      objc_super v14 = [v13 itemIdentifier];
      if (([v13 isActionable] & 1) == 0 && v14) {
        v8[2](v8, v14, a4, &v17);
      }
      int v15 = v17;

      if (v15) {
        break;
      }
    }
    while (v10 != a4++);
  }
}

- (void)_enumerateMissingItemIdentifiersFromLinks:(id)a3 startIndex:(int64_t)a4 usingBlock:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *, int64_t, unsigned char *))a5;
  int64_t v9 = [v7 count];
  if (v9 > a4)
  {
    int64_t v10 = v9 - 1;
    do
    {
      uint64_t v11 = (void *)MEMORY[0x1C8749310]();
      unsigned __int8 v16 = 0;
      uint64_t v12 = [v7 objectAtIndex:a4];
      v13 = [v12 itemIdentifier];
      if (([v12 isActionable] & 1) == 0 && v13) {
        v8[2](v8, v13, a4, &v16);
      }
      int v14 = v16;

      if (v14) {
        break;
      }
    }
    while (v10 != a4++);
  }
}

- (void)_enumerateMissingItemIdentifiersFromLockups:(id)a3 startIndex:(int64_t)a4 usingBlock:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void *, int64_t, unsigned char *))a5;
  int64_t v9 = [v7 count];
  if (v9 > a4)
  {
    int64_t v10 = v9 - 1;
    do
    {
      uint64_t v11 = (void *)MEMORY[0x1C8749310]();
      unsigned __int8 v18 = 0;
      uint64_t v12 = [v7 objectAtIndex:a4];
      uint64_t v13 = [v12 itemIdentifier];
      if (v13)
      {
        uint64_t v14 = v13;
        if ([v12 _needsItemData])
        {
          int v15 = (void *)[objc_alloc(NSNumber) initWithLongLong:v14];
          v8[2](v8, v15, a4, &v18);
        }
      }
      int v16 = v18;

      if (v16) {
        break;
      }
    }
    while (v10 != a4++);
  }
}

- (int64_t)metricsLocationPosition
{
  return self->_metricsLocationPosition;
}

- (void)_setMetricsLocationPosition:(int64_t)a3
{
  self->_metricsLocationPosition = a3;
}

- (SKUIViewElement)viewElement
{
  return self->_viewElement;
}

- (void).cxx_destruct
{
}

- (void)initWithCustomPageContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithFeaturedContentContext:(uint64_t)a3 kind:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithViewElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPageComponent initWithViewElement:]";
}

@end