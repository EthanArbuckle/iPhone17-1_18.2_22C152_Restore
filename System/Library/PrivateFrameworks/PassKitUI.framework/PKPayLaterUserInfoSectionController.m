@interface PKPayLaterUserInfoSectionController
- (PKPayLaterUserInfoSectionController)initWithPayLaterAccount:(id)a3 delegate:(id)a4;
- (id)_addressRow;
- (id)_dobRow;
- (id)_legalNameRow;
- (id)_phoneNumberRow;
- (id)_ssnRow;
- (id)_subtitleRowWithTitle:(id)a3 subtitle:(id)a4 selectionHandler:(id)a5;
- (id)_yearlyIncomeRow;
- (id)footerContentForSectionIdentifier:(id)a3;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureEmailAddressSection:(id)a3;
- (void)_configureOtherUserInfoSection:(id)a3;
- (void)_updateUserInfo;
- (void)setPayLaterAccount:(id)a3;
@end

@implementation PKPayLaterUserInfoSectionController

- (PKPayLaterUserInfoSectionController)initWithPayLaterAccount:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterUserInfoSectionController;
  v7 = [(PKPayLaterSectionController *)&v12 initWithPayLaterAccount:a3 dynamicContentPage:0 viewControllerDelegate:v6];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    uint64_t v9 = [MEMORY[0x1E4F84D50] sharedService];
    paymentWebService = v8->_paymentWebService;
    v8->_paymentWebService = (PKPaymentWebService *)v9;

    [(PKPayLaterUserInfoSectionController *)v8 _updateUserInfo];
  }

  return v8;
}

- (void)setPayLaterAccount:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterUserInfoSectionController;
  [(PKPayLaterSectionController *)&v4 setPayLaterAccount:a3];
  [(PKPayLaterUserInfoSectionController *)self _updateUserInfo];
}

- (id)identifiers
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"kEmailAdderssSection";
  v4[1] = @"kOtherUserInfoSection";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKPayLaterUserInfoSectionController;
  v7 = [(PKPayLaterSectionController *)&v20 layoutWithLayoutEnvironment:a3 sectionIdentifier:v6];
  [v7 contentInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = (__CFString *)v6;
  v17 = v16;
  if (v16 == @"kEmailAdderssSection"
    || v16
    && (int v18 = [(__CFString *)v16 isEqualToString:@"kEmailAdderssSection"],
        v17,
        v18))
  {
    double v13 = -15.0;
  }
  objc_msgSend(v7, "setContentInsets:", v9, v11, v13, v15);

  return v7;
}

- (id)footerContentForSectionIdentifier:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = (__CFString *)a3;
  objc_super v4 = v3;
  if (v3 == @"kEmailAdderssSection"
    || v3 && (int v5 = [@"kEmailAdderssSection" isEqualToString:v3], v4, v5))
  {
    id v6 = PKLocalizedCocoonString(&cfstr_AccountInforma.isa);
    id v7 = objc_alloc_init(MEMORY[0x1E4F84488]);
    [v7 setFooterText:v6];
    id v8 = objc_alloc_init(MEMORY[0x1E4F84490]);
    [v8 setLinkText:v6];
    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"prefs:root=APPLE_ACCOUNT&path=APPLE_ACCOUNT_CONTACT"];
    [v8 setLinkURL:v9];
    v12[0] = v8;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v7 setLinks:v10];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  id v7 = (__CFString *)v5;
  id v8 = v7;
  if (v7 == @"kEmailAdderssSection") {
    goto LABEL_4;
  }
  if (!v7) {
    goto LABEL_5;
  }
  int v9 = [@"kEmailAdderssSection" isEqualToString:v7];

  if (v9)
  {
LABEL_4:
    [(PKPayLaterUserInfoSectionController *)self _configureEmailAddressSection:v6];
  }
  else
  {
    double v11 = v8;
    if (v11 == @"kOtherUserInfoSection"
      || (double v12 = v11, v13 = [@"kOtherUserInfoSection" isEqualToString:v11], v12, v13))
    {
      [(PKPayLaterUserInfoSectionController *)self _configureOtherUserInfoSection:v6];
    }
  }
LABEL_5:

  return v6;
}

- (void)_configureEmailAddressSection:(id)a3
{
  id v13 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [(PKPayLaterAccountUserInfo *)self->_userInfo contact];
  id v6 = [v5 emailAddresses];
  id v7 = [v6 firstObject];

  if (!v7 || ([v7 value], (id v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    int v9 = [(PKPayLaterAccountUserInfo *)self->_userInfo emailAddress];
    id v8 = [v9 text];
  }
  if ([v8 length])
  {
    double v10 = PKLocalizedCocoonString(&cfstr_AccountInforma_0.isa);
    double v11 = [(PKPayLaterUserInfoSectionController *)self _subtitleRowWithTitle:v10 subtitle:v8 selectionHandler:0];

    [v11 setAxID:*MEMORY[0x1E4F854C8]];
    [v4 addObject:v11];
    double v12 = (void *)[v4 copy];
    [v13 appendItems:v12];
  }
}

- (void)_configureOtherUserInfoSection:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v13 = objc_alloc_init(v4);
  id v6 = [(PKPayLaterUserInfoSectionController *)self _legalNameRow];
  [v13 safelyAddObject:v6];

  id v7 = [(PKPayLaterUserInfoSectionController *)self _dobRow];
  [v13 safelyAddObject:v7];

  id v8 = [(PKPayLaterUserInfoSectionController *)self _phoneNumberRow];
  [v13 safelyAddObject:v8];

  int v9 = [(PKPayLaterUserInfoSectionController *)self _addressRow];
  [v13 safelyAddObject:v9];

  double v10 = [(PKPayLaterUserInfoSectionController *)self _ssnRow];
  [v13 safelyAddObject:v10];

  double v11 = [(PKPayLaterUserInfoSectionController *)self _yearlyIncomeRow];
  [v13 safelyAddObject:v11];

  double v12 = (void *)[v13 copy];
  [v5 appendItems:v12];
}

- (id)_legalNameRow
{
  v3 = [(PKPayLaterAccountUserInfo *)self->_userInfo contact];
  id v4 = [v3 nameComponents];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v4 style:2 options:0];
  }
  else
  {
    id v5 = 0;
  }
  if ([v5 length])
  {
    id v6 = PKLocalizedCocoonString(&cfstr_AccountInforma_1.isa);
    id v7 = [(PKPayLaterUserInfoSectionController *)self _subtitleRowWithTitle:v6 subtitle:v5 selectionHandler:0];

    [v7 setAxID:*MEMORY[0x1E4F85700]];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_dobRow
{
  v3 = [(PKPayLaterAccountUserInfo *)self->_userInfo contact];
  id v4 = [v3 birthday];
  if (!v4) {
    goto LABEL_4;
  }
  uint64_t v5 = *MEMORY[0x1E4F1C318];
  id v6 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  id v7 = [v6 dateFromComponents:v4];

  if (!v7) {
    goto LABEL_4;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  int v9 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:v5];
  [v8 setCalendar:v9];

  [v8 setDateStyle:1];
  double v10 = [v8 stringFromDate:v7];

  if (!v10)
  {
LABEL_4:
    double v11 = [(PKPayLaterAccountUserInfo *)self->_userInfo dateOfBirth];
    double v10 = [v11 text];
  }
  if ([v10 length])
  {
    double v12 = PKLocalizedCocoonString(&cfstr_AccountInforma_2.isa);
    id v13 = [(PKPayLaterUserInfoSectionController *)self _subtitleRowWithTitle:v12 subtitle:v10 selectionHandler:0];

    [v13 setAxID:*MEMORY[0x1E4F85408]];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)_phoneNumberRow
{
  v3 = [(PKPayLaterAccountUserInfo *)self->_userInfo contact];
  id v4 = [v3 phoneNumbers];
  uint64_t v5 = [v4 firstObject];

  if (!v5
    || ([v5 value],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v6 stringValue],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    id v8 = [(PKPayLaterAccountUserInfo *)self->_userInfo phoneNumber];
    id v7 = [v8 text];
  }
  if ([v7 length])
  {
    objc_initWeak(&location, self);
    int v9 = PKLocalizedCocoonString(&cfstr_AccountInforma_3.isa);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__PKPayLaterUserInfoSectionController__phoneNumberRow__block_invoke;
    v14[3] = &unk_1E59CB010;
    objc_copyWeak(&v15, &location);
    v14[4] = self;
    double v10 = [(PKPayLaterUserInfoSectionController *)self _subtitleRowWithTitle:v9 subtitle:v7 selectionHandler:v14];
    phoneRow = self->_phoneRow;
    self->_phoneRow = v10;

    [(PKPayLaterSubtitleRow *)self->_phoneRow setAxID:*MEMORY[0x1E4F85820]];
    double v12 = self->_phoneRow;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

void __54__PKPayLaterUserInfoSectionController__phoneNumberRow__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 144))
    {
      id v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring tap on phone number row since there is already a request in flight", (uint8_t *)buf, 2u);
      }
    }
    else
    {
      *((unsigned char *)WeakRetained + 144) = 1;
      [WeakRetained[15] setShowSpinner:1];
      uint64_t v5 = [v3 dynamicCollectionDelegate];
      [v5 reloadItem:v3[15] animated:1];

      objc_initWeak(buf, *(id *)(a1 + 32));
      id v6 = objc_loadWeakRetained(v3 + 12);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __54__PKPayLaterUserInfoSectionController__phoneNumberRow__block_invoke_47;
      v7[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v8, buf);
      [v6 updateUserInfoForType:1 completion:v7];

      objc_destroyWeak(&v8);
      objc_destroyWeak(buf);
    }
  }
}

void __54__PKPayLaterUserInfoSectionController__phoneNumberRow__block_invoke_47(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 144) = 0;
    v3 = WeakRetained;
    [*((id *)WeakRetained + 15) setShowSpinner:0];
    v2 = [v3 dynamicCollectionDelegate];
    [v2 reloadItem:v3[15] animated:1];

    id WeakRetained = v3;
  }
}

- (id)_addressRow
{
  v3 = [(PKPayLaterAccountUserInfo *)self->_userInfo contact];
  id v4 = [v3 pkFormattedContactAddressWithoutName];
  if ([v4 length])
  {
    objc_initWeak(&location, self);
    uint64_t v5 = PKLocalizedCocoonString(&cfstr_AccountInforma_4.isa);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__PKPayLaterUserInfoSectionController__addressRow__block_invoke;
    v10[3] = &unk_1E59CB010;
    objc_copyWeak(&v11, &location);
    v10[4] = self;
    id v6 = [(PKPayLaterUserInfoSectionController *)self _subtitleRowWithTitle:v5 subtitle:v4 selectionHandler:v10];
    addressRow = self->_addressRow;
    self->_addressRow = v6;

    [(PKPayLaterSubtitleRow *)self->_addressRow setAxID:*MEMORY[0x1E4F851F8]];
    id v8 = self->_addressRow;
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __50__PKPayLaterUserInfoSectionController__addressRow__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 144))
    {
      id v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring tap on address row since there is already a request in flight", (uint8_t *)buf, 2u);
      }
    }
    else
    {
      *((unsigned char *)WeakRetained + 144) = 1;
      [WeakRetained[16] setShowSpinner:1];
      uint64_t v5 = [v3 dynamicCollectionDelegate];
      [v5 reloadItem:v3[16] animated:1];

      objc_initWeak(buf, *(id *)(a1 + 32));
      id v6 = objc_loadWeakRetained(v3 + 12);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __50__PKPayLaterUserInfoSectionController__addressRow__block_invoke_52;
      v7[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v8, buf);
      [v6 updateUserInfoForType:2 completion:v7];

      objc_destroyWeak(&v8);
      objc_destroyWeak(buf);
    }
  }
}

void __50__PKPayLaterUserInfoSectionController__addressRow__block_invoke_52(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 144) = 0;
    v3 = WeakRetained;
    [*((id *)WeakRetained + 16) setShowSpinner:0];
    v2 = [v3 dynamicCollectionDelegate];
    [v2 reloadItem:v3[16] animated:1];

    id WeakRetained = v3;
  }
}

- (id)_ssnRow
{
  v3 = [(PKPayLaterAccountUserInfo *)self->_userInfo ssn];
  int v4 = [v3 hasHiddenValue];
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    id v8 = 0;
  }
  else
  {
    id v6 = PKLocalizedCocoonString(&cfstr_AccountInforma_5.isa);
    id v7 = PKLocalizedCocoonString(&cfstr_AccountInforma_6.isa);
    id v8 = [(PKPayLaterUserInfoSectionController *)self _subtitleRowWithTitle:v6 subtitle:v7 selectionHandler:0];

    [v8 setAxID:*MEMORY[0x1E4F85948]];
  }

  return v8;
}

- (id)_yearlyIncomeRow
{
  v3 = [(PKPayLaterAccountUserInfo *)self->_userInfo yearlyIncome];
  int v4 = [v3 currencyAmount];
  BOOL v5 = [v4 formattedStringValue];
  if (!v5)
  {
    BOOL v5 = [v3 text];
  }
  if ([v5 length])
  {
    objc_initWeak(&location, self);
    id v6 = PKLocalizedCocoonString(&cfstr_AccountInforma_7.isa);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__PKPayLaterUserInfoSectionController__yearlyIncomeRow__block_invoke;
    v11[3] = &unk_1E59CB010;
    objc_copyWeak(&v12, &location);
    v11[4] = self;
    id v7 = [(PKPayLaterUserInfoSectionController *)self _subtitleRowWithTitle:v6 subtitle:v5 selectionHandler:v11];
    incomeRow = self->_incomeRow;
    self->_incomeRow = v7;

    [(PKPayLaterSubtitleRow *)self->_incomeRow setAxID:*MEMORY[0x1E4F855F8]];
    int v9 = self->_incomeRow;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

void __55__PKPayLaterUserInfoSectionController__yearlyIncomeRow__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*((unsigned char *)WeakRetained + 144))
    {
      int v4 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring tap on income row since there is already a request in flight", (uint8_t *)buf, 2u);
      }
    }
    else
    {
      *((unsigned char *)WeakRetained + 144) = 1;
      [WeakRetained[17] setShowSpinner:1];
      BOOL v5 = [v3 dynamicCollectionDelegate];
      [v5 reloadItem:v3[17] animated:1];

      objc_initWeak(buf, *(id *)(a1 + 32));
      id v6 = objc_loadWeakRetained(v3 + 12);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __55__PKPayLaterUserInfoSectionController__yearlyIncomeRow__block_invoke_62;
      v7[3] = &unk_1E59CA7F8;
      objc_copyWeak(&v8, buf);
      [v6 updateUserInfoForType:3 completion:v7];

      objc_destroyWeak(&v8);
      objc_destroyWeak(buf);
    }
  }
}

void __55__PKPayLaterUserInfoSectionController__yearlyIncomeRow__block_invoke_62(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 144) = 0;
    v3 = WeakRetained;
    [*((id *)WeakRetained + 17) setShowSpinner:0];
    v2 = [v3 dynamicCollectionDelegate];
    [v2 reloadItem:v3[17] animated:1];

    id WeakRetained = v3;
  }
}

- (id)_subtitleRowWithTitle:(id)a3 subtitle:(id)a4 selectionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = [[PKPayLaterSubtitleRow alloc] initWithTitle:v9 subtitle:v8 selectionHandler:v7];

  id v11 = (void *)*MEMORY[0x1E4FB27D0];
  id v12 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB27D0], 0, 0);
  [(PKPayLaterSubtitleRow *)v10 setTitleFont:v12];

  id v13 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], v11, 0, 0);
  [(PKPayLaterSubtitleRow *)v10 setSubtitleFont:v13];

  [(PKPayLaterSubtitleRow *)v10 setExcludeFromScreenCapture:1];

  return v10;
}

- (void)_updateUserInfo
{
  id v6 = [(PKPayLaterSectionController *)self payLaterAccount];
  v3 = [v6 payLaterDetails];
  int v4 = [v3 userInfo];
  userInfo = self->_userInfo;
  self->_userInfo = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomeRow, 0);
  objc_storeStrong((id *)&self->_addressRow, 0);
  objc_storeStrong((id *)&self->_phoneRow, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end