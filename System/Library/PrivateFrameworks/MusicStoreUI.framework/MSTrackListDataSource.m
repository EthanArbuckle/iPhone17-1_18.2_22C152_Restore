@interface MSTrackListDataSource
- (BOOL)canDoubleTapIndexPath:(id)a3;
- (BOOL)canShowItemOfferButtonForItem:(id)a3;
- (BOOL)canShowPreviewForItem:(id)a3;
- (Class)cellConfigurationClassForItem:(id)a3;
- (double)heightForPlaceholderCells;
- (id)_stylesheetString;
- (id)cellConfigurationForIndex:(int64_t)a3 item:(id)a4;
- (id)cellForIndexPath:(id)a3;
- (id)headerViewForSection:(int64_t)a3;
- (id)placeholderCellForIndexPath:(id)a3;
- (int64_t)tableViewStyle;
- (void)configureCell:(id)a3 forIndexPath:(id)a4;
- (void)configurePlaceholderCell:(id)a3 forIndexPath:(id)a4;
- (void)reloadCellContexts;
@end

@implementation MSTrackListDataSource

- (BOOL)canDoubleTapIndexPath:(id)a3
{
  v3 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F89718]), "itemList"), "itemAtIndexPath:", a3);
  v4 = (void *)[v3 defaultStoreOffer];
  if ([v3 itemType] == 1007)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(v4, "offerMedia"), "URL");
    if (v5)
    {
      v6 = (void *)[v3 firstItemLinkForType:0];
      v7 = (void *)[v3 itemMediaKind];
      LODWORD(v5) = [v7 isEqualToString:*MEMORY[0x263F7B968]];
      if (v5) {
        LOBYTE(v5) = [v6 URL] != 0;
      }
    }
  }
  return v5;
}

- (BOOL)canShowPreviewForItem:(id)a3
{
  v4 = (void *)[a3 itemMediaKind];
  if ([v4 isEqualToString:*MEMORY[0x263F7B958]]) {
    return 0;
  }
  v6 = objc_msgSend((id)objc_msgSend(a3, "defaultStoreOffer"), "actionType");
  return [v6 isEqualToString:*MEMORY[0x263F7B978]] ^ 1;
}

- (BOOL)canShowItemOfferButtonForItem:(id)a3
{
  return 1;
}

- (Class)cellConfigurationClassForItem:(id)a3
{
  [a3 itemType];
  return (Class)objc_opt_class();
}

- (id)cellConfigurationForIndex:(int64_t)a3 item:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MSTrackListDataSource;
  id v5 = [(SUStructuredPageTableDataSource *)&v8 cellConfigurationForIndex:a3 item:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7[0] = a3;
    v7[1] = 0x7FFFFFFFFFFFFFFFLL;
    v7[2] = a3;
    v7[3] = 0x7FFFFFFFFFFFFFFFLL;
    [v5 setPosition:v7];
  }
  return v5;
}

- (id)cellForIndexPath:(id)a3
{
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F89718]), "itemList"), "itemAtIndexPath:", a3), "itemType") == 2)
  {
    id result = (id)objc_msgSend(-[SUTableDataSource cellReuseSource](self, "cellReuseSource"), "dequeueReusableCellWithIdentifier:", @"ms0");
    if (!result)
    {
      v6 = (void *)[objc_alloc(MEMORY[0x263F89620]) initWithStyle:0 reuseIdentifier:@"ms0"];
      return v6;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MSTrackListDataSource;
    return [(SUStructuredPageTableDataSource *)&v7 cellForIndexPath:a3];
  }
  return result;
}

- (void)configureCell:(id)a3 forIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MSTrackListDataSource;
  -[MSStructuredPageTableDataSource configureCell:forIndexPath:](&v7, sel_configureCell_forIndexPath_);
  if ([a4 row]) {
    uint64_t v6 = MSGetTrackListOddRowColor();
  }
  else {
    uint64_t v6 = MSGetTrackListEvenRowColor();
  }
  [a3 setBackgroundColor:v6];
}

- (void)configurePlaceholderCell:(id)a3 forIndexPath:(id)a4
{
  [a3 setConfiguration:0];
  if ([a4 row]) {
    uint64_t v6 = MSGetTrackListOddRowColor();
  }
  else {
    uint64_t v6 = MSGetTrackListEvenRowColor();
  }
  [a3 setBackgroundColor:v6];
}

- (id)headerViewForSection:(int64_t)a3
{
  return 0;
}

- (double)heightForPlaceholderCells
{
  +[MSTrackListCellConfiguration rowHeightForContext:0 representedObject:0];
  return result;
}

- (void)reloadCellContexts
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)MSTrackListDataSource;
  [(SUStructuredPageGroupedTableDataSource *)&v28 reloadCellContexts];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v4 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F89718]), "itemList"), "copyItems");
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    objc_super v7 = 0;
    int v8 = 0;
    uint64_t v9 = *(void *)v25;
    char v10 = 1;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v4);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
        uint64_t v13 = [v12 itemType];
        switch(v13)
        {
          case 11:
            goto LABEL_12;
          case 1007:
            char v10 = 0;
LABEL_12:
            int v8 = 1;
            goto LABEL_13;
          case 1009:
            uint64_t v14 = objc_msgSend((id)objc_msgSend(v12, "contentRating"), "ratingLabel");
            if (v14) {
              [v3 addObject:v14];
            }
            goto LABEL_12;
        }
        if (SUItemTypeIsMediaType())
        {
          uint64_t v15 = [v12 artistName];
          char v10 = 0;
          if (v7) {
            v8 |= [v7 isEqualToString:v15] ^ 1;
          }
          else {
            objc_super v7 = (void *)v15;
          }
        }
LABEL_13:
        ++v11;
      }
      while (v6 != v11);
      uint64_t v16 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
      uint64_t v6 = v16;
      if (!v16) {
        goto LABEL_22;
      }
    }
  }
  LOBYTE(v8) = 0;
  char v10 = 1;
LABEL_22:

  uint64_t v17 = (int)*MEMORY[0x263F89720];
  v18 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v17), "cacheForClass:", objc_opt_class()), "cellContext");
  v19 = v18;
  if (v10) {
    uint64_t v20 = 2;
  }
  else {
    uint64_t v20 = 0;
  }
  [v18 setHiddenMediaIconTypes:v20];
  objc_msgSend(v19, "setShouldHideContentRating:", objc_msgSend(v3, "count") == 1);
  [v19 setShowSubtitle:v8 & 1];
  v21 = (void *)[*(id *)((char *)&self->super.super.super.super.super.isa + v17) cacheForClass:objc_opt_class()];
  objc_msgSend((id)objc_msgSend(v21, "cellContext"), "setStylesheet:", -[MSTrackListDataSource _stylesheetString](self, "_stylesheetString"));
  v22 = (void *)[v21 cellContext];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "applicationFrame");
  [v22 setWebViewWidth:v23];
}

- (id)placeholderCellForIndexPath:(id)a3
{
  id v3 = (id)objc_msgSend(-[SUTableDataSource cellReuseSource](self, "cellReuseSource", a3), "dequeueReusableCellWithIdentifier:", @"ms1");
  if (!v3)
  {
    id v3 = (id)[objc_alloc(MEMORY[0x263F896C0]) initWithStyle:0 reuseIdentifier:@"ms1"];
    [v3 setUserInteractionEnabled:0];
  }
  return v3;
}

- (int64_t)tableViewStyle
{
  return 0;
}

- (id)_stylesheetString
{
  id result = (id)_stylesheetString_sStylesheet;
  if (!_stylesheetString_sStylesheet)
  {
    id v3 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = (void *)[v3 newDataURLForResource:@"Booklet" ofType:@"png" withMIMEType:@"image/png"];
    uint64_t v5 = (void *)[v3 newDataURLForResource:@"Video" ofType:@"png" withMIMEType:@"image/png"];
    id v6 = [NSString alloc];
    _stylesheetString_sStylesheet = objc_msgSend(v6, "initWithFormat:", @"body { margin: 0; padding: 11px 16px; font-family: '%@'; font-size: 12px; color: #333; line-height: 15px; }body > strong { display: block; margin-bottom: -14px; }ul { line-height: 16px; margin: 6px 0 -5px; padding: 0; list-style: none; }li { margin-bottom: 5px; padding-left: 24px; }li.booklet { background: url(\"%@\") 1px 50%% no-repeat; }li.video { background: url(\"%@\") 1px 50%% no-repeat; }",
                                      objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C658], "systemFontOfSize:", 0.0), "familyName"), objc_msgSend(v4, "absoluteString"), objc_msgSend(v5, "absoluteString"));

    return (id)_stylesheetString_sStylesheet;
  }
  return result;
}

@end