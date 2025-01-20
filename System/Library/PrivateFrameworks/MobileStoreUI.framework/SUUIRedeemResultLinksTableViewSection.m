@interface SUUIRedeemResultLinksTableViewSection
- (SUUIRedeemResultLinksTableViewSection)initWithLinks:(id)a3;
- (UIEdgeInsets)contentInsets;
- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4;
- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (int64_t)numberOfRowsInSection;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forIndexPath:(id)a5;
@end

@implementation SUUIRedeemResultLinksTableViewSection

- (SUUIRedeemResultLinksTableViewSection)initWithLinks:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIRedeemResultLinksTableViewSection;
  v5 = [(SUUIRedeemResultLinksTableViewSection *)&v9 init];
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
  v7 = [a3 dequeueReusableCellWithIdentifier:@"SUUIRRLTVC"];
  if (!v7)
  {
    v7 = [[SUUITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"SUUIRRLTVC"];
    [(SUUITableViewCell *)v7 setAccessoryType:1];
    v8 = [(SUUITableViewCell *)v7 textLabel];
    objc_super v9 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
    [v8 setFont:v9];
  }
  v10 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
  [(SUUITableViewCell *)v7 setTopBorderColor:v10];
  v11 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(SUUITableViewCell *)v7 setBorderPaddingLeft:30.0];
    -[SUUITableViewCell setTextLabelInsets:](v7, "setTextLabelInsets:", 0.0, 15.0, 0.0, -15.0);
  }
  NSUInteger v13 = [(NSArray *)self->_links count];
  if ([v6 row] == v13 - 1) {
    [(SUUITableViewCell *)v7 setBottomBorderColor:v10];
  }
  v14 = -[NSArray objectAtIndex:](self->_links, "objectAtIndex:", [v6 row]);
  v15 = [(SUUITableViewCell *)v7 textLabel];
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

@end