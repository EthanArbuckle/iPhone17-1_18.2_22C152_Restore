@interface PMSharedAccountsGroupMemberPickerViewController
- (BOOL)_cachedIsRecipientEligible:(id)a3;
- (BOOL)_doesGroupOnlyContainKnownContacts:(id)a3;
- (BOOL)_hasEligibilityCachedForRecipient:(id)a3;
- (BOOL)_isAddressAlreadyPartOfGroupOrInvitedAddresses:(id)a3;
- (BOOL)_isEveryMemberInContactsGroupAlreadyInSharingGroup:(id)a3;
- (BOOL)shouldConfirmAddingRecipients;
- (PMSharedAccountsGroupMemberPickerViewController)initWithAlreadyAddedAddresses:(id)a3;
- (PMSharedAccountsGroupMemberPickerViewControllerDelegate)delegate;
- (id)_recipientsWithEligibleAddressesAsDefaultAddressesIfPossible:(id)a3;
- (void)_addMembersButtonPressed;
- (void)_addRecipient:(id)a3;
- (void)_cancelButtonPressed;
- (void)_fetchEligibilityForRecipient:(id)a3 completionHandler:(id)a4;
- (void)_handleSelectionForMultipleRecipientsInGroup:(id)a3;
- (void)_handleSelectionForSingleRecipient:(id)a3;
- (void)_resetSearchQuery;
- (void)_updatePreferredHandleForRecipientIfNecessary:(id)a3;
- (void)_updateRecipientTextViewHeight;
- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4;
- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5;
- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5;
- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 textDidChange:(id)a4;
- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4;
- (void)finishedSearchingForAutocompleteResults;
- (void)setDelegate:(id)a3;
- (void)setShouldConfirmAddingRecipients:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PMSharedAccountsGroupMemberPickerViewController

- (PMSharedAccountsGroupMemberPickerViewController)initWithAlreadyAddedAddresses:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PMSharedAccountsGroupMemberPickerViewController;
  v5 = [(PMSharedAccountsGroupMemberPickerViewController *)&v28 init];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v5 action:sel__cancelButtonPressed];
    v7 = [(PMSharedAccountsGroupMemberPickerViewController *)v5 navigationItem];
    [v7 setLeftBarButtonItem:v6];

    id v8 = objc_alloc(MEMORY[0x263F824A8]);
    v9 = _WBSLocalizedString();
    v10 = (void *)[v8 initWithTitle:v9 style:2 target:v5 action:sel__addMembersButtonPressed];
    v11 = [(PMSharedAccountsGroupMemberPickerViewController *)v5 navigationItem];
    [v11 setRightBarButtonItem:v10];

    v12 = [(PMSharedAccountsGroupMemberPickerViewController *)v5 navigationItem];
    v13 = [v12 rightBarButtonItem];
    [v13 setEnabled:0];

    v14 = _WBSLocalizedString();
    v15 = [(PMSharedAccountsGroupMemberPickerViewController *)v5 navigationItem];
    [v15 setTitle:v14];

    uint64_t v16 = [objc_alloc(MEMORY[0x263F33428]) initWithAutocompleteSearchType:1];
    contactsSearchManager = v5->_contactsSearchManager;
    v5->_contactsSearchManager = (CNAutocompleteSearchManager *)v16;

    [(CNAutocompleteSearchManager *)v5->_contactsSearchManager setSearchTypes:3];
    [(CNAutocompleteSearchManager *)v5->_contactsSearchManager setShouldIncludeGroupResults:1];
    uint64_t v18 = [MEMORY[0x263EFF9C0] set];
    addressesThatHaveBeenFetched = v5->_addressesThatHaveBeenFetched;
    v5->_addressesThatHaveBeenFetched = (NSMutableSet *)v18;

    uint64_t v20 = [v4 copy];
    alreadyAddedAddresses = v5->_alreadyAddedAddresses;
    v5->_alreadyAddedAddresses = (NSSet *)v20;

    uint64_t v22 = [MEMORY[0x263EFF9A0] dictionary];
    addressToEligibility = v5->_addressToEligibility;
    v5->_addressToEligibility = (NSMutableDictionary *)v22;

    uint64_t v24 = [MEMORY[0x263EFF9C0] set];
    addressesCurrentlyBeingCheckedForAvailability = v5->_addressesCurrentlyBeingCheckedForAvailability;
    v5->_addressesCurrentlyBeingCheckedForAvailability = (NSMutableSet *)v24;

    v26 = v5;
  }

  return v5;
}

- (void)viewDidLoad
{
  v44[8] = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)PMSharedAccountsGroupMemberPickerViewController;
  [(PMSharedAccountsGroupMemberPickerViewController *)&v43 viewDidLoad];
  v3 = [(PMSharedAccountsGroupMemberPickerViewController *)self view];
  id v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = (CNComposeRecipientTextView *)objc_alloc_init(MEMORY[0x263F33440]);
  recipientTextView = self->_recipientTextView;
  self->_recipientTextView = v5;

  [(CNComposeRecipientTextView *)self->_recipientTextView setDelegate:self];
  [(CNComposeRecipientTextView *)self->_recipientTextView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNComposeRecipientTextView *)self->_recipientTextView setShowsAddButtonWhenExpanded:0];
  v7 = _WBSLocalizedString();
  [(CNComposeRecipientTextView *)self->_recipientTextView setLabel:v7];

  [v3 addSubview:self->_recipientTextView];
  id v8 = (CNAutocompleteResultsTableViewController *)objc_alloc_init(MEMORY[0x263F33410]);
  contactsResultsTableViewController = self->_contactsResultsTableViewController;
  self->_contactsResultsTableViewController = v8;

  [(CNAutocompleteResultsTableViewController *)self->_contactsResultsTableViewController setDelegate:self];
  v10 = [(CNAutocompleteResultsTableViewController *)self->_contactsResultsTableViewController view];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(CNAutocompleteResultsTableViewController *)self->_contactsResultsTableViewController view];
  v11 = v42 = v3;
  objc_msgSend(v3, "addSubview:");
  v12 = [(CNComposeRecipientTextView *)self->_recipientTextView heightAnchor];
  [MEMORY[0x263F33440] preferredHeight];
  objc_msgSend(v12, "constraintEqualToConstant:");
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  recipientTextViewHeightConstraint = self->_recipientTextViewHeightConstraint;
  self->_recipientTextViewHeightConstraint = v13;

  v15 = [v3 safeAreaLayoutGuide];
  v32 = (void *)MEMORY[0x263F08938];
  v41 = [(CNComposeRecipientTextView *)self->_recipientTextView topAnchor];
  v40 = [v15 topAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v44[0] = v39;
  v38 = [(CNComposeRecipientTextView *)self->_recipientTextView leadingAnchor];
  v37 = [v15 leadingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v44[1] = v36;
  v35 = [(CNComposeRecipientTextView *)self->_recipientTextView trailingAnchor];
  v34 = [v15 trailingAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  uint64_t v16 = self->_recipientTextViewHeightConstraint;
  v44[2] = v33;
  v44[3] = v16;
  v17 = v11;
  v30 = [v11 bottomAnchor];
  v29 = [v15 bottomAnchor];
  objc_super v28 = [v30 constraintEqualToAnchor:v29];
  v44[4] = v28;
  v27 = [v11 leadingAnchor];
  v26 = [v15 leadingAnchor];
  uint64_t v18 = [v27 constraintEqualToAnchor:v26];
  v44[5] = v18;
  v31 = v11;
  v19 = [v11 trailingAnchor];
  uint64_t v20 = [v15 trailingAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v44[6] = v21;
  uint64_t v22 = [v17 topAnchor];
  v23 = [(CNComposeRecipientTextView *)self->_recipientTextView bottomAnchor];
  uint64_t v24 = [v22 constraintEqualToAnchor:v23];
  v44[7] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:8];
  [v32 activateConstraints:v25];

  [(PMSharedAccountsGroupMemberPickerViewController *)self _resetSearchQuery];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PMSharedAccountsGroupMemberPickerViewController;
  [(PMSharedAccountsGroupMemberPickerViewController *)&v4 viewWillAppear:a3];
  [(CNComposeRecipientTextView *)self->_recipientTextView becomeFirstResponder];
}

- (void)_addMembersButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [(CNComposeRecipientTextView *)self->_recipientTextView recipients];
  [WeakRetained memberPickerViewController:self addedRecipients:v3];
}

- (void)_cancelButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained memberPickerViewController:self addedRecipients:0];
}

- (BOOL)_doesGroupOnlyContainKnownContacts:(id)a3
{
  v3 = [a3 children];
  char v4 = objc_msgSend(v3, "safari_allObjectsPassTest:", &__block_literal_global_2);

  return v4;
}

BOOL __86__PMSharedAccountsGroupMemberPickerViewController__doesGroupOnlyContainKnownContacts___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 contact];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_isEveryMemberInContactsGroupAlreadyInSharingGroup:(id)a3
{
  char v4 = [a3 children];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __102__PMSharedAccountsGroupMemberPickerViewController__isEveryMemberInContactsGroupAlreadyInSharingGroup___block_invoke;
  v6[3] = &unk_26543A128;
  v6[4] = self;
  LOBYTE(self) = objc_msgSend(v4, "safari_allObjectsPassTest:", v6);

  return (char)self;
}

uint64_t __102__PMSharedAccountsGroupMemberPickerViewController__isEveryMemberInContactsGroupAlreadyInSharingGroup___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 normalizedAddress];
  uint64_t v4 = [v2 _isAddressAlreadyPartOfGroupOrInvitedAddresses:v3];

  return v4;
}

- (BOOL)_isAddressAlreadyPartOfGroupOrInvitedAddresses:(id)a3
{
  id v4 = a3;
  v5 = [(CNComposeRecipientTextView *)self->_recipientTextView uncommentedAddresses];
  BOOL v6 = ([v5 containsObject:v4] & 1) != 0
    || [(NSSet *)self->_alreadyAddedAddresses containsObject:v4];

  return v6;
}

- (BOOL)_hasEligibilityCachedForRecipient:(id)a3
{
  id v4 = a3;
  v5 = [v4 children];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    v7 = [v4 children];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __85__PMSharedAccountsGroupMemberPickerViewController__hasEligibilityCachedForRecipient___block_invoke;
    v12[3] = &unk_26543A128;
    v12[4] = self;
    char v8 = objc_msgSend(v7, "safari_allObjectsPassTest:", v12);
  }
  else
  {
    addressToEligibility = self->_addressToEligibility;
    v7 = [v4 normalizedAddress];

    v10 = [(NSMutableDictionary *)addressToEligibility objectForKeyedSubscript:v7];
    char v8 = v10 != 0;
  }
  return v8;
}

BOOL __85__PMSharedAccountsGroupMemberPickerViewController__hasEligibilityCachedForRecipient___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1008);
  BOOL v3 = [a2 normalizedAddress];
  id v4 = [v2 objectForKeyedSubscript:v3];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)_fetchEligibilityForRecipient:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = [MEMORY[0x263EFF9C0] set];
  v9 = [v6 children];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    v11 = [v6 children];
    v12 = objc_msgSend(v11, "safari_mapObjectsUsingBlock:", &__block_literal_global_29);
    [v8 addObjectsFromArray:v12];
  }
  else
  {
    v11 = [v6 normalizedAddress];
    [v8 addObject:v11];
  }

  v13 = [v8 allObjects];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke_2;
  v29[3] = &unk_26543A170;
  v29[4] = self;
  v14 = objc_msgSend(v13, "safari_filterObjectsUsingBlock:", v29);

  [(NSMutableSet *)self->_addressesCurrentlyBeingCheckedForAvailability addObjectsFromArray:v14];
  [(NSMutableSet *)self->_addressesThatHaveBeenFetched addObjectsFromArray:v14];
  v15 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    addressesThatHaveBeenFetched = self->_addressesThatHaveBeenFetched;
    v17 = v15;
    uint64_t v18 = [(NSMutableSet *)addressesThatHaveBeenFetched count];
    *(_DWORD *)buf = 134217984;
    uint64_t v31 = v18;
    _os_log_impl(&dword_258906000, v17, OS_LOG_TYPE_DEFAULT, "PMSharedAccountsGroupMemberPickerViewController has tried to fetch %lu unique handles so far.", buf, 0xCu);
  }
  v19 = [MEMORY[0x263F16D18] sharedInstance];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke_32;
  v24[3] = &unk_26543A1C0;
  v24[4] = self;
  id v25 = v14;
  id v27 = v6;
  id v28 = v7;
  id v26 = v8;
  id v20 = v6;
  id v21 = v8;
  id v22 = v7;
  id v23 = v14;
  [v19 checkAvailabilityForHandles:v23 completion:v24];
}

uint64_t __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 normalizedAddress];
}

uint64_t __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 1008) objectForKeyedSubscript:v3];
  if (v4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 1040) containsObject:v3] ^ 1;
  }

  return v5;
}

void __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke_2_33;
  block[3] = &unk_26543A198;
  id v7 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v11 = v7;
  id v12 = v6;
  id v16 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 48);
  id v14 = v5;
  id v15 = *(id *)(a1 + 56);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke_2_33(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 1040);
  id v3 = [MEMORY[0x263EFFA08] setWithArray:*(void *)(a1 + 40)];
  [v2 minusSet:v3];

  if (*(void *)(a1 + 48))
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke_2_33_cold_1((void **)(a1 + 48), v4);
    }
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = *(id *)(a1 + 56);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          id v11 = objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v10, (void)v13);
          [*(id *)(*(void *)(a1 + 32) + 1008) setObject:v11 forKeyedSubscript:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [*(id *)(a1 + 32) _updatePreferredHandleForRecipientIfNecessary:*(void *)(a1 + 72)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16))();
}

- (void)_handleSelectionForSingleRecipient:(id)a3
{
  id v4 = a3;
  addressToEligibility = self->_addressToEligibility;
  uint64_t v6 = [v4 normalizedAddress];
  uint64_t v7 = [(NSMutableDictionary *)addressToEligibility objectForKeyedSubscript:v6];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    id v9 = [v4 normalizedAddress];
    BOOL v10 = [(PMSharedAccountsGroupMemberPickerViewController *)self _isAddressAlreadyPartOfGroupOrInvitedAddresses:v9];

    if (!v10) {
      [(PMSharedAccountsGroupMemberPickerViewController *)self _addRecipient:v4];
    }
    [(PMSharedAccountsGroupMemberPickerViewController *)self _resetSearchQuery];
  }
  else
  {
    id v11 = NSString;
    id v12 = _WBSLocalizedString();
    long long v13 = [v4 displayString];
    long long v14 = objc_msgSend(v11, "stringWithFormat:", v12, v13);

    long long v15 = [v4 displayString];
    long long v16 = +[PMOngoingCredentialSharingStrings unableToInviteContactBecauseOfUnsupportedDevicesAlertMessageWithContactName:v15];

    v17 = [MEMORY[0x263F82418] alertControllerWithTitle:v14 message:v16 preferredStyle:1];
    uint64_t v18 = (void *)MEMORY[0x263F82400];
    v19 = _WBSLocalizedString();
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __86__PMSharedAccountsGroupMemberPickerViewController__handleSelectionForSingleRecipient___block_invoke;
    v21[3] = &unk_26543A1E8;
    v21[4] = self;
    id v20 = [v18 actionWithTitle:v19 style:0 handler:v21];
    [v17 addAction:v20];

    [(PMSharedAccountsGroupMemberPickerViewController *)self presentViewController:v17 animated:1 completion:0];
  }
}

uint64_t __86__PMSharedAccountsGroupMemberPickerViewController__handleSelectionForSingleRecipient___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetSearchQuery];
}

- (void)_handleSelectionForMultipleRecipientsInGroup:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 children];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __96__PMSharedAccountsGroupMemberPickerViewController__handleSelectionForMultipleRecipientsInGroup___block_invoke;
  v44[3] = &unk_26543A128;
  v44[4] = self;
  if (objc_msgSend(v5, "safari_allObjectsPassTest:", v44))
  {
    uint64_t v6 = NSString;
    uint64_t v7 = _WBSLocalizedString();
    int v8 = [v6 stringWithFormat:v7];

    id v9 = NSString;
    BOOL v10 = _WBSLocalizedString();
    id v11 = [v9 localizedStringWithFormat:v10];

    id v12 = [MEMORY[0x263F82418] alertControllerWithTitle:v8 message:v11 preferredStyle:1];
    long long v13 = (void *)MEMORY[0x263F82400];
    long long v14 = _WBSLocalizedString();
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __96__PMSharedAccountsGroupMemberPickerViewController__handleSelectionForMultipleRecipientsInGroup___block_invoke_2;
    v43[3] = &unk_26543A1E8;
    v43[4] = self;
    long long v15 = [v13 actionWithTitle:v14 style:0 handler:v43];
    [v12 addAction:v15];

LABEL_21:
    [(PMSharedAccountsGroupMemberPickerViewController *)self presentViewController:v12 animated:1 completion:0];

    goto LABEL_22;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = v5;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    v36 = v5;
    char v37 = 0;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v22 = [v21 normalizedAddress];
        BOOL v23 = [(PMSharedAccountsGroupMemberPickerViewController *)self _isAddressAlreadyPartOfGroupOrInvitedAddresses:v22];

        if (!v23)
        {
          addressToEligibility = self->_addressToEligibility;
          id v25 = [v21 normalizedAddress];
          id v26 = [(NSMutableDictionary *)addressToEligibility objectForKeyedSubscript:v25];
          int v27 = [v26 BOOLValue];

          if (v27) {
            [(PMSharedAccountsGroupMemberPickerViewController *)self _addRecipient:v21];
          }
          else {
            char v37 = 1;
          }
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v18);

    id v5 = v36;
    if (v37)
    {
      id v28 = [v4 displayString];
      uint64_t v29 = [v28 length];

      if (v29)
      {
        v30 = NSString;
        uint64_t v31 = _WBSLocalizedString();
        uint64_t v32 = [v4 displayString];
        int v8 = objc_msgSend(v30, "stringWithFormat:", v31, v32);
      }
      else
      {
        int v8 = _WBSLocalizedString();
      }
      id v11 = +[PMOngoingCredentialSharingStrings unableToInviteMultipleContactsBecauseOfUnsupportedDevicesAlertMessage];
      id v12 = [MEMORY[0x263F82418] alertControllerWithTitle:v8 message:v11 preferredStyle:1];
      v33 = (void *)MEMORY[0x263F82400];
      v34 = _WBSLocalizedString();
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __96__PMSharedAccountsGroupMemberPickerViewController__handleSelectionForMultipleRecipientsInGroup___block_invoke_3;
      v38[3] = &unk_26543A1E8;
      v38[4] = self;
      v35 = [v33 actionWithTitle:v34 style:0 handler:v38];
      [v12 addAction:v35];

      goto LABEL_21;
    }
  }
  else
  {
  }
  [(PMSharedAccountsGroupMemberPickerViewController *)self _resetSearchQuery];
LABEL_22:
}

uint64_t __96__PMSharedAccountsGroupMemberPickerViewController__handleSelectionForMultipleRecipientsInGroup___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1008);
  id v3 = [a2 normalizedAddress];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4) {
    uint64_t v5 = [v4 BOOLValue] ^ 1;
  }
  else {
    uint64_t v5 = 1;
  }

  return v5;
}

uint64_t __96__PMSharedAccountsGroupMemberPickerViewController__handleSelectionForMultipleRecipientsInGroup___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetSearchQuery];
}

uint64_t __96__PMSharedAccountsGroupMemberPickerViewController__handleSelectionForMultipleRecipientsInGroup___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetSearchQuery];
}

- (void)_addRecipient:(id)a3
{
  [(CNComposeRecipientTextView *)self->_recipientTextView addRecipient:a3];
  [(PMSharedAccountsGroupMemberPickerViewController *)self _resetSearchQuery];
  id v4 = [(PMSharedAccountsGroupMemberPickerViewController *)self navigationItem];
  uint64_t v5 = [v4 rightBarButtonItem];
  [v5 setEnabled:1];

  [(PMSharedAccountsGroupMemberPickerViewController *)self _updateRecipientTextViewHeight];
}

- (void)_updateRecipientTextViewHeight
{
  id v3 = [(CNComposeRecipientTextView *)self->_recipientTextView textView];
  [v3 contentSize];
  double v5 = v4;

  [MEMORY[0x263F33440] preferredHeight];
  if (v6 <= (double)(unint64_t)v5) {
    double v6 = (double)(unint64_t)v5;
  }
  double v7 = (double)(unint64_t)v6;
  [(NSLayoutConstraint *)self->_recipientTextViewHeightConstraint constant];
  if (v8 != v7)
  {
    recipientTextViewHeightConstraint = self->_recipientTextViewHeightConstraint;
    [(NSLayoutConstraint *)recipientTextViewHeightConstraint setConstant:v7];
  }
}

- (void)_resetSearchQuery
{
  [(CNComposeRecipientTextView *)self->_recipientTextView clearText];
  [(CNAutocompleteResultsTableViewController *)self->_contactsResultsTableViewController setRecipients:MEMORY[0x263EFFA68]];
  id v3 = (id)[(CNAutocompleteSearchManager *)self->_contactsSearchManager searchForText:&stru_2706E08E0 consumer:self];
}

- (BOOL)_cachedIsRecipientEligible:(id)a3
{
  id v4 = a3;
  double v5 = [v4 children];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    double v7 = [v4 children];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __78__PMSharedAccountsGroupMemberPickerViewController__cachedIsRecipientEligible___block_invoke;
    v14[3] = &unk_26543A128;
    v14[4] = self;
    char v8 = objc_msgSend(v7, "safari_containsObjectPassingTest:", v14);

    return v8;
  }
  else
  {
    addressToEligibility = self->_addressToEligibility;
    id v11 = [v4 normalizedAddress];

    id v12 = [(NSMutableDictionary *)addressToEligibility objectForKeyedSubscript:v11];
    char v13 = [v12 BOOLValue];

    return v13;
  }
}

uint64_t __78__PMSharedAccountsGroupMemberPickerViewController__cachedIsRecipientEligible___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1008);
  id v3 = [a2 normalizedAddress];
  id v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 BOOLValue];

  return v5;
}

- (void)_updatePreferredHandleForRecipientIfNecessary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(PMSharedAccountsGroupMemberPickerViewController *)self _cachedIsRecipientEligible:v4])
    {
      addressToEligibility = self->_addressToEligibility;
      uint64_t v6 = [v4 normalizedAddress];
      double v7 = [(NSMutableDictionary *)addressToEligibility objectForKeyedSubscript:v6];
      char v8 = [v7 BOOLValue];

      if ((v8 & 1) == 0)
      {
        id v9 = [v4 children];
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __97__PMSharedAccountsGroupMemberPickerViewController__updatePreferredHandleForRecipientIfNecessary___block_invoke;
        v11[3] = &unk_26543A128;
        v11[4] = self;
        BOOL v10 = objc_msgSend(v9, "safari_firstObjectPassingTest:", v11);

        [(CNAutocompleteResultsTableViewController *)self->_contactsResultsTableViewController setPreferredRecipient:v10 forRecipient:v4];
      }
    }
  }
}

uint64_t __97__PMSharedAccountsGroupMemberPickerViewController__updatePreferredHandleForRecipientIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 1008);
  id v3 = [a2 normalizedAddress];
  id v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 BOOLValue];

  return v5;
}

- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5
{
  id v7 = a4;
  char v8 = (void (**)(id, void *))a5;
  if ([(PMSharedAccountsGroupMemberPickerViewController *)self _hasEligibilityCachedForRecipient:v7])
  {
    if ([(PMSharedAccountsGroupMemberPickerViewController *)self _cachedIsRecipientEligible:v7])
    {
      [MEMORY[0x263F825C8] tintColor];
    }
    else
    {
      [MEMORY[0x263F825C8] secondaryLabelColor];
    BOOL v10 = };
    v8[2](v8, v10);
  }
  else
  {
    id v9 = [MEMORY[0x263F825C8] secondaryLabelColor];
    v8[2](v8, v9);

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __114__PMSharedAccountsGroupMemberPickerViewController_autocompleteResultsController_tintColorForRecipient_completion___block_invoke;
    v11[3] = &unk_26543A210;
    char v13 = v8;
    v11[4] = self;
    id v12 = v7;
    [(PMSharedAccountsGroupMemberPickerViewController *)self _fetchEligibilityForRecipient:v12 completionHandler:v11];
  }
}

void __114__PMSharedAccountsGroupMemberPickerViewController_autocompleteResultsController_tintColorForRecipient_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if ([*(id *)(a1 + 32) _cachedIsRecipientEligible:*(void *)(a1 + 40)]) {
    [MEMORY[0x263F825C8] tintColor];
  }
  else {
  id v2 = [MEMORY[0x263F825C8] secondaryLabelColor];
  }
  (*(void (**)(uint64_t))(v1 + 16))(v1);
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(unint64_t)a5
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(PMSharedAccountsGroupMemberPickerViewController *)self _handleSelectionForMultipleRecipientsInGroup:v6];
  }
  else {
    [(PMSharedAccountsGroupMemberPickerViewController *)self _handleSelectionForSingleRecipient:v6];
  }
}

- (void)autocompleteResultsController:(id)a3 didRequestInfoAboutRecipient:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [v5 contact];

  id v7 = (void *)MEMORY[0x263EFEBF8];
  if (v6)
  {
    char v8 = [v5 contact];

    id v16 = [v7 viewControllerForContact:v8];

    id v9 = [(PMSharedAccountsGroupMemberPickerViewController *)self navigationController];
    [v9 pushViewController:v16 animated:1];
  }
  else
  {
    BOOL v10 = (void *)MEMORY[0x263EFE9F8];
    id v11 = [v5 normalizedAddress];

    v17[0] = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
    char v13 = [v10 contactWithDisplayName:0 handleStrings:v12];
    long long v14 = [v7 viewControllerForUnknownContact:v13];

    long long v15 = [(PMSharedAccountsGroupMemberPickerViewController *)self navigationController];
    [v15 pushViewController:v14 animated:1];
  }
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v7 = a4;
  if (self->_currentSearchTaskID) {
    -[CNAutocompleteSearchManager cancelTaskWithID:](self->_contactsSearchManager, "cancelTaskWithID:");
  }
  id v5 = [(CNAutocompleteSearchManager *)self->_contactsSearchManager searchForText:v7 consumer:self];
  currentSearchTaskID = self->_currentSearchTaskID;
  self->_currentSearchTaskID = v5;
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  id v5 = [(CNComposeRecipientTextView *)self->_recipientTextView recipients];
  BOOL v6 = [v5 count] != 0;
  id v7 = [(PMSharedAccountsGroupMemberPickerViewController *)self navigationItem];
  char v8 = [v7 rightBarButtonItem];
  [v8 setEnabled:v6];

  [(PMSharedAccountsGroupMemberPickerViewController *)self _updateRecipientTextViewHeight];
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  id v5 = (void *)[a3 mutableCopy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __91__PMSharedAccountsGroupMemberPickerViewController_consumeAutocompleteSearchResults_taskID___block_invoke;
  v7[3] = &unk_26543A238;
  v7[4] = self;
  objc_msgSend(v5, "safari_removeObjectsPassingTest:", v7);
  BOOL v6 = [(PMSharedAccountsGroupMemberPickerViewController *)self _recipientsWithEligibleAddressesAsDefaultAddressesIfPossible:v5];
  [(CNAutocompleteResultsTableViewController *)self->_contactsResultsTableViewController setRecipients:v6];
}

uint64_t __91__PMSharedAccountsGroupMemberPickerViewController_consumeAutocompleteSearchResults_taskID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([*(id *)(a1 + 32) _doesGroupOnlyContainKnownContacts:v3]) {
      uint64_t v4 = [*(id *)(a1 + 32) _isEveryMemberInContactsGroupAlreadyInSharingGroup:v3];
    }
    else {
      uint64_t v4 = 1;
    }
  }
  else
  {
    id v5 = [v3 contact];
    if (v5)
    {
      BOOL v6 = *(void **)(a1 + 32);
      id v7 = [v3 normalizedAddress];
      uint64_t v4 = [v6 _isAddressAlreadyPartOfGroupOrInvitedAddresses:v7];
    }
    else
    {
      uint64_t v4 = 1;
    }
  }
  return v4;
}

- (id)_recipientsWithEligibleAddressesAsDefaultAddressesIfPossible:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  if ([v4 count])
  {
    unint64_t v6 = 0;
    id v21 = v4;
    id v22 = v5;
    do
    {
      id v7 = [v5 objectAtIndex:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v23 = v7;
        char v8 = [v7 children];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v25;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v25 != v12) {
                objc_enumerationMutation(v9);
              }
              long long v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              addressToEligibility = self->_addressToEligibility;
              id v16 = [v14 normalizedAddress];
              uint64_t v17 = [(NSMutableDictionary *)addressToEligibility objectForKeyedSubscript:v16];
              int v18 = [v17 BOOLValue];

              if (v18)
              {
                uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F33448]) initWithChildren:v9 defaultChild:v14];
                id v5 = v22;
                [v22 replaceObjectAtIndex:v6 withObject:v19];

                goto LABEL_14;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
            id v5 = v22;
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_14:

        id v4 = v21;
        id v7 = v23;
      }

      ++v6;
    }
    while (v6 < [v4 count]);
  }

  return v5;
}

- (void)finishedSearchingForAutocompleteResults
{
  self->_currentSearchTaskID = 0;
  MEMORY[0x270F9A758]();
}

- (BOOL)shouldConfirmAddingRecipients
{
  return self->_shouldConfirmAddingRecipients;
}

- (void)setShouldConfirmAddingRecipients:(BOOL)a3
{
  self->_shouldConfirmAddingRecipients = a3;
}

- (PMSharedAccountsGroupMemberPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PMSharedAccountsGroupMemberPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_addressesThatHaveBeenFetched, 0);
  objc_storeStrong((id *)&self->_addressesCurrentlyBeingCheckedForAvailability, 0);
  objc_storeStrong((id *)&self->_recipientTextViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_alreadyAddedAddresses, 0);
  objc_storeStrong((id *)&self->_recipientGroupToEligibility, 0);
  objc_storeStrong((id *)&self->_addressToEligibility, 0);
  objc_storeStrong((id *)&self->_currentSearchTaskID, 0);
  objc_storeStrong((id *)&self->_contactsSearchManager, 0);
  objc_storeStrong((id *)&self->_recipientTextView, 0);

  objc_storeStrong((id *)&self->_contactsResultsTableViewController, 0);
}

void __99__PMSharedAccountsGroupMemberPickerViewController__fetchEligibilityForRecipient_completionHandler___block_invoke_2_33_cold_1(void **a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = *a1;
  id v3 = a2;
  id v4 = objc_msgSend(v2, "safari_privacyPreservingDescription");
  int v5 = 138412290;
  unint64_t v6 = v4;
  _os_log_error_impl(&dword_258906000, v3, OS_LOG_TYPE_ERROR, "Failed to check recipient eligibility for shared account groups with error: %@", (uint8_t *)&v5, 0xCu);
}

@end