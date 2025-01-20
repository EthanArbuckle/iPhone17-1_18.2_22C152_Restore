@interface SKUIGiftAmountSection
- (NSString)selectedAmountString;
- (UIControl)amountControl;
- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4;
- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4;
- (int64_t)numberOfRowsInSection;
- (int64_t)selectedAmount;
- (void)amountControl;
- (void)numberOfRowsInSection;
- (void)selectedAmount;
- (void)selectedAmountString;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forIndexPath:(id)a5;
@end

@implementation SKUIGiftAmountSection

- (UIControl)amountControl
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIGiftAmountSection *)v3 amountControl];
      }
    }
  }
  amountControl = self->_amountControl;
  if (!amountControl)
  {
    v12 = [SKUIGiftAmountControl alloc];
    v13 = [(SKUIGiftTableViewSection *)self giftConfiguration];
    v14 = [(SKUIGiftAmountControl *)v12 initWithGiftConfiguration:v13];
    v15 = self->_amountControl;
    self->_amountControl = v14;

    [(SKUIGiftAmountControl *)self->_amountControl setAutoresizingMask:18];
    amountControl = self->_amountControl;
  }

  return (UIControl *)amountControl;
}

- (int64_t)selectedAmount
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIGiftAmountSection *)v3 selectedAmount];
      }
    }
  }
  return [(SKUIGiftAmountControl *)self->_amountControl selectedAmount];
}

- (NSString)selectedAmountString
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        [(SKUIGiftAmountSection *)v3 selectedAmountString];
      }
    }
  }
  v11 = [(SKUIGiftAmountControl *)self->_amountControl selectedAmountString];

  return (NSString *)v11;
}

- (double)heightForCellInTableView:(id)a3 indexPath:(id)a4
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB16C8], "currentDevice", a3, a4);
  uint64_t v5 = [v4 userInterfaceIdiom];

  double result = 152.0;
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 116.0;
  }
  return result;
}

- (int64_t)numberOfRowsInSection
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        [(SKUIGiftAmountSection *)v2 numberOfRowsInSection];
      }
    }
  }
  return 1;
}

- (id)tableViewCellForTableView:(id)a3 indexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"GAM", a4);
  if (!v5)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"GAM"];
    [v5 setSelectionStyle:0];
  }
  uint64_t v6 = [(SKUIGiftAmountSection *)self amountControl];
  uint64_t v7 = [v5 contentView];
  [v7 bounds];
  objc_msgSend(v6, "setFrame:");
  [v7 addSubview:v6];

  return v5;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = [a3 backgroundColor];
  [(SKUIGiftAmountControl *)self->_amountControl setBackgroundColor:v8];
  [v7 setBackgroundColor:v8];
}

- (void).cxx_destruct
{
}

- (void)amountControl
{
}

- (void)selectedAmount
{
}

- (void)selectedAmountString
{
}

- (void)numberOfRowsInSection
{
}

@end