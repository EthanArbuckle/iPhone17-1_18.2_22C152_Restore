@interface SUUIViewElementTextLayoutCache
- (CGSize)_bestGuessSizeForButton:(id)a3 width:(double)a4;
- (CGSize)_bestGuessSizeForLabel:(id)a3 width:(double)a4;
- (CGSize)_bestGuessSizeForOrdinal:(id)a3 width:(double)a4;
- (CGSize)estimatedSizeForButton:(id)a3 width:(double)a4;
- (CGSize)estimatedSizeForLabel:(id)a3 width:(double)a4;
- (CGSize)estimatedSizeForOrdinal:(id)a3 width:(double)a4;
- (CGSize)sizeForButton:(id)a3 width:(double)a4;
- (CGSize)sizeForLabel:(id)a3 width:(double)a4;
- (CGSize)sizeForViewElement:(id)a3 width:(double)a4;
- (SUUILayoutCache)layoutCache;
- (SUUIViewElementTextLayoutCache)initWithLayoutCache:(id)a3;
- (id)_bestGuessCache;
- (id)_createLayoutRequestForBadge:(id)a3 width:(int64_t)a4;
- (id)_createLayoutRequestForButton:(id)a3 attributedString:(id)a4 width:(int64_t)a5;
- (id)_createLayoutRequestForLabel:(id)a3 attributedString:(id)a4 width:(int64_t)a5;
- (id)_createLayoutRequestForViewElement:(id)a3 attributedString:(id)a4 width:(int64_t)a5;
- (id)_existingLayoutForViewElement:(id)a3 width:(int64_t)a4;
- (id)_layoutIndexForViewElement:(id)a3 width:(int64_t)a4;
- (id)layoutForWidth:(int64_t)a3 viewElement:(id)a4;
- (void)_addRequest:(id)a3 forViewElement:(id)a4;
- (void)invalidateLayoutsForUpdatedElements;
- (void)requestLayoutForBadge:(id)a3 width:(int64_t)a4;
- (void)requestLayoutForButton:(id)a3 attributedString:(id)a4 width:(int64_t)a5;
- (void)requestLayoutForLabel:(id)a3 attributedString:(id)a4 width:(int64_t)a5;
- (void)requestLayoutForOrdinal:(id)a3 attributedString:(id)a4 width:(int64_t)a5;
- (void)requestLayoutForViewElement:(id)a3 attributedString:(id)a4 width:(int64_t)a5;
@end

@implementation SUUIViewElementTextLayoutCache

- (SUUIViewElementTextLayoutCache)initWithLayoutCache:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIViewElementTextLayoutCache;
  v6 = [(SUUIViewElementTextLayoutCache *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_layoutCache, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    layoutMapTables = v7->_layoutMapTables;
    v7->_layoutMapTables = v8;
  }
  return v7;
}

- (CGSize)estimatedSizeForButton:(id)a3 width:(double)a4
{
  id v6 = a3;
  v7 = [(SUUIViewElementTextLayoutCache *)self _existingLayoutForViewElement:v6 width:(uint64_t)a4];
  v8 = v7;
  if (v7) {
    [v7 boundingSize];
  }
  else {
    [(SUUIViewElementTextLayoutCache *)self _bestGuessSizeForButton:v6 width:a4];
  }
  double v11 = v9;
  double v12 = v10;

  double v13 = v11;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)estimatedSizeForLabel:(id)a3 width:(double)a4
{
  id v6 = a3;
  v7 = [(SUUIViewElementTextLayoutCache *)self _existingLayoutForViewElement:v6 width:(uint64_t)a4];
  if (v7)
  {
    v8 = [v6 trailingBadges];
    if ([v8 count])
    {
      double v9 = (void *)estimatedSizeForLabel_width__sSizingView;
      if (!estimatedSizeForLabel_width__sSizingView)
      {
        double v10 = objc_alloc_init(SUUIAttributedStringView);
        double v11 = (void *)estimatedSizeForLabel_width__sSizingView;
        estimatedSizeForLabel_width__sSizingView = (uint64_t)v10;

        double v9 = (void *)estimatedSizeForLabel_width__sSizingView;
      }
      [v9 setLayout:v7];
      double v12 = (void *)estimatedSizeForLabel_width__sSizingView;
      double v13 = [v6 trailingBadges];
      [v12 setRequiredBadges:v13];

      BOOL v14 = [v6 badgePlacement] == 1;
      [(id)estimatedSizeForLabel_width__sSizingView setBadgePlacement:v14];
      objc_msgSend((id)estimatedSizeForLabel_width__sSizingView, "sizeThatFits:", a4, 1.79769313e308);
      double v17 = v16;
      if (v15 < a4) {
        a4 = v15;
      }
    }
    else
    {
      [v7 boundingSize];
      a4 = v20;
      double v17 = v21;
    }
  }
  else
  {
    [(SUUIViewElementTextLayoutCache *)self _bestGuessSizeForLabel:v6 width:a4];
    a4 = v18;
    double v17 = v19;
  }

  double v22 = a4;
  double v23 = v17;
  result.height = v23;
  result.width = v22;
  return result;
}

- (CGSize)estimatedSizeForOrdinal:(id)a3 width:(double)a4
{
  id v6 = a3;
  v7 = [(SUUIViewElementTextLayoutCache *)self _existingLayoutForViewElement:v6 width:(uint64_t)a4];
  v8 = v7;
  if (v7) {
    [v7 boundingSize];
  }
  else {
    [(SUUIViewElementTextLayoutCache *)self _bestGuessSizeForOrdinal:v6 width:a4];
  }
  double v11 = v9;
  double v12 = v10;

  double v13 = v11;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)invalidateLayoutsForUpdatedElements
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  layoutMapTables = self->_layoutMapTables;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__SUUIViewElementTextLayoutCache_invalidateLayoutsForUpdatedElements__block_invoke;
  v8[3] = &unk_2654082A0;
  id v5 = (NSMutableDictionary *)v3;
  double v9 = v5;
  [(NSMutableDictionary *)layoutMapTables enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = self->_layoutMapTables;
  self->_layoutMapTables = v5;
  v7 = v5;
}

void __69__SUUIViewElementTextLayoutCache_invalidateLayoutsForUpdatedElements__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (!objc_msgSend(v13, "updateType", (void)v15))
        {
          double v14 = [v8 objectForKey:v13];
          [v7 setObject:v14 forKey:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [*(id *)(a1 + 32) setObject:v7 forKey:v5];
}

- (id)layoutForWidth:(int64_t)a3 viewElement:(id)a4
{
  return [(SUUIViewElementTextLayoutCache *)self _existingLayoutForViewElement:a4 width:a3];
}

- (void)requestLayoutForBadge:(id)a3 width:(int64_t)a4
{
  id v6 = a3;
  id v5 = -[SUUIViewElementTextLayoutCache _createLayoutRequestForBadge:width:](self, "_createLayoutRequestForBadge:width:");
  if (v5) {
    [(SUUIViewElementTextLayoutCache *)self _addRequest:v5 forViewElement:v6];
  }
}

- (void)requestLayoutForButton:(id)a3 attributedString:(id)a4 width:(int64_t)a5
{
  id v7 = a3;
  id v6 = -[SUUIViewElementTextLayoutCache _createLayoutRequestForButton:attributedString:width:](self, "_createLayoutRequestForButton:attributedString:width:");
  if (v6) {
    [(SUUIViewElementTextLayoutCache *)self _addRequest:v6 forViewElement:v7];
  }
}

- (void)requestLayoutForLabel:(id)a3 attributedString:(id)a4 width:(int64_t)a5
{
  id v7 = a3;
  id v6 = -[SUUIViewElementTextLayoutCache _createLayoutRequestForLabel:attributedString:width:](self, "_createLayoutRequestForLabel:attributedString:width:");
  if (v6) {
    [(SUUIViewElementTextLayoutCache *)self _addRequest:v6 forViewElement:v7];
  }
}

- (void)requestLayoutForOrdinal:(id)a3 attributedString:(id)a4 width:(int64_t)a5
{
  id v7 = a3;
  id v6 = -[SUUIViewElementTextLayoutCache _createLayoutRequestForOrdinal:attributedString:width:](self, "_createLayoutRequestForOrdinal:attributedString:width:");
  if (v6) {
    [(SUUIViewElementTextLayoutCache *)self _addRequest:v6 forViewElement:v7];
  }
}

- (void)requestLayoutForViewElement:(id)a3 attributedString:(id)a4 width:(int64_t)a5
{
  id v7 = a3;
  id v6 = -[SUUIViewElementTextLayoutCache _createLayoutRequestForViewElement:attributedString:width:](self, "_createLayoutRequestForViewElement:attributedString:width:");
  if (v6) {
    [(SUUIViewElementTextLayoutCache *)self _addRequest:v6 forViewElement:v7];
  }
}

- (CGSize)sizeForButton:(id)a3 width:(double)a4
{
  id v6 = a3;
  id v7 = [(SUUIViewElementTextLayoutCache *)self _layoutIndexForViewElement:v6 width:(uint64_t)a4];
  id v8 = v7;
  if (v7
    && (-[SUUILayoutCache layoutForIndex:forced:](self->_layoutCache, "layoutForIndex:forced:", [v7 integerValue], 1), (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v10 = v9;
    [v9 boundingSize];
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    [(SUUIViewElementTextLayoutCache *)self _bestGuessSizeForButton:v6 width:a4];
    double v12 = v15;
    double v14 = v16;
  }

  double v17 = v12;
  double v18 = v14;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)sizeForLabel:(id)a3 width:(double)a4
{
  id v6 = a3;
  id v7 = [(SUUIViewElementTextLayoutCache *)self _layoutIndexForViewElement:v6 width:(uint64_t)a4];
  id v8 = v7;
  if (v7
    && (-[SUUILayoutCache layoutForIndex:forced:](self->_layoutCache, "layoutForIndex:forced:", [v7 integerValue], 1), (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v10 = v9;
    [v9 boundingSize];
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    [(SUUIViewElementTextLayoutCache *)self _bestGuessSizeForLabel:v6 width:a4];
    double v12 = v15;
    double v14 = v16;
  }

  double v17 = v12;
  double v18 = v14;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)sizeForViewElement:(id)a3 width:(double)a4
{
  id v5 = [(SUUIViewElementTextLayoutCache *)self _layoutIndexForViewElement:a3 width:(uint64_t)a4];
  id v6 = v5;
  if (v5
    && (-[SUUILayoutCache layoutForIndex:forced:](self->_layoutCache, "layoutForIndex:forced:", [v5 integerValue], 1), (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = v7;
    [v7 boundingSize];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v10 = *MEMORY[0x263F001B0];
    double v12 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_addRequest:(id)a3 forViewElement:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  [v25 width];
  uint64_t v8 = (uint64_t)v7;
  double v9 = [(SUUIViewElementTextLayoutCache *)self _existingLayoutForViewElement:v6 width:(uint64_t)v7];

  if (!v9)
  {
    double v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", v25, 0);
    uint64_t v11 = [(SUUILayoutCache *)self->_layoutCache addLayoutRequests:v10];
    double v12 = (void *)[objc_alloc(NSNumber) initWithInteger:v11];
    double v13 = (void *)[objc_alloc(NSNumber) initWithInteger:v8];
    double v14 = [(NSMutableDictionary *)self->_layoutMapTables objectForKey:v13];
    if (!v14)
    {
      double v14 = (void *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
      [(NSMutableDictionary *)self->_layoutMapTables setObject:v14 forKey:v13];
    }
    double v15 = [v6 uniquingMapKey];
    double v16 = [v14 objectForKey:v6];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v17 = v16;
    }
    else {
      double v17 = 0;
    }
    id v18 = v17;
    if (v18) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v15 == 0;
    }
    if (v19)
    {
      id v21 = v18;
      if (!v15)
      {
        if (v18)
        {
          uint64_t v20 = [MEMORY[0x263EFF9D0] null];
          [v21 setObject:v12 forKey:v20];
        }
        else
        {
          [v14 setObject:v12 forKey:v6];
        }
        goto LABEL_19;
      }
    }
    else
    {
      id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v22 = v16;
      double v23 = v22;
      if (v22)
      {
        v24 = [MEMORY[0x263EFF9D0] null];
        [v21 setObject:v23 forKey:v24];
      }
      [v14 setObject:v21 forKey:v6];
    }
    [v21 setObject:v12 forKey:v15];

LABEL_19:
  }
}

- (id)_bestGuessCache
{
  v2 = (void *)_bestGuessCache_bestGuessCache;
  if (!_bestGuessCache_bestGuessCache)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF8E0]);
    v4 = (void *)_bestGuessCache_bestGuessCache;
    _bestGuessCache_bestGuessCache = (uint64_t)v3;

    [(id)_bestGuessCache_bestGuessCache setCountLimit:1000];
    v2 = (void *)_bestGuessCache_bestGuessCache;
  }
  return v2;
}

- (CGSize)_bestGuessSizeForButton:(id)a3 width:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 elementType];
  if (v7 == 141 || v7 == 12)
  {
    double v9 = [v6 buttonTitleStyle];
    double v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v6 style];
    }
    double v14 = v11;

    double v15 = SUUIViewElementFontWithStyle(v14);
    if (!v15)
    {
      double v15 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    }
    double v16 = objc_alloc_init(_SUUIViewElementTextLayoutCacheBestGuessCacheKey);
    double v17 = [v6 buttonText];
    id v18 = [v17 string];
    [(_SUUIViewElementTextLayoutCacheBestGuessCacheKey *)v16 setText:v18];

    [(_SUUIViewElementTextLayoutCacheBestGuessCacheKey *)v16 setFont:v15];
    [(_SUUIViewElementTextLayoutCacheBestGuessCacheKey *)v16 setWidth:(uint64_t)a4];
    BOOL v19 = [(SUUIViewElementTextLayoutCache *)self _bestGuessCache];
    uint64_t v20 = [v19 objectForKey:v16];

    if (v20)
    {
      [v20 CGSizeValue];
      double v12 = v21;
      double v13 = v22;
    }
    else
    {
      uint64_t v23 = SUUIViewElementAlignmentForStyle(v14);
      if (v23) {
        uint64_t v24 = SUUIViewElementNSTextAlignmentForIKElementAlignment(v23);
      }
      else {
        uint64_t v24 = 0;
      }
      id v25 = [v6 buttonText];
      v26 = [v25 attributedStringWithDefaultFont:v15 foregroundColor:0 textAlignment:v24 style:v14];

      v27 = [(SUUIViewElementTextLayoutCache *)self _createLayoutRequestForButton:v6 attributedString:v26 width:(uint64_t)a4];
      v28 = [[SUUIAttributedStringLayout alloc] initWithLayoutRequest:v27];
      [(SUUIAttributedStringLayout *)v28 boundingSize];
      double v12 = v29;
      double v13 = v30;
      uint64_t v20 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:");
      v31 = [(SUUIViewElementTextLayoutCache *)self _bestGuessCache];
      [v31 setObject:v20 forKey:v16];
    }
  }
  else
  {
    double v12 = *MEMORY[0x263F001B0];
    double v13 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v32 = v12;
  double v33 = v13;
  result.height = v33;
  result.width = v32;
  return result;
}

- (CGSize)_bestGuessSizeForLabel:(id)a3 width:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 style];
  uint64_t v8 = SUUIViewElementFontWithStyle(v7);

  double v9 = objc_alloc_init(_SUUIViewElementTextLayoutCacheBestGuessCacheKey);
  double v10 = [v6 text];
  id v11 = [v10 string];
  [(_SUUIViewElementTextLayoutCacheBestGuessCacheKey *)v9 setText:v11];

  [(_SUUIViewElementTextLayoutCacheBestGuessCacheKey *)v9 setFont:v8];
  [(_SUUIViewElementTextLayoutCacheBestGuessCacheKey *)v9 setWidth:(uint64_t)a4];
  double v12 = [(SUUIViewElementTextLayoutCache *)self _bestGuessCache];
  double v13 = [v12 objectForKey:v9];

  if (v13)
  {
    [v13 CGSizeValue];
    double v15 = v14;
    double v17 = v16;
  }
  else
  {
    id v18 = [v6 text];
    BOOL v19 = [v6 style];
    uint64_t v20 = [v18 attributedStringWithDefaultFont:v8 foregroundColor:0 style:v19];

    double v21 = [(SUUIViewElementTextLayoutCache *)self _createLayoutRequestForLabel:v6 attributedString:v20 width:(uint64_t)a4];
    double v22 = [[SUUIAttributedStringLayout alloc] initWithLayoutRequest:v21];
    [(SUUIAttributedStringLayout *)v22 boundingSize];
    double v15 = v23;
    double v17 = v24;
    double v13 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:");
    id v25 = [(SUUIViewElementTextLayoutCache *)self _bestGuessCache];
    [v25 setObject:v13 forKey:v9];
  }
  double v26 = v15;
  double v27 = v17;
  result.height = v27;
  result.width = v26;
  return result;
}

- (CGSize)_bestGuessSizeForOrdinal:(id)a3 width:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 style];
  uint64_t v8 = SUUIViewElementFontWithStyle(v7);

  if (!v8)
  {
    double v9 = SUUIFontForTextStyle(25);
    double v10 = (void *)MEMORY[0x263F81708];
    [v9 pointSize];
    uint64_t v8 = objc_msgSend(v10, "_lightSystemFontOfSize:");
  }
  id v11 = objc_alloc_init(_SUUIViewElementTextLayoutCacheBestGuessCacheKey);
  double v12 = [v6 text];
  double v13 = [v12 string];
  [(_SUUIViewElementTextLayoutCacheBestGuessCacheKey *)v11 setText:v13];

  [(_SUUIViewElementTextLayoutCacheBestGuessCacheKey *)v11 setFont:v8];
  [(_SUUIViewElementTextLayoutCacheBestGuessCacheKey *)v11 setWidth:(uint64_t)a4];
  double v14 = [(SUUIViewElementTextLayoutCache *)self _bestGuessCache];
  double v15 = [v14 objectForKey:v11];

  if (v15)
  {
    [v15 CGSizeValue];
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    uint64_t v20 = [v6 text];
    double v21 = [v20 attributedStringWithDefaultFont:v8 foregroundColor:0];

    double v22 = [(SUUIViewElementTextLayoutCache *)self _createLayoutRequestForOrdinal:v6 attributedString:v21 width:(uint64_t)a4];
    double v23 = [[SUUIAttributedStringLayout alloc] initWithLayoutRequest:v22];
    [(SUUIAttributedStringLayout *)v23 boundingSize];
    double v17 = v24;
    double v19 = v25;
    double v15 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:");
    double v26 = [(SUUIViewElementTextLayoutCache *)self _bestGuessCache];
    [v26 setObject:v15 forKey:v11];
  }
  double v27 = v17;
  double v28 = v19;
  result.height = v28;
  result.width = v27;
  return result;
}

- (id)_createLayoutRequestForBadge:(id)a3 width:(int64_t)a4
{
  id v5 = a3;
  if ([v5 badgeType] == 1
    && ([v5 attributedString], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = [[SUUIAttributedStringLayoutRequest alloc] initWithAttributedString:v6];
    [(SUUIAttributedStringLayoutRequest *)v8 setNumberOfLines:1];
    [(SUUIAttributedStringLayoutRequest *)v8 setWantsBaselineOffset:1];
    [(SUUIAttributedStringLayoutRequest *)v8 setWidth:(double)a4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_createLayoutRequestForButton:(id)a3 attributedString:(id)a4 width:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [[SUUIAttributedStringLayoutRequest alloc] initWithAttributedString:v8];

  [(SUUIAttributedStringLayoutRequest *)v9 setWidth:(double)a5];
  if ([v7 buttonViewType] == 9)
  {
    [(SUUIAttributedStringLayoutRequest *)v9 setNumberOfLines:2];
  }
  else
  {
    double v10 = [v7 style];
    id v11 = [v10 valueForStyle:*MEMORY[0x263F4B3A0]];
    if (objc_opt_respondsToSelector()) {
      uint64_t v12 = [v11 integerValue];
    }
    else {
      uint64_t v12 = 1;
    }
    [(SUUIAttributedStringLayoutRequest *)v9 setNumberOfLines:v12];
    [(SUUIAttributedStringLayoutRequest *)v9 setWantsBaselineOffset:1];
  }
  return v9;
}

- (id)_createLayoutRequestForLabel:(id)a3 attributedString:(id)a4 width:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [[SUUIAttributedStringLayoutRequest alloc] initWithAttributedString:v8];

  double v10 = [v7 style];
  uint64_t v11 = [v10 maxTextLines];
  if (!v10 || (uint64_t v12 = v11, v11 == -1)) {
    uint64_t v12 = [v7 numberOfLines];
  }
  [(SUUIAttributedStringLayoutRequest *)v9 setNumberOfLines:v12];
  [(SUUIAttributedStringLayoutRequest *)v9 setWantsBaselineOffset:1];
  [(SUUIAttributedStringLayoutRequest *)v9 setWidth:(double)a5];

  return v9;
}

- (id)_createLayoutRequestForViewElement:(id)a3 attributedString:(id)a4 width:(int64_t)a5
{
  id v6 = a4;
  id v7 = [[SUUIAttributedStringLayoutRequest alloc] initWithAttributedString:v6];

  [(SUUIAttributedStringLayoutRequest *)v7 setNumberOfLines:1];
  [(SUUIAttributedStringLayoutRequest *)v7 setWantsBaselineOffset:1];
  [(SUUIAttributedStringLayoutRequest *)v7 setWidth:(double)a5];
  return v7;
}

- (id)_existingLayoutForViewElement:(id)a3 width:(int64_t)a4
{
  id v5 = [(SUUIViewElementTextLayoutCache *)self _layoutIndexForViewElement:a3 width:a4];
  id v6 = v5;
  if (v5)
  {
    id v7 = -[SUUILayoutCache layoutForIndex:](self->_layoutCache, "layoutForIndex:", [v5 integerValue]);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_layoutIndexForViewElement:(id)a3 width:(int64_t)a4
{
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithInteger:a4];
  double v9 = [(NSMutableDictionary *)self->_layoutMapTables objectForKey:v8];
  double v10 = [v7 uniquingMapKey];
  uint64_t v11 = [v9 objectForKey:v7];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;
  double v14 = v13;
  if (v10)
  {
    id v15 = [v13 objectForKey:v10];
  }
  else
  {
    if (v13)
    {
      double v17 = [MEMORY[0x263EFF9D0] null];
      double v16 = [v14 objectForKey:v17];

      goto LABEL_9;
    }
    id v15 = v11;
  }
  double v16 = v15;
LABEL_9:
  id v18 = v16;

  return v18;
}

- (SUUILayoutCache)layoutCache
{
  return self->_layoutCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutMapTables, 0);
  objc_storeStrong((id *)&self->_layoutCache, 0);
}

@end