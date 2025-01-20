@interface PKPassSharesListSectionController
- (PKPassSharesListSectionController)init;
- (PKPassSharesListSectionController)initWithMode:(unint64_t)a3 sharesController:(id)a4 rootShare:(id)a5 delegate:(id)a6;
- (PKPassSharesListSectionControllerDelegate)delegate;
- (id)_alertForDisplayableError:(id)a3;
- (id)_alertForRevokeOptionsForShare:(id)a3;
- (id)_contactForPKShareRowItem:(id)a3;
- (id)_displayableShares;
- (id)_subtitleForShare:(id)a3;
- (id)_titleForPKShareRowItem:(id)a3;
- (id)decorateListCell:(id)a3 forPKShareRowItem:(id)a4;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_confirmRevokeShare:(id)a3;
- (void)_revokeAllShares;
- (void)_revokeShare:(id)a3 cascade:(BOOL)a4;
- (void)_updatePKShareRowItems;
- (void)_updateStopSharingItemToDisabled:(BOOL)a3;
- (void)dealloc;
- (void)didSelectItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)sharedPassSharesControllerDidUpdateShares:(id)a3;
@end

@implementation PKPassSharesListSectionController

- (PKPassSharesListSectionController)init
{
  return 0;
}

- (PKPassSharesListSectionController)initWithMode:(unint64_t)a3 sharesController:(id)a4 rootShare:(id)a5 delegate:(id)a6
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24[0] = @"SharesSection";
  v24[1] = @"ShareActionsSection";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v23.receiver = self;
  v23.super_class = (Class)PKPassSharesListSectionController;
  v15 = [(PKPassShareSectionController *)&v23 initWithIdentifiers:v14];

  if (v15)
  {
    v15->_mode = a3;
    objc_storeStrong((id *)&v15->_sharesController, a4);
    [(PKSharedPassSharesController *)v15->_sharesController addDelegate:v15];
    objc_storeWeak((id *)&v15->_delegate, v13);
    objc_storeStrong((id *)&v15->_rootShare, a5);
    objc_initWeak(&location, v15);
    v16 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v17 = objc_opt_class();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __86__PKPassSharesListSectionController_initWithMode_sharesController_rootShare_delegate___block_invoke;
    v20[3] = &unk_1E59CBB38;
    objc_copyWeak(&v21, &location);
    v18 = [v16 registrationWithCellClass:v17 configurationHandler:v20];
    [(PKPaymentSetupListSectionController *)v15 setCellRegistration:v18];

    [(PKPassSharesListSectionController *)v15 _updatePKShareRowItems];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __86__PKPassSharesListSectionController_initWithMode_sharesController_rootShare_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = (id)[WeakRetained decorateListCell:v9 forPKShareRowItem:v6];
  }
}

- (void)dealloc
{
  [(PKSharedPassSharesController *)self->_sharesController removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)PKPassSharesListSectionController;
  [(PKPassSharesListSectionController *)&v3 dealloc];
}

- (void)_updatePKShareRowItems
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v4 = [(PKPassSharesListSectionController *)self _displayableShares];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        v10 = objc_alloc_init(PKShareRowItem);
        [(PKShareRowItem *)v10 setShare:v9];
        id v11 = [(PKPassSharesListSectionController *)self _titleForPKShareRowItem:v10];
        [(PKShareRowItem *)v10 setTitle:v11];

        id v12 = [(PKPassSharesListSectionController *)self _subtitleForShare:v9];
        [(PKShareRowItem *)v10 setSubtitle:v12];

        id v13 = [(PKPassSharesListSectionController *)self _contactForPKShareRowItem:v10];
        [(PKShareRowItem *)v10 setContact:v13];

        [(PKShareRowItem *)v10 setShowContactAvatar:1];
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v6);
  }

  if ([(PKSharedPassSharesController *)self->_sharesController sharingEnabled]
    && !self->_rootShare)
  {
    v14 = objc_alloc_init(PKShareRowItem);
    v15 = PKLocalizedShareableCredentialString(&cfstr_ShareManagemen.isa);
    [(PKShareRowItem *)v14 setTitle:v15];

    v16 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(PKShareRowItem *)v14 setTitleTextColor:v16];

    uint64_t v17 = (void *)MEMORY[0x1E4FB1830];
    v18 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v38[0] = v18;
    v19 = [MEMORY[0x1E4FB1618] quaternaryLabelColor];
    v38[1] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    id v21 = [v17 configurationWithPaletteColors:v20];

    v22 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.circle.fill" withConfiguration:v21];
    [(PKShareRowItem *)v14 setIcon:v22];

    [(PKShareRowItem *)v14 setIsAddShareItem:1];
    [v3 addObject:v14];
  }
  objc_super v23 = (NSArray *)[v3 copy];
  shareItems = self->_shareItems;
  self->_shareItems = v23;

  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  rootShare = self->_rootShare;
  if (rootShare)
  {
    char v27 = [(PKPassShare *)rootShare isRevokable];
    if (self->_rootShare)
    {
      int v28 = 0;
      if (v27) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
  }
  else
  {
    char v27 = 0;
  }
  int v28 = [(PKSharedPassSharesController *)self->_sharesController hasRevokableShares];
  if (v27)
  {
LABEL_18:
    v29 = objc_alloc_init(PKShareRowItem);
    v30 = PKLocalizedShareableCredentialString(&cfstr_SharesListStop.isa);
    [(PKShareRowItem *)v29 setTitle:v30];

    v31 = [MEMORY[0x1E4FB1618] systemRedColor];
    [(PKShareRowItem *)v29 setTitleTextColor:v31];

    [(PKShareRowItem *)v29 setIsStopSharingItem:1];
    [(PKShareRowItem *)v29 setShouldCenterText:1];
    [v25 addObject:v29];

    goto LABEL_19;
  }
LABEL_17:
  if (v28) {
    goto LABEL_18;
  }
LABEL_19:
  v32 = (NSArray *)[v25 copy];
  actionItems = self->_actionItems;
  self->_actionItems = v32;
}

- (id)_contactForPKShareRowItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 contact];

  if (v5)
  {
    uint64_t v6 = [v4 contact];
  }
  else
  {
    uint64_t v7 = [v4 share];
    uint64_t v6 = [(PKSharedPassSharesController *)self->_sharesController contactForShare:v7];
    if (!v6 && ([v4 hasFetchedContact] & 1) == 0)
    {
      [v4 setHasFetchedContact:1];
      objc_initWeak(&location, self);
      sharesController = self->_sharesController;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __63__PKPassSharesListSectionController__contactForPKShareRowItem___block_invoke;
      v10[3] = &unk_1E59CE0A0;
      objc_copyWeak(&v12, &location);
      id v11 = v4;
      [(PKSharedPassSharesController *)sharesController fetchContactForShare:v7 withCompletion:v10];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }

  return v6;
}

void __63__PKPassSharesListSectionController__contactForPKShareRowItem___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (v5 && WeakRetained)
  {
    [*(id *)(a1 + 32) setContact:v5];
    id v4 = objc_loadWeakRetained(WeakRetained + 14);
    [v4 reloadItem:*(void *)(a1 + 32) animated:1];
  }
}

- (id)_titleForPKShareRowItem:(id)a3
{
  id v3 = a3;
  id v4 = [v3 share];
  id v5 = [v3 contact];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F84D88];
    uint64_t v7 = [v4 recipientHandle];
    id v8 = [v6 displayNameForCounterpartHandle:v7 contact:v5];

    if ([v8 length]) {
      goto LABEL_9;
    }
    id v9 = [v4 recipientNickname];
  }
  else
  {
    v10 = [v4 recipientNickname];
    if (!v10)
    {
      uint64_t v11 = [v4 recipientHandle];
      id v8 = 0;
      goto LABEL_8;
    }
    id v9 = v10;
    id v8 = v9;
  }
  uint64_t v11 = (uint64_t)v9;
LABEL_8:

  id v8 = (void *)v11;
LABEL_9:

  return v8;
}

- (id)_subtitleForShare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 status];
  if ((unint64_t)(v5 - 2) < 4)
  {
    uint64_t v6 = @"SHARED_KEY_INVITED_CELL_SUBTITLE";
  }
  else
  {
    if ((unint64_t)(v5 - 6) >= 3)
    {
      if (v5 == 1)
      {
        id v9 = [(PKSharedPassSharesController *)self->_sharesController pass];
        int v10 = [v9 isCarKeyPass];

        uint64_t v11 = [v4 displayableSharedEntitlements];
        id v12 = v11;
        if (v10)
        {
          id v13 = [v11 firstObject];

          uint64_t v7 = [v13 localizedTitle];
        }
        else
        {
          v14 = [(PKSharedPassSharesController *)self->_sharesController shareableEntitlements];
          unint64_t v15 = [v12 count];
          if (v15 >= [v14 count]) {
            v16 = @"SHARE_OVERVIEW_SECTION_ENTITLEMENTS_FULL_ACCESS";
          }
          else {
            v16 = @"SHARE_OVERVIEW_SECTION_ENTITLEMENTS_CUSTOM_ACCESS";
          }
          uint64_t v7 = PKLocalizedShareableCredentialString(&v16->isa);
        }
      }
      else
      {
        uint64_t v7 = 0;
      }
      goto LABEL_6;
    }
    uint64_t v6 = @"SHARED_KEY_REVOKING_CELL_SUBTITLE";
  }
  uint64_t v7 = PKLocalizedCredentialString(&v6->isa);
LABEL_6:

  return v7;
}

- (id)_displayableShares
{
  if (self->_rootShare)
  {
    id v3 = -[PKSharedPassSharesController childSharesOfShare:](self->_sharesController, "childSharesOfShare:");
  }
  else
  {
    int v4 = PKShowLocalPassShares();
    sharesController = self->_sharesController;
    if (v4) {
      [(PKSharedPassSharesController *)sharesController shares];
    }
    else {
    id v3 = [(PKSharedPassSharesController *)sharesController nonLocalShares];
    }
  }

  return v3;
}

- (void)_updateStopSharingItemToDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(NSArray *)self->_actionItems pk_firstObjectPassingTest:&__block_literal_global_39];
  if (v5)
  {
    id v8 = v5;
    if (v3) {
      [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    else {
    uint64_t v6 = [MEMORY[0x1E4FB1618] systemRedColor];
    }
    [v8 setTitleTextColor:v6];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained reloadItem:v8 animated:1];

    uint64_t v5 = v8;
  }
}

uint64_t __70__PKPassSharesListSectionController__updateStopSharingItemToDisabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isStopSharingItem];
}

- (id)decorateListCell:(id)a3 forPKShareRowItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = [v6 title];
  [v7 setText:v9];

  int v10 = [v7 textProperties];
  uint64_t v11 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], 0);
  [v10 setFont:v11];

  id v12 = [v6 titleTextColor];

  if (v12)
  {
    id v13 = [v6 titleTextColor];
    [v10 setColor:v13];
  }
  if ([v6 showContactAvatar])
  {
    v14 = objc_alloc_init(PKAvatarView);
    [(PKAvatarView *)v14 setDiameter:35.0];
    unint64_t v15 = [v6 contact];
    if (v15)
    {
      [(PKAvatarView *)v14 setContact:v15];
    }
    else
    {
      v18 = [v6 share];
      v19 = [v18 recipientNickname];
      [(PKAvatarView *)v14 setPlaceholderName:v19];
    }
    v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v14 placement:0];
    [v8 addObject:v20];
    [v20 setReservedLayoutWidth:35.0];
  }
  else
  {
    v16 = [v6 icon];

    if (!v16) {
      goto LABEL_11;
    }
    v14 = objc_alloc_init(PKAvatarView);
    [(PKAvatarView *)v14 setDiameter:35.0];
    uint64_t v17 = [v6 icon];
    [(PKAvatarView *)v14 setPlaceholderImage:v17];

    unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v14 placement:0];
    [v8 addObject:v15];
    [v15 setReservedLayoutWidth:35.0];
  }

LABEL_11:
  if ([v6 shouldCenterText]) {
    [v10 setAlignment:1];
  }
  [v7 directionalLayoutMargins];
  double v22 = v21;
  double v24 = v23;
  id v25 = [v6 subtitle];
  if (v25)
  {
    v26 = [v6 subtitle];
    [v7 setSecondaryText:v26];

    char v27 = [v7 secondaryTextProperties];
    int v28 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v27 setColor:v28];

    v29 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], 0);
    [v27 setFont:v29];

    double v30 = 10.0;
  }
  else
  {
    double v30 = 15.0;
  }
  objc_msgSend(v7, "setDirectionalLayoutMargins:", v30, v22, v30, v24);
  [v5 setContentConfiguration:v7];
  [v5 setConfigurationUpdateHandler:&__block_literal_global_169];
  v31 = [v6 share];

  if (v31)
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4FB1518]);
    [v8 addObject:v32];
  }
  [v5 setAccessories:v8];

  return v7;
}

void __72__PKPassSharesListSectionController_decorateListCell_forPKShareRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  int v4 = (void *)MEMORY[0x1E4FB1498];
  id v5 = a2;
  id v6 = [v4 listGroupedCellConfiguration];
  if ([v9 isHighlighted] & 1) != 0 || (objc_msgSend(v9, "isSelected"))
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  id v8 = (void *)v7;
  [v6 setBackgroundColor:v7];

  [v5 setBackgroundConfiguration:v6];
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  if (!PKEqualObjects() || (actionItems = self->_shareItems) == 0)
  {
    if (!PKEqualObjects()) {
      goto LABEL_6;
    }
    actionItems = self->_actionItems;
  }
  [v6 appendItems:actionItems];
LABEL_6:

  return v6;
}

- (void)didSelectItem:(id)a3
{
  id v8 = a3;
  int v4 = [v8 share];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [v8 share];
    [WeakRetained passSharesListSectionController:self didSelectShare:v6];

LABEL_5:
    goto LABEL_6;
  }
  if ([v8 isAddShareItem])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained passSharesListSectionControllerDidSelectAddShare:self];
    goto LABEL_5;
  }
  if ([v8 isStopSharingItem])
  {
    [(PKPassSharesListSectionController *)self _updateStopSharingItemToDisabled:1];
    [(PKPassSharesListSectionController *)self _confirmRevokeShare:self->_rootShare];
  }
LABEL_6:
  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  [v7 deselectCells];
}

- (void)_confirmRevokeShare:(id)a3
{
  id v6 = a3;
  int v4 = -[PKPassSharesListSectionController _alertForRevokeOptionsForShare:](self, "_alertForRevokeOptionsForShare:");
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained passSharesListSectionController:self presentAlert:v4];
  }
  else
  {
    [(PKPassSharesListSectionController *)self _revokeShare:v6 cascade:0];
  }
}

- (void)_revokeShare:(id)a3 cascade:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_initWeak(&location, self);
  sharesController = self->_sharesController;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PKPassSharesListSectionController__revokeShare_cascade___block_invoke;
  v8[3] = &unk_1E59CE0E8;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  [(PKSharedPassSharesController *)sharesController revokeShare:v6 shouldCascade:v4 withCompletion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __58__PKPassSharesListSectionController__revokeShare_cascade___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
    [v4 passSharesListSectionController:WeakRetained setIsLoading:0];

    [WeakRetained _updateStopSharingItemToDisabled:0];
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
    id v6 = v5;
    if (v9)
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = objc_msgSend(v7, "_alertForDisplayableError:");
      [v6 passSharesListSectionController:v7 presentAlert:v8];
    }
    else
    {
      [v5 passSharesListSectionControllerDidFinishRevokingShares:WeakRetained];
    }
  }
}

- (void)_revokeAllShares
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained passSharesListSectionController:self setIsLoading:1];

  objc_initWeak(&location, self);
  sharesController = self->_sharesController;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__PKPassSharesListSectionController__revokeAllShares__block_invoke;
  v5[3] = &unk_1E59CE0E8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  [(PKSharedPassSharesController *)sharesController revokeAllSharesWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __53__PKPassSharesListSectionController__revokeAllShares__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
    [v4 passSharesListSectionController:WeakRetained setIsLoading:0];

    [WeakRetained _updateStopSharingItemToDisabled:0];
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
    id v6 = v5;
    if (v9)
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = objc_msgSend(v7, "_alertForDisplayableError:");
      [v6 passSharesListSectionController:v7 presentAlert:v8];
    }
    else
    {
      [v5 passSharesListSectionControllerDidFinishRevokingShares:WeakRetained];
    }
  }
}

- (id)_alertForRevokeOptionsForShare:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSharedPassSharesController *)self->_sharesController childSharesOfShare:v4];
  uint64_t v6 = [v5 count];

  if (!v4 || v6)
  {
    if (self->_rootShare) {
      id v8 = @"SHARE_MANAGEMENT_REVOKE_CONFIRMATION_STOP_SHARING";
    }
    else {
      id v8 = @"SHARE_MANAGEMENT_REVOKE_CONFIRMATION_STOP_SHARING_ALL_SHARE";
    }
    id v9 = PKLocalizedShareableCredentialString(&v8->isa);
    id v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:0 preferredStyle:0];
    if (!v4) {
      goto LABEL_9;
    }
    int v10 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v11 = PKLocalizedShareableCredentialString(&cfstr_ShareManagemen_2.isa);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __68__PKPassSharesListSectionController__alertForRevokeOptionsForShare___block_invoke;
    void v24[3] = &unk_1E59CB218;
    v24[4] = self;
    id v25 = v4;
    id v12 = [v10 actionWithTitle:v11 style:2 handler:v24];
    [v7 addAction:v12];

    if (v6)
    {
LABEL_9:
      id v13 = (void *)MEMORY[0x1E4FB1410];
      v14 = PKLocalizedShareableCredentialString(&cfstr_ShareManagemen_3.isa);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __68__PKPassSharesListSectionController__alertForRevokeOptionsForShare___block_invoke_2;
      v21[3] = &unk_1E59CB218;
      id v22 = v4;
      double v23 = self;
      unint64_t v15 = [v13 actionWithTitle:v14 style:2 handler:v21];
      [v7 addAction:v15];
    }
    v16 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v17 = PKLocalizedString(&cfstr_CancelButtonTi.isa);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__PKPassSharesListSectionController__alertForRevokeOptionsForShare___block_invoke_3;
    v20[3] = &unk_1E59CB1F0;
    void v20[4] = self;
    v18 = [v16 actionWithTitle:v17 style:1 handler:v20];
    [v7 addAction:v18];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

uint64_t __68__PKPassSharesListSectionController__alertForRevokeOptionsForShare___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _revokeShare:*(void *)(a1 + 40) cascade:0];
}

uint64_t __68__PKPassSharesListSectionController__alertForRevokeOptionsForShare___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2) {
    return [v1 _revokeShare:v2 cascade:1];
  }
  else {
    return [v1 _revokeAllShares];
  }
}

uint64_t __68__PKPassSharesListSectionController__alertForRevokeOptionsForShare___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStopSharingItemToDisabled:0];
}

- (id)_alertForDisplayableError:(id)a3
{
  BOOL v3 = (NSError *)a3;
  id v4 = PKSharingDisplayableError(v3);
  if (!v4)
  {
    id v5 = PKLocalizedShareableCredentialString(&cfstr_RevokeShareErr.isa);
    uint64_t v6 = PKLocalizedShareableCredentialString(&cfstr_RevokeShareErr_0.isa);
    id v4 = PKDisplayableErrorCustom();
  }
  id v7 = [v4 userInfo];
  id v8 = (void *)MEMORY[0x1E4FB1418];
  id v9 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];
  int v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F285A0]];
  uint64_t v11 = [v8 alertControllerWithTitle:v9 message:v10 preferredStyle:1];

  id v12 = (void *)MEMORY[0x1E4FB1410];
  id v13 = PKLocalizedString(&cfstr_OkButtonTitle.isa);
  v14 = [v12 actionWithTitle:v13 style:0 handler:0];
  [v11 addAction:v14];

  return v11;
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_rootShare && [(NSArray *)self->_shareItems count] && PKEqualObjects())
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v6 = PKLocalizedShareableCredentialString(&cfstr_ShareViewingSh.isa);
    v12[0] = *MEMORY[0x1E4FB06F8];
    id v7 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB27B8], 2, 0);
    v13[0] = v7;
    v12[1] = *MEMORY[0x1E4FB0700];
    id v8 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v13[1] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    int v10 = (void *)[v5 initWithString:v6 attributes:v9];
  }
  else
  {
    int v10 = 0;
  }

  return v10;
}

- (void)sharedPassSharesControllerDidUpdateShares:(id)a3
{
  [(PKPassSharesListSectionController *)self _updatePKShareRowItems];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained reloadDataAnimated:1];
}

- (PKPassSharesListSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassSharesListSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionItems, 0);
  objc_storeStrong((id *)&self->_shareItems, 0);
  objc_storeStrong((id *)&self->_rootShare, 0);

  objc_storeStrong((id *)&self->_sharesController, 0);
}

@end