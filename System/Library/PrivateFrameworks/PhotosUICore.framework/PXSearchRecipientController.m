@interface PXSearchRecipientController
- (BOOL)_searchHasNoResultsFound;
- (CNAutocompleteResultsTableViewController)_searchResultsTableViewController;
- (CNComposeRecipient)suggestedRecipientBeingViewed;
- (CNContactViewController)_contactViewController;
- (PXRecipientSearchDataSource)_searchDataSource;
- (PXRecipientSearchDataSourceManager)searchDataSourceManager;
- (PXSearchRecipientController)initWithSearchDataSourceManager:(id)a3;
- (PXSearchRecipientControllerDelegate)delegate;
- (UIView)searchResultsView;
- (id)_contactViewControllerForRecipient:(id)a3;
- (id)_validationTextColorForSearchResult:(id)a3;
- (int64_t)searchState;
- (unint64_t)numberOfSearchRecipients;
- (void)_removeRecent;
- (void)_setSearchDataSource:(id)a3;
- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4;
- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5;
- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5;
- (void)disambiguateRecipient:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setDelegate:(id)a3;
- (void)setNumberOfSearchRecipients:(unint64_t)a3;
- (void)setSearchState:(int64_t)a3;
- (void)setSuggestedRecipientBeingViewed:(id)a3;
- (void)set_contactViewController:(id)a3;
@end

@implementation PXSearchRecipientController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__contactViewController);
  objc_storeStrong((id *)&self->_suggestedRecipientBeingViewed, 0);
  objc_storeStrong((id *)&self->__searchResultsTableViewController, 0);
  objc_storeStrong((id *)&self->__searchDataSource, 0);
  objc_storeStrong((id *)&self->_searchDataSourceManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)set_contactViewController:(id)a3
{
}

- (CNContactViewController)_contactViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__contactViewController);
  return (CNContactViewController *)WeakRetained;
}

- (void)setSuggestedRecipientBeingViewed:(id)a3
{
}

- (CNComposeRecipient)suggestedRecipientBeingViewed
{
  return self->_suggestedRecipientBeingViewed;
}

- (CNAutocompleteResultsTableViewController)_searchResultsTableViewController
{
  return self->__searchResultsTableViewController;
}

- (PXRecipientSearchDataSource)_searchDataSource
{
  return self->__searchDataSource;
}

- (unint64_t)numberOfSearchRecipients
{
  return self->_numberOfSearchRecipients;
}

- (int64_t)searchState
{
  return self->_searchState;
}

- (PXRecipientSearchDataSourceManager)searchDataSourceManager
{
  return self->_searchDataSourceManager;
}

- (PXSearchRecipientControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSearchRecipientControllerDelegate *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXSearchDataSourceManagerContext != a5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXSearchRecipientController.m" lineNumber:270 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  id v12 = v9;
  if (v6)
  {
    v10 = [(PXSectionedDataSourceManager *)self->_searchDataSourceManager dataSource];
    [(PXSearchRecipientController *)self _setSearchDataSource:v10];

    id v9 = v12;
  }
  if ((v6 & 2) != 0)
  {
    [(PXSearchRecipientController *)self setSearchState:[(PXRecipientSearchDataSourceManager *)self->_searchDataSourceManager searchState] == 1];
    id v9 = v12;
  }
}

- (void)_removeRecent
{
  v4 = [(PXSearchRecipientController *)self _searchResultsTableViewController];
  v5 = [(PXSearchRecipientController *)self suggestedRecipientBeingViewed];
  [v4 invalidateSearchResultRecipient:v5];

  v18 = self->_searchDataSourceManager;
  if (v18)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v16);
    v17 = [(PXRecipientSearchDataSourceManager *)v18 px_descriptionForAssertionMessage];
    [v13 handleFailureInMethod:a2, self, @"PXSearchRecipientController.m", 244, @"%@ should be an instance inheriting from %@, but it is %@", @"_searchDataSourceManager", v15, v17 object file lineNumber description];
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v13 handleFailureInMethod:a2, self, @"PXSearchRecipientController.m", 244, @"%@ should be an instance inheriting from %@, but it is nil", @"_searchDataSourceManager", v15 object file lineNumber description];
  }

LABEL_3:
  char v6 = [(PXSearchRecipientController *)self suggestedRecipientBeingViewed];
  [(PXRecipientSearchDataSourceManager *)v18 removeRecipientResult:v6];

  [(PXSearchRecipientController *)self setSuggestedRecipientBeingViewed:0];
  v7 = [(PXSearchRecipientController *)self _contactViewController];
  v8 = [v7 navigationController];

  id v9 = [(PXSearchRecipientController *)self _contactViewController];
  v10 = v9;
  if (v8)
  {
    v11 = [v9 navigationController];
    id v12 = (id)[v11 popViewControllerAnimated:1];
  }
  else
  {
    v11 = [v9 presentingViewController];
    [v11 dismissViewControllerAnimated:1 completion:0];
  }

  [(PXSearchRecipientController *)self set_contactViewController:0];
}

- (id)_contactViewControllerForRecipient:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 contact];
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    char v6 = [v3 uncommentedAddress];
    v7 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:*MEMORY[0x1E4F1B700] value:v6];
    v16[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v5 setEmailAddresses:v8];

    v4 = (void *)[v5 copy];
  }
  if ([v4 isUnknown]) {
    [MEMORY[0x1E4F1BBA8] viewControllerForUnknownContact:v4];
  }
  else {
  id v9 = [MEMORY[0x1E4F1BBA8] viewControllerForContact:v4];
  }
  uint64_t v10 = *MEMORY[0x1E4F1ADC8];
  v15[0] = *MEMORY[0x1E4F1AEE0];
  v15[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  [v9 setDisplayedPropertyKeys:v11];

  [v9 setAllowsActions:0];
  [v9 setAllowsEditing:0];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1B990]);
  [v12 setIncludeLocalContacts:1];
  [v12 setIncludeSuggestedContacts:1];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v12];
  [v9 setContactStore:v13];

  return v9;
}

- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4
{
  id v13 = a4;
  id v5 = [(PXSearchRecipientController *)self _contactViewControllerForRecipient:v13];
  if ([v13 isRemovableFromSearchResults])
  {
    char v6 = [v5 contentViewController];
    v7 = PXLocalizedStringFromTable(@"PXComposeRecipientRemoveRecentSuggestionButtonTitle", @"PhotosUICore");
    v8 = [v6 cardFooterGroup];
    [v6 addActionWithTitle:v7 target:self selector:sel__removeRecent inGroup:v8 destructive:1];
  }
  [(PXSearchRecipientController *)self setSuggestedRecipientBeingViewed:v13];
  [(PXSearchRecipientController *)self set_contactViewController:v5];
  id v9 = [(PXSearchRecipientController *)self delegate];
  uint64_t v10 = [v9 viewControllerForPresentingContactViewControllerBySearchRecipientController:self];

  v11 = [v10 navigationController];
  id v12 = [v10 navigationController];

  if (v12) {
    [v11 pushViewController:v5 animated:1];
  }
  else {
    [v10 presentViewController:v5 animated:1 completion:0];
  }
}

- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, void *))a5;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__12966;
  v28 = __Block_byref_object_dispose__12967;
  id v29 = 0;
  id v12 = [(PXSearchRecipientController *)self _searchDataSource];
  id v13 = v12;
  if (v12) {
    [v12 firstItemIndexPath];
  }
  else {
    memset(v23, 0, sizeof(v23));
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __94__PXSearchRecipientController_autocompleteResultsController_tintColorForRecipient_completion___block_invoke;
  v17[3] = &unk_1E5DB0168;
  id v14 = v13;
  SEL v22 = a2;
  id v18 = v14;
  v19 = self;
  id v15 = v10;
  id v20 = v15;
  v21 = &v24;
  [v14 enumerateItemIndexPathsStartingAtIndexPath:v23 reverseDirection:0 usingBlock:v17];
  if (v25[5])
  {
    v16 = -[PXSearchRecipientController _validationTextColorForSearchResult:](self, "_validationTextColorForSearchResult:");
    v11[2](v11, v16);
  }
  _Block_object_dispose(&v24, 8);
}

void __94__PXSearchRecipientController_autocompleteResultsController_tintColorForRecipient_completion___block_invoke(uint64_t a1, _OWORD *a2, unsigned char *a3)
{
  id v5 = *(void **)(a1 + 32);
  long long v6 = a2[1];
  v19[0] = *a2;
  v19[1] = v6;
  v7 = [v5 recipientSearchResultAtSimpleIndexPath:v19];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = *(void *)(a1 + 64);
    uint64_t v16 = *(void *)(a1 + 40);
    v17 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v17);
    id v18 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v10 handleFailureInMethod:v15, v16, @"PXSearchRecipientController.m", 174, @"%@ should be an instance inheriting from %@, but it is %@", @"[searchDataSource recipientSearchResultAtSimpleIndexPath:indexPath]", v14, v18 object file lineNumber description];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    [v10 handleFailureInMethod:v11, v12, @"PXSearchRecipientController.m", 174, @"%@ should be an instance inheriting from %@, but it is nil", @"[searchDataSource recipientSearchResultAtSimpleIndexPath:indexPath]", v14 object file lineNumber description];
  }

LABEL_3:
  v8 = [v7 recipient];
  int v9 = PXComposeRecipientEqualToComposeRecipient(v8, *(void **)(a1 + 48));

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v7);
    *a3 = 1;
  }
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  id v6 = a4;
  v7 = [(PXCNComposeRecipient *)[PXCNRecipientSearchResult alloc] initWithRecipient:v6];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v10 = v7;

    v8 = v10;
    if (v10)
    {
      if (self->_delegateRespondsTo.didSelectRecipient)
      {
        int v9 = [(PXSearchRecipientController *)self delegate];
        [v9 searchRecipientController:self didSelectRecipient:v10];
      }
      [(PXRecipientSearchDataSourceManager *)self->_searchDataSourceManager setQueryString:&stru_1F00B0030];
      v8 = v10;
    }
  }
  else
  {

    v8 = 0;
  }
}

- (id)_validationTextColorForSearchResult:(id)a3
{
  uint64_t v3 = [a3 validationType];
  if (v3)
  {
    if (v3 == 2)
    {
      v4 = [MEMORY[0x1E4FB1618] systemGreenColor];
    }
    else if (v3 == 1)
    {
      v4 = [MEMORY[0x1E4FB1618] systemBlueColor];
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  return v4;
}

- (void)disambiguateRecipient:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    id v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    [v9 handleFailureInMethod:a2, self, @"PXSearchRecipientController.m", 132, @"%@ should be an instance inheriting from %@, but it is nil", @"recipient", v11 object file lineNumber description];
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int v9 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v12 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v12);
    id v13 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v9 handleFailureInMethod:a2, self, @"PXSearchRecipientController.m", 132, @"%@ should be an instance inheriting from %@, but it is %@", @"recipient", v11, v13 object file lineNumber description];

    goto LABEL_6;
  }
LABEL_3:
  id v6 = [v5 recipient];
  searchResultsTableViewController = self->__searchResultsTableViewController;
  v14[0] = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [(CNAutocompleteResultsTableViewController *)searchResultsTableViewController updateRecipients:v8 disambiguatingRecipient:v6];
}

- (void)setNumberOfSearchRecipients:(unint64_t)a3
{
  if (self->_numberOfSearchRecipients != a3)
  {
    self->_numberOfSearchRecipients = a3;
    if (self->_delegateRespondsTo.numberOfSearchRecipientsDidChange)
    {
      id v5 = [(PXSearchRecipientController *)self delegate];
      [v5 searchRecipientController:self numberOfSearchRecipientsDidChange:a3];
    }
  }
}

- (void)setSearchState:(int64_t)a3
{
  if (self->_searchState != a3)
  {
    self->_searchState = a3;
    if (self->_delegateRespondsTo.searchStateDidChange)
    {
      id v5 = [(PXSearchRecipientController *)self delegate];
      [v5 searchRecipientController:self searchStateDidChange:a3];
    }
  }
}

- (void)_setSearchDataSource:(id)a3
{
  id v6 = (PXRecipientSearchDataSource *)a3;
  if (self->__searchDataSource != v6)
  {
    objc_storeStrong((id *)&self->__searchDataSource, a3);
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8 = [(PXRecipientSearchDataSource *)v6 recipientSearchResultsInSection:0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__PXSearchRecipientController__setSearchDataSource___block_invoke;
    v11[3] = &unk_1E5DB0140;
    SEL v13 = a2;
    v11[4] = self;
    id v9 = v7;
    id v12 = v9;
    [v8 enumerateObjectsUsingBlock:v11];
    [(CNAutocompleteResultsTableViewController *)self->__searchResultsTableViewController setRecipients:v9];
    if ([(PXRecipientSearchDataSource *)self->__searchDataSource numberOfSections] < 1) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = [(PXRecipientSearchDataSource *)self->__searchDataSource numberOfItemsInSection:0];
    }
    [(PXSearchRecipientController *)self setNumberOfSearchRecipients:v10];
  }
}

void __52__PXSearchRecipientController__setSearchDataSource___block_invoke(void *a1, void *a2)
{
  id v14 = a2;
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v10 = a1[6];
    uint64_t v11 = a1[4];
    id v12 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v12);
    SEL v13 = objc_msgSend(v14, "px_descriptionForAssertionMessage");
    [v5 handleFailureInMethod:v10, v11, @"PXSearchRecipientController.m", 100, @"%@ should be an instance inheriting from %@, but it is %@", @"searchResult", v9, v13 object file lineNumber description];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = a1[6];
    uint64_t v7 = a1[4];
    v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    [v5 handleFailureInMethod:v6, v7, @"PXSearchRecipientController.m", 100, @"%@ should be an instance inheriting from %@, but it is nil", @"searchResult", v9 object file lineNumber description];
  }

LABEL_3:
  uint64_t v3 = (void *)a1[5];
  v4 = [v14 recipient];
  [v3 addObject:v4];
}

- (BOOL)_searchHasNoResultsFound
{
  if ([(PXRecipientSearchDataSourceManager *)self->_searchDataSourceManager searchState] != 2) {
    return 0;
  }
  uint64_t v3 = [(PXSectionedDataSourceManager *)self->_searchDataSourceManager dataSource];
  BOOL v4 = [v3 numberOfItemsInSection:0] == 0;

  return v4;
}

- (UIView)searchResultsView
{
  v2 = [(CNAutocompleteResultsTableViewController *)self->__searchResultsTableViewController tableView];
  [v2 setKeyboardDismissMode:2];
  uint64_t v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v2 setBackgroundColor:v3];

  return (UIView *)v2;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.didSelectRecipient = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.numberOfSearchRecipientsDidChange = objc_opt_respondsToSelector() & 1;
    self->_delegateRespondsTo.searchStateDidChange = objc_opt_respondsToSelector() & 1;
  }
}

- (PXSearchRecipientController)initWithSearchDataSourceManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXSearchRecipientController;
  uint64_t v6 = [(PXSearchRecipientController *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_searchDataSourceManager, a3);
    [(PXSectionedDataSourceManager *)v7->_searchDataSourceManager registerChangeObserver:v7 context:PXSearchDataSourceManagerContext];
    v8 = (CNAutocompleteResultsTableViewController *)objc_alloc_init(MEMORY[0x1E4F5A0E8]);
    searchResultsTableViewController = v7->__searchResultsTableViewController;
    v7->__searchResultsTableViewController = v8;

    [(CNAutocompleteResultsTableViewController *)v7->__searchResultsTableViewController setDelegate:v7];
  }

  return v7;
}

@end