@interface PKPeerPaymentFamilySettingsViewController
- (PKPeerPaymentFamilySettingsViewController)initWithPass:(id)a3 dataProvider:(id)a4 peerPaymentAccount:(id)a5 familyCollection:(id)a6;
- (id)_contactKeysToFetch;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSections;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_updateFamilyRows;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation PKPeerPaymentFamilySettingsViewController

- (PKPeerPaymentFamilySettingsViewController)initWithPass:(id)a3 dataProvider:(id)a4 peerPaymentAccount:(id)a5 familyCollection:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v31.receiver = self;
  v31.super_class = (Class)PKPeerPaymentFamilySettingsViewController;
  v13 = -[PKPeerPaymentFamilySettingsViewController initWithStyle:](&v31, sel_initWithStyle_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1));
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_paymentServiceDataProvider, a4);
    objc_storeStrong((id *)&v14->_peerPaymentAccount, a5);
    objc_storeStrong((id *)&v14->_familyCollection, a6);
    id v15 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    id v16 = objc_alloc(MEMORY[0x1E4F845E8]);
    v17 = [(PKPeerPaymentFamilySettingsViewController *)v14 _contactKeysToFetch];
    uint64_t v18 = [v16 initWithContactStore:v15 keysToFetch:v17];
    contactResolver = v14->_contactResolver;
    v14->_contactResolver = (PKContactResolver *)v18;

    v20 = [[PKContactAvatarManager alloc] initWithContactResolver:v14->_contactResolver paymentDataProvider:v14->_paymentServiceDataProvider];
    contactAvatarManager = v14->_contactAvatarManager;
    v14->_contactAvatarManager = v20;

    v22 = [PKPeerPaymentAssociatedAccountsController alloc];
    familyCollection = v14->_familyCollection;
    v24 = v14->_contactAvatarManager;
    id v25 = objc_alloc_init(MEMORY[0x1E4F848A0]);
    uint64_t v26 = [(PKPeerPaymentAssociatedAccountsController *)v22 initWithFamilyCollection:familyCollection avatarManager:v24 passLibraryDataProvider:v25 context:0];
    peerPaymentAssociatedAccountsController = v14->_peerPaymentAssociatedAccountsController;
    v14->_peerPaymentAssociatedAccountsController = (PKPeerPaymentAssociatedAccountsController *)v26;

    v28 = [(PKPeerPaymentFamilySettingsViewController *)v14 navigationItem];
    v29 = PKLocalizedPeerPaymentLexingtonString(&cfstr_MoreMenuFamily.isa, 0);
    [v28 setTitle:v29];

    [(PKPeerPaymentFamilySettingsViewController *)v14 _updateFamilyRows];
  }

  return v14;
}

- (void)_updateFamilyRows
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [(PKFamilyMemberCollection *)self->_familyCollection familyMembers];
  v4 = v3;
  if (self->_peerPaymentAccount && self->_familyCollection && [v3 count])
  {
    v22 = v4;
    v5 = +[PKPeerPaymentFamilyMemberRowModel sortedPeerPaymentFamilyMemberRowModelsForFamilyMembers:v4 peerPaymentAccount:self->_peerPaymentAccount];
    sortedFamilyMemberRowModels = self->_sortedFamilyMemberRowModels;
    self->_sortedFamilyMemberRowModels = v5;

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obj = self->_sortedFamilyMemberRowModels;
    uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v24 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v11 = [v10 familyMember];
          id v12 = [v10 account];
          v13 = [v12 altDSID];
          v14 = v13;
          if (v13)
          {
            id v15 = v13;
          }
          else
          {
            id v16 = [v10 invitation];
            id v15 = [v16 altDSID];
          }
          v17 = [(PKContactAvatarManager *)self->_contactAvatarManager cachedAvatarForAltDSID:v15];
          if (!v17)
          {
            contactAvatarManager = self->_contactAvatarManager;
            v19 = [v10 account];
            v20 = [v10 invitation];
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v25[2] = __62__PKPeerPaymentFamilySettingsViewController__updateFamilyRows__block_invoke;
            v25[3] = &unk_1E59CA910;
            v25[4] = v10;
            v25[5] = self;
            [(PKContactAvatarManager *)contactAvatarManager avatarForFamilyMember:v11 peerPaymentAccount:v19 invitation:v20 completion:v25];
          }
          [v10 setImage:v17];
        }
        uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v8);
    }

    v21 = [(PKPeerPaymentFamilySettingsViewController *)self tableView];
    [v21 reloadData];

    v4 = v22;
  }
}

void __62__PKPeerPaymentFamilySettingsViewController__updateFamilyRows__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKPeerPaymentFamilySettingsViewController__updateFamilyRows__block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  uint64_t v4 = *(void *)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__PKPeerPaymentFamilySettingsViewController__updateFamilyRows__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 48) tableView];
  [v2 reloadData];
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_sortedFamilyMemberRowModels count] + 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  unint64_t v7 = [a4 row];
  if (v7 >= [(NSArray *)self->_sortedFamilyMemberRowModels count])
  {
    uint64_t v8 = PKLocalizedPeerPaymentLexingtonString(&cfstr_BackOfPassFami_0.isa);
    v9 = [v6 dequeueReusableCellWithIdentifier:@"linkCell"];

    if (!v9) {
      v9 = (PKFamilyMemberTableViewCell *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"linkCell"];
    }
    v14 = [(PKFamilyMemberTableViewCell *)v9 textLabel];
    [v14 setText:v8];

    id v15 = [(PKFamilyMemberTableViewCell *)v9 textLabel];
    id v16 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [v15 setTextColor:v16];
  }
  else
  {
    uint64_t v8 = [(NSArray *)self->_sortedFamilyMemberRowModels objectAtIndex:v7];
    v9 = [v6 dequeueReusableCellWithIdentifier:@"familyMemberCell"];

    if (!v9)
    {
      v9 = [[PKFamilyMemberTableViewCell alloc] initWithStyle:1 reuseIdentifier:@"familyMemberCell"];
      id v10 = [(PKFamilyMemberTableViewCell *)v9 textLabel];
      id v11 = [MEMORY[0x1E4FB1618] labelColor];
      [v10 setTextColor:v11];

      id v12 = [(PKFamilyMemberTableViewCell *)v9 detailTextLabel];
      v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      [v12 setTextColor:v13];
    }
    [(PKFamilyMemberTableViewCell *)v9 setRowModel:v8];
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = [v6 row];
  if (v8 >= [(NSArray *)self->_sortedFamilyMemberRowModels count])
  {
    id v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Opening apple cash family sharing settings from dashboard menu", v18, 2u);
    }

    id v16 = PKPeerPaymentGetAppleCashFamilySettingsSensitiveURLForAltDSID();
    v17 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v17 openSensitiveURL:v16 withOptions:0];
  }
  else
  {
    v9 = [(NSArray *)self->_sortedFamilyMemberRowModels objectAtIndex:v8];
    id v10 = [v9 familyMember];

    id v11 = [(NSArray *)self->_sortedFamilyMemberRowModels objectAtIndex:v8];
    if ((unint64_t)([v11 state] - 1) <= 2)
    {
      id v12 = [[PKPeerPaymentAssociatedAccountPresentationContext alloc] initWithPKFamilyMember:v10 options:0];
      peerPaymentAssociatedAccountsController = self->_peerPaymentAssociatedAccountsController;
      v14 = [(PKPeerPaymentFamilySettingsViewController *)self navigationController];
      [(PKPeerPaymentAssociatedAccountsController *)peerPaymentAssociatedAccountsController presentAssociatedAccountsFlowWithPresentationContext:v12 fromNavigationController:v14];
    }
  }
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return (id)PKLocalizedPeerPaymentLexingtonString(&cfstr_BackOfPassFami.isa);
}

- (id)_contactKeysToFetch
{
  v11[6] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v11[0] = v2;
  Class v3 = (Class)_MergedGlobals_1_19[0]();
  uint64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  id v5 = -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", [v4 _supportsForceTouch]);
  v11[1] = v5;
  id v6 = [(Class)off_1EC33AEB8[0]() descriptorForRequiredKeys];
  v11[2] = v6;
  id v7 = [(Class)off_1EC33AEC0() descriptorForRequiredKeys];
  uint64_t v8 = *MEMORY[0x1E4F1ADC8];
  v11[3] = v7;
  v11[4] = v8;
  v11[5] = *MEMORY[0x1E4F1AEE0];
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:6];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentAssociatedAccountsController, 0);
  objc_storeStrong((id *)&self->_sortedFamilyMemberRowModels, 0);
  objc_storeStrong((id *)&self->_familyCollection, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_storeStrong((id *)&self->_contactAvatarManager, 0);

  objc_storeStrong((id *)&self->_contactResolver, 0);
}

@end