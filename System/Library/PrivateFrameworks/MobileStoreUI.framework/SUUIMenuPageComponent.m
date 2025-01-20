@interface SUUIMenuPageComponent
- (NSArray)allTitles;
- (NSString)menuTitle;
- (NSString)titleForMoreItem;
- (SUUIMenuPageComponent)initWithCustomPageContext:(id)a3;
- (SUUIMenuPageComponent)initWithRoomSortData:(id)a3;
- (SUUIMenuPageComponent)initWithViewElement:(id)a3;
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

@implementation SUUIMenuPageComponent

- (SUUIMenuPageComponent)initWithCustomPageContext:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)SUUIMenuPageComponent;
  v55 = [(SUUIPageComponent *)&v64 initWithCustomPageContext:v4];
  if (v55)
  {
    v5 = [v4 componentDictionary];
    v6 = [v5 objectForKey:@"type"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 isEqualToString:@"popup"]) {
      v55->_menuStyle = 1;
    }
    v7 = [v5 objectForKey:@"moreTitle"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v7 copy];
      titleForMoreItem = v55->_titleForMoreItem;
      v55->_titleForMoreItem = (NSString *)v8;
    }
    v10 = [v5 objectForKey:@"title"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v10 copy];
      menuTitle = v55->_menuTitle;
      v55->_menuTitle = (NSString *)v11;

      v13 = [v5 objectForKey:@"titleSize"];

      if (objc_opt_respondsToSelector())
      {
        [v13 floatValue];
        v55->_menuTitleFontSize = v14;
      }
      v10 = [v5 objectForKey:@"titleWeight"];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v55->_menuTitleFontWeight = SUUIPageComponentFontWeightForString(v10);
      }
    }
    v15 = [v5 objectForKey:@"children"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v46 = v5;
      id v53 = objc_alloc_init(MEMORY[0x263F08760]);
      v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      childrenComponents = v55->_childrenComponents;
      v55->_childrenComponents = v16;

      v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      titles = v55->_titles;
      v55->_titles = v18;

      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      v45 = v15;
      id v20 = v15;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v60 objects:v66 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v61;
        id v49 = v4;
        uint64_t v47 = *(void *)v61;
        id v48 = v20;
        do
        {
          uint64_t v24 = 0;
          uint64_t v50 = v22;
          do
          {
            if (*(void *)v61 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v52 = v24;
            v25 = *(void **)(*((void *)&v60 + 1) + 8 * v24);
            uint64_t v26 = [v25 objectForKey:@"content"];
            v27 = v25;
            v28 = (void *)v26;
            v29 = [v27 objectForKey:@"title"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v30 = (void *)[v4 copy];
                id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
                v32 = v28;
                id v33 = v31;
                long long v56 = 0u;
                long long v57 = 0u;
                long long v58 = 0u;
                long long v59 = 0u;
                v51 = v32;
                id v34 = v32;
                uint64_t v35 = [v34 countByEnumeratingWithState:&v56 objects:v65 count:16];
                if (v35)
                {
                  uint64_t v36 = v35;
                  uint64_t v37 = *(void *)v57;
                  do
                  {
                    uint64_t v38 = 0;
                    uint64_t v54 = v36;
                    do
                    {
                      if (*(void *)v57 != v37) {
                        objc_enumerationMutation(v34);
                      }
                      uint64_t v39 = *(void *)(*((void *)&v56 + 1) + 8 * v38);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        [v30 setComponentDictionary:v39];
                        v40 = [(SUUIMenuPageComponent *)v55 _componentWithContext:v30];
                        v41 = v40;
                        if (v40)
                        {
                          v42 = v29;
                          v43 = [v40 metricsElementName];
                          if (v43)
                          {
                            objc_msgSend(v41, "_setMetricsLocationPosition:", objc_msgSend(v53, "countForObject:", v43));
                            uint64_t v36 = v54;
                            [v53 addObject:v43];
                          }
                          [v33 addObject:v41];

                          v29 = v42;
                        }
                      }
                      ++v38;
                    }
                    while (v36 != v38);
                    uint64_t v36 = [v34 countByEnumeratingWithState:&v56 objects:v65 count:16];
                  }
                  while (v36);
                }

                if ([v33 count])
                {
                  [(NSMutableArray *)v55->_childrenComponents addObject:v33];
                  [(NSMutableArray *)v55->_titles addObject:v29];
                }

                id v4 = v49;
                uint64_t v23 = v47;
                id v20 = v48;
                uint64_t v22 = v50;
                v28 = v51;
              }
            }

            uint64_t v24 = v52 + 1;
          }
          while (v52 + 1 != v22);
          uint64_t v22 = [v20 countByEnumeratingWithState:&v60 objects:v66 count:16];
        }
        while (v22);
      }

      v5 = v46;
      v15 = v45;
    }
  }
  return v55;
}

- (SUUIMenuPageComponent)initWithRoomSortData:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SUUIMenuPageComponent;
  v5 = [(SUUIMenuPageComponent *)&v23 init];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    childrenComponents = v5->_childrenComponents;
    v5->_childrenComponents = v6;

    uint64_t v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    sortURLStrings = v5->_sortURLStrings;
    v5->_sortURLStrings = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    titles = v5->_titles;
    v5->_titles = v10;

    v12 = [v4 objectForKey:@"defaultSort"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [v12 objectForKey:@"id"];
    }
    else
    {
      v13 = 0;
    }
    float v14 = [v4 objectForKey:@"sorts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = MEMORY[0x263EF8330];
      uint64_t v18 = 3221225472;
      v19 = __46__SUUIMenuPageComponent_initWithRoomSortData___block_invoke;
      id v20 = &unk_2654063E0;
      uint64_t v21 = v5;
      id v22 = v13;
      [v14 enumerateObjectsUsingBlock:&v17];
    }
    uint64_t v15 = [(NSMutableArray *)v5->_sortURLStrings count];
    if (v15 != [(NSMutableArray *)v5->_titles count]
      || ![(NSMutableArray *)v5->_sortURLStrings count]
      || ![(NSMutableArray *)v5->_titles count])
    {

      v5 = 0;
    }
  }
  return v5;
}

uint64_t __46__SUUIMenuPageComponent_initWithRoomSortData___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v13;
  if (isKindOfClass)
  {
    v7 = [v13 objectForKey:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(*(void *)(a1 + 32) + 88) addObject:v7];
    }
    uint64_t v8 = [v13 objectForKey:@"url"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(*(void *)(a1 + 32) + 72) addObject:v8];
    }
    v9 = [v13 objectForKey:@"id"];

    if ([v9 isEqual:*(void *)(a1 + 40)]) {
      *(void *)(*(void *)(a1 + 32) + 32) = a3;
    }
    v10 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v11 = [MEMORY[0x263EFF9D0] null];
    [v10 addObject:v11];

    id v6 = v13;
  }
  return MEMORY[0x270F9A758](isKindOfClass, v6);
}

- (SUUIMenuPageComponent)initWithViewElement:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIMenuPageComponent;
  v5 = [(SUUIPageComponent *)&v10 initWithViewElement:v4];
  if (v5)
  {
    v5->_defaultSelectedIndex = [v4 initialSelectedItemIndex];
    id v6 = [v4 segmentItemTitles];
    uint64_t v7 = [v6 mutableCopy];
    titles = v5->_titles;
    v5->_titles = (NSMutableArray *)v7;
  }
  return v5;
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
    v5 = [NSURL URLWithString:v4];
  }
  else
  {
    v5 = 0;
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
  v5 = [v4 objectForKey:@"type"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (uint64_t v6 = SUUIPageComponentTypeForBlockType(v5),
        (uint64_t v7 = (objc_class *)SUUIPageComponentClassForComponentType(v6)) != 0))
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

@end