@interface PKApplyRadioPickerSectionController
- (PKApplyRadioPickerSectionController)initWithController:(id)a3 applyPage:(id)a4 picker:(id)a5;
- (id)identifiers;
- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_configureContentSection:(id)a3;
@end

@implementation PKApplyRadioPickerSectionController

- (PKApplyRadioPickerSectionController)initWithController:(id)a3 applyPage:(id)a4 picker:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKApplyRadioPickerSectionController;
  v10 = [(PKApplyCollectionViewSectionController *)&v13 initWithController:a3 applyPage:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_picker, a5);
  }

  return v11;
}

- (id)identifiers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PKPaymentSetupFieldPicker *)self->_picker identifier];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v7 = [(PKPaymentSetupFieldPicker *)self->_picker identifier];
  id v8 = v5;
  id v9 = v7;
  if (v9 == v8)
  {

    goto LABEL_7;
  }
  v10 = v9;
  if (!v8 || !v9)
  {

    goto LABEL_9;
  }
  int v11 = [v8 isEqualToString:v9];

  if (v11) {
LABEL_7:
  }
    [(PKApplyRadioPickerSectionController *)self _configureContentSection:v6];
LABEL_9:

  return v6;
}

- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PKApplyRadioPickerSectionController;
  v4 = [(PKApplyCollectionViewSectionController *)&v6 listLayoutConfigurationWithLayoutEnvironment:a3 sectionIdentifier:a4];
  [v4 setItemSeparatorHandler:&__block_literal_global_19];

  return v4;
}

id __102__PKApplyRadioPickerSectionController_listLayoutConfigurationWithLayoutEnvironment_sectionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if (![a2 row]) {
    [v4 setBottomSeparatorVisibility:2];
  }

  return v4;
}

- (void)_configureContentSection:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v4 = [PKApplyRadioPickerTitleRow alloc];
  id v5 = [(PKPaymentSetupFieldPicker *)self->_picker localizedDisplayName];
  uint64_t v6 = [(PKApplyRadioPickerTitleRow *)v4 initWithTitle:v5];

  v19 = (void *)v6;
  v32[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  [v22 appendItems:v7];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(PKPaymentSetupFieldPicker *)self->_picker pickerItems];
  uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        int v11 = [PKApplyRadioPickerRow alloc];
        v12 = [v10 localizedDisplayName];
        objc_super v13 = [v10 submissionValue];
        v14 = [(PKApplyRadioPickerRow *)v11 initWithTitle:v12 submissionValue:v13];

        v15 = [(PKPaymentSetupFieldPicker *)self->_picker currentValue];
        v16 = [v15 submissionValue];
        v17 = [v10 submissionValue];
        [(PKApplyRadioPickerRow *)v14 setSelected:PKEqualObjects()];

        objc_initWeak(&location, self);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __64__PKApplyRadioPickerSectionController__configureContentSection___block_invoke;
        v23[3] = &unk_1E59CB010;
        objc_copyWeak(&v24, &location);
        v23[4] = v10;
        [(PKApplyRadioPickerRow *)v14 setAction:v23];
        v30 = v14;
        v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
        [v22 appendItems:v18];

        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }
}

void __64__PKApplyRadioPickerSectionController__configureContentSection___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    id v3 = WeakRetained[11];
    [v3 setCurrentValue:*(void *)(a1 + 32)];
    id v4 = [v7 dynamicCollectionDelegate];
    id v5 = v4;
    if (v4)
    {
      [v4 recomputeSectionsWithReload:1];
      uint64_t v6 = [v3 identifier];
      [v5 reloadDataForSectionIdentifier:v6 animated:1];
    }
    WeakRetained = v7;
  }
}

- (void).cxx_destruct
{
}

@end