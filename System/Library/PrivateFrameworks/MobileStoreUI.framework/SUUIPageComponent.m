@interface SUUIPageComponent
- (BOOL)isMissingItemData;
- (NSString)metricsElementName;
- (SUUIPageComponent)initWithCustomPageContext:(id)a3;
- (SUUIPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4;
- (SUUIPageComponent)initWithViewElement:(id)a3;
- (SUUIViewElement)viewElement;
- (id)valueForMetricsField:(id)a3;
- (int64_t)componentType;
- (int64_t)metricsLocationPosition;
- (void)_enumerateMissingItemIdentifiersFromBricks:(id)a3 startIndex:(int64_t)a4 usingBlock:(id)a5;
- (void)_enumerateMissingItemIdentifiersFromLinks:(id)a3 startIndex:(int64_t)a4 usingBlock:(id)a5;
- (void)_enumerateMissingItemIdentifiersFromLockups:(id)a3 startIndex:(int64_t)a4 usingBlock:(id)a5;
- (void)_setMetricsLocationPosition:(int64_t)a3;
@end

@implementation SUUIPageComponent

- (SUUIPageComponent)initWithCustomPageContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 componentDictionary];
  v6 = [v5 objectForKey:@"startTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 pageGenerationTime];
    double v8 = v7;
    [v6 doubleValue];
    BOOL v10 = v8 < v9;
  }
  else
  {
    BOOL v10 = 0;
  }
  v11 = [v5 objectForKey:@"endTime"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v10) {
      goto LABEL_6;
    }
LABEL_8:

    v15 = 0;
    goto LABEL_9;
  }
  [v4 pageGenerationTime];
  double v13 = v12;
  [v11 doubleValue];
  if (v13 > v14) {
    goto LABEL_8;
  }
LABEL_6:
  v17.receiver = self;
  v17.super_class = (Class)SUUIPageComponent;
  v15 = [(SUUIPageComponent *)&v17 init];
LABEL_9:

  return v15;
}

- (SUUIPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIPageComponent;
  return [(SUUIPageComponent *)&v5 init];
}

- (SUUIPageComponent)initWithViewElement:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIPageComponent;
  v6 = [(SUUIPageComponent *)&v9 init];
  double v7 = v6;
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
  double v8 = (void (**)(id, void *, int64_t, unsigned char *))a5;
  int64_t v9 = [v7 count];
  if (v9 > a4)
  {
    int64_t v10 = v9 - 1;
    do
    {
      v11 = (void *)MEMORY[0x25A2A9B80]();
      unsigned __int8 v17 = 0;
      double v12 = [v7 objectAtIndex:a4];
      double v13 = [v12 link];
      double v14 = [v13 itemIdentifier];
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
  double v8 = (void (**)(id, void *, int64_t, unsigned char *))a5;
  int64_t v9 = [v7 count];
  if (v9 > a4)
  {
    int64_t v10 = v9 - 1;
    do
    {
      v11 = (void *)MEMORY[0x25A2A9B80]();
      unsigned __int8 v16 = 0;
      double v12 = [v7 objectAtIndex:a4];
      double v13 = [v12 itemIdentifier];
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
  double v8 = (void (**)(id, void *, int64_t, unsigned char *))a5;
  int64_t v9 = [v7 count];
  if (v9 > a4)
  {
    int64_t v10 = v9 - 1;
    do
    {
      v11 = (void *)MEMORY[0x25A2A9B80]();
      unsigned __int8 v18 = 0;
      double v12 = [v7 objectAtIndex:a4];
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

- (SUUIViewElement)viewElement
{
  return self->_viewElement;
}

- (void).cxx_destruct
{
}

@end