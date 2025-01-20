@interface SUUIProductPageTableInAppPurchasesSection
- (SUUIColorScheme)colorScheme;
- (SUUIProductPageTableInAppPurchasesSection)initWithInAppPurchases:(id)a3 clientContext:(id)a4;
- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4;
- (id)headerViewForTableView:(id)a3;
- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (int64_t)numberOfRowsInSection;
- (void)_reloadHeaderView;
- (void)setColorScheme:(id)a3;
- (void)setExpanded:(BOOL)a3;
@end

@implementation SUUIProductPageTableInAppPurchasesSection

- (SUUIProductPageTableInAppPurchasesSection)initWithInAppPurchases:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUUIProductPageTableInAppPurchasesSection;
  v8 = [(SUUIProductPageTableInAppPurchasesSection *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_clientContext, a4);
    uint64_t v10 = [v6 copy];
    inAppPurchases = v9->_inAppPurchases;
    v9->_inAppPurchases = (NSArray *)v10;
  }
  return v9;
}

- (id)headerViewForTableView:(id)a3
{
  if (!self->_headerView && ![(SUUITableViewSection *)self hidesHeaderView])
  {
    v4 = objc_alloc_init(SUUIProductPageTableExpandableHeaderView);
    headerView = self->_headerView;
    self->_headerView = v4;

    [(SUUIProductPageTableExpandableHeaderView *)self->_headerView setColorScheme:self->_colorScheme];
    id v6 = self->_headerView;
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_IN_APPS_TITLE" inTable:@"ProductPage"];
    }
    else {
    v8 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_IN_APPS_TITLE" inBundles:0 inTable:@"ProductPage"];
    }
    [(SUUIProductPageTableExpandableHeaderView *)v6 setTitle:v8];

    [(SUUIProductPageTableExpandableHeaderView *)self->_headerView sizeToFit];
    [(SUUIProductPageTableInAppPurchasesSection *)self _reloadHeaderView];
  }
  v9 = self->_headerView;
  return v9;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  return *MEMORY[0x263F839B8];
}

- (int64_t)numberOfRowsInSection
{
  if (![(SUUIProductPageTableSection *)self isExpanded]) {
    return 0;
  }
  inAppPurchases = self->_inAppPurchases;
  return [(NSArray *)inAppPurchases count];
}

- (void)setColorScheme:(id)a3
{
  v5 = (SUUIColorScheme *)a3;
  if (self->_colorScheme != v5)
  {
    objc_storeStrong((id *)&self->_colorScheme, a3);
    [(SUUIProductPageTableExpandableHeaderView *)self->_headerView setColorScheme:v5];
  }
}

- (void)setExpanded:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIProductPageTableInAppPurchasesSection;
  [(SUUIProductPageTableSection *)&v4 setExpanded:a3];
  [(SUUIProductPageTableInAppPurchasesSection *)self _reloadHeaderView];
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"IA"];
  if (!v7)
  {
    id v7 = [(SUUITableViewCell *)[SUUIProductPageInAppPurchaseTableCell alloc] initWithStyle:0 reuseIdentifier:@"IA"];
    v8 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
    if (v8)
    {
      [(SUUITableViewCell *)v7 setBottomBorderColor:v8];
    }
    else
    {
      v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
      [(SUUITableViewCell *)v7 setBottomBorderColor:v9];
    }
  }
  if (SUUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    [(SUUITableViewCell *)v7 setBorderPaddingLeft:30.0];
    -[SUUIProductPageInAppPurchaseTableCell setContentInsets:](v7, "setContentInsets:", 0.0, 15.0, 0.0, 0.0);
  }
  uint64_t v10 = [v6 row];
  v11 = [(NSArray *)self->_inAppPurchases objectAtIndex:v10];
  [(SUUIProductPageInAppPurchaseTableCell *)v7 setColorScheme:self->_colorScheme];
  v12 = [v11 formattedPrice];
  [(SUUIProductPageInAppPurchaseTableCell *)v7 setPriceString:v12];

  objc_super v13 = [v11 name];
  [(SUUIProductPageInAppPurchaseTableCell *)v7 setProductName:v13];

  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    v15 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x263F08A30]);
    v16 = self->_numberFormatter;
    self->_numberFormatter = v15;

    [(NSNumberFormatter *)self->_numberFormatter setNumberStyle:1];
    [(NSNumberFormatter *)self->_numberFormatter setUsesGroupingSeparator:0];
    numberFormatter = self->_numberFormatter;
  }
  v17 = [NSNumber numberWithInteger:v10 + 1];
  v18 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v17];
  [(SUUIProductPageInAppPurchaseTableCell *)v7 setIndexString:v18];

  return v7;
}

- (void)_reloadHeaderView
{
  BOOL v3 = [(SUUIProductPageTableSection *)self isExpanded];
  headerView = self->_headerView;
  if (v3)
  {
    [(SUUIProductPageTableExpandableHeaderView *)self->_headerView setActionString:0];
  }
  else
  {
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_SHOW_IN_APPS_BUTTON" inTable:@"ProductPage"];
    }
    else {
    id v6 = +[SUUIClientContext localizedStringForKey:@"PRODUCT_PAGE_SHOW_IN_APPS_BUTTON" inBundles:0 inTable:@"ProductPage"];
    }
    [(SUUIProductPageTableExpandableHeaderView *)headerView setActionString:v6];
  }
  id v7 = self->_headerView;
  uint64_t v8 = [(SUUIColorScheme *)self->_colorScheme primaryTextColor];
  id v10 = (id)v8;
  if (v8)
  {
    [(SUUIProductPageTableExpandableHeaderView *)v7 setBottomBorderColor:v8];
  }
  else
  {
    v9 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
    [(SUUIProductPageTableExpandableHeaderView *)v7 setBottomBorderColor:v9];
  }
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_inAppPurchases, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end