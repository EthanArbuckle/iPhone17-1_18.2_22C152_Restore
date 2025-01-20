@interface PKPaymentSetupFieldBuiltInYearlyIncomeLabel
- (BOOL)isBuiltIn;
- (PKPaymentSetupFieldBuiltInYearlyIncomeLabel)initWithIdentifier:(id)a3 type:(unint64_t)a4;
@end

@implementation PKPaymentSetupFieldBuiltInYearlyIncomeLabel

- (PKPaymentSetupFieldBuiltInYearlyIncomeLabel)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v36.receiver = self;
  v36.super_class = (Class)PKPaymentSetupFieldBuiltInYearlyIncomeLabel;
  v9 = [(PKPaymentSetupField *)&v36 initWithIdentifier:@"yearlyIncomeLabel" type:a4];
  if (v9)
  {
    v10 = PKLocalizedFeatureString(@"INCOME_LABEL", 2, 0, v4, v5, v6, v7, v8, (uint64_t)v36.receiver);
    [(PKPaymentSetupField *)v9 setDefaultValue:v10];

    v16 = PKLocalizedFeatureString(@"INCOME_LABEL_BUTTON", 2, 0, v11, v12, v13, v14, v15, (uint64_t)v36.receiver);
    [(PKPaymentSetupFieldLabel *)v9 setButtonTitle:v16];

    v22 = PKLocalizedFeatureString(@"INCOME_DETAIL_TITLE", 2, 0, v17, v18, v19, v20, v21, (uint64_t)v36.receiver);
    [(PKPaymentSetupFieldLabel *)v9 setDetailTitle:v22];

    v28 = PKLocalizedFeatureString(@"INCOME_DETAIL_SUBTITLE", 2, 0, v23, v24, v25, v26, v27, (uint64_t)v36.receiver);
    [(PKPaymentSetupFieldLabel *)v9 setDetailSubtitle:v28];

    v34 = PKLocalizedFeatureString(@"INCOME_DETAIL_BODY", 2, 0, v29, v30, v31, v32, v33, (uint64_t)v36.receiver);
    [(PKPaymentSetupFieldLabel *)v9 setDetailBody:v34];

    [(PKPaymentSetupField *)v9 setRequiresSecureSubmission:0];
  }
  return v9;
}

- (BOOL)isBuiltIn
{
  return 1;
}

@end