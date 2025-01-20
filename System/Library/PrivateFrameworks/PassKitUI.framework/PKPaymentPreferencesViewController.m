@interface PKPaymentPreferencesViewController
- (BOOL)_isPaymentStyle;
- (BOOL)_isViewTranslucent;
- (BOOL)_saveUpdatedContact:(id)a3 contactKey:(id)a4 preference:(id)a5 atIndex:(int64_t)a6;
- (BOOL)_shouldUpdatePreferredContentSize;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSArray)preferences;
- (PKPaymentPreferencesViewController)initWithStyle:(int64_t)a3 preferences:(id)a4 title:(id)a5 handler:(id)a6 contactFormatValidator:(id)a7;
- (UITableView)tableView;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_cellForNamePreference:(id)a3 row:(unint64_t)a4;
- (id)_cellForPreference:(id)a3 row:(unint64_t)a4;
- (id)_cellOfClass:(Class)a3;
- (id)_hyperlinkFooterViewForPreference:(id)a3;
- (id)_peerPaymentAccountPaymentSwitch;
- (id)_requiredKeysForPreference:(id)a3 contact:(id)a4;
- (id)handler;
- (id)pickedContactHandler;
- (id)pickedContactPropertyHandler;
- (id)pk_childrenForAppearance;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)style;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_checkFormatOfTextField:(id)a3 forBeginEditing:(BOOL)a4;
- (void)_cleanupInlineEdits;
- (void)_editPreferenceAtIndexPath:(id)a3;
- (void)_keyboardDidShow:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_presentMeCardAlertControllerWithContact:(id)a3 contactKey:(id)a4 handler:(id)a5;
- (void)_savePickedContact:(id)a3 inPreference:(id)a4;
- (void)_setContactHandlersForPreference:(id)a3;
- (void)_showAddressEditorForContact:(id)a3 title:(id)a4 requiredKeys:(id)a5 highlightedKeys:(id)a6 errors:(id)a7;
- (void)_showAddressPickerForPreference:(id)a3;
- (void)_showContactsPickerForPreference:(id)a3;
- (void)_startInlineEditingForPreference:(id)a3 inSection:(unint64_t)a4;
- (void)_updateContactAndForceSelection:(BOOL)a3;
- (void)_updateNavigationBarButtons;
- (void)_updatePreferredContentSize;
- (void)addressEditorViewController:(id)a3 selectedContact:(id)a4;
- (void)addressEditorViewControllerDidCancel:(id)a3;
- (void)addressSearcherViewController:(id)a3 selectedContact:(id)a4;
- (void)addressSearcherViewControllerDidCancel:(id)a3;
- (void)applePayCashSwitchValueChanged:(id)a3;
- (void)clearErrorsForPreference:(Class)a3;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)dealloc;
- (void)hideTextField:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setErrors:(id)a3 animated:(BOOL)a4;
- (void)setErrors:(id)a3 otherPass:(id)a4 animated:(BOOL)a5;
- (void)setErrors:(id)a3 selectedPass:(id)a4 animated:(BOOL)a5;
- (void)setHandler:(id)a3;
- (void)setPickedContactHandler:(id)a3;
- (void)setPickedContactPropertyHandler:(id)a3;
- (void)setPreferences:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)textDidChange:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKPaymentPreferencesViewController

- (id)pk_childrenForAppearance
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPreferencesViewController;
  v3 = [(UIViewController *)&v8 pk_childrenForAppearance];
  v4 = [(PKPaymentPreferencesViewController *)self tableView];
  v5 = [v4 visibleCells];
  v6 = [v3 arrayByAddingObjectsFromArray:v5];

  return v6;
}

- (PKPaymentPreferencesViewController)initWithStyle:(int64_t)a3 preferences:(id)a4 title:(id)a5 handler:(id)a6 contactFormatValidator:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentPreferencesViewController;
  v17 = [(PKPaymentPreferencesViewController *)&v26 init];
  v18 = v17;
  if (v17)
  {
    v25.receiver = v17;
    v25.super_class = (Class)PKPaymentPreferencesViewController;
    [(PKPaymentPreferencesViewController *)&v25 setTitle:v14];
    objc_storeStrong((id *)&v18->_preferences, a4);
    objc_storeStrong((id *)&v18->_latestPreferences, v18->_preferences);
    v18->_style = a3;
    uint64_t v19 = [v15 copy];
    id handler = v18->_handler;
    v18->_id handler = (id)v19;

    id v21 = objc_alloc(MEMORY[0x1E4FB1D00]);
    uint64_t v22 = objc_msgSend(v21, "initWithFrame:style:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    tableView = v18->_tableView;
    v18->_tableView = (UITableView *)v22;

    [(UITableView *)v18->_tableView setDelegate:v18];
    [(UITableView *)v18->_tableView setDataSource:v18];
    [(UITableView *)v18->_tableView setAllowsSelectionDuringEditing:1];
    objc_storeStrong((id *)&v18->_contactFormatValidator, a7);
    v18->_isEditingFieldThatWasOriginallyInvalid = 0;
  }

  return v18;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKPaymentPreferencesViewController;
  [(PKPaymentPreferencesViewController *)&v2 dealloc];
}

- (BOOL)_isViewTranslucent
{
  return (self->_style < 5uLL) & (0x19u >> self->_style);
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentPreferencesViewController;
  [(PKPaymentPreferencesViewController *)&v6 viewDidLoad];
  v3 = [(PKPaymentPreferencesViewController *)self view];
  [v3 setAutoresizingMask:0];
  [v3 setInsetsLayoutMarginsFromSafeArea:0];
  [v3 addSubview:self->_tableView];
  if ([(PKPaymentPreferencesViewController *)self _isPaymentStyle])
  {
    if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
    {
      [(UITableView *)self->_tableView setCellLayoutMarginsFollowReadableWidth:1];
    }
  }
  else
  {
    [(UITableView *)self->_tableView pkui_setupForReadableContentGuide];
  }
  [(UITableView *)self->_tableView setInsetsLayoutMarginsFromSafeArea:0];
  [(UITableView *)self->_tableView setKeyboardDismissMode:1];
  if ([(PKPaymentPreferencesViewController *)self _isViewTranslucent])
  {
    tableView = self->_tableView;
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITableView *)tableView setBackgroundColor:v5];
  }
  if ([(PKPaymentPreferencesViewController *)self _isPaymentStyle]) {
    [(PKPaymentPreferencesViewController *)self setEdgesForExtendedLayout:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPreferencesViewController;
  [(PKPaymentPreferencesViewController *)&v7 viewWillAppear:a3];
  v4 = [MEMORY[0x1E4F84B48] defaultInstance];
  [v4 setMeCardCachingEnabled:1];

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__keyboardDidShow_ name:*MEMORY[0x1E4FB2BC8] object:0];

  objc_super v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];

  [(PKPaymentPreferencesViewController *)self _updateNavigationBarButtons];
  [(UITableView *)self->_tableView reloadData];
  [(UITableView *)self->_tableView layoutIfNeeded];
  if ([(PKPaymentPreferencesViewController *)self _isPaymentStyle]) {
    [(PKPaymentPreferencesViewController *)self _updatePreferredContentSize];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentPreferencesViewController;
  [(PKPaymentPreferencesViewController *)&v9 viewDidAppear:a3];
  if ([(PKPaymentPreferencesViewController *)self _isPaymentStyle]) {
    [(PKPaymentPreferencesViewController *)self _updatePreferredContentSize];
  }
  v4 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v5 = *MEMORY[0x1E4F87020];
  uint64_t v6 = *MEMORY[0x1E4F86730];
  v10[0] = *MEMORY[0x1E4F86308];
  v10[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F86880];
  v11[0] = *MEMORY[0x1E4F864A0];
  v11[1] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v4 subject:v5 sendEvent:v8];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentPreferencesViewController;
  [(PKPaymentPreferencesViewController *)&v11 viewDidDisappear:a3];
  [(PKPaymentPreferencesViewController *)self setEditing:0 animated:1];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  uint64_t v5 = [MEMORY[0x1E4F84B48] defaultInstance];
  [v5 setMeCardCachingEnabled:0];

  uint64_t v6 = (void *)MEMORY[0x1E4F843E0];
  uint64_t v7 = *MEMORY[0x1E4F87020];
  uint64_t v8 = *MEMORY[0x1E4F86730];
  v12[0] = *MEMORY[0x1E4F86308];
  v12[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F86880];
  v13[0] = *MEMORY[0x1E4F864A8];
  v13[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v6 subject:v7 sendEvent:v10];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPreferencesViewController;
  [(PKPaymentPreferencesViewController *)&v4 viewWillDisappear:a3];
  if (self->_currentEditingField) {
    -[PKPaymentPreferencesViewController hideTextField:](self, "hideTextField:");
  }
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKPaymentPreferencesViewController;
  [(PKPaymentPreferencesViewController *)&v5 viewWillLayoutSubviews];
  ++self->_layoutRecursionCounter;
  tableView = self->_tableView;
  objc_super v4 = [(PKPaymentPreferencesViewController *)self view];
  [v4 bounds];
  -[UITableView setFrame:](tableView, "setFrame:");
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentPreferencesViewController;
  [(PKPaymentPreferencesViewController *)&v4 viewDidLayoutSubviews];
  unsigned __int16 v3 = self->_layoutRecursionCounter - 1;
  self->_layoutRecursionCounter = v3;
  if (!v3 && self->_preferredContentSizeUpdateDeferred) {
    [(PKPaymentPreferencesViewController *)self _updatePreferredContentSize];
  }
}

- (BOOL)_shouldUpdatePreferredContentSize
{
  return ![(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts]|| (self->_style & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (void)_updatePreferredContentSize
{
  if ([(PKPaymentPreferencesViewController *)self _shouldUpdatePreferredContentSize])
  {
    if (self->_layoutRecursionCounter)
    {
      self->_preferredContentSizeUpdateDeferred = 1;
    }
    else
    {
      self->_preferredContentSizeUpdateDeferred = 0;
      if (self->_keyboardVisible)
      {
        unsigned __int16 v3 = [(PKPaymentPreferencesViewController *)self navigationController];
        objc_super v4 = objc_msgSend(v3, "pkui_compactNavigationContainer");
        objc_super v5 = v4;
        if (v4)
        {
          [v4 modalPresentationSize];
          double v7 = v6;
          double v9 = v8;
        }
        else
        {
          v12 = [v3 view];
          [v12 bounds];
          double v7 = v13;
          double v9 = v14;
        }
      }
      else
      {
        [(UITableView *)self->_tableView contentSize];
        double v7 = v10;
        double v9 = v11;
      }
      [(PKPaymentPreferencesViewController *)self preferredContentSize];
      if (v7 != v16 || v9 != v15)
      {
        -[PKPaymentPreferencesViewController setPreferredContentSize:](self, "setPreferredContentSize:", v7, v9);
      }
    }
  }
}

- (void)_updateNavigationBarButtons
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unsigned __int16 v3 = [(PKPaymentPreferencesViewController *)self navigationItem];
  [v3 setRightBarButtonItem:0];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v4 = self->_preferences;
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
        double v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "supportsDeletion", (void)v14))
        {
          if (([v9 isReadOnly] & 1) == 0)
          {
            double v10 = [v9 preferences];
            uint64_t v11 = [v10 count];

            if (v11)
            {
              v12 = [(PKPaymentPreferencesViewController *)self navigationItem];
              double v13 = [(PKPaymentPreferencesViewController *)self editButtonItem];
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

- (void)_keyboardDidShow:(id)a3
{
  id v9 = [a3 userInfo];
  objc_super v4 = [v9 objectForKey:*MEMORY[0x1E4FB2BD8]];
  [v4 CGRectValue];
  double v6 = v5;

  uint64_t v7 = [(PKPaymentPreferencesViewController *)self tableView];
  objc_msgSend(v7, "setContentInset:", 0.0, 0.0, v6, 0.0);

  double v8 = [(PKPaymentPreferencesViewController *)self tableView];
  objc_msgSend(v8, "setScrollIndicatorInsets:", 0.0, 0.0, v6, 0.0);

  self->_keyboardVisible = 1;
  [(PKPaymentPreferencesViewController *)self _updatePreferredContentSize];
}

- (void)_keyboardWillHide:(id)a3
{
  objc_super v4 = [(PKPaymentPreferencesViewController *)self tableView];
  double v5 = *MEMORY[0x1E4FB2848];
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v7 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v8 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  objc_msgSend(v4, "setContentInset:", *MEMORY[0x1E4FB2848], v6, v7, v8);

  id v9 = [(PKPaymentPreferencesViewController *)self tableView];
  objc_msgSend(v9, "setScrollIndicatorInsets:", v5, v6, v7, v8);

  self->_keyboardVisible = 0;

  [(PKPaymentPreferencesViewController *)self _updatePreferredContentSize];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentPreferencesViewController;
  -[PKPaymentPreferencesViewController setEditing:animated:](&v7, sel_setEditing_animated_);
  [(UITableView *)self->_tableView setEditing:v5 animated:v4];
  if (!v5)
  {
    [(PKPaymentPreferencesViewController *)self _updateContactAndForceSelection:1];
    [(PKPaymentPreferencesViewController *)self _cleanupInlineEdits];
  }
}

- (void)_startInlineEditingForPreference:(id)a3 inSection:(unint64_t)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(PKPaymentPreferencesViewController *)self setEditing:1 animated:1];
  objc_super v7 = [v6 contactKey];
  if (([v7 isEqualToString:*MEMORY[0x1E4F1ADC8]] & 1) != 0
    || [v7 isEqualToString:*MEMORY[0x1E4F1AEE0]])
  {
    double v8 = objc_alloc_init(MEMORY[0x1E4F1B8F8]);
    [v8 setContactSource:3];
    [(UITableView *)self->_tableView beginUpdates];
    id v9 = [v6 preferences];
    double v10 = [v9 arrayByAddingObject:v8];
    [v6 setPreferences:v10];

    uint64_t v11 = (void *)MEMORY[0x1E4F28D58];
    v12 = [v6 preferences];
    double v13 = objc_msgSend(v11, "indexPathForRow:inSection:", objc_msgSend(v12, "count") - 1, a4);

    tableView = self->_tableView;
    v18[0] = v13;
    long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [(UITableView *)tableView insertRowsAtIndexPaths:v15 withRowAnimation:100];

    [(UITableView *)self->_tableView endUpdates];
    long long v16 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v13];
    [v16 showTextField:1];
    [(PKPaymentPreferencesViewController *)self _updateNavigationBarButtons];
  }
  else
  {
    double v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v17 = 0;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Attempted to start inline editing on preference that doesn't support it", v17, 2u);
    }
  }
}

- (void)_cleanupInlineEdits
{
  objc_super v2 = self;
  currentEditingField = self->_currentEditingField;
  if (currentEditingField)
  {
    [(UITextField *)currentEditingField resignFirstResponder];
    BOOL v4 = v2->_currentEditingField;
    v2->_currentEditingField = 0;
  }
  if ([(NSArray *)v2->_preferences count])
  {
    unint64_t v5 = 0;
    char v27 = 0;
    v24 = v2;
    do
    {
      id v6 = [(NSArray *)v2->_preferences objectAtIndexedSubscript:v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        objc_super v25 = v6;
        id v9 = v6;
        double v10 = [v9 preferences];
        uint64_t v11 = [v9 contactKey];
        unint64_t v12 = [v9 selectedIndex];
        if (v12 >= [v10 count])
        {
          uint64_t v13 = 0;
        }
        else
        {
          uint64_t v13 = objc_msgSend(v10, "objectAtIndex:", objc_msgSend(v9, "selectedIndex"));
        }
        objc_super v26 = (void *)v13;
        if ([v10 count])
        {
          unint64_t v14 = 0;
          do
          {
            long long v15 = [v9 preferences];
            long long v16 = [v15 objectAtIndexedSubscript:v14];

            if ([v16 isKeyAvailable:v11])
            {
              long long v17 = [v16 valueForKey:v11];
              uint64_t v18 = [v17 count];

              if (!v18)
              {
                [v7 addObject:v16];
                uint64_t v19 = [MEMORY[0x1E4F28D58] indexPathForRow:v14 inSection:v5];
                [v8 addObject:v19];

                char v27 = 1;
              }
            }

            ++v14;
          }
          while ([v10 count] > v14);
        }
        objc_super v2 = v24;
        if ([v7 count])
        {
          [(UITableView *)v24->_tableView beginUpdates];
          v20 = objc_msgSend(v10, "pk_arrayByRemovingObjectsInArray:", v7);
          [v9 setPreferences:v20];

          [(UITableView *)v24->_tableView deleteRowsAtIndexPaths:v8 withRowAnimation:100];
          if (v26)
          {
            id v21 = [v9 preferences];
            objc_msgSend(v9, "setSelectedIndex:", objc_msgSend(v21, "indexOfObject:", v26));
          }
          [(UITableView *)v24->_tableView endUpdates];
        }

        id v6 = v25;
      }

      ++v5;
    }
    while ([(NSArray *)v2->_preferences count] > v5);
    id handler = v2->_handler;
    if (((handler != 0) & v27) != 0)
    {
      v23 = (void (*)(void))*((void *)handler + 2);
      v23();
    }
  }
}

- (id)_peerPaymentAccountPaymentSwitch
{
  peerPaymentAccountPaymentSwitch = self->_peerPaymentAccountPaymentSwitch;
  if (!peerPaymentAccountPaymentSwitch)
  {
    BOOL v4 = (UISwitch *)objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    unint64_t v5 = self->_peerPaymentAccountPaymentSwitch;
    self->_peerPaymentAccountPaymentSwitch = v4;

    [(UISwitch *)self->_peerPaymentAccountPaymentSwitch addTarget:self action:sel_applePayCashSwitchValueChanged_ forControlEvents:4096];
    peerPaymentAccountPaymentSwitch = self->_peerPaymentAccountPaymentSwitch;
  }

  return peerPaymentAccountPaymentSwitch;
}

- (void)clearErrorsForPreference:(Class)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v4 = self->_latestPreferences;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_msgSend((id)objc_opt_class(), "isEqual:", a3, (void)v10)) {
          [v9 clearAllErrors];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setErrors:(id)a3 selectedPass:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  objc_storeStrong((id *)&self->_paymentPassForBillingErrors, a4);
  id v8 = a3;
  [(PKPaymentPreferencesViewController *)self setErrors:v8 animated:v5];
}

- (void)setErrors:(id)a3 otherPass:(id)a4 animated:(BOOL)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v29 = a4;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obj = self->_latestPreferences;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    uint64_t v24 = *(void *)v35;
    do
    {
      uint64_t v10 = 0;
      uint64_t v25 = v8;
      do
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v34 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v27 = v11;
          uint64_t v28 = v10;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v12 = [v11 preferences];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v31;
            while (2)
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v31 != v15) {
                  objc_enumerationMutation(v12);
                }
                long long v17 = *(void **)(*((void *)&v30 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v18 = [v29 uniqueID];
                  id v19 = v17;
                  v20 = [v19 pass];
                  id v21 = [v20 uniqueID];
                  int v22 = PKEqualObjects();

                  if (v22)
                  {
                    [v27 setErrors:v23 forPreference:v19];

                    goto LABEL_19;
                  }
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
LABEL_19:

          uint64_t v9 = v24;
          uint64_t v8 = v25;
          uint64_t v10 = v28;
        }
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v8);
  }
}

- (void)setErrors:(id)a3 animated:(BOOL)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  BOOL v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v55 = v34;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "Set errors on preference controller: %@", buf, 0xCu);
  }
  oslog = v5;

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v29 = self;
  uint64_t v6 = self->_latestPreferences;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v51;
    uint64_t v10 = *MEMORY[0x1E4F1AF10];
    uint64_t v43 = *MEMORY[0x1E4F87130];
    uint64_t v42 = *MEMORY[0x1E4F87118];
    uint64_t v41 = *MEMORY[0x1E4F87128];
    uint64_t v11 = *MEMORY[0x1E4F1AEE0];
    uint64_t v40 = *MEMORY[0x1E4F87120];
    uint64_t v12 = *MEMORY[0x1E4F1ADC8];
    uint64_t v13 = *MEMORY[0x1E4F87110];
    uint64_t v32 = *(void *)v51;
    long long v33 = v6;
    do
    {
      uint64_t v14 = 0;
      uint64_t v36 = v8;
      do
      {
        if (*(void *)v51 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v15 = *(void **)(*((void *)&v50 + 1) + 8 * v14);
        objc_msgSend(v15, "clearAllErrors", v29);
        if ([v15 selectedIndex] != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v39 = v14;
          long long v16 = [v15 preferences];
          long long v17 = objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v15, "selectedIndex"));

          objc_opt_class();
          long long v37 = v15;
          if (objc_opt_isKindOfClass())
          {
            long long v35 = v17;
            id v18 = v15;
            id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            v38 = v18;
            v20 = [v18 contactKeys];
            uint64_t v21 = [v20 countByEnumeratingWithState:&v46 objects:v58 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v47;
              do
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v47 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v25 = *(void **)(*((void *)&v46 + 1) + 8 * i);
                  if ([v25 isEqualToString:v10])
                  {
                    [v19 addObject:v43];
                    [v19 addObject:v42];
                    [v19 addObject:v41];
                  }
                  if ([v25 isEqualToString:v11]) {
                    [v19 addObject:v40];
                  }
                  if ([v25 isEqualToString:v12]) {
                    [v19 addObject:v13];
                  }
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v46 objects:v58 count:16];
              }
              while (v22);
            }

            uint64_t v26 = [v38 type];
            if (v26)
            {
              if (v26 == 1)
              {
                uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1C978], "pk_FilteredShippingErrorsForContactFields:errors:", v19, v34);
                goto LABEL_30;
              }
              uint64_t v28 = 0;
            }
            else
            {
              uint64_t v27 = objc_msgSend(MEMORY[0x1E4F1C978], "pk_FilteredBillingErrorsForContactFields:errors:", v19, v34);
LABEL_30:
              uint64_t v28 = (void *)v27;
            }
            uint64_t v9 = v32;
            long long v17 = v35;
            uint64_t v8 = v36;

            uint64_t v6 = v33;
            if (v28)
            {
LABEL_33:
              [v37 setErrors:v28 forPreference:v17];
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v55 = v28;
                __int16 v56 = 2112;
                v57 = v37;
                _os_log_impl(&dword_19F450000, oslog, OS_LOG_TYPE_DEFAULT, "Set errors: %@ on preference: %@", buf, 0x16u);
              }

              uint64_t v8 = v36;
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1C978], "pk_FilteredCardErrors:", v34);
              if (v28) {
                goto LABEL_33;
              }
            }
          }

          uint64_t v14 = v39;
        }
        ++v14;
      }
      while (v14 != v8);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v8);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PKPaymentPreferencesViewController_setErrors_animated___block_invoke;
  block[3] = &unk_1E59CDA78;
  BOOL v45 = a4;
  block[4] = v29;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __57__PKPaymentPreferencesViewController_setErrors_animated___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  unsigned __int16 v3 = [*(id *)(a1 + 32) tableView];
  id v6 = v3;
  if (v2)
  {
    uint64_t v4 = [v3 numberOfSections];

    id v6 = [*(id *)(a1 + 32) tableView];
    BOOL v5 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, v4);
    [v6 reloadSections:v5 withRowAnimation:100];
  }
  else
  {
    [v3 reloadData];
  }
}

- (void)applePayCashSwitchValueChanged:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__67;
  uint64_t v12 = __Block_byref_object_dispose__67;
  id v13 = 0;
  BOOL v5 = [(PKPaymentPreferencesViewController *)self preferences];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__PKPaymentPreferencesViewController_applePayCashSwitchValueChanged___block_invoke;
  v7[3] = &unk_1E59E05B8;
  v7[4] = &v8;
  [v5 enumerateObjectsUsingBlock:v7];

  objc_msgSend((id)v9[5], "setOn:", objc_msgSend(v4, "isOn"));
  id handler = (void (**)(id, PKPaymentPreferencesViewController *, NSArray *))self->_handler;
  if (handler) {
    handler[2](handler, self, self->_preferences);
  }
  _Block_object_dispose(&v8, 8);
}

void __69__PKPaymentPreferencesViewController_applePayCashSwitchValueChanged___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
  }
}

- (id)_cellForPreference:(id)a3 row:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 preferences];
  id v7 = [v6 objectAtIndex:a4];
  uint64_t v8 = [v5 selectedIndex];
  uint64_t v9 = [v5 pendingIndex];
  v129 = v6;
  uint64_t v10 = [v6 objectAtIndex:a4];
  uint64_t v11 = [v5 errorsForPreference:v10];
  uint64_t v126 = v8;
  if ([v11 count]) {
    BOOL v12 = v8 == a4;
  }
  else {
    BOOL v12 = 0;
  }
  uint64_t v13 = v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || [v5 type]) {
    goto LABEL_9;
  }
  uint64_t v39 = [(PKPaymentPass *)self->_paymentPassForBillingErrors serialNumber];
  uint64_t v40 = [(PKPaymentPass *)self->_currentlySelectedPaymentPass serialNumber];
  id v41 = v39;
  id v42 = v40;
  if (v41 == v42)
  {

    goto LABEL_9;
  }
  uint64_t v43 = v42;
  if (v41 && v42)
  {
    char v44 = [v41 isEqualToString:v42];

    if ((v44 & 1) == 0)
    {
      v128 = 0;
      uint64_t v13 = 0;
      goto LABEL_10;
    }
LABEL_9:
    v128 = [v5 errorsForPreference:v7];
    goto LABEL_10;
  }

  v128 = 0;
  uint64_t v13 = 0;
LABEL_10:
  objc_opt_class();
  v127 = v7;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [(PKPaymentPreferencesViewController *)self _cellOfClass:objc_opt_class()];
    uint64_t v15 = [v6 objectAtIndex:a4];
    long long v16 = [v15 amount];
    long long v17 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v18 = v9;
    if ([v16 isEqualToNumber:v17])
    {
      id v19 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_15.isa);
    }
    else
    {
      uint64_t v22 = [v15 amount];
      uint64_t v23 = [v5 currency];
      id v19 = PKFormattedCurrencyStringFromNumber();
    }
    uint64_t v24 = [v14 textLabel];
    uint64_t v25 = NSString;
    uint64_t v26 = [v15 label];
    uint64_t v27 = [v25 stringWithFormat:@"%@ - %@", v19, v26];
    [v24 setText:v27];

    uint64_t v28 = [v14 detailTextLabel];
    id v29 = [v15 detail];
    [v28 setText:v29];

    v20 = v129;
    uint64_t v9 = v18;
    id v21 = v15;
    goto LABEL_81;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v125 = v9;
      id v30 = [(PKPaymentPreferencesViewController *)self _cellOfClass:objc_opt_class()];
      if (!self->_passSnapshotter)
      {
        long long v31 = +[PKPassSnapshotter sharedInstance];
        passSnapshotter = self->_passSnapshotter;
        self->_passSnapshotter = v31;
      }
      long long v33 = [v30 passSnapshotter];

      v20 = v129;
      if (!v33) {
        [v30 setPassSnapshotter:self->_passSnapshotter];
      }
      id v34 = v5;
      long long v35 = [v34 peerPaymentPass];
      [v30 setPass:v35];

      uint64_t v36 = [(PKPaymentPreferencesViewController *)self _peerPaymentAccountPaymentSwitch];
      objc_msgSend(v36, "setOn:", objc_msgSend(v34, "isOn"));
      uint64_t v37 = [v34 isEnabled];

      uint64_t v38 = v37;
      id v21 = v30;
      [v36 setEnabled:v38];
      [v30 setAccessoryView:v36];
      [v30 setAccessoryType:0];

      uint64_t v14 = v30;
      goto LABEL_80;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v125 = v9;
      id v21 = v7;
      id v45 = v5;
      uint64_t v14 = [(PKPaymentPreferencesViewController *)self _cellOfClass:objc_opt_class()];
      objc_msgSend(v14, "setInlineEditingEnabled:", objc_msgSend(v45, "supportsInlineEditing"));
      long long v46 = [v45 contactKey];
      int v47 = [v46 isEqualToString:*MEMORY[0x1E4F1AF10]];

      v123 = v45;
      if (v47)
      {
        long long v48 = objc_msgSend(v21, "pk_displayName");
        long long v49 = [v14 detailTextLabel];
        long long v50 = [v21 pkSingleLineFormattedContactAddress];
        [v49 setText:v50];

        long long v51 = [v14 textLabel];
        [v51 setText:v48];
      }
      else
      {
        v59 = [v45 contactKey];
        int v60 = [v59 isEqualToString:*MEMORY[0x1E4F1AEE0]];

        if (v60)
        {
          v61 = [v21 phoneNumbers];
          v115 = [v61 firstObject];

          uint64_t v117 = objc_msgSend(v21, "pk_displayName");
          id obja = [v115 value];
          v62 = [v14 textField];
          [v62 setKeyboardType:5];

          v63 = [v14 textField];
          [v63 setDelegate:self];

          v64 = [v14 textField];
          v65 = PKLocalizedPaymentString(&cfstr_SettingsTransa_4.isa);
          [v64 setPlaceholder:v65];

          v66 = [v14 detailTextLabel];
          [v66 setText:v117];

          v67 = [obja pkFormattedStringValue];
          v68 = [v14 textLabel];
          [v68 setText:v67];

          v69 = [v14 textField];
          [v69 setText:v67];
          uint64_t v13 = v13;
          [v69 addTarget:self action:sel_textDidChange_ forControlEvents:0x20000];

          long long v51 = (void *)v117;
          long long v48 = v115;
        }
        else
        {
          v70 = [v45 contactKey];
          int v71 = [v70 isEqualToString:*MEMORY[0x1E4F1ADC8]];

          if (!v71)
          {
LABEL_45:
            if ([v128 count]) {
              int v81 = v13;
            }
            else {
              int v81 = 0;
            }
            if (v81 == 1)
            {
              v82 = [v128 firstObject];
              v83 = [v82 localizedDescription];

              v84 = [v14 detailTextLabel];
              [v84 setText:v83];
            }
            [v14 setHasError:v13];

            goto LABEL_79;
          }
          v72 = [v21 emailAddresses];
          long long v48 = [v72 firstObject];

          uint64_t v118 = objc_msgSend(v21, "pk_displayName");
          v116 = [v48 value];
          v73 = [v14 textField];
          [v73 setKeyboardType:7];

          v74 = [v14 textField];
          [v74 setDelegate:self];

          v75 = [v14 textField];
          [v75 setAutocapitalizationType:0];

          v76 = [v14 textField];
          v77 = PKLocalizedPaymentString(&cfstr_SettingsTransa_3.isa);
          [v76 setPlaceholder:v77];

          long long v51 = (void *)v118;
          v78 = [v14 detailTextLabel];
          [v78 setText:v118];

          v79 = [v14 textLabel];
          [v79 setText:v116];

          v80 = [v14 textField];
          [v80 setText:v116];
          uint64_t v13 = v13;
          [v80 addTarget:self action:sel_textDidChange_ forControlEvents:0x20000];
        }
      }

      goto LABEL_45;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v14 = 0;
      v20 = v6;
      goto LABEL_82;
    }
    unint64_t v52 = a4 + 1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v54 = v7;
    id v55 = v54;
    uint64_t v125 = v9;
    if (isKindOfClass)
    {
      uint64_t v56 = [v54 pass];
      uint64_t v57 = [v55 availabilityString];
      id obj = (id)v56;
      if (v55)
      {
        if (![v55 shouldShowCardUI])
        {
          uint64_t v14 = [(PKPaymentPreferencesViewController *)self _cellOfClass:objc_opt_class()];
          [v14 setMinimumCellHeight:44.0];
          +[PKPaymentPreferenceCardCell textOffset];
          objc_msgSend(v14, "setLeadingOffset:");
          v93 = [v14 textLabel];
          v94 = [v55 displayName];
          [v93 setText:v94];

          v95 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:", PKScaledValueForValueWithMaximumContentSizeCategory((void *)*MEMORY[0x1E4FB2788], 16.0));
          v119 = v93;
          v96 = v93;
          v58 = v55;
          [v96 setFont:v95];

          v124 = (void *)v57;
          unint64_t v120 = a4 + 1;
          if (([v55 isSelectable] & 1) != 0
            || ([v55 actionBlock],
                v97 = objc_claimAutoreleasedReturnValue(),
                v97,
                v97))
          {
            v98 = [v55 actionBlock];

            if (v98)
            {
              v99 = [MEMORY[0x1E4FB1618] systemBlueColor];
              id v85 = v119;
              [v119 setTextColor:v99];
            }
            else
            {
              id v85 = v119;
              if (v126 == a4) {
                objc_storeStrong((id *)&self->_currentlySelectedPaymentPass, obj);
              }
            }
            v90 = 0;
          }
          else
          {
            v90 = PKLocalizedPaymentString(&cfstr_InAppPaymentPa_4.isa);
            id v85 = v119;
          }
          v91 = [v14 detailTextLabel];
          [v91 setText:v90];
          goto LABEL_69;
        }
        v58 = v55;
      }
      else
      {
        v58 = 0;
      }
    }
    else
    {
      uint64_t v57 = 0;
      v58 = 0;
      id obj = v54;
    }
    id v85 = [(PKPaymentPreferencesViewController *)self _cellOfClass:objc_opt_class()];
    if (!self->_passSnapshotter)
    {
      v86 = +[PKPassSnapshotter sharedInstance];
      v87 = self->_passSnapshotter;
      self->_passSnapshotter = v86;
    }
    v88 = [v85 passSnapshotter];

    if (!v88) {
      [v85 setPassSnapshotter:self->_passSnapshotter];
    }
    [v85 setAvailabilityString:v57];
    id v21 = obj;
    [v85 setPass:obj];
    if (v126 == a4) {
      objc_storeStrong((id *)&self->_currentlySelectedPaymentPass, obj);
    }
    v124 = (void *)v57;
    if (![v128 count])
    {
      uint64_t v14 = v85;
      v92 = v129;
      goto LABEL_70;
    }
    unint64_t v120 = a4 + 1;
    v89 = [v128 firstObject];
    v90 = [v89 localizedDescription];

    v91 = [v85 subtitleLabel];
    [v91 setText:v90];
    uint64_t v14 = v85;
LABEL_69:

    v92 = v129;
    unint64_t v52 = v120;
    id v21 = obj;
LABEL_70:

    if ([v92 count] <= v52)
    {
      v100 = 0;
    }
    else
    {
      v100 = [v92 objectAtIndex:v52];
      if (v100)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([v100 shouldShowCardUI] & 1) == 0
          && [v100 insetsSeparatorByTextOffset])
        {
          +[PKPaymentPreferenceCardCell textOffset];
          double v102 = v101;
LABEL_78:
          objc_msgSend(v14, "setSeparatorInset:", 0.0, v102, 0.0, 0.0);

LABEL_79:
          v20 = v129;
LABEL_80:
          uint64_t v9 = v125;
          goto LABEL_81;
        }
      }
    }
    double v102 = 0.0;
    goto LABEL_78;
  }
  uint64_t v14 = [(PKPaymentPreferencesViewController *)self _cellOfClass:objc_opt_class()];
  v20 = v6;
  id v21 = [v6 objectAtIndex:a4];
  [v14 setBankAccount:v21];
LABEL_81:

LABEL_82:
  if (v9 == a4)
  {
    v103 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    [v103 startAnimating];
    [v14 setAccessoryType:0];
    [v14 setAccessoryView:v103];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [v14 setAccessoryView:0];
      if (v126 == a4) {
        uint64_t v104 = 3;
      }
      else {
        uint64_t v104 = 0;
      }
      [v14 setAccessoryType:v104];
    }
  }
  if (([v5 isReadOnly] & 1) == 0 && objc_msgSend(v5, "supportsDeletion"))
  {
    objc_opt_class();
    BOOL v107 = 1;
    if (objc_opt_isKindOfClass())
    {
      v105 = [v5 contactKey];
      int v106 = [v105 isEqualToString:*MEMORY[0x1E4F1AF10]];

      if (!v106) {
        BOOL v107 = 0;
      }
    }
    [v14 setEditingAccessoryType:v107];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v5 contactKey],
          v108 = objc_claimAutoreleasedReturnValue(),
          int v109 = [v108 isEqualToString:*MEMORY[0x1E4F1ADC8]],
          v108,
          v109))
    {
      v110 = [v14 textField];
      v111 = v110;
      uint64_t v112 = 1;
    }
    else
    {
      v110 = [v14 textField];
      v111 = v110;
      uint64_t v112 = 2;
    }
    [v110 setAutocorrectionType:v112];
  }
  if ([(PKPaymentPreferencesViewController *)self _isViewTranslucent])
  {
    v113 = [MEMORY[0x1E4FB1618] clearColor];
    [v14 setBackgroundColor:v113];
  }

  return v14;
}

- (id)_cellForNamePreference:(id)a3 row:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(PKPaymentPreferencesViewController *)self _cellOfClass:objc_opt_class()];
  uint64_t v8 = [v6 preferences];
  uint64_t v9 = [v8 firstObject];

  uint64_t v10 = (void *)MEMORY[0x1E4F1B910];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1B8F8]);
  uint64_t v12 = [v10 nameOrderForContact:v11];

  int v13 = [v6 showPhoneticName];
  uint64_t v14 = 1;
  if (v13) {
    uint64_t v14 = 2;
  }
  if (v12 == 2) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  if (v12 == 2) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = v14;
  }
  if (v15 == a4)
  {
    long long v17 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_33.isa);
    uint64_t v18 = [v9 givenName];
    goto LABEL_13;
  }
  if (v16 == a4)
  {
    long long v17 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_34.isa);
    uint64_t v18 = [v9 familyName];
LABEL_13:
    id v19 = (void *)v18;
    if (!v13) {
      goto LABEL_21;
    }
    goto LABEL_16;
  }
  long long v17 = 0;
  id v19 = 0;
  if (!v13) {
    goto LABEL_21;
  }
LABEL_16:
  if (v15 + 1 == a4)
  {
    uint64_t v20 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_35.isa);

    id v21 = [v9 phoneticRepresentation];
    uint64_t v22 = [v21 givenName];
  }
  else
  {
    if (v16 + 1 != a4) {
      goto LABEL_21;
    }
    uint64_t v20 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_36.isa);

    id v21 = [v9 phoneticRepresentation];
    uint64_t v22 = [v21 familyName];
  }
  uint64_t v23 = (void *)v22;
  long long v17 = (void *)v20;

  id v19 = v23;
LABEL_21:
  uint64_t v24 = [v7 textField];
  [v24 setText:v19];

  uint64_t v25 = [v7 textField];
  [v25 setPlaceholder:v17];

  uint64_t v26 = [v7 textField];
  [v26 setDelegate:self];

  [v7 setAccessoryType:0];
  [v7 setEditingAccessoryType:0];

  return v7;
}

- (id)_cellOfClass:(Class)a3
{
  id v5 = NSStringFromClass(a3);
  id v6 = [(PKPaymentPreferencesViewController *)self tableView];
  id v7 = [v6 dequeueReusableCellWithIdentifier:v5];

  if (!v7) {
    id v7 = (void *)[[a3 alloc] initWithReuseIdentifier:v5];
  }

  return v7;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_latestPreferences, a3);
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PKPaymentPreferencesViewController_setPreferences___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __53__PKPaymentPreferencesViewController_setPreferences___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1064), *(id *)(*(void *)(a1 + 32) + 1032));
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_preferences count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_preferences objectAtIndex:a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v4 isReadOnly] & 1) == 0)
  {
    uint64_t v8 = [v4 contactKey];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F1AF10]];

    uint64_t v10 = [v4 preferences];
    uint64_t v11 = [v10 count];

    if (v9) {
      int64_t v7 = v11 + 1;
    }
    else {
      int64_t v7 = v11 + 2;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v4 preferences];
      uint64_t v6 = [v5 count];
      int64_t v7 = v6 + [v4 supportsNullSelection];
LABEL_13:

      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = [v4 preferences];
      int64_t v7 = [v5 count];
      goto LABEL_13;
    }
    if ([v4 showPhoneticName]) {
      int64_t v7 = 4;
    }
    else {
      int64_t v7 = 2;
    }
  }
LABEL_14:

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", [v7 section]);
  int v9 = [v8 preferences];
  unint64_t v10 = [v9 count];

  if ([v7 row] >= v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v11 = [v7 row];
    uint64_t v12 = [v8 preferences];
    uint64_t v13 = [v12 count];

    if (v11 == v13) {
      [v8 addNewTitle];
    }
    else {
    uint64_t v15 = [v8 addExistingTitle];
    }
    sizingButtonCell = self->_sizingButtonCell;
    if (!sizingButtonCell)
    {
      long long v17 = [(PKPaymentPreferencesViewController *)self _cellOfClass:objc_opt_class()];
      uint64_t v18 = self->_sizingButtonCell;
      self->_sizingButtonCell = v17;

      [(PKPaymentPreferenceButtonCell *)self->_sizingButtonCell setShouldIndentWhileEditing:1];
      sizingButtonCell = self->_sizingButtonCell;
    }
    [(PKPaymentPreferenceButtonCell *)sizingButtonCell frame];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    [v6 frame];
    double Width = CGRectGetWidth(v32);
    [v6 _sectionContentInset];
    double v27 = Width - v26;
    [v6 _sectionContentInset];
    CGFloat v29 = v27 - v28;
    -[PKPaymentPreferenceButtonCell setFrame:](self->_sizingButtonCell, "setFrame:", v20, v22, v29, v24);
    [(PKPaymentPreferenceButtonCell *)self->_sizingButtonCell setButtonTitle:v15];
    -[PKPaymentPreferenceButtonCell setEditing:animated:](self->_sizingButtonCell, "setEditing:animated:", [v6 isEditing], 0);
    v33.origin.x = v20;
    v33.origin.y = v22;
    v33.size.width = v29;
    v33.size.height = v24;
    -[PKPaymentPreferenceButtonCell sizeThatFits:](self->_sizingButtonCell, "sizeThatFits:", CGRectGetWidth(v33), 1.79769313e308);
    double v14 = fmax(v30, 56.0);
  }
  else
  {
    double v14 = *MEMORY[0x1E4FB2F28];
  }

  return v14;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 56.0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  int v9 = [(NSArray *)self->_preferences objectAtIndex:v8];
  uint64_t v10 = [v9 preferences];
  unint64_t v11 = [(id)v10 count];

  objc_opt_class();
  LOBYTE(v10) = objc_opt_isKindOfClass();
  unint64_t v12 = [v7 row];
  if (v10)
  {
    uint64_t v13 = [(PKPaymentPreferencesViewController *)self _cellForNamePreference:v9 row:v12];
LABEL_5:
    double v14 = (void *)v13;
    goto LABEL_6;
  }
  if (v12 < v11)
  {
LABEL_4:
    uint64_t v13 = -[PKPaymentPreferencesViewController _cellForPreference:row:](self, "_cellForPreference:row:", v9, [v7 row]);
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v14 = [v6 dequeueReusableCellWithIdentifier:@"ButtonCell"];
    if (!v14)
    {
      double v14 = [(PKPaymentPreferencesViewController *)self _cellOfClass:objc_opt_class()];
      uint64_t v17 = [v7 row];
      uint64_t v18 = [v9 preferences];
      uint64_t v19 = [v18 count];

      if (v17 == v19)
      {
        double v20 = [v9 addNewTitle];
        [v14 setButtonTitle:v20];

        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __70__PKPaymentPreferencesViewController_tableView_cellForRowAtIndexPath___block_invoke;
        aBlock[3] = &unk_1E59CC648;
        id v31 = v9;
        CGRect v32 = self;
        uint64_t v33 = v8;
        double v21 = _Block_copy(aBlock);
        double v22 = v31;
      }
      else
      {
        double v27 = [v9 addExistingTitle];
        [v14 setButtonTitle:v27];

        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __70__PKPaymentPreferencesViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
        v28[3] = &unk_1E59CA870;
        v28[4] = self;
        id v29 = v9;
        double v21 = _Block_copy(v28);
        double v22 = v29;
      }

      [v14 setHandler:v21];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 supportsNullSelection])
    {
      double v14 = [(PKPaymentPreferencesViewController *)self _cellOfClass:objc_opt_class()];
      unint64_t v23 = [v9 selectedIndex];
      double v24 = [v14 textLabel];
      uint64_t v25 = PKLocalizedPaymentString(&cfstr_None_0.isa);
      [v24 setText:v25];

      if (v23 >= v11) {
        uint64_t v26 = 3;
      }
      else {
        uint64_t v26 = 0;
      }
      [v14 setAccessoryType:v26];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_4;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_4;
      }
      double v14 = 0;
    }
  }
LABEL_6:
  if ([(PKPaymentPreferencesViewController *)self _isViewTranslucent])
  {
    uint64_t v15 = [MEMORY[0x1E4FB1618] clearColor];
    [v14 setBackgroundColor:v15];

    [v14 setOpaque:0];
  }
  objc_msgSend(v14, "setUserInteractionEnabled:", objc_msgSend(v9, "isReadOnly") ^ 1);

  return v14;
}

uint64_t __70__PKPaymentPreferencesViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactKey];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F1AF10]];

  uint64_t v5 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  if (v3)
  {
    return [v4 _showAddressPickerForPreference:v5];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    return [v4 _startInlineEditingForPreference:v5 inSection:v7];
  }
}

uint64_t __70__PKPaymentPreferencesViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showContactsPickerForPreference:*(void *)(a1 + 40)];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a4;
  if (self->_style == 2)
  {
    id v6 = PKBridgeAppearanceGetAppearanceSpecifier();
    PKAppearanceApplyToContainer(v6, v8);

    if ([v8 accessoryType] == 3)
    {
      [v8 setAccessoryType:0];
      [v8 setAccessoryType:3];
    }
  }
  uint64_t v7 = PKAuthorizationSeparatorColor();
  [v8 setSeparatorColor:v7];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_preferences objectAtIndex:a4];
  uint64_t v5 = [v4 title];

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_preferences objectAtIndex:a4];
  if ([v4 footerLinkRange] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [v4 footer];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  uint64_t v5 = [(NSArray *)self->_preferences objectAtIndex:a4];
  id v6 = [(PKPaymentPreferencesViewController *)self _hyperlinkFooterViewForPreference:v5];

  return v6;
}

- (id)_hyperlinkFooterViewForPreference:(id)a3
{
  id v3 = a3;
  id v4 = [v3 footer];
  uint64_t v5 = [v3 footerLinkRange];
  uint64_t v7 = 0;
  if (v4)
  {
    uint64_t v8 = v6;
    if (v6)
    {
      uint64_t v9 = v5;
      uint64_t v7 = objc_alloc_init(PKFooterHyperlinkView);
      uint64_t v10 = PKAttributedStringByAddingLinkToRange(v4, v9, v8, 0);
      [(PKFooterHyperlinkView *)v7 setAttributedText:v10];

      unint64_t v11 = [v3 footerLinkActionBlock];
      [(PKFooterHyperlinkView *)v7 setAction:v11];
    }
  }

  return v7;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 1;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", [v5 section]);
  unint64_t v7 = [v5 row];
  uint64_t v8 = [v6 preferences];
  if (v7 >= [v8 count] || (objc_msgSend(v6, "isReadOnly") & 1) != 0) {
    unsigned int v9 = 0;
  }
  else {
    unsigned int v9 = [v6 supportsDeletion];
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v10 = [v5 row];
    unint64_t v11 = [v6 preferences];
    if (v10 >= [v11 count])
    {
    }
    else
    {
      unint64_t v12 = [v6 preferences];
      uint64_t v13 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v5, "row"));
      uint64_t v14 = [v13 contactSource];

      if (v14 == 1) {
        unsigned int v9 = 0;
      }
    }
  }

  return v9;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", [v7 section]);
  if ([v8 supportsDeletion])
  {
    if (([v8 isReadOnly] & 1) == 0)
    {
      unint64_t v9 = [v7 row];
      unint64_t v10 = [v8 preferences];
      unint64_t v11 = [v10 count];

      if (v9 < v11)
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [v8 preferences];
          uint64_t v14 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v7, "row"));

          uint64_t v15 = [v14 contactSource];
          char v16 = [v8 supportsInlineEditing];

          objc_initWeak(&location, self);
          if (v15 == 1)
          {
            if (v16) {
              goto LABEL_15;
            }
            goto LABEL_14;
          }
        }
        else
        {
          objc_initWeak(&location, self);
          char v16 = 0;
        }
        uint64_t v19 = (void *)MEMORY[0x1E4FB1688];
        double v20 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp.isa);
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __99__PKPaymentPreferencesViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
        v31[3] = &unk_1E59E05E0;
        objc_copyWeak(&v34, &location);
        id v32 = v6;
        id v33 = v7;
        double v21 = [v19 contextualActionWithStyle:1 title:v20 handler:v31];

        [v12 addObject:v21];
        objc_destroyWeak(&v34);
        if (v16)
        {
LABEL_15:
          if ([v12 count])
          {
            uint64_t v17 = [MEMORY[0x1E4FB1CC0] configurationWithActions:v12];
            objc_destroyWeak(&location);
          }
          else
          {
            objc_destroyWeak(&location);
            uint64_t v17 = 0;
          }

          goto LABEL_9;
        }
LABEL_14:
        double v22 = (void *)MEMORY[0x1E4FB1688];
        unint64_t v23 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_0.isa);
        uint64_t v25 = MEMORY[0x1E4F143A8];
        uint64_t v26 = 3221225472;
        double v27 = __99__PKPaymentPreferencesViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2;
        double v28 = &unk_1E59D7B90;
        objc_copyWeak(&v30, &location);
        id v29 = v7;
        double v24 = [v22 contextualActionWithStyle:0 title:v23 handler:&v25];

        objc_msgSend(v12, "addObject:", v24, v25, v26, v27, v28);
        objc_destroyWeak(&v30);
        goto LABEL_15;
      }
    }
  }
  uint64_t v17 = 0;
LABEL_9:

  return v17;
}

void __99__PKPaymentPreferencesViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained tableView:*(void *)(a1 + 32) commitEditingStyle:1 forRowAtIndexPath:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

void __99__PKPaymentPreferencesViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _editPreferenceAtIndexPath:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_editPreferenceAtIndexPath:(id)a3
{
  id v5 = a3;
  id v6 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v5];
  id v7 = -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", [v5 section]);
  if ([v7 supportsDeletion] && (objc_msgSend(v7, "isReadOnly") & 1) == 0)
  {
    unint64_t v8 = [v5 row];
    unint64_t v9 = [v7 preferences];
    unint64_t v10 = [v9 count];

    if (v8 >= v10)
    {
      id v12 = 0;
    }
    else
    {
      unint64_t v11 = [v7 preferences];
      id v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v5, "row"));

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v7 contactKey],
            uint64_t v13 = objc_claimAutoreleasedReturnValue(),
            uint64_t v14 = *MEMORY[0x1E4F1AF10],
            int v15 = [v13 isEqualToString:*MEMORY[0x1E4F1AF10]],
            v13,
            v15))
      {
        char v16 = [v7 errorsForPreference:v12];
        uint64_t v17 = [v16 count];

        uint64_t v18 = [(PKPaymentPreferencesViewController *)self _requiredKeysForPreference:v7 contact:v12];
        if ([v12 contactSource] == 1)
        {
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __65__PKPaymentPreferencesViewController__editPreferenceAtIndexPath___block_invoke;
          v21[3] = &unk_1E59D1D38;
          v21[4] = self;
          id v22 = v5;
          id v23 = v12;
          id v24 = v7;
          id v25 = v18;
          BOOL v26 = v17 != 0;
          [(PKPaymentPreferencesViewController *)self _presentMeCardAlertControllerWithContact:v23 contactKey:v14 handler:v21];
        }
        else
        {
          objc_storeStrong((id *)&self->_currentEditingIndexPath, a3);
          uint64_t v19 = [v7 editExistingTitle];
          if (v17)
          {
            double v20 = [v7 errorsForPreference:v12];
            [(PKPaymentPreferencesViewController *)self _showAddressEditorForContact:v12 title:v19 requiredKeys:v18 highlightedKeys:0 errors:v20];
          }
          else
          {
            [(PKPaymentPreferencesViewController *)self _showAddressEditorForContact:v12 title:v19 requiredKeys:v18 highlightedKeys:0 errors:0];
          }
        }
      }
      else if ([v7 supportsInlineEditing])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (([(PKPaymentPreferencesViewController *)self isEditing] & 1) == 0) {
            [(PKPaymentPreferencesViewController *)self setEditing:1 animated:1];
          }
          [v6 showTextField:1];
        }
      }
    }
  }
}

void __65__PKPaymentPreferencesViewController__editPreferenceAtIndexPath___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 992), *(id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  id v6 = [*(id *)(a1 + 56) editExistingTitle];
  uint64_t v4 = *(void *)(a1 + 64);
  if (*(unsigned char *)(a1 + 72))
  {
    id v5 = [*(id *)(a1 + 56) errorsForPreference:*(void *)(a1 + 48)];
    [v2 _showAddressEditorForContact:v3 title:v6 requiredKeys:v4 highlightedKeys:0 errors:v5];
  }
  else
  {
    [v2 _showAddressEditorForContact:v3 title:v6 requiredKeys:*(void *)(a1 + 64) highlightedKeys:0 errors:0];
  }
}

- (void)_showAddressEditorForContact:(id)a3 title:(id)a4 requiredKeys:(id)a5 highlightedKeys:(id)a6 errors:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  double v20 = [[PKAddressEditorViewController alloc] initWithContact:v16 requiredKeys:v14 highlightedKeys:v13 errors:v12 style:self->_style];

  [(PKAddressEditorViewController *)v20 setDelegate:self];
  [(PKAddressEditorViewController *)v20 setTitle:v15];

  [(PKAddressEditorViewController *)v20 setContactFormatValidator:self->_contactFormatValidator];
  uint64_t v17 = [[PKBlurredContainerNavigationController alloc] initWithRootViewController:v20];
  if (self->_style == 2)
  {
    uint64_t v18 = PKBridgeAppearanceGetAppearanceSpecifier();
    PKAppearanceApplyToContainer(v18, v17);
  }
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    if ((self->_style & 0xFFFFFFFFFFFFFFFBLL) != 0) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = 6;
    }
    [(PKBlurredContainerNavigationController *)v17 setModalPresentationStyle:v19];
  }
  [(PKPaymentPreferencesViewController *)self presentViewController:v17 animated:1 completion:0];
  [(UITableView *)self->_tableView setEditing:0];
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  unint64_t v10 = -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", [v9 section]);
  unint64_t v11 = v10;
  if (a4 != 1) {
    goto LABEL_19;
  }
  id v12 = [v10 preferences];
  id v13 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v9, "row"));

  if (!v13) {
    goto LABEL_19;
  }
  id v14 = [v11 preferences];
  id v15 = (void *)[v14 mutableCopy];

  unint64_t v16 = [v11 selectedIndex];
  if (v16 >= [v15 count])
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v11, "selectedIndex"));
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v27 = v17;
    id v18 = v11;
    uint64_t v19 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v9, "row"));
    double v20 = [MEMORY[0x1E4F84B48] defaultInstance];
    double v21 = [v19 recentContact];
    [v20 deleteRecent:v21];

    id v22 = [v18 contactKey];
    if ([v22 isEqualToString:*MEMORY[0x1E4F1AF10]] && !objc_msgSend(v18, "type"))
    {
      id v23 = [MEMORY[0x1E4F84B40] defaults];
      [v23 deleteDefaultBillingAddress:v19];
    }
    else
    {
      if ([v19 contactSource] != 2)
      {
LABEL_13:

        uint64_t v17 = v27;
        goto LABEL_14;
      }
      id v23 = [MEMORY[0x1E4F84B40] defaults];
      [v23 deleteDefaultForContactKey:v22];
    }

    goto LABEL_13;
  }
LABEL_14:
  [v8 beginUpdates];
  id v24 = objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v9, "row"));
  [v15 removeObject:v24];

  [v11 setPreferences:v15];
  if (v17) {
    objc_msgSend(v11, "setSelectedIndex:", objc_msgSend(v15, "indexOfObject:", v17));
  }
  v28[0] = v9;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  [v8 deleteRowsAtIndexPaths:v25 withRowAnimation:100];

  [v8 endUpdates];
  [(PKPaymentPreferencesViewController *)self _updateNavigationBarButtons];
  id handler = (void (**)(id, PKPaymentPreferencesViewController *, NSArray *))self->_handler;
  if (handler) {
    handler[2](handler, self, self->_preferences);
  }

LABEL_19:
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", [v5 section]);
  if ([v6 isReadOnly] & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    char v7 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (unint64_t v9 = [v5 row],
          [v6 preferences],
          unint64_t v10 = objc_claimAutoreleasedReturnValue(),
          unint64_t v11 = [v10 count],
          v10,
          v9 < v11))
    {
      id v12 = [v6 preferences];
      id v13 = objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v5, "row"));

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v7 = [v13 isSelectable];
      }
      else {
        char v7 = 1;
      }
    }
    else
    {
      char v7 = 1;
    }
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  char v7 = -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", [v6 section]);
  [v16 deselectRowAtIndexPath:v6 animated:1];
  if ([v16 isEditing])
  {
    [(PKPaymentPreferencesViewController *)self _editPreferenceAtIndexPath:v6];
    goto LABEL_17;
  }
  id v8 = [v7 preferences];
  unint64_t v9 = [v6 row];
  if (v9 >= [v8 count])
  {
    unint64_t v10 = 0;
  }
  else
  {
    unint64_t v10 = objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v10 actionBlock];
    if (v11)
    {
      id v12 = (void *)v11;
      (*(void (**)(void))(v11 + 16))();

      goto LABEL_11;
    }
  }
  if (!self->_handler || (uint64_t v13 = [v6 row], v13 == objc_msgSend(v7, "selectedIndex")))
  {
LABEL_11:
    id v14 = [v7 errorsForPreference:v10];
    uint64_t v15 = [v14 count];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v7 isReadOnly] & 1) == 0 && v15) {
      [(PKPaymentPreferencesViewController *)self _editPreferenceAtIndexPath:v6];
    }
    goto LABEL_16;
  }
  objc_msgSend(v7, "setSelectedIndex:", objc_msgSend(v6, "row"));
  [v16 reloadData];
  (*((void (**)(void))self->_handler + 2))();
LABEL_16:

LABEL_17:
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v17 = a3;
  id v7 = a5;
  unint64_t v8 = [(NSArray *)self->_preferences count];
  if (v8 > [v7 section])
  {
    unint64_t v9 = -[NSArray objectAtIndex:](self->_preferences, "objectAtIndex:", [v7 section]);
    unint64_t v10 = v9;
    if (self->_currentEditingField && [v9 supportsInlineEditing])
    {
      [(UITextField *)self->_currentEditingField center];
      double v12 = v11;
      double v14 = v13;
      uint64_t v15 = [(UITextField *)self->_currentEditingField superview];
      objc_msgSend(v17, "convertPoint:fromView:", v15, v12, v14);
      id v16 = objc_msgSend(v17, "indexPathForRowAtPoint:");

      if ([v7 isEqual:v16]) {
        [(UITextField *)self->_currentEditingField resignFirstResponder];
      }
    }
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v16 = a3;
  objc_storeStrong((id *)&self->_currentEditingField, a3);
  id v5 = [(PKPaymentPreferencesViewController *)self navigationController];
  id v6 = objc_msgSend(v5, "pkui_compactNavigationContainer");
  if ([(PKPaymentPreferencesViewController *)self _shouldUpdatePreferredContentSize])
  {
    if (v6)
    {
      [v6 modalPresentationSize];
      double v8 = v7;
      double v10 = v9;
    }
    else
    {
      double v11 = [v5 view];
      [v11 bounds];
      double v8 = v12;
      double v10 = v13;
    }
    -[PKPaymentPreferencesViewController setPreferredContentSize:](self, "setPreferredContentSize:", v8, v10);
  }
  double v14 = [(UITextField *)self->_currentEditingField text];
  uint64_t v15 = [v14 length];

  if (v15) {
    [(PKPaymentPreferencesViewController *)self _checkFormatOfTextField:v16 forBeginEditing:1];
  }
}

- (void)textDidChange:(id)a3
{
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  [(PKPaymentPreferencesViewController *)self _updateContactAndForceSelection:1];
  [(PKPaymentPreferencesViewController *)self hideTextField:v4];

  [(PKPaymentPreferencesViewController *)self setEditing:0 animated:1];
  return 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  [(PKPaymentPreferencesViewController *)self _updateContactAndForceSelection:1];
  [(PKPaymentPreferencesViewController *)self hideTextField:v4];

  self->_isEditingFieldThatWasOriginallyInvalid = 0;
}

- (void)hideTextField:(id)a3
{
  tableView = self->_tableView;
  id v5 = a3;
  [v5 center];
  double v7 = v6;
  double v9 = v8;
  double v10 = [v5 superview];

  -[UITableView convertPoint:fromView:](tableView, "convertPoint:fromView:", v10, v7, v9);
  -[UITableView indexPathForRowAtPoint:](tableView, "indexPathForRowAtPoint:");
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  double v11 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v11 showTextField:0];
  }
}

- (void)_checkFormatOfTextField:(id)a3 forBeginEditing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4 || self->_isEditingFieldThatWasOriginallyInvalid)
  {
    id v30 = v6;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v6 = v30;
    if (isKindOfClass)
    {
      id v8 = v30;
      tableView = self->_tableView;
      [v8 center];
      double v11 = v10;
      double v13 = v12;
      double v14 = [v8 superview];
      -[UITableView convertPoint:fromView:](tableView, "convertPoint:fromView:", v14, v11, v13);
      uint64_t v15 = -[UITableView indexPathForRowAtPoint:](tableView, "indexPathForRowAtPoint:");

      if (self->_currentEditingField) {
        BOOL v16 = v15 == 0;
      }
      else {
        BOOL v16 = 1;
      }
      if (!v16)
      {
        uint64_t v17 = [v15 section];
        unint64_t v18 = [v15 row];
        uint64_t v19 = [(NSArray *)self->_preferences objectAtIndexedSubscript:v17];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v20 = [v19 preferences];
          unint64_t v21 = [v20 count];

          if (v18 < v21)
          {
            id v22 = [v19 contactKey];
            uint64_t v23 = [v8 text];
            if ([v22 isEqualToString:*MEMORY[0x1E4F1AEE0]])
            {
              id v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1BA70]), "initWithStringValue:", v23, v23);
              id v25 = objc_alloc(MEMORY[0x1E4F1BA70]);
              BOOL v26 = [v24 digits];
              double v27 = (void *)[v25 initWithStringValue:v26];

              uint64_t v28 = [(PKContactFormatValidator *)self->_contactFormatValidator phoneNumberIsValid:v27 forCountryCode:0] ^ 1;
              [v8 setIsInvalid:v28];
            }
            else if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E4F1ADC8], v23))
            {
              uint64_t v28 = [(PKContactFormatValidator *)self->_contactFormatValidator emailAddressIsValid:v23] ^ 1;
              [v8 setIsInvalid:v28];
            }
            else
            {
              LOBYTE(v28) = 0;
            }
            if (v4) {
              self->_isEditingFieldThatWasOriginallyInvalid = v28;
            }
          }
        }
      }
      id v6 = v30;
    }
  }
}

- (void)_updateContactAndForceSelection:(BOOL)a3
{
  v102[1] = *MEMORY[0x1E4F143B8];
  tableView = self->_tableView;
  [(UITextField *)self->_currentEditingField center];
  double v7 = v6;
  double v9 = v8;
  double v10 = [(UITextField *)self->_currentEditingField superview];
  -[UITableView convertPoint:fromView:](tableView, "convertPoint:fromView:", v10, v7, v9);
  double v11 = -[UITableView indexPathForRowAtPoint:](tableView, "indexPathForRowAtPoint:");

  if (self->_currentEditingField) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12)
  {
    unint64_t v13 = [v11 section];
    uint64_t v14 = [v11 row];
    if (v13 < [(NSArray *)self->_preferences count])
    {
      uint64_t v15 = [(NSArray *)self->_preferences objectAtIndexedSubscript:v13];
      BOOL v16 = [(UITextField *)self->_currentEditingField text];
      currentEditingField = self->_currentEditingField;
      self->_currentEditingField = 0;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_62;
        }
        id v31 = [v15 preferences];
        unint64_t v90 = v14;
        unint64_t v32 = [v31 count];

        if (v90 >= v32) {
          goto LABEL_62;
        }
        id v33 = v15;
        id v34 = [v33 contactKey];
        v83 = v33;
        long long v35 = [v33 preferences];
        uint64_t v36 = [v35 objectAtIndexedSubscript:v90];

        v84 = v36;
        uint64_t v37 = (void *)[v36 mutableCopy];
        v87 = v15;
        if ([v16 length])
        {
          v80 = v34;
          int v81 = v37;
          if ([v34 isEqualToString:*MEMORY[0x1E4F1ADC8]])
          {
            uint64_t v38 = [v36 emailAddresses];
            uint64_t v39 = [v38 firstObject];

            uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:v16];
            id v41 = v40;
            v79 = (void *)v39;
            if (v40)
            {
              uint64_t v42 = [v40 stringValue];

              BOOL v16 = (void *)v42;
            }
            id v43 = v16;

            v88 = v43;
            uint64_t v44 = (uint64_t)v43;
            id v45 = v84;
            long long v46 = v79;
          }
          else
          {
            int v56 = [v34 isEqualToString:*MEMORY[0x1E4F1AEE0]];
            id v45 = v36;
            v88 = v16;
            if (v56)
            {
              uint64_t v57 = [v36 phoneNumbers];
              long long v46 = [v57 firstObject];

              uint64_t v44 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v16];
            }
            else
            {
              uint64_t v44 = 0;
              long long v46 = 0;
            }
          }
          v68 = (void *)MEMORY[0x1E4F1BA20];
          v69 = [v46 label];
          v86 = (void *)v44;
          uint64_t v70 = [v68 labeledValueWithLabel:v69 value:v44];
          int v71 = v46;
          v72 = (void *)v70;

          double v101 = v72;
          v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
          id v55 = v80;
          uint64_t v37 = v81;
          [v81 setValue:v73 forKey:v80];
        }
        else
        {
          v88 = v16;
          [v37 setValue:MEMORY[0x1E4F1CBF0] forKey:v34];
          id v55 = v34;
          id v45 = v36;
        }
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __70__PKPaymentPreferencesViewController__updateContactAndForceSelection___block_invoke;
        aBlock[3] = &unk_1E59E0608;
        void aBlock[4] = self;
        id v59 = v37;
        id v93 = v59;
        id v60 = v55;
        id v94 = v60;
        BOOL v99 = a3;
        id v95 = v83;
        id v96 = v95;
        unint64_t v97 = v90;
        unint64_t v98 = v13;
        v74 = (void (**)(void))_Block_copy(aBlock);
        if ([v45 contactSource] == 1)
        {
          if ([v45 contactSource] == 1 && objc_msgSend(v88, "length"))
          {
            v75 = (void *)[v74 copy];
            [(PKPaymentPreferencesViewController *)self _presentMeCardAlertControllerWithContact:v45 contactKey:v60 handler:v75];
          }
          else
          {
            v76 = self->_tableView;
            v77 = [MEMORY[0x1E4F28D58] indexPathForRow:v90 inSection:v13];
            v100 = v77;
            v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
            [(UITableView *)v76 reloadRowsAtIndexPaths:v78 withRowAnimation:100];
          }
        }
        else
        {
          v74[2](v74);
        }

LABEL_61:
        uint64_t v15 = v87;
        BOOL v16 = v88;
LABEL_62:

        goto LABEL_63;
      }
      v88 = v16;
      uint64_t v89 = v14;
      v87 = v15;
      id v18 = v15;
      int v19 = [v18 showPhoneticName];
      double v20 = (void *)MEMORY[0x1E4F1B910];
      id v21 = objc_alloc_init(MEMORY[0x1E4F1B8F8]);
      uint64_t v22 = [v20 nameOrderForContact:v21];

      uint64_t v23 = 1;
      if (v19) {
        uint64_t v23 = 2;
      }
      if (v22 == 2) {
        uint64_t v24 = 0;
      }
      else {
        uint64_t v24 = v23;
      }
      uint64_t v82 = v24;
      if (v22 == 2) {
        uint64_t v25 = v23;
      }
      else {
        uint64_t v25 = 0;
      }
      BOOL v26 = [v18 preferences];
      double v27 = [v26 firstObject];
      uint64_t v28 = (void *)[v27 copy];
      id v29 = v28;
      if (v28) {
        id v30 = v28;
      }
      else {
        id v30 = objc_alloc_init(MEMORY[0x1E4F28F30]);
      }
      int v47 = v30;
      id v85 = v18;

      long long v48 = [v47 phoneticRepresentation];
      long long v49 = (void *)[v48 copy];
      long long v50 = v49;
      if (v49) {
        id v51 = v49;
      }
      else {
        id v51 = objc_alloc_init(MEMORY[0x1E4F28F30]);
      }
      unint64_t v52 = v51;

      if (v89 == v25)
      {
        long long v53 = v47;
        [v47 setGivenName:v88];
      }
      else
      {
        long long v53 = v47;
        if (v89 == v82)
        {
          [v47 setFamilyName:v88];
        }
        else if (v19)
        {
          if (v89 == v25 + 1)
          {
            id v54 = v52;
            [v52 setGivenName:v88];
          }
          else
          {
            id v54 = v52;
            if (v89 == v82 + 1) {
              [v52 setFamilyName:v88];
            }
          }
          [v47 setPhoneticRepresentation:v54];
          long long v53 = v47;
        }
      }
      v58 = [v53 givenName];
      id v45 = v53;
      id v59 = v52;
      id v60 = v85;
      if (![v58 length])
      {
        v61 = [v53 familyName];
        if (![v61 length])
        {
          v62 = [v59 givenName];
          if (![v62 length])
          {
            v67 = [v59 familyName];
            uint64_t v91 = [v67 length];

            if (!v91)
            {
              [v85 setPreferences:0];
              v64 = v85;
              uint64_t v65 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_48:
              [v64 setSelectedIndex:v65];
              id handler = (void (**)(id, PKPaymentPreferencesViewController *, NSArray *))self->_handler;
              if (handler) {
                handler[2](handler, self, self->_preferences);
              }
              goto LABEL_61;
            }
LABEL_47:
            v102[0] = v45;
            v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:1];
            [v85 setPreferences:v63];

            v64 = v85;
            uint64_t v65 = 0;
            goto LABEL_48;
          }
        }
      }

      goto LABEL_47;
    }
  }
LABEL_63:
}

void __70__PKPaymentPreferencesViewController__updateContactAndForceSelection___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) _saveUpdatedContact:*(void *)(a1 + 40) contactKey:*(void *)(a1 + 48) preference:*(void *)(a1 + 56) atIndex:*(void *)(a1 + 72)];
  if (*(unsigned char *)(a1 + 88))
  {
    unint64_t v3 = [*(id *)(a1 + 56) selectedIndex];
    BOOL v4 = [*(id *)(a1 + 56) preferences];
    unint64_t v5 = [v4 count];

    if (v3 == 0x7FFFFFFFFFFFFFFFLL || v3 >= v5)
    {
      if (*(void *)(a1 + 72) < v5) {
        objc_msgSend(*(id *)(a1 + 64), "setSelectedIndex:");
      }
    }
    else
    {
      double v7 = [*(id *)(a1 + 56) preferences];
      double v8 = [v7 objectAtIndex:v3];

      double v9 = [*(id *)(a1 + 56) errorsForPreference:v8];
      uint64_t v10 = [v9 count];

      if (v10 && *(void *)(a1 + 72) < v5) {
        objc_msgSend(*(id *)(a1 + 64), "setSelectedIndex:");
      }
    }
  }
  double v11 = *(void **)(a1 + 32);
  uint64_t v12 = v11[136];
  if (v12)
  {
    (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v11, v11[133]);
    double v11 = *(void **)(a1 + 32);
  }
  unint64_t v13 = (void *)v11[135];
  if (v2)
  {
    uint64_t v14 = [MEMORY[0x1E4F28D58] indexPathForRow:*(void *)(a1 + 72) inSection:*(void *)(a1 + 80)];
    v17[0] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v13 reloadRowsAtIndexPaths:v15 withRowAnimation:100];
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28D60] indexSetWithIndex:*(void *)(a1 + 80)];
    objc_msgSend(v13, "reloadSections:withRowAnimation:");
  }
}

- (BOOL)_saveUpdatedContact:(id)a3 contactKey:(id)a4 preference:(id)a5 atIndex:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  unint64_t v13 = v12;
  if (a6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v15 = [v12 preferences];
    uint64_t v14 = [v15 objectAtIndex:a6];

    objc_msgSend(v10, "setContactSource:", objc_msgSend(v14, "contactSource"));
  }
  if ([v11 isEqualToString:*MEMORY[0x1E4F1AF10]] && !objc_msgSend(v13, "type"))
  {
    id v29 = [MEMORY[0x1E4F84B40] defaults];
    id v16 = [v29 defaultBillingAddressForPaymentPass:self->_currentlySelectedPaymentPass];
  }
  else
  {
    id v16 = 0;
  }
  uint64_t v17 = [v13 preferences];
  id v18 = (void *)[v17 mutableCopy];

  if (!v14) {
    goto LABEL_20;
  }
  if ([v14 contactSource] != 1)
  {
    if ([v14 contactSource] == 2
      || (![v14 contactSource] || objc_msgSend(v14, "contactSource") == 4)
      && v16
      && [v16 isEqualIgnoringIdentifiers:v14])
    {
      int v19 = [v14 recentContact];

      unint64_t v20 = 0x1E4F84000uLL;
      if (v19)
      {
        id v21 = [MEMORY[0x1E4F84B48] defaultInstance];
        uint64_t v22 = [v14 recentContact];
        [v21 deleteRecent:v22];

        unint64_t v20 = 0x1E4F84000;
      }
      if ([v11 isEqualToString:*MEMORY[0x1E4F1ADC8]])
      {
        uint64_t v23 = [MEMORY[0x1E4F84B40] defaults];
        [v23 setDefaultContactEmail:v10];
      }
      else if ([v11 isEqualToString:*MEMORY[0x1E4F1AEE0]])
      {
        uint64_t v23 = [MEMORY[0x1E4F84B40] defaults];
        [v23 setDefaultContactPhone:v10];
      }
      else
      {
        uint64_t v33 = [v13 type];
        id v34 = [MEMORY[0x1E4F84B40] defaults];
        uint64_t v23 = v34;
        if (v33 == 1) {
          [v34 setDefaultShippingAddress:v10];
        }
        else {
          [v34 setDefaultBillingAddress:v10 forPaymentPass:self->_currentlySelectedPaymentPass];
        }
        unint64_t v20 = 0x1E4F84000uLL;
      }

      long long v35 = [*(id *)(v20 + 2888) defaultInstance];
      uint64_t v36 = [v35 saveContactToCoreRecents:v10 preference:v13];

      [v10 setRecentContact:v36];
      [v18 replaceObjectAtIndex:a6 withObject:v10];

      goto LABEL_37;
    }
LABEL_20:
    uint64_t v24 = [v14 recentContact];

    if (v24)
    {
      uint64_t v25 = [MEMORY[0x1E4F84B48] defaultInstance];
      BOOL v26 = [v14 recentContact];
      [v25 deleteRecent:v26];
    }
    double v27 = [MEMORY[0x1E4F84B48] defaultInstance];
    uint64_t v28 = [v27 saveContactToCoreRecents:v10 preference:v13];

    [v10 setContactSource:3];
    [v10 setRecentContact:v28];
    if (v14) {
      [v18 replaceObjectAtIndex:a6 withObject:v10];
    }
    else {
      [v18 insertObject:v10 atIndex:0];
    }

    goto LABEL_37;
  }
  if (PKUpdateMeContact())
  {
    [v18 replaceObjectAtIndex:a6 withObject:v10];
LABEL_37:
    BOOL v32 = 1;
    goto LABEL_38;
  }
  id v30 = [MEMORY[0x1E4F84B48] defaultInstance];
  id v31 = [v30 saveContactToCoreRecents:v10 preference:v13];

  [v10 setRecentContact:v31];
  [v10 setContactSource:3];
  [v18 addObject:v10];
  if ([v13 selectedIndex] == a6) {
    objc_msgSend(v13, "setSelectedIndex:", objc_msgSend(v18, "indexOfObject:", v10));
  }

  BOOL v32 = 0;
LABEL_38:
  uint64_t v37 = (void *)[v18 copy];
  [v13 setPreferences:v37];

  return v32;
}

- (void)_savePickedContact:(id)a3 inPreference:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  uint64_t v7 = [v11 indexOfContact:v6];
  double v8 = [v11 contactKey];
  [(PKPaymentPreferencesViewController *)self _saveUpdatedContact:v6 contactKey:v8 preference:v11 atIndex:v7];

  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    [v11 setSelectedIndex:0];
  }
  id handler = (void (**)(id, PKPaymentPreferencesViewController *, NSArray *))self->_handler;
  if (handler) {
    handler[2](handler, self, self->_preferences);
  }
  [(PKPaymentPreferencesViewController *)self _updateNavigationBarButtons];
  id v10 = [(PKPaymentPreferencesViewController *)self tableView];
  [v10 reloadData];
}

- (void)_presentMeCardAlertControllerWithContact:(id)a3 contactKey:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([v7 isEqualToString:*MEMORY[0x1E4F1ADC8]])
  {
    double v9 = @"EMAIL";
  }
  else if ([v7 isEqualToString:*MEMORY[0x1E4F1AEE0]])
  {
    double v9 = @"PHONE";
  }
  else
  {
    double v9 = @"ADDRESS";
  }
  id v10 = [NSString stringWithFormat:@"IN_APP_PAYMENT_OPTIONS_EDIT_ME_CARD_%@_NO_LABEL", v9];
  id v11 = PKLocalizedPaymentString(v10);

  id v12 = (void *)MEMORY[0x1E4FB1418];
  unint64_t v13 = PKLocalizedPaymentString(&cfstr_InAppPaymentOp_38.isa);
  uint64_t v14 = [v12 alertControllerWithTitle:v13 message:v11 preferredStyle:1];

  uint64_t v15 = (void *)MEMORY[0x1E4FB1410];
  id v16 = [NSString stringWithFormat:@"IN_APP_PAYMENT_OPTIONS_CHANGE_%@", v9];
  uint64_t v17 = PKLocalizedPaymentString(v16);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __98__PKPaymentPreferencesViewController__presentMeCardAlertControllerWithContact_contactKey_handler___block_invoke;
  v23[3] = &unk_1E59CB150;
  id v24 = v8;
  id v18 = v8;
  int v19 = [v15 actionWithTitle:v17 style:2 handler:v23];
  [v14 addAction:v19];

  unint64_t v20 = (void *)MEMORY[0x1E4FB1410];
  id v21 = PKLocalizedString(&cfstr_Cancel.isa);
  uint64_t v22 = [v20 actionWithTitle:v21 style:1 handler:0];
  [v14 addAction:v22];

  [(PKPaymentPreferencesViewController *)self presentViewController:v14 animated:1 completion:0];
}

uint64_t __98__PKPaymentPreferencesViewController__presentMeCardAlertControllerWithContact_contactKey_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_showAddressPickerForPreference:(id)a3
{
  id v11 = a3;
  if (PKUIStoreDemoGatewayWithViewController(self))
  {
    BOOL v4 = [v11 addNewTitle];
    unint64_t v5 = [[PKAddressSearcherViewController alloc] initWithStyle:self->_style];
    id v6 = [(PKPaymentPreferencesViewController *)self _requiredKeysForPreference:v11 contact:0];
    [(PKAddressSearcherViewController *)v5 setRequiredKeys:v6];

    id v7 = PKLocalizedPaymentString(v4);
    [(PKAddressSearcherViewController *)v5 setTitle:v7];

    [(PKAddressSearcherViewController *)v5 setDelegate:self];
    [(PKAddressSearcherViewController *)v5 setContactFormatValidator:self->_contactFormatValidator];
    id v8 = [[PKBlurredContainerNavigationController alloc] initWithRootViewController:v5];
    if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
    {
      if ((self->_style | 4) == 4)
      {
        [(PKBlurredContainerNavigationController *)v8 setModalPresentationStyle:6];
      }
      else
      {
        [(PKBlurredContainerNavigationController *)v8 setModalPresentationStyle:2];
        [MEMORY[0x1E4FB1EC0] defaultFormSheetSize];
        -[PKBlurredContainerNavigationController setPreferredContentSize:](v8, "setPreferredContentSize:");
      }
    }
    if (self->_style == 2)
    {
      double v9 = PKBridgeAppearanceGetAppearanceSpecifier();
      PKAppearanceApplyToContainer(v9, v8);
    }
    id v10 = PKLocalizedPaymentString(v4);
    [(PKBlurredContainerNavigationController *)v8 setTitle:v10];

    [(PKPaymentPreferencesViewController *)self _setContactHandlersForPreference:v11];
    [(PKPaymentPreferencesViewController *)self setEditing:0];
    [(PKPaymentPreferencesViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

- (void)_showContactsPickerForPreference:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (PKUIStoreDemoGatewayWithViewController(self))
  {
    unint64_t v5 = [v4 contactKey];
    id v6 = objc_alloc_init(getCNContactPickerViewControllerClass_1());
    if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
    {
      if ((self->_style & 0xFFFFFFFFFFFFFFFBLL) != 0) {
        uint64_t v7 = 2;
      }
      else {
        uint64_t v7 = 6;
      }
      [v6 setModalPresentationStyle:v7];
    }
    [v6 setDelegate:self];
    v13[0] = v5;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v6 setDisplayedPropertyKeys:v8];

    if ([v5 isEqualToString:*MEMORY[0x1E4F1ADC8]])
    {
      double v9 = @"emailAddresses.@count = 1";
      id v10 = @"emailAddresses.@count > 0";
    }
    else if ([v5 isEqualToString:*MEMORY[0x1E4F1AF10]])
    {
      double v9 = @"postalAddresses.@count = 1";
      id v10 = @"postalAddresses.@count > 0";
    }
    else
    {
      if (![v5 isEqualToString:*MEMORY[0x1E4F1AEE0]])
      {
LABEL_14:
        [(PKPaymentPreferencesViewController *)self _setContactHandlersForPreference:v4];
        [(PKPaymentPreferencesViewController *)self setEditing:0];
        [(PKPaymentPreferencesViewController *)self presentViewController:v6 animated:1 completion:0];

        goto LABEL_15;
      }
      double v9 = @"phoneNumbers.@count = 1";
      id v10 = @"phoneNumbers.@count > 0";
    }
    id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:v10];
    [v6 setPredicateForEnablingContact:v11];

    id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:v9];
    [v6 setPredicateForSelectionOfContact:v12];

    goto LABEL_14;
  }
LABEL_15:
}

- (void)_setContactHandlersForPreference:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__PKPaymentPreferencesViewController__setContactHandlersForPreference___block_invoke;
  v8[3] = &unk_1E59E0658;
  objc_copyWeak(&v9, &location);
  objc_copyWeak(&v10, &from);
  [(PKPaymentPreferencesViewController *)self setPickedContactHandler:v8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__PKPaymentPreferencesViewController__setContactHandlersForPreference___block_invoke_3;
  v5[3] = &unk_1E59E0680;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, &from);
  [(PKPaymentPreferencesViewController *)self setPickedContactPropertyHandler:v5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __71__PKPaymentPreferencesViewController__setContactHandlersForPreference___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKPaymentPreferencesViewController__setContactHandlersForPreference___block_invoke_2;
  block[3] = &unk_1E59E0630;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v7);
}

void __71__PKPaymentPreferencesViewController__setContactHandlersForPreference___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    BOOL v4 = WeakRetained == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v6 = WeakRetained;
    id v5 = objc_loadWeakRetained((id *)(a1 + 48));
    [v6 _savePickedContact:v3 inPreference:v5];

    id WeakRetained = v6;
  }
}

void __71__PKPaymentPreferencesViewController__setContactHandlersForPreference___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__PKPaymentPreferencesViewController__setContactHandlersForPreference___block_invoke_4;
  block[3] = &unk_1E59E0630;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v7);
}

void __71__PKPaymentPreferencesViewController__setContactHandlersForPreference___block_invoke_4(id *a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v3 = (void *)MEMORY[0x1E4F1BA20];
  id v4 = [a1[4] label];
  id v5 = [a1[4] value];
  id v6 = [v3 labeledValueWithLabel:v4 value:v5];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  v11[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [a1[4] key];
  [v7 setValue:v8 forKey:v9];

  if (v7 && WeakRetained)
  {
    id v10 = objc_loadWeakRetained(a1 + 6);
    [WeakRetained _savePickedContact:v7 inPreference:v10];
  }
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  pickedContactHandler = (void (**)(id, id, id))self->_pickedContactHandler;
  if (pickedContactHandler)
  {
    pickedContactHandler[2](pickedContactHandler, a4, a3);
    id v6 = self->_pickedContactHandler;
    self->_pickedContactHandler = 0;

    JUMPOUT(0x1A6220EC0);
  }
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  pickedContactPropertyHandler = (void (**)(id, id, id))self->_pickedContactPropertyHandler;
  if (pickedContactPropertyHandler)
  {
    pickedContactPropertyHandler[2](pickedContactPropertyHandler, a4, a3);
    id v6 = self->_pickedContactPropertyHandler;
    self->_pickedContactPropertyHandler = 0;

    id pickedContactHandler = self->_pickedContactHandler;
    self->_id pickedContactHandler = 0;
  }
}

- (void)contactPickerDidCancel:(id)a3
{
  id pickedContactPropertyHandler = self->_pickedContactPropertyHandler;
  self->_id pickedContactPropertyHandler = 0;

  id pickedContactHandler = self->_pickedContactHandler;
  self->_id pickedContactHandler = 0;
}

- (void)addressSearcherViewController:(id)a3 selectedContact:(id)a4
{
  id pickedContactHandler = (void (**)(id, id, id))self->_pickedContactHandler;
  if (pickedContactHandler)
  {
    pickedContactHandler[2](pickedContactHandler, a4, a3);
    id v6 = self->_pickedContactHandler;
    self->_id pickedContactHandler = 0;

    [(PKPaymentPreferencesViewController *)self dismissViewControllerAnimated:1 completion:0];
    JUMPOUT(0x1A6220EC0);
  }
}

- (void)addressSearcherViewControllerDidCancel:(id)a3
{
  [(PKPaymentPreferencesViewController *)self dismissViewControllerAnimated:1 completion:0];

  [(PKPaymentPreferencesViewController *)self _updatePreferredContentSize];
}

- (void)addressEditorViewController:(id)a3 selectedContact:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  currentEditingIndexPath = self->_currentEditingIndexPath;
  if (currentEditingIndexPath)
  {
    uint64_t v7 = [(NSIndexPath *)currentEditingIndexPath row];
    NSInteger v8 = [(NSIndexPath *)self->_currentEditingIndexPath section];
    id v9 = [(NSArray *)self->_preferences objectAtIndex:v8];
    id v10 = [v9 preferences];
    id v11 = [v10 objectAtIndex:v7];

    if ([v9 supportsDeletion])
    {
      if (([v9 isReadOnly] & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            BOOL v12 = [(PKPaymentPreferencesViewController *)self _saveUpdatedContact:v5 contactKey:*MEMORY[0x1E4F1AF10] preference:v9 atIndex:v7];
            id handler = (void (**)(id, PKPaymentPreferencesViewController *, NSArray *))self->_handler;
            if (handler) {
              handler[2](handler, self, self->_preferences);
            }
            tableView = self->_tableView;
            if (v12)
            {
              uint64_t v15 = [MEMORY[0x1E4F28D58] indexPathForRow:v7 inSection:v8];
              v19[0] = v15;
              id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
              [(UITableView *)tableView reloadRowsAtIndexPaths:v16 withRowAnimation:100];
            }
            else
            {
              uint64_t v15 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v8];
              [(UITableView *)tableView reloadSections:v15 withRowAnimation:5];
            }
          }
        }
      }
    }
    uint64_t v17 = self->_currentEditingIndexPath;
    self->_currentEditingIndexPath = 0;
  }
  [(PKPaymentPreferencesViewController *)self setEditing:0 animated:0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __82__PKPaymentPreferencesViewController_addressEditorViewController_selectedContact___block_invoke;
  v18[3] = &unk_1E59CA7D0;
  v18[4] = self;
  [(PKPaymentPreferencesViewController *)self dismissViewControllerAnimated:1 completion:v18];
}

uint64_t __82__PKPaymentPreferencesViewController_addressEditorViewController_selectedContact___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePreferredContentSize];
}

- (void)addressEditorViewControllerDidCancel:(id)a3
{
  [(PKPaymentPreferencesViewController *)self dismissViewControllerAnimated:1 completion:0];
  [(PKPaymentPreferencesViewController *)self setEditing:0 animated:1];

  [(PKPaymentPreferencesViewController *)self _updatePreferredContentSize];
}

- (BOOL)_isPaymentStyle
{
  return (self->_style & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (id)_requiredKeysForPreference:(id)a3 contact:(id)a4
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [v5 contactKey];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F1AF10]];

    if (v7)
    {
      uint64_t v8 = *MEMORY[0x1E4F1B7C8];
      v13[0] = *MEMORY[0x1E4F87118];
      v13[1] = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
      id v10 = (void *)[v9 mutableCopy];

      if ([v5 showPhoneticName]) {
        [v10 addObject:*MEMORY[0x1E4F87128]];
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }
  id v11 = (void *)[v10 copy];

  return v11;
}

- (NSArray)preferences
{
  return self->_preferences;
}

- (int64_t)style
{
  return self->_style;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (id)pickedContactPropertyHandler
{
  return self->_pickedContactPropertyHandler;
}

- (void)setPickedContactPropertyHandler:(id)a3
{
}

- (id)pickedContactHandler
{
  return self->_pickedContactHandler;
}

- (void)setPickedContactHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pickedContactHandler, 0);
  objc_storeStrong(&self->_pickedContactPropertyHandler, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
  objc_storeStrong((id *)&self->_latestPreferences, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountPaymentSwitch, 0);
  objc_storeStrong((id *)&self->_currentlySelectedPaymentPass, 0);
  objc_storeStrong((id *)&self->_paymentPassForBillingErrors, 0);
  objc_storeStrong((id *)&self->_sizingButtonCell, 0);
  objc_storeStrong((id *)&self->_currentEditingIndexPath, 0);
  objc_storeStrong((id *)&self->_currentEditingField, 0);

  objc_storeStrong((id *)&self->_passSnapshotter, 0);
}

@end