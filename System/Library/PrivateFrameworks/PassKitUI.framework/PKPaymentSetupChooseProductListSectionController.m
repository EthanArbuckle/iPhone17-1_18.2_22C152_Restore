@interface PKPaymentSetupChooseProductListSectionController
- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4;
- (PKPaymentSetupChooseProductListSectionController)initWithImage:(id)a3 digitalIssuanceMetadata:(id)a4;
- (PKPaymentSetupChooseProductListSectionControllerDelegate)delegate;
- (UICollectionViewCellRegistration)cellRegistration;
- (UIImage)cardImage;
- (id)defaultListLayout;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_generateItems;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)didSelectItem:(id)a3;
- (void)setCardImage:(id)a3;
- (void)setCellRegistration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)showLoadingIndicatorsForItemIdentifier:(id)a3 show:(BOOL)a4;
@end

@implementation PKPaymentSetupChooseProductListSectionController

- (PKPaymentSetupChooseProductListSectionController)initWithImage:(id)a3 digitalIssuanceMetadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentSetupChooseProductListSectionController;
  v9 = [(PKPaymentSetupChooseProductListSectionController *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_digitalIssuanceMetadata, a4);
    objc_storeStrong((id *)&v10->_cardImage, a3);
    [(PKPaymentSetupChooseProductListSectionController *)v10 _generateItems];
    v11 = [MEMORY[0x1E4FB1578] registrationWithCellClass:objc_opt_class() configurationHandler:&__block_literal_global_219];
    [(PKPaymentSetupChooseProductListSectionController *)v10 setCellRegistration:v11];
  }
  return v10;
}

void __90__PKPaymentSetupChooseProductListSectionController_initWithImage_digitalIssuanceMetadata___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = (void *)MEMORY[0x1E4FB1948];
  id v7 = a4;
  id v8 = [v6 subtitleCellConfiguration];
  v9 = [v7 title];
  [v8 setText:v9];

  v10 = [v7 subtitle];
  [v8 setSecondaryText:v10];

  v11 = [v8 secondaryTextProperties];
  v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v11 setColor:v12];

  objc_msgSend(v8, "setDirectionalLayoutMargins:", 10.0, 10.0, 10.0, 10.0);
  [v5 setContentConfiguration:v8];
  [v5 setConfigurationUpdateHandler:&__block_literal_global_128_0];
  LODWORD(v11) = [v7 loadingIndicatorVisible];

  if (v11)
  {
    id v13 = +[PKCellAccessoryLoadingIndicator accessory];
    v17[0] = v13;
    v14 = (id *)v17;
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4FB1518]);
    id v16 = v13;
    v14 = &v16;
  }
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v5 setAccessories:v15];
}

void __90__PKPaymentSetupChooseProductListSectionController_initWithImage_digitalIssuanceMetadata___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  v4 = (void *)MEMORY[0x1E4FB1498];
  id v5 = a2;
  v6 = [v4 listGroupedCellConfiguration];
  if ([v9 isHighlighted] & 1) != 0 || (objc_msgSend(v9, "isSelected"))
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  id v8 = (void *)v7;
  [v6 setBackgroundColor:v7];

  [v5 setBackgroundConfiguration:v6];
}

- (void)_generateItems
{
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PKPaymentDigitalIssuanceMetadata *)self->_digitalIssuanceMetadata autoTopUpProduct];
  id v5 = [(PKPaymentDigitalIssuanceMetadata *)self->_digitalIssuanceMetadata serviceProviderProducts];
  uint64_t v6 = [v5 count];

  if (v4)
  {
    uint64_t v7 = [v4 localizedDisplayName];
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      PKLocalizedPaymentString(&cfstr_AutoTopUpTrans.isa);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

    v11 = [v4 localizedDescription];
    v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      PKLocalizedPaymentString(&cfstr_AutoTopUpTrans_0.isa);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    v15 = [[PKPaymentSetupChooseProductListItem alloc] initWithIdentifier:@"AutoTopUpItemIdentifier" type:0 title:v10 subtitle:v14];
    autoTopUpItem = self->_autoTopUpItem;
    self->_autoTopUpItem = v15;

    [v3 addObject:@"AutoTopUpSectionIdentifier"];
  }
  v17 = [(PKPaymentDigitalIssuanceMetadata *)self->_digitalIssuanceMetadata balanceIdentifier];

  if (v17)
  {
    v18 = [(PKPaymentDigitalIssuanceMetadata *)self->_digitalIssuanceMetadata balanceLocalizedDisplayName];
    v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      PKLocalizedPaymentString(&cfstr_TicketPlatform.isa);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v20;

    v22 = [(PKPaymentDigitalIssuanceMetadata *)self->_digitalIssuanceMetadata balanceLocalizedDescription];
    v23 = v22;
    if (v22)
    {
      id v24 = v22;
    }
    else
    {
      PKLocalizedPaymentString(&cfstr_TicketPlatform_0.isa);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v25 = v24;

    v26 = [[PKPaymentSetupChooseProductListItem alloc] initWithIdentifier:@"BalanceItemIdentifier" type:0 title:v21 subtitle:v25];
    [v39 addObject:v26];
  }
  if (v6)
  {
    v27 = [(PKPaymentDigitalIssuanceMetadata *)self->_digitalIssuanceMetadata serviceProviderProductsLocalizedDisplayName];
    v28 = v27;
    if (v27)
    {
      id v29 = v27;
    }
    else
    {
      PKLocalizedPaymentString(&cfstr_TicketPlatform_1.isa);
      id v29 = (id)objc_claimAutoreleasedReturnValue();
    }
    v30 = v29;

    v31 = [(PKPaymentDigitalIssuanceMetadata *)self->_digitalIssuanceMetadata serviceProviderProductsLocalizedDescription];
    v32 = v31;
    if (v31)
    {
      id v33 = v31;
    }
    else
    {
      PKLocalizedPaymentString(&cfstr_TicketPlatform_2.isa);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
    }
    v34 = v33;

    v35 = [[PKPaymentSetupChooseProductListItem alloc] initWithIdentifier:@"CommutePlansItemIdentifier" type:1 title:v30 subtitle:v34];
    [v39 addObject:v35];
  }
  if ([v39 count])
  {
    v36 = (NSArray *)[v39 copy];
    balanceAndCommutePlansItems = self->_balanceAndCommutePlansItems;
    self->_balanceAndCommutePlansItems = v36;

    [v3 addObject:@"BalanceAndCommutePlansSectionIdentifier"];
  }
  v38 = (void *)[v3 copy];
  [(PKDynamicListSectionController *)self setIdentifiers:v38];
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  if ([v5 isEqualToString:@"AutoTopUpSectionIdentifier"])
  {
    v9[0] = self->_autoTopUpItem;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v6 appendItems:v7];
  }
  else if ([v5 isEqualToString:@"BalanceAndCommutePlansSectionIdentifier"])
  {
    [v6 appendItems:self->_balanceAndCommutePlansItems];
  }

  return v6;
}

- (void)didSelectItem:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained didSelectPKPaymentSetupChooseProductListItem:v4];
}

- (id)defaultListLayout
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  id v3 = PKProvisioningBackgroundColor();
  [v2 setBackgroundColor:v3];

  return v2;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKPaymentSetupChooseProductListSectionController *)self defaultListLayout];
  if (([v7 isEqualToString:@"PostpPaidSectionIdentifier"] & 1) != 0
    || [v7 isEqualToString:@"AutoTopUpSectionIdentifier"] && !self->_postPaidItem
    || [v7 isEqualToString:@"BalanceAndCommutePlansSectionIdentifier"]
    && !self->_postPaidItem
    && !self->_autoTopUpItem)
  {
    [v8 setHeaderMode:1];
  }
  id v9 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v8 layoutEnvironment:v6];

  return v9;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  cardImage = self->_cardImage;
  id v6 = a3;
  id v7 = PKLocalizedPaymentString(&cfstr_TransitChooseF.isa);
  id v8 = PKLocalizedPaymentString(&cfstr_TransitChooseF_0.isa);
  [v6 configureWithUIImage:cardImage title:v7 subtitle:v8];

  PKProvisioningBackgroundColor();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v6 setBackgroundColor:v9];
}

- (void)showLoadingIndicatorsForItemIdentifier:(id)a3 show:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (!v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained deselectCells];
  }
  if ([v8 isEqualToString:@"AutoTopUpItemIdentifier"])
  {
    [(PKPaymentSetupChooseProductListItem *)self->_autoTopUpItem setLoadingIndicatorVisible:v4];
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 reloadItem:self->_autoTopUpItem animated:1];
  }
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
}

- (PKPaymentSetupChooseProductListSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupChooseProductListSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImage)cardImage
{
  return self->_cardImage;
}

- (void)setCardImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->cellRegistration, 0);
  objc_storeStrong((id *)&self->_digitalIssuanceMetadata, 0);
  objc_storeStrong((id *)&self->_balanceAndCommutePlansItems, 0);
  objc_storeStrong((id *)&self->_autoTopUpItem, 0);

  objc_storeStrong((id *)&self->_postPaidItem, 0);
}

@end