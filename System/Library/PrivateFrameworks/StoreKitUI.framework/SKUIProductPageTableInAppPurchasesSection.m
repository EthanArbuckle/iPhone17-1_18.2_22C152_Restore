@interface SKUIProductPageTableInAppPurchasesSection
- (SKUIColorScheme)colorScheme;
- (SKUIProductPageTableInAppPurchasesSection)initWithInAppPurchases:(id)a3 clientContext:(id)a4;
- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4;
- (id)headerViewForTableView:(id)a3;
- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (int64_t)numberOfRowsInSection;
- (void)_reloadHeaderView;
- (void)setColorScheme:(id)a3;
- (void)setExpanded:(BOOL)a3;
@end

@implementation SKUIProductPageTableInAppPurchasesSection

- (SKUIProductPageTableInAppPurchasesSection)initWithInAppPurchases:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProductPageTableInAppPurchasesSection initWithInAppPurchases:clientContext:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIProductPageTableInAppPurchasesSection;
  v8 = [(SKUIProductPageTableInAppPurchasesSection *)&v13 init];
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
  if (!self->_headerView && ![(SKUITableViewSection *)self hidesHeaderView])
  {
    v4 = objc_alloc_init(SKUIProductPageTableExpandableHeaderView);
    headerView = self->_headerView;
    self->_headerView = v4;

    [(SKUIProductPageTableExpandableHeaderView *)self->_headerView setColorScheme:self->_colorScheme];
    id v6 = self->_headerView;
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SKUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_IN_APPS_TITLE" inTable:@"ProductPage"];
    }
    else {
    v8 = +[SKUIClientContext localizedStringForKey:@"PRODUCT_PAGE_IN_APPS_TITLE" inBundles:0 inTable:@"ProductPage"];
    }
    [(SKUIProductPageTableExpandableHeaderView *)v6 setTitle:v8];

    [(SKUIProductPageTableExpandableHeaderView *)self->_headerView sizeToFit];
    [(SKUIProductPageTableInAppPurchasesSection *)self _reloadHeaderView];
  }
  v9 = self->_headerView;

  return v9;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (int64_t)numberOfRowsInSection
{
  if (![(SKUIProductPageTableSection *)self isExpanded]) {
    return 0;
  }
  inAppPurchases = self->_inAppPurchases;

  return [(NSArray *)inAppPurchases count];
}

- (void)setColorScheme:(id)a3
{
  v5 = (SKUIColorScheme *)a3;
  if (self->_colorScheme != v5)
  {
    objc_storeStrong((id *)&self->_colorScheme, a3);
    [(SKUIProductPageTableExpandableHeaderView *)self->_headerView setColorScheme:v5];
  }
}

- (void)setExpanded:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIProductPageTableInAppPurchasesSection;
  [(SKUIProductPageTableSection *)&v4 setExpanded:a3];
  [(SKUIProductPageTableInAppPurchasesSection *)self _reloadHeaderView];
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"IA"];
  if (!v7)
  {
    id v7 = [(SKUITableViewCell *)[SKUIProductPageInAppPurchaseTableCell alloc] initWithStyle:0 reuseIdentifier:@"IA"];
    v8 = [(SKUIColorScheme *)self->_colorScheme primaryTextColor];
    if (v8)
    {
      [(SKUITableViewCell *)v7 setBottomBorderColor:v8];
    }
    else
    {
      v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
      [(SKUITableViewCell *)v7 setBottomBorderColor:v9];
    }
  }
  if (SKUIUserInterfaceIdiom(self->_clientContext) == 1)
  {
    [(SKUITableViewCell *)v7 setBorderPaddingLeft:30.0];
    -[SKUIProductPageInAppPurchaseTableCell setContentInsets:](v7, "setContentInsets:", 0.0, 15.0, 0.0, 0.0);
  }
  uint64_t v10 = [v6 row];
  v11 = [(NSArray *)self->_inAppPurchases objectAtIndex:v10];
  [(SKUIProductPageInAppPurchaseTableCell *)v7 setColorScheme:self->_colorScheme];
  v12 = [v11 formattedPrice];
  [(SKUIProductPageInAppPurchaseTableCell *)v7 setPriceString:v12];

  objc_super v13 = [v11 name];
  [(SKUIProductPageInAppPurchaseTableCell *)v7 setProductName:v13];

  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    v15 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v16 = self->_numberFormatter;
    self->_numberFormatter = v15;

    [(NSNumberFormatter *)self->_numberFormatter setNumberStyle:1];
    [(NSNumberFormatter *)self->_numberFormatter setUsesGroupingSeparator:0];
    numberFormatter = self->_numberFormatter;
  }
  v17 = [NSNumber numberWithInteger:v10 + 1];
  v18 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v17];
  [(SKUIProductPageInAppPurchaseTableCell *)v7 setIndexString:v18];

  return v7;
}

- (void)_reloadHeaderView
{
  BOOL v3 = [(SKUIProductPageTableSection *)self isExpanded];
  headerView = self->_headerView;
  if (v3)
  {
    [(SKUIProductPageTableExpandableHeaderView *)self->_headerView setActionString:0];
  }
  else
  {
    clientContext = self->_clientContext;
    if (clientContext) {
      [(SKUIClientContext *)clientContext localizedStringForKey:@"PRODUCT_PAGE_SHOW_IN_APPS_BUTTON" inTable:@"ProductPage"];
    }
    else {
    id v6 = +[SKUIClientContext localizedStringForKey:@"PRODUCT_PAGE_SHOW_IN_APPS_BUTTON" inBundles:0 inTable:@"ProductPage"];
    }
    [(SKUIProductPageTableExpandableHeaderView *)headerView setActionString:v6];
  }
  id v7 = self->_headerView;
  uint64_t v8 = [(SKUIColorScheme *)self->_colorScheme primaryTextColor];
  id v10 = (id)v8;
  if (v8)
  {
    [(SKUIProductPageTableExpandableHeaderView *)v7 setBottomBorderColor:v8];
  }
  else
  {
    v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
    [(SKUIProductPageTableExpandableHeaderView *)v7 setBottomBorderColor:v9];
  }
}

- (SKUIColorScheme)colorScheme
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

- (void)initWithInAppPurchases:clientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIProductPageTableInAppPurchasesSection initWithInAppPurchases:clientContext:]";
}

@end