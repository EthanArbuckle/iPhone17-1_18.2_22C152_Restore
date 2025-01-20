@interface PKApplyRequiredFieldSectionController
- (BOOL)textFieldShouldReturn:(id)a3 forListCell:(id)a4;
- (PKApplyRequiredFieldSectionController)initWithController:(id)a3 applyPage:(id)a4 field:(id)a5;
- (PKTextFieldCollectionViewListCellDelegate)cellDelegate;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)didSelectItem:(id)a3;
- (void)setCellDelegate:(id)a3;
- (void)textFieldDidChangeSelection:(id)a3 forListCell:(id)a4;
@end

@implementation PKApplyRequiredFieldSectionController

- (PKApplyRequiredFieldSectionController)initWithController:(id)a3 applyPage:(id)a4 field:(id)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKApplyRequiredFieldSectionController;
  v10 = [(PKApplyCollectionViewSectionController *)&v16 initWithController:a3 applyPage:a4];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_field, a5);
    v12 = [[PKApplyRequiredFieldRow alloc] initWithField:v11->_field cellDelegate:v11];
    v17[0] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    items = v11->_items;
    v11->_items = (NSArray *)v13;
  }
  return v11;
}

- (id)identifiers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(PKPaymentSetupField *)self->_field identifier];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PKPaymentSetupField *)self->_field localizedDisplayName];
  v6 = [v5 uppercaseString];

  v7 = [(PKPaymentSetupField *)self->_field identifier];
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
    objc_super v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
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
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v7 = [(PKPaymentSetupField *)self->_field identifier];
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
    [v6 appendItems:self->_items];
LABEL_9:

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
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(PKApplyCollectionViewSectionController *)self dynamicCollectionDelegate];
    id v5 = [v4 cellForItem:v6];

    [v5 beginEditing];
  }
}

- (BOOL)textFieldShouldReturn:(id)a3 forListCell:(id)a4
{
  return 1;
}

- (void)textFieldDidChangeSelection:(id)a3 forListCell:(id)a4
{
  id v6 = [a3 text];
  -[PKPaymentSetupField setCurrentValue:](self->_field, "setCurrentValue:");
  if (([(PKPaymentSetupField *)self->_field submissionStringMeetsAllRequirements] & 1) == 0)[(PKPaymentSetupField *)self->_field setCurrentValue:0]; {
  id v5 = [(PKApplyCollectionViewSectionController *)self dynamicCollectionDelegate];
  }
  [v5 recomputeSectionsWithReload:0];
}

- (PKTextFieldCollectionViewListCellDelegate)cellDelegate
{
  return self->_cellDelegate;
}

- (void)setCellDelegate:(id)a3
{
  self->_cellDelegate = (PKTextFieldCollectionViewListCellDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_field, 0);
}

@end