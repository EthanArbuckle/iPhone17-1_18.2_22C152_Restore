@interface PXComposeRecipientTableViewController
+ (id)contactViewControllerToPresentForRecipientViewController:(id)a3;
- (BOOL)_updateFooterHeight;
- (BOOL)_updateHeaderHeight;
- (BOOL)_updateRowHeight;
- (BOOL)isValidAddressForComposeRecipient:(id)a3;
- (PXComposeRecipientSelectionManager)selectionManager;
- (PXComposeRecipientTableViewController)init;
- (PXComposeRecipientTableViewController)initWithCoder:(id)a3;
- (PXComposeRecipientTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXComposeRecipientTableViewController)initWithStyle:(int64_t)a3;
- (PXComposeRecipientTableViewController)initWithViewModel:(id)a3;
- (PXComposeRecipientTableViewControllerDelegate)delegate;
- (PXComposeRecipientTableViewModel)viewModel;
- (PXComposeRecipientValidationManager)validationManager;
- (double)footerHeight;
- (double)headerHeight;
- (double)tableViewHeight;
- (id)_footerView;
- (id)_tableView:(id)a3 participantCellForRowAtIndexPath:(id)a4;
- (id)cellModelAtIndex:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_contactViewController:(id)a3 didSelectContact:(id)a4;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_dismissRecipientViewController:(id)a3;
- (void)_handleAddRecipient:(id)a3;
- (void)bootstrapPersonSuggestion:(id)a3 withContact:(id)a4;
- (void)composeRecipientDataSourceManager:(id)a3 didUpdateDataSourceWithChangeDetails:(id)a4;
- (void)composeRecipientSelectionManager:(id)a3 didUpdateSelectionSnapshotWithChangeDetails:(id)a4;
- (void)composeRecipientValidationManager:(id)a3 didUpdateValidationWithChangedIndexes:(id)a4;
- (void)configureCellModel:(id)a3 withComposeRecipient:(id)a4;
- (void)configureWithViewModel:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)loadView;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)photoRecipientViewController:(id)a3 didCompleteWithRecipients:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setFooterHeight:(double)a3;
- (void)setHeaderHeight:(double)a3;
- (void)setSelectionManager:(id)a3;
- (void)setTableViewHeight:(double)a3;
- (void)setValidationManager:(id)a3;
- (void)setViewModel:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateTableViewHeight;
- (void)viewWillLayoutSubviews;
@end

@implementation PXComposeRecipientTableViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationManager, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_addPeopleRecipientViewController, 0);
  objc_storeStrong((id *)&self->_indexPathForBootstrapping, 0);
  objc_storeStrong((id *)&self->_personSuggestionForBootstrapping, 0);
  objc_storeStrong((id *)&self->_bootstrapRecipientViewController, 0);
}

- (void)setFooterHeight:(double)a3
{
  self->_footerHeight = a3;
}

- (double)footerHeight
{
  return self->_footerHeight;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (void)setValidationManager:(id)a3
{
}

- (PXComposeRecipientValidationManager)validationManager
{
  return self->_validationManager;
}

- (void)setSelectionManager:(id)a3
{
}

- (PXComposeRecipientSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (void)setTableViewHeight:(double)a3
{
  self->_tableViewHeight = a3;
}

- (double)tableViewHeight
{
  return self->_tableViewHeight;
}

- (void)setDelegate:(id)a3
{
}

- (PXComposeRecipientTableViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXComposeRecipientTableViewControllerDelegate *)WeakRetained;
}

- (void)setViewModel:(id)a3
{
}

- (PXComposeRecipientTableViewModel)viewModel
{
  return self->_viewModel;
}

- (void)_contactViewController:(id)a3 didSelectContact:(id)a4
{
  id v11 = a4;
  if (v11)
  {
    v5 = self->_personSuggestionForBootstrapping;
    if (+[PXPeopleUtilities isGreenTeaAndContactsAccessDenied])
    {
      v6 = [[PXComposeRecipient alloc] initWithPersonSuggestion:v5 contact:v11];
      v7 = [(PXComposeRecipientTableViewModel *)self->_viewModel composeRecipientDataSourceManager];
      objc_msgSend(v7, "replaceComposeRecipientAtIndex:withNewComposeRecipient:", -[NSIndexPath row](self->_indexPathForBootstrapping, "row"), v6);
      v8 = [(PXComposeRecipientTableViewController *)self tableView];
      [v8 reloadData];
    }
    else
    {
      [(PXComposeRecipientTableViewController *)self bootstrapPersonSuggestion:v5 withContact:v11];
    }
  }
  personSuggestionForBootstrapping = self->_personSuggestionForBootstrapping;
  self->_personSuggestionForBootstrapping = 0;

  indexPathForBootstrapping = self->_indexPathForBootstrapping;
  self->_indexPathForBootstrapping = 0;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  [(PXComposeRecipientTableViewController *)self _contactViewController:a3 didSelectContact:a4];
  id v5 = [(PXComposeRecipientTableViewController *)self delegate];
  [v5 dismissPresentedViewControllerAnimated:1 forComposeRecipientTableViewController:self];
}

- (void)_dismissRecipientViewController:(id)a3
{
  id v5 = (PXPhotoRecipientViewController *)a3;
  id v11 = v5;
  if (self->_bootstrapRecipientViewController == v5)
  {
    self->_bootstrapRecipientViewController = 0;

    personSuggestionForBootstrapping = self->_personSuggestionForBootstrapping;
    self->_personSuggestionForBootstrapping = 0;

    p_indexPathForBootstrapping = &self->_indexPathForBootstrapping;
    indexPathForBootstrapping = self->_indexPathForBootstrapping;
  }
  else
  {
    p_indexPathForBootstrapping = &self->_addPeopleRecipientViewController;
    indexPathForBootstrapping = (NSIndexPath *)v5;
    if (self->_addPeopleRecipientViewController != v5)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"PXComposeRecipientTableViewController+iOS.m" lineNumber:503 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
  void *p_indexPathForBootstrapping = 0;

  v10 = [(PXComposeRecipientTableViewController *)self delegate];
  [v10 dismissPresentedViewControllerAnimated:1 forComposeRecipientTableViewController:self];
}

- (void)photoRecipientViewController:(id)a3 didCompleteWithRecipients:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v7 = (PXPhotoRecipientViewController *)a3;
  id v8 = a4;
  if (![v8 count]) {
    goto LABEL_16;
  }
  if (self->_bootstrapRecipientViewController == v7)
  {
    if ([v8 count] != 1)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, self, @"PXComposeRecipientTableViewController+iOS.m", 453, @"Invalid parameter not satisfying: %@", @"recipients.count == 1" object file lineNumber description];
    }
    id v11 = [v8 firstObject];
    v12 = self->_personSuggestionForBootstrapping;
    v13 = [v11 contact];
    BOOL v10 = v13 != 0;
    if (v13)
    {
      if (!+[PXPeopleUtilities isGreenTeaAndContactsAccessDenied])
      {
        [(PXComposeRecipientTableViewController *)self bootstrapPersonSuggestion:v12 withContact:v13];
        goto LABEL_14;
      }
      v14 = [[PXComposeRecipient alloc] initWithPersonSuggestion:v12 contact:v13];
      v15 = [(PXComposeRecipientTableViewModel *)self->_viewModel composeRecipientDataSourceManager];
      objc_msgSend(v15, "replaceComposeRecipientAtIndex:withNewComposeRecipient:", -[NSIndexPath row](self->_indexPathForBootstrapping, "row"), v14);
      v16 = [(PXComposeRecipientTableViewController *)self tableView];
      [v16 reloadData];
    }
    else
    {
      PLSharingGetLog();
      v14 = (PXComposeRecipient *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v26 = v12;
        __int16 v27 = 2112;
        v28 = v11;
        _os_log_impl(&dword_1A9AE7000, &v14->super, OS_LOG_TYPE_ERROR, "Failed to bootstrap Person Suggestion %@ with recipient %@ because of no associated contact", buf, 0x16u);
      }
    }

LABEL_14:
    goto LABEL_15;
  }
  if (self->_addPeopleRecipientViewController != v7)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"PXComposeRecipientTableViewController+iOS.m" lineNumber:475 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v9 = [(PXComposeRecipientTableViewModel *)self->_viewModel composeRecipientDataSourceManager];
  [v9 addRecipients:v8];

  BOOL v10 = 1;
LABEL_15:
  v17 = [(PXComposeRecipientTableViewModel *)self->_viewModel composeRecipientDataSourceManager];
  v18 = [v17 dataSource];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __96__PXComposeRecipientTableViewController_photoRecipientViewController_didCompleteWithRecipients___block_invoke;
  v22[3] = &unk_1E5DB9868;
  id v23 = v18;
  v24 = self;
  id v19 = v18;
  [v8 enumerateObjectsUsingBlock:v22];

  if (v10) {
LABEL_16:
  }
    [(PXComposeRecipientTableViewController *)self _dismissRecipientViewController:v7];
}

uint64_t __96__PXComposeRecipientTableViewController_photoRecipientViewController_didCompleteWithRecipients___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) indexOfComposeRecipientForRecipient:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = result;
    id v5 = *(void **)(*(void *)(a1 + 40) + 1088);
    return [v5 setSelectedState:1 atIndex:v4];
  }
  return result;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  BOOL v4 = [(PXComposeRecipientTableViewController *)self _updateHeaderHeight];
  BOOL v5 = [(PXComposeRecipientTableViewController *)self _updateFooterHeight];
  BOOL v6 = [(PXComposeRecipientTableViewController *)self _updateRowHeight];
  if (v4 || v5 || v6)
  {
    [(PXComposeRecipientTableViewController *)self updateTableViewHeight];
    id v7 = [(PXComposeRecipientTableViewController *)self tableView];
    [v7 reloadData];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)PXComposeRecipientTableViewModelObservationContext != a5) {
    goto LABEL_9;
  }
  id v13 = v8;
  if ((v6 & 0x20) != 0)
  {
    BOOL v9 = [(PXComposeRecipientTableViewController *)self _updateHeaderHeight];
    if ((v6 & 0x40) != 0) {
      goto LABEL_4;
    }
  }
  else
  {
    BOOL v9 = 0;
    if ((v6 & 0x40) != 0)
    {
LABEL_4:
      BOOL v10 = [(PXComposeRecipientTableViewController *)self _updateFooterHeight];
      goto LABEL_7;
    }
  }
  BOOL v10 = 0;
LABEL_7:
  int v11 = v9 || v10;
  id v8 = v13;
  if (v11 == 1)
  {
    [(PXComposeRecipientTableViewController *)self updateTableViewHeight];
    v12 = [(PXComposeRecipientTableViewController *)self tableView];
    [v12 reloadData];

    id v8 = v13;
  }
LABEL_9:
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    viewModel = self->_viewModel;
    id v7 = a5;
    id v9 = [(PXComposeRecipientTableViewModel *)viewModel composeRecipientDataSourceManager];
    uint64_t v8 = [v7 item];

    [v9 deleteComposeRecipientAtIndex:v8];
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return [(PXComposeRecipientTableViewModel *)self->_viewModel canDeleteRecipients];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v8 item];
  BOOL v10 = [(PXComposeRecipientTableViewModel *)self->_viewModel composeRecipientDataSourceManager];
  int v11 = [v10 dataSource];

  v12 = [v11 composeRecipients];
  if (v9 >= [v12 count])
  {
    [(PXComposeRecipientTableViewController *)self _handleAddRecipient:0];
  }
  else
  {
    SEL v48 = a2;
    id v13 = [v12 objectAtIndexedSubscript:v9];
    uint64_t v14 = [v13 recipient];
    uint64_t v15 = [v13 personSuggestion];
    v49 = (void *)v15;
    v50 = (void *)v14;
    if (v14)
    {
      v16 = self->_selectionManager;
      v17 = [(PXComposeRecipientSelectionManager *)v16 selectionSnapshot];
      v18 = [v17 selectedComposeRecipients];
      uint64_t v19 = [v18 containsObject:v13] ^ 1;

      [(PXComposeRecipientSelectionManager *)v16 setSelectedState:v19 atIndex:v9];
      v20 = [v7 cellForRowAtIndexPath:v8];

      v21 = [v20 cellModel];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __75__PXComposeRecipientTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v60[3] = &__block_descriptor_33_e51_v16__0___PXComposeRecipientMutableTableCellModel__8l;
      char v61 = v19;
      [v21 performChanges:v60];
    }
    else
    {
      v22 = (void *)v15;
      if (!v15)
      {
        v47 = [MEMORY[0x1E4F28B00] currentHandler];
        [v47 handleFailureInMethod:v48, self, @"PXComposeRecipientTableViewController+iOS.m", 329, @"Invalid parameter not satisfying: %@", @"personSuggestion" object file lineNumber description];
      }
      objc_storeStrong((id *)&self->_personSuggestionForBootstrapping, v22);
      objc_storeStrong((id *)&self->_indexPathForBootstrapping, a4);
      v17 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
      id v23 = (void *)MEMORY[0x1E4FB1410];
      v24 = PXLocalizedStringFromTable(@"PXComposeRecipientActionSheetCancelTitle", @"PhotosUICore");
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __75__PXComposeRecipientTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
      v59[3] = &unk_1E5DD0030;
      v59[4] = self;
      v25 = [v23 actionWithTitle:v24 style:1 handler:v59];
      [v17 addAction:v25];

      v26 = (void *)MEMORY[0x1E4FB1410];
      __int16 v27 = PXLocalizedStringFromTable(@"PXComposeRecipientActionSheetCreateNewContactTitle", @"PhotosUICore");
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __75__PXComposeRecipientTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_3;
      v55[3] = &unk_1E5DC5D50;
      id v28 = v22;
      id v56 = v28;
      v57 = self;
      SEL v58 = v48;
      uint64_t v29 = [v26 actionWithTitle:v27 style:0 handler:v55];
      [v17 addAction:v29];

      v30 = (void *)MEMORY[0x1E4FB1410];
      v31 = PXLocalizedStringFromTable(@"PXComposeRecipientActionSheetAddToExistingContactTitle", @"PhotosUICore");
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __75__PXComposeRecipientTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_4;
      v51[3] = &unk_1E5DC5D50;
      id v52 = v28;
      v53 = self;
      SEL v54 = v48;
      v32 = [v30 actionWithTitle:v31 style:0 handler:v51];
      [v17 addAction:v32];

      v33 = [v7 cellForRowAtIndexPath:v8];
      v34 = v33;
      if (v33)
      {
        v35 = [v33 popoverSourceView];
      }
      else
      {
        v35 = 0;
      }
      v36 = [v17 popoverPresentationController];
      [v36 setSourceView:v35];

      [v35 bounds];
      double v38 = v37;
      double v40 = v39;
      double v42 = v41;
      double v44 = v43;
      v45 = [v17 popoverPresentationController];
      objc_msgSend(v45, "setSourceRect:", v38, v40, v42, v44);

      v46 = [(PXComposeRecipientTableViewController *)self delegate];
      [v46 presentViewController:v17 animated:1 forComposeRecipientTableViewController:self];
    }
  }
  [v7 deselectRowAtIndexPath:v8 animated:1];
}

uint64_t __75__PXComposeRecipientTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setChecked:*(unsigned __int8 *)(a1 + 32)];
}

void __75__PXComposeRecipientTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 1032);
  *(void *)(v2 + 1032) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 1040);
  *(void *)(v4 + 1040) = 0;
}

void __75__PXComposeRecipientTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1B8F8];
  v3 = [*(id *)(a1 + 32) localizedName];
  id v7 = [v2 contactWithDisplayName:v3 emailOrPhoneNumber:0];

  uint64_t v4 = [MEMORY[0x1E4F1BBA8] viewControllerForNewContact:v7];
  if ((unint64_t)([MEMORY[0x1E4F1B980] authorizationStatusForEntityType:0] - 1) <= 1) {
    [v4 setDisplayMode:1];
  }
  [v4 setDelegate:*(void *)(a1 + 40)];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v4];
  [v5 setModalPresentationStyle:2];
  char v6 = [*(id *)(a1 + 40) delegate];
  [v6 presentViewController:v5 animated:1 forComposeRecipientTableViewController:*(void *)(a1 + 40)];
}

void __75__PXComposeRecipientTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [PXPhotoRecipientViewController alloc];
  v3 = [*(id *)(a1 + 32) localizedName];
  obj = [(PXPhotoRecipientViewController *)v2 initWithInitialLocalizedNameToQuery:v3];

  [(PXPhotoRecipientViewController *)obj setDelegate:*(void *)(a1 + 40)];
  uint64_t v4 = PXLocalizedStringFromTable(@"PXPhotoRecipientAddLabelTitle", @"PhotosUICore");
  [(PXPhotoRecipientViewController *)obj setToLabel:v4];

  [(PXPhotoRecipientViewController *)obj setMaxRecipients:1];
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 1024), obj);
  uint64_t v5 = [*(id *)(a1 + 32) localizedName];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v7 = PXLocalizedStringFromTable(@"PXComposeRecipientPickerBootstrapWithLocalizedNamePrompt", @"PhotosUICore");
    int v11 = [*(id *)(a1 + 32) localizedName];
    id v8 = PXLocalizedStringWithValidatedFormat(v7, @"%@");
  }
  else
  {
    id v8 = PXLocalizedStringFromTable(@"PXComposeRecipientPickerBootstrapPrompt", @"PhotosUICore");
  }
  -[PXPhotoRecipientViewController setTitle:](obj, "setTitle:", v8, v11);
  uint64_t v9 = +[PXComposeRecipientTableViewController contactViewControllerToPresentForRecipientViewController:obj];
  BOOL v10 = [*(id *)(a1 + 40) delegate];
  [v10 presentViewController:v9 animated:1 forComposeRecipientTableViewController:*(void *)(a1 + 40)];
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  uint64_t v5 = [(PXComposeRecipientTableViewController *)self _footerView];
  uint64_t v6 = [(PXComposeRecipientTableViewModel *)self->_viewModel footerTitle];
  _ConfigureFooterView(v5, v6);

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(PXComposeRecipientTableViewModel *)self->_viewModel headerTitle];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  viewModel = self->_viewModel;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(PXComposeRecipientTableViewModel *)viewModel composeRecipientDataSourceManager];
  BOOL v10 = [v9 dataSource];

  int v11 = [v10 composeRecipients];
  uint64_t v12 = [v11 count];

  if ([v7 item] >= v12) {
    [v8 dequeueReusableCellWithIdentifier:@"PXComposeRecipientAddRecipientTableViewCellReuseIdentifier" forIndexPath:v7];
  }
  else {
  id v13 = [(PXComposeRecipientTableViewController *)self _tableView:v8 participantCellForRowAtIndexPath:v7];
  }

  if ([(PXComposeRecipientTableViewModel *)self->_viewModel useGroupedBackgroundColor])
  {
    uint64_t v14 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [v13 setBackgroundColor:v14];
  }
  return v13;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v5 = [(PXComposeRecipientTableViewModel *)self->_viewModel composeRecipientDataSourceManager];
  uint64_t v6 = [v5 dataSource];

  id v7 = [v6 composeRecipients];
  uint64_t v8 = [v7 count];

  int64_t v9 = v8 + [(PXComposeRecipientTableViewModel *)self->_viewModel canAddRecipients];
  return v9;
}

- (id)_tableView:(id)a3 participantCellForRowAtIndexPath:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [a3 dequeueReusableCellWithIdentifier:@"PXComposeRecipientTableViewCellReuseIdentifier" forIndexPath:v7];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v19 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v19);
    v20 = objc_msgSend(v8, "px_descriptionForAssertionMessage");
    [v16 handleFailureInMethod:a2, self, @"PXComposeRecipientTableViewController+iOS.m", 242, @"%@ should be an instance inheriting from %@, but it is %@", @"[tableView dequeueReusableCellWithIdentifier:PXComposeRecipientTableViewCellReuseIdentifier forIndexPath:indexPath]", v18, v20 object file lineNumber description];
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v16 handleFailureInMethod:a2, self, @"PXComposeRecipientTableViewController+iOS.m", 242, @"%@ should be an instance inheriting from %@, but it is nil", @"[tableView dequeueReusableCellWithIdentifier:PXComposeRecipientTableViewCellReuseIdentifier forIndexPath:indexPath]", v18 object file lineNumber description];
  }

LABEL_3:
  int64_t v9 = [v8 cellModel];
  BOOL v10 = [(PXComposeRecipientTableViewModel *)self->_viewModel composeRecipientDataSourceManager];
  int v11 = [v10 dataSource];

  uint64_t v12 = [v11 composeRecipients];
  uint64_t v13 = [v7 item];

  uint64_t v14 = [v12 objectAtIndexedSubscript:v13];

  [(PXComposeRecipientTableViewController *)self configureCellModel:v9 withComposeRecipient:v14];
  return v8;
}

- (BOOL)_updateFooterHeight
{
  v3 = [(PXComposeRecipientTableViewController *)self _footerView];
  uint64_t v4 = [v3 superview];

  if (!v4)
  {
    uint64_t v5 = [(PXComposeRecipientTableViewController *)self tableView];
    [v5 frame];
    objc_msgSend(v3, "setFrame:", 0.0, 0.0);
  }
  uint64_t v6 = [(PXComposeRecipientTableViewModel *)self->_viewModel footerTitle];
  _ConfigureFooterView(v3, v6);

  id v7 = v3;
  [v7 frame];
  double v8 = 0.0;
  if (v9 > 0.0)
  {
    BOOL v10 = [v7 textLabel];
    int v11 = [v10 text];
    uint64_t v12 = [v11 length];

    if (v12)
    {
      [v7 layoutIfNeeded];
      [v10 bounds];
      objc_msgSend(v10, "sizeThatFits:", v13, 1.79769313e308);
      double v8 = v14 + 16.0;
    }
  }
  [(PXComposeRecipientTableViewController *)self footerHeight];
  double v16 = v15;
  if (v15 != v8) {
    [(PXComposeRecipientTableViewController *)self setFooterHeight:v8];
  }

  return v16 != v8;
}

- (id)_footerView
{
  footerView = self->_footerView;
  if (!footerView)
  {
    uint64_t v4 = (UITableViewHeaderFooterView *)objc_alloc_init(MEMORY[0x1E4FB1D30]);
    uint64_t v5 = self->_footerView;
    self->_footerView = v4;

    footerView = self->_footerView;
  }
  return footerView;
}

- (BOOL)_updateHeaderHeight
{
  if (_updateHeaderHeight_onceToken != -1) {
    dispatch_once(&_updateHeaderHeight_onceToken, &__block_literal_global_101570);
  }
  v3 = [(PXComposeRecipientTableViewModel *)self->_viewModel headerTitle];
  [(id)_updateHeaderHeight_measuringLabel setText:v3];

  PXCappedFontWithTextStyle();
}

uint64_t __60__PXComposeRecipientTableViewController__updateHeaderHeight__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  v1 = (void *)_updateHeaderHeight_measuringLabel;
  _updateHeaderHeight_measuringLabel = (uint64_t)v0;

  uint64_t v2 = (void *)_updateHeaderHeight_measuringLabel;
  return [v2 setNumberOfLines:0];
}

- (BOOL)_updateRowHeight
{
}

- (void)viewWillLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PXComposeRecipientTableViewController;
  [(PXComposeRecipientTableViewController *)&v6 viewWillLayoutSubviews];
  BOOL v3 = [(PXComposeRecipientTableViewController *)self _updateHeaderHeight];
  BOOL v4 = [(PXComposeRecipientTableViewController *)self _updateFooterHeight];
  if (v3 || v4)
  {
    [(PXComposeRecipientTableViewController *)self updateTableViewHeight];
    uint64_t v5 = [(PXComposeRecipientTableViewController *)self tableView];
    [v5 reloadData];
  }
}

- (void)_handleAddRecipient:(id)a3
{
  BOOL v4 = objc_alloc_init(PXPhotoRecipientViewController);
  uint64_t v5 = PXLocalizedStringFromTable(@"PXPhotoRecipientAddLabelTitle", @"PhotosUICore");
  [(PXPhotoRecipientViewController *)v4 setToLabel:v5];

  objc_super v6 = PXLocalizedStringFromTable(@"PXComposeRecipientAddPeople", @"PhotosUICore");
  [(PXPhotoRecipientViewController *)v4 setTitle:v6];

  [(PXPhotoRecipientViewController *)v4 setDelegate:self];
  addPeopleRecipientViewController = self->_addPeopleRecipientViewController;
  self->_addPeopleRecipientViewController = v4;
  double v8 = v4;

  id v10 = [(PXComposeRecipientTableViewController *)self delegate];
  double v9 = +[PXComposeRecipientTableViewController contactViewControllerToPresentForRecipientViewController:v8];

  [v10 presentViewController:v9 animated:1 forComposeRecipientTableViewController:self];
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v5 = (id)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v5 setDataSource:self];
  [v5 setDelegate:self];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"PXComposeRecipientTableViewCellReuseIdentifier"];
  [v5 registerClass:objc_opt_class() forCellReuseIdentifier:@"PXComposeRecipientAddRecipientTableViewCellReuseIdentifier"];
  [(PXComposeRecipientTableViewController *)self setView:v5];
  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

  [(PXComposeRecipientTableViewController *)self _updateHeaderHeight];
  [(PXComposeRecipientTableViewController *)self _updateFooterHeight];
  [(PXComposeRecipientTableViewController *)self _updateRowHeight];
  [(PXComposeRecipientTableViewController *)self updateTableViewHeight];
}

- (PXComposeRecipientTableViewController)initWithViewModel:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXComposeRecipientTableViewController+iOS.m", 90, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)PXComposeRecipientTableViewController;
  objc_super v6 = [(PXComposeRecipientTableViewController *)&v10 initWithNibName:0 bundle:0];
  id v7 = v6;
  if (v6) {
    [(PXComposeRecipientTableViewController *)v6 configureWithViewModel:v5];
  }

  return v7;
}

- (PXComposeRecipientTableViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  objc_super v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXComposeRecipientTableViewController+iOS.m", 86, @"%s is not available as initializer", "-[PXComposeRecipientTableViewController initWithCoder:]");

  abort();
}

- (PXComposeRecipientTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXComposeRecipientTableViewController+iOS.m", 82, @"%s is not available as initializer", "-[PXComposeRecipientTableViewController initWithNibName:bundle:]");

  abort();
}

- (PXComposeRecipientTableViewController)initWithStyle:(int64_t)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXComposeRecipientTableViewController+iOS.m", 78, @"%s is not available as initializer", "-[PXComposeRecipientTableViewController initWithStyle:]");

  abort();
}

- (PXComposeRecipientTableViewController)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXComposeRecipientTableViewController+iOS.m", 74, @"%s is not available as initializer", "-[PXComposeRecipientTableViewController init]");

  abort();
}

+ (id)contactViewControllerToPresentForRecipientViewController:(id)a3
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
    objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    [v4 setDisplayedPropertyKeys:v6];
    [v4 setAllowsEditing:1];
    id v7 = PXLocalizedStringFromTable(@"PXComposeRecipientPickerBootstrapPrompt", @"PhotosUICore");
    [v4 setPrompt:v7];
    id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(emailAddresses.@count == 1 AND phoneNumbers.@count == 0) OR (emailAddresses.@count == 0 AND phoneNumbers.@count == 1)"];
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

- (void)composeRecipientValidationManager:(id)a3 didUpdateValidationWithChangedIndexes:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __123__PXComposeRecipientTableViewController_Internal__composeRecipientValidationManager_didUpdateValidationWithChangedIndexes___block_invoke;
  v4[3] = &unk_1E5DD3010;
  v4[4] = self;
  [a4 enumerateIndexesUsingBlock:v4];
}

void __123__PXComposeRecipientTableViewController_Internal__composeRecipientValidationManager_didUpdateValidationWithChangedIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) viewModel];
  uint64_t v5 = [v4 composeRecipientDataSourceManager];
  objc_super v6 = [v5 dataSource];

  id v7 = [v6 composeRecipients];
  id v8 = [v7 objectAtIndexedSubscript:a2];

  LOBYTE(v7) = [*(id *)(a1 + 32) isValidAddressForComposeRecipient:v8];
  double v9 = [*(id *)(a1 + 32) cellModelAtIndex:a2];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __123__PXComposeRecipientTableViewController_Internal__composeRecipientValidationManager_didUpdateValidationWithChangedIndexes___block_invoke_2;
  void v10[3] = &__block_descriptor_33_e51_v16__0___PXComposeRecipientMutableTableCellModel__8l;
  char v11 = (char)v7;
  [v9 performChanges:v10];
}

uint64_t __123__PXComposeRecipientTableViewController_Internal__composeRecipientValidationManager_didUpdateValidationWithChangedIndexes___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setIsValidAddress:*(unsigned __int8 *)(a1 + 32)];
}

- (void)composeRecipientDataSourceManager:(id)a3 didUpdateDataSourceWithChangeDetails:(id)a4
{
  id v6 = a4;
  id v10 = [a3 dataSource];
  id v7 = [(PXComposeRecipientTableViewController *)self selectionManager];
  [v7 setDataSource:v10 changeDetails:v6];

  id v8 = [(PXComposeRecipientTableViewController *)self validationManager];
  [v8 setDataSource:v10 changeDetails:v6];

  double v9 = [(PXComposeRecipientTableViewController *)self tableView];
  [v9 reloadData];

  [(PXComposeRecipientTableViewController *)self updateTableViewHeight];
}

- (void)composeRecipientSelectionManager:(id)a3 didUpdateSelectionSnapshotWithChangeDetails:(id)a4
{
  uint64_t v5 = [a3 selectionSnapshot];
  id v6 = [v5 selectedComposeRecipients];
  id v7 = [(PXComposeRecipientTableViewController *)self viewModel];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __128__PXComposeRecipientTableViewController_Internal__composeRecipientSelectionManager_didUpdateSelectionSnapshotWithChangeDetails___block_invoke;
  v17[3] = &unk_1E5DBF9A0;
  id v18 = v5;
  id v8 = v6;
  id v19 = v8;
  id v9 = v5;
  [v7 performChanges:v17];
  id v10 = [v7 composeRecipientDataSourceManager];
  char v11 = [v10 dataSource];

  uint64_t v12 = [v11 composeRecipients];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __128__PXComposeRecipientTableViewController_Internal__composeRecipientSelectionManager_didUpdateSelectionSnapshotWithChangeDetails___block_invoke_2;
  v14[3] = &unk_1E5DBFA60;
  id v15 = v8;
  double v16 = self;
  id v13 = v8;
  [v12 enumerateObjectsUsingBlock:v14];
}

void __128__PXComposeRecipientTableViewController_Internal__composeRecipientSelectionManager_didUpdateSelectionSnapshotWithChangeDetails___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v5 = a2;
  id v4 = [v3 selectedRecipients];
  [v5 setRecipients:v4];

  [v5 setComposeRecipients:*(void *)(a1 + 40)];
}

void __128__PXComposeRecipientTableViewController_Internal__composeRecipientSelectionManager_didUpdateSelectionSnapshotWithChangeDetails___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5 = [*(id *)(a1 + 32) containsObject:a2];
  id v6 = [*(id *)(a1 + 40) cellModelAtIndex:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __128__PXComposeRecipientTableViewController_Internal__composeRecipientSelectionManager_didUpdateSelectionSnapshotWithChangeDetails___block_invoke_3;
  v7[3] = &__block_descriptor_33_e51_v16__0___PXComposeRecipientMutableTableCellModel__8l;
  char v8 = v5;
  [v6 performChanges:v7];
}

uint64_t __128__PXComposeRecipientTableViewController_Internal__composeRecipientSelectionManager_didUpdateSelectionSnapshotWithChangeDetails___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setChecked:*(unsigned __int8 *)(a1 + 32)];
}

- (void)updateTableViewHeight
{
  id v3 = [(PXComposeRecipientTableViewController *)self tableView];
  uint64_t v4 = [(PXComposeRecipientTableViewController *)self tableView:v3 numberOfRowsInSection:0];

  [(PXComposeRecipientTableViewController *)self headerHeight];
  double v6 = v5;
  id v7 = [(PXComposeRecipientTableViewController *)self tableView];
  [v7 rowHeight];
  double v9 = v6 + fmax(v8, 0.0) * (double)v4;
  [(PXComposeRecipientTableViewController *)self footerHeight];
  double v11 = v10 + v9;

  [(PXComposeRecipientTableViewController *)self tableViewHeight];
  if (v12 != v11)
  {
    [(PXComposeRecipientTableViewController *)self setTableViewHeight:v11];
    uint64_t v13 = [(PXComposeRecipientTableViewController *)self delegate];
    double v14 = (void *)v13;
    if (v13)
    {
      double v16 = (void *)v13;
      char v15 = objc_opt_respondsToSelector();
      double v14 = v16;
      if (v15)
      {
        [v16 composeRecipientTableViewControllerDidChangeHeight:self];
        double v14 = v16;
      }
    }
  }
}

- (void)bootstrapPersonSuggestion:(id)a3 withContact:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v9 = v8;
  if (v7)
  {
    if (v8)
    {
LABEL_3:
      id v17 = 0;
      double v10 = v7;
      double v11 = v9;
      goto LABEL_4;
    }
  }
  else
  {
    char v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXComposeRecipientTableViewController+Internal.m", 163, @"Invalid parameter not satisfying: %@", @"personSuggestion" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  double v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PXComposeRecipientTableViewController+Internal.m", 164, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];

  id v17 = 0;
  double v10 = v7;
  double v11 = 0;
LABEL_4:
  char v12 = PXBootstrapPersonSuggestionWithContact(v10, v11, (uint64_t)&v17);
  id v13 = v17;
  if ((v12 & 1) == 0)
  {
    double v14 = PLSharingGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v19 = v7;
      __int16 v20 = 2112;
      v21 = v9;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "Failed to bootstrap Person Suggestion %@ with Contact %@ because of error: %@", buf, 0x20u);
    }
  }
}

- (void)configureCellModel:(id)a3 withComposeRecipient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  double v9 = v8;
  v45 = v7;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    double v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"PXComposeRecipientTableViewController+Internal.m", 97, @"Invalid parameter not satisfying: %@", @"cellModel" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  double v41 = [MEMORY[0x1E4F28B00] currentHandler];
  [v41 handleFailureInMethod:a2, self, @"PXComposeRecipientTableViewController+Internal.m", 98, @"Invalid parameter not satisfying: %@", @"composeRecipient" object file lineNumber description];

LABEL_3:
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = __Block_byref_object_copy__151811;
  v68[4] = __Block_byref_object_dispose__151812;
  id v69 = 0;
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x2020000000;
  uint64_t v67 = -1;
  double v10 = [v9 recipient];
  double v43 = [(PXComposeRecipientTableViewController *)self viewModel];
  double v11 = [v9 personSuggestion];
  char v12 = v11;
  if (v11)
  {
    double v44 = [v11 localizedName];
    id v13 = [(PXComposeRecipientTableViewController *)self traitCollection];
    [v13 displayScale];
    double v15 = v14;

    uint64_t v60 = 0;
    char v61 = &v60;
    uint64_t v62 = 0x2020000000;
    char v63 = 1;
    double v16 = [v43 peopleSuggestionsMediaProvider];
    +[PXComposeRecipientTableCellModel imageDiameter];
    double v18 = v17;
    +[PXComposeRecipientTableCellModel imageDiameter];
    double v20 = v19;
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __91__PXComposeRecipientTableViewController_Internal__configureCellModel_withComposeRecipient___block_invoke;
    v55[3] = &unk_1E5DBF9F0;
    v57 = &v60;
    SEL v58 = v68;
    v59 = &v64;
    id v56 = v45;
    int v21 = objc_msgSend(v16, "requestImageForPersonSuggestion:targetSize:displayScale:cropFactor:cornerStyle:resultHandler:", v12, 0, 0, v55, v18, v20, v15);
    v65[3] = v21;
    *((unsigned char *)v61 + 24) = 0;

    _Block_object_dispose(&v60, 8);
    double v42 = 0;
  }
  else
  {
    double v42 = [v10 contact];
    double v44 = 0;
  }
  __int16 v22 = [v10 suggestedTransport];
  id v23 = [v22 address];
  if ([v23 length]) {
    BOOL v24 = [(PXComposeRecipientTableViewController *)self isValidAddressForComposeRecipient:v9];
  }
  else {
    BOOL v24 = 0;
  }
  uint64_t v25 = [v10 localizedName];
  v26 = (void *)v25;
  __int16 v27 = v44;
  if (v25) {
    __int16 v27 = (void *)v25;
  }
  id v28 = v27;

  if (v28 && [v28 length]
    || (PXLocalizedStringFromTable(@"PXComposeRecipientTableViewMissingLocalizedNameMessage", @"PhotosUICore"), uint64_t v29 = objc_claimAutoreleasedReturnValue(), v28, (v28 = (id)v29) != 0))
  {
    id v28 = v28;
    id v30 = v23;
    v31 = v30;
    if (v28 == v30)
    {
    }
    else
    {
      int v32 = [v28 isEqualToString:v30];

      if (!v32) {
        goto LABEL_19;
      }
    }

    id v28 = 0;
  }
LABEL_19:
  v33 = [(PXComposeRecipientTableViewController *)self selectionManager];
  v34 = [v33 selectionSnapshot];

  v35 = [v34 selectedComposeRecipients];
  LOBYTE(v33) = [v35 containsObject:v9];

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __91__PXComposeRecipientTableViewController_Internal__configureCellModel_withComposeRecipient___block_invoke_4;
  v46[3] = &unk_1E5DBFA18;
  v51 = v68;
  id v52 = &v64;
  id v36 = v28;
  id v47 = v36;
  id v37 = v23;
  id v48 = v37;
  BOOL v53 = v24;
  char v54 = (char)v33;
  id v38 = v43;
  id v49 = v38;
  id v39 = v42;
  id v50 = v39;
  [v45 performChanges:v46];

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(v68, 8);
}

void __91__PXComposeRecipientTableViewController_Internal__configureCellModel_withComposeRecipient___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  double v5 = v4;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v4;
    *(id *)(a1 + 32);
    px_dispatch_on_main_queue();
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
}

void __91__PXComposeRecipientTableViewController_Internal__configureCellModel_withComposeRecipient___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v4 = a2;
  [v4 setImage:v3];
  [v4 setImageRequestID:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  [v4 setName:*(void *)(a1 + 32)];
  [v4 setAddress:*(void *)(a1 + 40)];
  [v4 setIsValidAddress:*(unsigned __int8 *)(a1 + 80)];
  [v4 setChecked:*(unsigned __int8 *)(a1 + 81)];
  objc_msgSend(v4, "setShowsCheckbox:", objc_msgSend(*(id *)(a1 + 48), "canSelectRecipients"));
  [v4 setContact:*(void *)(a1 + 56)];
}

void __91__PXComposeRecipientTableViewController_Internal__configureCellModel_withComposeRecipient___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v2 == [*(id *)(a1 + 40) imageRequestID])
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __91__PXComposeRecipientTableViewController_Internal__configureCellModel_withComposeRecipient___block_invoke_3;
      v4[3] = &unk_1E5DBF9C8;
      uint64_t v3 = *(void **)(a1 + 40);
      id v5 = *(id *)(a1 + 32);
      [v3 performChanges:v4];
    }
  }
}

uint64_t __91__PXComposeRecipientTableViewController_Internal__configureCellModel_withComposeRecipient___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setImage:*(void *)(a1 + 32)];
}

- (id)cellModelAtIndex:(unint64_t)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F28D58], "px_indexPathForItem:inSection:", a3, 0);
  id v5 = [(PXComposeRecipientTableViewController *)self tableView];
  double v6 = [v5 cellForRowAtIndexPath:v4];

  id v7 = [v6 cellModel];

  return v7;
}

- (BOOL)isValidAddressForComposeRecipient:(id)a3
{
  id v4 = a3;
  id v5 = [(PXComposeRecipientTableViewController *)self validationManager];
  uint64_t v6 = [v5 validationTypeForComposeRecipient:v4];

  return v6 == 1;
}

- (void)configureWithViewModel:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXComposeRecipientTableViewController+Internal.m", 39, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];
  }
  [(PXComposeRecipientTableViewController *)self setViewModel:v5];
  [v5 registerChangeObserver:self context:PXComposeRecipientTableViewModelObservationContext];
  uint64_t v6 = [v5 composeRecipientDataSourceManager];
  id v7 = [v5 recipients];
  [v6 addRecipients:v7];

  [v6 setDelegate:self];
  id v8 = [v6 dataSource];
  double v9 = [[PXComposeRecipientSelectionManager alloc] initWithDataSource:v8];
  [(PXComposeRecipientSelectionManager *)v9 selectAll];
  [(PXComposeRecipientSelectionManager *)v9 setDelegate:self];
  [(PXComposeRecipientTableViewController *)self setSelectionManager:v9];
  double v10 = [(PXComposeRecipientSelectionManager *)v9 selectionSnapshot];
  double v11 = [v10 selectedComposeRecipients];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__PXComposeRecipientTableViewController_Internal__configureWithViewModel___block_invoke;
  v16[3] = &unk_1E5DBF9A0;
  id v17 = v10;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  [v5 performChanges:v16];
  double v14 = [[PXComposeRecipientValidationManager alloc] initWithDataSource:v8];
  [(PXComposeRecipientValidationManager *)v14 setDelegate:self];
  [(PXComposeRecipientTableViewController *)self setValidationManager:v14];
}

void __74__PXComposeRecipientTableViewController_Internal__configureWithViewModel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v9 = a2;
  uint64_t v4 = [v3 selectedRecipients];
  id v5 = (void *)v4;
  uint64_t v6 = MEMORY[0x1E4F1CBF0];
  if (v4) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
  }
  [v9 setRecipients:v7];

  if (*(void *)(a1 + 40)) {
    uint64_t v8 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v8 = v6;
  }
  [v9 setComposeRecipients:v8];
}

@end