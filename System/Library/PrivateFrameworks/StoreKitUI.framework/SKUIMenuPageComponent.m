@interface SKUIMenuPageComponent
- (NSArray)allTitles;
- (NSString)menuTitle;
- (NSString)titleForMoreItem;
- (SKUIMenuPageComponent)initWithCustomPageContext:(id)a3;
- (SKUIMenuPageComponent)initWithRoomSortData:(id)a3;
- (SKUIMenuPageComponent)initWithViewElement:(id)a3;
- (float)menuTitleFontSize;
- (id)_componentWithContext:(id)a3;
- (id)childComponentsForIndex:(int64_t)a3;
- (id)sortURLForIndex:(int64_t)a3;
- (id)titleForIndex:(int64_t)a3;
- (int64_t)componentType;
- (int64_t)defaultSelectedIndex;
- (int64_t)menuStyle;
- (int64_t)menuTitleFontWeight;
- (int64_t)numberOfItems;
- (void)_setChildComponents:(id)a3 forIndex:(int64_t)a4;
@end

@implementation SKUIMenuPageComponent

- (SKUIMenuPageComponent)initWithCustomPageContext:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIMenuPageComponent initWithCustomPageContext:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v72.receiver = self;
  v72.super_class = (Class)SKUIMenuPageComponent;
  v63 = [(SKUIPageComponent *)&v72 initWithCustomPageContext:v4];
  if (v63)
  {
    v13 = [v4 componentDictionary];
    v14 = [v13 objectForKey:@"type"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v14 isEqualToString:@"popup"]) {
      v63->_menuStyle = 1;
    }
    v15 = [v13 objectForKey:@"moreTitle"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v15 copy];
      titleForMoreItem = v63->_titleForMoreItem;
      v63->_titleForMoreItem = (NSString *)v16;
    }
    v18 = [v13 objectForKey:@"title"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [v18 copy];
      menuTitle = v63->_menuTitle;
      v63->_menuTitle = (NSString *)v19;

      v21 = [v13 objectForKey:@"titleSize"];

      if (objc_opt_respondsToSelector())
      {
        [v21 floatValue];
        v63->_menuTitleFontSize = v22;
      }
      v18 = [v13 objectForKey:@"titleWeight"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v63->_menuTitleFontWeight = SKUIPageComponentFontWeightForString(v18);
      }
    }
    v23 = [v13 objectForKey:@"children"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v54 = v13;
      id v61 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
      v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      childrenComponents = v63->_childrenComponents;
      v63->_childrenComponents = v24;

      v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      titles = v63->_titles;
      v63->_titles = v26;

      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      v53 = v23;
      id v28 = v23;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v68 objects:v74 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v69;
        id v57 = v4;
        uint64_t v55 = *(void *)v69;
        id v56 = v28;
        do
        {
          uint64_t v32 = 0;
          uint64_t v58 = v30;
          do
          {
            if (*(void *)v69 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v60 = v32;
            v33 = *(void **)(*((void *)&v68 + 1) + 8 * v32);
            uint64_t v34 = [v33 objectForKey:@"content"];
            v35 = v33;
            v36 = (void *)v34;
            v37 = [v35 objectForKey:@"title"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v38 = (void *)[v4 copy];
                id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                v40 = v36;
                id v41 = v39;
                long long v64 = 0u;
                long long v65 = 0u;
                long long v66 = 0u;
                long long v67 = 0u;
                v59 = v40;
                id v42 = v40;
                uint64_t v43 = [v42 countByEnumeratingWithState:&v64 objects:v73 count:16];
                if (v43)
                {
                  uint64_t v44 = v43;
                  uint64_t v45 = *(void *)v65;
                  do
                  {
                    uint64_t v46 = 0;
                    uint64_t v62 = v44;
                    do
                    {
                      if (*(void *)v65 != v45) {
                        objc_enumerationMutation(v42);
                      }
                      uint64_t v47 = *(void *)(*((void *)&v64 + 1) + 8 * v46);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [v38 setComponentDictionary:v47];
                        v48 = [(SKUIMenuPageComponent *)v63 _componentWithContext:v38];
                        v49 = v48;
                        if (v48)
                        {
                          v50 = v37;
                          v51 = [v48 metricsElementName];
                          if (v51)
                          {
                            objc_msgSend(v49, "_setMetricsLocationPosition:", objc_msgSend(v61, "countForObject:", v51));
                            uint64_t v44 = v62;
                            [v61 addObject:v51];
                          }
                          [v41 addObject:v49];

                          v37 = v50;
                        }
                      }
                      ++v46;
                    }
                    while (v44 != v46);
                    uint64_t v44 = [v42 countByEnumeratingWithState:&v64 objects:v73 count:16];
                  }
                  while (v44);
                }

                if ([v41 count])
                {
                  [(NSMutableArray *)v63->_childrenComponents addObject:v41];
                  [(NSMutableArray *)v63->_titles addObject:v37];
                }

                id v4 = v57;
                uint64_t v31 = v55;
                id v28 = v56;
                uint64_t v30 = v58;
                v36 = v59;
              }
            }

            uint64_t v32 = v60 + 1;
          }
          while (v60 + 1 != v30);
          uint64_t v30 = [v28 countByEnumeratingWithState:&v68 objects:v74 count:16];
        }
        while (v30);
      }

      v13 = v54;
      v23 = v53;
    }
  }
  return v63;
}

- (SKUIMenuPageComponent)initWithRoomSortData:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIMenuPageComponent initWithRoomSortData:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v31.receiver = self;
  v31.super_class = (Class)SKUIMenuPageComponent;
  v13 = [(SKUIMenuPageComponent *)&v31 init];
  if (v13)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    childrenComponents = v13->_childrenComponents;
    v13->_childrenComponents = v14;

    uint64_t v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sortURLStrings = v13->_sortURLStrings;
    v13->_sortURLStrings = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    titles = v13->_titles;
    v13->_titles = v18;

    v20 = [v4 objectForKey:@"defaultSort"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [v20 objectForKey:@"id"];
    }
    else
    {
      v21 = 0;
    }
    float v22 = [v4 objectForKey:@"sorts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v25 = MEMORY[0x1E4F143A8];
      uint64_t v26 = 3221225472;
      v27 = __46__SKUIMenuPageComponent_initWithRoomSortData___block_invoke;
      id v28 = &unk_1E642A658;
      uint64_t v29 = v13;
      id v30 = v21;
      [v22 enumerateObjectsUsingBlock:&v25];
    }
    uint64_t v23 = [(NSMutableArray *)v13->_sortURLStrings count];
    if (v23 != [(NSMutableArray *)v13->_titles count]
      || ![(NSMutableArray *)v13->_sortURLStrings count]
      || ![(NSMutableArray *)v13->_titles count])
    {

      v13 = 0;
    }
  }
  return v13;
}

uint64_t __46__SKUIMenuPageComponent_initWithRoomSortData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v13;
  if (isKindOfClass)
  {
    uint64_t v7 = [v13 objectForKey:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(*(void *)(a1 + 32) + 88) addObject:v7];
    }
    uint64_t v8 = [v13 objectForKey:@"url"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(*(void *)(a1 + 32) + 72) addObject:v8];
    }
    uint64_t v9 = [v13 objectForKey:@"id"];

    if ([v9 isEqual:*(void *)(a1 + 40)]) {
      *(void *)(*(void *)(a1 + 32) + 32) = a3;
    }
    uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
    [v10 addObject:v11];

    id v6 = v13;
  }

  return MEMORY[0x1F41817F8](isKindOfClass, v6);
}

- (SKUIMenuPageComponent)initWithViewElement:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIMenuPageComponent initWithViewElement:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIMenuPageComponent;
  id v13 = [(SKUIPageComponent *)&v18 initWithViewElement:v4];
  if (v13)
  {
    v13->_defaultSelectedIndex = [v4 initialSelectedItemIndex];
    v14 = [v4 segmentItemTitles];
    uint64_t v15 = [v14 mutableCopy];
    titles = v13->_titles;
    v13->_titles = (NSMutableArray *)v15;
  }
  return v13;
}

- (NSArray)allTitles
{
  v2 = (void *)[(NSMutableArray *)self->_titles copy];

  return (NSArray *)v2;
}

- (id)childComponentsForIndex:(int64_t)a3
{
  v3 = [(NSMutableArray *)self->_childrenComponents objectAtIndex:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v3 = 0;
  }

  return v3;
}

- (int64_t)numberOfItems
{
  return [(NSMutableArray *)self->_titles count];
}

- (id)sortURLForIndex:(int64_t)a3
{
  sortURLStrings = self->_sortURLStrings;
  if (sortURLStrings)
  {
    id v4 = [(NSMutableArray *)sortURLStrings objectAtIndex:a3];
    BOOL v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)titleForIndex:(int64_t)a3
{
  return (id)[(NSMutableArray *)self->_titles objectAtIndex:a3];
}

- (int64_t)componentType
{
  return 11;
}

- (void)_setChildComponents:(id)a3 forIndex:(int64_t)a4
{
}

- (id)_componentWithContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 componentDictionary];
  BOOL v5 = [v4 objectForKey:@"type"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v6 = SKUIPageComponentTypeForBlockType(v5),
        (uint64_t v7 = (objc_class *)SKUIPageComponentClassForComponentType(v6)) != 0))
  {
    uint64_t v8 = (void *)[[v7 alloc] initWithCustomPageContext:v3];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (int64_t)defaultSelectedIndex
{
  return self->_defaultSelectedIndex;
}

- (int64_t)menuStyle
{
  return self->_menuStyle;
}

- (NSString)menuTitle
{
  return self->_menuTitle;
}

- (float)menuTitleFontSize
{
  return self->_menuTitleFontSize;
}

- (int64_t)menuTitleFontWeight
{
  return self->_menuTitleFontWeight;
}

- (NSString)titleForMoreItem
{
  return self->_titleForMoreItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_titleForMoreItem, 0);
  objc_storeStrong((id *)&self->_sortURLStrings, 0);
  objc_storeStrong((id *)&self->_menuTitle, 0);

  objc_storeStrong((id *)&self->_childrenComponents, 0);
}

- (void)initWithCustomPageContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithRoomSortData:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end