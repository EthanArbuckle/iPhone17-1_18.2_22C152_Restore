@interface SUUIGiftSendDateSection
- (NSDate)sendDate;
- (SUUIGiftSendDateSectionDelegate)delegate;
- (SUUIItem)giftItem;
- (UIEdgeInsets)headerInsets;
- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4;
- (id)_headerView;
- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (int64_t)numberOfRowsInSection;
- (int64_t)sendDateStyle;
- (void)giftDateTableViewCell:(id)a3 didChangeDate:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setGiftItem:(id)a3;
- (void)setHeaderInsets:(UIEdgeInsets)a3;
- (void)setSendDate:(id)a3;
- (void)setSendDateStyle:(int64_t)a3;
- (void)updateCell:(id)a3 forTransitionToSize:(CGSize)a4;
@end

@implementation SUUIGiftSendDateSection

- (UIEdgeInsets)headerInsets
{
  v2 = [(SUUIGiftSendDateSection *)self _headerView];
  [v2 contentInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setHeaderInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v7 = [(SUUIGiftSendDateSection *)self _headerView];
  objc_msgSend(v7, "setContentInsets:", top, left, bottom, right);
  [v7 sizeToFit];
}

- (void)setSendDate:(id)a3
{
  double v4 = (NSDate *)a3;
  if (self->_sendDate != v4)
  {
    id v7 = v4;
    if (v4)
    {
      double v5 = (NSDate *)[(NSDate *)v4 copy];
    }
    else
    {
      double v5 = [MEMORY[0x263EFF910] date];
    }
    sendDate = self->_sendDate;
    self->_sendDate = v5;

    double v4 = v7;
  }
}

- (void)updateCell:(id)a3 forTransitionToSize:(CGSize)a4
{
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  return 45.0;
}

- (int64_t)numberOfRowsInSection
{
  return 1;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"GDT", a4);
  double v5 = (SUUIGiftDateTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    double v5 = [[SUUIGiftDateTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"GDT"];
    double v6 = [(SUUIGiftTableViewSection *)self giftConfiguration];
    [(SUUIGiftDateTableViewCell *)v5 setGiftConfiguration:v6];
  }
  [(SUUIGiftDateTableViewCell *)v5 setChecked:1];
  [(SUUIGiftDateTableViewCell *)v5 setDate:self->_sendDate];
  [(SUUIGiftDateTableViewCell *)v5 setDelegate:self];
  [(SUUIGiftDateTableViewCell *)v5 setPlaceholder:0];
  return v5;
}

- (id)_headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    double v4 = [(SUUIGiftTableViewSection *)self giftConfiguration];
    double v5 = [v4 clientContext];

    double v6 = objc_alloc_init(SUUIGiftTableSectionHeaderView);
    id v7 = self->_headerView;
    self->_headerView = v6;

    double v8 = self->_headerView;
    if (v5) {
      [v5 localizedStringForKey:@"GIFTING_DATE_SECTION_HEADER" inTable:@"Gifting"];
    }
    else {
    double v9 = +[SUUIClientContext localizedStringForKey:@"GIFTING_DATE_SECTION_HEADER" inBundles:0 inTable:@"Gifting"];
    }
    [(SUUIGiftTableSectionHeaderView *)v8 setLabel:v9];

    [(SUUIGiftTableSectionHeaderView *)self->_headerView sizeToFit];
    headerView = self->_headerView;
  }
  return headerView;
}

- (void)giftDateTableViewCell:(id)a3 didChangeDate:(id)a4
{
  objc_storeStrong((id *)&self->_sendDate, a4);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained giftSendDateSection:self didChangeDate:v6];
}

- (SUUIGiftSendDateSectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUIGiftSendDateSectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SUUIItem)giftItem
{
  return self->_giftItem;
}

- (void)setGiftItem:(id)a3
{
}

- (NSDate)sendDate
{
  return self->_sendDate;
}

- (int64_t)sendDateStyle
{
  return self->_sendDateStyle;
}

- (void)setSendDateStyle:(int64_t)a3
{
  self->_sendDateStyle = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sendDate, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_giftItem, 0);
}

@end