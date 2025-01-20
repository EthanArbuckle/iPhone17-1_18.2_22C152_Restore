@interface SKUIGiftSendDateSection
- (NSDate)sendDate;
- (SKUIGiftSendDateSectionDelegate)delegate;
- (SKUIItem)giftItem;
- (UIEdgeInsets)headerInsets;
- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4;
- (id)_headerView;
- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (int64_t)numberOfRowsInSection;
- (int64_t)sendDateStyle;
- (void)giftDateTableViewCell:(id)a3 didChangeDate:(id)a4;
- (void)headerInsets;
- (void)numberOfRowsInSection;
- (void)setDelegate:(id)a3;
- (void)setGiftItem:(id)a3;
- (void)setHeaderInsets:(UIEdgeInsets)a3;
- (void)setSendDate:(id)a3;
- (void)setSendDateStyle:(int64_t)a3;
- (void)updateCell:(id)a3 forTransitionToSize:(CGSize)a4;
@end

@implementation SKUIGiftSendDateSection

- (UIEdgeInsets)headerInsets
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIGiftSendDateSection *)v3 headerInsets];
      }
    }
  }
  v11 = [(SKUIGiftSendDateSection *)self _headerView];
  [v11 contentInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (void)setHeaderInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIGiftSendDateSection setHeaderInsets:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  double v16 = [(SKUIGiftSendDateSection *)self _headerView];
  objc_msgSend(v16, "setContentInsets:", top, left, bottom, right);
  [v16 sizeToFit];
}

- (void)setSendDate:(id)a3
{
  uint64_t v4 = (NSDate *)a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIGiftSendDateSection setSendDate:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  if (self->_sendDate != v4)
  {
    if (v4)
    {
      uint64_t v13 = (NSDate *)[(NSDate *)v4 copy];
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    }
    sendDate = self->_sendDate;
    self->_sendDate = v13;
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
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIGiftSendDateSection *)v2 numberOfRowsInSection];
      }
    }
  }
  return 1;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"GDT", a4);
  uint64_t v5 = (SKUIGiftDateTableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    uint64_t v5 = [[SKUIGiftDateTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"GDT"];
    uint64_t v6 = [(SKUIGiftTableViewSection *)self giftConfiguration];
    [(SKUIGiftDateTableViewCell *)v5 setGiftConfiguration:v6];
  }
  [(SKUIGiftDateTableViewCell *)v5 setChecked:1];
  [(SKUIGiftDateTableViewCell *)v5 setDate:self->_sendDate];
  [(SKUIGiftDateTableViewCell *)v5 setDelegate:self];
  [(SKUIGiftDateTableViewCell *)v5 setPlaceholder:0];
  [(SKUIGiftDateTableViewCell *)v5 setSelectionStyle:0];

  return v5;
}

- (id)_headerView
{
  headerView = self->_headerView;
  if (!headerView)
  {
    uint64_t v4 = [(SKUIGiftTableViewSection *)self giftConfiguration];
    uint64_t v5 = [v4 clientContext];

    uint64_t v6 = objc_alloc_init(SKUIGiftTableSectionHeaderView);
    uint64_t v7 = self->_headerView;
    self->_headerView = v6;

    uint64_t v8 = self->_headerView;
    if (v5) {
      [v5 localizedStringForKey:@"GIFTING_DATE_SECTION_HEADER" inTable:@"Gifting"];
    }
    else {
    uint64_t v9 = +[SKUIClientContext localizedStringForKey:@"GIFTING_DATE_SECTION_HEADER" inBundles:0 inTable:@"Gifting"];
    }
    [(SKUIGiftTableSectionHeaderView *)v8 setLabel:v9];

    [(SKUIGiftTableSectionHeaderView *)self->_headerView sizeToFit];
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

- (SKUIGiftSendDateSectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUIGiftSendDateSectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SKUIItem)giftItem
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

- (void)headerInsets
{
}

- (void)setHeaderInsets:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setSendDate:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)numberOfRowsInSection
{
}

@end