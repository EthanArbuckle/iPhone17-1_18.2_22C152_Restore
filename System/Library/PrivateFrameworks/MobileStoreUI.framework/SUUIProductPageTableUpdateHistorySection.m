@interface SUUIProductPageTableUpdateHistorySection
- (NSArray)releaseNotes;
- (SUUIColorScheme)colorScheme;
- (SUUILayoutCache)textLayoutCache;
- (SUUIProductPageTableUpdateHistorySection)initWithClientContext:(id)a3;
- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4;
- (id)headerViewForTableView:(id)a3;
- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4;
- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (int64_t)firstStringIndex;
- (int64_t)numberOfRowsInSection;
- (void)_reloadHeaderView;
- (void)setColorScheme:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setFirstStringIndex:(int64_t)a3;
- (void)setReleaseNotes:(id)a3;
- (void)setTextLayoutCache:(id)a3;
@end

@implementation SUUIProductPageTableUpdateHistorySection

- (SUUIProductPageTableUpdateHistorySection)initWithClientContext:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIProductPageTableUpdateHistorySection;
  v6 = [(SUUIProductPageTableUpdateHistorySection *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateFormatter = v7->_dateFormatter;
    v7->_dateFormatter = v8;

    [(NSDateFormatter *)v7->_dateFormatter setDateStyle:2];
    [(NSDateFormatter *)v7->_dateFormatter setTimeStyle:0];
  }

  return v7;
}

- (void)setColorScheme:(id)a3
{
  id v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    headerView = self->_headerView;
    v8 = [(SUUIColorScheme *)*p_colorScheme primaryTextColor];
    if (v8)
    {
      [(SUUIProductPageTableExpandableHeaderView *)headerView setBottomBorderColor:v8];
    }
    else
    {
      v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
      [(SUUIProductPageTableExpandableHeaderView *)headerView setBottomBorderColor:v9];
    }
    [(SUUIProductPageTableExpandableHeaderView *)self->_headerView setColorScheme:*p_colorScheme];
    id v5 = v10;
  }
}

- (id)headerViewForTableView:(id)a3
{
  if (!self->_headerView && ![(SUUITableViewSection *)self hidesHeaderView])
  {
    v4 = objc_alloc_init(SUUIProductPageTableExpandableHeaderView);
    headerView = self->_headerView;
    self->_headerView = v4;

    [(SUUIProductPageTableExpandableHeaderView *)self->_headerView setColorScheme:self->_colorScheme];
    v6 = self->_headerView;
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_UPDATE_HISTORY_TITLE" inTable:@"ProductPage"];
    }
    else {
    v8 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_UPDATE_HISTORY_TITLE" inBundles:0 inTable:@"ProductPage"];
    }
    [(SUUIProductPageTableExpandableHeaderView *)v6 setTitle:v8];

    v9 = self->_headerView;
    v10 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
    if (v10)
    {
      [(SUUIProductPageTableExpandableHeaderView *)v9 setBottomBorderColor:v10];
    }
    else
    {
      objc_super v11 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
      [(SUUIProductPageTableExpandableHeaderView *)v9 setBottomBorderColor:v11];
    }
    [(SUUIProductPageTableExpandableHeaderView *)self->_headerView sizeToFit];
    [(SUUIProductPageTableUpdateHistorySection *)self _reloadHeaderView];
  }
  v12 = self->_headerView;
  return v12;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "row", a3);
  v6 = [(SUUILayoutCache *)self->_textLayoutCache layoutForIndex:self->_firstStringIndex + v5];
  [(SUUIProductPageTableSection *)self heightForTextLayout:v6 isExpanded:[(NSMutableIndexSet *)self->_expandedIndexSet containsIndex:v5]];
  double v8 = v7;

  return v8;
}

- (int64_t)numberOfRowsInSection
{
  if (![(SUUIProductPageTableSection *)self isExpanded]) {
    return 0;
  }
  releaseNotes = self->_releaseNotes;
  return [(NSArray *)releaseNotes count];
}

- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "row", a3);
  v6 = [(SUUILayoutCache *)self->_textLayoutCache layoutForIndex:self->_firstStringIndex + v5];
  if (([(NSMutableIndexSet *)self->_expandedIndexSet containsIndex:v5] & 1) != 0
    || ![v6 requiresTruncation])
  {
    v10 = 0;
  }
  else
  {
    expandedIndexSet = self->_expandedIndexSet;
    if (!expandedIndexSet)
    {
      double v8 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
      v9 = self->_expandedIndexSet;
      self->_expandedIndexSet = v8;

      expandedIndexSet = self->_expandedIndexSet;
    }
    [(NSMutableIndexSet *)expandedIndexSet addIndex:v5];
    v10 = +[SUUIProductPageAction actionWithType:0];
  }

  return v10;
}

- (void)setExpanded:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIProductPageTableUpdateHistorySection;
  [(SUUIProductPageTableSection *)&v4 setExpanded:a3];
  [(SUUIProductPageTableUpdateHistorySection *)self _reloadHeaderView];
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  double v7 = [(SUUIProductPageTableSection *)self textBoxTableViewCellForTableView:a3 indexPath:v6];
  double v8 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
  if (v8)
  {
    [v7 setBottomBorderColor:v8];
  }
  else
  {
    v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [v7 setBottomBorderColor:v9];
  }
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    [v7 setBorderPaddingLeft:30.0];
    objc_msgSend(v7, "setTextBoxInsets:", 0.0, 15.0, 0.0, 0.0);
  }
  uint64_t v10 = [v6 row];
  objc_super v11 = [(SUUILayoutCache *)self->_textLayoutCache layoutForIndex:self->_firstStringIndex + v10];
  v12 = [v7 textBoxView];
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "setFixedWidthTextFrame:", objc_msgSend(v11, "textFrame"));
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"MORE_BUTTON"];
    }
    else {
    v15 = +[SUUIClientContext localizedStringForKey:@"MORE_BUTTON" inBundles:0];
    }
    [v13 setMoreButtonTitle:v15];

    if ([(NSMutableIndexSet *)self->_expandedIndexSet containsIndex:v10]) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = 5;
    }
    [v13 setNumberOfVisibleLines:v16];
    v17 = [(NSArray *)self->_releaseNotes objectAtIndex:v10];
    v18 = [v17 date];
    id v29 = v6;
    if (v18)
    {
      v19 = self->_clientContext;
      if (v19) {
        [(SUUIClientContext *)v19 localizedStringForKey:@"PRODUCT_PAGE_UPDATED_DATE" inTable:@"ProductPage"];
      }
      else {
      v21 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_UPDATED_DATE" inBundles:0 inTable:@"ProductPage"];
      }
      v22 = [(NSDateFormatter *)self->_dateFormatter stringFromDate:v18];
      v20 = [NSString stringWithValidatedFormat:v21, @"%@", 0, v22 validFormatSpecifiers error];
    }
    else
    {
      v20 = 0;
    }
    [v13 setSubtitle:v20];
    uint64_t v23 = [v17 versionString];
    if (v23)
    {
      v24 = (void *)v23;
      v25 = self->_clientContext;
      if (v25) {
        [(SUUIClientContext *)v25 localizedStringForKey:@"PRODUCT_PAGE_UPDATED_VERSION" inTable:@"ProductPage"];
      }
      else {
      v27 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_UPDATED_VERSION" inBundles:0 inTable:@"ProductPage"];
      }
      v26 = [NSString stringWithValidatedFormat:v27, @"%@", 0, v24 validFormatSpecifiers error];
    }
    else
    {
      v26 = 0;
    }
    id v6 = v29;
    [v13 setTitle:v26];
  }
  else
  {
    [v12 reset];
  }

  return v7;
}

- (void)_reloadHeaderView
{
  BOOL v3 = [(SUUIProductPageTableSection *)self isExpanded];
  headerView = self->_headerView;
  if (v3)
  {
    uint64_t v5 = self->_headerView;
    [(SUUIProductPageTableExpandableHeaderView *)v5 setActionString:0];
  }
  else
  {
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_SHOW_UPDATE_HISTORY_BUTTON" inTable:@"ProductPage"];
    }
    else {
    id v7 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_SHOW_UPDATE_HISTORY_BUTTON" inBundles:0 inTable:@"ProductPage"];
    }
    [(SUUIProductPageTableExpandableHeaderView *)headerView setActionString:v7];
  }
}

- (int64_t)firstStringIndex
{
  return self->_firstStringIndex;
}

- (void)setFirstStringIndex:(int64_t)a3
{
  self->_firstStringIndex = a3;
}

- (NSArray)releaseNotes
{
  return self->_releaseNotes;
}

- (void)setReleaseNotes:(id)a3
{
}

- (SUUILayoutCache)textLayoutCache
{
  return self->_textLayoutCache;
}

- (void)setTextLayoutCache:(id)a3
{
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_releaseNotes, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_expandedIndexSet, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end