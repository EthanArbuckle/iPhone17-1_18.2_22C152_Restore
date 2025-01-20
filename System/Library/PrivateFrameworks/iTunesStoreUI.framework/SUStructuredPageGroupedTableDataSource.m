@interface SUStructuredPageGroupedTableDataSource
- (BOOL)canShowItemOfferButtonForItem:(id)a3;
- (Class)cellClassForItem:(id)a3 reuseIdentifier:(id *)a4;
- (Class)cellConfigurationClassForItem:(id)a3;
- (double)heightForFooterInSection:(int64_t)a3;
- (id)_subtitleForSectionIndex:(int64_t)a3;
- (id)newHeaderViewForSection:(int64_t)a3;
- (int64_t)tableViewStyle;
- (void)configureCell:(id)a3 forIndexPath:(id)a4;
- (void)reloadCellContexts;
@end

@implementation SUStructuredPageGroupedTableDataSource

- (BOOL)canShowItemOfferButtonForItem:(id)a3
{
  uint64_t v5 = [a3 itemType];
  BOOL v6 = (unint64_t)(v5 - 1005) > 6 || v5 == 1010;
  if (v6 && v5 != 4000 && v5 != 11) {
    return 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)SUStructuredPageGroupedTableDataSource;
  return [(SUStructuredPageTableDataSource *)&v8 canShowItemOfferButtonForItem:a3];
}

- (Class)cellClassForItem:(id)a3 reuseIdentifier:(id *)a4
{
  if ([a3 itemType] == 1008 && objc_msgSend(a3, "itemDisplayType") == 2)
  {
    if (a4) {
      *a4 = @"sunp";
    }
    return (Class)objc_opt_class();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUStructuredPageGroupedTableDataSource;
    return [(SUStructuredPageTableDataSource *)&v8 cellClassForItem:a3 reuseIdentifier:a4];
  }
}

- (Class)cellConfigurationClassForItem:(id)a3
{
  uint64_t v5 = [a3 itemType];
  if (v5 <= 1999)
  {
    switch(v5)
    {
      case 1000:
      case 1001:
      case 1002:
      case 1003:
      case 1004:
      case 1006:
      case 1009:
      case 1010:
        break;
      case 1005:
      case 1007:
      case 1008:
      case 1011:
LABEL_9:
        if (self->super._style != 1) {
          [a3 itemDisplayType];
        }
        break;
      default:
        switch(v5)
        {
          case 1:
          case 3:
          case 4:
          case 5:
          case 6:
            goto LABEL_11;
          case 11:
            goto LABEL_9;
          default:
            goto LABEL_5;
        }
    }
  }
  else if (v5 != 4000 && v5 != 3000 && v5 != 2000)
  {
LABEL_5:
    v7.receiver = self;
    v7.super_class = (Class)SUStructuredPageGroupedTableDataSource;
    return [(SUStructuredPageTableDataSource *)&v7 cellConfigurationClassForItem:a3];
  }
LABEL_11:

  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3 forIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SUStructuredPageGroupedTableDataSource;
  -[SUStructuredPageTableDataSource configureCell:forIndexPath:](&v10, sel_configureCell_forIndexPath_);
  uint64_t v7 = objc_msgSend(-[SUItemList itemAtIndexPath:](-[SUStructuredPage itemList](self->super._structuredPage, "itemList"), "itemAtIndexPath:", a4), "itemType");
  if ((unint64_t)(v7 - 4) >= 2)
  {
    if (v7 == 6) {
      [a3 setBackgroundView:0];
    }
  }
  else if (self->super._style != 2)
  {
    objc_super v8 = (void *)[a3 configuration];
    if ([a4 row]) {
      -[SUStructuredPageTableDataSource cellHeightForIndexPath:](self, "cellHeightForIndexPath:", objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(a4, "row") - 1, objc_msgSend(a4, "section")));
    }
    else {
      double v9 = 0.0;
    }
    [v8 setPreviousCellHeight:v9];
  }
}

- (double)heightForFooterInSection:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SUStructuredPageGroupedTableDataSource;
  -[SUTableDataSource heightForFooterInSection:](&v13, sel_heightForFooterInSection_);
  double v6 = v5;
  uint64_t v7 = [(SUStructuredPage *)self->super._structuredPage itemList];
  if ([(SUItemList *)v7 numberOfSections] - 1 > a3
    && [(SUStructuredPageGroupedTableDataSource *)self tableViewStyle] == 1)
  {
    id v8 = [(SUItemList *)v7 itemsForSectionAtIndex:a3];
    id v9 = [(SUItemList *)v7 itemsForSectionAtIndex:a3 + 1];
    if ([v8 count])
    {
      if ([v9 count])
      {
        objc_super v10 = (void *)[v8 lastObject];
        v11 = (void *)[v9 objectAtIndex:0];
        if ([v10 itemType] == 8 && objc_msgSend(v11, "itemType") == 8) {
          return 1.0;
        }
      }
    }
  }
  return v6;
}

- (id)newHeaderViewForSection:(int64_t)a3
{
  if (![(SUStructuredPageGroupedTableDataSource *)self tableViewStyle]) {
    return 0;
  }
  double v5 = objc_msgSend(-[SUItemList sectionItemForSectionAtIndex:](-[SUStructuredPage itemList](self->super._structuredPage, "itemList"), "sectionItemForSectionAtIndex:", a3), "title");
  id v6 = [(SUStructuredPageGroupedTableDataSource *)self _subtitleForSectionIndex:a3];
  if (![v5 length] && !objc_msgSend(v6, "length")) {
    return 0;
  }
  uint64_t v7 = [SUTableHeaderView alloc];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "bounds");
  id v8 = -[SUTableHeaderView initWithFrame:](v7, "initWithFrame:");
  -[SUTableHeaderView setBackgroundColor:](v8, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
  [(SUTableHeaderView *)v8 setIndex:a3];
  [(SUTableHeaderView *)v8 setSubtitle:v6];
  [(SUTableHeaderView *)v8 setTitle:v5];
  [(SUTableHeaderView *)v8 setUserInteractionEnabled:0];
  [(SUTableHeaderView *)v8 sizeToFit];
  return v8;
}

- (void)reloadCellContexts
{
  v2 = self;
  uint64_t v73 = *MEMORY[0x263EF8340];
  v69.receiver = self;
  v69.super_class = (Class)SUStructuredPageGroupedTableDataSource;
  [(SUStructuredPageTableDataSource *)&v69 reloadCellContexts];
  v3 = [(SUVariableCellConfigurationCache *)v2->super.super._configurationCache caches];
  BOOL v53 = [(SUStructuredPage *)v2->super._structuredPage artworkShouldFitWidth];
  id v56 = objc_alloc_init(MEMORY[0x263F089C8]);
  v44 = v2;
  if (v2->super._style == 1)
  {
    uint64_t v4 = 0;
    int v5 = 0;
    int v6 = 0;
    goto LABEL_40;
  }
  id v7 = [(SUItemList *)[(SUStructuredPage *)v2->super._structuredPage itemList] copyItems];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obuint64_t j = v7;
  uint64_t v49 = [v7 countByEnumeratingWithState:&v65 objects:v72 count:16];
  uint64_t v4 = 0;
  int v5 = 0;
  int v6 = 0;
  if (!v49) {
    goto LABEL_39;
  }
  uint64_t v48 = *(void *)v66;
  uint64_t v46 = *MEMORY[0x263F7B950];
  uint64_t v45 = *MEMORY[0x263F7B968];
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v66 != v48) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v65 + 1) + 8 * v8);
      objc_super v10 = (void *)[v9 itemMediaKind];
      v11 = v10;
      if (v6)
      {
        int v12 = 1;
        if ((v5 & 1) == 0) {
          goto LABEL_10;
        }
      }
      else
      {
        int v12 = [v10 isEqualToString:v46];
        if ((v5 & 1) == 0)
        {
LABEL_10:
          int v13 = [v11 isEqualToString:v45];
          goto LABEL_13;
        }
      }
      int v13 = 1;
LABEL_13:
      v14 = (void *)[v9 itemImageCollection];
      v15 = v14;
      int v50 = v12;
      int v51 = v13;
      BOOL v16 = (v4 & 1) != 0 || objc_msgSend((id)objc_msgSend(v14, "itemImages"), "count") != 0;
      BOOL v54 = v16;
      if (v53)
      {
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        uint64_t v17 = [(NSArray *)v3 countByEnumeratingWithState:&v61 objects:v71 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v62;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v62 != v19) {
                objc_enumerationMutation(v3);
              }
              v21 = (void *)[*(id *)(*((void *)&v61 + 1) + 8 * i) cellContext];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v22 = (void *)[v21 imageProvider];
                if (v22)
                {
                  [v22 finalSize];
                  uint64_t v23 = objc_msgSend(v15, "bestImageForSize:");
                  if (v23)
                  {
                    v24 = (void *)v23;
                    [v21 artworkWidth];
                    double v26 = v25;
                    double v27 = (double)[v24 width];
                    if (v26 >= v27) {
                      double v27 = v26;
                    }
                    [v21 setArtworkWidth:v27];
                  }
                }
              }
            }
            uint64_t v18 = [(NSArray *)v3 countByEnumeratingWithState:&v61 objects:v71 count:16];
          }
          while (v18);
        }
      }
      uint64_t v28 = [v9 itemType];
      if (SUItemTypeIsMediaType(v28) || v28 == 11 || v28 == 4000 || v28 == 3000) {
        [v56 addIndex:v28];
      }
      ++v8;
      uint64_t v4 = v54;
      int v6 = v50;
      int v5 = v51;
    }
    while (v8 != v49);
    uint64_t v29 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
    uint64_t v49 = v29;
  }
  while (v29);
LABEL_39:

  v2 = v44;
LABEL_40:
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v30 = [(NSArray *)v3 countByEnumeratingWithState:&v57 objects:v70 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    int v32 = v5 & v6;
    uint64_t v33 = *(void *)v58;
    unsigned int v55 = v4;
    int v52 = v32;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v58 != v33) {
          objc_enumerationMutation(v3);
        }
        v35 = (void *)[*(id *)(*((void *)&v57 + 1) + 8 * j) cellContext];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v2->super._style == 1) {
            int v36 = 1;
          }
          else {
            int v36 = v32;
          }
          if (v36) {
            uint64_t v37 = 0;
          }
          else {
            uint64_t v37 = 2;
          }
          [v35 setHiddenMediaIconTypes:v37];
          [v35 setItemsHaveArtwork:v4];
          if ([v56 count] == 1)
          {
            uint64_t v38 = [v56 firstIndex];
            if (v38 == 3000)
            {
              v39 = @"PlaceholderBookPoster.png";
LABEL_57:
              v40 = (void *)[v35 imageProvider];
              objc_msgSend(v40, "setFinalSize:", 58.0, 88.0);
              v41 = objc_msgSend(v40, "newImageFromImage:", objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:", v39, objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class())));
              [v35 setPlaceholderImage:v41];

              v2 = v44;
              uint64_t v4 = v55;
              int v32 = v52;
            }
            else if (v38 == 1002)
            {
              v39 = @"PlaceholderVideoPoster.png";
              goto LABEL_57;
            }
          }
          [(SUStructuredPage *)v2->super._structuredPage artworkWidth];
          char v43 = v42 <= 0.00000011920929 || v53;
          if ((v43 & 1) == 0) {
            objc_msgSend(v35, "setArtworkWidth:");
          }
          continue;
        }
      }
      uint64_t v31 = [(NSArray *)v3 countByEnumeratingWithState:&v57 objects:v70 count:16];
    }
    while (v31);
  }
}

- (int64_t)tableViewStyle
{
  if (![(SUStructuredPage *)self->super._structuredPage displayStyle]) {
    return self->super._style != 2;
  }
  v4.receiver = self;
  v4.super_class = (Class)SUStructuredPageGroupedTableDataSource;
  return [(SUStructuredPageTableDataSource *)&v4 tableViewStyle];
}

- (id)_subtitleForSectionIndex:(int64_t)a3
{
  int v5 = [(SUStructuredPage *)self->super._structuredPage itemList];
  id v6 = [(SUItemList *)v5 itemsForSectionAtIndex:a3];
  uint64_t v7 = [v6 count];
  if (v7 < 1) {
    return 0;
  }
  uint64_t v8 = v7;
  LOBYTE(v9) = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    uint64_t v12 = [MEMORY[0x263F088C8] indexPathForRow:v10 inSection:a3];
    BOOL v9 = v9 || [(SUTableDataSource *)self canDoubleTapIndexPath:v12];
    uint64_t v13 = objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", v10), "itemType");
    BOOL IsMediaType = SUItemTypeIsMediaType(v13);
    if (v13 == v11) {
      uint64_t v15 = v11;
    }
    else {
      uint64_t v15 = 0;
    }
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v15 = v13;
    }
    if (IsMediaType) {
      uint64_t v11 = v15;
    }
    ++v10;
  }
  while (v8 != v10);
  if (!v9) {
    return 0;
  }
  if (v11 == 1008)
  {
    BOOL v16 = @"song";
  }
  else
  {
    BOOL v16 = @"ringtone";
    if (v11 != 1011 && v11 != 1005)
    {
      id result = [(SUItemList *)v5 hintTextForKey:@"*"];
      if (result) {
        return result;
      }
LABEL_26:
      uint64_t v18 = @"DOUBLE_TAP_GENERIC_HINT";
      goto LABEL_27;
    }
  }
  id result = [(SUItemList *)v5 hintTextForKey:v16];
  if (result) {
    return result;
  }
  id result = [(SUItemList *)v5 hintTextForKey:@"*"];
  if (result) {
    return result;
  }
  if (v11 != 1008) {
    goto LABEL_26;
  }
  uint64_t v18 = @"DOUBLE_TAP_HINT";
LABEL_27:
  uint64_t v19 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return (id)[v19 localizedStringForKey:v18 value:&stru_26DB8C5F8 table:0];
}

@end