@interface SKUIRowComponent
- (BOOL)_isChildMissingItemData:(id)a3;
- (BOOL)isMissingItemData;
- (BOOL)shouldAutoFlow;
- (NSArray)childComponents;
- (NSArray)columnWidths;
- (SKUIRowComponent)initWithCustomPageContext:(id)a3;
- (SKUIRowComponent)initWithViewElement:(id)a3;
- (UIColor)backgroundColor;
- (id)_childComponentWithContext:(id)a3;
- (id)_updateWithMissingItems:(id)a3;
- (id)description;
- (id)metricsElementName;
- (int64_t)componentType;
- (int64_t)numberOfColumns;
- (void)enumerateMissingItemIdentifiersFromIndex:(int64_t)a3 usingBlock:(id)a4;
@end

@implementation SKUIRowComponent

- (SKUIRowComponent)initWithCustomPageContext:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRowComponent initWithCustomPageContext:]();
  }
  v39.receiver = self;
  v39.super_class = (Class)SKUIRowComponent;
  v5 = [(SKUIPageComponent *)&v39 initWithCustomPageContext:v4];
  if (v5)
  {
    v6 = [v4 componentDictionary];
    v7 = [v6 objectForKey:@"columns"];
    if (objc_opt_respondsToSelector()) {
      v5->_numberOfColumns = [v7 integerValue];
    }
    v8 = [v6 objectForKey:@"backgroundColor"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = SKUIColorWithHTMLCode(v8);
      backgroundColor = v5->_backgroundColor;
      v5->_backgroundColor = (UIColor *)v9;
    }
    v11 = [v6 objectForKey:@"shouldAutoFlow"];

    if (objc_opt_respondsToSelector()) {
      v5->_shouldAutoFlow = [v11 BOOLValue];
    }
    else {
      v5->_shouldAutoFlow = 1;
    }
    v12 = [v6 objectForKey:@"children"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = v11;
      v32 = v6;
      id v33 = v4;
      v13 = (void *)[v4 copy];
      id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v30 = v12;
      id v15 = v12;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v36 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v13 setComponentDictionary:v20];
              v21 = [(SKUIRowComponent *)v5 _childComponentWithContext:v13];
              if (v21)
              {
                v22 = [v20 objectForKey:@"colspan"];
                if (objc_opt_respondsToSelector())
                {
                  v23 = v34;
                  v24 = v22;
                }
                else
                {
                  v23 = v34;
                  v24 = &unk_1F1D61C58;
                }
                objc_msgSend(v23, "addObject:", v24, v30);
                if ([(SKUIRowComponent *)v5 _isChildMissingItemData:v21]) {
                  ++v5->_missingItemCount;
                }
                [v14 addObject:v21];
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v17);
      }

      uint64_t v25 = [v14 copy];
      childComponents = v5->_childComponents;
      v5->_childComponents = (NSArray *)v25;

      uint64_t v27 = [v34 copy];
      columnWidths = v5->_columnWidths;
      v5->_columnWidths = (NSArray *)v27;

      v6 = v32;
      id v4 = v33;
      v12 = v30;
      v11 = v31;
    }
  }
  return v5;
}

- (SKUIRowComponent)initWithViewElement:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIRowComponent initWithViewElement:]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUIRowComponent;
  v5 = [(SKUIPageComponent *)&v7 initWithViewElement:v4];

  return v5;
}

- (int64_t)componentType
{
  return 3;
}

- (void)enumerateMissingItemIdentifiersFromIndex:(int64_t)a3 usingBlock:(id)a4
{
  v6 = (void (**)(id, void *, int64_t, unsigned char *))a4;
  int64_t v7 = [(NSArray *)self->_childComponents count];
  if (v7 > a3)
  {
    int64_t v8 = v7 - 1;
    do
    {
      uint64_t v9 = (void *)MEMORY[0x1C8749310]();
      unsigned __int8 v17 = 0;
      v10 = [(NSArray *)self->_childComponents objectAtIndex:a3];
      if ([v10 componentType] == 9)
      {
        uint64_t v11 = [v10 itemIdentifier];
        if (v11)
        {
          uint64_t v12 = v11;
          v13 = [v10 item];

          if (!v13)
          {
            id v14 = (void *)[objc_alloc(NSNumber) initWithLongLong:v12];
            v6[2](v6, v14, a3, &v17);
          }
        }
      }
      int v15 = v17;

      if (v15) {
        break;
      }
    }
    while (v8 != a3++);
  }
}

- (BOOL)isMissingItemData
{
  return self->_missingItemCount > 0;
}

- (id)metricsElementName
{
  return @"customRow";
}

- (id)_updateWithMissingItems:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__SKUIRowComponent__updateWithMissingItems___block_invoke;
  v8[3] = &unk_1E6425578;
  id v9 = v4;
  v10 = self;
  id v6 = v4;
  [(SKUIRowComponent *)self enumerateMissingItemIdentifiersFromIndex:0 usingBlock:v8];

  return v5;
}

void __44__SKUIRowComponent__updateWithMissingItems___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [*(id *)(a1 + 32) objectForKey:a2];
  if (v6)
  {
    id v5 = [*(id *)(*(void *)(a1 + 40) + 32) objectAtIndex:a3];
    [v5 _setItem:v6];
    --*(void *)(*(void *)(a1 + 40) + 48);
  }
}

- (id)_childComponentWithContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 componentDictionary];
  id v5 = [v4 objectForKey:@"type"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ((v6 = SKUIPageComponentTypeForBlockType(v5), v6 <= 0xE) ? (BOOL v7 = ((1 << v6) & 0x46A4) == 0) : (BOOL v7 = 1), v7))
  {
    int64_t v8 = 0;
  }
  else
  {
    int64_t v8 = (void *)[objc_alloc((Class)SKUIPageComponentClassForComponentType(v6)) initWithCustomPageContext:v3];
  }

  return v8;
}

- (BOOL)_isChildMissingItemData:(id)a3
{
  id v3 = a3;
  if ([v3 componentType] == 9)
  {
    id v4 = v3;
    id v5 = [v4 item];
    if (v5) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = [v4 itemIdentifier] != 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SKUIRowComponent;
  id v4 = [(SKUIRowComponent *)&v7 description];
  objc_msgSend(v3, "stringWithFormat:", @"%@: %ld columns; %@",
    v4,
    self->_numberOfColumns,
  id v5 = self->_childComponents);

  return v5;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSArray)childComponents
{
  return self->_childComponents;
}

- (NSArray)columnWidths
{
  return self->_columnWidths;
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (BOOL)shouldAutoFlow
{
  return self->_shouldAutoFlow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnWidths, 0);
  objc_storeStrong((id *)&self->_childComponents, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)initWithCustomPageContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRowComponent initWithCustomPageContext:]";
}

- (void)initWithViewElement:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRowComponent initWithViewElement:]";
}

@end