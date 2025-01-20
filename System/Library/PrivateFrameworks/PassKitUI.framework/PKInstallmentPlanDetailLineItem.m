@interface PKInstallmentPlanDetailLineItem
- (BOOL)hasTrailingLineSeperator;
- (BOOL)isEmphasized;
- (NSString)label;
- (NSString)value;
- (PKInstallmentPlanDetailLineItem)initWithLineItem:(id)a3 currencyCode:(id)a4;
- (unint64_t)lineItemType;
- (void)setHasTrailingLineSeperator:(BOOL)a3;
@end

@implementation PKInstallmentPlanDetailLineItem

- (PKInstallmentPlanDetailLineItem)initWithLineItem:(id)a3 currencyCode:(id)a4
{
  id v6 = a3;
  v7 = (NSString *)a4;
  v26.receiver = self;
  v26.super_class = (Class)PKInstallmentPlanDetailLineItem;
  v8 = [(PKInstallmentPlanDetailLineItem *)&v26 init];
  if (v8)
  {
    uint64_t v9 = [v6 type];
    uint64_t v10 = [v6 state];
    v11 = [v6 amount];

    v12 = 0;
    if (v7 && v11)
    {
      v13 = [v6 amount];
      v12 = PKCurrencyAmountCreate(v13, v7);
    }
    switch(v9)
    {
      case 0:
      case 4:
        v14 = [v6 itemDescription];
        if (v14) {
          goto LABEL_17;
        }
        v15 = @"OTHER_LINE_ITEM";
        goto LABEL_19;
      case 1:
        v14 = [v6 itemDescription];
        if (v14) {
          goto LABEL_17;
        }
        v15 = @"PRODUCT_LINE_ITEM";
        goto LABEL_19;
      case 2:
        v17 = @"TAX_LINE_ITEM";
        goto LABEL_13;
      case 3:
        v17 = @"SHIPPING_LINE_ITEM";
LABEL_13:
        PKLocalizedBeekmanString(&v17->isa);
        v16 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      case 5:
        PKLocalizedBeekmanString(&cfstr_InstallmentTra.isa);
        v16 = (NSString *)objc_claimAutoreleasedReturnValue();
        if (v10 == 3) {
          goto LABEL_22;
        }
        uint64_t v18 = [v12 negativeValue];

        v12 = (void *)v18;
        goto LABEL_23;
      case 6:
        v14 = [v6 itemDescription];
        if (v14)
        {
LABEL_17:
          v19 = v14;
        }
        else
        {
          v15 = @"ACCESSORY_LINE_ITEM";
LABEL_19:
          PKLocalizedBeekmanString(&v15->isa);
          v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        v16 = v19;

LABEL_21:
        if (v10 == 3)
        {
LABEL_22:
          uint64_t v20 = PKLocalizedBeekmanString(&cfstr_InstallmentLin.isa);
        }
        else
        {
LABEL_23:
          uint64_t v20 = [v12 formattedStringValue];
        }
        v21 = (NSString *)v20;
        label = v8->_label;
        v8->_label = v16;
        v23 = v16;

        value = v8->_value;
        v8->_value = v21;

        break;
      default:
        v16 = 0;
        goto LABEL_21;
    }
  }

  return v8;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)value
{
  return self->_value;
}

- (BOOL)isEmphasized
{
  return 0;
}

- (unint64_t)lineItemType
{
  return 8;
}

- (BOOL)hasTrailingLineSeperator
{
  return self->_hasTrailingLineSeperator;
}

- (void)setHasTrailingLineSeperator:(BOOL)a3
{
  self->_hasTrailingLineSeperator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end