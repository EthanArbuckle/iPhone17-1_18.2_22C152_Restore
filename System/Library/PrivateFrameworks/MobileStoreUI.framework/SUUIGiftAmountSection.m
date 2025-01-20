@interface SUUIGiftAmountSection
- (NSString)selectedAmountString;
- (UIControl)amountControl;
- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4;
- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (int64_t)numberOfRowsInSection;
- (int64_t)selectedAmount;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forIndexPath:(id)a5;
@end

@implementation SUUIGiftAmountSection

- (UIControl)amountControl
{
  amountControl = self->_amountControl;
  if (!amountControl)
  {
    v4 = [SUUIGiftAmountControl alloc];
    v5 = [(SUUIGiftTableViewSection *)self giftConfiguration];
    v6 = [(SUUIGiftAmountControl *)v4 initWithGiftConfiguration:v5];
    v7 = self->_amountControl;
    self->_amountControl = v6;

    [(SUUIGiftAmountControl *)self->_amountControl setAutoresizingMask:18];
    amountControl = self->_amountControl;
  }
  return (UIControl *)amountControl;
}

- (int64_t)selectedAmount
{
  return [(SUUIGiftAmountControl *)self->_amountControl selectedAmount];
}

- (NSString)selectedAmountString
{
  return [(SUUIGiftAmountControl *)self->_amountControl selectedAmountString];
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3, a4);
  uint64_t v5 = [v4 userInterfaceIdiom];

  double result = 152.0;
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 116.0;
  }
  return result;
}

- (int64_t)numberOfRowsInSection
{
  return 1;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"GAM", a4);
  if (!v5)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:@"GAM"];
    [v5 setSelectionStyle:0];
  }
  v6 = [(SUUIGiftAmountSection *)self amountControl];
  v7 = [v5 contentView];
  [v7 bounds];
  objc_msgSend(v6, "setFrame:");
  [v7 addSubview:v6];

  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = [a3 backgroundColor];
  [(SUUIGiftAmountControl *)self->_amountControl setBackgroundColor:v8];
  [v7 setBackgroundColor:v8];
}

- (void).cxx_destruct
{
}

@end