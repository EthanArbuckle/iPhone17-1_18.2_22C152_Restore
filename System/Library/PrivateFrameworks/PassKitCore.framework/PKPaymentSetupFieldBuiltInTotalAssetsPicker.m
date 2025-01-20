@interface PKPaymentSetupFieldBuiltInTotalAssetsPicker
- (BOOL)isBuiltIn;
- (PKPaymentSetupFieldBuiltInTotalAssetsPicker)initWithIdentifier:(id)a3 type:(unint64_t)a4;
@end

@implementation PKPaymentSetupFieldBuiltInTotalAssetsPicker

- (PKPaymentSetupFieldBuiltInTotalAssetsPicker)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupFieldBuiltInTotalAssetsPicker;
  v9 = [(PKPaymentSetupField *)&v12 initWithIdentifier:@"totalAssetsPicker" type:a4];
  if (v9)
  {
    v10 = PKLocalizedFeatureString(@"TOTAL_ASSETS", 2, 0, v4, v5, v6, v7, v8, (uint64_t)v12.receiver);
    [(PKPaymentSetupField *)v9 _setLocalizedDisplayName:v10];
  }
  return v9;
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end