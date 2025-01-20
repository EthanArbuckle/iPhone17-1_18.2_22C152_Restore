@interface SKUIShelfMenuBarViewElement
+ (id)supportedFeatures;
- (SKUIMenuBarViewElementConfiguration)configuration;
- (SKUIShelfMenuBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (id)focusedViewElementForMenuItemAtIndex:(unint64_t)a3;
- (id)regularViewElementForMenuItemAtIndex:(unint64_t)a3;
- (unint64_t)elementType;
- (void)_menuBarViewElementConfigurationRequestsReload:(id)a3;
- (void)_reloadMenuItems;
- (void)enumerateChildrenUsingBlock:(id)a3;
- (void)setConfiguration:(id)a3;
@end

@implementation SKUIShelfMenuBarViewElement

- (SKUIShelfMenuBarViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIShelfMenuBarViewElement initWithDOMElement:parent:elementFactory:]();
  }
  uint64_t v11 = objc_opt_class();
  if (v11 == objc_opt_class())
  {
    v16 = [v8 getAttribute:@"entityProviderID"];
    uint64_t v17 = [v16 length];

    if (v17)
    {
      v13 = [(SKUIShelfMenuBarViewElement *)[SKUIDynamicShelfMenuBarViewElement alloc] initWithDOMElement:v8 parent:v9 elementFactory:v10];
      goto LABEL_10;
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIShelfMenuBarViewElement;
  v12 = [(SKUIShelfViewElement *)&v19 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  v13 = (SKUIDynamicShelfMenuBarViewElement *)v12;
  if (v12)
  {
    self = [(SKUIViewElement *)v12 featureWithName:*MEMORY[0x1E4F6EDA8]];
    v14 = [[SKUIMenuBarViewElementConfiguration alloc] _initWithMenuBarDocument:self];
    configuration = v13->super._configuration;
    v13->super._configuration = v14;

    [(SKUIMenuBarViewElementConfiguration *)v13->super._configuration _setReloadDelegate:v13];
LABEL_10:
  }
  return &v13->super;
}

+ (id)supportedFeatures
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4F6EDA8];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___SKUIShelfMenuBarViewElement;
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
  v7.super_class = (Class)SKUIShelfMenuBarViewElement;
  v4 = (SKUIShelfMenuBarViewElement *)a3;
  v5 = [(SKUIShelfViewElement *)&v7 applyUpdatesWithElement:v4];

  if (v4 != self || objc_msgSend(v5, "updateType", v7.receiver, v7.super_class)) {
    -[SKUIMenuBarViewElementConfiguration _setNeedsReload:](self->_configuration, "_setNeedsReload:", 1, v7.receiver, v7.super_class);
  }

  return v5;
}

- (unint64_t)elementType
{
  return 118;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(SKUIShelfMenuBarViewElement *)self children];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__SKUIShelfMenuBarViewElement_enumerateChildrenUsingBlock___block_invoke;
  v7[3] = &unk_1E6425EA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __59__SKUIShelfMenuBarViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  BOOL v3 = [v7 elementType] == 72;
  id v4 = v7;
  if (v3)
  {
    uint64_t v5 = [*(id *)(a1 + 32) shelfItemViewElementValidator];
    id v6 = (void *)v5;
    if (!v5 || (*(unsigned int (**)(uint64_t, id))(v5 + 16))(v5, v7)) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }

    id v4 = v7;
  }
}

- (void)_menuBarViewElementConfigurationRequestsReload:(id)a3
{
  if (self->_configuration == a3) {
    [(SKUIShelfMenuBarViewElement *)self _reloadMenuItems];
  }
}

- (id)regularViewElementForMenuItemAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_regularViewElements objectAtIndex:a3];
}

- (id)focusedViewElementForMenuItemAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_focusedViewElements objectAtIndex:a3];
}

- (void)_reloadMenuItems
{
  v2 = self;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SKUIShelfMenuBarViewElement *)self style];
  id v4 = [v3 valueForStyle:@"itml-shelf-layout"];
  int v5 = [v4 isEqualToString:@"zooming"];

  if (v5)
  {
    int v28 = v5;
    v29 = v2;
    [(SKUIShelfMenuBarViewElement *)v2 children];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = 0;
      id v9 = 0;
      id v10 = 0;
      uint64_t v11 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v31 = 0;
          uint64_t v32 = 0;
          uint64_t v33 = 0;
          SKUIZoomingShelfMenuBarGetValidationInfoForViewElement(v13, (uint64_t)&v31);
          if ((_BYTE)v31)
          {
            id v14 = v13;
            v15 = [v14 children];
            v16 = [v15 objectAtIndex:v32];
            uint64_t v17 = [v15 objectAtIndex:v33];
            if (!v10) {
              id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v10 addObject:v14];
            if (!v9) {
              id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v9 addObject:v16];
            if (!v8) {
              id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v8 addObject:v17];
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v7);
    }
    else
    {
      id v8 = 0;
      id v9 = 0;
      id v10 = 0;
    }

    uint64_t v18 = 2;
    v2 = v29;
    int v5 = v28;
  }
  else
  {
    id v8 = 0;
    id v9 = 0;
    id v10 = 0;
    uint64_t v18 = 0;
  }
  uint64_t v19 = [v9 copy];
  focusedViewElements = v2->_focusedViewElements;
  v2->_focusedViewElements = (NSArray *)v19;

  uint64_t v21 = [v8 copy];
  regularViewElements = v2->_regularViewElements;
  v2->_regularViewElements = (NSArray *)v21;

  if (v5)
  {
    v23 = &__block_literal_global_14;
    v24 = v2;
  }
  else
  {
    v24 = v2;
    v23 = 0;
  }
  [(SKUIShelfViewElement *)v24 setShelfItemViewElementValidator:v23];
  v25 = [(SKUIShelfMenuBarViewElement *)v2 style];
  v26 = [v25 valueForStyle:@"itml-scroll-enabled"];
  uint64_t v27 = [v26 BOOLValue];

  [(SKUIMenuBarViewElementConfiguration *)v2->_configuration _reloadWithMenuBarStyle:v18 menuItemViewElements:v10 scrollEnabled:v27];
}

uint64_t __47__SKUIShelfMenuBarViewElement__reloadMenuItems__block_invoke(uint64_t a1, void *a2)
{
  memset(v3, 0, sizeof(v3));
  SKUIZoomingShelfMenuBarGetValidationInfoForViewElement(a2, (uint64_t)v3);
  return LOBYTE(v3[0]);
}

- (SKUIMenuBarViewElementConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_regularViewElements, 0);

  objc_storeStrong((id *)&self->_focusedViewElements, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIShelfMenuBarViewElement initWithDOMElement:parent:elementFactory:]";
}

@end