@interface SUUIMenuBarViewElement
+ (Class)_shelfMenuBarViewElementClass;
+ (Class)_titlesMenuBarViewElementClass;
+ (id)supportedFeatures;
- (SUUIMenuBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (SUUIMenuBarViewElementConfiguration)configuration;
- (id)applyUpdatesWithElement:(id)a3;
- (id)titleForMenuItemAtIndex:(unint64_t)a3;
- (void)_menuBarViewElementConfigurationRequestsReload:(id)a3;
- (void)_reloadMenuItems;
- (void)setConfiguration:(id)a3;
@end

@implementation SUUIMenuBarViewElement

- (SUUIMenuBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    v20 = [v8 getAttribute:@"entityProviderID"];
    uint64_t v21 = [v20 length];

    if (v21)
    {
      v15 = (objc_class *)SUUIDynamicMenuBarViewElement;
      goto LABEL_9;
    }
  }
  uint64_t v12 = objc_opt_class();
  if (v12 == [(id)objc_opt_class() _titlesMenuBarViewElementClass])
  {
    v13 = [v8 getAttribute:@"type"];
    int v14 = [v13 isEqualToString:@"shelf"];

    if (v14)
    {
      v15 = (objc_class *)[(id)objc_opt_class() _shelfMenuBarViewElementClass];
LABEL_9:
      v17 = (SUUIMenuBarViewElement *)[[v15 alloc] initWithDOMElement:v8 parent:v9 elementFactory:v10];
      goto LABEL_10;
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SUUIMenuBarViewElement;
  v16 = [(SUUIViewElement *)&v23 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  v17 = v16;
  if (v16)
  {
    self = [(SUUIViewElement *)v16 featureWithName:*MEMORY[0x263F4B2B0]];
    v18 = [[SUUIMenuBarViewElementConfiguration alloc] _initWithMenuBarDocument:self];
    configuration = v17->_configuration;
    v17->_configuration = v18;

    [(SUUIMenuBarViewElementConfiguration *)v17->_configuration _setReloadDelegate:v17];
LABEL_10:
  }
  return v17;
}

+ (id)supportedFeatures
{
  v9[1] = *MEMORY[0x263EF8340];
  v9[0] = *MEMORY[0x263F4B2B0];
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___SUUIMenuBarViewElement;
  v4 = objc_msgSendSuper2(&v8, sel_supportedFeatures);
  if (v4)
  {
    v5 = v4;
    id v6 = [v4 arrayByAddingObjectsFromArray:v3];
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIMenuBarViewElement;
  v4 = (SUUIMenuBarViewElement *)a3;
  v5 = [(SUUIViewElement *)&v7 applyUpdatesWithElement:v4];

  if (v4 != self || objc_msgSend(v5, "updateType", v7.receiver, v7.super_class)) {
    -[SUUIMenuBarViewElementConfiguration _setNeedsReload:](self->_configuration, "_setNeedsReload:", 1, v7.receiver, v7.super_class);
  }
  return v5;
}

- (void)_menuBarViewElementConfigurationRequestsReload:(id)a3
{
  if (self->_configuration == a3) {
    [(SUUIMenuBarViewElement *)self _reloadMenuItems];
  }
}

- (id)titleForMenuItemAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_titleViewElements objectAtIndex:a3];
}

+ (Class)_titlesMenuBarViewElementClass
{
  return (Class)objc_opt_class();
}

+ (Class)_shelfMenuBarViewElementClass
{
  return (Class)objc_opt_class();
}

- (void)_reloadMenuItems
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(SUUIMenuBarViewElement *)self children];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    id v7 = 0;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v3);
        }
        id v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v10 elementType] == 72)
        {
          id v11 = v10;
          uint64_t v12 = [v11 firstChildForElementType:138];
          if (v12)
          {
            if (!v6) {
              id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
            }
            [v6 addObject:v12];
            if (!v7) {
              id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
            }
            [v7 addObject:v11];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
    id v7 = 0;
  }
  objc_storeStrong((id *)&self->_titleViewElements, v6);
  if (v7 && [v7 count])
  {
    uint64_t v13 = 1;
  }
  else
  {
    int v14 = [(SUUIViewElement *)self firstChildForElementType:4];

    if (v14) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 1;
    }
  }
  v15 = [(SUUIMenuBarViewElement *)self style];
  v16 = [v15 valueForStyle:@"itml-scroll-enabled"];
  uint64_t v17 = [v16 BOOLValue];

  [(SUUIMenuBarViewElementConfiguration *)self->_configuration _reloadWithMenuBarStyle:v13 menuItemViewElements:v7 scrollEnabled:v17];
}

- (SUUIMenuBarViewElementConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_titleViewElements, 0);
}

@end