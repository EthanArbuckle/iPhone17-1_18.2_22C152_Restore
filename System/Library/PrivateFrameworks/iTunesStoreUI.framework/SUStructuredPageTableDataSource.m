@interface SUStructuredPageTableDataSource
- (BOOL)_shouldShowItemOfferButtonForItem:(id)a3;
- (BOOL)canDeleteIndexPath:(id)a3;
- (BOOL)canSelectIndexPath:(id)a3;
- (BOOL)canShowItemOfferButtonForItem:(id)a3;
- (BOOL)deleteIndexPath:(id)a3;
- (Class)cellClassForItem:(id)a3 reuseIdentifier:(id *)a4;
- (Class)cellConfigurationClassForItem:(id)a3;
- (SUClientInterface)clientInterface;
- (SUItem)activeLoadMoreItem;
- (SUStructuredPage)structuredPage;
- (double)cellHeightForIndexPath:(id)a3;
- (id)_itemOfferButtonForCell:(id)a3 item:(id)a4;
- (id)cellConfigurationForIndex:(int64_t)a3 item:(id)a4;
- (id)cellForIndexPath:(id)a3;
- (id)headerViewForSection:(int64_t)a3;
- (id)newHeaderViewForSection:(int64_t)a3;
- (id)sectionIndexTitles;
- (id)titleForDeleteConfirmationForIndexPath:(id)a3;
- (id)titleForHeaderInSection:(int64_t)a3;
- (int64_t)numberOfRowsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (int64_t)sectionIndexForIndexTitle:(id)a3 atIndex:(int64_t)a4;
- (int64_t)style;
- (int64_t)tableViewStyle;
- (void)_configureLoadMoreCell:(id)a3 forItem:(id)a4;
- (void)configureCell:(id)a3 forIndexPath:(id)a4;
- (void)dealloc;
- (void)reloadCellContexts;
- (void)reloadData;
- (void)setActiveLoadMoreItem:(id)a3;
- (void)setClientInterface:(id)a3;
- (void)setStructuredPage:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation SUStructuredPageTableDataSource

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUStructuredPageTableDataSource;
  [(SUTableDataSource *)&v3 dealloc];
}

- (BOOL)canShowItemOfferButtonForItem:(id)a3
{
  return 1;
}

- (Class)cellClassForItem:(id)a3 reuseIdentifier:(id *)a4
{
  uint64_t v5 = [a3 itemType];
  Class result = (Class)objc_opt_class();
  if (a4)
  {
    v7 = @"su0";
    if (v5 == 8) {
      v7 = @"su1";
    }
    *a4 = v7;
  }
  return result;
}

- (Class)cellConfigurationClassForItem:(id)a3
{
  switch([a3 itemType])
  {
    case 4:
    case 5:
    case 8:
    case 9:
    case 10:
      Class result = (Class)objc_opt_class();
      break;
    default:
      NSLog(&cfstr_UnknownItemTyp.isa, [a3 itemType]);
      Class result = 0;
      break;
  }
  return result;
}

- (id)cellConfigurationForIndex:(int64_t)a3 item:(id)a4
{
  v7 = [(SUStructuredPageTableDataSource *)self cellConfigurationClassForItem:a4];
  if (!v7) {
    return 0;
  }
  id v8 = [(SUTableDataSource *)self cachedConfigurationForClass:v7 index:a3];
  [v8 setRepresentedObject:a4];
  return v8;
}

- (id)newHeaderViewForSection:(int64_t)a3
{
  return 0;
}

- (void)setStructuredPage:(id)a3
{
  structuredPage = self->_structuredPage;
  if (structuredPage != a3)
  {

    v6 = (SUStructuredPage *)a3;
    self->_structuredPage = v6;
    v7 = [(SUStructuredPage *)v6 itemList];
    BOOL v8 = [(SUStructuredPageTableDataSource *)self tableViewStyle] != 1;
    [(SUItemList *)v7 setIgnoresEmptySections:v8];
  }
}

- (BOOL)canDeleteIndexPath:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(-[SUItemList itemAtIndexPath:](-[SUStructuredPage itemList](self->_structuredPage, "itemList"), "itemAtIndexPath:", a3), "itemLinksForType:", 4), "count"))
  {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)SUStructuredPageTableDataSource;
  return [(SUTableDataSource *)&v6 canDeleteIndexPath:a3];
}

- (BOOL)canSelectIndexPath:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUStructuredPageTableDataSource;
  BOOL v5 = -[SUTableDataSource canSelectIndexPath:](&v9, sel_canSelectIndexPath_);
  uint64_t v6 = objc_msgSend(-[SUItemList itemAtIndexPath:](-[SUStructuredPage itemList](self->_structuredPage, "itemList"), "itemAtIndexPath:", a3), "itemType");
  if (v6 == 8 || v6 == 2) {
    return 0;
  }
  return v5;
}

- (id)cellForIndexPath:(id)a3
{
  uint64_t v8 = 0;
  v4 = [(SUStructuredPageTableDataSource *)self cellClassForItem:[(SUItemList *)[(SUStructuredPage *)self->_structuredPage itemList] itemAtIndexPath:a3] reuseIdentifier:&v8];
  id v5 = [(SUTableDataSource *)self cellReuseSource];
  id result = (id)[v5 dequeueReusableCellWithIdentifier:v8];
  if (!result)
  {
    id v7 = [v4 alloc];
    return (id)[v7 initWithStyle:0 reuseIdentifier:v8];
  }
  return result;
}

- (double)cellHeightForIndexPath:(id)a3
{
  id v4 = [(SUItemList *)[(SUStructuredPage *)self->_structuredPage itemList] itemAtIndexPath:a3];
  id v5 = [(SUStructuredPageTableDataSource *)self cellConfigurationClassForItem:v4];
  uint64_t v6 = objc_msgSend(-[SUVariableCellConfigurationCache cacheForClass:](self->super._configurationCache, "cacheForClass:", v5), "cellContext");
  objc_msgSend(v6, "setTableViewStyle:", -[SUStructuredPageTableDataSource tableViewStyle](self, "tableViewStyle"));

  [(objc_class *)v5 rowHeightForContext:v6 representedObject:v4];
  return result;
}

- (void)configureCell:(id)a3 forIndexPath:(id)a4
{
  id v7 = [(SUTableDataSource *)self cellReuseSource];
  uint64_t v8 = [(SUStructuredPage *)self->_structuredPage itemList];
  id v9 = [(SUItemList *)v8 itemAtIndexPath:a4];
  if ([(SUStructuredPageTableDataSource *)self _shouldShowItemOfferButtonForItem:v9])
  {
    id v10 = [(SUStructuredPageTableDataSource *)self _itemOfferButtonForCell:a3 item:v9];
    if ([v10 isShowingConfirmation])
    {
      [v10 setShowingConfirmation:0 duration:0.0];
      [a3 setNeedsLayout];
    }
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v11 = [v7 globalRowForRowAtIndexPath:a4];
  id v12 = [(SUStructuredPageTableDataSource *)self cellConfigurationForIndex:v11 item:v9];
  [a3 setAccessoryView:v10];
  [a3 setConfiguration:v12];
  BOOL v13 = self->_style == 1 && [v9 itemType] == 3;
  [a3 setHighlightsOnlyContentView:v13];
  v17[0] = [a4 row];
  v17[1] = objc_msgSend(-[SUItemList itemsForSectionAtIndex:](v8, "itemsForSectionAtIndex:", objc_msgSend(a4, "section")), "count");
  v17[2] = v11;
  v17[3] = [(SUItemList *)v8 numberOfItems];
  [a3 setPosition:v17];
  switch([v9 itemType])
  {
    case 1:
      [a3 setAccessoryType:0];
      objc_msgSend(a3, "setHighlightsOnlyContentView:", -[SUStructuredPageTableDataSource canSelectIndexPath:](self, "canSelectIndexPath:", a4));
      return;
    case 2:
      [a3 setAccessoryType:0];
      goto LABEL_12;
    case 3:
      if (self->_style != 1) {
        goto LABEL_15;
      }
      [a3 setAccessoryType:0];
      goto LABEL_23;
    case 4:
      [a3 setAccessoryType:0];
      [(SUStructuredPageTableDataSource *)self _configureLoadMoreCell:a3 forItem:v9];
      return;
    case 8:
      [a3 setAccessoryType:0];
      [a3 setBackgroundView:0];
      id v14 = a3;
      BOOL v15 = 1;
      goto LABEL_25;
    case 9:
    case 10:
      [a3 setAccessoryType:0];
      [a3 setDrawAsDisabled:0];
LABEL_12:
      id v14 = a3;
      BOOL v15 = 0;
      goto LABEL_25;
    default:
LABEL_15:
      BOOL v16 = !v10 && ![(SUStructuredPage *)self->_structuredPage wantsIndexBar];
      [a3 setAccessoryType:v16];
      [a3 setDrawAsDisabled:0];
      [a3 setHighlightsOnlyContentView:0];
      if ([v10 isUserInteractionEnabled]) {
        BOOL v15 = 1;
      }
      else {
LABEL_23:
      }
        BOOL v15 = [(SUStructuredPageTableDataSource *)self canSelectIndexPath:a4];
      id v14 = a3;
LABEL_25:
      [v14 setUserInteractionEnabled:v15];
      return;
  }
}

- (BOOL)deleteIndexPath:(id)a3
{
  id v5 = [(SUStructuredPage *)self->_structuredPage itemList];
  uint64_t v6 = objc_msgSend(-[SUItemList itemAtIndexPath:](v5, "itemAtIndexPath:", a3), "firstItemLinkForType:", 4);
  if ([v6 URL])
  {
    id v7 = objc_alloc_init(MEMORY[0x263F89528]);
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263F7B368]), "initWithURL:", objc_msgSend(v6, "URL"));
    [v7 setRequestProperties:v8];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F894E0], "mainQueue"), "addOperation:", v7);

    [(SUItemList *)v5 removeItemAtIndexPath:a3];
    return 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SUStructuredPageTableDataSource;
    return [(SUTableDataSource *)&v10 deleteIndexPath:a3];
  }
}

- (id)headerViewForSection:(int64_t)a3
{
  if ([(NSMutableArray *)self->_cachedHeaderViews count] > (unint64_t)a3
    && (uint64_t v5 = [(NSMutableArray *)self->_cachedHeaderViews objectAtIndex:a3]) != 0
    && (id v6 = (id)v5, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (id v6 = [(SUStructuredPageTableDataSource *)self newHeaderViewForSection:a3]) != 0)
  {
    if (!self->_cachedHeaderViews) {
      self->_cachedHeaderViews = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    }
    uint64_t v7 = [MEMORY[0x263EFF9D0] null];
    while ([(NSMutableArray *)self->_cachedHeaderViews count] <= (unint64_t)a3)
      [(NSMutableArray *)self->_cachedHeaderViews addObject:v7];
    [(NSMutableArray *)self->_cachedHeaderViews replaceObjectAtIndex:a3 withObject:v6];
  }
  return v6;
}

- (int64_t)numberOfSections
{
  v2 = [(SUStructuredPage *)self->_structuredPage itemList];

  return [(SUItemList *)v2 numberOfSections];
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  id v3 = [(SUItemList *)[(SUStructuredPage *)self->_structuredPage itemList] itemsForSectionAtIndex:a3];

  return [v3 count];
}

- (void)reloadCellContexts
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v25.receiver = self;
  v25.super_class = (Class)SUStructuredPageTableDataSource;
  [(SUTableDataSource *)&v25 reloadCellContexts];
  id v3 = [(SUTableDataSource *)self imageCache];
  id v4 = [(SUTableDataSource *)self imagePool];
  uint64_t v5 = objc_alloc_init(SUItemCellContext);
  [(SUArtworkCellContext *)v5 setImageCache:v3];
  v19 = v4;
  [(SUArtworkCellContext *)v5 setImagePool:v4];
  [(SUVariableCellConfigurationCache *)self->super._configurationCache setCellContext:v5];

  id v6 = [(SUItemList *)[(SUStructuredPage *)self->_structuredPage itemList] copyItems];
  uint64_t v7 = objc_alloc_init(SUItemOfferButton);
  self->_double offerButtonWidth = 0.0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v6;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        BOOL v13 = [(SUStructuredPageTableDataSource *)self cellConfigurationClassForItem:v12];
        id v14 = [(SUVariableCellConfigurationCache *)self->super._configurationCache cacheForClass:v13];
        if (![v14 cellContext])
        {
          BOOL v15 = (void *)[(objc_class *)v13 copyDefaultContext];
          [v15 setImageCache:v3];
          [v15 setImagePool:v19];
          [v14 setCellContext:v15];
        }
        if ([(SUStructuredPageTableDataSource *)self _shouldShowItemOfferButtonForItem:v12])
        {
          -[SUItemOfferButton configureForItem:offer:](v7, "configureForItem:offer:", v12, [v12 defaultStoreOffer]);
          [(SUItemOfferButton *)v7 sizeToFit];
          double offerButtonWidth = self->_offerButtonWidth;
          [(SUItemOfferButton *)v7 frame];
          if (offerButtonWidth >= v17) {
            double v18 = offerButtonWidth;
          }
          else {
            double v18 = v17;
          }
          self->_double offerButtonWidth = v18;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }
}

- (void)reloadData
{
  [(NSMutableArray *)self->_cachedHeaderViews removeAllObjects];
  [(SUStructuredPageTableDataSource *)self setActiveLoadMoreItem:0];
  v3.receiver = self;
  v3.super_class = (Class)SUStructuredPageTableDataSource;
  [(SUTableDataSource *)&v3 reloadData];
}

- (int64_t)sectionIndexForIndexTitle:(id)a3 atIndex:(int64_t)a4
{
  id v6 = [(SUStructuredPage *)self->_structuredPage itemList];

  return [(SUItemList *)v6 sectionIndexForIndexTitle:a3 atIndex:a4];
}

- (id)sectionIndexTitles
{
  if (![(SUStructuredPage *)self->_structuredPage wantsIndexBar]) {
    return 0;
  }
  objc_super v3 = [(SUStructuredPage *)self->_structuredPage itemList];

  return [(SUItemList *)v3 sectionIndexTitles];
}

- (int64_t)tableViewStyle
{
  return [(SUStructuredPage *)self->_structuredPage displayStyle] == 1;
}

- (id)titleForDeleteConfirmationForIndexPath:(id)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend(-[SUItemList itemAtIndexPath:](-[SUStructuredPage itemList](self->_structuredPage, "itemList"), "itemAtIndexPath:", a3), "firstItemLinkForType:", 4), "title");
  if (!result)
  {
    v6.receiver = self;
    v6.super_class = (Class)SUStructuredPageTableDataSource;
    return [(SUTableDataSource *)&v6 titleForDeleteConfirmationForIndexPath:a3];
  }
  return result;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  id v3 = [(SUItemList *)[(SUStructuredPage *)self->_structuredPage itemList] sectionItemForSectionAtIndex:a3];

  return (id)[v3 title];
}

- (void)_configureLoadMoreCell:(id)a3 forItem:(id)a4
{
  if (self->_activeLoadMoreItem == a4)
  {
    id v5 = (id)[a3 accessoryView];
    if (!v5)
    {
      objc_super v6 = (void *)[objc_alloc(MEMORY[0x263F1C3D8]) initWithActivityIndicatorStyle:2];
      [v6 sizeToFit];
      [v6 startAnimating];
      id v5 = v6;
    }
  }
  else
  {
    id v5 = 0;
  }
  [a3 setAccessoryView:v5];
  BOOL v7 = v5 != 0;
  BOOL v8 = v5 == 0;
  [a3 setDrawAsDisabled:v7];

  [a3 setUserInteractionEnabled:v8];
}

- (id)_itemOfferButtonForCell:(id)a3 item:(id)a4
{
  id v5 = (void *)[a3 itemOfferButton];
  [v5 addTarget:0 action:sel_itemOfferButtonAction_ forControlEvents:64];
  [v5 setAnimationHorizontalAlignment:2];
  objc_msgSend(v5, "configureForItem:offer:", a4, objc_msgSend(a4, "defaultStoreOffer"));
  [v5 frame];
  objc_msgSend(v5, "setFrame:");
  return v5;
}

- (BOOL)_shouldShowItemOfferButtonForItem:(id)a3
{
  id v5 = (void *)[a3 defaultStoreOffer];
  if (-[SUPurchaseManager itemIdentifierIsPurchased:](-[SUClientInterface purchaseManager](-[SUStructuredPageTableDataSource clientInterface](self, "clientInterface"), "purchaseManager"), "itemIdentifierIsPurchased:", [a3 itemIdentifier]))
  {
    return 0;
  }
  if (![v5 priceDisplay]) {
    return 0;
  }
  objc_super v6 = (void *)[v5 actionType];
  if (![v6 isEqualToString:*MEMORY[0x263F7B970]]) {
    return 0;
  }

  return [(SUStructuredPageTableDataSource *)self canShowItemOfferButtonForItem:a3];
}

- (SUItem)activeLoadMoreItem
{
  return self->_activeLoadMoreItem;
}

- (void)setActiveLoadMoreItem:(id)a3
{
}

- (SUClientInterface)clientInterface
{
  return self->_clientInterface;
}

- (void)setClientInterface:(id)a3
{
}

- (SUStructuredPage)structuredPage
{
  return self->_structuredPage;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

@end