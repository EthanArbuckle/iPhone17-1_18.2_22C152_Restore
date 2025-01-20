@interface PKApplyListPickerSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (PKApplyListPickerSectionController)initWithPicker:(id)a3;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)didSelectItem:(id)a3;
@end

@implementation PKApplyListPickerSectionController

- (PKApplyListPickerSectionController)initWithPicker:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKApplyListPickerSectionController;
  v6 = [(PKApplyCollectionViewSectionController *)&v9 initWithController:0 applyPage:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_picker, a3);
  }

  return v7;
}

- (id)identifiers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PKPaymentSetupFieldPicker *)self->_picker identifier];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKPaymentSetupFieldPicker *)self->_picker localizedDescription];
  v6 = [v5 uppercaseString];

  v7 = [(PKPaymentSetupFieldPicker *)self->_picker identifier];
  id v8 = v4;
  id v9 = v7;
  v10 = v9;
  if (v9 == v8)
  {
  }
  else
  {
    if (!v8 || !v9)
    {

LABEL_10:
      goto LABEL_11;
    }
    int v11 = [v8 isEqualToString:v9];

    if (!v11) {
      goto LABEL_10;
    }
  }
  uint64_t v12 = [v6 length];

  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
    v19[0] = *MEMORY[0x1E4FB06F8];
    v14 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28F0], (void *)*MEMORY[0x1E4FB27D0], 0, 0);
    v20[0] = v14;
    v19[1] = *MEMORY[0x1E4FB0700];
    v15 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v20[1] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    v17 = (void *)[v13 initWithString:v6 attributes:v16];

    goto LABEL_12;
  }
LABEL_11:
  v17 = 0;
LABEL_12:

  return v17;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v7 = [(PKPaymentSetupFieldPicker *)self->_picker identifier];
  id v8 = v5;
  id v9 = v7;
  if (v9 == v8)
  {

LABEL_7:
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = [(PKPaymentSetupFieldPicker *)self->_picker pickerItems];
    uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v17 = [[PKApplyListPickerRow alloc] initWithPickerItem:v16];
          v18 = [(PKPaymentSetupFieldPicker *)self->_picker currentValue];
          [(PKApplyListPickerRow *)v17 setSelected:v18 == v16];

          v27 = v17;
          v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
          [v6 appendItems:v19];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v13);
    }

    id v8 = v21;
    goto LABEL_16;
  }
  v10 = v9;
  if (!v8 || !v9)
  {

    goto LABEL_16;
  }
  int v11 = [v8 isEqualToString:v9];

  if (v11) {
    goto LABEL_7;
  }
LABEL_16:

  return v6;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a3;
  v7 = [(PKApplyCollectionViewSectionController *)self listLayoutConfigurationWithLayoutEnvironment:v6 sectionIdentifier:a4];
  id v8 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v7 layoutEnvironment:v6];

  [v8 contentInsets];
  objc_msgSend(v8, "setContentInsets:");

  return v8;
}

- (void)didSelectItem:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = v11;
  if (isKindOfClass)
  {
    picker = self->_picker;
    v7 = [v11 pickerItem];
    [(PKPaymentSetupFieldPicker *)picker setCurrentValue:v7];

    id v8 = [(PKApplyCollectionViewSectionController *)self dynamicCollectionDelegate];
    id v9 = v8;
    if (v8)
    {
      [v8 recomputeSectionsWithReload:1];
      v10 = [(PKPaymentSetupFieldPicker *)self->_picker identifier];
      [v9 reloadDataForSectionIdentifier:v10 animated:1];

      [v9 deselectCells];
      if (objc_opt_respondsToSelector()) {
        [v9 didSelectCell];
      }
    }

    id v5 = v11;
  }
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
}

@end