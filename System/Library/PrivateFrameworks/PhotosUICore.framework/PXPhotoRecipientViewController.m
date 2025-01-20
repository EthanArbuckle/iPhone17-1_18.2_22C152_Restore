@interface PXPhotoRecipientViewController
+ (id)_contactViewControllerToPresentForRecipientViewController:(id)a3;
+ (id)recipientPickerViewControllerWithTitle:(id)a3 doneLabel:(id)a4 toLabel:(id)a5 usedAddresses:(id)a6 maxRecipients:(int64_t)a7 delegate:(id)a8;
- (BOOL)contactPickerPresentedExternally;
- (CNContactPickerViewController)contactPickerViewController;
- (NSArray)layoutConstraints;
- (NSSet)usedAddresses;
- (NSString)doneLabel;
- (NSString)initialLocalizedNameToQuery;
- (NSString)toLabel;
- (PXComposeRecipientView)composeRecipientView;
- (PXPhotoRecipientViewController)initWithCoder:(id)a3;
- (PXPhotoRecipientViewController)initWithInitialLocalizedNameToQuery:(id)a3;
- (PXPhotoRecipientViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXPhotoRecipientViewController)initWithSearchResultVerificationType:(int64_t)a3;
- (PXPhotoRecipientViewControllerDelegate)delegate;
- (PXRecipientSearchDataSourceManager)searchDataSourceManager;
- (PXSearchRecipientController)searchRecipientController;
- (UILabel)noContentLabel;
- (int64_t)maxRecipients;
- (void)_commonInitializationWithVerificationType:(int64_t)a3;
- (void)_contactPicker:(id)a3 didSelectComposeRecipient:(id)a4;
- (void)_dismissContactPickerViewController;
- (void)_handleAddButton:(id)a3;
- (void)_handleCancelButton:(id)a3;
- (void)_keyboardDidShow:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_presentContactPickerViewController:(id)a3;
- (void)_updateAddButton;
- (void)_updateNoContentLabelFont;
- (void)_updateNoContentLabelVisibility;
- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 didChangeSize:(CGSize)a4;
- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4;
- (void)composeRecipientView:(id)a3 disambiguateRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 textDidChange:(id)a4;
- (void)composeRecipientViewRequestAddRecipient:(id)a3;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)searchRecipientController:(id)a3 didSelectRecipient:(id)a4;
- (void)setComposeRecipientView:(id)a3;
- (void)setContactPickerPresentedExternally:(BOOL)a3;
- (void)setContactPickerViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneLabel:(id)a3;
- (void)setInitialLocalizedNameToQuery:(id)a3;
- (void)setLayoutConstraints:(id)a3;
- (void)setMaxRecipients:(int64_t)a3;
- (void)setNoContentLabel:(id)a3;
- (void)setSearchRecipientController:(id)a3;
- (void)setToLabel:(id)a3;
- (void)setUsedAddresses:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PXPhotoRecipientViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_noContentLabel, 0);
  objc_storeStrong((id *)&self->_composeRecipientView, 0);
  objc_storeStrong((id *)&self->_searchDataSourceManager, 0);
  objc_storeStrong((id *)&self->_searchRecipientController, 0);
  objc_storeStrong((id *)&self->_initialLocalizedNameToQuery, 0);
  objc_storeStrong((id *)&self->_usedAddresses, 0);
  objc_storeStrong((id *)&self->_toLabel, 0);
  objc_storeStrong((id *)&self->_doneLabel, 0);
  objc_storeStrong((id *)&self->_contactPickerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_resultsViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_recipientViewHeightConstraint, 0);
}

- (void)setLayoutConstraints:(id)a3
{
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setNoContentLabel:(id)a3
{
}

- (UILabel)noContentLabel
{
  return self->_noContentLabel;
}

- (void)setComposeRecipientView:(id)a3
{
}

- (PXComposeRecipientView)composeRecipientView
{
  return self->_composeRecipientView;
}

- (PXRecipientSearchDataSourceManager)searchDataSourceManager
{
  return self->_searchDataSourceManager;
}

- (void)setSearchRecipientController:(id)a3
{
}

- (PXSearchRecipientController)searchRecipientController
{
  return self->_searchRecipientController;
}

- (void)setInitialLocalizedNameToQuery:(id)a3
{
}

- (NSString)initialLocalizedNameToQuery
{
  return self->_initialLocalizedNameToQuery;
}

- (void)setContactPickerPresentedExternally:(BOOL)a3
{
  self->_contactPickerPresentedExternally = a3;
}

- (BOOL)contactPickerPresentedExternally
{
  return self->_contactPickerPresentedExternally;
}

- (int64_t)maxRecipients
{
  return self->_maxRecipients;
}

- (NSSet)usedAddresses
{
  return self->_usedAddresses;
}

- (NSString)toLabel
{
  return self->_toLabel;
}

- (NSString)doneLabel
{
  return self->_doneLabel;
}

- (void)setContactPickerViewController:(id)a3
{
}

- (CNContactPickerViewController)contactPickerViewController
{
  return self->_contactPickerViewController;
}

- (void)setDelegate:(id)a3
{
}

- (PXPhotoRecipientViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXPhotoRecipientViewControllerDelegate *)WeakRetained;
}

- (void)_updateNoContentLabelFont
{
  id v4 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:0x8000 options:0];
  v3 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];
  [(UILabel *)self->_noContentLabel setFont:v3];
}

- (void)searchRecipientController:(id)a3 didSelectRecipient:(id)a4
{
  id v8 = a4;
  if (!v8)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXPhotoRecipientViewController.m", 426, @"Invalid parameter not satisfying: %@", @"recipient" object file lineNumber description];
  }
  v6 = [(PXPhotoRecipientViewController *)self composeRecipientView];
  [v6 addRecipient:v8];
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v4 = a3;
  [(PXPhotoRecipientViewController *)self setContactPickerViewController:0];
  [v4 setDelegate:0];
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v8 = a3;
  id v4 = [v8 presentedViewController];
  v5 = [(PXPhotoRecipientViewController *)self contactPickerViewController];

  if (v4 == v5)
  {
    v6 = [(PXPhotoRecipientViewController *)self composeRecipientView];
    v7 = [v6 addButton];

    [v8 setSourceView:v7];
    [v7 bounds];
    objc_msgSend(v8, "setSourceRect:");
  }
}

- (void)_contactPicker:(id)a3 didSelectComposeRecipient:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [(PXPhotoRecipientViewController *)self contactPickerViewController];

  if (v9 == v8)
  {
    if (!v7) {
      goto LABEL_5;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXPhotoRecipientViewController.m", 393, @"Invalid parameter not satisfying: %@", @"picker == self.contactPickerViewController" object file lineNumber description];

    if (!v7) {
      goto LABEL_5;
    }
  }
  v10 = [(PXPhotoRecipientViewController *)self composeRecipientView];
  [v10 addRecipient:v7];

  if ([(PXPhotoRecipientViewController *)self contactPickerPresentedExternally])
  {
    v11 = [(PXPhotoRecipientViewController *)self delegate];
    v14[0] = v7;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v11 photoRecipientViewController:self didCompleteWithRecipients:v12];
  }
LABEL_5:
  [(PXPhotoRecipientViewController *)self _dismissContactPickerViewController];
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v17 = a4;
  id v6 = a3;
  id v7 = [v17 contact];
  id v8 = [v17 key];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F1ADC8]];

  if (v9)
  {
    v10 = [v17 value];
    uint64_t v11 = 0;
  }
  else
  {
    v12 = [v17 key];
    int v13 = [v12 isEqualToString:*MEMORY[0x1E4F1AEE0]];

    if (v13)
    {
      v14 = [v17 value];
      v10 = [v14 stringValue];

      uint64_t v11 = 1;
    }
    else
    {
      v10 = 0;
      uint64_t v11 = 5;
    }
  }
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F5A138]) initWithContact:v7 address:v10 kind:v11];
  v16 = [[PXCNComposeRecipient alloc] initWithRecipient:v15];
  [(PXPhotoRecipientViewController *)self _contactPicker:v6 didSelectComposeRecipient:v16];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = a3;
  PXCNComposeRecipientWithContact(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(PXPhotoRecipientViewController *)self _contactPicker:v6 didSelectComposeRecipient:v7];
}

- (void)contactPickerDidCancel:(id)a3
{
  id v5 = a3;
  id v6 = [(PXPhotoRecipientViewController *)self contactPickerViewController];

  if (v6 != v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXPhotoRecipientViewController.m", 365, @"Invalid parameter not satisfying: %@", @"picker == self.contactPickerViewController" object file lineNumber description];
  }
  [(PXPhotoRecipientViewController *)self _dismissContactPickerViewController];
}

- (void)composeRecipientView:(id)a3 didChangeSize:(CGSize)a4
{
  id v4 = [(PXPhotoRecipientViewController *)self view];
  [v4 setNeedsUpdateConstraints];
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  id v5 = a3;
  [(PXPhotoRecipientViewController *)self _updateAddButton];
  int64_t v6 = [(PXPhotoRecipientViewController *)self maxRecipients];
  id v7 = [v5 recipients];

  uint64_t v8 = [v7 count];
  if (v6 == v8)
  {
    id v11 = [(PXPhotoRecipientViewController *)self delegate];
    int v9 = [(PXPhotoRecipientViewController *)self composeRecipientView];
    v10 = [v9 recipients];
    [v11 photoRecipientViewController:self didCompleteWithRecipients:v10];
  }
}

- (void)composeRecipientView:(id)a3 disambiguateRecipient:(id)a4
{
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1BB80]);
  [v4 setDelegate:self];
  uint64_t v5 = *MEMORY[0x1E4F1ADC8];
  v12[0] = *MEMORY[0x1E4F1AEE0];
  v12[1] = v5;
  int64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v4 setDisplayedPropertyKeys:v6];
  [v4 setAllowsEditing:1];
  id v7 = [(PXPhotoRecipientViewController *)self initialLocalizedNameToQuery];
  if (-[PXPhotoRecipientViewController maxRecipients](self, "maxRecipients") == 1 && [v7 length])
  {
    uint64_t v8 = PXLocalizedStringFromTable(@"PXComposeRecipientPickerBootstrapWithLocalizedNamePrompt", @"PhotosUICore");
    id v11 = v7;
    int v9 = PXLocalizedStringWithValidatedFormat(v8, @"%@");
  }
  else
  {
    int v9 = PXLocalizedStringFromTable(@"PXComposeRecipientPickerBootstrapPrompt", @"PhotosUICore");
  }
  objc_msgSend(v4, "setPrompt:", v9, v11);
  v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(emailAddresses.@count == 1 AND phoneNumbers.@count == 0) OR (emailAddresses.@count == 0 AND phoneNumbers.@count == 1)"];
  [v4 setPredicateForSelectionOfContact:v10];
  [(PXPhotoRecipientViewController *)self _presentContactPickerViewController:v4];
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  uint64_t v5 = [(PXPhotoRecipientViewController *)self searchDataSourceManager];
  [v5 setQueryString:&stru_1F00B0030];

  [(PXPhotoRecipientViewController *)self _updateNoContentLabelVisibility];
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(PXPhotoRecipientViewController *)self searchDataSourceManager];
  [v6 setQueryString:v5];

  [(PXPhotoRecipientViewController *)self _updateNoContentLabelVisibility];
}

- (void)_keyboardWillHide:(id)a3
{
}

- (void)_keyboardDidShow:(id)a3
{
  id v4 = a3;
  id v25 = [(PXPhotoRecipientViewController *)self view];
  id v5 = [v4 userInfo];

  int64_t v6 = [v5 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v6 CGRectValue];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  objc_msgSend(v25, "convertRect:fromView:", 0, v8, v10, v12, v14);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  [v25 frame];
  v29.origin.x = v16;
  v29.origin.y = v18;
  v29.size.width = v20;
  v29.size.double height = v22;
  CGRect v28 = CGRectIntersection(v27, v29);
  double height = v28.size.height;
  objc_msgSend(v25, "safeAreaInsets", v28.origin.x, v28.origin.y, v28.size.width);
  [(NSLayoutConstraint *)self->_resultsViewBottomConstraint setConstant:v24 - height];
}

- (void)_updateNoContentLabelVisibility
{
  v3 = [(PXPhotoRecipientViewController *)self searchDataSourceManager];
  id v4 = [v3 queryString];
  uint64_t v5 = [v4 length];

  id v12 = [(PXPhotoRecipientViewController *)self searchRecipientController];
  uint64_t v6 = [v12 searchState];
  uint64_t v7 = [v12 numberOfSearchRecipients];
  if (v5) {
    BOOL v8 = v6 == 1;
  }
  else {
    BOOL v8 = 1;
  }
  uint64_t v10 = !v8 && v7 == 0;
  double v11 = [(PXSearchRecipientController *)self->_searchRecipientController searchResultsView];
  [v11 setHidden:v10];

  [(UILabel *)self->_noContentLabel setHidden:v10 ^ 1];
}

- (void)_updateAddButton
{
  v3 = [(PXPhotoRecipientViewController *)self composeRecipientView];
  id v4 = [v3 recipients];
  BOOL v5 = [v4 count] != 0;

  [(UIBarButtonItem *)self->_addButton setEnabled:v5];
  if ([(PXPhotoRecipientViewController *)self maxRecipients] == 1)
  {
    id v7 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIBarButtonItem *)self->_addButton setTintColor:v7];
  }
  else
  {
    addButton = self->_addButton;
    [(UIBarButtonItem *)addButton setTintColor:0];
  }
}

- (void)_handleAddButton:(id)a3
{
  id v6 = [(PXPhotoRecipientViewController *)self delegate];
  id v4 = [(PXPhotoRecipientViewController *)self composeRecipientView];
  BOOL v5 = [v4 recipients];
  [v6 photoRecipientViewController:self didCompleteWithRecipients:v5];
}

- (void)_handleCancelButton:(id)a3
{
  id v4 = [(PXPhotoRecipientViewController *)self delegate];
  [v4 photoRecipientViewControllerDidCancel:self];
}

- (void)_dismissContactPickerViewController
{
  id v6 = [(PXPhotoRecipientViewController *)self contactPickerViewController];
  uint64_t v3 = [(PXPhotoRecipientViewController *)self presentedViewController];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(PXPhotoRecipientViewController *)self presentedViewController];

    if (v5 == v6) {
      [(PXPhotoRecipientViewController *)self dismissViewControllerAnimated:1 completion:0];
    }
  }
  [(PXPhotoRecipientViewController *)self setContactPickerViewController:0];
}

- (void)_presentContactPickerViewController:(id)a3
{
  id v4 = a3;
  [v4 setModalPresentationStyle:7];
  id v5 = (void *)MEMORY[0x1E4FB1EB0];
  id v6 = [(PXPhotoRecipientViewController *)self view];
  uint64_t v7 = objc_msgSend(v5, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v6, "semanticContentAttribute"));

  if (v7) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 8;
  }
  id v9 = [v4 popoverPresentationController];
  [v9 setPermittedArrowDirections:v8];
  [v9 setDelegate:self];
  [(PXPhotoRecipientViewController *)self presentViewController:v4 animated:1 completion:0];
  [(PXPhotoRecipientViewController *)self setContactPickerViewController:v4];
}

- (void)setUsedAddresses:(id)a3
{
  uint64_t v8 = (NSSet *)a3;
  id v4 = self->_usedAddresses;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSSet *)v8 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v6 = (NSSet *)[(NSSet *)v8 copy];
      usedAddresses = self->_usedAddresses;
      self->_usedAddresses = v6;

      [(PXComposeRecipientView *)self->_composeRecipientView setUsedAddresses:self->_usedAddresses];
      [(PXRecipientSearchDataSourceManager *)self->_searchDataSourceManager setUsedAddresses:self->_usedAddresses];
    }
  }
}

- (void)setMaxRecipients:(int64_t)a3
{
  if (self->_maxRecipients != a3)
  {
    self->_maxRecipients = a3;
    -[PXComposeRecipientView setMaxRecipients:](self->_composeRecipientView, "setMaxRecipients:");
    [(PXPhotoRecipientViewController *)self _updateAddButton];
  }
}

- (void)setToLabel:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  id v4 = self->_toLabel;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      id v6 = (NSString *)[(NSString *)v8 copy];
      toLabel = self->_toLabel;
      self->_toLabel = v6;

      [(PXComposeRecipientView *)self->_composeRecipientView setLabel:self->_toLabel];
    }
  }
}

- (void)setDoneLabel:(id)a3
{
  uint64_t v10 = (NSString *)a3;
  id v4 = self->_doneLabel;
  if (v4 == v10)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v10 isEqualToString:v4];

    id v6 = v10;
    if (v5) {
      goto LABEL_8;
    }
    uint64_t v7 = (NSString *)[(NSString *)v10 copy];
    doneLabel = self->_doneLabel;
    self->_doneLabel = v7;

    if (self->_doneLabel)
    {
      -[UIBarButtonItem setTitle:](self->_addButton, "setTitle:");
    }
    else
    {
      id v9 = PXLocalizedStringFromTable(@"PXPhotoRecipientAddButtonTitle", @"PhotosUICore");
      [(UIBarButtonItem *)self->_addButton setTitle:v9];
    }
  }
  id v6 = v10;
LABEL_8:
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXPhotoRecipientViewController;
  [(PXPhotoRecipientViewController *)&v5 viewWillAppear:a3];
  id v4 = [(PXPhotoRecipientViewController *)self composeRecipientView];
  [v4 becomeFirstResponder];
}

- (void)viewDidLoad
{
  v29.receiver = self;
  v29.super_class = (Class)PXPhotoRecipientViewController;
  [(PXPhotoRecipientViewController *)&v29 viewDidLoad];
  uint64_t v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  id v4 = [(PXPhotoRecipientViewController *)self view];
  [v4 setBackgroundColor:v3];

  objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__handleCancelButton_];
  doneLabel = self->_doneLabel;
  if (doneLabel)
  {
    uint64_t v7 = doneLabel;
  }
  else
  {
    PXLocalizedStringFromTable(@"PXPhotoRecipientAddButtonTitle", @"PhotosUICore");
    uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = v7;
  id v9 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v7 style:2 target:self action:sel__handleAddButton_];
  addButton = self->_addButton;
  self->_addButton = v9;

  double v11 = [(PXPhotoRecipientViewController *)self navigationItem];
  [v11 setLeftBarButtonItem:v5];

  id v12 = self->_addButton;
  double v13 = [(PXPhotoRecipientViewController *)self navigationItem];
  [v13 setRightBarButtonItem:v12];

  double v14 = objc_alloc_init(PXCNComposeRecipientView);
  composeRecipientView = self->_composeRecipientView;
  self->_composeRecipientView = &v14->super;

  [(PXComposeRecipientView *)self->_composeRecipientView setTranslatesAutoresizingMaskIntoConstraints:0];
  if (self->_toLabel)
  {
    -[PXComposeRecipientView setLabel:](self->_composeRecipientView, "setLabel:");
  }
  else
  {
    CGFloat v16 = PXLocalizedStringFromTable(@"PXPhotoRecipientToLabelTitle", @"PhotosUICore");
    [(PXComposeRecipientView *)self->_composeRecipientView setLabel:v16];
  }
  [(PXComposeRecipientView *)self->_composeRecipientView setMaxRecipients:[(PXPhotoRecipientViewController *)self maxRecipients]];
  double v17 = [(PXPhotoRecipientViewController *)self usedAddresses];
  [(PXComposeRecipientView *)self->_composeRecipientView setUsedAddresses:v17];

  [(PXComposeRecipientView *)self->_composeRecipientView setDelegate:self];
  CGFloat v18 = [(PXPhotoRecipientViewController *)self initialLocalizedNameToQuery];
  [(PXComposeRecipientView *)self->_composeRecipientView setText:v18];

  double v19 = [(PXPhotoRecipientViewController *)self view];
  [v19 addSubview:self->_composeRecipientView];

  CGFloat v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  noContentLabel = self->_noContentLabel;
  self->_noContentLabel = v20;

  [(UILabel *)self->_noContentLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  CGFloat v22 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_noContentLabel setTextColor:v22];

  [(UILabel *)self->_noContentLabel setTextAlignment:1];
  [(UILabel *)self->_noContentLabel setNumberOfLines:0];
  v23 = PXLocalizedStringFromTable(@"PXComposeRecipientSearchNoResultsFound", @"PhotosUICore");
  [(UILabel *)self->_noContentLabel setText:v23];

  double v24 = [(PXPhotoRecipientViewController *)self view];
  [v24 addSubview:self->_noContentLabel];

  id v25 = [(PXSearchRecipientController *)self->_searchRecipientController searchResultsView];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  v26 = [(PXPhotoRecipientViewController *)self view];
  [v26 addSubview:v25];

  [(PXPhotoRecipientViewController *)self _updateAddButton];
  CGRect v27 = [(PXPhotoRecipientViewController *)self view];
  [v27 setNeedsUpdateConstraints];

  CGRect v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v28 addObserver:self selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

  [(PXPhotoRecipientViewController *)self _updateNoContentLabelFont];
}

- (void)updateViewConstraints
{
  v53[11] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PXPhotoRecipientViewController *)self layoutConstraints];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC8];
    objc_super v5 = [(PXPhotoRecipientViewController *)self layoutConstraints];
    [v4 deactivateConstraints:v5];

    [(PXPhotoRecipientViewController *)self setLayoutConstraints:0];
  }
  id v6 = [(PXPhotoRecipientViewController *)self view];
  uint64_t v7 = [(PXSearchRecipientController *)self->_searchRecipientController searchResultsView];
  uint64_t v8 = [v6 safeAreaLayoutGuide];
  id v9 = [(PXComposeRecipientView *)self->_composeRecipientView heightAnchor];
  [(PXComposeRecipientView *)self->_composeRecipientView intrinsicContentSize];
  double v11 = [v9 constraintEqualToConstant:v10];
  recipientViewHeightConstraint = self->_recipientViewHeightConstraint;
  self->_recipientViewHeightConstraint = v11;

  double v13 = [v7 bottomAnchor];
  double v14 = [v8 bottomAnchor];
  double v15 = [v13 constraintEqualToAnchor:v14];
  resultsViewBottomConstraint = self->_resultsViewBottomConstraint;
  self->_resultsViewBottomConstraint = v15;

  v51 = [(PXComposeRecipientView *)self->_composeRecipientView topAnchor];
  v37 = v8;
  v50 = [v8 topAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v53[0] = v49;
  v48 = [(PXComposeRecipientView *)self->_composeRecipientView leadingAnchor];
  v47 = [v6 leadingAnchor];
  v46 = [v48 constraintEqualToAnchor:v47];
  v53[1] = v46;
  v45 = [(PXComposeRecipientView *)self->_composeRecipientView trailingAnchor];
  v44 = [v6 trailingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  double v17 = self->_recipientViewHeightConstraint;
  v53[2] = v43;
  v53[3] = v17;
  v41 = [(UILabel *)self->_noContentLabel topAnchor];
  v40 = [(PXComposeRecipientView *)self->_composeRecipientView bottomAnchor];
  v38 = [v41 constraintEqualToAnchor:v40 constant:40.0];
  v53[4] = v38;
  v36 = [(UILabel *)self->_noContentLabel leadingAnchor];
  v35 = [v6 leadingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35 constant:20.0];
  v53[5] = v34;
  v33 = [(UILabel *)self->_noContentLabel trailingAnchor];
  CGFloat v18 = v6;
  v42 = v6;
  v32 = [v6 trailingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32 constant:-20.0];
  v53[6] = v31;
  v30 = [v7 topAnchor];
  double v19 = [(PXComposeRecipientView *)self->_composeRecipientView bottomAnchor];
  CGFloat v20 = [v30 constraintEqualToAnchor:v19];
  v53[7] = v20;
  double v21 = v7;
  v39 = v7;
  CGFloat v22 = [v7 leadingAnchor];
  v23 = [v18 leadingAnchor];
  double v24 = [v22 constraintEqualToAnchor:v23];
  v53[8] = v24;
  id v25 = [v21 trailingAnchor];
  v26 = [v8 trailingAnchor];
  CGRect v27 = [v25 constraintEqualToAnchor:v26];
  CGRect v28 = self->_resultsViewBottomConstraint;
  v53[9] = v27;
  v53[10] = v28;
  objc_super v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:11];

  [MEMORY[0x1E4F28DC8] activateConstraints:v29];
  [(PXPhotoRecipientViewController *)self setLayoutConstraints:v29];
  v52.receiver = self;
  v52.super_class = (Class)PXPhotoRecipientViewController;
  [(PXPhotoRecipientViewController *)&v52 updateViewConstraints];
}

- (PXPhotoRecipientViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PXPhotoRecipientViewController;
  id v4 = [(PXPhotoRecipientViewController *)&v7 initWithNibName:a3 bundle:a4];
  objc_super v5 = v4;
  if (v4) {
    [(PXPhotoRecipientViewController *)v4 _commonInitializationWithVerificationType:0];
  }
  return v5;
}

- (PXPhotoRecipientViewController)initWithSearchResultVerificationType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXPhotoRecipientViewController;
  id v4 = [(PXPhotoRecipientViewController *)&v7 init];
  objc_super v5 = v4;
  if (v4) {
    [(PXPhotoRecipientViewController *)v4 _commonInitializationWithVerificationType:a3];
  }
  return v5;
}

- (PXPhotoRecipientViewController)initWithInitialLocalizedNameToQuery:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXPhotoRecipientViewController;
  objc_super v5 = [(PXPhotoRecipientViewController *)&v10 init];
  id v6 = v5;
  if (v5)
  {
    [(PXPhotoRecipientViewController *)v5 _commonInitializationWithVerificationType:0];
    uint64_t v7 = [v4 copy];
    initialLocalizedNameToQuery = v6->_initialLocalizedNameToQuery;
    v6->_initialLocalizedNameToQuery = (NSString *)v7;
  }
  return v6;
}

- (PXPhotoRecipientViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotoRecipientViewController.m", 61, @"%s is not available as initializer", "-[PXPhotoRecipientViewController initWithCoder:]");

  abort();
}

- (void)_commonInitializationWithVerificationType:(int64_t)a3
{
  objc_super v10 = [[PXCNRecipientSearchDataSourceManager alloc] initWithVerificationType:a3];
  id v4 = [(PXPhotoRecipientViewController *)self usedAddresses];
  [(PXRecipientSearchDataSourceManager *)v10 setUsedAddresses:v4];

  id v5 = [[PXSearchRecipientController alloc] initWithSearchDataSourceManager:v10];
  searchRecipientController = self->_searchRecipientController;
  self->_searchRecipientController = v5;

  [(PXSearchRecipientController *)self->_searchRecipientController setDelegate:self];
  uint64_t v7 = [(PXSearchRecipientController *)self->_searchRecipientController searchDataSourceManager];
  searchDataSourceManager = self->_searchDataSourceManager;
  self->_searchDataSourceManager = v7;

  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel__keyboardDidShow_ name:*MEMORY[0x1E4FB2BC8] object:0];
  [v9 addObserver:self selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
}

+ (id)recipientPickerViewControllerWithTitle:(id)a3 doneLabel:(id)a4 toLabel:(id)a5 usedAddresses:(id)a6 maxRecipients:(int64_t)a7 delegate:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  double v19 = [[PXPhotoRecipientViewController alloc] initWithSearchResultVerificationType:1];
  [(PXPhotoRecipientViewController *)v19 setTitle:v18];

  [(PXPhotoRecipientViewController *)v19 setDoneLabel:v17];
  [(PXPhotoRecipientViewController *)v19 setToLabel:v16];

  [(PXPhotoRecipientViewController *)v19 setUsedAddresses:v15];
  [(PXPhotoRecipientViewController *)v19 setMaxRecipients:a7];
  [(PXPhotoRecipientViewController *)v19 setDelegate:v14];

  CGFloat v20 = [a1 _contactViewControllerToPresentForRecipientViewController:v19];

  return v20;
}

+ (id)_contactViewControllerToPresentForRecipientViewController:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[PXPeopleUtilities isGreenTeaAndContactsAccessDenied])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1BB80]);
    [v4 setMode:1];
    [v4 setDelegate:v3];
    uint64_t v5 = *MEMORY[0x1E4F1ADC8];
    v10[0] = *MEMORY[0x1E4F1AEE0];
    v10[1] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    [v4 setDisplayedPropertyKeys:v6];
    [v4 setAllowsEditing:1];
    uint64_t v7 = PXLocalizedSharedLibraryString(@"PXSharedLibrarySetupAssistant_Participants_AddPeople_Title");
    [v4 setPrompt:v7];

    uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(emailAddresses.@count == 1 AND phoneNumbers.@count == 0) OR (emailAddresses.@count == 0 AND phoneNumbers.@count == 1)"];
    [v4 setPredicateForSelectionOfContact:v8];
    [v3 setContactPickerViewController:v4];
    [v3 setContactPickerPresentedExternally:1];
  }
  else
  {
    id v4 = (id)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v3];

    [v4 setModalPresentationStyle:2];
  }
  return v4;
}

@end