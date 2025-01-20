@interface PKPaymentSetupBankAppProductCell
- (PKPaymentSetupBankAppProductCell)init;
- (void)layoutSubviews;
@end

@implementation PKPaymentSetupBankAppProductCell

- (PKPaymentSetupBankAppProductCell)init
{
  v3 = [(id)objc_opt_class() reuseIdentifier];
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupBankAppProductCell;
  v4 = [(PKPaymentSetupBankAppProductCell *)&v8 initWithStyle:3 reuseIdentifier:v3];

  if (v4)
  {
    v5 = [(PKPaymentSetupBankAppProductCell *)v4 detailTextLabel];
    v6 = [MEMORY[0x1E4FB1618] separatorColor];
    [v5 setTextColor:v6];
  }
  return v4;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentSetupBankAppProductCell;
  [(PKPaymentSetupProductCell *)&v23 layoutSubviews];
  [(PKPaymentSetupProductCell *)self textLabelOffset];
  double v4 = v3;
  v5 = [(PKPaymentSetupBankAppProductCell *)self detailTextLabel];
  v6 = [(PKPaymentSetupBankAppProductCell *)self textLabel];
  v7 = [v5 text];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    [v6 frame];
    v9 = [(PKPaymentSetupBankAppProductCell *)self contentView];
    [v9 bounds];
    UIRectCenteredYInRect();
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    objc_msgSend(v6, "setFrame:", v11, v13, v15, v17);
  }
  if (v4 > 0.0)
  {
    [v5 frame];
    double y = v24.origin.y;
    CGFloat width = v24.size.width;
    double height = v24.size.height;
    v24.origin.x = v4;
    double v21 = CGRectGetWidth(v24);
    [(PKPaymentSetupBankAppProductCell *)self bounds];
    if (v21 >= CGRectGetWidth(v25) - v4)
    {
      [(PKPaymentSetupBankAppProductCell *)self bounds];
      double v22 = CGRectGetWidth(v27) - v4;
    }
    else
    {
      v26.origin.x = v4;
      v26.origin.double y = y;
      v26.size.CGFloat width = width;
      v26.size.double height = height;
      double v22 = CGRectGetWidth(v26);
    }
    objc_msgSend(v5, "setFrame:", v4, y, v22, height);
  }
}

@end