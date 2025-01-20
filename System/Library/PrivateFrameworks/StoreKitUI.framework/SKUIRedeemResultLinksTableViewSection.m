@interface SKUIRedeemResultLinksTableViewSection
- (SKUIRedeemResultLinksTableViewSection)initWithLinks:(id)a3;
- (UIEdgeInsets)contentInsets;
- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4;
- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (int64_t)numberOfRowsInSection;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forIndexPath:(id)a5;
@end

@implementation SKUIRedeemResultLinksTableViewSection

- (SKUIRedeemResultLinksTableViewSection)initWithLinks:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRedeemResultLinksTableViewSection initWithLinks:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIRedeemResultLinksTableViewSection;
  v5 = [(SKUIRedeemResultLinksTableViewSection *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    links = v5->_links;
    v5->_links = (NSArray *)v6;
  }
  return v5;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  return 44.0;
}

- (int64_t)numberOfRowsInSection
{
  return [(NSArray *)self->_links count];
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"SKUIRRLTVC"];
  if (!v7)
  {
    v7 = [[SKUITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"SKUIRRLTVC"];
    [(SKUITableViewCell *)v7 setAccessoryType:1];
    v8 = [(SKUITableViewCell *)v7 textLabel];
    objc_super v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
    [v8 setFont:v9];
  }
  v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
  [(SKUITableViewCell *)v7 setTopBorderColor:v10];
  v11 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(SKUITableViewCell *)v7 setBorderPaddingLeft:30.0];
    -[SKUITableViewCell setTextLabelInsets:](v7, "setTextLabelInsets:", 0.0, 15.0, 0.0, -15.0);
  }
  NSUInteger v13 = [(NSArray *)self->_links count];
  if ([v6 row] == v13 - 1) {
    [(SKUITableViewCell *)v7 setBottomBorderColor:v10];
  }
  v14 = -[NSArray objectAtIndex:](self->_links, "objectAtIndex:", [v6 row]);
  v15 = [(SKUITableViewCell *)v7 textLabel];
  v16 = [v14 title];
  [v15 setText:v16];

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forIndexPath:(id)a5
{
  id v6 = a4;
  id v7 = [a3 backgroundColor];
  [v6 setBackgroundColor:v7];
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithLinks:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRedeemResultLinksTableViewSection initWithLinks:]";
}

@end