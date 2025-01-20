@interface PKApplyMultilevelListPickerSectionController
- (BOOL)isTopmostSection;
- (BOOL)shouldHighlightItem:(id)a3;
- (PKApplyMultilevelListPickerSectionController)initWithController:(id)a3 applyPage:(id)a4 picker:(id)a5;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)didSelectItem:(id)a3;
- (void)setIsTopmostSection:(BOOL)a3;
@end

@implementation PKApplyMultilevelListPickerSectionController

- (PKApplyMultilevelListPickerSectionController)initWithController:(id)a3 applyPage:(id)a4 picker:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKApplyMultilevelListPickerSectionController;
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
  v15[1] = *MEMORY[0x1E4F143B8];
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

  if (v11)
  {
LABEL_7:
    v12 = [[PKApplyMultilevelPickerRow alloc] initWithPicker:self->_picker];
    v15[0] = v12;
    objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v6 appendItems:v13];
  }
LABEL_9:

  return v6;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a3;
  v7 = [(PKApplyCollectionViewSectionController *)self listLayoutConfigurationWithLayoutEnvironment:v6 sectionIdentifier:a4];
  id v8 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v7 layoutEnvironment:v6];

  [v8 contentInsets];
  if (self->_isTopmostSection) {
    double v9 = 7.0;
  }
  [v8 setContentInsets:v9];

  return v8;
}

- (void)didSelectItem:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v10;
    id v5 = [PKApplyFocusedPickerViewController alloc];
    id v6 = [v4 picker];

    v7 = [(PKApplyFocusedPickerViewController *)v5 initWithPicker:v6];
    id v8 = [(PKApplyCollectionViewSectionController *)self dynamicCollectionDelegate];
    [(PKApplyFocusedPickerViewController *)v7 setDynamicCollectionDelegate:v8];

    double v9 = [(PKApplyCollectionViewSectionController *)self dynamicCollectionDelegate];
    [v9 pushViewController:v7 animated:1];
  }
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 1;
}

- (BOOL)isTopmostSection
{
  return self->_isTopmostSection;
}

- (void)setIsTopmostSection:(BOOL)a3
{
  self->_isTopmostSection = a3;
}

- (void).cxx_destruct
{
}

@end