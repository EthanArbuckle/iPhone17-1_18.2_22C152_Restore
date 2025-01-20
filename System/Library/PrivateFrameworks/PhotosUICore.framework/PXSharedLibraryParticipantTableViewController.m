@interface PXSharedLibraryParticipantTableViewController
- (BOOL)canAddParticipants;
- (BOOL)isInteractionEnabled;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PXSharedLibraryParticipantDataSource)dataSource;
- (PXSharedLibraryParticipantDataSourceManager)dataSourceManager;
- (PXSharedLibraryParticipantTableViewController)initWithDataSourceManager:(id)a3;
- (PXSharedLibraryParticipantTableViewControllerDelegate)delegate;
- (double)tableViewHeight;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_handleAddRecipient;
- (void)_updateAddButton;
- (void)_updateRowHeight;
- (void)_updateTableViewHeight;
- (void)loadView;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photoRecipientViewController:(id)a3 didCompleteWithRecipients:(id)a4;
- (void)photoRecipientViewControllerDidCancel:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInteractionEnabled:(BOOL)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillLayoutSubviews;
@end

@implementation PXSharedLibraryParticipantTableViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
}

- (void)setDataSource:(id)a3
{
}

- (PXSharedLibraryParticipantDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDelegate:(id)a3
{
}

- (PXSharedLibraryParticipantTableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSharedLibraryParticipantTableViewControllerDelegate *)WeakRetained;
}

- (BOOL)isInteractionEnabled
{
  return self->_interactionEnabled;
}

- (double)tableViewHeight
{
  return self->_tableViewHeight;
}

- (PXSharedLibraryParticipantDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5 = a3;
  v6 = [(PXSharedLibraryParticipantTableViewController *)self tableView];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  v11 = objc_msgSend(v6, "indexPathForRowAtPoint:", v8, v10);
  v12 = [v6 cellForRowAtIndexPath:v11];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v12];

  return v13;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = [(PXSharedLibraryParticipantTableViewController *)self tableView];
  double v9 = objc_msgSend(v8, "indexPathForRowAtPoint:", x, y);
  double v10 = [v8 cellForRowAtIndexPath:v9];
  if (v10
    && [(PXSharedLibraryParticipantTableViewController *)self isInteractionEnabled]
    && ![v9 section])
  {
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E4FB1678];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __103__PXSharedLibraryParticipantTableViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
    v14[3] = &unk_1E5DB6F38;
    objc_copyWeak(&v16, &location);
    id v15 = v9;
    v11 = [v13 configurationWithIdentifier:0 previewProvider:&__block_literal_global_77057 actionProvider:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __103__PXSharedLibraryParticipantTableViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4FB13F0];
  id v5 = PXLocalizedSharedLibraryString(@"PXSharedLibrarySetupAssistant_Participants_Delete");
  v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle.badge.minus"];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __103__PXSharedLibraryParticipantTableViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3;
  id v15 = &unk_1E5DC7448;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  id v16 = *(id *)(a1 + 32);
  id v7 = [v4 actionWithTitle:v5 image:v6 identifier:0 handler:&v12];

  double v8 = (void *)MEMORY[0x1E4FB1970];
  v18[0] = v7;
  double v9 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 1, v12, v13, v14, v15);
  double v10 = [v8 menuWithTitle:&stru_1F00B0030 children:v9];

  objc_destroyWeak(&v17);
  return v10;
}

uint64_t __103__PXSharedLibraryParticipantTableViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke()
{
  return 0;
}

void __103__PXSharedLibraryParticipantTableViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained dataSourceManager];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __103__PXSharedLibraryParticipantTableViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4;
  v4[3] = &unk_1E5DD06F8;
  id v5 = *(id *)(a1 + 32);
  [v3 performChanges:v4];
}

void __103__PXSharedLibraryParticipantTableViewController_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "removeParticipantAtIndex:", objc_msgSend(v2, "row"));
}

- (void)photoRecipientViewControllerDidCancel:(id)a3
{
  id v4 = [(PXSharedLibraryParticipantTableViewController *)self delegate];
  [v4 dismissPresentedViewControllerAnimated:1 forSharedLibraryParticipantTableViewController:self];
}

- (void)photoRecipientViewController:(id)a3 didCompleteWithRecipients:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
        uint64_t v12 = [v11 contact];
        uint64_t v13 = [v11 emailAddressString];
        v14 = [v11 phoneNumberString];
        if ([v13 length])
        {
          id v15 = [[PXSharedLibraryUIParticipant alloc] initWithEmailAddress:v13 contact:v12];
LABEL_10:
          p_super = &v15->super;
          [v5 addObject:v15];
          goto LABEL_11;
        }
        if ([v14 length])
        {
          id v15 = [[PXSharedLibraryUIParticipant alloc] initWithPhoneNumber:v14 contact:v12];
          goto LABEL_10;
        }
        p_super = PLSharedLibraryGetLog();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v29 = v11;
          __int16 v30 = 2112;
          v31 = v12;
          _os_log_impl(&dword_1A9AE7000, p_super, OS_LOG_TYPE_ERROR, "No invite address string for recipient: %@ contact: %@", buf, 0x16u);
        }
LABEL_11:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v17 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
      uint64_t v8 = v17;
    }
    while (v17);
  }

  v18 = [(PXSharedLibraryParticipantTableViewController *)self dataSourceManager];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __104__PXSharedLibraryParticipantTableViewController_photoRecipientViewController_didCompleteWithRecipients___block_invoke;
  v22[3] = &unk_1E5DD06F8;
  id v23 = v5;
  id v19 = v5;
  [v18 performChanges:v22];

  v20 = [(PXSharedLibraryParticipantTableViewController *)self delegate];
  [v20 dismissPresentedViewControllerAnimated:1 forSharedLibraryParticipantTableViewController:self];
}

uint64_t __104__PXSharedLibraryParticipantTableViewController_photoRecipientViewController_didCompleteWithRecipients___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addParticipants:*(void *)(a1 + 32)];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXSharedLibraryParticipantDataSourceManagerObservationContext != a5)
  {
    long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryParticipantTableViewController+iOS.m", 302, @"Invalid observation context in %s", "-[PXSharedLibraryParticipantTableViewController observable:didChange:context:]");

    abort();
  }
  uint64_t v10 = v9;
  if (v6)
  {
    v11 = [(PXSharedLibraryParticipantTableViewController *)self dataSourceManager];
    uint64_t v12 = [(PXSharedLibraryParticipantTableViewController *)self dataSource];
    uint64_t v13 = [v11 dataSource];
    v14 = [v11 changeDetailsFromDataSource:v12 toDataSource:v13];
    id v15 = [v14 itemChangesInSection:0];
    if ([v15 hasMoves])
    {
      long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantTableViewController+iOS.m", 273, @"Invalid parameter not satisfying: %@", @"itemChanges.hasMoves == NO" object file lineNumber description];
    }
    id v16 = [(PXSharedLibraryParticipantTableViewController *)self tableView];
    v31 = v16;
    if ([v15 hasIncrementalChanges])
    {
      v28 = [v15 insertedIndexes];
      uint64_t v17 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", v28, 0);
      long long v27 = [v15 removedIndexes];
      objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", v27, 0);
      v18 = v29 = v14;
      id v19 = [v15 changedIndexes];
      objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathsForItems:inSection:", v19, 0);
      v20 = __int16 v30 = v10;
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __78__PXSharedLibraryParticipantTableViewController_observable_didChange_context___block_invoke;
      v32[3] = &unk_1E5DC1F40;
      v32[4] = self;
      id v33 = v13;
      id v21 = v16;
      id v34 = v21;
      id v35 = v17;
      id v36 = v18;
      id v22 = v18;
      id v23 = v17;
      [v21 performBatchUpdates:v32 completion:0];
      [v21 reloadRowsAtIndexPaths:v20 withRowAnimation:5];

      v14 = v29;
      uint64_t v10 = v30;
    }
    else
    {
      if (![v15 hasAnyChanges]) {
        PXAssertGetLog();
      }
      [(PXSharedLibraryParticipantTableViewController *)self setDataSource:v13];
      [v16 reloadData];
    }
    int v24 = [v12 canAddParticipants];
    if (v24 != [v13 canAddParticipants]) {
      [(PXSharedLibraryParticipantTableViewController *)self _updateAddButton];
    }
  }
}

uint64_t __78__PXSharedLibraryParticipantTableViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDataSource:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) insertRowsAtIndexPaths:*(void *)(a1 + 56) withRowAnimation:4];
  v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 64);
  return [v2 deleteRowsAtIndexPaths:v3 withRowAnimation:3];
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  if (a4 == 1)
  {
    uint64_t v8 = [(PXSharedLibraryParticipantTableViewController *)self dataSourceManager];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __96__PXSharedLibraryParticipantTableViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
    v9[3] = &unk_1E5DD06F8;
    id v10 = v7;
    [v8 performChanges:v9];
  }
}

void __96__PXSharedLibraryParticipantTableViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "removeParticipantAtIndex:", objc_msgSend(v2, "row"));
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  if (objc_msgSend(a4, "section", a3)) {
    return 0;
  }
  else {
    return [(PXSharedLibraryParticipantTableViewController *)self isInteractionEnabled];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([v6 section] == 1)
  {
    [v7 deselectRowAtIndexPath:v6 animated:1];
    if ([(PXSharedLibraryParticipantTableViewController *)self canAddParticipants]) {
      [(PXSharedLibraryParticipantTableViewController *)self _handleAddRecipient];
    }
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  if (objc_msgSend(a4, "section", a3) != 1) {
    return 0;
  }
  return [(PXSharedLibraryParticipantTableViewController *)self canAddParticipants];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(PXSharedLibraryParticipantTableViewController *)self dataSource];
  uint64_t v10 = [v8 section];
  if (v10 != 1)
  {
    if (v10)
    {
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryParticipantTableViewController+iOS.m" lineNumber:201 description:@"Code which should be unreachable has been reached"];

      abort();
    }
    id v11 = [v7 dequeueReusableCellWithIdentifier:@"PXSharedLibraryParticipantTableViewCellReuseIdentifier" forIndexPath:v8];
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_5:
        uint64_t v12 = [v11 cellModel];
        uint64_t v13 = objc_msgSend(v9, "itemAtIndex:", objc_msgSend(v8, "row"));
        objc_msgSend(v7, "px_screenScale");
        objc_msgSend(v12, "configureForParticipant:displayScale:isRTL:", v13, objc_msgSend(v7, "px_hasRightToLeftLayoutDirection"), v14);
        [v11 setAccessibilityIdentifier:@"PXSharedLibraryParticipantTableViewCell"];

        goto LABEL_9;
      }
      id v19 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v25 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v25);
      long long v26 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
      [v19 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantTableViewController+iOS.m", 186, @"%@ should be an instance inheriting from %@, but it is %@", @"cell", v21, v26 object file lineNumber description];
    }
    else
    {
      id v19 = [MEMORY[0x1E4F28B00] currentHandler];
      v20 = (objc_class *)objc_opt_class();
      id v21 = NSStringFromClass(v20);
      [v19 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantTableViewController+iOS.m", 186, @"%@ should be an instance inheriting from %@, but it is nil", @"cell", v21 object file lineNumber description];
    }

    goto LABEL_5;
  }
  id v11 = [v7 dequeueReusableCellWithIdentifier:@"PXSharedLibraryParticipantAddTableViewCellReuseIdentifier" forIndexPath:v8];
  if (!v11)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    id v23 = (objc_class *)objc_opt_class();
    int v24 = NSStringFromClass(v23);
    [v22 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantTableViewController+iOS.m", 195, @"%@ should be an instance inheriting from %@, but it is nil", @"cell", v24 object file lineNumber description];
LABEL_17:

    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v27 = (objc_class *)objc_opt_class();
    int v24 = NSStringFromClass(v27);
    v28 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
    [v22 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantTableViewController+iOS.m", 195, @"%@ should be an instance inheriting from %@, but it is %@", @"cell", v24, v28 object file lineNumber description];

    goto LABEL_17;
  }
LABEL_8:
  BOOL v15 = [(PXSharedLibraryParticipantTableViewController *)self canAddParticipants];
  id v16 = [v11 addButton];
  [v16 setEnabled:v15];

  [v11 setAccessibilityIdentifier:@"PXSharedLibraryParticipantAddTableViewCell"];
LABEL_9:

  uint64_t v17 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v11 setBackgroundColor:v17];

  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    int64_t v8 = 1;
  }
  else if (a4)
  {
    int64_t v8 = 0;
  }
  else
  {
    id v7 = [(PXSharedLibraryParticipantTableViewController *)self dataSource];
    int64_t v8 = [v7 numberOfParticipants];
  }
  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (void)_handleAddRecipient
{
  id v10 = [(PXSharedLibraryParticipantTableViewController *)self delegate];
  id v3 = PXLocalizedSharedLibraryString(@"PXSharedLibrarySetupAssistant_Participants_AddPeople_Title");
  id v4 = PXLocalizedSharedLibraryString(@"PXSharedLibrarySetupAssistant_Participants_SearchLabel");
  id v5 = [(PXSharedLibraryParticipantTableViewController *)self dataSource];
  id v6 = [v5 participantAddresses];

  id v7 = [(PXSharedLibraryParticipantTableViewController *)self dataSource];
  uint64_t v8 = 5 - [v7 numberOfParticipants];

  id v9 = +[PXPhotoRecipientViewController recipientPickerViewControllerWithTitle:v3 doneLabel:0 toLabel:v4 usedAddresses:v6 maxRecipients:v8 delegate:self];
  [v10 presentViewController:v9 animated:1 forSharedLibraryParticipantTableViewController:self];
}

- (void)_updateAddButton
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:1];
  id v4 = [(PXSharedLibraryParticipantTableViewController *)self tableView];
  v6[0] = v3;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v4 reloadRowsAtIndexPaths:v5 withRowAnimation:5];
}

- (void)_updateTableViewHeight
{
  id v10 = [(PXSharedLibraryParticipantTableViewController *)self tableView];
  uint64_t v3 = [v10 numberOfRowsInSection:0];
  uint64_t v4 = [v10 numberOfRowsInSection:1] + v3;
  [v10 rowHeight];
  double v6 = fmax(v5, 0.0);
  [v10 sectionFooterHeight];
  double v8 = v7 + v6 * (double)v4;
  if (self->_tableViewHeight != v8)
  {
    self->_tableViewHeight = v8;
    id v9 = [(PXSharedLibraryParticipantTableViewController *)self delegate];
    [v9 sharedLibraryParticipantTableViewControllerDidChangeHeight:self];
  }
}

- (void)_updateRowHeight
{
}

- (BOOL)canAddParticipants
{
  BOOL v3 = [(PXSharedLibraryParticipantTableViewController *)self isInteractionEnabled];
  if (v3)
  {
    uint64_t v4 = [(PXSharedLibraryParticipantTableViewController *)self dataSource];
    char v5 = [v4 canAddParticipants];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setInteractionEnabled:(BOOL)a3
{
  if (self->_interactionEnabled != a3)
  {
    self->_interactionEnabled = a3;
    [(PXSharedLibraryParticipantTableViewController *)self _updateAddButton];
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryParticipantTableViewController;
  [(PXSharedLibraryParticipantTableViewController *)&v3 viewWillLayoutSubviews];
  [(PXSharedLibraryParticipantTableViewController *)self _updateRowHeight];
  [(PXSharedLibraryParticipantTableViewController *)self _updateTableViewHeight];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v5 = (id)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v5 setDataSource:self];
  [v5 setDelegate:self];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"PXSharedLibraryParticipantTableViewCellReuseIdentifier"];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"PXSharedLibraryParticipantAddTableViewCellReuseIdentifier"];
  [v5 setScrollEnabled:0];
  [v5 setSectionHeaderHeight:0.0];
  [v5 setSectionFooterHeight:15.0];
  [v5 _setTopPadding:0.0];
  [(PXSharedLibraryParticipantTableViewController *)self setView:v5];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
  [v5 addInteraction:v4];
}

- (PXSharedLibraryParticipantTableViewController)initWithDataSourceManager:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXSharedLibraryParticipantTableViewController+iOS.m", 71, @"Invalid parameter not satisfying: %@", @"dataSourceManager" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PXSharedLibraryParticipantTableViewController;
  double v7 = [(PXSharedLibraryParticipantTableViewController *)&v13 initWithNibName:0 bundle:0];
  double v8 = v7;
  if (v7)
  {
    v7->_interactionEnabled = 1;
    uint64_t v9 = [v6 dataSource];
    dataSource = v8->_dataSource;
    v8->_dataSource = (PXSharedLibraryParticipantDataSource *)v9;

    objc_storeStrong((id *)&v8->_dataSourceManager, a3);
    [(PXSectionedDataSourceManager *)v8->_dataSourceManager registerChangeObserver:v8 context:PXSharedLibraryParticipantDataSourceManagerObservationContext];
  }

  return v8;
}

@end