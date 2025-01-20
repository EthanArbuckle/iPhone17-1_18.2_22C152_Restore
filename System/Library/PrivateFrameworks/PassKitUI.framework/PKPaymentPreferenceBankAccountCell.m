@interface PKPaymentPreferenceBankAccountCell
- (PKBankAccountInformation)bankAccount;
- (PKPaymentPreferenceBankAccountCell)initWithReuseIdentifier:(id)a3;
- (void)_updateCellContent;
- (void)_updateSubtitleLabel;
- (void)setBankAccount:(id)a3;
@end

@implementation PKPaymentPreferenceBankAccountCell

- (PKPaymentPreferenceBankAccountCell)initWithReuseIdentifier:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPreferenceBankAccountCell;
  v3 = [(PKPaymentPreferenceCardCell *)&v12 initWithReuseIdentifier:a3];
  if (v3)
  {
    v4 = PKPassKitUIBundle();
    v5 = [v4 URLForResource:@"Bank" withExtension:@"pdf"];

    PKPassFrontFaceContentSize();
    PKFloatRoundToPixel();
    CGFloat v7 = v6;
    double v8 = PKUIScreenScale();
    uint64_t v9 = PKUIImageFromPDF(v5, 66.0, v7, v8);
    bankIcon = v3->_bankIcon;
    v3->_bankIcon = (UIImage *)v9;
  }
  return v3;
}

- (void)setBankAccount:(id)a3
{
  objc_storeStrong((id *)&self->_bankAccount, a3);

  [(PKPaymentPreferenceBankAccountCell *)self _updateCellContent];
}

- (void)_updateCellContent
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPreferenceBankAccountCell;
  [(PKPaymentPreferenceCardCell *)&v6 _updateCellContent];
  v3 = [(PKPaymentPreferenceCardCell *)self displayLabel];
  v4 = [(PKBankAccountInformation *)self->_bankAccount bankName];
  [v3 setText:v4];

  v5 = [(PKPaymentPreferenceCardCell *)self cardArtView];
  [v5 setImage:self->_bankIcon];
}

- (void)_updateSubtitleLabel
{
  id v4 = [(PKPaymentPreferenceCardCell *)self subtitleLabel];
  v3 = [(PKBankAccountInformation *)self->_bankAccount maskedAccountNumber];
  [v4 setText:v3];
}

- (PKBankAccountInformation)bankAccount
{
  return self->_bankAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bankAccount, 0);

  objc_storeStrong((id *)&self->_bankIcon, 0);
}

@end