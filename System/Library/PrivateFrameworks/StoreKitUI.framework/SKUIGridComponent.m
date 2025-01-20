@interface SKUIGridComponent
- (BOOL)isMissingItemData;
- (BOOL)showsIndexNumbers;
- (NSArray)children;
- (SKUIEditorialStyle)editorialStyle;
- (SKUIGridComponent)initWithBrickItems:(id)a3;
- (SKUIGridComponent)initWithCustomPageContext:(id)a3;
- (SKUIGridComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4;
- (SKUIGridComponent)initWithGridItems:(id)a3;
- (SKUIGridComponent)initWithLockups:(id)a3;
- (SKUIGridComponent)initWithRoomContext:(id)a3 gridType:(int64_t)a4;
- (SKUIGridComponent)initWithViewElement:(id)a3;
- (SKUILockupStyle)lockupStyle;
- (id)_newLockupComponentWithItem:(id)a3 defaultStyle:(SKUILockupStyle *)a4;
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

@implementation SKUIGridComponent

- (SKUIGridComponent)initWithBrickItems:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGridComponent initWithBrickItems:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)SKUIGridComponent;
  v13 = [(SKUIGridComponent *)&v23 init];
  if (v13)
  {
    uint64_t v14 = [v4 mutableCopy];
    children = v13->_children;
    v13->_children = (NSMutableArray *)v14;

    SKUIEditorialStyleDefault((uint64_t)&v20);
    long long v16 = v20;
    long long v17 = v21;
    *(void *)&v13->_editorialStyle.titleFontSize = v22;
    *(_OWORD *)&v13->_editorialStyle.alignment = v16;
    *(_OWORD *)&v13->_editorialStyle.bodyFontSize = v17;
    v13->_gridType = 2;
    SKUILockupStyleDefault((uint64_t)&v20);
    long long v18 = v20;
    v13->_lockupStyle.visibleFields = v21;
    *(_OWORD *)&v13->_lockupStyle.artworkSize = v18;
    [(SKUIGridComponent *)v13 _reloadMissingItemCount];
  }

  return v13;
}

- (SKUIGridComponent)initWithCustomPageContext:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGridComponent initWithCustomPageContext:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v50.receiver = self;
  v50.super_class = (Class)SKUIGridComponent;
  v13 = [(SKUIPageComponent *)&v50 initWithCustomPageContext:v4];
  if (v13)
  {
    uint64_t v14 = [v4 componentDictionary];
    v15 = [v14 objectForKey:@"childType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v15 isEqualToString:@"lockup"])
      {
        uint64_t v16 = 0;
LABEL_15:
        v13->_gridType = v16;
        goto LABEL_16;
      }
      if ([v15 isEqualToString:@"brick"])
      {
        uint64_t v16 = 2;
        goto LABEL_15;
      }
      if ([v15 isEqualToString:@"editorial"])
      {
        uint64_t v16 = 3;
        goto LABEL_15;
      }
      if ([v15 isEqualToString:@"media"])
      {
        uint64_t v16 = 4;
        goto LABEL_15;
      }
    }
LABEL_16:
    long long v17 = [v14 objectForKey:@"ranked"];

    if (objc_opt_respondsToSelector()) {
      v13->_showsIndexNumbers = [v17 BOOLValue];
    }
    long long v18 = [v14 objectForKey:@"editorialStyle"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      SKUIEditorialStyleForDictionary(v18, (uint64_t)&v47);
    }
    else {
      SKUIEditorialStyleDefault((uint64_t)&v47);
    }
    long long v19 = v47;
    long long v20 = v48;
    *(void *)&v13->_editorialStyle.titleFontSize = v49;
    *(_OWORD *)&v13->_editorialStyle.alignment = v19;
    *(_OWORD *)&v13->_editorialStyle.bodyFontSize = v20;
    long long v21 = [v14 objectForKey:@"lockupStyle"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      SKUILockupStyleForDictionary(v21, v4, (uint64_t)&v47);
    }
    else {
      SKUILockupStyleDefault((uint64_t)&v47);
    }
    long long v22 = v47;
    v13->_lockupStyle.visibleFields = v48;
    *(_OWORD *)&v13->_lockupStyle.artworkSize = v22;
    objc_super v23 = [v14 objectForKey:@"children"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = v21;
      v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      children = v13->_children;
      v13->_children = v24;

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      v41 = v23;
      id v26 = v23;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v44 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v43 + 1) + 8 * i);
            switch(v13->_gridType)
            {
              case 0:
              case 1:
              case 5:
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v32 = [v4 itemForItemIdentifier:v31];
                  if (!v32) {
                    goto LABEL_49;
                  }
                  v33 = [SKUILockupComponent alloc];
                  long long v34 = *(_OWORD *)&v13->_lockupStyle.artworkSize;
                  *(void *)&long long v48 = v13->_lockupStyle.visibleFields;
                  long long v47 = v34;
                  v35 = [(SKUILockupComponent *)v33 initWithItem:v32 style:&v47];
                  goto LABEL_41;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v32 = (void *)[v4 copy];
                  [v32 setComponentDictionary:v31];
                  v36 = [[SKUILockupComponent alloc] initWithCustomPageContext:v32];
                  if (v36)
                  {
                    id v37 = v4;
                    [(NSMutableArray *)v13->_children addObject:v36];
                    v38 = [(SKUILockupComponent *)v36 editorial];

                    if (v38) {
                      v13->_gridType = 1;
                    }
                    id v4 = v37;
                  }
                  goto LABEL_48;
                }
                break;
              case 2:
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v32 = (void *)[v4 copy];
                  [v32 setComponentDictionary:v31];
                  v35 = [[SKUIBrickItem alloc] initWithCustomPageContext:v32];
LABEL_41:
                  v36 = (SKUILockupComponent *)v35;
                  goto LABEL_47;
                }
                break;
              case 3:
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v32 = (void *)[v4 copy];
                  [v32 setComponentDictionary:v31];
                  v39 = SKUIEditorialComponent;
                  goto LABEL_46;
                }
                break;
              case 4:
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v32 = (void *)[v4 copy];
                  [v32 setComponentDictionary:v31];
                  v39 = SKUIMediaComponent;
LABEL_46:
                  v36 = (SKUILockupComponent *)[[v39 alloc] initWithCustomPageContext:v32];
                  if (v36) {
LABEL_47:
                  }
                    [(NSMutableArray *)v13->_children addObject:v36];
LABEL_48:

LABEL_49:
                }
                break;
              default:
                continue;
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v43 objects:v51 count:16];
        }
        while (v28);
      }

      [(SKUIGridComponent *)v13 _reloadMissingItemCount];
      long long v21 = v42;
      objc_super v23 = v41;
    }
  }
  return v13;
}

- (SKUIGridComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIGridComponent initWithFeaturedContentContext:kind:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)SKUIGridComponent;
  v15 = [(SKUIPageComponent *)&v25 initWithFeaturedContentContext:v6 kind:a4];
  uint64_t v16 = v15;
  if (v15)
  {
    p_editorialStyle = &v15->_editorialStyle;
    SKUIEditorialStyleDefault((uint64_t)&v22);
    long long v18 = v22;
    long long v19 = v23;
    *(void *)&v16->_editorialStyle.titleFontSize = v24;
    *(_OWORD *)&p_editorialStyle->alignment = v18;
    *(_OWORD *)&v16->_editorialStyle.bodyFontSize = v19;
    SKUILockupStyleDefault((uint64_t)&v22);
    long long v20 = v22;
    v16->_lockupStyle.visibleFields = v23;
    *(_OWORD *)&v16->_lockupStyle.artworkSize = v20;
    [(SKUIGridComponent *)v16 _setChildrenWithFeaturedContextContext:v6];
  }

  return v16;
}

- (SKUIGridComponent)initWithGridItems:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGridComponent initWithGridItems:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v38.receiver = self;
  v38.super_class = (Class)SKUIGridComponent;
  uint64_t v13 = [(SKUIGridComponent *)&v38 init];
  uint64_t v14 = v13;
  if (v13)
  {
    p_editorialStyle = &v13->_editorialStyle;
    SKUIEditorialStyleDefault((uint64_t)&v35);
    long long v16 = v35;
    long long v17 = v36;
    *(void *)&v14->_editorialStyle.titleFontSize = v37;
    *(_OWORD *)&p_editorialStyle->alignment = v16;
    *(_OWORD *)&v14->_editorialStyle.bodyFontSize = v17;
    v14->_gridType = 0;
    SKUILockupStyleDefault((uint64_t)&v35);
    long long v18 = v35;
    v14->_lockupStyle.visibleFields = v36;
    *(_OWORD *)&v14->_lockupStyle.artworkSize = v18;
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v20 = v4;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          long long v26 = *(_OWORD *)&v14->_lockupStyle.artworkSize;
          *(void *)&long long v36 = v14->_lockupStyle.visibleFields;
          long long v35 = v26;
          id v27 = -[SKUIGridComponent _newLockupComponentWithItem:defaultStyle:](v14, "_newLockupComponentWithItem:defaultStyle:", v25, &v35, (void)v31);
          [v19 addObject:v27];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v22);
    }

    uint64_t v28 = [v19 mutableCopy];
    children = v14->_children;
    v14->_children = (NSMutableArray *)v28;

    [(SKUIGridComponent *)v14 _reloadMissingItemCount];
  }

  return v14;
}

- (SKUIGridComponent)initWithLockups:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGridComponent initWithLockups:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v35.receiver = self;
  v35.super_class = (Class)SKUIGridComponent;
  uint64_t v13 = [(SKUIGridComponent *)&v35 init];
  uint64_t v14 = v13;
  if (v13)
  {
    p_editorialStyle = &v13->_editorialStyle;
    SKUIEditorialStyleDefault((uint64_t)&v32);
    long long v16 = v32;
    long long v17 = v33;
    *(void *)&v14->_editorialStyle.titleFontSize = v34;
    *(_OWORD *)&p_editorialStyle->alignment = v16;
    *(_OWORD *)&v14->_editorialStyle.bodyFontSize = v17;
    v14->_gridType = 0;
    SKUILockupStyleDefault((uint64_t)&v32);
    long long v18 = v32;
    v14->_lockupStyle.visibleFields = v33;
    *(_OWORD *)&v14->_lockupStyle.artworkSize = v18;
    uint64_t v19 = [v4 mutableCopy];
    children = v14->_children;
    v14->_children = (NSMutableArray *)v19;

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v21 = v14->_children;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          long long v26 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "editorial", (void)v28);

          if (v26)
          {
            v14->_gridType = 1;
            goto LABEL_16;
          }
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
LABEL_16:

    [(SKUIGridComponent *)v14 _reloadMissingItemCount];
  }

  return v14;
}

- (SKUIGridComponent)initWithRoomContext:(id)a3 gridType:(int64_t)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIGridComponent initWithRoomContext:gridType:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)SKUIGridComponent;
  v15 = [(SKUIGridComponent *)&v25 init];
  long long v16 = v15;
  if (v15)
  {
    p_editorialStyle = &v15->_editorialStyle;
    SKUIEditorialStyleDefault((uint64_t)&v22);
    long long v18 = v22;
    long long v19 = v23;
    *(void *)&v16->_editorialStyle.titleFontSize = v24;
    *(_OWORD *)&p_editorialStyle->alignment = v18;
    *(_OWORD *)&v16->_editorialStyle.bodyFontSize = v19;
    v16->_gridType = a4;
    SKUILockupStyleDefault((uint64_t)&v22);
    long long v20 = v22;
    v16->_lockupStyle.visibleFields = v23;
    *(_OWORD *)&v16->_lockupStyle.artworkSize = v20;
    if (v16->_gridType == 5)
    {
      v16->_lockupStyle.artworkSize = 1;
      v16->_lockupStyle.visibleFields = 1054;
    }
    [(SKUIGridComponent *)v16 _setChildrenWithFeaturedContextContext:v6];
  }

  return v16;
}

- (SKUIGridComponent)initWithViewElement:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGridComponent initWithViewElement:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIGridComponent;
  uint64_t v13 = [(SKUIPageComponent *)&v16 initWithViewElement:v4];
  uint64_t v14 = v13;
  if (v13) {
    v13->_gridType = 6;
  }

  return v14;
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
    id v6 = (id)[(SKUIPageComponent *)self _enumerateMissingItemIdentifiersFromBricks:self->_children startIndex:a3 usingBlock:v6];
  }
  else
  {
    id v9 = v6;
    id v6 = (id)[(SKUIPageComponent *)self _enumerateMissingItemIdentifiersFromLockups:self->_children startIndex:a3 usingBlock:v6];
  }
  id v7 = v9;
LABEL_6:

  MEMORY[0x1F41817F8](v6, v7);
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
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __55__SKUIGridComponent__updateWithInvalidItemIdentifiers___block_invoke;
  uint64_t v14 = &unk_1E6425578;
  id v6 = v4;
  id v15 = v6;
  id v7 = v5;
  id v16 = v7;
  [(SKUIGridComponent *)self enumerateMissingItemIdentifiersFromIndex:0 usingBlock:&v11];
  if (objc_msgSend(v7, "count", v11, v12, v13, v14))
  {
    [(NSMutableArray *)self->_children removeObjectsAtIndexes:v7];
    self->_missingItemCount -= [v7 count];
  }
  uint64_t v8 = v16;
  id v9 = v7;

  return v9;
}

uint64_t __55__SKUIGridComponent__updateWithInvalidItemIdentifiers___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  SKUILockupStyleDefault((uint64_t)&v17);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__SKUIGridComponent__updateWithMissingItems___block_invoke;
  v11[3] = &unk_1E64255A0;
  id v12 = v4;
  uint64_t v13 = self;
  id v6 = v5;
  id v14 = v6;
  long long v15 = v17;
  uint64_t v16 = v18;
  id v7 = v4;
  [(SKUIGridComponent *)self enumerateMissingItemIdentifiersFromIndex:0 usingBlock:v11];
  uint64_t v8 = v14;
  id v9 = v6;

  return v9;
}

void __45__SKUIGridComponent__updateWithMissingItems___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) objectForKey:a2];
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    unint64_t v7 = *(void *)(v6 + 72);
    if (v7 < 2)
    {
      uint64_t v8 = [*(id *)(v6 + 24) objectAtIndex:a3];
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
        if (SKUILockupStyleEqualToLockupStyle(&v11, &v9))
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
      uint64_t v8 = [*(id *)(v6 + 24) objectAtIndex:a3];
      [v8 _setLinkItem:v5];
LABEL_10:
      [*(id *)(a1 + 48) addIndex:a3];
      --*(void *)(*(void *)(a1 + 40) + 104);
    }
  }
}

- (id)_newLockupComponentWithItem:(id)a3 defaultStyle:(SKUILockupStyle *)a4
{
  id v5 = a3;
  if ([v5 itemKind] == 17) {
    a4->unint64_t visibleFields = 214;
  }
  uint64_t v6 = [SKUILockupComponent alloc];
  long long v9 = *(_OWORD *)&a4->artworkSize;
  unint64_t visibleFields = a4->visibleFields;
  unint64_t v7 = [(SKUILockupComponent *)v6 initWithItem:v5 style:&v9];

  return v7;
}

- (void)_reloadMissingItemCount
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
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
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 componentDictionary];
  uint64_t v6 = [v5 objectForKey:@"adamIds"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v26 = v5;
    uint64_t v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = 24;
    children = self->_children;
    self->_children = v7;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    objc_super v25 = v6;
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
            long long v17 = [(SKUIGridComponent *)self _newLockupComponentWithItem:v16 defaultStyle:&v27];
            goto LABEL_12;
          }
          if (([v4 isUnavailableItemIdentifier:v15] & 1) == 0)
          {
            id v18 = v10;
            id v19 = v4;
            uint64_t v20 = v8;
            long long v21 = [SKUILockupComponent alloc];
            uint64_t v22 = [v15 longLongValue];
            long long v27 = *(_OWORD *)&self->_lockupStyle.artworkSize;
            unint64_t visibleFields = self->_lockupStyle.visibleFields;
            long long v23 = v21;
            uint64_t v8 = v20;
            id v4 = v19;
            id v10 = v18;
            long long v17 = [(SKUILockupComponent *)v23 initWithItemIdentifier:v22 style:&v27];
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

        [(SKUIGridComponent *)self _reloadMissingItemCount];
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

- (SKUILockupStyle)lockupStyle
{
  *retstr = *(SKUILockupStyle *)((char *)self + 80);
  return self;
}

- (BOOL)showsIndexNumbers
{
  return self->_showsIndexNumbers;
}

- (SKUIEditorialStyle)editorialStyle
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

- (void)initWithBrickItems:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCustomPageContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithFeaturedContentContext:(uint64_t)a3 kind:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithGridItems:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithLockups:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithRoomContext:(uint64_t)a3 gridType:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end