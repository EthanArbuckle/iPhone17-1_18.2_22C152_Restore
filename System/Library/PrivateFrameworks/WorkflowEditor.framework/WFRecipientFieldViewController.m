@interface WFRecipientFieldViewController
- (BOOL)allowsCustomHandles;
- (BOOL)hasActiveSearch;
- (BOOL)recipientViewShouldIgnoreFirstResponderChanges:(id)a3;
- (CNAutocompleteFetchContext)fetchContext;
- (CNAutocompleteResultsTableViewController)autocompleteResultsController;
- (CNAutocompleteSearchManager)searchManager;
- (CNComposeRecipientTextView)composeTextView;
- (CNContactStore)contactStore;
- (NSArray)entries;
- (NSArray)recipients;
- (NSLayoutConstraint)composeHeaderHeightConstraint;
- (NSMutableArray)searchResults;
- (NSNumber)lastSearchID;
- (NSSet)supportedPersonProperties;
- (NSString)currentSearchTerm;
- (NSString)fieldLabel;
- (UIButton)contactAuthorizationStatusButton;
- (UILabel)contactAuthorizationMessageLabel;
- (UIView)tableBackgroundView;
- (WFContactPickerCoordinator)contactPickerCoordinator;
- (WFRecipientFieldViewController)init;
- (WFRecipientFieldViewControllerDelegate)delegate;
- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4;
- (int64_t)contactAuthorizationStatus;
- (unint64_t)preferredSearchResultTypes;
- (void)_addSearchResults:(id)a3 forTask:(id)a4;
- (void)_cancelActiveSearchClearingText:(BOOL)a3;
- (void)_finishedSearching;
- (void)_presentContactViewControllerForRecipient:(id)a3;
- (void)_resetSearchResults;
- (void)_startSearch:(id)a3;
- (void)_updateFetchContextChosenAddresses;
- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4;
- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5;
- (void)cancel:(id)a3;
- (void)commitRemainingText;
- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4;
- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4;
- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 textDidChange:(id)a4;
- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3;
- (void)composeRecipientViewRequestAddRecipient:(id)a3;
- (void)configureBackgroundView;
- (void)dealloc;
- (void)done:(id)a3;
- (void)finishedTaskWithID:(id)a3;
- (void)loadView;
- (void)requestContactAuthorization;
- (void)requestContactsAccessIfNeeded;
- (void)setAllowsCustomHandles:(BOOL)a3;
- (void)setComposeHeaderHeightConstraint:(id)a3;
- (void)setComposeTextView:(id)a3;
- (void)setContactAuthorizationMessageLabel:(id)a3;
- (void)setContactAuthorizationStatus:(int64_t)a3;
- (void)setContactAuthorizationStatusButton:(id)a3;
- (void)setContactPickerCoordinator:(id)a3;
- (void)setCurrentSearchTerm:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEntries:(id)a3;
- (void)setFieldLabel:(id)a3;
- (void)setLastSearchID:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSearchResults:(id)a3;
- (void)setSupportedPersonProperties:(id)a3;
- (void)setTableBackgroundView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation WFRecipientFieldViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactAuthorizationStatusButton, 0);
  objc_storeStrong((id *)&self->_contactAuthorizationMessageLabel, 0);
  objc_storeStrong((id *)&self->_tableBackgroundView, 0);
  objc_storeStrong((id *)&self->_lastSearchID, 0);
  objc_storeStrong((id *)&self->_currentSearchTerm, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_fetchContext, 0);
  objc_storeStrong((id *)&self->_composeTextView, 0);
  objc_storeStrong((id *)&self->_composeHeaderHeightConstraint, 0);
  objc_storeStrong((id *)&self->_autocompleteResultsController, 0);
  objc_storeStrong((id *)&self->_contactPickerCoordinator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fieldLabel, 0);
  objc_storeStrong((id *)&self->_supportedPersonProperties, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
}

- (void)setContactAuthorizationStatus:(int64_t)a3
{
  self->_contactAuthorizationStatus = a3;
}

- (int64_t)contactAuthorizationStatus
{
  return self->_contactAuthorizationStatus;
}

- (void)setContactAuthorizationStatusButton:(id)a3
{
}

- (UIButton)contactAuthorizationStatusButton
{
  return self->_contactAuthorizationStatusButton;
}

- (void)setContactAuthorizationMessageLabel:(id)a3
{
}

- (UILabel)contactAuthorizationMessageLabel
{
  return self->_contactAuthorizationMessageLabel;
}

- (void)setTableBackgroundView:(id)a3
{
}

- (UIView)tableBackgroundView
{
  return self->_tableBackgroundView;
}

- (void)setLastSearchID:(id)a3
{
}

- (NSNumber)lastSearchID
{
  return self->_lastSearchID;
}

- (void)setCurrentSearchTerm:(id)a3
{
}

- (NSString)currentSearchTerm
{
  return self->_currentSearchTerm;
}

- (void)setSearchResults:(id)a3
{
}

- (NSMutableArray)searchResults
{
  return self->_searchResults;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNAutocompleteFetchContext)fetchContext
{
  return self->_fetchContext;
}

- (void)setComposeTextView:(id)a3
{
}

- (void)setComposeHeaderHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)composeHeaderHeightConstraint
{
  return self->_composeHeaderHeightConstraint;
}

- (CNAutocompleteResultsTableViewController)autocompleteResultsController
{
  return self->_autocompleteResultsController;
}

- (void)setContactPickerCoordinator:(id)a3
{
}

- (WFContactPickerCoordinator)contactPickerCoordinator
{
  return self->_contactPickerCoordinator;
}

- (void)setDelegate:(id)a3
{
}

- (WFRecipientFieldViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFRecipientFieldViewControllerDelegate *)WeakRetained;
}

- (void)setAllowsCustomHandles:(BOOL)a3
{
  self->_allowsCustomHandles = a3;
}

- (BOOL)allowsCustomHandles
{
  return self->_allowsCustomHandles;
}

- (void)setFieldLabel:(id)a3
{
}

- (void)setSupportedPersonProperties:(id)a3
{
}

- (NSSet)supportedPersonProperties
{
  return self->_supportedPersonProperties;
}

- (void)requestContactsAccessIfNeeded
{
  [(WFRecipientFieldViewController *)self setContactAuthorizationStatus:WFCNContactAuthorizationStatus()];
  if (![(WFRecipientFieldViewController *)self contactAuthorizationStatus])
  {
    v3 = [(WFRecipientFieldViewController *)self contactStore];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __63__WFRecipientFieldViewController_requestContactsAccessIfNeeded__block_invoke;
    v4[3] = &unk_264BFDBC8;
    v4[4] = self;
    [v3 requestAccessForEntityType:0 completionHandler:v4];
  }
}

void __63__WFRecipientFieldViewController_requestContactsAccessIfNeeded__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__WFRecipientFieldViewController_requestContactsAccessIfNeeded__block_invoke_2;
  block[3] = &unk_264BFDBA0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __63__WFRecipientFieldViewController_requestContactsAccessIfNeeded__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setContactAuthorizationStatus:WFCNContactAuthorizationStatus()];
  v2 = [*(id *)(a1 + 32) searchManager];
  objc_msgSend(v2, "setSearchTypes:", objc_msgSend(*(id *)(a1 + 32), "preferredSearchResultTypes"));

  v3 = *(void **)(a1 + 32);
  id v4 = [v3 currentSearchTerm];
  [v3 _startSearch:v4];
}

- (void)configureBackgroundView
{
  if ([(WFRecipientFieldViewController *)self contactAuthorizationStatus] != 3)
  {
    v3 = [(WFRecipientFieldViewController *)self currentSearchTerm];
    uint64_t v4 = [v3 length];

    if (!v4)
    {
      v6 = [(WFRecipientFieldViewController *)self tableBackgroundView];
      v7 = [(WFRecipientFieldViewController *)self autocompleteResultsController];
      v8 = [v7 tableView];
      [v8 setBackgroundView:v6];

      if ([(WFRecipientFieldViewController *)self contactAuthorizationStatus])
      {
        if ([(WFRecipientFieldViewController *)self contactAuthorizationStatus] != 2)
        {
          if ([(WFRecipientFieldViewController *)self contactAuthorizationStatus] != 1) {
            return;
          }
          v18 = WFLocalizedString(@"Shortcuts doesn't have access to your contacts.");
          v19 = [(WFRecipientFieldViewController *)self contactAuthorizationMessageLabel];
          [v19 setText:v18];

          v16 = [(WFRecipientFieldViewController *)self contactAuthorizationStatusButton];
          id v20 = v16;
          uint64_t v17 = 1;
          goto LABEL_12;
        }
        v9 = WFLocalizedString(@"To see suggestions while you type, grant access in Settings.");
        v10 = [(WFRecipientFieldViewController *)self contactAuthorizationMessageLabel];
        [v10 setText:v9];

        v11 = [(WFRecipientFieldViewController *)self contactAuthorizationStatusButton];
        v12 = @"Shortcuts Settings";
      }
      else
      {
        v13 = WFLocalizedString(@"Shortcuts needs access to your contacts to provide suggestions while you type.");
        v14 = [(WFRecipientFieldViewController *)self contactAuthorizationMessageLabel];
        [v14 setText:v13];

        v11 = [(WFRecipientFieldViewController *)self contactAuthorizationStatusButton];
        v12 = @"Allow";
      }
      v15 = WFLocalizedString(v12);
      [v11 setTitle:v15 forState:0];

      v16 = [(WFRecipientFieldViewController *)self contactAuthorizationStatusButton];
      id v20 = v16;
      uint64_t v17 = 0;
LABEL_12:
      [v16 setHidden:v17];
      goto LABEL_4;
    }
  }
  id v20 = [(WFRecipientFieldViewController *)self autocompleteResultsController];
  v5 = [v20 tableView];
  [v5 setBackgroundView:0];

LABEL_4:
}

- (void)requestContactAuthorization
{
  if ([(WFRecipientFieldViewController *)self contactAuthorizationStatus])
  {
    if ([(WFRecipientFieldViewController *)self contactAuthorizationStatus] == 2)
    {
      id v4 = [MEMORY[0x263F33718] sharedContext];
      v3 = [NSURL URLWithString:@"prefs:root=SHORTCUTS"];
      [v4 openURL:v3];
    }
  }
  else
  {
    [(WFRecipientFieldViewController *)self requestContactsAccessIfNeeded];
  }
}

- (void)_updateFetchContextChosenAddresses
{
  id v3 = [(CNComposeRecipientTextView *)self->_composeTextView uncommentedAddresses];
  [(CNAutocompleteFetchContext *)self->_fetchContext setOtherAddressesAlreadyChosen:v3];
}

- (void)_resetSearchResults
{
  id v3 = [(WFRecipientFieldViewController *)self searchResults];
  [v3 removeAllObjects];

  id v5 = [(WFRecipientFieldViewController *)self searchResults];
  id v4 = [(WFRecipientFieldViewController *)self autocompleteResultsController];
  [v4 setRecipients:v5];
}

- (void)_cancelActiveSearchClearingText:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(WFRecipientFieldViewController *)self composeTextView];
    [v4 clearText];
  }
  if ([(WFRecipientFieldViewController *)self hasActiveSearch])
  {
    id v5 = [(WFRecipientFieldViewController *)self searchManager];
    v6 = [(WFRecipientFieldViewController *)self lastSearchID];
    [v5 cancelTaskWithID:v6];
  }
  [(WFRecipientFieldViewController *)self _resetSearchResults];
  [(WFRecipientFieldViewController *)self setLastSearchID:0];
}

- (BOOL)hasActiveSearch
{
  v2 = [(WFRecipientFieldViewController *)self lastSearchID];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_finishedSearching
{
  BOOL v3 = [(WFRecipientFieldViewController *)self searchResults];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    [(WFRecipientFieldViewController *)self _resetSearchResults];
  }
}

- (void)_startSearch:(id)a3
{
  id v7 = a3;
  [(WFRecipientFieldViewController *)self setCurrentSearchTerm:v7];
  [(WFRecipientFieldViewController *)self configureBackgroundView];
  [(WFRecipientFieldViewController *)self _cancelActiveSearchClearingText:0];
  uint64_t v4 = [(WFRecipientFieldViewController *)self searchManager];
  id v5 = [(WFRecipientFieldViewController *)self fetchContext];
  if (v7) {
    [v4 searchForText:v7 withAutocompleteFetchContext:v5 consumer:self];
  }
  else {
  v6 = [v4 searchForCorecipientsWithAutocompleteFetchContext:v5 consumer:self];
  }
  [(WFRecipientFieldViewController *)self setLastSearchID:v6];
}

- (void)_addSearchResults:(id)a3 forTask:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(WFRecipientFieldViewController *)self lastSearchID];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    uint64_t v9 = [v12 count];

    if (!v9) {
      goto LABEL_5;
    }
    v10 = [(WFRecipientFieldViewController *)self searchResults];
    [v10 addObjectsFromArray:v12];

    id v7 = [(WFRecipientFieldViewController *)self searchResults];
    v11 = [(WFRecipientFieldViewController *)self autocompleteResultsController];
    [v11 setRecipients:v7];
  }
LABEL_5:
}

- (CNComposeRecipientTextView)composeTextView
{
  composeTextView = self->_composeTextView;
  if (!composeTextView)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F33440]);
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v5 = [MEMORY[0x263F825C8] clearColor];
    [v4 setBackgroundColor:v5];

    [v4 setDelegate:self];
    id v6 = [(WFRecipientFieldViewController *)self fieldLabel];
    [v4 setLabel:v6];

    [v4 setSeparatorHidden:0];
    id v7 = self->_composeTextView;
    self->_composeTextView = (CNComposeRecipientTextView *)v4;

    composeTextView = self->_composeTextView;
  }
  return composeTextView;
}

- (void)setRecipients:(id)a3
{
  id v4 = a3;
  id v5 = [(WFRecipientFieldViewController *)self composeTextView];
  [v5 setRecipients:v4];
}

- (NSArray)recipients
{
  v2 = [(WFRecipientFieldViewController *)self composeTextView];
  BOOL v3 = [v2 recipients];

  return (NSArray *)v3;
}

- (CNAutocompleteSearchManager)searchManager
{
  searchManager = self->_searchManager;
  if (!searchManager)
  {
    id v4 = [(WFRecipientFieldViewController *)self supportedPersonProperties];
    int v5 = [v4 containsObject:&unk_26E7C17B0];
    int v6 = [v4 containsObject:&unk_26E7C17C8];
    uint64_t v7 = v5 & v6 | v6 ^ 1u;

    int v8 = (CNAutocompleteSearchManager *)[objc_alloc(MEMORY[0x263F33428]) initWithAutocompleteSearchType:v7];
    uint64_t v9 = self->_searchManager;
    self->_searchManager = v8;

    [(CNAutocompleteSearchManager *)self->_searchManager setImplicitGroupCreationThreshold:1];
    [(CNAutocompleteSearchManager *)self->_searchManager setSearchTypes:[(WFRecipientFieldViewController *)self preferredSearchResultTypes]];
    searchManager = self->_searchManager;
  }
  return searchManager;
}

- (unint64_t)preferredSearchResultTypes
{
  if (WFCNContactIsAuthorizedToAccessContact()) {
    return 23;
  }
  else {
    return 21;
  }
}

- (void)_presentContactViewControllerForRecipient:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFEBF8];
  int v5 = [a3 contact];
  id v8 = [v4 viewControllerForUnknownContact:v5];

  int v6 = [(WFRecipientFieldViewController *)self contactStore];
  [v8 setContactStore:v6];

  [v8 setModalPresentationStyle:3];
  uint64_t v7 = [(WFRecipientFieldViewController *)self navigationController];
  [v7 pushViewController:v8 animated:1];
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  if (a4)
  {
    id v7 = a4;
    [(WFRecipientFieldViewController *)self _cancelActiveSearchClearingText:1];
    id v8 = [(WFRecipientFieldViewController *)self composeTextView];
    [v8 addRecipient:v7];

    uint64_t v9 = [(WFRecipientFieldViewController *)self searchManager];
    [v9 didSelectRecipient:v7 atIndex:a5];

    [(WFRecipientFieldViewController *)self _updateFetchContextChosenAddresses];
    [(WFRecipientFieldViewController *)self _startSearch:0];
  }
}

- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4
{
}

- (BOOL)recipientViewShouldIgnoreFirstResponderChanges:(id)a3
{
  return 1;
}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v5 = a4;
  unint64_t v6 = objc_msgSend(MEMORY[0x263F33780], "predictedTypeForHandleValue:allowsCustomHandles:", v5, -[WFRecipientFieldViewController allowsCustomHandles](self, "allowsCustomHandles"));
  if (v6 > 2) {
    id v7 = 0;
  }
  else {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F33430]) initWithContact:0 address:v5 kind:qword_234B796E8[v6]];
  }
  objc_msgSend(v7, "wf_contactFieldEntry");
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8) {
    id v8 = v7;
  }

  return v8;
}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  id v3 = [(WFRecipientFieldViewController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(WFContactPickerCoordinator);
  [(WFRecipientFieldViewController *)self setContactPickerCoordinator:v5];

  unint64_t v6 = [(WFRecipientFieldViewController *)self supportedPersonProperties];
  id v7 = [(WFRecipientFieldViewController *)self contactPickerCoordinator];
  [v7 setSupportedPersonProperties:v6];

  id v8 = [(WFRecipientFieldViewController *)self navigationController];
  uint64_t v9 = [(WFRecipientFieldViewController *)self contactPickerCoordinator];
  [v9 setPresentingViewController:v8];

  objc_initWeak(&location, self);
  v10 = [(WFRecipientFieldViewController *)self contactPickerCoordinator];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__WFRecipientFieldViewController_composeRecipientViewRequestAddRecipient___block_invoke;
  v11[3] = &unk_264BFDB78;
  objc_copyWeak(&v12, &location);
  [v10 presentContactPickerWithCompletionHandler:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __74__WFRecipientFieldViewController_composeRecipientViewRequestAddRecipient___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = objc_msgSend(MEMORY[0x263F33430], "wf_composeRecipientForContact:", a2);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = [WeakRetained composeTextView];
    [v5 addRecipient:v3];
  }
  unint64_t v6 = (id *)(a1 + 32);
  id v7 = objc_loadWeakRetained(v6);
  id v8 = [v7 composeTextView];
  [v7 composeRecipientViewDidFinishPickingRecipient:v8];

  id v9 = objc_loadWeakRetained(v6);
  [v9 setContactPickerCoordinator:0];
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(WFRecipientFieldViewController *)self composeRecipientView:a3 composeRecipientForAddress:v6];
  id v8 = objc_msgSend(v7, "wf_contactFieldEntry");

  if (v8)
  {
    id v9 = [(WFRecipientFieldViewController *)self composeTextView];
    [v9 addRecipient:v7];
  }
  else
  {
    id v9 = getWFGeneralLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "-[WFRecipientFieldViewController composeRecipientView:didFinishEnteringAddress:]";
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_impl(&dword_23490C000, v9, OS_LOG_TYPE_ERROR, "%s Invalid compose recipient for: %@", (uint8_t *)&v10, 0x16u);
    }
  }

  [(WFRecipientFieldViewController *)self _cancelActiveSearchClearingText:1];
  [(WFRecipientFieldViewController *)self _updateFetchContextChosenAddresses];
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  id v5 = a4;
  id v6 = [(WFRecipientFieldViewController *)self composeTextView];
  [v6 removeRecipient:v5];

  [(WFRecipientFieldViewController *)self _cancelActiveSearchClearingText:1];
  [(WFRecipientFieldViewController *)self _updateFetchContextChosenAddresses];
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
}

- (void)finishedTaskWithID:(id)a3
{
  id v4 = a3;
  id v5 = [(WFRecipientFieldViewController *)self lastSearchID];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    [(WFRecipientFieldViewController *)self setLastSearchID:0];
  }
}

- (NSArray)entries
{
  v2 = [(WFRecipientFieldViewController *)self recipients];
  id v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_194);

  return (NSArray *)v3;
}

uint64_t __41__WFRecipientFieldViewController_entries__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wf_contactFieldEntry");
}

- (void)setEntries:(id)a3
{
  objc_msgSend(a3, "if_map:", &__block_literal_global_6244);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(WFRecipientFieldViewController *)self setRecipients:v4];
}

uint64_t __45__WFRecipientFieldViewController_setEntries___block_invoke(uint64_t a1, void *a2)
{
  return [a2 composeRecipient];
}

- (NSString)fieldLabel
{
  fieldLabel = self->_fieldLabel;
  if (!fieldLabel)
  {
    WFLocalizedString(@"To:");
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_fieldLabel;
    self->_fieldLabel = v4;

    fieldLabel = self->_fieldLabel;
  }
  return fieldLabel;
}

- (void)commitRemainingText
{
  id v2 = [(WFRecipientFieldViewController *)self composeTextView];
  [v2 finishEnteringRecipient];
}

- (void)done:(id)a3
{
  id v4 = [(WFRecipientFieldViewController *)self delegate];
  [v4 recipientViewControllerDidFinish:self cancelled:0];
}

- (void)cancel:(id)a3
{
  id v4 = [(WFRecipientFieldViewController *)self delegate];
  [v4 recipientViewControllerDidFinish:self cancelled:1];
}

- (void)dealloc
{
  if (self->_composeTextView)
  {
    id v3 = [(WFRecipientFieldViewController *)self composeTextView];
    [v3 setDelegate:0];
  }
  [(WFRecipientFieldViewController *)self _cancelActiveSearchClearingText:0];
  v4.receiver = self;
  v4.super_class = (Class)WFRecipientFieldViewController;
  [(WFRecipientFieldViewController *)&v4 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFRecipientFieldViewController;
  [(WFRecipientFieldViewController *)&v4 viewDidAppear:a3];
  [(WFRecipientFieldViewController *)self requestContactsAccessIfNeeded];
  [(WFRecipientFieldViewController *)self _startSearch:0];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)WFRecipientFieldViewController;
  [(WFRecipientFieldViewController *)&v4 viewDidLoad];
  [(WFRecipientFieldViewController *)self configureBackgroundView];
  id v3 = [(WFRecipientFieldViewController *)self composeTextView];
  [v3 becomeFirstResponder];
}

- (void)loadView
{
  v123[9] = *MEMORY[0x263EF8340];
  v120.receiver = self;
  v120.super_class = (Class)WFRecipientFieldViewController;
  [(WFRecipientFieldViewController *)&v120 loadView];
  id v3 = [(WFRecipientFieldViewController *)self view];
  objc_super v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  id v5 = [(WFRecipientFieldViewController *)self composeTextView];
  [v3 addSubview:v5];
  int v6 = [(CNAutocompleteResultsTableViewController *)self->_autocompleteResultsController tableView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setKeyboardDismissMode:1];
  [v3 addSubview:v6];
  id v7 = [v5 heightAnchor];
  [MEMORY[0x263F33440] preferredHeight];
  objc_msgSend(v7, "constraintEqualToConstant:");
  id v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  composeHeaderHeightConstraint = self->_composeHeaderHeightConstraint;
  self->_composeHeaderHeightConstraint = v8;

  v95 = (void *)MEMORY[0x263F08938];
  v123[0] = self->_composeHeaderHeightConstraint;
  v115 = [v5 leadingAnchor];
  v113 = [v3 leadingAnchor];
  v111 = [v115 constraintEqualToAnchor:v113];
  v123[1] = v111;
  v109 = [v5 trailingAnchor];
  v107 = [v3 trailingAnchor];
  v105 = [v109 constraintEqualToAnchor:v107];
  v123[2] = v105;
  v103 = [v5 widthAnchor];
  v101 = [v3 widthAnchor];
  v99 = [v103 constraintEqualToAnchor:v101];
  v123[3] = v99;
  v119 = v5;
  v93 = [v5 topAnchor];
  v97 = [v3 safeAreaLayoutGuide];
  v91 = [v97 topAnchor];
  v89 = [v93 constraintEqualToAnchor:v91];
  v123[4] = v89;
  v87 = [v6 leadingAnchor];
  v85 = [v3 leadingAnchor];
  v83 = [v87 constraintEqualToAnchor:v85];
  v123[5] = v83;
  v81 = [v6 trailingAnchor];
  int v10 = v3;
  v118 = v3;
  v11 = [v3 trailingAnchor];
  __int16 v12 = [v81 constraintEqualToAnchor:v11];
  v123[6] = v12;
  v117 = v6;
  id v13 = [v6 topAnchor];
  uint64_t v14 = [v5 bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v123[7] = v15;
  v16 = [v6 bottomAnchor];
  uint64_t v17 = [v10 bottomAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v123[8] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v123 count:9];
  [v95 activateConstraints:v19];

  id v20 = objc_opt_new();
  [(WFRecipientFieldViewController *)self setTableBackgroundView:v20];

  v21 = [MEMORY[0x263F825C8] systemGroupedBackgroundColor];
  v22 = [(WFRecipientFieldViewController *)self tableBackgroundView];
  [v22 setBackgroundColor:v21];

  v23 = objc_opt_new();
  [(WFRecipientFieldViewController *)self setContactAuthorizationMessageLabel:v23];

  v24 = [(WFRecipientFieldViewController *)self contactAuthorizationMessageLabel];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

  v25 = [MEMORY[0x263F825C8] secondaryLabelColor];
  v26 = [(WFRecipientFieldViewController *)self contactAuthorizationMessageLabel];
  [v26 setTextColor:v25];

  v27 = [(WFRecipientFieldViewController *)self contactAuthorizationMessageLabel];
  [v27 setTextAlignment:1];

  v28 = [(WFRecipientFieldViewController *)self contactAuthorizationMessageLabel];
  [v28 setNumberOfLines:0];

  v29 = (void *)MEMORY[0x263F824E8];
  v30 = [MEMORY[0x263F824F0] plainButtonConfiguration];
  v31 = [v29 buttonWithConfiguration:v30 primaryAction:0];
  [(WFRecipientFieldViewController *)self setContactAuthorizationStatusButton:v31];

  v32 = [(WFRecipientFieldViewController *)self contactAuthorizationStatusButton];
  [v32 addTarget:self action:sel_requestContactAuthorization forControlEvents:0x2000];

  id v33 = objc_alloc(MEMORY[0x263F82BF8]);
  v34 = [(WFRecipientFieldViewController *)self contactAuthorizationMessageLabel];
  v122[0] = v34;
  v35 = [(WFRecipientFieldViewController *)self contactAuthorizationStatusButton];
  v122[1] = v35;
  v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v122 count:2];
  v37 = (void *)[v33 initWithArrangedSubviews:v36];

  v38 = v37;
  [v37 setAxis:1];
  [v37 setAlignment:3];
  [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v37 setSpacing:8.0];
  v39 = [(WFRecipientFieldViewController *)self tableBackgroundView];
  [v39 addSubview:v38];

  id v40 = objc_alloc_init(MEMORY[0x263F82908]);
  id v41 = objc_alloc_init(MEMORY[0x263F82908]);
  v42 = [(WFRecipientFieldViewController *)self tableBackgroundView];
  [v42 addLayoutGuide:v40];

  v43 = [(WFRecipientFieldViewController *)self tableBackgroundView];
  [v43 addLayoutGuide:v41];

  v78 = (void *)MEMORY[0x263F08938];
  v114 = [v38 leadingAnchor];
  v116 = [(WFRecipientFieldViewController *)self tableBackgroundView];
  v112 = [v116 layoutMarginsGuide];
  v110 = [v112 leadingAnchor];
  v108 = [v114 constraintEqualToAnchor:v110];
  v121[0] = v108;
  v104 = [v38 trailingAnchor];
  v106 = [(WFRecipientFieldViewController *)self tableBackgroundView];
  v102 = [v106 layoutMarginsGuide];
  v100 = [v102 trailingAnchor];
  v98 = [v104 constraintEqualToAnchor:v100];
  v121[1] = v98;
  v94 = [v40 leadingAnchor];
  v96 = [(WFRecipientFieldViewController *)self tableBackgroundView];
  v92 = [v96 layoutMarginsGuide];
  v90 = [v92 leadingAnchor];
  v88 = [v94 constraintEqualToAnchor:v90];
  v121[2] = v88;
  v84 = [v40 trailingAnchor];
  v86 = [(WFRecipientFieldViewController *)self tableBackgroundView];
  v82 = [v86 layoutMarginsGuide];
  v80 = [v82 trailingAnchor];
  v79 = [v84 constraintEqualToAnchor:v80];
  v121[3] = v79;
  v76 = [v41 leadingAnchor];
  v77 = [(WFRecipientFieldViewController *)self tableBackgroundView];
  v75 = [v77 layoutMarginsGuide];
  v74 = [v75 leadingAnchor];
  v73 = [v76 constraintEqualToAnchor:v74];
  v121[4] = v73;
  v68 = [v41 trailingAnchor];
  v70 = [(WFRecipientFieldViewController *)self tableBackgroundView];
  v67 = [v70 layoutMarginsGuide];
  v66 = [v67 trailingAnchor];
  v65 = [v68 constraintEqualToAnchor:v66];
  v121[5] = v65;
  v64 = [v40 heightAnchor];
  v63 = [v41 heightAnchor];
  v62 = [v64 constraintEqualToAnchor:v63];
  v121[6] = v62;
  v72 = v40;
  v59 = [v40 topAnchor];
  v61 = [(WFRecipientFieldViewController *)self tableBackgroundView];
  v60 = [v61 layoutMarginsGuide];
  v58 = [v60 topAnchor];
  v57 = [v59 constraintEqualToSystemSpacingBelowAnchor:v58 multiplier:1.0];
  v121[7] = v57;
  v56 = [(WFRecipientFieldViewController *)self tableBackgroundView];
  v55 = [v56 layoutMarginsGuide];
  v44 = [v55 bottomAnchor];
  v69 = v41;
  v45 = [v41 bottomAnchor];
  v46 = [v44 constraintEqualToSystemSpacingBelowAnchor:v45 multiplier:1.0];
  v121[8] = v46;
  v47 = v38;
  v71 = v38;
  v48 = [v38 topAnchor];
  v49 = [v40 bottomAnchor];
  v50 = [v48 constraintEqualToAnchor:v49];
  v121[9] = v50;
  v51 = [v47 bottomAnchor];
  v52 = [v41 topAnchor];
  v53 = [v51 constraintEqualToAnchor:v52];
  v121[10] = v53;
  v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v121 count:11];
  [v78 activateConstraints:v54];
}

- (WFRecipientFieldViewController)init
{
  v16.receiver = self;
  v16.super_class = (Class)WFRecipientFieldViewController;
  id v2 = [(WFRecipientFieldViewController *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F33410]) initWithStyle:1];
    autocompleteResultsController = v2->_autocompleteResultsController;
    v2->_autocompleteResultsController = (CNAutocompleteResultsTableViewController *)v3;

    [(CNAutocompleteResultsTableViewController *)v2->_autocompleteResultsController setDelegate:v2];
    v2->_contactAuthorizationStatus = WFCNContactAuthorizationStatus();
    uint64_t v5 = [MEMORY[0x263EFEA58] storeWithOptions:11];
    contactStore = v2->_contactStore;
    v2->_contactStore = (CNContactStore *)v5;

    id v7 = (CNAutocompleteFetchContext *)objc_alloc_init(MEMORY[0x263F33400]);
    fetchContext = v2->_fetchContext;
    v2->_fetchContext = v7;

    [(CNAutocompleteFetchContext *)v2->_fetchContext setPredictsBasedOnOutgoingInteraction:1];
    id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    searchResults = v2->_searchResults;
    v2->_searchResults = v9;

    v11 = [(WFRecipientFieldViewController *)v2 navigationItem];
    __int16 v12 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v2 action:sel_cancel_];
    [v11 setLeftBarButtonItem:v12];

    id v13 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:v2 action:sel_done_];
    [v11 setRightBarButtonItem:v13];

    uint64_t v14 = v2;
  }

  return v2;
}

@end