@interface PKPaymentAutoReloadSetupSectionController
+ (BOOL)validForPaymentPass:(id)a3;
- (PKPaymentAutoReloadSetupSectionController)initWithDelegate:(id)a3;
- (id)allSectionIdentifiers;
- (id)sectionIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)titleForFooterInSectionIdentifier:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
@end

@implementation PKPaymentAutoReloadSetupSectionController

- (PKPaymentAutoReloadSetupSectionController)initWithDelegate:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentAutoReloadSetupSectionController;
  v6 = [(PKPaymentPassDetailSectionController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_delegate, a3);
  }

  return v7;
}

- (id)allSectionIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AutoReloadSetupSection";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)sectionIdentifiers
{
  if ([(PKPaymentPassDetailSectionController *)self currentSegment])
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v3 = [(PKPaymentAutoReloadSetupSectionController *)self allSectionIdentifiers];
  }

  return v3;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  id v3 = a3;
  v4 = +[PKPaymentPassDetailAutoReloadSectionController autoTopUpActionForPass:v3];
  if (v4) {
    BOOL v5 = [v3 activationState] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return 1;
}

- (id)titleForFooterInSectionIdentifier:(id)a3
{
  return (id)PKLocalizedPaymentString(&cfstr_PassDetailsSet.isa);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v6 = a3;
  v7 = PKLocalizedPaymentString(&cfstr_PassDetailsUse.isa);
  v8 = [(PKPaymentPassDetailSectionController *)self linkCellWithText:v7 forTableView:v6];

  [v8 setSelectionStyle:3];

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v8 = a3;
  id v7 = a4;
  if (PKEqualObjects())
  {
    [v8 deselectRowAtIndexPath:v7 animated:1];
    if (objc_opt_respondsToSelector()) {
      [(PKPaymentPassDetailAutoReloadActionSectionControllerDelegate *)self->_delegate presentAutoReloadSetupViewController];
    }
  }
}

- (void).cxx_destruct
{
}

@end