@interface SUUISwooshPageComponent
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
- (SUUILockupStyle)_lockupStyleWithLockups:(SEL)a3;
- (SUUILockupStyle)lockupStyle;
- (SUUISwooshPageComponent)initWithCustomPageContext:(id)a3;
- (SUUISwooshPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4;
- (SUUISwooshPageComponent)initWithItemList:(id)a3;
- (SUUISwooshPageComponent)initWithLockups:(id)a3 swooshType:(int64_t)a4 title:(id)a5;
- (SUUISwooshPageComponent)initWithRelatedContentContext:(id)a3;
- (SUUISwooshPageComponent)initWithRoomContext:(id)a3;
- (id)_brickItemsWithChildren:(id)a3 customPageContext:(id)a4;
- (id)_brickItemsWithChildren:(id)a3 featuredPageContext:(id)a4;
- (id)_lockupWithItemIdentifier:(id)a3 context:(id)a4;
- (id)_lockupsWithChildren:(id)a3 context:(id)a4;
- (id)_lockupsWithChildren:(id)a3 featuredPageContext:(id)a4;
- (id)_mediaComponentsWithChildren:(id)a3 context:(id)a4;
- (id)_newLockupComponentWithItem:(id)a3 defaultStyle:(SUUILockupStyle *)a4;
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

@implementation SUUISwooshPageComponent

- (SUUISwooshPageComponent)initWithCustomPageContext:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SUUISwooshPageComponent;
  v5 = [(SUUIPageComponent *)&v26 initWithCustomPageContext:v4];
  if (v5)
  {
    v6 = [v4 componentDictionary];
    v7 = [v6 objectForKey:@"childType"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_8;
    }
    if ([v7 isEqualToString:@"brick"])
    {
      uint64_t v8 = 1;
    }
    else
    {
      if (![v7 isEqualToString:@"media"]) {
        goto LABEL_8;
      }
      uint64_t v8 = 2;
    }
    v5->_int64_t swooshType = v8;
LABEL_8:
    v9 = [v6 objectForKey:@"showBrickTitles"];

    if (objc_opt_respondsToSelector())
    {
      v10 = v9;
    }
    else
    {
      v10 = [v6 objectForKey:@"showItemTitles"];

      v9 = v10;
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_12;
      }
    }
    v5->_showsItemTitles = [v9 BOOLValue];
LABEL_12:
    v11 = [v6 objectForKey:@"lockupStyle"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      SUUILockupStyleForDictionary(v11, v4, (uint64_t)&v24);
    }
    else {
      SUUILockupStyleDefault((uint64_t)&v24);
    }
    long long v12 = v24;
    v5->_lockupStyle.visibleFields = v25;
    *(_OWORD *)&v5->_lockupStyle.artworkSize = v12;
    v13 = [v6 objectForKey:@"title"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v14 = [v13 copy];
      title = v5->_title;
      v5->_title = (NSString *)v14;
    }
    v16 = [v6 objectForKey:@"titleIsLink"];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v16 BOOLValue]) {
      v5->_seeAllStyle = 1;
    }
    v17 = [v6 objectForKey:@"link"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUUISwooshPageComponent *)v5 _setSeeAllValuesWithLinkInfo:v17];
    }
    v18 = [v6 objectForKey:@"children"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_30;
    }
    int64_t swooshType = v5->_swooshType;
    if (swooshType)
    {
      if (swooshType == 2)
      {
        uint64_t v20 = [(SUUISwooshPageComponent *)v5 _mediaComponentsWithChildren:v18 context:v4];
        uint64_t v21 = 72;
      }
      else
      {
        if (swooshType != 1)
        {
LABEL_30:
          [(SUUISwooshPageComponent *)v5 _reloadMissingDataCount];

          goto LABEL_31;
        }
        uint64_t v20 = [(SUUISwooshPageComponent *)v5 _brickItemsWithChildren:v18 customPageContext:v4];
        uint64_t v21 = 24;
      }
    }
    else
    {
      uint64_t v20 = [(SUUISwooshPageComponent *)v5 _lockupsWithChildren:v18 context:v4];
      uint64_t v21 = 40;
    }
    v22 = *(Class *)((char *)&v5->super.super.isa + v21);
    *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

    goto LABEL_30;
  }
LABEL_31:

  return v5;
}

- (SUUISwooshPageComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SUUISwooshPageComponent;
  v7 = [(SUUIPageComponent *)&v31 initWithFeaturedContentContext:v6 kind:a4];
  if (v7)
  {
    uint64_t v8 = [v6 componentDictionary];
    if (a4 == 261) {
      v7->_int64_t swooshType = 1;
    }
    v7->_fcKind = a4;
    SUUILockupStyleDefault((uint64_t)&v29);
    long long v9 = v29;
    v7->_lockupStyle.visibleFields = v30;
    *(_OWORD *)&v7->_lockupStyle.artworkSize = v9;
    v10 = [v6 platformKeyProfileOverrides];
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v7->_fcKind);
    long long v12 = [v10 objectForKey:v11];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 copy];
      platformKeyProfile = v7->_platformKeyProfile;
      v7->_platformKeyProfile = (NSString *)v13;
    }
    v15 = [v8 objectForKey:@"name"];
    if (!v15)
    {
      v15 = [v8 objectForKey:@"title"];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v15 copy];
      title = v7->_title;
      v7->_title = (NSString *)v16;
    }
    v18 = [v8 objectForKey:@"titleIsLink"];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v18 BOOLValue]) {
      v7->_seeAllStyle = 1;
    }
    v19 = [v8 objectForKey:@"seeAllUrl"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = [objc_alloc(NSURL) initWithString:v19];
      seeAllURL = v7->_seeAllURL;
      v7->_seeAllURL = (NSURL *)v20;
    }
    v22 = [v8 objectForKey:@"showBrickTitles"];

    if (objc_opt_respondsToSelector()) {
      v7->_showsItemTitles = [v22 BOOLValue];
    }
    v23 = [v8 objectForKey:@"children"];
    if (!v23)
    {
      v23 = [v8 objectForKey:@"adamIds"];
      if (!v23)
      {
        v23 = [v8 objectForKey:@"content"];
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_26;
    }
    int64_t swooshType = v7->_swooshType;
    if (swooshType)
    {
      if (swooshType != 1)
      {
LABEL_26:
        [(SUUISwooshPageComponent *)v7 _reloadMissingDataCount];

        goto LABEL_27;
      }
      uint64_t v25 = [(SUUISwooshPageComponent *)v7 _brickItemsWithChildren:v23 featuredPageContext:v6];
      uint64_t v26 = 24;
    }
    else
    {
      uint64_t v25 = [(SUUISwooshPageComponent *)v7 _lockupsWithChildren:v23 featuredPageContext:v6];
      uint64_t v26 = 40;
    }
    v27 = *(Class *)((char *)&v7->super.super.isa + v26);
    *(Class *)((char *)&v7->super.super.isa + v26) = (Class)v25;

    goto LABEL_26;
  }
LABEL_27:

  return v7;
}

- (SUUISwooshPageComponent)initWithItemList:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SUUISwooshPageComponent;
  v5 = [(SUUISwooshPageComponent *)&v34 init];
  id v6 = v5;
  if (v5)
  {
    v5->_int64_t swooshType = 0;
    p_lockupStyle = &v5->_lockupStyle;
    SUUILockupStyleDefault((uint64_t)&v32);
    long long v8 = v32;
    v6->_lockupStyle.unint64_t visibleFields = visibleFields;
    *(_OWORD *)&p_lockupStyle->artworkSize = v8;
    uint64_t v9 = [v4 seeAllTitle];
    seeAllTitle = v6->_seeAllTitle;
    v6->_seeAllTitle = (NSString *)v9;

    uint64_t v11 = [v4 title];
    title = v6->_title;
    v6->_title = (NSString *)v11;

    id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v14 = [v4 items];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * v18);
          long long v20 = *(_OWORD *)&p_lockupStyle->artworkSize;
          unint64_t visibleFields = v6->_lockupStyle.visibleFields;
          long long v32 = v20;
          id v21 = [(SUUISwooshPageComponent *)v6 _newLockupComponentWithItem:v19 defaultStyle:&v32];
          [v13 addObject:v21];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v16);
    }
    uint64_t v22 = [v13 copy];
    lockups = v6->_lockups;
    v6->_lockups = (NSArray *)v22;

    long long v24 = [v4 seeAllURLString];
    if (v24)
    {
      uint64_t v25 = [objc_alloc(NSURL) initWithString:v24];
      seeAllURL = v6->_seeAllURL;
      v6->_seeAllURL = (NSURL *)v25;
    }
    [(SUUISwooshPageComponent *)v6 _reloadMissingDataCount];
  }
  return v6;
}

- (SUUISwooshPageComponent)initWithLockups:(id)a3 swooshType:(int64_t)a4 title:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SUUISwooshPageComponent;
  v10 = [(SUUISwooshPageComponent *)&v18 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    lockups = v10->_lockups;
    v10->_lockups = (NSArray *)v11;

    v10->_int64_t swooshType = a4;
    [(SUUISwooshPageComponent *)v10 _lockupStyleWithLockups:v10->_lockups];
    v10->_lockupStyle.unint64_t visibleFields = v17;
    *(_OWORD *)&v10->_lockupStyle.artworkSize = v16;
    uint64_t v13 = [v9 copy];
    title = v10->_title;
    v10->_title = (NSString *)v13;

    [(SUUISwooshPageComponent *)v10 _reloadMissingDataCount];
  }

  return v10;
}

- (SUUISwooshPageComponent)initWithRelatedContentContext:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUUISwooshPageComponent;
  v5 = [(SUUISwooshPageComponent *)&v19 init];
  if (v5)
  {
    id v6 = [v4 componentDictionary];
    v5->_int64_t swooshType = 0;
    SUUILockupStyleDefault((uint64_t)&v17);
    long long v7 = v17;
    v5->_lockupStyle.unint64_t visibleFields = v18;
    *(_OWORD *)&v5->_lockupStyle.artworkSize = v7;
    id v8 = [v6 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v8 copy];
      title = v5->_title;
      v5->_title = (NSString *)v9;
    }
    uint64_t v11 = [v6 objectForKey:@"titleIsLink"];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v11 BOOLValue]) {
      v5->_seeAllStyle = 1;
    }
    long long v12 = [v6 objectForKey:@"link"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUUISwooshPageComponent *)v5 _setSeeAllValuesWithLinkInfo:v12];
    }
    uint64_t v13 = [v6 objectForKey:@"childrenIds"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 count])
    {
      uint64_t v14 = [(SUUISwooshPageComponent *)v5 _lockupsWithChildren:v13 context:v4];
      lockups = v5->_lockups;
      v5->_lockups = (NSArray *)v14;
    }
    [(SUUISwooshPageComponent *)v5 _reloadMissingDataCount];
  }
  return v5;
}

- (SUUISwooshPageComponent)initWithRoomContext:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUUISwooshPageComponent;
  v5 = [(SUUIPageComponent *)&v19 initWithFeaturedContentContext:v4 kind:260];
  if (v5)
  {
    id v6 = [v4 componentDictionary];
    v5->_int64_t swooshType = 0;
    SUUILockupStyleDefault((uint64_t)&v17);
    long long v7 = v17;
    v5->_lockupStyle.unint64_t visibleFields = v18;
    *(_OWORD *)&v5->_lockupStyle.artworkSize = v7;
    id v8 = [v6 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v8 copy];
      title = v5->_title;
      v5->_title = (NSString *)v9;
    }
    uint64_t v11 = [v6 objectForKey:@"titleIsLink"];

    if ((objc_opt_respondsToSelector() & 1) != 0 && [v11 BOOLValue]) {
      v5->_seeAllStyle = 1;
    }
    long long v12 = [v6 objectForKey:@"seeAllUrl"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUUISwooshPageComponent *)v5 _setSeeAllValuesWithLinkInfo:v12];
    }
    uint64_t v13 = [v6 objectForKey:@"adamIds"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v13 count])
    {
      uint64_t v14 = [(SUUISwooshPageComponent *)v5 _lockupsWithChildren:v13 context:v4];
      lockups = v5->_lockups;
      v5->_lockups = (NSArray *)v14;
    }
    [(SUUISwooshPageComponent *)v5 _reloadMissingDataCount];
  }
  return v5;
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
    id v6 = (id)[(SUUIPageComponent *)self _enumerateMissingItemIdentifiersFromLockups:lockups startIndex:a3 usingBlock:v6];
  }
  else
  {
    bricks = self->_bricks;
    if (!bricks) {
      goto LABEL_6;
    }
    id v10 = v6;
    id v6 = (id)[(SUUIPageComponent *)self _enumerateMissingItemIdentifiersFromBricks:bricks startIndex:a3 usingBlock:v6];
  }
  id v7 = v10;
LABEL_6:
  MEMORY[0x270F9A758](v6, v7);
}

- (id)metricsElementName
{
  return @"swoosh";
}

- (id)valueForMetricsField:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:*MEMORY[0x263F7BB78]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x263F7BB80]])
  {
    uint64_t v5 = [(SUUISwooshPageComponent *)self title];
    goto LABEL_4;
  }
  if ([v4 isEqualToString:*MEMORY[0x263F7BB70]])
  {
    uint64_t v5 = [NSNumber numberWithInteger:self->_fcKind];
LABEL_4:
    id v6 = (void *)v5;
    if (v5) {
      goto LABEL_9;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)SUUISwooshPageComponent;
  id v6 = [(SUUIPageComponent *)&v8 valueForMetricsField:v4];
LABEL_9:

  return v6;
}

- (void)_updateBricksWithItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
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
          long long v12 = [v11 itemIdentifier];
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
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v14 = [MEMORY[0x263EFF9C0] set];
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
          long long v12 = [v4 objectForKey:v11];
          if (v12)
          {
            [(SUUISwooshPageComponent *)self _updateLockup:v10 withItem:v12];
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
  uint64_t v21 = *MEMORY[0x263EF8340];
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
            long long v12 = [SUUIItem alloc];
            uint64_t v13 = [v11 lookupDictionary];
            id v14 = [(SUUIItem *)v12 initWithLookupDictionary:v13];

            [(SUUISwooshPageComponent *)self _updateLockup:v9 withItem:v14];
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
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v17 = [MEMORY[0x263EFF980] array];
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
          id v15 = [[SUUIBrickItem alloc] initWithCustomPageContext:v8];
          if (v15
            && [(SUUISwooshPageComponent *)self _isBrickAvailable:v15 withPageContext:v7])
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
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v17 = [MEMORY[0x263EFF980] array];
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
          id v15 = [[SUUIBrickItem alloc] initWithComponentContext:v8];
          if (v15
            && [(SUUISwooshPageComponent *)self _isBrickAvailable:v15 withPageContext:v7])
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
      SUUILockupStyleDefault((uint64_t)v6);
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

- (SUUILockupStyle)_lockupStyleWithLockups:(SEL)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a4;
  retstr->layoutStyle = 0;
  retstr->unint64_t visibleFields = 0;
  retstr->artworkSize = 0;
  SUUILockupStyleDefault((uint64_t)retstr);
  id v7 = objc_alloc_init(MEMORY[0x263F089C8]);
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
          objc_msgSend(v7, "addIndex:", -[SUUISwooshPageComponent _defaultVisibleFieldsForItemKind:](self, "_defaultVisibleFieldsForItemKind:", objc_msgSend(v13, "itemKind")));
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
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
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
          id v15 = -[SUUISwooshPageComponent _lockupWithItemIdentifier:context:](self, "_lockupWithItemIdentifier:context:", v14, v7, (void)v17);
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
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v17 = [MEMORY[0x263EFF980] array];
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
          id v15 = [(SUUISwooshPageComponent *)self _lockupWithItemIdentifier:v14 context:v6];
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
    uint64_t v9 = [(SUUISwooshPageComponent *)self _newLockupComponentWithItem:v8 defaultStyle:&v14];
  }
  else
  {
    if ([v7 isUnavailableItemIdentifier:v6])
    {
      uint64_t v10 = 0;
      goto LABEL_7;
    }
    uint64_t v11 = [SUUILockupComponent alloc];
    uint64_t v12 = [v6 longLongValue];
    long long v14 = *(_OWORD *)&self->_lockupStyle.artworkSize;
    unint64_t visibleFields = self->_lockupStyle.visibleFields;
    uint64_t v9 = [(SUUILockupComponent *)v11 initWithItemIdentifier:v12 style:&v14];
  }
  uint64_t v10 = v9;
LABEL_7:

  return v10;
}

- (id)_mediaComponentsWithChildren:(id)a3 context:(id)a4
{
  id v4 = a4;
  id v5 = [[SUUIGalleryPageComponent alloc] initWithCustomPageContext:v4];

  id v6 = [(SUUIGalleryPageComponent *)v5 childComponents];

  return v6;
}

- (id)_newLockupComponentWithItem:(id)a3 defaultStyle:(SUUILockupStyle *)a4
{
  id v5 = a3;
  if ([v5 itemKind] == 17) {
    a4->unint64_t visibleFields = 150;
  }
  id v6 = [SUUILockupComponent alloc];
  long long v9 = *(_OWORD *)&a4->artworkSize;
  unint64_t visibleFields = a4->visibleFields;
  id v7 = [(SUUILockupComponent *)v6 initWithItem:v5 style:&v9];

  return v7;
}

- (void)_reloadMissingDataCount
{
  uint64_t v25 = *MEMORY[0x263EF8340];
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
    uint64_t v8 = (NSURL *)[objc_alloc(NSURL) initWithString:v7];
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
    SUUILockupStyleDefault((uint64_t)v9);
    long long v7 = v10;
    uint64_t v8 = v11;
    if (SUUILockupStyleEqualToLockupStyle(v9, &v7))
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

- (SUUILockupStyle)lockupStyle
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

@end