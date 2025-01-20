@interface SKUIProductPageTableUpdateHistorySection
- (NSArray)releaseNotes;
- (SKUIColorScheme)colorScheme;
- (SKUILayoutCache)textLayoutCache;
- (SKUIProductPageTableUpdateHistorySection)initWithClientContext:(id)a3;
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

@implementation SKUIProductPageTableUpdateHistorySection

- (SKUIProductPageTableUpdateHistorySection)initWithClientContext:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageTableUpdateHistorySection initWithClientContext:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIProductPageTableUpdateHistorySection;
  v6 = [(SKUIProductPageTableUpdateHistorySection *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v7->_dateFormatter;
    v7->_dateFormatter = v8;

    [(NSDateFormatter *)v7->_dateFormatter setDateStyle:2];
    [(NSDateFormatter *)v7->_dateFormatter setTimeStyle:0];
  }

  return v7;
}

- (void)setColorScheme:(id)a3
{
  id v5 = (SKUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    headerView = self->_headerView;
    v8 = [(SKUIColorScheme *)*p_colorScheme primaryTextColor];
    if (v8)
    {
      [(SKUIProductPageTableExpandableHeaderView *)headerView setBottomBorderColor:v8];
    }
    else
    {
      v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
      [(SKUIProductPageTableExpandableHeaderView *)headerView setBottomBorderColor:v9];
    }
    [(SKUIProductPageTableExpandableHeaderView *)self->_headerView setColorScheme:*p_colorScheme];
    id v5 = v10;
  }
}

- (id)headerViewForTableView:(id)a3
{
  if (!self->_headerView && ![(SKUITableViewSection *)self hidesHeaderView])
  {
    v4 = objc_alloc_init(SKUIProductPageTableExpandableHeaderView);
    headerView = self->_headerView;
    self->_headerView = v4;

    [(SKUIProductPageTableExpandableHeaderView *)self->_headerView setColorScheme:self->_colorScheme];
    v6 = self->_headerView;
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SKUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_UPDATE_HISTORY_TITLE" inTable:@"ProductPage"];
    }
    else {
    v8 = +[SKUIClientContext localizedStringForKey:@"PRODUCT_PAGE_UPDATE_HISTORY_TITLE" inBundles:0 inTable:@"ProductPage"];
    }
    [(SKUIProductPageTableExpandableHeaderView *)v6 setTitle:v8];

    v9 = self->_headerView;
    v10 = [(SKUIColorScheme *)self->_colorScheme primaryTextColor];
    if (v10)
    {
      [(SKUIProductPageTableExpandableHeaderView *)v9 setBottomBorderColor:v10];
    }
    else
    {
      objc_super v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
      [(SKUIProductPageTableExpandableHeaderView *)v9 setBottomBorderColor:v11];
    }
    [(SKUIProductPageTableExpandableHeaderView *)self->_headerView sizeToFit];
    [(SKUIProductPageTableUpdateHistorySection *)self _reloadHeaderView];
  }
  v12 = self->_headerView;

  return v12;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "row", a3);
  v6 = [(SKUILayoutCache *)self->_textLayoutCache layoutForIndex:self->_firstStringIndex + v5];
  [(SKUIProductPageTableSection *)self heightForTextLayout:v6 isExpanded:[(NSMutableIndexSet *)self->_expandedIndexSet containsIndex:v5]];
  double v8 = v7;

  return v8;
}

- (int64_t)numberOfRowsInSection
{
  if (![(SKUIProductPageTableSection *)self isExpanded]) {
    return 0;
  }
  releaseNotes = self->_releaseNotes;

  return [(NSArray *)releaseNotes count];
}

- (id)selectionActionForTableView:(id)a3 indexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "row", a3);
  v6 = [(SKUILayoutCache *)self->_textLayoutCache layoutForIndex:self->_firstStringIndex + v5];
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
      double v8 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
      v9 = self->_expandedIndexSet;
      self->_expandedIndexSet = v8;

      expandedIndexSet = self->_expandedIndexSet;
    }
    [(NSMutableIndexSet *)expandedIndexSet addIndex:v5];
    v10 = +[SKUIProductPageAction actionWithType:0];
  }

  return v10;
}

- (void)setExpanded:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIProductPageTableUpdateHistorySection;
  [(SKUIProductPageTableSection *)&v4 setExpanded:a3];
  [(SKUIProductPageTableUpdateHistorySection *)self _reloadHeaderView];
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  double v7 = [(SKUIProductPageTableSection *)self textBoxTableViewCellForTableView:a3 indexPath:v6];
  double v8 = [(SKUIColorScheme *)self->_colorScheme primaryTextColor];
  if (v8)
  {
    [v7 setBottomBorderColor:v8];
  }
  else
  {
    v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [v7 setBottomBorderColor:v9];
  }
  if (SKUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    [v7 setBorderPaddingLeft:30.0];
    objc_msgSend(v7, "setTextBoxInsets:", 0.0, 15.0, 0.0, 0.0);
  }
  uint64_t v10 = [v6 row];
  objc_super v11 = [(SKUILayoutCache *)self->_textLayoutCache layoutForIndex:self->_firstStringIndex + v10];
  v12 = [v7 textBoxView];
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "setFixedWidthTextFrame:", objc_msgSend(v11, "textFrame"));
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SKUIClientContext *)clientContext localizedStringForKey:@"MORE_BUTTON"];
    }
    else {
    v15 = +[SKUIClientContext localizedStringForKey:@"MORE_BUTTON" inBundles:0];
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
        [(SKUIClientContext *)v19 localizedStringForKey:@"PRODUCT_PAGE_UPDATED_DATE" inTable:@"ProductPage"];
      }
      else {
      v21 = +[SKUIClientContext localizedStringForKey:@"PRODUCT_PAGE_UPDATED_DATE" inBundles:0 inTable:@"ProductPage"];
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
        [(SKUIClientContext *)v25 localizedStringForKey:@"PRODUCT_PAGE_UPDATED_VERSION" inTable:@"ProductPage"];
      }
      else {
      v27 = +[SKUIClientContext localizedStringForKey:@"PRODUCT_PAGE_UPDATED_VERSION" inBundles:0 inTable:@"ProductPage"];
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
  BOOL v3 = [(SKUIProductPageTableSection *)self isExpanded];
  headerView = self->_headerView;
  if (v3)
  {
    uint64_t v5 = self->_headerView;
    [(SKUIProductPageTableExpandableHeaderView *)v5 setActionString:0];
  }
  else
  {
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SKUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_SHOW_UPDATE_HISTORY_BUTTON" inTable:@"ProductPage"];
    }
    else {
    id v7 = +[SKUIClientContext localizedStringForKey:@"PRODUCT_PAGE_SHOW_UPDATE_HISTORY_BUTTON" inBundles:0 inTable:@"ProductPage"];
    }
    [(SKUIProductPageTableExpandableHeaderView *)headerView setActionString:v7];
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

- (SKUILayoutCache)textLayoutCache
{
  return self->_textLayoutCache;
}

- (void)setTextLayoutCache:(id)a3
{
}

- (SKUIColorScheme)colorScheme
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

- (void)initWithClientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProductPageTableUpdateHistorySection initWithClientContext:]";
}

@end