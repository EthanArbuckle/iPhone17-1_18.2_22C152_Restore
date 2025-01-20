@interface PKPeerPaymentFamilyCircleViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKPeerPaymentFamilyCircleViewController)initWithFamilyCollection:(id)a3 avatarManager:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6;
- (id)_familyMemberWithDSID:(id)a3;
- (id)_pendingInvitations;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_handleRowTapped:(id)a3;
- (void)_loadAvatarImagesIfNecessary;
- (void)_peerPaymentAccountChanged:(id)a3;
- (void)_reloadSortedRows;
- (void)addPeerPaymentAssociatedAccountSetupCompletedWithSucess:(BOOL)a3 updatedAccount:(id)a4 forFamilyMember:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentFamilyCircleViewController

- (PKPeerPaymentFamilyCircleViewController)initWithFamilyCollection:(id)a3 avatarManager:(id)a4 passLibraryDataProvider:(id)a5 context:(int64_t)a6
{
  id v26 = a3;
  id v11 = a4;
  id v12 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PKPeerPaymentFamilyCircleViewController;
  v13 = -[PKPeerPaymentFamilyCircleViewController initWithStyle:](&v27, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1));
  if (v13)
  {
    v14 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E4F84C38]);
    paymentService = v13->_paymentService;
    v13->_paymentService = v14;

    uint64_t v16 = [MEMORY[0x1E4F84E00] sharedInstance];
    peerPaymentService = v13->_peerPaymentService;
    v13->_peerPaymentService = (PKPeerPaymentService *)v16;

    uint64_t v18 = [(PKPeerPaymentService *)v13->_peerPaymentService account];
    account = v13->_account;
    v13->_account = (PKPeerPaymentAccount *)v18;

    objc_storeStrong((id *)&v13->_familyCollection, a3);
    objc_storeStrong((id *)&v13->_avatarManager, a4);
    objc_storeStrong((id *)&v13->_passLibraryDataProvider, a5);
    v13->_context = a6;
    v20 = [v26 familyMembers];
    uint64_t v21 = +[PKPeerPaymentFamilyMemberRowModel sortedPeerPaymentFamilyMemberRowModelsForFamilyMembers:v20 peerPaymentAccount:v13->_account];
    sortedRows = v13->_sortedRows;
    v13->_sortedRows = (NSArray *)v21;

    [(PKPeerPaymentFamilyCircleViewController *)v13 _loadAvatarImagesIfNecessary];
    v23 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentFam.isa);
    [(PKPeerPaymentFamilyCircleViewController *)v13 setTitle:v23];

    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v13 selector:sel__peerPaymentAccountChanged_ name:*MEMORY[0x1E4F87CB0] object:v13->_peerPaymentService];
  }
  return v13;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentFamilyCircleViewController;
  [(PKPeerPaymentFamilyCircleViewController *)&v5 viewDidLoad];
  v3 = [(PKPeerPaymentFamilyCircleViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"kFamilyMemberCellReuseIdentifier"];

  v4 = [(PKPeerPaymentFamilyCircleViewController *)self tableView];
  objc_msgSend(v4, "pkui_setupForReadableContentGuide");
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PKPeerPaymentFamilyCircleViewController;
  [(PKPeerPaymentFamilyCircleViewController *)&v13 viewDidAppear:a3];
  if (([(PKPeerPaymentAccount *)self->_account supportsFamilySharing] & 1) == 0)
  {
    v4 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Peer Payment family sharing feature not supported.", v12, 2u);
    }

    objc_super v5 = (void *)MEMORY[0x1E4FB1418];
    v6 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentFea.isa);
    v7 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentFea_0.isa);
    v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];

    v9 = (void *)MEMORY[0x1E4FB1410];
    v10 = PKLocalizedString(&cfstr_Ok.isa);
    id v11 = [v9 actionWithTitle:v10 style:0 handler:0];

    [v8 addAction:v11];
    [(PKPeerPaymentFamilyCircleViewController *)self presentViewController:v8 animated:1 completion:0];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(PKPeerPaymentAccount *)self->_account supportsFamilySharing];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (![(PKPeerPaymentAccount *)self->_account supportsFamilySharing]) {
    return 0;
  }
  sortedRows = self->_sortedRows;

  return [(NSArray *)sortedRows count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"kFamilyMemberCellReuseIdentifier" forIndexPath:v6];
  sortedRows = self->_sortedRows;
  uint64_t v9 = [v6 row];

  v10 = [(NSArray *)sortedRows objectAtIndex:v9];
  [v7 setRowModel:v10];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  sortedRows = self->_sortedRows;
  uint64_t v8 = [v6 row];

  id v9 = [(NSArray *)sortedRows objectAtIndex:v8];
  [(PKPeerPaymentFamilyCircleViewController *)self _handleRowTapped:v9];
}

- (void)_handleRowTapped:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 state];
  if ((unint64_t)(v4 - 1) >= 2)
  {
    if (v4 != 3) {
      goto LABEL_6;
    }
    uint64_t v8 = [PKPeerPaymentTurnOnAssociatedAccountViewController alloc];
    id v6 = [v11 familyMember];
    uint64_t v7 = [(PKPeerPaymentTurnOnAssociatedAccountViewController *)v8 initWithFamilyMember:v6 familyCollection:self->_familyCollection delegate:self passLibraryDataProvider:self->_passLibraryDataProvider context:self->_context setupType:0];
  }
  else
  {
    objc_super v5 = [PKPeerPaymentAssociatedAccountViewController alloc];
    id v6 = [v11 familyMember];
    uint64_t v7 = [(PKPeerPaymentAssociatedAccountViewController *)v5 initWithFamilyMember:v6 familyCollection:self->_familyCollection account:self->_account context:self->_context];
  }
  id v9 = (void *)v7;

  v10 = [(PKPeerPaymentFamilyCircleViewController *)self navigationController];
  [v10 pushViewController:v9 animated:1];

LABEL_6:
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = -[NSArray objectAtIndex:](self->_sortedRows, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  BOOL v5 = [v4 state] != 4;

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentFam_0.isa);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v4 = [(PKPeerPaymentFamilyCircleViewController *)self _pendingInvitations];
  if ([v4 count])
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = PKLocalizedPeerPaymentLexingtonString(&cfstr_BackOfPassFami.isa);
  }

  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  uint64_t v4 = [(PKPeerPaymentFamilyCircleViewController *)self _pendingInvitations];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = objc_alloc_init(PKFooterHyperlinkView);
    uint64_t v7 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentFam_1.isa);
    uint64_t v8 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentFam_2.isa, &stru_1EF1B4C70.isa, v7);
    id v9 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://support.apple.com/kb/HT211324"];
    v10 = PKAttributedStringByAddingLinkToSubstring(v8, v7, v9);
    [(PKFooterHyperlinkView *)v6 setAttributedText:v10];

    id v11 = &__block_literal_global_47;
    [(PKFooterHyperlinkView *)v6 setAction:&__block_literal_global_47];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)addPeerPaymentAssociatedAccountSetupCompletedWithSucess:(BOOL)a3 updatedAccount:(id)a4 forFamilyMember:(id)a5
{
  BOOL v7 = a3;
  id v21 = a4;
  id v9 = a5;
  if (v7)
  {
    if (v21) {
      objc_storeStrong((id *)&self->_account, a4);
    }
    [(PKPeerPaymentFamilyCircleViewController *)self _reloadSortedRows];
    v10 = [(PKPeerPaymentFamilyCircleViewController *)self navigationController];
    id v11 = [v10 viewControllers];
    id v12 = (void *)[v11 mutableCopy];

    objc_super v13 = [v12 lastObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v12 removeLastObject];
    }
    account = self->_account;
    v15 = [v9 altDSID];
    uint64_t v16 = [(PKPeerPaymentAccount *)account peerPaymentAccountWithAltDSID:v15];

    if (v16)
    {
      v17 = [[PKPeerPaymentAssociatedAccountViewController alloc] initWithFamilyMember:v9 familyCollection:self->_familyCollection account:self->_account context:self->_context];
      [v12 addObject:v17];
    }
    uint64_t v18 = [(PKPeerPaymentFamilyCircleViewController *)self navigationController];
    v19 = (void *)[v12 copy];
    [v18 setViewControllers:v19];
  }
  v20 = [(PKPeerPaymentFamilyCircleViewController *)self navigationController];
  [v20 dismissViewControllerAnimated:1 completion:0];
}

- (id)_pendingInvitations
{
  return (id)[(NSArray *)self->_sortedRows pk_objectsPassingTest:&__block_literal_global_41];
}

BOOL __62__PKPeerPaymentFamilyCircleViewController__pendingInvitations__block_invoke(uint64_t a1, void *a2)
{
  return [a2 state] == 4;
}

- (void)_reloadSortedRows
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = self->_sortedRows;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "familyMember", (void)v14);
        v10 = [v9 altDSID];

        id v11 = [(PKPeerPaymentAccount *)self->_account peerPaymentAccountWithAltDSID:v10];
        [v8 setAccount:v11];

        id v12 = [(PKPeerPaymentAccount *)self->_account accountInvitationWithAltDSID:v10];
        [v8 setInvitation:v12];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  objc_super v13 = [(PKPeerPaymentFamilyCircleViewController *)self tableView];
  [v13 reloadData];
}

- (void)_loadAvatarImagesIfNecessary
{
  if ([(PKPeerPaymentAccount *)self->_account supportsFamilySharing])
  {
    if ([(NSArray *)self->_sortedRows count])
    {
      unint64_t v3 = 0;
      id v12 = v14;
      do
      {
        uint64_t v15 = 0;
        long long v16 = &v15;
        uint64_t v17 = 0x3032000000;
        uint64_t v18 = __Block_byref_object_copy__5;
        uint64_t v19 = __Block_byref_object_dispose__5;
        -[NSArray objectAtIndexedSubscript:](self->_sortedRows, "objectAtIndexedSubscript:", v3, v12);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v4 = [(id)v16[5] familyMember];
        uint64_t v5 = [v4 altDSID];

        if (v5)
        {
          uint64_t v6 = [(PKContactAvatarManager *)self->_avatarManager cachedAvatarForAltDSID:v5];
          [(id)v16[5] setImage:v6];
          if (!v6)
          {
            avatarManager = self->_avatarManager;
            uint64_t v8 = [(id)v16[5] familyMember];
            account = self->_account;
            v10 = [(id)v16[5] invitation];
            v13[0] = MEMORY[0x1E4F143A8];
            v13[1] = 3221225472;
            v14[0] = __71__PKPeerPaymentFamilyCircleViewController__loadAvatarImagesIfNecessary__block_invoke;
            v14[1] = &unk_1E59CE218;
            v14[2] = self;
            v14[3] = &v15;
            v14[4] = v3;
            [(PKContactAvatarManager *)avatarManager avatarForFamilyMember:v8 peerPaymentAccount:account invitation:v10 completion:v13];
          }
        }

        _Block_object_dispose(&v15, 8);
        ++v3;
      }
      while (v3 < [(NSArray *)self->_sortedRows count]);
    }
    id v11 = [(PKPeerPaymentFamilyCircleViewController *)self tableView];
    [v11 reloadData];
  }
}

void __71__PKPeerPaymentFamilyCircleViewController__loadAvatarImagesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__PKPeerPaymentFamilyCircleViewController__loadAvatarImagesIfNecessary__block_invoke_2;
  v5[3] = &unk_1E59CE1F0;
  id v6 = v3;
  long long v7 = *(_OWORD *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 48);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __71__PKPeerPaymentFamilyCircleViewController__loadAvatarImagesIfNecessary__block_invoke_2(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setImage:*(void *)(a1 + 32)];
  v2 = [*(id *)(a1 + 40) tableView];
  id v3 = [MEMORY[0x1E4F28D58] indexPathForRow:*(void *)(a1 + 56) inSection:0];
  v5[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [v2 reloadRowsAtIndexPaths:v4 withRowAnimation:100];
}

- (id)_familyMemberWithDSID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = self->_sortedRows;
  id v6 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "familyMember", (void)v14);
        id v11 = [v10 dsid];
        int v12 = PKEqualObjects();

        if (v12)
        {
          id v6 = [v9 familyMember];
          goto LABEL_11;
        }
      }
      id v6 = (void *)[(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_peerPaymentAccountChanged:(id)a3
{
  peerPaymentService = self->_peerPaymentService;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __70__PKPeerPaymentFamilyCircleViewController__peerPaymentAccountChanged___block_invoke;
  v4[3] = &unk_1E59CE240;
  v4[4] = self;
  [(PKPeerPaymentService *)peerPaymentService updateAccountWithCompletion:v4];
}

void __70__PKPeerPaymentFamilyCircleViewController__peerPaymentAccountChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __70__PKPeerPaymentFamilyCircleViewController__peerPaymentAccountChanged___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __70__PKPeerPaymentFamilyCircleViewController__peerPaymentAccountChanged___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1048), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);

  return [v2 _reloadSortedRows];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passLibraryDataProvider, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_sortedRows, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);

  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end