@interface PKPaymentPreferencesListViewController
- (BOOL)collectionViewIsEditingForSectionController:(id)a3;
- (BOOL)preferenceHasSeparateAddItemsSection;
- (NSArray)preferences;
- (PKPaymentPreferencesListViewController)initWithPreferences:(id)a3 title:(id)a4 style:(int64_t)a5 handler:(id)a6 contactFormatValidator:(id)a7;
- (id)_requiredKeysForContactPreference:(id)a3;
- (void)_endCurrentInlineEditing;
- (void)_handleSelectedContact:(id)a3;
- (void)_keyboardDidShow:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_reloadEditedSection:(id)a3;
- (void)_resetEditingContact:(id)a3 withCell:(id)a4 forRow:(unint64_t)a5;
- (void)_setupSectionControllers;
- (void)_updateContactAtIndex:(unint64_t)a3 withCell:(id)a4;
- (void)_updateNavigationBarButtons;
- (void)addressEditorViewController:(id)a3 selectedContact:(id)a4;
- (void)addressEditorViewControllerDidCancel:(id)a3;
- (void)addressSearcherViewController:(id)a3 selectedContact:(id)a4;
- (void)addressSearcherViewControllerDidCancel:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)presentHideMyEmailAlertController;
- (void)presentMeCardAlertControllerWithContact:(id)a3 contactKey:(id)a4 handler:(id)a5;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setPreferenceHasSeparateAddItemsSection:(BOOL)a3;
- (void)setPreferences:(id)a3;
- (void)showAddressEditorForContactItem:(id)a3 inSectionController:(id)a4;
- (void)showAddressPickerForPreference:(id)a3 inSectionController:(id)a4;
- (void)showContactsPickerForPreference:(id)a3 inSectionController:(id)a4;
- (void)startInlineEditingForContactItem:(id)a3 inSectionController:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPaymentPreferencesListViewController

- (PKPaymentPreferencesListViewController)initWithPreferences:(id)a3 title:(id)a4 style:(int64_t)a5 handler:(id)a6 contactFormatValidator:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentPreferencesListViewController;
  v17 = [(PKDynamicCollectionViewController *)&v23 init];
  v18 = v17;
  if (v17)
  {
    v22.receiver = v17;
    v22.super_class = (Class)PKPaymentPreferencesListViewController;
    [(PKPaymentPreferencesListViewController *)&v22 setTitle:v14];
    objc_storeStrong((id *)&v18->_preferences, a3);
    v19 = _Block_copy(v15);
    id handler = v18->_handler;
    v18->_id handler = v19;

    objc_storeStrong((id *)&v18->_contactFormatValidator, a7);
    v18->_style = a5;
    [(PKPaymentPreferencesListViewController *)v18 _setupSectionControllers];
  }

  return v18;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPreferencesListViewController;
  [(PKDynamicCollectionViewController *)&v4 viewDidLoad];
  v3 = [(PKDynamicCollectionViewController *)self collectionView];
  [v3 setAllowsSelectionDuringEditing:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPreferencesListViewController;
  [(PKDynamicCollectionViewController *)&v8 viewDidAppear:a3];
  v3 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v4 = *MEMORY[0x1E4F87020];
  uint64_t v5 = *MEMORY[0x1E4F86730];
  v9[0] = *MEMORY[0x1E4F86308];
  v9[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F86880];
  v10[0] = *MEMORY[0x1E4F864A0];
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [v3 subject:v4 sendEvent:v7];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPreferencesListViewController;
  [(PKDynamicCollectionViewController *)&v6 viewWillAppear:a3];
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__keyboardDidShow_ name:*MEMORY[0x1E4FB2BC8] object:0];

  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];

  [(PKPaymentPreferencesListViewController *)self _updateNavigationBarButtons];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentPreferencesListViewController;
  [(PKPaymentPreferencesListViewController *)&v10 viewDidDisappear:a3];
  [(PKPaymentPreferencesListViewController *)self setEditing:0 animated:1];
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  uint64_t v5 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v6 = *MEMORY[0x1E4F87020];
  uint64_t v7 = *MEMORY[0x1E4F86730];
  v11[0] = *MEMORY[0x1E4F86308];
  v11[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F86880];
  v12[0] = *MEMORY[0x1E4F864A8];
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [v5 subject:v6 sendEvent:v9];
}

- (void)_updateNavigationBarButtons
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(PKPaymentPreferencesListViewController *)self navigationItem];
  [v3 setRightBarButtonItem:0];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_preferences;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "supportsDeletion", (void)v14))
        {
          if (([v9 isReadOnly] & 1) == 0)
          {
            objc_super v10 = [v9 preferences];
            uint64_t v11 = [v10 count];

            if (v11)
            {
              v12 = [(PKPaymentPreferencesListViewController *)self navigationItem];
              id v13 = [(PKPaymentPreferencesListViewController *)self editButtonItem];
              [v12 setRightBarButtonItem:v13];

              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPreferencesListViewController;
  [(PKDynamicCollectionViewController *)&v7 setEditing:a3 animated:a4];
  if (!a3)
  {
    [(PKPaymentPreferencesListViewController *)self _endCurrentInlineEditing];
    editingItem = self->_editingItem;
    self->_editingItem = 0;
  }
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);

  [(PKPaymentPreferencesListViewController *)self _setupSectionControllers];
}

- (void)_setupSectionControllers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_preferences;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_initWeak(&location, self);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __66__PKPaymentPreferencesListViewController__setupSectionControllers__block_invoke;
        aBlock[3] = &unk_1E59E00C8;
        objc_copyWeak(&v14, &location);
        uint64_t v8 = _Block_copy(aBlock);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v9 = [[PKPaymentPreferenceContactSectionController alloc] initWithContactPreference:v7 contactFormatValidator:self->_contactFormatValidator style:self->_style preferencesChangedHandler:v8];
          [(PKPaymentPreferenceContactSectionController *)v9 setContactDelegate:self];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v9 = [(PKPaymentPreferenceSectionController *)[PKPaymentPreferenceCardSectionController alloc] initWithPreference:v7 style:self->_style preferencesChangedHandler:v8];
          }
          else {
            v9 = 0;
          }
        }
        [(PKPaymentPreferenceSectionController *)v9 setDelegate:self];
        [v3 addObject:v9];

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }

  if (self->_preferenceHasSeparateAddItemsSection && [v3 count] == 2)
  {
    objc_super v10 = [v3 objectAtIndexedSubscript:0];
    uint64_t v11 = [v3 objectAtIndexedSubscript:1];
    [v11 setLinkedSectionController:v10];
  }
  [(PKDynamicCollectionViewController *)self setSections:v3 animated:0];
}

void __66__PKPaymentPreferencesListViewController__setupSectionControllers__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _reloadEditedSection:v3];
}

- (void)_keyboardDidShow:(id)a3
{
  id v30 = [a3 userInfo];
  uint64_t v4 = [v30 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v4 CGRectValue];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = *MEMORY[0x1E4FB2848];
  double v14 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v15 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  long long v16 = [(PKPaymentPreferencesListViewController *)self view];
  objc_msgSend(v16, "convertRect:fromView:", 0, v6, v8, v10, v12);
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  v25 = [(PKDynamicCollectionViewController *)self collectionView];
  [v25 frame];
  double MaxY = CGRectGetMaxY(v32);
  v33.origin.x = v18;
  v33.origin.y = v20;
  v33.size.width = v22;
  v33.size.height = v24;
  double v27 = MaxY - CGRectGetMinY(v33) + 10.0;

  v28 = [(PKDynamicCollectionViewController *)self collectionView];
  objc_msgSend(v28, "setContentInset:", v13, v14, v27, v15);

  v29 = [(PKDynamicCollectionViewController *)self collectionView];
  objc_msgSend(v29, "setScrollIndicatorInsets:", v13, v14, v27, v15);
}

- (void)_keyboardWillHide:(id)a3
{
  uint64_t v4 = [(PKDynamicCollectionViewController *)self collectionView];
  double v5 = *MEMORY[0x1E4FB2848];
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v7 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v8 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  objc_msgSend(v4, "setContentInset:", *MEMORY[0x1E4FB2848], v6, v7, v8);

  id v9 = [(PKDynamicCollectionViewController *)self collectionView];
  objc_msgSend(v9, "setScrollIndicatorInsets:", v5, v6, v7, v8);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 deselectItemAtIndexPath:v6 animated:1];
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPreferencesListViewController;
  [(PKDynamicCollectionViewController *)&v8 collectionView:v7 didSelectItemAtIndexPath:v6];
}

- (BOOL)collectionViewIsEditingForSectionController:(id)a3
{
  id v3 = [(PKDynamicCollectionViewController *)self collectionView];
  char v4 = [v3 isEditing];

  return v4;
}

- (void)presentHideMyEmailAlertController
{
  id v3 = (void *)MEMORY[0x1E4FB1418];
  char v4 = PKLocalizedHideMyEmailString(&cfstr_Hme2faAlertTit.isa);
  double v5 = PKLocalizedHideMyEmailString(&cfstr_Hme2faAlertDes.isa);
  id v12 = [v3 alertControllerWithTitle:v4 message:v5 preferredStyle:1];

  id v6 = (void *)MEMORY[0x1E4FB1410];
  id v7 = PKLocalizedString(&cfstr_Cancel.isa);
  objc_super v8 = [v6 actionWithTitle:v7 style:1 handler:0];
  [v12 addAction:v8];

  id v9 = (void *)MEMORY[0x1E4FB1410];
  double v10 = PKLocalizedPaymentString(&cfstr_Continue.isa);
  double v11 = [v9 actionWithTitle:v10 style:0 handler:&__block_literal_global_237];

  [v12 addAction:v11];
  [v12 setPreferredAction:v11];
  [(PKPaymentPreferencesListViewController *)self presentViewController:v12 animated:1 completion:0];
}

void __75__PKPaymentPreferencesListViewController_presentHideMyEmailAlertController__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CB10]);
  id v2 = (id)[v0 initWithString:*MEMORY[0x1E4F87278]];
  if (v2)
  {
    v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v1 openSensitiveURL:v2 withOptions:0];
  }
}

- (void)showAddressEditorForContactItem:(id)a3 inSectionController:(id)a4
{
  id v19 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_editingContactSectionController, a4);
  objc_storeStrong((id *)&self->_editingItem, a3);
  objc_super v8 = [v19 contactPreference];
  id v9 = [v7 contactPreference];
  double v10 = [v9 errorsForPreference:v8];
  uint64_t v11 = [v10 count];

  id v12 = [(PKPaymentPreferencesListViewController *)self _requiredKeysForContactPreference:v9];
  double v13 = [PKAddressEditorViewController alloc];
  double v14 = v13;
  if (v11)
  {
    double v15 = [v9 errorsForPreference:v8];
    long long v16 = [(PKAddressEditorViewController *)v14 initWithContact:v8 requiredKeys:v12 highlightedKeys:0 errors:v15 style:1];
  }
  else
  {
    long long v16 = [(PKAddressEditorViewController *)v13 initWithContact:v8 requiredKeys:v12 highlightedKeys:0 errors:0 style:1];
  }
  [(PKAddressEditorViewController *)v16 setDelegate:self];
  double v17 = [v9 editExistingTitle];
  [(PKAddressEditorViewController *)v16 setTitle:v17];

  [(PKAddressEditorViewController *)v16 setContactFormatValidator:self->_contactFormatValidator];
  CGFloat v18 = [[PKBlurredContainerNavigationController alloc] initWithRootViewController:v16];
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [(PKBlurredContainerNavigationController *)v18 setModalPresentationStyle:2];
  }
  [(PKPaymentPreferencesListViewController *)self presentViewController:v18 animated:1 completion:0];
}

- (void)showAddressPickerForPreference:(id)a3 inSectionController:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (PKUIStoreDemoGatewayWithViewController(self))
  {
    objc_storeStrong((id *)&self->_editingContactSectionController, a4);
    id v7 = [v13 addNewTitle];
    objc_super v8 = [[PKAddressSearcherViewController alloc] initWithStyle:1];
    id v9 = [(PKPaymentPreferencesListViewController *)self _requiredKeysForContactPreference:v13];
    [(PKAddressSearcherViewController *)v8 setRequiredKeys:v9];

    double v10 = PKLocalizedPaymentString(v7);
    [(PKAddressSearcherViewController *)v8 setTitle:v10];

    [(PKAddressSearcherViewController *)v8 setDelegate:self];
    [(PKAddressSearcherViewController *)v8 setContactFormatValidator:self->_contactFormatValidator];
    uint64_t v11 = [[PKBlurredContainerNavigationController alloc] initWithRootViewController:v8];
    if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
    {
      [(PKBlurredContainerNavigationController *)v11 setModalPresentationStyle:2];
      [MEMORY[0x1E4FB1EC0] defaultFormSheetSize];
      -[PKBlurredContainerNavigationController setPreferredContentSize:](v11, "setPreferredContentSize:");
    }
    id v12 = PKLocalizedPaymentString(v7);
    [(PKBlurredContainerNavigationController *)v11 setTitle:v12];

    [(PKPaymentPreferencesListViewController *)self setEditing:0];
    [(PKPaymentPreferencesListViewController *)self presentViewController:v11 animated:1 completion:0];
  }
}

- (void)showContactsPickerForPreference:(id)a3 inSectionController:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (PKUIStoreDemoGatewayWithViewController(self))
  {
    objc_storeStrong((id *)&self->_editingContactSectionController, a4);
    objc_super v8 = [v6 contactKey];
    id v9 = objc_alloc_init(getCNContactPickerViewControllerClass_0());
    if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
    {
      [v9 setModalPresentationStyle:2];
    }
    [v9 setDelegate:self];
    v15[0] = v8;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v9 setDisplayedPropertyKeys:v10];

    if ([v8 isEqualToString:*MEMORY[0x1E4F1ADC8]])
    {
      uint64_t v11 = @"emailAddresses.@count = 1";
      id v12 = @"emailAddresses.@count > 0";
    }
    else if ([v8 isEqualToString:*MEMORY[0x1E4F1AF10]])
    {
      uint64_t v11 = @"postalAddresses.@count = 1";
      id v12 = @"postalAddresses.@count > 0";
    }
    else
    {
      if (![v8 isEqualToString:*MEMORY[0x1E4F1AEE0]])
      {
LABEL_11:
        [(PKPaymentPreferencesListViewController *)self setEditing:0];
        [(PKPaymentPreferencesListViewController *)self presentViewController:v9 animated:1 completion:0];

        goto LABEL_12;
      }
      uint64_t v11 = @"phoneNumbers.@count = 1";
      id v12 = @"phoneNumbers.@count > 0";
    }
    id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:v12];
    [v9 setPredicateForEnablingContact:v13];

    double v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:v11];
    [v9 setPredicateForSelectionOfContact:v14];

    goto LABEL_11;
  }
LABEL_12:
}

- (void)presentMeCardAlertControllerWithContact:(id)a3 contactKey:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 isEqualToString:*MEMORY[0x1E4F1ADC8]])
  {
    id v9 = @"EMAIL";
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F1AEE0]])
  {
    id v9 = @"PHONE";
  }
  else
  {
    id v9 = @"ADDRESS";
  }
  double v10 = [NSString stringWithFormat:@"IN_APP_PAYMENT_OPTIONS_EDIT_ME_CARD_%@_NO_LABEL", v9];
  uint64_t v11 = PKLocalizedPaymentString(v10);

  id v12 = (void *)MEMORY[0x1E4FB1418];
  id v13 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_38.isa);
  double v14 = [v12 alertControllerWithTitle:v13 message:v11 preferredStyle:1];

  double v15 = (void *)MEMORY[0x1E4FB1410];
  long long v16 = [NSString stringWithFormat:@"IN_APP_PAYMENT_OPTIONS_CHANGE_%@", v9];
  double v17 = PKLocalizedPaymentString(v16);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __101__PKPaymentPreferencesListViewController_presentMeCardAlertControllerWithContact_contactKey_handler___block_invoke;
  v23[3] = &unk_1E59CB150;
  id v24 = v8;
  id v18 = v8;
  id v19 = [v15 actionWithTitle:v17 style:2 handler:v23];
  [v14 addAction:v19];

  CGFloat v20 = (void *)MEMORY[0x1E4FB1410];
  double v21 = PKLocalizedString(&cfstr_Cancel.isa);
  CGFloat v22 = [v20 actionWithTitle:v21 style:1 handler:0];
  [v14 addAction:v22];

  [(PKPaymentPreferencesListViewController *)self presentViewController:v14 animated:1 completion:0];
}

uint64_t __101__PKPaymentPreferencesListViewController_presentMeCardAlertControllerWithContact_contactKey_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)startInlineEditingForContactItem:(id)a3 inSectionController:(id)a4
{
  id v6 = (PKPaymentPreferenceOptionListItem *)a3;
  id v7 = (PKPaymentPreferenceContactSectionController *)a4;
  if (([(PKPaymentPreferencesListViewController *)self isEditing] & 1) == 0) {
    [(PKPaymentPreferencesListViewController *)self setEditing:1 animated:1];
  }
  [(PKPaymentPreferencesListViewController *)self _endCurrentInlineEditing];
  if (v6)
  {
    id v8 = [(PKPaymentPreferenceContactSectionController *)v7 contactItems];
    uint64_t v9 = [v8 indexOfObject:v6];
  }
  else
  {
    id v6 = [(PKPaymentPreferenceSectionController *)v7 appendNewItemForEditing];
    double v10 = [(PKPaymentPreferenceSectionController *)v7 preference];
    uint64_t v11 = [v10 preferences];
    id v12 = [v11 lastObject];
    int v13 = [v12 isHideMyEmail];

    if (v13) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 1;
    }
    id v8 = [(PKPaymentPreferenceSectionController *)v7 preference];
    double v15 = [v8 preferences];
    if ([v15 count] == v14)
    {
      uint64_t v9 = 0;
    }
    else
    {
      long long v16 = [(PKPaymentPreferenceSectionController *)v7 preference];
      double v17 = [v16 preferences];
      uint64_t v9 = [v17 count] - v14;
    }
  }

  id v18 = [(PKDynamicCollectionViewController *)self sections];
  uint64_t v19 = [v18 indexOfObject:v7];

  id v25 = [MEMORY[0x1E4F28D58] indexPathForItem:v9 inSection:v19];
  CGFloat v20 = [(PKDynamicCollectionViewController *)self collectionView];
  double v21 = [v20 cellForItemAtIndexPath:v25];

  [v21 beginEditing];
  editingItem = self->_editingItem;
  self->_editingItem = v6;
  double v23 = v6;

  editingContactSectionController = self->_editingContactSectionController;
  self->_editingContactSectionController = v7;
}

- (void)_reloadEditedSection:(id)a3
{
  id v6 = a3;
  [(PKPaymentPreferencesListViewController *)self _updateNavigationBarButtons];
  id handler = (void (**)(id, PKPaymentPreferencesListViewController *, NSArray *))self->_handler;
  if (handler) {
    handler[2](handler, self, self->_preferences);
  }
  double v5 = [v6 sectionIdentifier];
  [(PKDynamicCollectionViewController *)self reloadDataForSectionIdentifier:v5 animated:1];
}

- (id)_requiredKeysForContactPreference:(id)a3
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v5 = [v3 contactKey];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F1AF10]];

  if (v6)
  {
    uint64_t v7 = *MEMORY[0x1E4F1B7C8];
    v11[0] = *MEMORY[0x1E4F87118];
    v11[1] = v7;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    [v4 addObjectsFromArray:v8];

    if ([v3 showPhoneticName]) {
      [v4 addObject:*MEMORY[0x1E4F87128]];
    }
  }
  uint64_t v9 = (void *)[v4 copy];

  return v9;
}

- (void)_handleSelectedContact:(id)a3
{
  editingContactSectionController = self->_editingContactSectionController;
  editingItem = self->_editingItem;
  uint64_t v5 = *MEMORY[0x1E4F1AF10];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PKPaymentPreferencesListViewController__handleSelectedContact___block_invoke;
  v6[3] = &unk_1E59E00F0;
  v6[4] = self;
  [(PKPaymentPreferenceContactSectionController *)editingContactSectionController saveContact:a3 forItem:editingItem withContactKey:v5 completion:v6];
}

uint64_t __65__PKPaymentPreferencesListViewController__handleSelectedContact___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _reloadEditedSection:*(void *)(*(void *)(a1 + 32) + 1072)];
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__PKPaymentPreferencesListViewController__handleSelectedContact___block_invoke_2;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = v2;
  return [v2 dismissViewControllerAnimated:1 completion:v4];
}

void __65__PKPaymentPreferencesListViewController__handleSelectedContact___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1072);
  *(void *)(v2 + 1072) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 1080);
  *(void *)(v4 + 1080) = 0;
}

- (void)_endCurrentInlineEditing
{
  if (self->_editingItem && self->_editingContactSectionController)
  {
    id v3 = [(PKDynamicCollectionViewController *)self sections];
    uint64_t v4 = [v3 indexOfObject:self->_editingContactSectionController];

    uint64_t v5 = [(PKPaymentPreferenceSectionController *)self->_editingContactSectionController items];
    uint64_t v6 = [v5 indexOfObject:self->_editingItem];

    id v9 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:v4];
    uint64_t v7 = [(PKDynamicCollectionViewController *)self collectionView];
    id v8 = [v7 cellForItemAtIndexPath:v9];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(PKPaymentPreferencesListViewController *)self _updateContactAtIndex:v6 withCell:v8];
    }
  }
}

- (void)_updateContactAtIndex:(unint64_t)a3 withCell:(id)a4
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [v6 textFieldText];
  [v6 endEditing];
  id v8 = [(PKPaymentPreferenceOptionListItem *)self->_editingItem preference];
  if (v7 && [v7 length])
  {
    id v9 = [(PKPaymentPreferenceContactSectionController *)self->_editingContactSectionController contactPreference];
    v29 = [v9 contactKey];
    double v10 = (void *)[v8 mutableCopy];
    if ([v29 isEqualToString:*MEMORY[0x1E4F1ADC8]])
    {
      uint64_t v11 = [v8 emailAddresses];
      id v12 = [v11 firstObject];

      int v13 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:v7];
      uint64_t v14 = v13;
      if (v13)
      {
        uint64_t v15 = [v13 stringValue];

        id v7 = (id)v15;
      }
      id v7 = v7;

      v28 = v7;
    }
    else if ([v29 isEqualToString:*MEMORY[0x1E4F1AEE0]])
    {
      long long v16 = [v8 phoneNumbers];
      id v12 = [v16 firstObject];

      v28 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v7];
    }
    else
    {
      id v12 = 0;
      v28 = 0;
    }
    double v17 = (void *)MEMORY[0x1E4F1BA20];
    id v18 = [v12 label];
    double v27 = [v17 labeledValueWithLabel:v18 value:v28];

    v45[0] = v27;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
    [v10 setValue:v19 forKey:v29];

    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__66;
    v43 = __Block_byref_object_dispose__66;
    id v44 = 0;
    CGFloat v20 = [v9 preferences];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __73__PKPaymentPreferencesListViewController__updateContactAtIndex_withCell___block_invoke;
    v35[3] = &unk_1E59E0118;
    id v21 = v10;
    v37 = &v39;
    unint64_t v38 = a3;
    id v36 = v21;
    [v20 enumerateObjectsUsingBlock:v35];

    if (v40[5])
    {
      [(PKPaymentPreferencesListViewController *)self _resetEditingContact:v8 withCell:v6 forRow:a3];
      uint64_t v22 = [v9 indexOfContact:v40[5]];
      uint64_t v23 = [v9 selectedIndex];
      if (v22 != 0x7FFFFFFFFFFFFFFFLL && v23 != v22)
      {
        [(PKPaymentPreferenceSectionController *)self->_editingContactSectionController setSelectedIndex:v22];
        [(PKPaymentPreferencesListViewController *)self _reloadEditedSection:self->_editingContactSectionController];
      }
    }
    else
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __73__PKPaymentPreferencesListViewController__updateContactAtIndex_withCell___block_invoke_2;
      aBlock[3] = &unk_1E59D22D0;
      void aBlock[4] = self;
      id v31 = v21;
      id v24 = v29;
      id v32 = v24;
      id v33 = v9;
      unint64_t v34 = a3;
      id v25 = (void (**)(void))_Block_copy(aBlock);
      if ([v8 contactSource] == 1)
      {
        v26 = (void *)[v25 copy];
        [(PKPaymentPreferencesListViewController *)self presentMeCardAlertControllerWithContact:v8 contactKey:v24 handler:v26];
      }
      else
      {
        v25[2](v25);
      }
    }
    _Block_object_dispose(&v39, 8);
  }
  else
  {
    [(PKPaymentPreferencesListViewController *)self _resetEditingContact:v8 withCell:v6 forRow:a3];
  }
}

void __73__PKPaymentPreferencesListViewController__updateContactAtIndex_withCell___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualIgnoringIdentifiers:") && *(void *)(a1 + 48) != a3)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __73__PKPaymentPreferencesListViewController__updateContactAtIndex_withCell___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(v2 + 1072);
  uint64_t v5 = *(void *)(v2 + 1080);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PKPaymentPreferencesListViewController__updateContactAtIndex_withCell___block_invoke_3;
  void v10[3] = &unk_1E59E0140;
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v9;
  uint64_t v13 = v8;
  [v4 saveContact:v3 forItem:v5 withContactKey:v6 completion:v10];
}

uint64_t __73__PKPaymentPreferencesListViewController__updateContactAtIndex_withCell___block_invoke_3(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) selectedIndex];
  uint64_t v3 = [*(id *)(a1 + 32) preferences];
  unint64_t v4 = [v3 count];

  if (v2 == 0x7FFFFFFFFFFFFFFFLL || v2 >= v4)
  {
    if (*(void *)(a1 + 48) < v4) {
      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1072), "setSelectedIndex:");
    }
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) preferences];
    id v7 = [v6 objectAtIndex:v2];

    uint64_t v8 = [*(id *)(a1 + 32) errorsForPreference:v7];
    uint64_t v9 = [v8 count];

    if (v9 && *(void *)(a1 + 48) < v4) {
      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1072), "setSelectedIndex:");
    }
  }
  double v10 = *(void **)(a1 + 40);
  uint64_t v11 = v10[134];

  return [v10 _reloadEditedSection:v11];
}

- (void)_resetEditingContact:(id)a3 withCell:(id)a4 forRow:(unint64_t)a5
{
  id v8 = a4;
  if ([a3 contactSource] == 1)
  {
    [v8 resetTextFieldTextFromLabel];
  }
  else
  {
    [(PKPaymentPreferenceContactSectionController *)self->_editingContactSectionController deleteItem:self->_editingItem forRow:a5];
    [(PKPaymentPreferencesListViewController *)self _reloadEditedSection:self->_editingContactSectionController];
  }
}

- (void)addressEditorViewController:(id)a3 selectedContact:(id)a4
{
  editingContactSectionController = self->_editingContactSectionController;
  editingItem = self->_editingItem;
  uint64_t v7 = *MEMORY[0x1E4F1AF10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__PKPaymentPreferencesListViewController_addressEditorViewController_selectedContact___block_invoke;
  v8[3] = &unk_1E59E00F0;
  v8[4] = self;
  [(PKPaymentPreferenceContactSectionController *)editingContactSectionController saveContact:a4 forItem:editingItem withContactKey:v7 completion:v8];
}

void __86__PKPaymentPreferencesListViewController_addressEditorViewController_selectedContact___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__PKPaymentPreferencesListViewController_addressEditorViewController_selectedContact___block_invoke_2;
  v6[3] = &unk_1E59CA870;
  v6[4] = v4;
  id v7 = v3;
  id v5 = v3;
  [v4 dismissViewControllerAnimated:1 completion:v6];
}

void __86__PKPaymentPreferencesListViewController_addressEditorViewController_selectedContact___block_invoke_2(uint64_t a1)
{
  unint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1072) handler];

  if (v2)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 1072) handler];
    (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(*(void *)(a1 + 32) + 1072), *(void *)(a1 + 40));
  }
}

- (void)addressEditorViewControllerDidCancel:(id)a3
{
}

- (void)addressSearcherViewController:(id)a3 selectedContact:(id)a4
{
  [(PKPaymentPreferencesListViewController *)self _handleSelectedContact:a4];

  JUMPOUT(0x1A6220EC0);
}

- (void)addressSearcherViewControllerDidCancel:(id)a3
{
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  [(PKPaymentPreferencesListViewController *)self _handleSelectedContact:a4];

  JUMPOUT(0x1A6220EC0);
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F1BA20];
  id v6 = a4;
  id v7 = [v6 label];
  id v8 = [v6 value];
  uint64_t v9 = [v5 labeledValueWithLabel:v7 value:v8];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  v13[0] = v9;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  uint64_t v12 = [v6 key];

  [v10 setValue:v11 forKey:v12];
  [(PKPaymentPreferencesListViewController *)self _handleSelectedContact:v10];
}

- (NSArray)preferences
{
  return self->_preferences;
}

- (BOOL)preferenceHasSeparateAddItemsSection
{
  return self->_preferenceHasSeparateAddItemsSection;
}

- (void)setPreferenceHasSeparateAddItemsSection:(BOOL)a3
{
  self->_preferenceHasSeparateAddItemsSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_editingItem, 0);
  objc_storeStrong((id *)&self->_editingContactSectionController, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);

  objc_storeStrong(&self->_handler, 0);
}

@end