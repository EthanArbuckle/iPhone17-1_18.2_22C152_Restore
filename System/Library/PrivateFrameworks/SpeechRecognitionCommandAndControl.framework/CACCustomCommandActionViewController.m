@interface CACCustomCommandActionViewController
- (AXSiriShortcut)selectedShortcutForCommand;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldDisallowSelectingRowAtIndexPath:(id)a3;
- (BOOL)_useDetailCell;
- (BOOL)isModalInPresentation;
- (BOOL)isPresentingGestureRecorder;
- (CACCustomCommandActionViewController)init;
- (CACCustomCommandActionViewControllerDelegate)delegate;
- (CACSpokenCommandItem)commandItem;
- (id)_stringFromPasteboardDataArray:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateForAction:(int64_t)a3;
- (void)didSelectShortcut:(id)a3;
- (void)gestureRecorder:(id)a3 saveReplayableGesture:(id)a4;
- (void)setCommandItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsPresentingGestureRecorder:(BOOL)a3;
- (void)setSelectedShortcutForCommand:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textViewDidEndEditing:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CACCustomCommandActionViewController

- (CACCustomCommandActionViewController)init
{
  v2 = [(CACCustomCommandActionViewController *)self initWithStyle:1];
  if (v2)
  {
    v3 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.Action"];
    [(CACCustomCommandActionViewController *)v2 setTitle:v3];

    objc_initWeak(&location, v2);
    v4 = [MEMORY[0x263F22958] sharedManager];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__CACCustomCommandActionViewController_init__block_invoke;
    v7[3] = &unk_264D11940;
    objc_copyWeak(&v8, &location);
    id v5 = (id)[v4 registerShortcutsDidChangeBlock:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __44__CACCustomCommandActionViewController_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__CACCustomCommandActionViewController_init__block_invoke_2;
  v11[3] = &unk_264D12880;
  v4 = (id *)(a1 + 32);
  objc_copyWeak(&v12, v4);
  if ([v3 indexOfObjectPassingTest:v11] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id WeakRetained = objc_loadWeakRetained(v4);
    v6 = [WeakRetained commandItem];
    [v6 setCustomType:0];

    id v7 = objc_loadWeakRetained(v4);
    id v8 = [v7 commandItem];
    [v8 setCustomShortcutsWorkflowIdentifier:0];
  }
  objc_destroyWeak(&v12);
  id v9 = objc_loadWeakRetained(v4);
  v10 = [v9 tableView];
  [v10 reloadData];
}

uint64_t __44__CACCustomCommandActionViewController_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained commandItem];
  v6 = [v5 customShortcutsWorkflowIdentifier];
  uint64_t v7 = [v3 isEqualToString:v6];

  return v7;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)CACCustomCommandActionViewController;
  [(CACCustomCommandActionViewController *)&v10 viewDidLoad];
  id v3 = [(CACCustomCommandActionViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"CustomCommandActionCheckmarkCell"];

  v4 = [(CACCustomCommandActionViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"CustomCommandShortcutsViewCell"];

  id v5 = [(CACCustomCommandActionViewController *)self tableView];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"CustomCommandActionTextViewCell"];

  id v6 = objc_alloc(MEMORY[0x263F82CB0]);
  uint64_t v7 = [(CACCustomCommandActionViewController *)self view];
  id v8 = (void *)[v6 initWithTarget:v7 action:sel_endEditing_];

  [v8 setCancelsTouchesInView:0];
  id v9 = [(CACCustomCommandActionViewController *)self view];
  [v9 addGestureRecognizer:v8];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CACCustomCommandActionViewController;
  [(CACCustomCommandActionViewController *)&v4 viewWillAppear:a3];
  [(CACCustomCommandActionViewController *)self setIsPresentingGestureRecorder:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CACCustomCommandActionViewController;
  [(CACCustomCommandActionViewController *)&v8 viewWillDisappear:a3];
  objc_super v4 = [(CACCustomCommandActionViewController *)self tableView];
  id v5 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:1];
  id v6 = [v4 cellForRowAtIndexPath:v5];

  uint64_t v7 = [v6 textView];
  [v7 resignFirstResponder];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CACCustomCommandActionViewController;
  [(CACCustomCommandActionViewController *)&v5 viewDidDisappear:a3];
  if (![(CACCustomCommandActionViewController *)self isPresentingGestureRecorder])
  {
    objc_super v4 = [(CACCustomCommandActionViewController *)self delegate];
    [v4 didDismissActionViewController:self];
  }
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return a4 == 1;
  }
  else {
    return 4;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section] == 1)
  {
    objc_super v8 = [v6 dequeueReusableCellWithIdentifier:@"CustomCommandActionTextViewCell" forIndexPath:v7];
    id v9 = [(CACCustomCommandActionViewController *)self commandItem];
    objc_super v10 = [v9 customTextToInsert];
    v11 = [v8 textView];
    [v11 setText:v10];

    id v12 = [v8 textView];
    [v12 setDelegate:self];

    id v13 = v8;
    v14 = [(CACCustomCommandActionViewController *)self commandItem];
    v15 = [v14 customType];
    objc_msgSend(v13, "setHidden:", objc_msgSend(v15, "isEqualToString:", @"PasteText") ^ 1);
    v16 = v13;
  }
  else
  {
    if ([v7 section])
    {
      v16 = 0;
      goto LABEL_30;
    }
    v16 = [v6 dequeueReusableCellWithIdentifier:@"CustomCommandActionCheckmarkCell" forIndexPath:v7];
    v17 = [(CACCustomCommandActionViewController *)self commandItem];
    id v13 = [v17 customType];

    int v18 = [v13 isEqualToString:@"RunShortcutsWorkflow"];
    v19 = @"CustomCommandShortcutsViewCell";
    if (!v18) {
      v19 = @"CustomCommandActionCheckmarkCell";
    }
    v20 = v19;
    if ([(CACCustomCommandActionViewController *)self _shouldDisallowSelectingRowAtIndexPath:v7])
    {

      v20 = @"CustomCommandShortcutsViewCell";
    }
    v40 = v20;
    switch([v7 row])
    {
      case 0:
        v14 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.PasteText"];
        v21 = @"PasteText";
        goto LABEL_16;
      case 1:
        v14 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.RunGesture"];
        v21 = @"RunGesture";
        goto LABEL_16;
      case 2:
        v14 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.RunShortcutsWorkflow"];
        v23 = [MEMORY[0x263F22958] sharedManager];
        v24 = [(CACCustomCommandActionViewController *)self commandItem];
        v25 = [v24 customShortcutsWorkflowIdentifier];
        v39 = [v23 shortcutForIdentifier:v25];

        int v22 = [v13 isEqualToString:@"RunShortcutsWorkflow"];
        v26 = [MEMORY[0x263F22958] sharedManager];
        v27 = [v26 shortcuts];
        uint64_t v28 = [v27 count];

        if (v28)
        {
          v29 = v39;
          v15 = [v39 shortcutName];
        }
        else
        {
          v15 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.RunShortcutsWorkflowSetupShortcuts"];
          v29 = v39;
        }

        break;
      case 3:
        v14 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.RunUserActionFlow"];
        v21 = @"RunUserActionFlow";
LABEL_16:
        int v22 = [v13 isEqualToString:v21];
        v15 = 0;
        break;
      default:
        int v22 = 0;
        v15 = 0;
        v14 = 0;
        break;
    }
    v30 = objc_msgSend(v16, "textLabel", v39);
    [v30 setText:v14];

    v31 = [v16 detailTextLabel];
    [v31 setText:v15];

    if (v22) {
      uint64_t v32 = 3;
    }
    else {
      uint64_t v32 = 0;
    }
    [v16 setAccessoryType:v32];
    BOOL v33 = [(CACCustomCommandActionViewController *)self _shouldDisallowSelectingRowAtIndexPath:v7];
    if (v33) {
      [MEMORY[0x263F825C8] systemGrayColor];
    }
    else {
    v34 = [MEMORY[0x263F825C8] labelColor];
    }
    v35 = [v16 textLabel];
    [v35 setTextColor:v34];

    if (v33) {
      [MEMORY[0x263F825C8] systemGrayColor];
    }
    else {
    v36 = [MEMORY[0x263F825C8] labelColor];
    }
    v37 = [v16 detailTextLabel];
    [v37 setTextColor:v36];
  }
LABEL_30:

  return v16;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if (a4)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = +[CACLocaleUtilities localizedUIStringForKey:@"CustomCommand.Actions.RecordedCommandsExplanation", v4];
  }
  return v6;
}

- (BOOL)_shouldDisallowSelectingRowAtIndexPath:(id)a3
{
  id v3 = a3;
  if (![v3 section] && objc_msgSend(v3, "row") == 3 || objc_msgSend(v3, "section") == 1)
  {
    BOOL v4 = 1;
  }
  else if ([v3 section] || objc_msgSend(v3, "row") != 2)
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F22958] sharedManager];
    id v6 = [v5 shortcuts];
    BOOL v4 = [v6 count] == 0;
  }
  return v4;
}

- (BOOL)_useDetailCell
{
  id v3 = [(CACCustomCommandActionViewController *)self commandItem];
  BOOL v4 = [v3 customType];
  if ([v4 isEqualToString:@"RunShortcutsWorkflow"])
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(CACCustomCommandActionViewController *)self commandItem];
    id v7 = [v6 customType];
    if (v7)
    {
      BOOL v5 = 0;
    }
    else
    {
      objc_super v8 = [MEMORY[0x263F22958] sharedManager];
      id v9 = [v8 shortcuts];
      BOOL v5 = [v9 count] == 0;
    }
  }

  return v5;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(CACCustomCommandActionViewController *)self _shouldDisallowSelectingRowAtIndexPath:v5])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v18 = a4;
  id v6 = a3;
  uint64_t v7 = [v18 section];
  id v8 = v18;
  if (!v7)
  {
    if ([v18 row] != 2)
    {
      id v9 = [(CACCustomCommandActionViewController *)self commandItem];
      [v9 setCustomShortcutsWorkflowIdentifier:0];
    }
    uint64_t v10 = [v18 row];
    if (v10)
    {
      if (v10 == 2)
      {
        id v13 = [MEMORY[0x263F22958] sharedManager];
        v14 = [(CACCustomCommandActionViewController *)self commandItem];
        v15 = [v14 customShortcutsWorkflowIdentifier];
        v11 = [v13 shortcutForIdentifier:v15];

        id v12 = [[CACShortcutsSelectionTableViewController alloc] initWithPreviouslySelectedShortcut:v11];
        v16 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v12];
        [(CACShortcutsSelectionTableViewController *)v12 setShortcutsSelectionDelegate:self];
        [(CACCustomCommandActionViewController *)self presentViewController:v16 animated:1 completion:0];
      }
      else
      {
        id v8 = v18;
        if (v10 != 1) {
          goto LABEL_12;
        }
        v11 = (void *)[objc_alloc(MEMORY[0x263F22268]) initWithType:1];
        [v11 setDelegate:self];
        id v12 = (CACShortcutsSelectionTableViewController *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v11];
        [(CACShortcutsSelectionTableViewController *)v12 setModalPresentationStyle:0];
        [(CACCustomCommandActionViewController *)self setIsPresentingGestureRecorder:1];
        [(CACCustomCommandActionViewController *)self presentViewController:v12 animated:1 completion:0];
      }
    }
    else
    {
      [(CACCustomCommandActionViewController *)self _updateForAction:0];
    }
    id v8 = v18;
  }
LABEL_12:
  [v6 deselectRowAtIndexPath:v8 animated:1];
  v17 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v6, "numberOfSections"));
  [v6 reloadSections:v17 withRowAnimation:100];
}

- (void)_updateForAction:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ((unint64_t)a3 > 3) {
    id v5 = 0;
  }
  else {
    id v5 = off_264D128A0[a3];
  }
  id v6 = [(CACCustomCommandActionViewController *)self commandItem];
  [v6 setCustomType:v5];

  uint64_t v7 = [MEMORY[0x263F088C8] indexPathForRow:a3 inSection:0];
  id v8 = [(CACCustomCommandActionViewController *)self tableView];
  id v9 = [v8 cellForRowAtIndexPath:v7];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [(CACCustomCommandActionViewController *)self tableView];
  v11 = [v10 visibleCells];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * v15);
        if (v16 == v9) {
          uint64_t v17 = 3;
        }
        else {
          uint64_t v17 = 0;
        }
        [v16 setAccessoryType:v17];
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  id v18 = [(CACCustomCommandActionViewController *)self tableView];
  [v18 deselectRowAtIndexPath:v7 animated:1];

  v19 = [(CACCustomCommandActionViewController *)self delegate];
  [v19 didUpdateCommandItemForActionViewController:self];
}

- (void)gestureRecorder:(id)a3 saveReplayableGesture:(id)a4
{
  id v5 = a4;
  id v6 = [(CACCustomCommandActionViewController *)self commandItem];
  [v6 setCustomGesture:v5];

  [(CACCustomCommandActionViewController *)self _updateForAction:1];
  id v7 = [(CACCustomCommandActionViewController *)self tableView];
  [v7 reloadData];
}

- (void)didSelectShortcut:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 identifier];
    id v7 = [(CACCustomCommandActionViewController *)self commandItem];
    [v7 setCustomShortcutsWorkflowIdentifier:v6];

    id v8 = CACLogShortcuts();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [(CACCustomCommandActionViewController *)self commandItem];
      int v11 = 138412546;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_238377000, v8, OS_LOG_TYPE_DEFAULT, "Delegate received shortcut %@ for commandItem %@", (uint8_t *)&v11, 0x16u);
    }
    [(CACCustomCommandActionViewController *)self _updateForAction:2];
    uint64_t v10 = [(CACCustomCommandActionViewController *)self tableView];
    [v10 reloadData];
  }
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = [a3 text];
  id v5 = [(CACCustomCommandActionViewController *)self commandItem];
  [v5 setCustomTextToInsert:v4];

  id v6 = [(CACCustomCommandActionViewController *)self delegate];
  [v6 didUpdateCommandItemForActionViewController:self];
}

- (id)_stringFromPasteboardDataArray:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F82A18] pasteboardWithUniqueName];
  id v5 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "objectForKey:", @"CustomPasteBoardType", (void)v19);
        __int16 v13 = [v11 objectForKey:@"CustomPasteBoardData"];
        if (v13) {
          BOOL v14 = v12 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (!v14) {
          [v5 setObject:v13 forKey:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v8);
  }

  long long v23 = v5;
  uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
  [v4 setItems:v15];

  v16 = [v4 strings];
  uint64_t v17 = [v16 componentsJoinedByString:@"\n"];

  return v17;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACCustomCommandActionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CACCustomCommandActionViewControllerDelegate *)WeakRetained;
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

- (BOOL)isPresentingGestureRecorder
{
  return self->_isPresentingGestureRecorder;
}

- (void)setIsPresentingGestureRecorder:(BOOL)a3
{
  self->_isPresentingGestureRecorder = a3;
}

- (AXSiriShortcut)selectedShortcutForCommand
{
  return self->_selectedShortcutForCommand;
}

- (void)setSelectedShortcutForCommand:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedShortcutForCommand, 0);
  objc_storeStrong((id *)&self->_commandItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end