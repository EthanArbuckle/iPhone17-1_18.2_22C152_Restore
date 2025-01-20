@interface PKPaymentSetupDevicePickerListSectionController
- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4;
- (PKPaymentSetupDevicePickerListSectionController)initWithWebServices:(id)a3 title:(id)a4 subtitle:(id)a5 image:(id)a6;
- (PKPaymentSetupDevicePickerListSectionControllerDelegate)delegate;
- (UICollectionViewCellRegistration)cellRegistration;
- (id)decorateListCell:(id)a3 forRowItem:(id)a4;
- (id)defaultListLayout;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)didSelectItem:(id)a3;
- (void)setCellRegistration:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PKPaymentSetupDevicePickerListSectionController

- (PKPaymentSetupDevicePickerListSectionController)initWithWebServices:(id)a3 title:(id)a4 subtitle:(id)a5 image:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)PKPaymentSetupDevicePickerListSectionController;
  v15 = [(PKPaymentSetupDevicePickerListSectionController *)&v27 init];
  v16 = v15;
  if (v15)
  {
    [(PKDynamicListSectionController *)v15 setIdentifiers:&unk_1EF2BA050];
    objc_storeStrong((id *)&v16->_items, a3);
    objc_storeStrong((id *)&v16->_title, a4);
    objc_storeStrong((id *)&v16->_subtitle, a5);
    objc_storeStrong((id *)&v16->_cardImage, a6);
    objc_initWeak(&location, v16);
    v17 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v18 = objc_opt_class();
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __92__PKPaymentSetupDevicePickerListSectionController_initWithWebServices_title_subtitle_image___block_invoke;
    v24 = &unk_1E59D59E0;
    objc_copyWeak(&v25, &location);
    v19 = [v17 registrationWithCellClass:v18 configurationHandler:&v21];
    -[PKPaymentSetupDevicePickerListSectionController setCellRegistration:](v16, "setCellRegistration:", v19, v21, v22, v23, v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __92__PKPaymentSetupDevicePickerListSectionController_initWithWebServices_title_subtitle_image___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = (id)[WeakRetained decorateListCell:v9 forRowItem:v6];
  }
}

- (id)decorateListCell:(id)a3 forRowItem:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4FB1948];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 subtitleCellConfiguration];
  id v9 = [v6 targetDevice];
  v10 = [v9 deviceDescriptionForPaymentWebService:v6];

  [v8 setText:v10];
  objc_msgSend(v8, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  [v7 setContentConfiguration:v8];
  [v7 setConfigurationUpdateHandler:&__block_literal_global_111];
  id v11 = objc_alloc_init(MEMORY[0x1E4FB1518]);
  v14[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v7 setAccessories:v12];

  return v8;
}

void __79__PKPaymentSetupDevicePickerListSectionController_decorateListCell_forRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  v4 = (void *)MEMORY[0x1E4FB1498];
  id v5 = a2;
  id v6 = [v4 listGroupedCellConfiguration];
  if ([v9 isHighlighted] & 1) != 0 || (objc_msgSend(v9, "isSelected"))
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
  }
  else
  {
    uint64_t v7 = PKProvisioningSecondaryBackgroundColor();
  }
  id v8 = (void *)v7;
  [v6 setBackgroundColor:v7];

  [v5 setBackgroundConfiguration:v6];
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  [v5 appendItems:self->_items];

  return v5;
}

- (void)didSelectItem:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didSelectWebService:v5];
  }
}

- (id)defaultListLayout
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  v3 = PKProvisioningBackgroundColor();
  [v2 setBackgroundColor:v3];

  return v2;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = [(PKPaymentSetupDevicePickerListSectionController *)self defaultListLayout];
  [v6 setHeaderMode:1];
  uint64_t v7 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v6 layoutEnvironment:v5];

  return v7;
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
}

- (PKPaymentSetupDevicePickerListSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupDevicePickerListSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->cellRegistration, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cardImage, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

@end