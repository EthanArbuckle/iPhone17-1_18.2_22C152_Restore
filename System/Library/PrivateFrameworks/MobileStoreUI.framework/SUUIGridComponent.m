@interface SUUIGridComponent
- (BOOL)isMissingItemData;
- (BOOL)showsIndexNumbers;
- (NSArray)children;
- (SUUIEditorialStyle)editorialStyle;
- (SUUIGridComponent)initWithBrickItems:(id)a3;
- (SUUIGridComponent)initWithCustomPageContext:(id)a3;
- (SUUIGridComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4;
- (SUUIGridComponent)initWithGridItems:(id)a3;
- (SUUIGridComponent)initWithLockups:(id)a3;
- (SUUIGridComponent)initWithRoomContext:(id)a3 gridType:(int64_t)a4;
- (SUUIGridComponent)initWithViewElement:(id)a3;
- (SUUILockupStyle)lockupStyle;
- (id)_newLockupComponentWithItem:(id)a3 defaultStyle:(SUUILockupStyle *)a4;
- (id)_updateWithInvalidItemIdentifiers:(id)a3;
- (id)_updateWithMissingItems:(id)a3;
- (id)description;
- (id)metricsElementName;
- (int64_t)componentType;
- (int64_t)gridType;
- (void)_reloadMissingItemCount;
- (void)_setChildrenWithFeaturedContextContext:(id)a3;
- (void)enumerateMissingItemIdentifiersFromIndex:(int64_t)a3 usingBlock:(id)a4;
@end

@implementation SUUIGridComponent

- (SUUIGridComponent)initWithBrickItems:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIGridComponent;
  v5 = [(SUUIGridComponent *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    children = v5->_children;
    v5->_children = (NSMutableArray *)v6;

    SUUIEditorialStyleDefault((uint64_t)&v12);
    long long v8 = v12;
    long long v9 = v13;
    *(void *)&v5->_editorialStyle.titleFontSize = v14;
    *(_OWORD *)&v5->_editorialStyle.alignment = v8;
    *(_OWORD *)&v5->_editorialStyle.bodyFontSize = v9;
    v5->_gridType = 2;
    SUUILockupStyleDefault((uint64_t)&v12);
    long long v10 = v12;
    v5->_lockupStyle.visibleFields = v13;
    *(_OWORD *)&v5->_lockupStyle.artworkSize = v10;
    [(SUUIGridComponent *)v5 _reloadMissingItemCount];
  }

  return v5;
}

- (SUUIGridComponent)initWithCustomPageContext:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SUUIGridComponent;
  v5 = [(SUUIPageComponent *)&v42 initWithCustomPageContext:v4];
  if (!v5) {
    goto LABEL_50;
  }
  uint64_t v6 = [v4 componentDictionary];
  v7 = [v6 objectForKey:@"childType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v7 isEqualToString:@"lockup"])
    {
      uint64_t v8 = 0;
LABEL_11:
      v5->_gridType = v8;
      goto LABEL_12;
    }
    if ([v7 isEqualToString:@"brick"])
    {
      uint64_t v8 = 2;
      goto LABEL_11;
    }
    if ([v7 isEqualToString:@"editorial"])
    {
      uint64_t v8 = 3;
      goto LABEL_11;
    }
    if ([v7 isEqualToString:@"media"])
    {
      uint64_t v8 = 4;
      goto LABEL_11;
    }
  }
LABEL_12:
  long long v9 = [v6 objectForKey:@"ranked"];

  if (objc_opt_respondsToSelector()) {
    v5->_showsIndexNumbers = [v9 BOOLValue];
  }
  long long v10 = [v6 objectForKey:@"editorialStyle"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    SUUIEditorialStyleForDictionary(v10, (uint64_t)&v39);
  }
  else {
    SUUIEditorialStyleDefault((uint64_t)&v39);
  }
  long long v11 = v39;
  long long v12 = v40;
  *(void *)&v5->_editorialStyle.titleFontSize = v41;
  *(_OWORD *)&v5->_editorialStyle.alignment = v11;
  *(_OWORD *)&v5->_editorialStyle.bodyFontSize = v12;
  long long v13 = [v6 objectForKey:@"lockupStyle"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    SUUILockupStyleForDictionary(v13, v4, (uint64_t)&v39);
  }
  else {
    SUUILockupStyleDefault((uint64_t)&v39);
  }
  long long v14 = v39;
  v5->_lockupStyle.visibleFields = v40;
  *(_OWORD *)&v5->_lockupStyle.artworkSize = v14;
  objc_super v15 = [v6 objectForKey:@"children"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v34 = v13;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    children = v5->_children;
    v5->_children = v16;

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v33 = v15;
    id v18 = v15;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          switch(v5->_gridType)
          {
            case 0:
            case 1:
            case 5:
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v24 = [v4 itemForItemIdentifier:v23];
                if (!v24) {
                  goto LABEL_45;
                }
                v25 = [SUUILockupComponent alloc];
                long long v26 = *(_OWORD *)&v5->_lockupStyle.artworkSize;
                *(void *)&long long v40 = v5->_lockupStyle.visibleFields;
                long long v39 = v26;
                v27 = [(SUUILockupComponent *)v25 initWithItem:v24 style:&v39];
                goto LABEL_37;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v24 = (void *)[v4 copy];
                [v24 setComponentDictionary:v23];
                v28 = [[SUUILockupComponent alloc] initWithCustomPageContext:v24];
                if (v28)
                {
                  id v29 = v4;
                  [(NSMutableArray *)v5->_children addObject:v28];
                  v30 = [(SUUILockupComponent *)v28 editorial];

                  if (v30) {
                    v5->_gridType = 1;
                  }
                  id v4 = v29;
                }
                goto LABEL_44;
              }
              break;
            case 2:
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v24 = (void *)[v4 copy];
                [v24 setComponentDictionary:v23];
                v27 = [[SUUIBrickItem alloc] initWithCustomPageContext:v24];
LABEL_37:
                v28 = (SUUILockupComponent *)v27;
                goto LABEL_43;
              }
              break;
            case 3:
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v24 = (void *)[v4 copy];
                [v24 setComponentDictionary:v23];
                v31 = SUUIEditorialComponent;
                goto LABEL_42;
              }
              break;
            case 4:
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v24 = (void *)[v4 copy];
                [v24 setComponentDictionary:v23];
                v31 = SUUIMediaComponent;
LABEL_42:
                v28 = (SUUILockupComponent *)[[v31 alloc] initWithCustomPageContext:v24];
                if (v28) {
LABEL_43:
                }
                  [(NSMutableArray *)v5->_children addObject:v28];
LABEL_44:

LABEL_45:
              }
              break;
            default:
              continue;
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v20);
    }

    [(SUUIGridComponent *)v5 _reloadMissingItemCount];
    long long v13 = v34;
    objc_super v15 = v33;
  }

LABEL_50:
  return v5;
}

- (SUUIGridComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUUIGridComponent;
  v7 = [(SUUIPageComponent *)&v17 initWithFeaturedContentContext:v6 kind:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    p_editorialStyle = &v7->_editorialStyle;
    SUUIEditorialStyleDefault((uint64_t)&v14);
    long long v10 = v14;
    long long v11 = v15;
    *(void *)&v8->_editorialStyle.titleFontSize = v16;
    *(_OWORD *)&p_editorialStyle->alignment = v10;
    *(_OWORD *)&v8->_editorialStyle.bodyFontSize = v11;
    SUUILockupStyleDefault((uint64_t)&v14);
    long long v12 = v14;
    v8->_lockupStyle.visibleFields = v15;
    *(_OWORD *)&v8->_lockupStyle.artworkSize = v12;
    [(SUUIGridComponent *)v8 _setChildrenWithFeaturedContextContext:v6];
  }

  return v8;
}

- (SUUIGridComponent)initWithGridItems:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SUUIGridComponent;
  v5 = [(SUUIGridComponent *)&v30 init];
  id v6 = v5;
  if (v5)
  {
    p_editorialStyle = &v5->_editorialStyle;
    SUUIEditorialStyleDefault((uint64_t)&v27);
    long long v8 = v27;
    long long v9 = v28;
    *(void *)&v6->_editorialStyle.titleFontSize = v29;
    *(_OWORD *)&p_editorialStyle->alignment = v8;
    *(_OWORD *)&v6->_editorialStyle.bodyFontSize = v9;
    v6->_gridType = 0;
    SUUILockupStyleDefault((uint64_t)&v27);
    long long v10 = v27;
    v6->_lockupStyle.visibleFields = v28;
    *(_OWORD *)&v6->_lockupStyle.artworkSize = v10;
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v12 = v4;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          long long v18 = *(_OWORD *)&v6->_lockupStyle.artworkSize;
          *(void *)&long long v28 = v6->_lockupStyle.visibleFields;
          long long v27 = v18;
          id v19 = -[SUUIGridComponent _newLockupComponentWithItem:defaultStyle:](v6, "_newLockupComponentWithItem:defaultStyle:", v17, &v27, (void)v23);
          [v11 addObject:v19];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v14);
    }

    uint64_t v20 = [v11 mutableCopy];
    children = v6->_children;
    v6->_children = (NSMutableArray *)v20;

    [(SUUIGridComponent *)v6 _reloadMissingItemCount];
  }

  return v6;
}

- (SUUIGridComponent)initWithLockups:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SUUIGridComponent;
  v5 = [(SUUIGridComponent *)&v27 init];
  id v6 = v5;
  if (v5)
  {
    p_editorialStyle = &v5->_editorialStyle;
    SUUIEditorialStyleDefault((uint64_t)&v24);
    long long v8 = v24;
    long long v9 = v25;
    *(void *)&v6->_editorialStyle.titleFontSize = v26;
    *(_OWORD *)&p_editorialStyle->alignment = v8;
    *(_OWORD *)&v6->_editorialStyle.bodyFontSize = v9;
    v6->_gridType = 0;
    SUUILockupStyleDefault((uint64_t)&v24);
    long long v10 = v24;
    v6->_lockupStyle.visibleFields = v25;
    *(_OWORD *)&v6->_lockupStyle.artworkSize = v10;
    uint64_t v11 = [v4 mutableCopy];
    children = v6->_children;
    v6->_children = (NSMutableArray *)v11;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v13 = v6->_children;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "editorial", (void)v20);

          if (v18)
          {
            v6->_gridType = 1;
            goto LABEL_12;
          }
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    [(SUUIGridComponent *)v6 _reloadMissingItemCount];
  }

  return v6;
}

- (SUUIGridComponent)initWithRoomContext:(id)a3 gridType:(int64_t)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUUIGridComponent;
  v7 = [(SUUIGridComponent *)&v17 init];
  long long v8 = v7;
  if (v7)
  {
    p_editorialStyle = &v7->_editorialStyle;
    SUUIEditorialStyleDefault((uint64_t)&v14);
    long long v10 = v14;
    long long v11 = v15;
    *(void *)&v8->_editorialStyle.titleFontSize = v16;
    *(_OWORD *)&p_editorialStyle->alignment = v10;
    *(_OWORD *)&v8->_editorialStyle.bodyFontSize = v11;
    v8->_gridType = a4;
    SUUILockupStyleDefault((uint64_t)&v14);
    long long v12 = v14;
    v8->_lockupStyle.visibleFields = v15;
    *(_OWORD *)&v8->_lockupStyle.artworkSize = v12;
    if (v8->_gridType == 5)
    {
      v8->_lockupStyle.artworkSize = 1;
      v8->_lockupStyle.visibleFields = 1054;
    }
    [(SUUIGridComponent *)v8 _setChildrenWithFeaturedContextContext:v6];
  }

  return v8;
}

- (SUUIGridComponent)initWithViewElement:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIGridComponent;
  result = [(SUUIPageComponent *)&v4 initWithViewElement:a3];
  if (result) {
    result->_gridType = 6;
  }
  return result;
}

- (int64_t)componentType
{
  return 8;
}

- (void)enumerateMissingItemIdentifiersFromIndex:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  unint64_t gridType = self->_gridType;
  if (gridType >= 2)
  {
    if (gridType != 2) {
      goto LABEL_6;
    }
    id v9 = v6;
    id v6 = (id)[(SUUIPageComponent *)self _enumerateMissingItemIdentifiersFromBricks:self->_children startIndex:a3 usingBlock:v6];
  }
  else
  {
    id v9 = v6;
    id v6 = (id)[(SUUIPageComponent *)self _enumerateMissingItemIdentifiersFromLockups:self->_children startIndex:a3 usingBlock:v6];
  }
  id v7 = v9;
LABEL_6:
  MEMORY[0x270F9A758](v6, v7);
}

- (BOOL)isMissingItemData
{
  return self->_missingItemCount > 0;
}

- (id)metricsElementName
{
  return @"grid";
}

- (id)_updateWithInvalidItemIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F089C8]);
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __55__SUUIGridComponent__updateWithInvalidItemIdentifiers___block_invoke;
  long long v14 = &unk_265406CE8;
  id v6 = v4;
  id v15 = v6;
  id v7 = v5;
  id v16 = v7;
  [(SUUIGridComponent *)self enumerateMissingItemIdentifiersFromIndex:0 usingBlock:&v11];
  if (objc_msgSend(v7, "count", v11, v12, v13, v14))
  {
    [(NSMutableArray *)self->_children removeObjectsAtIndexes:v7];
    self->_missingItemCount -= [v7 count];
  }
  long long v8 = v16;
  id v9 = v7;

  return v9;
}

uint64_t __55__SUUIGridComponent__updateWithInvalidItemIdentifiers___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
  if (result)
  {
    id v6 = *(void **)(a1 + 40);
    return [v6 addIndex:a3];
  }
  return result;
}

- (id)_updateWithMissingItems:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F089C8]);
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  SUUILockupStyleDefault((uint64_t)&v17);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__SUUIGridComponent__updateWithMissingItems___block_invoke;
  v11[3] = &unk_265409348;
  id v12 = v4;
  uint64_t v13 = self;
  id v6 = v5;
  id v14 = v6;
  long long v15 = v17;
  uint64_t v16 = v18;
  id v7 = v4;
  [(SUUIGridComponent *)self enumerateMissingItemIdentifiersFromIndex:0 usingBlock:v11];
  long long v8 = v14;
  id v9 = v6;

  return v9;
}

void __45__SUUIGridComponent__updateWithMissingItems___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) objectForKey:a2];
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    unint64_t v7 = *(void *)(v6 + 72);
    if (v7 < 2)
    {
      long long v8 = [*(id *)(v6 + 24) objectAtIndex:a3];
      [v8 _setItem:v5];
      long long v13 = 0uLL;
      uint64_t v14 = 0;
      if (v8) {
        [v8 lockupStyle];
      }
      if ([v5 itemKind] == 17)
      {
        long long v11 = *(_OWORD *)(a1 + 56);
        uint64_t v12 = *(void *)(a1 + 72);
        long long v9 = v13;
        uint64_t v10 = v14;
        if (SUUILockupStyleEqualToLockupStyle(&v11, &v9))
        {
          uint64_t v14 = 214;
          long long v11 = v13;
          uint64_t v12 = 214;
          [v8 _setLockupStyle:&v11];
        }
      }
      goto LABEL_10;
    }
    if (v7 == 2)
    {
      long long v8 = [*(id *)(v6 + 24) objectAtIndex:a3];
      [v8 _setLinkItem:v5];
LABEL_10:
      [*(id *)(a1 + 48) addIndex:a3];
      --*(void *)(*(void *)(a1 + 40) + 104);
    }
  }
}

- (id)_newLockupComponentWithItem:(id)a3 defaultStyle:(SUUILockupStyle *)a4
{
  id v5 = a3;
  if ([v5 itemKind] == 17) {
    a4->unint64_t visibleFields = 214;
  }
  uint64_t v6 = [SUUILockupComponent alloc];
  long long v9 = *(_OWORD *)&a4->artworkSize;
  unint64_t visibleFields = a4->visibleFields;
  unint64_t v7 = [(SUUILockupComponent *)v6 initWithItem:v5 style:&v9];

  return v7;
}

- (void)_reloadMissingItemCount
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  self->_missingItemCount = 0;
  unint64_t gridType = self->_gridType;
  if (gridType >= 2)
  {
    if (gridType != 2) {
      return;
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = self->_children;
    uint64_t v11 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v4);
          }
          long long v15 = [*(id *)(*((void *)&v21 + 1) + 8 * i) link];
          if (([v15 isActionable] & 1) == 0)
          {
            uint64_t v16 = [v15 itemIdentifier];

            if (v16) {
              ++self->_missingItemCount;
            }
          }
        }
        uint64_t v12 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = self->_children;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v6; ++j)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = *(void **)(*((void *)&v17 + 1) + 8 * j);
          uint64_t v10 = objc_msgSend(v9, "item", (void)v17);
          if (v10)
          {
          }
          else if ([v9 itemIdentifier])
          {
            ++self->_missingItemCount;
          }
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v6);
    }
  }
}

- (void)_setChildrenWithFeaturedContextContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 componentDictionary];
  uint64_t v6 = [v5 objectForKey:@"adamIds"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v26 = v5;
    uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v8 = 24;
    children = self->_children;
    self->_children = v7;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v25 = v6;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (!v11) {
      goto LABEL_16;
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v30;
    while (1)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v16 = [v4 itemForItemIdentifier:v15];
          if (v16)
          {
            long long v27 = *(_OWORD *)&self->_lockupStyle.artworkSize;
            unint64_t visibleFields = self->_lockupStyle.visibleFields;
            long long v17 = [(SUUIGridComponent *)self _newLockupComponentWithItem:v16 defaultStyle:&v27];
            goto LABEL_12;
          }
          if (([v4 isUnavailableItemIdentifier:v15] & 1) == 0)
          {
            id v18 = v10;
            id v19 = v4;
            uint64_t v20 = v8;
            long long v21 = [SUUILockupComponent alloc];
            uint64_t v22 = [v15 longLongValue];
            long long v27 = *(_OWORD *)&self->_lockupStyle.artworkSize;
            unint64_t visibleFields = self->_lockupStyle.visibleFields;
            long long v23 = v21;
            uint64_t v8 = v20;
            id v4 = v19;
            id v10 = v18;
            long long v17 = [(SUUILockupComponent *)v23 initWithItemIdentifier:v22 style:&v27];
LABEL_12:
            long long v24 = v17;
            objc_msgSend(*(id *)((char *)&self->super.super.isa + v8), "addObject:", v17, v25);
          }
          continue;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (!v12)
      {
LABEL_16:

        [(SUUIGridComponent *)self _reloadMissingItemCount];
        uint64_t v6 = v25;
        uint64_t v5 = v26;
        break;
      }
    }
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@: %lu children", objc_opt_class(), -[NSMutableArray count](self->_children, "count")];
}

- (NSArray)children
{
  return &self->_children->super;
}

- (int64_t)gridType
{
  return self->_gridType;
}

- (SUUILockupStyle)lockupStyle
{
  *retstr = *(SUUILockupStyle *)((char *)self + 80);
  return self;
}

- (BOOL)showsIndexNumbers
{
  return self->_showsIndexNumbers;
}

- (SUUIEditorialStyle)editorialStyle
{
  long long v3 = *(_OWORD *)&self[1].bodyFontWeight;
  *(_OWORD *)&retstr->alignment = *(_OWORD *)&self->titleFontSize;
  *(_OWORD *)&retstr->bodyFontSize = v3;
  *(void *)&retstr->titleFontSize = self[1].titleFontWeight;
  return self;
}

- (void).cxx_destruct
{
}

@end