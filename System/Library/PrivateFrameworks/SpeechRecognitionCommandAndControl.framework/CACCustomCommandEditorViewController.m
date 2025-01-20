@interface CACCustomCommandEditorViewController
- (AXSiriShortcutsManager)shortcutsManager;
- (BOOL)_canShowWhileLocked;
- (BOOL)_commandStringIsValid:(id)a3 checkForLength:(BOOL)a4;
- (BOOL)_hasValidActionWithErrorText:(id *)a3;
- (BOOL)_hasValidSpokenStringWithErrorText:(id *)a3;
- (BOOL)_shouldShowDeleteButton;
- (BOOL)_showAlertIfNeededForAction;
- (BOOL)hasEmptySpokenString;
- (BOOL)isEmptyCommandItem;
- (BOOL)isInEditingMode;
- (BOOL)isModalInPresentation;
- (BOOL)isNewCommand;
- (BOOL)isValidCommandItem;
- (BOOL)showAlertIfNeededForAnyError;
- (BOOL)showAlertIfNeededForErrorInSpokenString;
- (BOOL)showsDeleteButton;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CACCustomCommandEditorViewController)init;
- (CACCustomCommandEditorViewControllerDelegate)delegate;
- (CACSpokenCommandItem)commandItem;
- (CACSpokenCommandItem)mutableCommandItem;
- (NSDictionary)applicationIdentifiersToNames;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)doneButton;
- (UIBarButtonItem)editButton;
- (UIBarButtonItem)saveButton;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_showErrorAlertWithText:(id)a3;
- (void)_updateCommandItemWithText:(id)a3;
- (void)cancelAction;
- (void)configureNavItems;
- (void)didUpdateCommandItemForApplicationViewController:(id)a3;
- (void)doneButtonTapped:(id)a3;
- (void)editButtonTapped:(id)a3;
- (void)saveButtonTapped;
- (void)setApplicationIdentifiersToNames:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCommandItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setEditButton:(id)a3;
- (void)setHasEmptySpokenString:(BOOL)a3;
- (void)setIsEmptyCommandItem:(BOOL)a3;
- (void)setIsInEditingMode:(BOOL)a3;
- (void)setIsValidCommandItem:(BOOL)a3;
- (void)setMutableCommandItem:(id)a3;
- (void)setSaveButton:(id)a3;
- (void)setShortcutsManager:(id)a3;
- (void)setShowsDeleteButton:(BOOL)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidChange:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CACCustomCommandEditorViewController

- (CACCustomCommandEditorViewController)init
{
  v2 = [(CACCustomCommandEditorViewController *)self initWithStyle:1];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:2 target:v2 action:sel_editButtonTapped_];
    editButton = v2->_editButton;
    v2->_editButton = (UIBarButtonItem *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:v2 action:sel_doneButtonTapped_];
    doneButton = v2->_doneButton;
    v2->_doneButton = (UIBarButtonItem *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:3 target:v2 action:sel_saveButtonTapped];
    saveButton = v2->_saveButton;
    v2->_saveButton = (UIBarButtonItem *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v2 action:sel_cancelAction];
    cancelButton = v2->_cancelButton;
    v2->_cancelButton = (UIBarButtonItem *)v9;
  }
  return v2;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)CACCustomCommandEditorViewController;
  [(CACCustomCommandEditorViewController *)&v13 viewDidLoad];
  BOOL v3 = [(CACCustomCommandEditorViewController *)self isNewCommand];
  v4 = [(CACCustomCommandEditorViewController *)self commandItem];
  uint64_t v5 = v4;
  if (v3)
  {
    [(CACCustomCommandEditorViewController *)self setMutableCommandItem:v4];
  }
  else
  {
    v6 = (void *)[v4 copy];
    [(CACCustomCommandEditorViewController *)self setMutableCommandItem:v6];
  }
  [(CACCustomCommandEditorViewController *)self setIsInEditingMode:[(CACCustomCommandEditorViewController *)self isNewCommand]];
  [(CACCustomCommandEditorViewController *)self configureNavItems];
  uint64_t v7 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.NewCommandTitle"];
  [(CACCustomCommandEditorViewController *)self setTitle:v7];

  id v8 = objc_alloc(MEMORY[0x263F82CB0]);
  uint64_t v9 = [(CACCustomCommandEditorViewController *)self view];
  v10 = (void *)[v8 initWithTarget:v9 action:sel_endEditing_];

  [v10 setCancelsTouchesInView:0];
  v11 = [(CACCustomCommandEditorViewController *)self view];
  [v11 addGestureRecognizer:v10];

  v12 = [MEMORY[0x263F22958] sharedManager];
  [(CACCustomCommandEditorViewController *)self setShortcutsManager:v12];
}

- (BOOL)isModalInPresentation
{
  BOOL v3 = [(CACCustomCommandEditorViewController *)self mutableCommandItem];
  v4 = [v3 customType];

  if (([v4 isEqualToString:@"RunGesture"] & 1) != 0
    || ([v4 isEqualToString:@"PasteText"] & 1) != 0
    || ([v4 isEqualToString:@"RunUserActionFlow"] & 1) != 0
    || ([v4 isEqualToString:@"RunShortcutsWorkflow"] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [v4 isEqualToString:@"PasteBoard"];
  }
  char v6 = [(CACCustomCommandEditorViewController *)self hasEmptySpokenString];
  BOOL v7 = (v5 | ~v6) & [(CACCustomCommandEditorViewController *)self isInEditingMode];

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CACCustomCommandEditorViewController;
  [(CACCustomCommandEditorViewController *)&v10 viewWillAppear:a3];
  v4 = [(CACCustomCommandEditorViewController *)self tableView];
  [v4 reloadData];

  char v5 = [(CACCustomCommandEditorViewController *)self mutableCommandItem];
  char v6 = [v5 displayString];
  if (![v6 length])
  {
    BOOL v7 = [(CACCustomCommandEditorViewController *)self isNewCommand];

    if (!v7) {
      return;
    }
    id v8 = [(CACCustomCommandEditorViewController *)self tableView];
    uint64_t v9 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
    char v5 = [v8 cellForRowAtIndexPath:v9];

    char v6 = [v5 textField];
    [v6 becomeFirstResponder];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CACCustomCommandEditorViewController;
  [(CACCustomCommandEditorViewController *)&v3 viewWillDisappear:a3];
}

- (void)saveButtonTapped
{
  if ([(CACCustomCommandEditorViewController *)self isValidCommandItem])
  {
    objc_super v3 = [(CACCustomCommandEditorViewController *)self mutableCommandItem];
    [(CACCustomCommandEditorViewController *)self setCommandItem:v3];

    uint64_t v4 = [(CACCustomCommandEditorViewController *)self delegate];
    if (v4
      && (char v5 = (void *)v4,
          [(CACCustomCommandEditorViewController *)self delegate],
          char v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = objc_opt_respondsToSelector(),
          v6,
          v5,
          (v7 & 1) != 0))
    {
      id v9 = [(CACCustomCommandEditorViewController *)self delegate];
      [v9 didFinishEditingCustomCommandForEditor:self];
    }
    else
    {
      id v8 = [(CACCustomCommandEditorViewController *)self commandItem];
      [v8 saveToPreferences];

      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __56__CACCustomCommandEditorViewController_saveButtonTapped__block_invoke;
      v10[3] = &unk_264D115D0;
      v10[4] = self;
      [(CACCustomCommandEditorViewController *)self dismissViewControllerAnimated:1 completion:v10];
    }
  }
  else
  {
    [(CACCustomCommandEditorViewController *)self showAlertIfNeededForAnyError];
  }
}

void __56__CACCustomCommandEditorViewController_saveButtonTapped__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didUpdatePropertiesForEditor:*(void *)(a1 + 32)];
}

- (void)cancelAction
{
  uint64_t v3 = [(CACCustomCommandEditorViewController *)self delegate];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [(CACCustomCommandEditorViewController *)self delegate],
        char v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    id v7 = [(CACCustomCommandEditorViewController *)self delegate];
    [v7 didCancelEditingCustomCommandForEditor:self];
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __52__CACCustomCommandEditorViewController_cancelAction__block_invoke;
    v8[3] = &unk_264D115D0;
    v8[4] = self;
    [(CACCustomCommandEditorViewController *)self dismissViewControllerAnimated:1 completion:v8];
  }
}

void __52__CACCustomCommandEditorViewController_cancelAction__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didUpdatePropertiesForEditor:*(void *)(a1 + 32)];
}

- (void)editButtonTapped:(id)a3
{
  [(CACCustomCommandEditorViewController *)self setIsInEditingMode:1];
  [(CACCustomCommandEditorViewController *)self configureNavItems];
}

- (void)doneButtonTapped:(id)a3
{
  [(CACCustomCommandEditorViewController *)self setIsInEditingMode:0];
  [(CACCustomCommandEditorViewController *)self configureNavItems];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__CACCustomCommandEditorViewController_doneButtonTapped___block_invoke;
  v4[3] = &unk_264D115D0;
  v4[4] = self;
  [(CACCustomCommandEditorViewController *)self dismissViewControllerAnimated:1 completion:v4];
}

void __57__CACCustomCommandEditorViewController_doneButtonTapped___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didUpdatePropertiesForEditor:*(void *)(a1 + 32)];
}

- (void)configureNavItems
{
  if ([(CACCustomCommandEditorViewController *)self isInEditingMode]) {
    [(CACCustomCommandEditorViewController *)self saveButton];
  }
  else {
  uint64_t v3 = [(CACCustomCommandEditorViewController *)self editButton];
  }
  uint64_t v4 = [(CACCustomCommandEditorViewController *)self navigationItem];
  [v4 setRightBarButtonItem:v3];

  if ([(CACCustomCommandEditorViewController *)self isInEditingMode]) {
    [(CACCustomCommandEditorViewController *)self cancelButton];
  }
  else {
  id v6 = [(CACCustomCommandEditorViewController *)self doneButton];
  }
  char v5 = [(CACCustomCommandEditorViewController *)self navigationItem];
  [v5 setLeftBarButtonItem:v6];
}

- (BOOL)isNewCommand
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  uint64_t v4 = [(CACCustomCommandEditorViewController *)self commandItem];
  char v5 = [v4 identifier];
  id v6 = [v3 propertiesForCommandIdentifier:v5];
  BOOL v7 = v6 == 0;

  return v7;
}

- (void)setIsInEditingMode:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  obj->_isInEditingMode = v3;
  [(CACCustomCommandEditorViewController *)obj setShowsDeleteButton:v3];
  uint64_t v4 = [(CACCustomCommandEditorViewController *)obj tableView];
  char v5 = (void *)MEMORY[0x263F088D0];
  id v6 = [(CACCustomCommandEditorViewController *)obj tableView];
  BOOL v7 = objc_msgSend(v5, "indexSetWithIndexesInRange:", 0, objc_msgSend(v6, "numberOfSections"));
  [v4 reloadSections:v7 withRowAnimation:100];

  objc_sync_exit(obj);
}

- (BOOL)isValidCommandItem
{
  BOOL v3 = [(CACCustomCommandEditorViewController *)self _hasValidSpokenStringWithErrorText:0];
  if (v3)
  {
    LOBYTE(v3) = [(CACCustomCommandEditorViewController *)self _hasValidActionWithErrorText:0];
  }
  return v3;
}

- (BOOL)isEmptyCommandItem
{
  BOOL v3 = [(CACCustomCommandEditorViewController *)self mutableCommandItem];
  if ([(CACCustomCommandEditorViewController *)self hasEmptySpokenString])
  {
    uint64_t v4 = [v3 customType];
    if (v4)
    {
      char v5 = 0;
    }
    else
    {
      id v6 = [v3 customScope];
      char v5 = [v6 isEqualToString:@"com.apple.speech.SystemWideScope"];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)hasEmptySpokenString
{
  id v2 = [(CACCustomCommandEditorViewController *)self mutableCommandItem];
  BOOL v3 = [v2 displayString];
  BOOL v4 = [v3 length] == 0;

  return v4;
}

- (BOOL)showAlertIfNeededForErrorInSpokenString
{
  id v6 = 0;
  BOOL v3 = [(CACCustomCommandEditorViewController *)self _hasValidSpokenStringWithErrorText:&v6];
  id v4 = v6;
  if (!v3) {
    [(CACCustomCommandEditorViewController *)self _showErrorAlertWithText:v4];
  }

  return !v3;
}

- (BOOL)_showAlertIfNeededForAction
{
  id v6 = 0;
  BOOL v3 = [(CACCustomCommandEditorViewController *)self _hasValidActionWithErrorText:&v6];
  id v4 = v6;
  if (!v3) {
    [(CACCustomCommandEditorViewController *)self _showErrorAlertWithText:v4];
  }

  return !v3;
}

- (BOOL)showAlertIfNeededForAnyError
{
  if ([(CACCustomCommandEditorViewController *)self showAlertIfNeededForErrorInSpokenString])
  {
    return 1;
  }
  return [(CACCustomCommandEditorViewController *)self _showAlertIfNeededForAction];
}

- (void)_showErrorAlertWithText:(id)a3
{
  id v4 = (void *)MEMORY[0x263F82418];
  id v5 = a3;
  id v6 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.Error.Title"];
  id v10 = [v4 alertControllerWithTitle:v6 message:v5 preferredStyle:1];

  BOOL v7 = (void *)MEMORY[0x263F82400];
  id v8 = +[CACLocaleUtilities localizedUIStringForKey:@"CommonStrings.OK"];
  id v9 = [v7 actionWithTitle:v8 style:0 handler:0];

  [v10 addAction:v9];
  [(CACCustomCommandEditorViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (BOOL)_hasValidSpokenStringWithErrorText:(id *)a3
{
  id v4 = self;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = [(CACCustomCommandEditorViewController *)self mutableCommandItem];
  id v6 = [v5 displayString];
  LODWORD(v4) = [(CACCustomCommandEditorViewController *)v4 _commandStringIsValid:v6 checkForLength:1];

  if (!v4)
  {
    v18 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.Error.EmptyName"];
    if (!a3) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  BOOL v7 = objc_alloc_init(CACSpokenCommandPresentation);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = [(CACSpokenCommandPresentation *)v7 flattenedCommandGroupsAndItems];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v20 = v7;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (([v13 isGroup] & 1) == 0)
        {
          id v14 = v13;
          v15 = [v5 identifier];
          v16 = [v14 identifier];
          if ([v15 isEqualToString:v16])
          {
          }
          else
          {
            char v17 = [v5 conflictsWithItem:v14];

            if (v17)
            {

              v18 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.Error.ConflictingName"];
              goto LABEL_18;
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }

    v18 = 0;
LABEL_18:
    BOOL v7 = v20;
  }
  else
  {

    v18 = 0;
  }

  if (a3) {
LABEL_21:
  }
    *a3 = v18;
LABEL_22:

  return v18 == 0;
}

- (BOOL)_hasValidActionWithErrorText:(id *)a3
{
  id v4 = [(CACCustomCommandEditorViewController *)self mutableCommandItem];
  id v5 = [v4 customType];
  int v6 = [v5 isEqualToString:@"RunGesture"];

  if (!v6)
  {
    uint64_t v9 = [v4 customType];
    int v10 = [v9 isEqualToString:@"PasteText"];

    if (v10)
    {
      uint64_t v11 = [v4 customTextToInsert];
      uint64_t v12 = [v11 length];

      if (v12) {
        goto LABEL_15;
      }
      id v8 = @"CustomCommand.Error.EmptyTextToInsert";
    }
    else
    {
      objc_super v13 = [v4 customType];
      int v14 = [v13 isEqualToString:@"RunUserActionFlow"];

      if (v14)
      {
        v15 = [v4 customUserActionFlow];
        v16 = [v15 userActions];
        uint64_t v17 = [v16 count];

        if (v17) {
          goto LABEL_15;
        }
        id v8 = @"CustomCommand.Error.EmptyUserActionFlow";
      }
      else
      {
        v18 = [v4 customType];
        int v19 = [v18 isEqualToString:@"RunShortcutsWorkflow"];

        if (v19)
        {
          v20 = [v4 customShortcutsWorkflowIdentifier];
          uint64_t v21 = [v20 length];

          if (v21) {
            goto LABEL_15;
          }
          id v8 = @"CustomCommand.Error.EmptyShortcutsWorkflow";
        }
        else
        {
          long long v22 = [v4 customType];
          int v23 = [v22 isEqualToString:@"PasteBoard"];

          if (v23)
          {
            long long v24 = [v4 customPasteBoard];
            uint64_t v25 = [v24 count];

            if (v25) {
              goto LABEL_15;
            }
            id v8 = @"CustomCommand.Error.EmptyPasteBoard";
          }
          else
          {
            id v8 = @"CustomCommand.Error.EmptyAction";
          }
        }
      }
    }
LABEL_20:
    uint64_t v26 = +[CACLocaleUtilities localizedUIStringForKey:v8];
    if (!a3) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  BOOL v7 = [v4 customGesture];

  if (!v7)
  {
    id v8 = @"CustomCommand.Error.EmptyGesture";
    goto LABEL_20;
  }
LABEL_15:
  uint64_t v26 = 0;
  if (a3) {
LABEL_16:
  }
    *a3 = v26;
LABEL_17:

  return v26 == 0;
}

- (BOOL)_commandStringIsValid:(id)a3 checkForLength:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  int v6 = [MEMORY[0x263F08708] illegalCharacterSet];
  if (v4)
  {
    BOOL v7 = [v5 stringByTrimmingCharactersInSet:v6];
    BOOL v8 = (unint64_t)[v7 length] > 3;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (NSDictionary)applicationIdentifiersToNames
{
  applicationIdentifiersToNames = self->_applicationIdentifiersToNames;
  if (!applicationIdentifiersToNames)
  {
    BOOL v4 = [MEMORY[0x263F22968] server];
    id v5 = [v4 installedApps];
    int v6 = self->_applicationIdentifiersToNames;
    self->_applicationIdentifiersToNames = v5;

    applicationIdentifiersToNames = self->_applicationIdentifiersToNames;
  }
  return applicationIdentifiersToNames;
}

- (BOOL)_shouldShowDeleteButton
{
  if (![(CACCustomCommandEditorViewController *)self isInEditingMode]
    || ![(CACCustomCommandEditorViewController *)self showsDeleteButton])
  {
    return 0;
  }
  BOOL v3 = +[CACPreferences sharedPreferences];
  BOOL v4 = [(CACCustomCommandEditorViewController *)self commandItem];
  id v5 = [v4 identifier];
  int v6 = [v3 propertiesForCommandIdentifier:v5];
  BOOL v7 = v6 != 0;

  return v7;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 2) {
    return 0;
  }
  else {
    return qword_238415A18[a4];
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    int v6 = 0;
  }
  else
  {
    int v6 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.SpokenString", v4];
  }
  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (![(CACCustomCommandEditorViewController *)self isInEditingMode]) {
    goto LABEL_5;
  }
  if (!a4)
  {
    uint64_t v5 = @"CustomCommand.SpokenStringFooterText";
    goto LABEL_7;
  }
  if (a4 != 1)
  {
LABEL_5:
    int v6 = 0;
    goto LABEL_8;
  }
  uint64_t v5 = @"CustomCommand.ActionFooterText";
LABEL_7:
  int v6 = +[CACLocaleUtilities localizedUIStringForKey:v5];
LABEL_8:
  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    if ([v7 section] == 2)
    {
      BOOL v8 = [v6 dequeueReusableCellWithIdentifier:@"Delete"];
      if (!v8)
      {
        BOOL v8 = (CACCustomCommandEditorTextFieldCell *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:@"Delete"];
        uint64_t v9 = [(CACCustomCommandEditorTextFieldCell *)v8 textLabel];
        [v9 setTextAlignment:1];

        int v10 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.Delete"];
        uint64_t v11 = [(CACCustomCommandEditorTextFieldCell *)v8 textLabel];
        [v11 setText:v10];

        uint64_t v12 = [MEMORY[0x263F825C8] _systemDestructiveTintColor];
        objc_super v13 = [(CACCustomCommandEditorTextFieldCell *)v8 textLabel];
        [v13 setTextColor:v12];
      }
      [(CACCustomCommandEditorTextFieldCell *)v8 setHidden:[(CACCustomCommandEditorViewController *)self _shouldShowDeleteButton] ^ 1];
      goto LABEL_32;
    }
    BOOL v8 = [v6 dequeueReusableCellWithIdentifier:@"Property"];
    if (!v8) {
      BOOL v8 = (CACCustomCommandEditorTextFieldCell *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:1 reuseIdentifier:@"Property"];
    }
    uint64_t v19 = [v7 row];
    if (v19 == 1)
    {
      v20 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.Application"];
      long long v24 = [(CACCustomCommandEditorViewController *)self mutableCommandItem];
      long long v22 = [v24 customScope];

      if ([v22 isEqualToString:@"com.apple.speech.SystemWideScope"])
      {
        int v23 = @"CustomCommand.AnyApplication";
        goto LABEL_17;
      }
      v27 = [(CACCustomCommandEditorViewController *)self applicationIdentifiersToNames];
      uint64_t v30 = [v27 objectForKeyedSubscript:v22];
    }
    else
    {
      if (v19)
      {
        uint64_t v25 = 0;
        v20 = 0;
        goto LABEL_26;
      }
      v20 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.Action"];
      uint64_t v21 = [(CACCustomCommandEditorViewController *)self mutableCommandItem];
      long long v22 = [v21 customType];

      if ([v22 isEqualToString:@"RunGesture"])
      {
        int v23 = @"CustomCommand.RunGesture";
LABEL_17:
        uint64_t v25 = +[CACLocaleUtilities localizedUIStringForKey:v23];
LABEL_25:

LABEL_26:
        v31 = [(CACCustomCommandEditorTextFieldCell *)v8 textLabel];
        [v31 setText:v20];

        v32 = [(CACCustomCommandEditorTextFieldCell *)v8 detailTextLabel];
        [v32 setText:v25];

        if ([(CACCustomCommandEditorViewController *)self isInEditingMode])
        {
          [(CACCustomCommandEditorTextFieldCell *)v8 setUserInteractionEnabled:1];
          if (![v7 row])
          {
            v36 = [(CACCustomCommandEditorViewController *)self mutableCommandItem];
            v37 = [v36 customType];
            -[CACCustomCommandEditorTextFieldCell setAccessoryType:](v8, "setAccessoryType:", [v37 isEqualToString:@"RunUserActionFlow"] ^ 1);

            goto LABEL_31;
          }
          v33 = v8;
          uint64_t v34 = 1;
        }
        else
        {
          [(CACCustomCommandEditorTextFieldCell *)v8 setUserInteractionEnabled:0];
          v33 = v8;
          uint64_t v34 = 0;
        }
        [(CACCustomCommandEditorTextFieldCell *)v33 setAccessoryType:v34];
LABEL_31:

        goto LABEL_32;
      }
      if (![v22 isEqualToString:@"PasteText"])
      {
        if ([v22 isEqualToString:@"RunUserActionFlow"])
        {
          v47 = NSString;
          v46 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.RunUserActionFlowWithNumber"];
          v49 = [(CACCustomCommandEditorViewController *)self commandItem];
          v38 = [v49 customUserActionFlow];
          v39 = [v38 userActions];
          [v39 count];
          v40 = AXFormatInteger();
          uint64_t v25 = [v47 localizedStringWithValidatedFormat:v46, @"%@", 0, v40 validFormatSpecifiers error];

          goto LABEL_25;
        }
        if ([v22 isEqualToString:@"RunShortcutsWorkflow"])
        {
          v48 = [MEMORY[0x263F22958] sharedManager];
          v41 = [(CACCustomCommandEditorViewController *)self mutableCommandItem];
          v42 = [v41 customShortcutsWorkflowIdentifier];
          v43 = [v48 shortcutForIdentifier:v42];
          v50 = [v43 shortcutName];

          v44 = NSString;
          v45 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.RunShortcutsWorkflowFormatted"];
          uint64_t v25 = [v44 localizedStringWithValidatedFormat:v45, @"%@", 0, v50 validFormatSpecifiers error];

          goto LABEL_25;
        }
        if ([v22 isEqualToString:@"PasteBoard"]) {
          int v23 = @"CustomCommand.PasteBoard";
        }
        else {
          int v23 = @"CustomCommand.Unset";
        }
        goto LABEL_17;
      }
      uint64_t v26 = [(CACCustomCommandEditorViewController *)self mutableCommandItem];
      v27 = [v26 customTextToInsert];

      if ([v27 length])
      {
        v28 = NSString;
        v29 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.PasteTextFormat"];
        uint64_t v25 = [v28 localizedStringWithValidatedFormat:v29, @"%@", 0, v27 validFormatSpecifiers error];

LABEL_24:
        goto LABEL_25;
      }
      uint64_t v30 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.PasteText"];
    }
    uint64_t v25 = (void *)v30;
    goto LABEL_24;
  }
  BOOL v8 = [v6 dequeueReusableCellWithIdentifier:@"SpokenString"];
  if (!v8)
  {
    BOOL v8 = [[CACCustomCommandEditorTextFieldCell alloc] initWithStyle:0 reuseIdentifier:@"SpokenString"];
    [(CACCustomCommandEditorTextFieldCell *)v8 setSelectionStyle:0];
    int v14 = [(CACCustomCommandEditorTextFieldCell *)v8 textField];
    v15 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.SpokenStringPlaceholder"];
    [v14 setPlaceholder:v15];

    [v14 setTextAlignment:4];
    [v14 setAutocapitalizationType:2];
    [v14 setReturnKeyType:9];
    [v14 addTarget:self action:sel_textFieldDidChange_ forControlEvents:0x20000];
    [v14 setDelegate:self];
  }
  v16 = [(CACCustomCommandEditorViewController *)self mutableCommandItem];
  uint64_t v17 = [v16 displayString];
  v18 = [(CACCustomCommandEditorTextFieldCell *)v8 textField];
  [v18 setText:v17];

  [(CACCustomCommandEditorTextFieldCell *)v8 setUserInteractionEnabled:[(CACCustomCommandEditorViewController *)self isInEditingMode]];
LABEL_32:

  return v8;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if ([v5 section] == 1)
  {
    id v6 = v5;
    if (![v5 row])
    {
      id v7 = [(CACCustomCommandEditorViewController *)self mutableCommandItem];
      BOOL v8 = [v7 customType];
      int v9 = [v8 isEqualToString:@"RunUserActionFlow"];

      id v6 = v5;
      if (v9)
      {

        id v6 = 0;
      }
    }
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section] == 1)
  {
    uint64_t v6 = [v5 row];
    if (v6 == 1)
    {
      id v7 = objc_alloc_init(CACCustomCommandApplicationViewController);
      [(CACCustomCommandApplicationViewController *)v7 setDelegate:self];
      uint64_t v19 = [(CACCustomCommandEditorViewController *)self mutableCommandItem];
      [(CACCustomCommandApplicationViewController *)v7 setCommandItem:v19];

      BOOL v8 = [(CACCustomCommandEditorViewController *)self applicationIdentifiersToNames];
      [(CACCustomCommandApplicationViewController *)v7 setApplicationIdentifiersToNames:v8];
    }
    else
    {
      if (v6) {
        goto LABEL_11;
      }
      id v7 = objc_alloc_init(CACCustomCommandActionViewController);
      [(CACCustomCommandApplicationViewController *)v7 setDelegate:self];
      BOOL v8 = [(CACCustomCommandEditorViewController *)self mutableCommandItem];
      [(CACCustomCommandApplicationViewController *)v7 setCommandItem:v8];
    }

    if (v7)
    {
      v20 = [(CACCustomCommandEditorViewController *)self navigationController];
      [v20 pushViewController:v7 animated:1];

      goto LABEL_10;
    }
  }
  else if ([v5 section] == 2)
  {
    int v9 = [(CACCustomCommandEditorViewController *)self tableView];
    int v10 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
    id v7 = [v9 cellForRowAtIndexPath:v10];

    uint64_t v11 = [(CACCustomCommandApplicationViewController *)v7 textField];
    [v11 resignFirstResponder];

    uint64_t v12 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:0];
    objc_super v13 = (void *)MEMORY[0x263F82400];
    int v14 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.Delete"];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __74__CACCustomCommandEditorViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v23[3] = &unk_264D115F8;
    v23[4] = self;
    v15 = [v13 actionWithTitle:v14 style:2 handler:v23];
    [v12 addAction:v15];

    v16 = (void *)MEMORY[0x263F82400];
    uint64_t v17 = +[CACLocaleUtilities localizedUIStringForKey:@"CommonStrings.Cancel"];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __74__CACCustomCommandEditorViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
    v21[3] = &unk_264D11620;
    v21[4] = self;
    id v22 = v5;
    v18 = [v16 actionWithTitle:v17 style:1 handler:v21];
    [v12 addAction:v18];

    [(CACCustomCommandEditorViewController *)self presentViewController:v12 animated:1 completion:0];
LABEL_10:
  }
LABEL_11:
}

uint64_t __74__CACCustomCommandEditorViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) commandItem];
  [v2 removeFromPreferences];

  BOOL v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__CACCustomCommandEditorViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v5[3] = &unk_264D115D0;
  v5[4] = v3;
  return [v3 dismissViewControllerAnimated:1 completion:v5];
}

void __74__CACCustomCommandEditorViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 didUpdatePropertiesForEditor:*(void *)(a1 + 32)];
}

void __74__CACCustomCommandEditorViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tableView];
  [v2 deselectRowAtIndexPath:*(void *)(a1 + 40) animated:1];
}

- (void)_updateCommandItemWithText:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CACCustomCommandEditorViewController *)self mutableCommandItem];
  v9[0] = v4;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  id v7 = +[CACPreferences sharedPreferences];

  BOOL v8 = [v7 bestLocaleIdentifier];
  [v5 setValue:v6 forKey:@"CustomCommands" locale:v8];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = [a3 text];
  BOOL v5 = [(CACCustomCommandEditorViewController *)self _commandStringIsValid:v4 checkForLength:1];

  id v7 = [(CACCustomCommandEditorViewController *)self navigationItem];
  uint64_t v6 = [v7 rightBarButtonItem];
  [v6 setEnabled:v5];
}

- (void)textFieldDidChange:(id)a3
{
  id v4 = [a3 text];
  BOOL v5 = [(CACCustomCommandEditorViewController *)self _commandStringIsValid:v4 checkForLength:1];

  id v7 = [(CACCustomCommandEditorViewController *)self navigationItem];
  uint64_t v6 = [v7 rightBarButtonItem];
  [v6 setEnabled:v5];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  BOOL v11 = 0;
  if ([(CACCustomCommandEditorViewController *)self _commandStringIsValid:v10 checkForLength:0])
  {
    if (location && [v10 length])
    {
      uint64_t v12 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      if (objc_msgSend(v12, "characterIsMember:", objc_msgSend(v10, "characterAtIndex:", 0)))
      {
        objc_super v13 = [MEMORY[0x263F08708] whitespaceCharacterSet];
        int v14 = [v9 text];
        char v15 = objc_msgSend(v13, "characterIsMember:", objc_msgSend(v14, "characterAtIndex:", location - 1));

        if (v15)
        {
          BOOL v11 = 0;
          goto LABEL_9;
        }
      }
      else
      {
      }
    }
    v16 = [v9 text];
    uint64_t v17 = objc_msgSend(v16, "stringByReplacingCharactersInRange:withString:", location, length, v10);
    [(CACCustomCommandEditorViewController *)self _updateCommandItemWithText:v17];

    BOOL v11 = 1;
  }
LABEL_9:

  return v11;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CACCustomCommandEditorViewController *)self _shouldShowDeleteButton];
  uint64_t v6 = [v4 text];

  id v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  BOOL v8 = [v6 stringByTrimmingCharactersInSet:v7];
  [(CACCustomCommandEditorViewController *)self _updateCommandItemWithText:v8];

  BOOL v9 = [(CACCustomCommandEditorViewController *)self _shouldShowDeleteButton];
  if (!v5 && v9)
  {
    id v11 = [(CACCustomCommandEditorViewController *)self tableView];
    id v10 = [MEMORY[0x263F088D0] indexSetWithIndex:2];
    [v11 insertSections:v10 withRowAnimation:0];
  }
}

- (void)didUpdateCommandItemForApplicationViewController:(id)a3
{
  id v4 = [(CACCustomCommandEditorViewController *)self delegate];
  [v4 didUpdatePropertiesForEditor:self];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isInEditingMode
{
  return self->_isInEditingMode;
}

- (CACCustomCommandEditorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CACCustomCommandEditorViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CACSpokenCommandItem)commandItem
{
  return self->_commandItem;
}

- (void)setCommandItem:(id)a3
{
}

- (void)setIsValidCommandItem:(BOOL)a3
{
  self->_isValidCommandItem = a3;
}

- (void)setIsEmptyCommandItem:(BOOL)a3
{
  self->_isEmptyCommandItem = a3;
}

- (void)setHasEmptySpokenString:(BOOL)a3
{
  self->_hasEmptySpokenString = a3;
}

- (BOOL)showsDeleteButton
{
  return self->_showsDeleteButton;
}

- (void)setShowsDeleteButton:(BOOL)a3
{
  self->_showsDeleteButton = a3;
}

- (void)setApplicationIdentifiersToNames:(id)a3
{
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (UIBarButtonItem)saveButton
{
  return self->_saveButton;
}

- (void)setSaveButton:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIBarButtonItem)editButton
{
  return self->_editButton;
}

- (void)setEditButton:(id)a3
{
}

- (CACSpokenCommandItem)mutableCommandItem
{
  return self->_mutableCommandItem;
}

- (void)setMutableCommandItem:(id)a3
{
}

- (AXSiriShortcutsManager)shortcutsManager
{
  return self->_shortcutsManager;
}

- (void)setShortcutsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutsManager, 0);
  objc_storeStrong((id *)&self->_mutableCommandItem, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_commandItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationIdentifiersToNames, 0);
}

@end