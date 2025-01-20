@interface PKApplyFocusedPickerViewController
- (PKApplyCollectionViewSectionControllerDelegate)dynamicCollectionDelegate;
- (PKApplyFocusedPickerViewController)initWithPicker:(id)a3;
- (id)_recomputeSections;
- (void)didSelectCell;
- (void)recomputeSectionsWithReload:(BOOL)a3;
- (void)reloadDataAnimated:(BOOL)a3;
- (void)setDynamicCollectionDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKApplyFocusedPickerViewController

- (PKApplyFocusedPickerViewController)initWithPicker:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKApplyFocusedPickerViewController;
  v6 = [(PKApplyFocusedPickerViewController *)&v11 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_picker, a3);
    v8 = [[PKApplyListPickerSectionController alloc] initWithPicker:v7->_picker];
    pickerSectionController = v7->_pickerSectionController;
    v7->_pickerSectionController = v8;

    [(PKApplyCollectionViewSectionController *)v7->_pickerSectionController setDynamicCollectionDelegate:v7];
  }

  return v7;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)PKApplyFocusedPickerViewController;
  [(PKDynamicCollectionViewController *)&v8 viewDidLoad];
  v3 = [(PKDynamicCollectionViewController *)self collectionView];
  [(PKApplyFocusedPickerViewController *)self recomputeSectionsWithReload:0];
  v4 = PKProvisioningBackgroundColor();
  [v3 setBackgroundColor:v4];
  id v5 = [(PKApplyFocusedPickerViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(PKApplyFocusedPickerViewController *)self navigationItem];
  v7 = [(PKPaymentSetupFieldPicker *)self->_picker localizedDisplayName];
  [v6 setTitle:v7];

  [v6 setBackButtonDisplayMode:0];
}

- (id)_recomputeSections
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PKPaymentSetupFieldPicker *)self->_picker pickerType] == 2) {
    [v3 addObject:self->_pickerSectionController];
  }
  v4 = (void *)[v3 copy];

  return v4;
}

- (void)reloadDataAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKApplyFocusedPickerViewController;
  -[PKDynamicCollectionViewController reloadDataAnimated:](&v6, sel_reloadDataAnimated_);
  id v5 = [(PKApplyFocusedPickerViewController *)self _recomputeSections];
  [(PKDynamicCollectionViewController *)self setSections:v5 animated:v3];
}

- (void)recomputeSectionsWithReload:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(PKApplyFocusedPickerViewController *)self _recomputeSections];
  if (v3) {
    [(PKDynamicCollectionViewController *)self setSections:v7 animated:1];
  }
  id v5 = [(PKApplyFocusedPickerViewController *)self dynamicCollectionDelegate];
  objc_super v6 = v5;
  if (v5) {
    [v5 recomputeSectionsWithReload:v3];
  }
}

- (void)didSelectCell
{
  BOOL v3 = [(PKPaymentSetupFieldPicker *)self->_picker currentValue];

  if (v3)
  {
    id v5 = [(PKApplyFocusedPickerViewController *)self navigationController];
    id v4 = (id)[v5 popViewControllerAnimated:1];
  }
}

- (PKApplyCollectionViewSectionControllerDelegate)dynamicCollectionDelegate
{
  return self->_dynamicCollectionDelegate;
}

- (void)setDynamicCollectionDelegate:(id)a3
{
  self->_dynamicCollectionDelegate = (PKApplyCollectionViewSectionControllerDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerSectionController, 0);

  objc_storeStrong((id *)&self->_picker, 0);
}

@end