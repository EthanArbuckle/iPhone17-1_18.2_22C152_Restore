@interface PKPassDetailsCardInfoSectionController
+ (BOOL)_paymentApplicationShouldShowFullDPANForPass:(id)a3 paymentApplication:(id)a4;
+ (BOOL)_showExpressDetailsForPass:(id)a3 expressMode:(BOOL)a4 sectionMode:(unint64_t)a5;
+ (BOOL)canShowSectionForPaymentPass:(id)a3 expressPassController:(id)a4;
+ (BOOL)validForPaymentPass:(id)a3;
+ (unint64_t)_cardInfoSectionGenerateCellWithOutputForRowIndex:(int64_t)a3 pass:(id)a4 detailViewStyle:(int64_t)a5 sectionMode:(unint64_t)a6 expressMode:(BOOL)a7;
+ (unint64_t)_countOfRowsForPass:(id)a3 detailViewStyle:(int64_t)a4 sectionMode:(unint64_t)a5 expressMode:(BOOL)a6;
- (BOOL)_paymentApplicationShouldShowFullDPAN;
- (BOOL)_showExpressDetails;
- (BOOL)hideSectionTitles;
- (BOOL)shouldDrawBottomSeparatorForSectionIdentifier:(id)a3;
- (BOOL)shouldDrawTopSeparatorForSectionIdentifier:(id)a3;
- (BOOL)shouldHighlightRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4;
- (PKPassDetailsCardInfoSectionController)init;
- (PKPassDetailsCardInfoSectionController)initWithPass:(id)a3 peerPaymentAccount:(id)a4 mode:(unint64_t)a5 detailViewStyle:(int64_t)a6 delegate:(id)a7;
- (PKPassDetailsCardInfoSectionControllerDelegate)delegate;
- (id)_contextMenuConfigurationForCopyingText:(id)a3;
- (id)allSectionIdentifiers;
- (id)sectionIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5 sectionIdentifier:(id)a6;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (id)titleForHeaderInSectionIdentifier:(id)a3;
- (int64_t)editingStyleForRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4;
- (unint64_t)_cardInfoSectionGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5;
- (unint64_t)_countOfRows;
- (void)_expressPassDidChange;
- (void)_updateExpressPassInformation;
- (void)setHideSectionTitles:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
@end

@implementation PKPassDetailsCardInfoSectionController

+ (BOOL)validForPaymentPass:(id)a3
{
  return 1;
}

+ (BOOL)canShowSectionForPaymentPass:(id)a3 expressPassController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isExpressModeSupportedForPass:v6]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = [v7 hasEligibleExpressUpgradeRequestForPass:v6];
  }
  BOOL v9 = [a1 _countOfRowsForPass:v6 detailViewStyle:0 sectionMode:1 expressMode:v8] != 0;

  return v9;
}

- (PKPassDetailsCardInfoSectionController)init
{
  return 0;
}

- (PKPassDetailsCardInfoSectionController)initWithPass:(id)a3 peerPaymentAccount:(id)a4 mode:(unint64_t)a5 detailViewStyle:(int64_t)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PKPassDetailsCardInfoSectionController;
  v16 = [(PKPaymentPassDetailSectionController *)&v28 init];
  v17 = v16;
  if (v16)
  {
    v16->_sectionMode = a5;
    objc_storeStrong((id *)&v16->_pass, a3);
    uint64_t v18 = [(PKPaymentPass *)v17->_pass devicePrimaryPaymentApplication];
    paymentApplication = v17->_paymentApplication;
    v17->_paymentApplication = (PKPaymentApplication *)v18;

    objc_storeStrong((id *)&v17->_peerPaymentAccount, a4);
    v17->_detailViewStyle = a6;
    objc_storeWeak((id *)&v17->_delegate, v15);
    v20 = (PKPassLibraryDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E4F848A0]);
    passLibraryDataProvider = v17->_passLibraryDataProvider;
    v17->_passLibraryDataProvider = v20;

    v22 = (PKPaymentDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E4F84A88]);
    paymentServiceDataProvider = v17->_paymentServiceDataProvider;
    v17->_paymentServiceDataProvider = v22;

    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F846D8]) initWithPaymentDataProvider:v17->_paymentServiceDataProvider passLibraryDataProvider:v17->_passLibraryDataProvider isForWatch:v17->_detailViewStyle == 2];
    expressPassController = v17->_expressPassController;
    v17->_expressPassController = (PKExpressPassController *)v24;

    [(PKPassDetailsCardInfoSectionController *)v17 _updateExpressPassInformation];
    if ([(PKPassDetailsCardInfoSectionController *)v17 _showExpressDetails])
    {
      v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v26 addObserver:v17 selector:sel__expressPassDidChange name:@"PKExpressPassesViewControllerExpressPassChangedNotification" object:0];
    }
  }

  return v17;
}

- (id)allSectionIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"CardInfoSection";
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
    v3 = [(PKPassDetailsCardInfoSectionController *)self allSectionIdentifiers];
  }

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v13 = 0;
  int v9 = PKEqualObjects();
  v10 = 0;
  if (v9)
  {
    -[PKPassDetailsCardInfoSectionController _cardInfoSectionGenerateCellWithOutput:forRowIndex:tableView:](self, "_cardInfoSectionGenerateCellWithOutput:forRowIndex:tableView:", &v13, [v8 row], v7);
    v10 = v13;
  }
  id v11 = v10;

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v9 = a4;
  if (PKEqualObjects())
  {
    uint64_t v6 = [v9 row];
    unint64_t v7 = [(PKPassDetailsCardInfoSectionController *)self _countOfRows];
    if ([(PKPassDetailsCardInfoSectionController *)self _showExpressDetails])
    {
      if (v6 >= 1 && v7 - 1 == v6)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained cardInfoSectionControllerDidSelectExpressPassSettings:self];
      }
    }
  }
}

- (BOOL)shouldHighlightRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a3;
  if (PKEqualObjects())
  {
    uint64_t v6 = [v5 row];
    unint64_t v7 = [(PKPassDetailsCardInfoSectionController *)self _countOfRows];
    BOOL v8 = [(PKPassDetailsCardInfoSectionController *)self _showExpressDetails];
    BOOL v10 = v6 > 0 && v7 - 1 == v6;
    BOOL v11 = v8 && v10;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)titleForHeaderInSectionIdentifier:(id)a3
{
  id v4 = a3;
  if (self->_hideSectionTitles
    || self->_peerPaymentAccount
    || (-[PKPaymentPass associatedAccountServiceAccountIdentifier](self->_pass, "associatedAccountServiceAccountIdentifier"), v5 = objc_claimAutoreleasedReturnValue(), uint64_t v6 = [v5 length], v5, v6))
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = PKLocalizedPaymentString(&cfstr_CardInfoHeader.isa);
    if ([(PKPaymentPass *)self->_pass supportsBarcodePayment])
    {
      uint64_t v9 = PKLocalizedAquamanString(&cfstr_PassInfoHeader.isa);

      unint64_t v7 = (void *)v9;
    }
  }

  return v7;
}

- (int64_t)editingStyleForRowAtIndexPath:(id)a3 sectionIdentifier:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v5 = objc_msgSend(MEMORY[0x1E4FB1CC0], "configurationWithActions:", 0, a4, a5);
  [v5 setPerformsFirstActionWithFullSwipe:0];

  return v5;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5 sectionIdentifier:(id)a6
{
  id v8 = a3;
  id v9 = a4;
  if (!PKEqualObjects())
  {
    id v14 = 0;
    goto LABEL_14;
  }
  BOOL v10 = [v8 cellForRowAtIndexPath:v9];
  BOOL v11 = [v10 reuseIdentifier];
  int v12 = [v11 isEqualToString:@"PKTableViewCellReuseIdentifierCustomerServiceIdentifier"];

  if (!v12)
  {
    id v15 = [v10 reuseIdentifier];
    int v16 = [v15 isEqualToString:@"cardNumberCell"];

    if (!v16)
    {
      id v14 = 0;
      goto LABEL_13;
    }
    id v13 = [(PKPaymentApplication *)self->_paymentApplication sanitizedDPAN];
    if (v13
      && [(PKPassDetailsCardInfoSectionController *)self _paymentApplicationShouldShowFullDPAN])
    {
      v17 = PKFormattedSanitizedPAN();
      id v14 = [(PKPassDetailsCardInfoSectionController *)self _contextMenuConfigurationForCopyingText:v17];

      goto LABEL_11;
    }
LABEL_10:
    id v14 = 0;
    goto LABEL_11;
  }
  id v13 = [(PKPaymentPass *)self->_pass customerServiceIdentifier];
  if (![v13 length]) {
    goto LABEL_10;
  }
  id v14 = [(PKPassDetailsCardInfoSectionController *)self _contextMenuConfigurationForCopyingText:v13];
LABEL_11:

LABEL_13:
LABEL_14:

  return v14;
}

- (BOOL)shouldDrawTopSeparatorForSectionIdentifier:(id)a3
{
  return 1;
}

- (BOOL)shouldDrawBottomSeparatorForSectionIdentifier:(id)a3
{
  return 1;
}

- (unint64_t)_countOfRows
{
  if ([(PKPaymentPass *)self->_pass isAccessPass]) {
    return 0;
  }

  return [(PKPassDetailsCardInfoSectionController *)self _cardInfoSectionGenerateCellWithOutput:0 forRowIndex:0 tableView:0];
}

+ (unint64_t)_countOfRowsForPass:(id)a3 detailViewStyle:(int64_t)a4 sectionMode:(unint64_t)a5 expressMode:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  if ([v10 isAccessPass]) {
    unint64_t v11 = 0;
  }
  else {
    unint64_t v11 = [a1 _cardInfoSectionGenerateCellWithOutputForRowIndex:0 pass:v10 detailViewStyle:a4 sectionMode:a5 expressMode:v6];
  }

  return v11;
}

+ (unint64_t)_cardInfoSectionGenerateCellWithOutputForRowIndex:(int64_t)a3 pass:(id)a4 detailViewStyle:(int64_t)a5 sectionMode:(unint64_t)a6 expressMode:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a4;
  int v12 = [v11 fieldForKey:*MEMORY[0x1E4F87A28]];
  id v13 = [v12 value];

  uint64_t v14 = v13 != 0;
  if ([v11 isSuicaPass] & 1) != 0 || (objc_msgSend(v11, "isOctopusPass")) {
    goto LABEL_7;
  }
  id v15 = [v11 primaryAccountNumberSuffix];
  if (v15
    || ([v11 sanitizedPrimaryAccountNumber], (id v15 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v11 sanitizedPrimaryAccountName], (id v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_7:
    if (v13) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 1;
    }
    goto LABEL_10;
  }
  v22 = [v11 devicePrimaryPaymentApplication];
  int v23 = [a1 _paymentApplicationShouldShowFullDPANForPass:v11 paymentApplication:v22];

  uint64_t v24 = 1;
  if (v13) {
    uint64_t v24 = 2;
  }
  if (v23) {
    uint64_t v14 = v24;
  }
LABEL_10:
  int v16 = [v11 customerServiceIdentifier];

  if (v16) {
    uint64_t v17 = v14 + 1;
  }
  else {
    uint64_t v17 = v14;
  }
  int v18 = [(id)objc_opt_class() _showExpressDetailsForPass:v11 expressMode:v7 sectionMode:a6];
  uint64_t v19 = 1;
  if (!a5) {
    uint64_t v19 = 2;
  }
  if (!v18) {
    uint64_t v19 = 0;
  }
  unint64_t v20 = v17 + v19;

  return v20;
}

- (unint64_t)_cardInfoSectionGenerateCellWithOutput:(id *)a3 forRowIndex:(int64_t)a4 tableView:(id)a5
{
  id v8 = a5;
  if (self->_peerPaymentAccount)
  {
    unint64_t v9 = 0;
    goto LABEL_37;
  }
  int64_t v55 = a4;
  id v10 = [(PKPaymentPass *)self->_pass fieldForKey:*MEMORY[0x1E4F87A28]];
  id v11 = [v10 value];
  if (v11)
  {
    uint64_t v12 = 1;
    if (a3 && !v55)
    {
      if (PKHandsOnDemoModeEnabled()
        && (PKFakeCardholderName(),
            id v13 = objc_claimAutoreleasedReturnValue(),
            uint64_t v14 = [v13 length],
            v13,
            v14))
      {
        PKFakeCardholderName();
        id v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v15 = v11;
      }
      int v16 = v15;
      uint64_t v17 = PKLocalizedPaymentString(&cfstr_CardInfoName.isa);
      int v18 = -[PKPaymentPassDetailSectionController infoCellWithPrimaryText:detailText:cellStyle:forTableView:](self, "infoCellWithPrimaryText:detailText:cellStyle:forTableView:", v17, v16, [v10 cellStyle], v8);
      id v19 = *a3;
      *a3 = v18;

      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  unint64_t v20 = PKLocalizedPaymentString(&cfstr_CardInfoNumber.isa);
  v53 = v11;
  v54 = v10;
  if ([(PKPaymentPass *)self->_pass supportsBarcodePayment])
  {
    v21 = [(PKPaymentPass *)self->_pass organizationName];
    uint64_t v22 = PKLocalizedAquamanString(&cfstr_PassInfoAccoun.isa, &stru_1EF1B4C70.isa, v21, v11, v10);

    unint64_t v20 = (void *)v22;
  }
  if (![(PKPaymentPass *)self->_pass isSuicaPass])
  {
    if (![(PKPaymentPass *)self->_pass isOctopusPass]) {
      goto LABEL_20;
    }
LABEL_19:
    uint64_t v26 = PKSanitizedDeviceAccountNumberForPaymentApplication();
    goto LABEL_24;
  }
  uint64_t v23 = [(PKPaymentApplication *)self->_paymentApplication sanitizedDPAN];
  if (!v23) {
    goto LABEL_19;
  }
  uint64_t v24 = (void *)v23;
  char v25 = [(PKPaymentPass *)self->_pass isOctopusPass];

  if (v25) {
    goto LABEL_19;
  }
LABEL_20:
  v27 = [(PKPaymentPass *)self->_pass primaryAccountNumberSuffix];
  if (v27
    || ([(PKPaymentPass *)self->_pass sanitizedPrimaryAccountNumber],
        (v27 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_23:
    uint64_t v26 = PKSanitizedPrimaryAccountRepresentationForPass();
LABEL_24:
    objc_super v28 = (void *)v26;
    if (!v26) {
      goto LABEL_29;
    }
LABEL_25:
    if (a3 && v12 == v55)
    {
      v29 = [(PKPaymentPassDetailSectionController *)self infoCellWithPrimaryText:v20 detailText:v28 cellStyle:1 reuseIdentifier:@"cardNumberCell" forTableView:v8];
      v30 = [v29 detailTextLabel];
      [v30 setAdjustsFontSizeToFitWidth:1];

      id v31 = *a3;
      *a3 = v29;
    }
    ++v12;
    goto LABEL_29;
  }
  v50 = [(PKPaymentPass *)self->_pass sanitizedPrimaryAccountName];

  if (v50) {
    goto LABEL_23;
  }
  if (![(PKPassDetailsCardInfoSectionController *)self _paymentApplicationShouldShowFullDPAN])
  {
    objc_super v28 = 0;
    goto LABEL_29;
  }
  v51 = [(PKPaymentApplication *)self->_paymentApplication sanitizedDPAN];
  objc_super v28 = PKFormattedSanitizedPAN();

  uint64_t v52 = PKLocalizedPaymentString(&cfstr_CardInfoDigita.isa);

  unint64_t v20 = (void *)v52;
  if (v28) {
    goto LABEL_25;
  }
LABEL_29:
  v32 = [(PKPaymentPass *)self->_pass customerServiceIdentifier];
  if (v32)
  {
    unint64_t v9 = v12 + 1;
    if (a3)
    {
      BOOL v33 = v12 == v55;
      a4 = v55;
      if (v33)
      {
        v34 = PKPassLocalizedStringWithFormat();
        v35 = [(PKPaymentPassDetailSectionController *)self infoCellWithPrimaryText:v34, v32, 1, @"PKTableViewCellReuseIdentifierCustomerServiceIdentifier", v8, 0 detailText cellStyle reuseIdentifier forTableView];

        v36 = [v35 detailTextLabel];
        [v36 setAdjustsFontSizeToFitWidth:1];

        id v37 = *a3;
        *a3 = v35;
      }
      goto LABEL_36;
    }
  }
  else
  {
    unint64_t v9 = v12;
  }
  a4 = v55;
LABEL_36:

LABEL_37:
  if (![(PKPassDetailsCardInfoSectionController *)self _showExpressDetails])
  {
    unint64_t v39 = v9;
    goto LABEL_53;
  }
  int64_t detailViewStyle = self->_detailViewStyle;
  if (a3)
  {
    unint64_t v39 = v9 + 1;
    if (v9 == a4)
    {
      v40 = PKLocalizedPaymentString(&cfstr_ExpressTransit.isa);
      if (self->_expressModeEnabled) {
        v41 = @"EXPRESS_MODE_STATE_ON";
      }
      else {
        v41 = @"EXPRESS_MODE_STATE_OFF";
      }
      v42 = PKLocalizedPaymentString(&v41->isa);
      v43 = [(PKPaymentPassDetailSectionController *)self infoCellWithPrimaryText:v40 detailText:v42 cellStyle:1 reuseIdentifier:@"expressState" forTableView:v8];
      id v44 = *a3;
      *a3 = v43;

      if (detailViewStyle)
      {
        [*a3 setAccessoryType:1];
        goto LABEL_53;
      }
    }
    else if (detailViewStyle)
    {
      goto LABEL_53;
    }
    if (v39 == a4)
    {
      v46 = PKLocalizedPaymentString(&cfstr_ExpressTransit_0.isa);
      v47 = [(PKPaymentPassDetailSectionController *)self linkCellWithText:v46 forTableView:v8];
      id v48 = *a3;
      *a3 = v47;
    }
    unint64_t v39 = v9 + 2;
  }
  else
  {
    uint64_t v45 = 1;
    if (!detailViewStyle) {
      uint64_t v45 = 2;
    }
    unint64_t v39 = v45 + v9;
  }
LABEL_53:

  return v39;
}

+ (BOOL)_showExpressDetailsForPass:(id)a3 expressMode:(BOOL)a4 sectionMode:(unint64_t)a5
{
  char v7 = [a3 isAccessPass];
  if (a5) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = a4;
  }
  return (v7 & 1) == 0 && v8;
}

- (BOOL)_showExpressDetails
{
  v3 = objc_opt_class();
  pass = self->_pass;
  BOOL expressModeSupported = self->_expressModeSupported;
  unint64_t sectionMode = self->_sectionMode;

  return [v3 _showExpressDetailsForPass:pass expressMode:expressModeSupported sectionMode:sectionMode];
}

+ (BOOL)_paymentApplicationShouldShowFullDPANForPass:(id)a3 paymentApplication:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = [v6 sanitizedDPAN];
  if (v7)
  {
    BOOL v8 = [v6 appletDataFormat];
    if (PKEqualObjects())
    {
      char v9 = 1;
    }
    else
    {
      id v10 = [v6 appletDataFormat];
      if (PKEqualObjects())
      {
        char v9 = 1;
      }
      else
      {
        id v11 = [v6 appletDataFormat];
        if (PKEqualObjects() & 1) != 0 || ([v5 isEMoneyPass]) {
          char v9 = 1;
        }
        else {
          char v9 = [v5 isSuicaPass];
        }
      }
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)_paymentApplicationShouldShowFullDPAN
{
  v3 = objc_opt_class();
  pass = self->_pass;
  paymentApplication = self->_paymentApplication;

  return [v3 _paymentApplicationShouldShowFullDPANForPass:pass paymentApplication:paymentApplication];
}

- (void)_expressPassDidChange
{
  v3 = [(PKExpressPassController *)self->_expressPassController existingExpressPassConfigurationForPass:self->_pass];
  BOOL v4 = v3 != 0;

  if (self->_expressModeEnabled != v4) {
    self->_expressModeEnabled = v4;
  }
}

- (void)_updateExpressPassInformation
{
  if ((PKIsPad() & 1) == 0)
  {
    if ([(PKExpressPassController *)self->_expressPassController isExpressModeSupportedForPass:self->_pass])char v3 = 1; {
    else
    }
      char v3 = [(PKExpressPassController *)self->_expressPassController hasEligibleExpressUpgradeRequestForPass:self->_pass];
    self->_BOOL expressModeSupported = v3;
    BOOL v4 = [(PKExpressPassController *)self->_expressPassController existingExpressPassConfigurationForPass:self->_pass];
    self->_expressModeEnabled = v4 != 0;
  }
}

- (id)_contextMenuConfigurationForCopyingText:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKPassDetailsCardInfoSectionController__contextMenuConfigurationForCopyingText___block_invoke;
  aBlock[3] = &unk_1E59D5228;
  id v9 = v3;
  id v4 = v3;
  id v5 = _Block_copy(aBlock);
  id v6 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:0 previewProvider:0 actionProvider:v5];

  return v6;
}

id __82__PKPassDetailsCardInfoSectionController__contextMenuConfigurationForCopyingText___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = (void *)MEMORY[0x1E4FB13F0];
    id v3 = PKLocalizedString(&cfstr_MenuActionCopy.isa);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82__PKPassDetailsCardInfoSectionController__contextMenuConfigurationForCopyingText___block_invoke_2;
    v9[3] = &unk_1E59D5200;
    id v10 = *(id *)(a1 + 32);
    id v4 = [v2 actionWithTitle:v3 image:0 identifier:0 handler:v9];

    id v5 = (void *)MEMORY[0x1E4FB1970];
    v11[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    char v7 = [v5 menuWithTitle:&stru_1EF1B5B50 children:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

void __82__PKPassDetailsCardInfoSectionController__contextMenuConfigurationForCopyingText___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v2 setString:*(void *)(a1 + 32)];
}

- (PKPassDetailsCardInfoSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassDetailsCardInfoSectionControllerDelegate *)WeakRetained;
}

- (BOOL)hideSectionTitles
{
  return self->_hideSectionTitles;
}

- (void)setHideSectionTitles:(BOOL)a3
{
  self->_hideSectionTitles = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_storeStrong((id *)&self->_expressPassController, 0);
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end