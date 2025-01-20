@interface PKPaymentPassDetailBalanceSectionController
+ (BOOL)validForPaymentPass:(id)a3;
- (NSString)footerText;
- (PKCurrencyAmount)balance;
- (PKPaymentPassDetailBalanceSectionController)initWithDelegate:(id)a3;
- (PKPaymentPassDetailWrapperSectionControllerDelegate)delegate;
- (id)allSectionIdentifiers;
- (id)sectionIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)titleForFooterInSectionIdentifier:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (void)setBalance:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterText:(id)a3;
@end

@implementation PKPaymentPassDetailBalanceSectionController

- (PKPaymentPassDetailBalanceSectionController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPassDetailBalanceSectionController;
  v5 = [(PKPaymentPassDetailSectionController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)setBalance:(id)a3
{
  objc_storeStrong((id *)&self->_balance, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [(PKPaymentPassDetailBalanceSectionController *)self sectionIdentifiers];
  [WeakRetained reloadSections:v4];
}

- (id)allSectionIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"BalanceSection";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)sectionIdentifiers
{
  if ([(PKPaymentPassDetailSectionController *)self currentSegment] || !self->_balance)
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v3 = [(PKPaymentPassDetailBalanceSectionController *)self allSectionIdentifiers];
  }

  return v3;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  v3 = [a3 devicePrimaryPaymentApplication];
  BOOL v4 = [v3 paymentNetworkIdentifier] == 135;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v6 = a3;
  v7 = PKLocalizedPaymentString(&cfstr_PassDetailsDef.isa);
  objc_super v8 = [(PKCurrencyAmount *)self->_balance formattedStringValue];
  v9 = [(PKPaymentPassDetailSectionController *)self infoCellWithPrimaryText:v7 detailText:v8 cellStyle:1 forTableView:v6];

  [v9 setSelectionStyle:0];

  return v9;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  return self->_footerText;
}

- (PKPaymentPassDetailWrapperSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentPassDetailWrapperSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKCurrencyAmount)balance
{
  return self->_balance;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_balance, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end