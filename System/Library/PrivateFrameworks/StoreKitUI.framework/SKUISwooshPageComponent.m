@interface SKUISwooshPageComponent
- (BOOL)_isBrickAvailable:(id)a3 withPageContext:(id)a4;
- (BOOL)isMissingItemData;
- (BOOL)showsBrickTitles;
- (BOOL)showsIndexNumbers;
- (BOOL)showsMediaTitles;
- (NSArray)bricks;
- (NSArray)lockups;
- (NSArray)mediaComponents;
- (NSString)platformKeyProfile;
- (NSString)seeAllTitle;
- (NSString)title;
- (NSURL)seeAllURL;
- (SKUILockupStyle)_lockupStyleWithLockups:(SEL)a3;
- (SKUILockupStyle)lockupStyle;
- (SKUISwooshPageComponent)initWithCustomPageContext:(id)a3;
- (SKUISwooshPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4;
- (SKUISwooshPageComponent)initWithItemList:(id)a3;
- (SKUISwooshPageComponent)initWithLockups:(id)a3 swooshType:(int64_t)a4 title:(id)a5;
- (SKUISwooshPageComponent)initWithRelatedContentContext:(id)a3;
- (SKUISwooshPageComponent)initWithRoomContext:(id)a3;
- (id)_brickItemsWithChildren:(id)a3 customPageContext:(id)a4;
- (id)_brickItemsWithChildren:(id)a3 featuredPageContext:(id)a4;
- (id)_lockupWithItemIdentifier:(id)a3 context:(id)a4;
- (id)_lockupsWithChildren:(id)a3 context:(id)a4;
- (id)_lockupsWithChildren:(id)a3 featuredPageContext:(id)a4;
- (id)_mediaComponentsWithChildren:(id)a3 context:(id)a4;
- (id)_newLockupComponentWithItem:(id)a3 defaultStyle:(SKUILockupStyle *)a4;
- (id)_updateLockupItemsWithItems:(id)a3;
- (id)metricsElementName;
- (id)valueForMetricsField:(id)a3;
- (int64_t)componentType;
- (int64_t)seeAllStyle;
- (int64_t)swooshType;
- (unint64_t)_defaultVisibleFieldsForItemKind:(int64_t)a3;
- (void)_reloadMissingDataCount;
- (void)_setSeeAllValuesWithLinkInfo:(id)a3;
- (void)_updateBricksWithItems:(id)a3;
- (void)_updateLockup:(id)a3 withItem:(id)a4;
- (void)_updateLockupItemsWithLookupResponse:(id)a3;
- (void)enumerateMissingItemIdentifiersFromIndex:(int64_t)a3 usingBlock:(id)a4;
@end

@implementation SKUISwooshPageComponent

- (SKUISwooshPageComponent)initWithCustomPageContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISwooshPageComponent initWithCustomPageContext:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v34.receiver = self;
  v34.super_class = (Class)SKUISwooshPageComponent;
  v13 = [(SKUIPageComponent *)&v34 initWithCustomPageContext:v4];
  if (v13)
  {
    v14 = [v4 componentDictionary];
    v15 = [v14 objectForKey:@"childType"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    if ([v15 isEqualToString:@"brick"])
    {
      uint64_t v16 = 1;
    }
    else
    {
      if (![v15 isEqualToString:@"media"]) {
        goto LABEL_12;
      }
      uint64_t v16 = 2;
    }
    v13->_int64_t swooshType = v16;
LABEL_12:
    v17 = [v14 objectForKey:@"showBrickTitles"];

    if (objc_opt_respondsToSelector())
    {
      v18 = v17;
    }
    else
    {
      v18 = [v14 objectForKey:@"showItemTitles"];

      v17 = v18;
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_16;
      }
    }
    v13->_showsItemTitles = [v17 BOOLValue];
LABEL_16:
    v19 = [v14 objectForKey:@"lockupStyle"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      SKUILockupStyleForDictionary(v19, v4, (uint64_t)&v32);
    }
    else {
      SKUILockupStyleDefault((uint64_t)&v32);
    }
    long long v20 = v32;
    v13->_lockupStyle.visibleFields = v33;
    *(_OWORD *)&v13->_lockupStyle.artworkSize = v20;
    v21 = [v14 objectForKey:@"title"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v22 = [v21 copy];
      title = v13->_title;
      v13->_title = (NSString *)v22;
    }
    v24 = [v14 objectForKey:@"titleIsLink"];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v24 BOOLValue]) {
      v13->_seeAllStyle = 1;
    }
    v25 = [v14 objectForKey:@"link"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SKUISwooshPageComponent *)v13 _setSeeAllValuesWithLinkInfo:v25];
    }
    v26 = [v14 objectForKey:@"children"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_34;
    }
    int64_t swooshType = v13->_swooshType;
    if (swooshType)
    {
      if (swooshType == 2)
      {
        uint64_t v28 = [(SKUISwooshPageComponent *)v13 _mediaComponentsWithChildren:v26 context:v4];
        uint64_t v29 = 72;
      }
      else
      {
        if (swooshType != 1)
        {
LABEL_34:
          [(SKUISwooshPageComponent *)v13 _reloadMissingDataCount];

          goto LABEL_35;
        }
        uint64_t v28 = [(SKUISwooshPageComponent *)v13 _brickItemsWithChildren:v26 customPageContext:v4];
        uint64_t v29 = 24;
      }
    }
    else
    {
      uint64_t v28 = [(SKUISwooshPageComponent *)v13 _lockupsWithChildren:v26 context:v4];
      uint64_t v29 = 40;
    }
    v30 = *(Class *)((char *)&v13->super.super.isa + v29);
    *(Class *)((char *)&v13->super.super.isa + v29) = (Class)v28;

    goto LABEL_34;
  }
LABEL_35:

  return v13;
}

- (SKUISwooshPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUISwooshPageComponent initWithFeaturedContentContext:kind:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v39.receiver = self;
  v39.super_class = (Class)SKUISwooshPageComponent;
  v15 = [(SKUIPageComponent *)&v39 initWithFeaturedContentContext:v6 kind:a4];
  if (v15)
  {
    uint64_t v16 = [v6 componentDictionary];
    if (a4 == 261) {
      v15->_int64_t swooshType = 1;
    }
    v15->_fcKind = a4;
    SKUILockupStyleDefault((uint64_t)&v37);
    long long v17 = v37;
    v15->_lockupStyle.visibleFields = v38;
    *(_OWORD *)&v15->_lockupStyle.artworkSize = v17;
    v18 = [v6 platformKeyProfileOverrides];
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v15->_fcKind);
    long long v20 = [v18 objectForKey:v19];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v21 = [v20 copy];
      platformKeyProfile = v15->_platformKeyProfile;
      v15->_platformKeyProfile = (NSString *)v21;
    }
    v23 = [v16 objectForKey:@"name"];
    if (!v23)
    {
      v23 = [v16 objectForKey:@"title"];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v24 = [v23 copy];
      title = v15->_title;
      v15->_title = (NSString *)v24;
    }
    v26 = [v16 objectForKey:@"titleIsLink"];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v26 BOOLValue]) {
      v15->_seeAllStyle = 1;
    }
    v27 = [v16 objectForKey:@"seeAllUrl"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v28 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v27];
      seeAllURL = v15->_seeAllURL;
      v15->_seeAllURL = (NSURL *)v28;
    }
    v30 = [v16 objectForKey:@"showBrickTitles"];

    if (objc_opt_respondsToSelector()) {
      v15->_showsItemTitles = [v30 BOOLValue];
    }
    v31 = [v16 objectForKey:@"children"];
    if (!v31)
    {
      v31 = [v16 objectForKey:@"adamIds"];
      if (!v31)
      {
        v31 = [v16 objectForKey:@"content"];
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_30;
    }
    int64_t swooshType = v15->_swooshType;
    if (swooshType)
    {
      if (swooshType != 1)
      {
LABEL_30:
        [(SKUISwooshPageComponent *)v15 _reloadMissingDataCount];

        goto LABEL_31;
      }
      uint64_t v33 = [(SKUISwooshPageComponent *)v15 _brickItemsWithChildren:v31 featuredPageContext:v6];
      uint64_t v34 = 24;
    }
    else
    {
      uint64_t v33 = [(SKUISwooshPageComponent *)v15 _lockupsWithChildren:v31 featuredPageContext:v6];
      uint64_t v34 = 40;
    }
    v35 = *(Class *)((char *)&v15->super.super.isa + v34);
    *(Class *)((char *)&v15->super.super.isa + v34) = (Class)v33;

    goto LABEL_30;
  }
LABEL_31:

  return v15;
}

- (SKUISwooshPageComponent)initWithItemList:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISwooshPageComponent initWithItemList:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v42.receiver = self;
  v42.super_class = (Class)SKUISwooshPageComponent;
  uint64_t v13 = [(SKUISwooshPageComponent *)&v42 init];
  uint64_t v14 = v13;
  if (v13)
  {
    v13->_int64_t swooshType = 0;
    p_lockupStyle = &v13->_lockupStyle;
    SKUILockupStyleDefault((uint64_t)&v40);
    long long v16 = v40;
    v14->_lockupStyle.unint64_t visibleFields = visibleFields;
    *(_OWORD *)&p_lockupStyle->artworkSize = v16;
    uint64_t v17 = [v4 seeAllTitle];
    seeAllTitle = v14->_seeAllTitle;
    v14->_seeAllTitle = (NSString *)v17;

    uint64_t v19 = [v4 title];
    title = v14->_title;
    v14->_title = (NSString *)v19;

    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v22 = [v4 items];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v37;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v36 + 1) + 8 * v26);
          long long v28 = *(_OWORD *)&p_lockupStyle->artworkSize;
          unint64_t visibleFields = v14->_lockupStyle.visibleFields;
          long long v40 = v28;
          id v29 = [(SKUISwooshPageComponent *)v14 _newLockupComponentWithItem:v27 defaultStyle:&v40];
          [v21 addObject:v29];

          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v24);
    }
    uint64_t v30 = [v21 copy];
    lockups = v14->_lockups;
    v14->_lockups = (NSArray *)v30;

    long long v32 = [v4 seeAllURLString];
    if (v32)
    {
      uint64_t v33 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v32];
      seeAllURL = v14->_seeAllURL;
      v14->_seeAllURL = (NSURL *)v33;
    }
    [(SKUISwooshPageComponent *)v14 _reloadMissingDataCount];
  }
  return v14;
}

- (SKUISwooshPageComponent)initWithLockups:(id)a3 swooshType:(int64_t)a4 title:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUISwooshPageComponent initWithLockups:swooshType:title:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)SKUISwooshPageComponent;
  v18 = [(SKUISwooshPageComponent *)&v26 init];
  if (v18)
  {
    uint64_t v19 = [v8 copy];
    lockups = v18->_lockups;
    v18->_lockups = (NSArray *)v19;

    v18->_int64_t swooshType = a4;
    [(SKUISwooshPageComponent *)v18 _lockupStyleWithLockups:v18->_lockups];
    v18->_lockupStyle.unint64_t visibleFields = v25;
    *(_OWORD *)&v18->_lockupStyle.artworkSize = v24;
    uint64_t v21 = [v9 copy];
    title = v18->_title;
    v18->_title = (NSString *)v21;

    [(SKUISwooshPageComponent *)v18 _reloadMissingDataCount];
  }

  return v18;
}

- (SKUISwooshPageComponent)initWithRelatedContentContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISwooshPageComponent initWithRelatedContentContext:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)SKUISwooshPageComponent;
  uint64_t v13 = [(SKUISwooshPageComponent *)&v27 init];
  if (v13)
  {
    uint64_t v14 = [v4 componentDictionary];
    v13->_int64_t swooshType = 0;
    SKUILockupStyleDefault((uint64_t)&v25);
    long long v15 = v25;
    v13->_lockupStyle.unint64_t visibleFields = v26;
    *(_OWORD *)&v13->_lockupStyle.artworkSize = v15;
    uint64_t v16 = [v14 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = [v16 copy];
      title = v13->_title;
      v13->_title = (NSString *)v17;
    }
    uint64_t v19 = [v14 objectForKey:@"titleIsLink"];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v19 BOOLValue]) {
      v13->_seeAllStyle = 1;
    }
    long long v20 = [v14 objectForKey:@"link"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SKUISwooshPageComponent *)v13 _setSeeAllValuesWithLinkInfo:v20];
    }
    uint64_t v21 = [v14 objectForKey:@"childrenIds"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v21 count])
    {
      uint64_t v22 = [(SKUISwooshPageComponent *)v13 _lockupsWithChildren:v21 context:v4];
      lockups = v13->_lockups;
      v13->_lockups = (NSArray *)v22;
    }
    [(SKUISwooshPageComponent *)v13 _reloadMissingDataCount];
  }
  return v13;
}

- (SKUISwooshPageComponent)initWithRoomContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISwooshPageComponent initWithRoomContext:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v27.receiver = self;
  v27.super_class = (Class)SKUISwooshPageComponent;
  uint64_t v13 = [(SKUIPageComponent *)&v27 initWithFeaturedContentContext:v4 kind:260];
  if (v13)
  {
    uint64_t v14 = [v4 componentDictionary];
    v13->_int64_t swooshType = 0;
    SKUILockupStyleDefault((uint64_t)&v25);
    long long v15 = v25;
    v13->_lockupStyle.unint64_t visibleFields = v26;
    *(_OWORD *)&v13->_lockupStyle.artworkSize = v15;
    uint64_t v16 = [v14 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = [v16 copy];
      title = v13->_title;
      v13->_title = (NSString *)v17;
    }
    uint64_t v19 = [v14 objectForKey:@"titleIsLink"];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v19 BOOLValue]) {
      v13->_seeAllStyle = 1;
    }
    long long v20 = [v14 objectForKey:@"seeAllUrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SKUISwooshPageComponent *)v13 _setSeeAllValuesWithLinkInfo:v20];
    }
    uint64_t v21 = [v14 objectForKey:@"adamIds"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v21 count])
    {
      uint64_t v22 = [(SKUISwooshPageComponent *)v13 _lockupsWithChildren:v21 context:v4];
      lockups = v13->_lockups;
      v13->_lockups = (NSArray *)v22;
    }
    [(SKUISwooshPageComponent *)v13 _reloadMissingDataCount];
  }
  return v13;
}

- (BOOL)isMissingItemData
{
  return self->_missingDataCount > 0;
}

- (BOOL)showsBrickTitles
{
  return self->_showsItemTitles;
}

- (BOOL)showsMediaTitles
{
  return self->_showsItemTitles;
}

- (int64_t)componentType
{
  return 15;
}

- (void)enumerateMissingItemIdentifiersFromIndex:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  lockups = self->_lockups;
  if (lockups)
  {
    id v10 = v6;
    id v6 = (id)[(SKUIPageComponent *)self _enumerateMissingItemIdentifiersFromLockups:lockups startIndex:a3 usingBlock:v6];
  }
  else
  {
    bricks = self->_bricks;
    if (!bricks) {
      goto LABEL_6;
    }
    id v10 = v6;
    id v6 = (id)[(SKUIPageComponent *)self _enumerateMissingItemIdentifiersFromBricks:bricks startIndex:a3 usingBlock:v6];
  }
  id v7 = v10;
LABEL_6:

  MEMORY[0x1F41817F8](v6, v7);
}

- (id)metricsElementName
{
  return @"swoosh";
}

- (id)valueForMetricsField:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:*MEMORY[0x1E4FA88A0]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x1E4FA88A8]])
  {
    uint64_t v5 = [(SKUISwooshPageComponent *)self title];
    goto LABEL_4;
  }
  if ([v4 isEqualToString:*MEMORY[0x1E4FA8898]])
  {
    uint64_t v5 = [NSNumber numberWithInteger:self->_fcKind];
LABEL_4:
    id v6 = (void *)v5;
    if (v5) {
      goto LABEL_9;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)SKUISwooshPageComponent;
  id v6 = [(SKUIPageComponent *)&v8 valueForMetricsField:v4];
LABEL_9:

  return v6;
}

- (void)_updateBricksWithItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_bricks;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "link", (void)v15);
        if (([v11 isActionable] & 1) == 0)
        {
          uint64_t v12 = [v11 itemIdentifier];
          if (v12)
          {
            uint64_t v13 = [v4 objectForKey:v12];
            if (v13)
            {
              uint64_t v14 = (void *)v13;
              [v10 _setLinkItem:v13];
              --self->_missingDataCount;
            }
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (id)_updateLockupItemsWithItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v14 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_lockups;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v10 _needsItemData])
        {
          uint64_t v11 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", objc_msgSend(v10, "itemIdentifier"));
          uint64_t v12 = [v4 objectForKey:v11];
          if (v12)
          {
            [(SKUISwooshPageComponent *)self _updateLockup:v10 withItem:v12];
            [v14 addObject:v10];
            --self->_missingDataCount;
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v14;
}

- (void)_updateLockupItemsWithLookupResponse:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_lockups;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v9 _needsItemData])
        {
          id v10 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", objc_msgSend(v9, "itemIdentifier"));
          uint64_t v11 = [v15 itemForKey:v10];
          if (v11)
          {
            uint64_t v12 = [SKUIItem alloc];
            uint64_t v13 = [v11 lookupDictionary];
            id v14 = [(SKUIItem *)v12 initWithLookupDictionary:v13];

            [(SKUISwooshPageComponent *)self _updateLockup:v9 withItem:v14];
            --self->_missingDataCount;
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (id)_brickItemsWithChildren:(id)a3 customPageContext:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v17 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = (void *)[v7 copy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
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
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v8 setComponentDictionary:v14];
          id v15 = [[SKUIBrickItem alloc] initWithCustomPageContext:v8];
          if (v15
            && [(SKUISwooshPageComponent *)self _isBrickAvailable:v15 withPageContext:v7])
          {
            [v17 addObject:v15];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v17;
}

- (id)_brickItemsWithChildren:(id)a3 featuredPageContext:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v17 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = (void *)[v7 copy];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
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
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v8 setComponentDictionary:v14];
          id v15 = [[SKUIBrickItem alloc] initWithComponentContext:v8];
          if (v15
            && [(SKUISwooshPageComponent *)self _isBrickAvailable:v15 withPageContext:v7])
          {
            [v17 addObject:v15];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v17;
}

- (unint64_t)_defaultVisibleFieldsForItemKind:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 4:
    case 5:
    case 10:
    case 12:
    case 13:
    case 17:
    case 18:
      uint64_t v8 = v3;
      uint64_t v9 = v4;
      SKUILockupStyleDefault((uint64_t)v6);
      unint64_t result = v7;
      break;
    case 1:
    case 2:
    case 3:
    case 7:
    case 8:
    case 9:
    case 11:
    case 16:
      unint64_t result = 19;
      break;
    case 6:
      unint64_t result = 18;
      break;
    case 14:
    case 15:
      unint64_t result = 530;
      break;
    default:
      unint64_t result = 0;
      break;
  }
  return result;
}

- (BOOL)_isBrickAvailable:(id)a3 withPageContext:(id)a4
{
  id v5 = a4;
  id v6 = [a3 link];
  unint64_t v7 = v6;
  if (v6)
  {
    if ([v6 isActionable])
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      uint64_t v9 = [v7 itemIdentifier];
      if (v9) {
        int v8 = [v5 isUnavailableItemIdentifier:v9] ^ 1;
      }
      else {
        LOBYTE(v8) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (SKUILockupStyle)_lockupStyleWithLockups:(SEL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  retstr->layoutStyle = 0;
  retstr->unint64_t visibleFields = 0;
  retstr->artworkSize = 0;
  SKUILockupStyleDefault((uint64_t)retstr);
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "item", (void)v16);
        uint64_t v14 = v13;
        if (v13) {
          objc_msgSend(v7, "addIndex:", -[SKUISwooshPageComponent _defaultVisibleFieldsForItemKind:](self, "_defaultVisibleFieldsForItemKind:", objc_msgSend(v13, "itemKind")));
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  if ([v7 count] == 1) {
    retstr->unint64_t visibleFields = [v7 firstIndex];
  }

  return result;
}

- (id)_lockupsWithChildren:(id)a3 context:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = -[SKUISwooshPageComponent _lockupWithItemIdentifier:context:](self, "_lockupWithItemIdentifier:context:", v14, v7, (void)v17);
          if (v15) {
            [v8 addObject:v15];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)_lockupsWithChildren:(id)a3 featuredPageContext:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v17 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = [v12 objectForKey:@"adamId"];
LABEL_10:
          uint64_t v14 = v13;
          goto LABEL_12;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          goto LABEL_10;
        }
        uint64_t v14 = 0;
LABEL_12:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = [(SKUISwooshPageComponent *)self _lockupWithItemIdentifier:v14 context:v6];
          if (v15) {
            [v17 addObject:v15];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  return v17;
}

- (id)_lockupWithItemIdentifier:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 itemForItemIdentifier:v6];
  if (v8)
  {
    long long v14 = *(_OWORD *)&self->_lockupStyle.artworkSize;
    unint64_t visibleFields = self->_lockupStyle.visibleFields;
    uint64_t v9 = [(SKUISwooshPageComponent *)self _newLockupComponentWithItem:v8 defaultStyle:&v14];
  }
  else
  {
    if ([v7 isUnavailableItemIdentifier:v6])
    {
      uint64_t v10 = 0;
      goto LABEL_7;
    }
    uint64_t v11 = [SKUILockupComponent alloc];
    uint64_t v12 = [v6 longLongValue];
    long long v14 = *(_OWORD *)&self->_lockupStyle.artworkSize;
    unint64_t visibleFields = self->_lockupStyle.visibleFields;
    uint64_t v9 = [(SKUILockupComponent *)v11 initWithItemIdentifier:v12 style:&v14];
  }
  uint64_t v10 = v9;
LABEL_7:

  return v10;
}

- (id)_mediaComponentsWithChildren:(id)a3 context:(id)a4
{
  id v4 = a4;
  id v5 = [[SKUIGalleryPageComponent alloc] initWithCustomPageContext:v4];

  id v6 = [(SKUIGalleryPageComponent *)v5 childComponents];

  return v6;
}

- (id)_newLockupComponentWithItem:(id)a3 defaultStyle:(SKUILockupStyle *)a4
{
  id v5 = a3;
  if ([v5 itemKind] == 17) {
    a4->unint64_t visibleFields = 150;
  }
  id v6 = [SKUILockupComponent alloc];
  long long v9 = *(_OWORD *)&a4->artworkSize;
  unint64_t visibleFields = a4->visibleFields;
  id v7 = [(SKUILockupComponent *)v6 initWithItem:v5 style:&v9];

  return v7;
}

- (void)_reloadMissingDataCount
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  self->_missingDataCount = 0;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v3 = self->_bricks;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v19 + 1) + 8 * v7) link];
        if (([v8 isActionable] & 1) == 0)
        {
          long long v9 = [v8 itemIdentifier];

          if (v9) {
            ++self->_missingDataCount;
          }
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_lockups;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        if (objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14), "_needsItemData", (void)v15)) {
          ++self->_missingDataCount;
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)_setSeeAllValuesWithLinkInfo:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 objectForKey:@"label"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (NSString *)[v4 copy];
    seeAllTitle = self->_seeAllTitle;
    self->_seeAllTitle = v5;
  }
  uint64_t v7 = [v10 objectForKey:@"url"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v7];
    seeAllURL = self->_seeAllURL;
    self->_seeAllURL = v8;
  }
}

- (void)_updateLockup:(id)a3 withItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v10 = 0uLL;
  uint64_t v11 = 0;
  if (v5) {
    [v5 lockupStyle];
  }
  if ([v6 itemKind] == 17)
  {
    SKUILockupStyleDefault((uint64_t)v9);
    long long v7 = v10;
    uint64_t v8 = v11;
    if (SKUILockupStyleEqualToLockupStyle(v9, &v7))
    {
      uint64_t v11 = 150;
      long long v7 = v10;
      uint64_t v8 = 150;
      [v5 _setLockupStyle:&v7];
    }
  }
  [v5 _setItem:v6];
}

- (NSArray)bricks
{
  return self->_bricks;
}

- (NSArray)lockups
{
  return self->_lockups;
}

- (SKUILockupStyle)lockupStyle
{
  *retstr = self[2];
  return self;
}

- (NSArray)mediaComponents
{
  return self->_mediaComponents;
}

- (NSString)platformKeyProfile
{
  return self->_platformKeyProfile;
}

- (int64_t)seeAllStyle
{
  return self->_seeAllStyle;
}

- (NSString)seeAllTitle
{
  return self->_seeAllTitle;
}

- (NSURL)seeAllURL
{
  return self->_seeAllURL;
}

- (BOOL)showsIndexNumbers
{
  return self->_showsIndexNumbers;
}

- (int64_t)swooshType
{
  return self->_swooshType;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_seeAllURL, 0);
  objc_storeStrong((id *)&self->_seeAllTitle, 0);
  objc_storeStrong((id *)&self->_platformKeyProfile, 0);
  objc_storeStrong((id *)&self->_mediaComponents, 0);
  objc_storeStrong((id *)&self->_lockups, 0);

  objc_storeStrong((id *)&self->_bricks, 0);
}

- (void)initWithCustomPageContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithFeaturedContentContext:(uint64_t)a3 kind:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithItemList:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithLockups:(uint64_t)a3 swooshType:(uint64_t)a4 title:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithRelatedContentContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithRoomContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end