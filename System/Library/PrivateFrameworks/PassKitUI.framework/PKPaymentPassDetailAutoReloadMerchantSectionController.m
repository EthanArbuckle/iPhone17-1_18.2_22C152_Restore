@interface PKPaymentPassDetailAutoReloadMerchantSectionController
+ (BOOL)validForPaymentPass:(id)a3;
- (PKPaymentPassDetailAutoReloadActionSectionControllerDelegate)setupDelegate;
- (PKPaymentPassDetailAutoReloadMerchantSectionController)initWithPass:(id)a3 delegate:(id)a4;
- (id)allSectionIdentifiers;
- (id)sectionIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (void)setSetupDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
@end

@implementation PKPaymentPassDetailAutoReloadMerchantSectionController

- (PKPaymentPassDetailAutoReloadMerchantSectionController)initWithPass:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentPassDetailAutoReloadMerchantSectionController;
  v9 = [(PKPaymentPassDetailSectionController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pass, a3);
    objc_storeStrong((id *)&v10->_delegate, a4);
    v10->_isAutoTopEnabled = [(PKPaymentPass *)v10->_pass isAutoTopEnabled];
  }

  return v10;
}

- (id)allSectionIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AutoReloadMerchantSection";
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
    v3 = [(PKPaymentPassDetailAutoReloadMerchantSectionController *)self allSectionIdentifiers];
  }

  return v3;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  id v3 = a3;
  if ([v3 isAutoTopEnabled] && !objc_msgSend(v3, "activationState"))
  {
    v6 = +[PKPaymentPassDetailAutoReloadSectionController autoTopUpActionForPass:v3];
    if (v6)
    {
      id v7 = [v3 autoTopUpMerchantTokenIdentifier];
      BOOL v4 = v7 == 0;
    }
    else
    {
      BOOL v4 = 1;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  BOOL v4 = [(PKPaymentPass *)self->_pass autoTopUpFields];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v7 = a3;
  pass = self->_pass;
  id v9 = a4;
  v10 = [(PKPaymentPass *)pass autoTopUpFields];
  uint64_t v11 = [v9 row];

  objc_super v12 = [v10 objectAtIndex:v11];

  v13 = [v12 key];
  LODWORD(v11) = [v13 isEqualToString:*MEMORY[0x1E4F87500]];

  if (v11)
  {
    v14 = PKLocalizedPaymentString(&cfstr_PassDetailsAut.isa);
    if (self->_isAutoTopEnabled) {
      v15 = @"STATE_ON";
    }
    else {
      v15 = @"STATE_OFF";
    }
    v16 = PKLocalizedPaymentString(&v15->isa);
    v17 = [(PKPaymentPassDetailSectionController *)self infoCellWithPrimaryText:v14 detailText:v16 cellStyle:1 forTableView:v7];

    v18 = v17;
    uint64_t v19 = 0;
    goto LABEL_8;
  }
  v20 = [v12 key];
  int v21 = [v20 isEqualToString:*MEMORY[0x1E4F87508]];

  if (v21)
  {
    v22 = [(PKPaymentPass *)self->_pass organizationName];
    v23 = PKLocalizedPaymentString(&cfstr_PassDetailsMan.isa, &stru_1EF1B4C70.isa, v22);
    v17 = [(PKPaymentPassDetailSectionController *)self linkCellWithText:v23 forTableView:v7];

    v18 = v17;
    uint64_t v19 = 3;
LABEL_8:
    [v18 setSelectionStyle:v19];
    goto LABEL_10;
  }
  v17 = 0;
LABEL_10:

  return v17;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v17 = a3;
  id v7 = a4;
  if (PKEqualObjects())
  {
    [v17 deselectRowAtIndexPath:v7 animated:1];
    id v8 = [(PKPaymentPass *)self->_pass autoTopUpFields];
    id v9 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "row"));

    v10 = [v9 key];
    int v11 = [v10 isEqualToString:*MEMORY[0x1E4F87508]];

    if (v11)
    {
      objc_super v12 = [v9 link];
      p_setupDelegate = &self->_setupDelegate;
      id WeakRetained = objc_loadWeakRetained((id *)p_setupDelegate);
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        id v16 = objc_loadWeakRetained((id *)p_setupDelegate);
        [v16 launchURL:v12];
      }
    }
  }
}

- (PKPaymentPassDetailAutoReloadActionSectionControllerDelegate)setupDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupDelegate);

  return (PKPaymentPassDetailAutoReloadActionSectionControllerDelegate *)WeakRetained;
}

- (void)setSetupDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_setupDelegate);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end