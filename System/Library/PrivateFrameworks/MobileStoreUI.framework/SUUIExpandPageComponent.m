@interface SUUIExpandPageComponent
- (SUUIExpandPageComponent)initWithViewElement:(id)a3;
- (SUUIExpandViewElement)viewElement;
- (id)childComponentForIndex:(int64_t)a3;
- (id)childComponents;
- (id)metricsElementName;
- (int64_t)componentType;
@end

@implementation SUUIExpandPageComponent

- (SUUIExpandPageComponent)initWithViewElement:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SUUIExpandPageComponent;
  v6 = [(SUUIPageComponent *)&v22 initWithViewElement:v5];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    childComponents = v6->_childComponents;
    v6->_childComponents = v7;

    objc_storeStrong((id *)&v6->_viewElement, a3);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = objc_msgSend(v5, "flattenedChildren", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v15 = (objc_class *)SUUIPageComponentClassForComponentType([v14 pageComponentType]);
          if (v15)
          {
            v16 = (void *)[[v15 alloc] initWithViewElement:v14];
            if (v16) {
              [(NSMutableArray *)v6->_childComponents addObject:v16];
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }
  }
  return v6;
}

- (id)childComponentForIndex:(int64_t)a3
{
  return (id)[(NSMutableArray *)self->_childComponents objectAtIndex:a3];
}

- (id)childComponents
{
  return self->_childComponents;
}

- (int64_t)componentType
{
  return 19;
}

- (id)metricsElementName
{
  return @"expand";
}

- (SUUIExpandViewElement)viewElement
{
  return self->_viewElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_childComponents, 0);
}

@end