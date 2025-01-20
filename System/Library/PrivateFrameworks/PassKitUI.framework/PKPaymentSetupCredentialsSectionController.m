@interface PKPaymentSetupCredentialsSectionController
- ($96EE1C12479E9B303E9C2794B92A11A2)credentialSelectionState;
- (BOOL)_canSelectedCredential:(id)a3;
- (BOOL)_enumerateCredentials:(id)a3;
- (BOOL)_hasCredentialsToShow;
- (BOOL)_isCarKeyProduct;
- (BOOL)_setCredential:(id)a3 selected:(BOOL)a4 silently:(BOOL)a5;
- (BOOL)doesContainCredentialThatRequiresAuth:(id)a3;
- (BOOL)hasSelectedCredentials;
- (BOOL)shouldHighlightItem:(id)a3;
- (BOOL)shouldShowEditButton;
- (CGSize)_defaultCardSize;
- (PKDynamicListDataChangeDelegate)dataChangeDelegate;
- (PKPaymentSetupCredentialsSectionController)initWithCredentials:(id)a3 provisioningController:(id)a4 context:(int64_t)a5 product:(id)a6;
- (PKPaymentSetupCredentialsSectionControllerDelegate)delegate;
- (id)_cardArtForCredentialItem:(id)a3;
- (id)_credentialItemForCredential:(id)a3;
- (id)_credentialItemFromIndexPath:(id)a3;
- (id)_detailTextForCredential:(id)a3;
- (id)_titleTextForCredential:(id)a3;
- (id)availableCredentialRequiringAction;
- (id)decoratePaymentSetListCell:(id)a3 forItem:(id)a4;
- (id)footerForSectionIdentifier:(id)a3;
- (id)headerForSectionIdentifier:(id)a3;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)selectedCredentials;
- (id)snapshotForSectionIdentifier:(id)a3;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (id)unselectedCredentialRequiringAction;
- (unint64_t)_numberOfSelectedCredentials;
- (unint64_t)_numberOfSelectedPeerPaymentCredentials;
- (unint64_t)maximumNumberOfSelectableCredentials;
- (void)_loadCredentials:(id)a3 create:(BOOL)a4;
- (void)_primeItemSelectionAndReloadData:(BOOL)a3;
- (void)_promptToDeleteItem:(id)a3 completion:(id)a4;
- (void)_removeCredentialItem:(id)a3;
- (void)_replaceAndReloadItem:(id)a3 withNewItem:(id)a4;
- (void)_sortCredentialItems:(id)a3;
- (void)_updateMaximumSelectableCredentials;
- (void)_updateRemoteCredentialCache;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)dealloc;
- (void)deleteItem:(id)a3;
- (void)didSelectItem:(id)a3;
- (void)paymentPassUpdatedOnCredential:(id)a3;
- (void)reloadCredentialStores;
- (void)setCredential:(id)a3 selected:(BOOL)a4;
- (void)setDataChangeDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setMaximumNumberOfSelectableCredentials:(unint64_t)a3;
@end

@implementation PKPaymentSetupCredentialsSectionController

- (PKPaymentSetupCredentialsSectionController)initWithCredentials:(id)a3 provisioningController:(id)a4 context:(int64_t)a5 product:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentSetupCredentialsSectionController;
  v13 = [(PKPaymentSetupListSectionController *)&v26 init];
  v14 = v13;
  if (v13)
  {
    p_provisioningController = (id *)&v13->_provisioningController;
    objc_storeStrong((id *)&v13->_provisioningController, a4);
    uint64_t v16 = PKLastBackedUpDefaultPaymentPassSerialNumber();
    lastBackedUpDefaultPaymentPassSerialNumber = v14->_lastBackedUpDefaultPaymentPassSerialNumber;
    v14->_lastBackedUpDefaultPaymentPassSerialNumber = (NSString *)v16;

    v14->_setupContext = a5;
    objc_storeStrong((id *)&v14->_product, a6);
    v18 = [*p_provisioningController webService];
    v19 = [v18 targetDevice];
    v20 = [v19 secureElementIdentifiers];

    v21 = [[PKPassSnapshotCoordinator alloc] initWithSEIDs:v20];
    snapshotCoordinator = v14->_snapshotCoordinator;
    v14->_snapshotCoordinator = v21;

    uint64_t v23 = [*p_provisioningController storageSnapshot];
    storageSnapshot = v14->_storageSnapshot;
    v14->_storageSnapshot = (PKProvisioningSEStorageSnapshot *)v23;

    [(PKProvisioningSEStorageSnapshot *)v14->_storageSnapshot reset];
    [*p_provisioningController addDelegate:v14];
    [(PKPaymentSetupCredentialsSectionController *)v14 _loadCredentials:v10 create:1];
    [(PKPaymentSetupCredentialsSectionController *)v14 _updateMaximumSelectableCredentials];
    [(PKPaymentSetupCredentialsSectionController *)v14 _primeItemSelectionAndReloadData:0];
  }
  return v14;
}

- (void)dealloc
{
  [(PKPaymentProvisioningController *)self->_provisioningController removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentSetupCredentialsSectionController;
  [(PKPaymentSetupCredentialsSectionController *)&v3 dealloc];
}

- (id)selectedCredentials
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  obuint64_t j = self->_sectionIdentifiers;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        v9 = [(NSMutableDictionary *)self->_allCredentials objectForKeyedSubscript:v8];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v19 + 1) + 8 * j);
              if ([v14 selected])
              {
                v15 = [v14 credential];
                [v3 addObject:v15];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v11);
        }
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }

  uint64_t v16 = (void *)[v3 copy];

  return v16;
}

- (BOOL)hasSelectedCredentials
{
  v2 = [(PKPaymentSetupCredentialsSectionController *)self selectedCredentials];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- ($96EE1C12479E9B303E9C2794B92A11A2)credentialSelectionState
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__PKPaymentSetupCredentialsSectionController_credentialSelectionState__block_invoke;
  v5[3] = &unk_1E59D7AD0;
  v5[4] = &v10;
  v5[5] = &v6;
  [(PKPaymentSetupCredentialsSectionController *)self _enumerateCredentials:v5];
  __int16 v2 = *((unsigned __int8 *)v11 + 24);
  __int16 v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);
  return ($96EE1C12479E9B303E9C2794B92A11A2)(v2 | (v3 << 8));
}

uint64_t __70__PKPaymentSetupCredentialsSectionController_credentialSelectionState__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  char v9 = v8;
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v10 + 24))
  {
    char v11 = 1;
  }
  else
  {
    char v11 = [v8 isAvailable];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(v10 + 24) = v11;
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v12 + 24))
  {
    char v13 = 1;
  }
  else
  {
    char v13 = [v9 selected];
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(unsigned char *)(v12 + 24) = v13;
  char v14 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v14) {
    char v14 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != 0;
  }
  *a4 = v14;

  return 0;
}

- (id)unselectedCredentialRequiringAction
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__33;
  char v9 = __Block_byref_object_dispose__33;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__PKPaymentSetupCredentialsSectionController_unselectedCredentialRequiringAction__block_invoke;
  v4[3] = &unk_1E59D7AF8;
  v4[4] = &v5;
  [(PKPaymentSetupCredentialsSectionController *)self _enumerateCredentials:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __81__PKPaymentSetupCredentialsSectionController_unselectedCredentialRequiringAction__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  uint64_t v7 = [v6 credential];
  if (([v6 selected] & 1) == 0 && objc_msgSend(v6, "isAvailable"))
  {
    id v8 = [v7 accountCredential];
    char v9 = v8;
    if (v8)
    {
      id v10 = [v8 account];
      uint64_t v11 = [v10 feature];

      if (v11 == 2)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v7);
        *a4 = 1;
      }
    }
  }
  return 0;
}

- (id)availableCredentialRequiringAction
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__33;
  char v9 = __Block_byref_object_dispose__33;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__PKPaymentSetupCredentialsSectionController_availableCredentialRequiringAction__block_invoke;
  v4[3] = &unk_1E59D7AF8;
  v4[4] = &v5;
  [(PKPaymentSetupCredentialsSectionController *)self _enumerateCredentials:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __80__PKPaymentSetupCredentialsSectionController_availableCredentialRequiringAction__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = [a3 credential];
  uint64_t v7 = [v6 accountCredential];
  id v8 = v7;
  if (v7)
  {
    char v9 = [v7 account];
    uint64_t v10 = [v9 feature];

    if (v10 == 2)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v6);
      *a4 = 1;
    }
  }

  return 0;
}

- (void)setCredential:(id)a3 selected:(BOOL)a4
{
}

- (void)reloadCredentialStores
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPaymentSetupCredentialsSectionController_reloadCredentialStores__block_invoke;
  aBlock[3] = &unk_1E59D7B20;
  aBlock[4] = self;
  __int16 v3 = (uint64_t (**)(void))_Block_copy(aBlock);
  uint64_t v4 = v3[2]();
  [(PKPaymentSetupCredentialsSectionController *)self _updateRemoteCredentialCache];
  [(PKPaymentSetupCredentialsSectionController *)self _updateMaximumSelectableCredentials];
  uint64_t v5 = ((uint64_t (*)(uint64_t (**)(void)))v3[2])(v3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataChangeDelegate);
  [WeakRetained reloadAnimated:v4 != v5];
}

uint64_t __68__PKPaymentSetupCredentialsSectionController_reloadCredentialStores__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 88);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
        v5 += [v8 count];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)doesContainCredentialThatRequiresAuth:(id)a3
{
  return objc_msgSend(a3, "pk_containsObjectPassingTest:", &__block_literal_global_135);
}

uint64_t __84__PKPaymentSetupCredentialsSectionController_doesContainCredentialThatRequiresAuth___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCarKeyTerminalPairingCredential] ^ 1;
}

- (void)setEditing:(BOOL)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (((!self->_isEditing ^ a3) & 1) == 0)
  {
    self->_isEditing = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E4F28D30], "pk_hashTableUsingPointerPersonality");
      uint64_t v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      selectedCredentialsBeforeEditing = self->_selectedCredentialsBeforeEditing;
      self->_selectedCredentialsBeforeEditing = v5;

      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      uint64_t v7 = [(PKPaymentSetupCredentialsSectionController *)self selectedCredentials];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            [(NSHashTable *)self->_selectedCredentialsBeforeEditing addObject:*(void *)(*((void *)&v16 + 1) + 8 * i)];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v9);
      }
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __57__PKPaymentSetupCredentialsSectionController_setEditing___block_invoke;
    v14[3] = &unk_1E59D7B68;
    BOOL v15 = a3;
    v14[4] = self;
    [(PKPaymentSetupCredentialsSectionController *)self _enumerateCredentials:v14];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataChangeDelegate);
    [WeakRetained reloadAnimated:0];

    if (!a3)
    {
      long long v13 = self->_selectedCredentialsBeforeEditing;
      self->_selectedCredentialsBeforeEditing = 0;
    }
  }
}

id __57__PKPaymentSetupCredentialsSectionController_setEditing___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (([v4 isRefund] & 1) != 0
    || ([v4 isUnavailable] & 1) != 0
    || ([v4 isBeingProvisioned] & 1) != 0)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v7 = (void *)[v4 copy];
    uint64_t v5 = v7;
    int v8 = *(unsigned __int8 *)(a1 + 40);
    if (*(unsigned char *)(a1 + 40))
    {
      [v7 setSelected:0];
      [v5 setUseMultiSelectAccessory:0];
      uint64_t v9 = [v4 isDeletable] ^ 1;
    }
    else
    {
      uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 120);
      long long v11 = [v4 credential];
      uint64_t v12 = [v10 containsObject:v11];

      [v5 setSelected:v12];
      [v5 setUseMultiSelectAccessory:1];
      uint64_t v9 = 0;
    }
    [v5 setDisplayInfo:v9];
    [v5 setReserverSpaceForSelectedAccessory:v8 == 0];
  }

  return v5;
}

- (BOOL)shouldShowEditButton
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__PKPaymentSetupCredentialsSectionController_shouldShowEditButton__block_invoke;
  v4[3] = &unk_1E59D7AF8;
  v4[4] = &v5;
  [(PKPaymentSetupCredentialsSectionController *)self _enumerateCredentials:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __66__PKPaymentSetupCredentialsSectionController_shouldShowEditButton__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if ([v6 isAvailable] && objc_msgSend(v6, "isDeletable"))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

  return 0;
}

- (id)identifiers
{
  return self->_sectionIdentifiers;
}

- (id)snapshotForSectionIdentifier:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_allCredentials objectForKeyedSubscript:a3];
  id v4 = v3;
  if (!v3) {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (id)decoratePaymentSetListCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PKPaymentSetupCredentialsSectionController;
  char v8 = [(PKPaymentSetupListSectionController *)&v26 decoratePaymentSetListCell:v6 forItem:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    uint64_t v10 = [v8 textProperties];
    [v10 setNumberOfLines:1];
    long long v11 = [v8 secondaryTextProperties];

    [v11 setLineBreakMode:4];
    [v11 setNumberOfLines:2];
    uint64_t v12 = [(PKPaymentSetupCredentialsSectionController *)self _cardArtForCredentialItem:v9];
    [v8 setImage:v12];

    long long v13 = [v8 imageProperties];
    [(PKPaymentSetupCredentialsSectionController *)self _defaultCardSize];
    double v15 = v14;
    double v17 = v16;
    objc_msgSend(v13, "setMaximumSize:");
    objc_msgSend(v13, "setReservedLayoutSize:", v15, v17);
    [v13 setCornerRadius:2.0];
    [v6 setContentConfiguration:v8];
    if ([v9 isDeletable])
    {
      long long v18 = [v6 accessories];
      long long v19 = (void *)[v18 mutableCopy];

      id v20 = objc_alloc_init(MEMORY[0x1E4FB1508]);
      [v20 setReservedLayoutWidth:50.0];
      [v19 addObject:v20];
      [v6 setAccessories:v19];
      if (self->_isEditing)
      {
        uint64_t v21 = [v9 title];
        long long v22 = PKLocalizedPaymentString(&cfstr_RemoveParkedPa.isa, &stru_1EF1B4C70.isa, v21);
      }
      else
      {
        long long v22 = 0;
      }
    }
    else
    {
      long long v22 = 0;
    }
    [v6 setAccessibilityLabel:v22];
    if ([v9 isCellDisabled]) {
      double v23 = 0.4;
    }
    else {
      double v23 = 1.0;
    }
    long long v24 = [v6 contentView];
    [v24 setAlpha:v23];
  }

  return v8;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4FB1358];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  char v8 = [(PKPaymentSetupCredentialsSectionController *)self snapshotForSectionIdentifier:v6];

  [v7 appendItems:v8];

  return v7;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(PKPaymentSetupListSectionController *)self defaultListLayout];
  [v8 setHeaderMode:1];
  [v8 setFooterMode:1];
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  long long v13 = __92__PKPaymentSetupCredentialsSectionController_layoutWithLayoutEnvironment_sectionIdentifier___block_invoke;
  double v14 = &unk_1E59CDCD0;
  objc_copyWeak(&v15, &location);
  [v8 setTrailingSwipeActionsConfigurationProvider:&v11];
  id v9 = objc_msgSend(MEMORY[0x1E4FB1330], "sectionWithListConfiguration:layoutEnvironment:", v8, v6, v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v9;
}

id __92__PKPaymentSetupCredentialsSectionController_layoutWithLayoutEnvironment_sectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained _credentialItemFromIndexPath:v3];

  if ([v6 isDeletable])
  {
    id v7 = (void *)MEMORY[0x1E4FB1688];
    char v8 = PKLocalizedPaymentString(&cfstr_RemoveParkedPa_0.isa);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    double v16 = __92__PKPaymentSetupCredentialsSectionController_layoutWithLayoutEnvironment_sectionIdentifier___block_invoke_2;
    double v17 = &unk_1E59D7B90;
    objc_copyWeak(&v19, v4);
    id v18 = v6;
    id v9 = [v7 contextualActionWithStyle:1 title:v8 handler:&v14];

    uint64_t v10 = (void *)MEMORY[0x1E4FB1CC0];
    v20[0] = v9;
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 1, v14, v15, v16, v17);
    uint64_t v12 = [v10 configurationWithActions:v11];

    objc_destroyWeak(&v19);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

void __92__PKPaymentSetupCredentialsSectionController_layoutWithLayoutEnvironment_sectionIdentifier___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 40);
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _promptToDeleteItem:*(void *)(a1 + 32) completion:v6];
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  v52[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)*MEMORY[0x1E4FB2770];
  id v12 = v9;
  id v13 = v11;
  if (v13 == v12)
  {
  }
  else
  {
    uint64_t v14 = v13;
    if (!v12 || !v13)
    {

      goto LABEL_13;
    }
    int v15 = [v12 isEqualToString:v13];

    if (!v15)
    {
LABEL_13:
      double v17 = [MEMORY[0x1E4FB1948] plainFooterConfiguration];
      uint64_t v44 = *MEMORY[0x1E4FB06F8];
      long long v25 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], (NSString *)*MEMORY[0x1E4FB27C0]);
      objc_super v26 = objc_msgSend(MEMORY[0x1E4FB1618], "secondaryLabelColor", v44, *MEMORY[0x1E4FB0700], v25);
      v45[1] = v26;
      double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:2];

      double v16 = [(NSDictionary *)self->_footerForSectionIdentifier objectForKeyedSubscript:v10];
      double v24 = 5.0;
      double v27 = 5.0;
      if (!v16) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  double v16 = [(PKPaymentSetupCredentialsSectionController *)self headerForSectionIdentifier:v10];
  double v17 = [MEMORY[0x1E4FB1948] plainHeaderConfiguration];
  id v18 = (__CFString *)v10;
  id v19 = v18;
  if (v18 == @"available")
  {
    double v23 = 0;
    double v24 = 0.0;
    goto LABEL_26;
  }
  if (!v18) {
    goto LABEL_23;
  }
  char v20 = [(__CFString *)v18 isEqualToString:@"available"];

  uint64_t v21 = v19;
  long long v22 = v21;
  if (v20)
  {
    double v23 = 0;
    double v24 = 0.0;
    if (v21 == @"background_provisioning") {
      goto LABEL_27;
    }
LABEL_26:
    int v40 = [(__CFString *)v19 isEqualToString:@"background_provisioning"];

    if (v40) {
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  if (v21 == @"background_provisioning") {
    goto LABEL_22;
  }
  char v28 = [(__CFString *)v21 isEqualToString:@"background_provisioning"];

  if (v28) {
    goto LABEL_22;
  }
  uint64_t v29 = v22;
  if (v29 == @"unavailable"
    || (v30 = v29,
        char v31 = [(__CFString *)v29 isEqualToString:@"unavailable"],
        v30,
        (v31 & 1) != 0)
    || (v32 = v30, v32 == @"refund")
    || (v33 = v32,
        char v34 = [(__CFString *)v32 isEqualToString:@"refund"],
        v33,
        (v34 & 1) != 0))
  {
LABEL_22:
    uint64_t v49 = *MEMORY[0x1E4FB06F8];
    uint64_t v35 = v49;
    v36 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:25.0];
    v50 = v36;
    v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];

    v47[0] = v35;
    v38 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2990], (NSString *)*MEMORY[0x1E4FB27C0], *MEMORY[0x1E4FB09B8]);
    v48[0] = v38;
    v47[1] = *MEMORY[0x1E4FB0700];
    v39 = [MEMORY[0x1E4FB1618] labelColor];
    v48[1] = v39;
    double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];
  }
  else
  {
LABEL_23:
    v51[0] = *MEMORY[0x1E4FB06F8];
    v38 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28D0], (NSString *)*MEMORY[0x1E4FB27C0]);
    v52[0] = v38;
    v51[1] = *MEMORY[0x1E4FB0700];
    v39 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v52[1] = v39;
    double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
  }

  double v24 = 10.0;
  if (v19 == @"background_provisioning")
  {
LABEL_27:
    v41 = +[PKCellAccessoryLoadingIndicator accessory];
    v46 = v41;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
    [v8 setAccessories:v42];

    goto LABEL_29;
  }
  if (v19) {
    goto LABEL_26;
  }
LABEL_28:
  [v8 setAccessories:MEMORY[0x1E4F1CBF0]];
LABEL_29:
  double v27 = 10.0;
  if (v16)
  {
LABEL_30:
    objc_msgSend(v17, "setDirectionalLayoutMargins:", v27, 0.0, v24, 0.0);
    v43 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v16 attributes:v23];
    [v17 setAttributedText:v43];
  }
LABEL_31:
  objc_msgSend(v8, "setContentConfiguration:", v17, v27);
}

- (id)headerForSectionIdentifier:(id)a3
{
  id v3 = (__CFString *)a3;
  id v4 = v3;
  if (v3 == @"unavailable") {
    goto LABEL_4;
  }
  if (!v3)
  {
LABEL_15:
    id v7 = v4;
    goto LABEL_16;
  }
  int v5 = [(__CFString *)v3 isEqualToString:@"unavailable"];

  if (!v5)
  {
    id v8 = v4;
    if (v8 == @"refund"
      || (v9 = v8, int v10 = [(__CFString *)v8 isEqualToString:@"refund"], v9, v10))
    {
      id v6 = @"REFUNDED_PURCHASES";
      goto LABEL_5;
    }
    uint64_t v11 = v9;
    if (v11 == @"background_provisioning"
      || (id v12 = v11,
          int v13 = [(__CFString *)v11 isEqualToString:@"background_provisioning"],
          v12,
          v13))
    {
      id v6 = @"CARDS_BEING_BACKGROUND_PROVISIONED_SECTION_HEADER";
      goto LABEL_5;
    }
    uint64_t v14 = v12;
    if (v14 == @"available"
      || (int v15 = v14,
          char v16 = [(__CFString *)v14 isEqualToString:@"available"],
          v15,
          (v16 & 1) != 0))
    {
      double v17 = 0;
      goto LABEL_17;
    }
    goto LABEL_15;
  }
LABEL_4:
  id v6 = @"UNAVAILABLE_CARDS";
LABEL_5:
  PKLocalizedPaymentString(&v6->isa);
  id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  double v17 = v7;
LABEL_17:

  return v17;
}

- (id)footerForSectionIdentifier:(id)a3
{
  return [(NSDictionary *)self->_footerForSectionIdentifier objectForKeyedSubscript:a3];
}

- (void)didSelectItem:(id)a3
{
  id v10 = a3;
  if ([v10 isRefund])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v5 = [v10 credential];
    [WeakRetained presentRefundFlowForCredential:v5];
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  if ([v10 isUnavailable])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v5 = [v10 credential];
    [WeakRetained presentUnavailableDetailsForCredential:v5];
    goto LABEL_5;
  }
  if (self->_isEditing)
  {
    if (([v10 isDeletable] & 1) == 0)
    {
      id v7 = [v10 credential];
      int v8 = [v7 isSafariCredential];

      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      id WeakRetained = v9;
      if (v8) {
        [v9 showUnableToDeleteSafariCredentialError];
      }
      else {
        [v9 showUnableToDeleteCredentialError];
      }
      goto LABEL_6;
    }
    if (UIAccessibilityIsVoiceOverRunning()) {
      [(PKPaymentSetupCredentialsSectionController *)self _promptToDeleteItem:v10 completion:0];
    }
  }
  else if (([v10 isBeingProvisioned] & 1) == 0)
  {
    id WeakRetained = [v10 credential];
    -[PKPaymentSetupCredentialsSectionController setCredential:selected:](self, "setCredential:selected:", WeakRetained, [v10 selected] ^ 1);
    goto LABEL_6;
  }
LABEL_7:
  id v6 = objc_loadWeakRetained((id *)&self->_dataChangeDelegate);
  [v6 deselectCells];
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return [a3 isCellDisabled] ^ 1;
}

- (void)paymentPassUpdatedOnCredential:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__PKPaymentSetupCredentialsSectionController_paymentPassUpdatedOnCredential___block_invoke;
  v6[3] = &unk_1E59CA870;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __77__PKPaymentSetupCredentialsSectionController_paymentPassUpdatedOnCredential___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _credentialItemForCredential:*(void *)(a1 + 40)];
  [v4 setPassSnapshot:0];
  char v2 = [*(id *)(a1 + 32) _cardArtForCredentialItem:v4];
  if (v2)
  {
    id v3 = (void *)[v4 copy];
    [v3 setPassSnapshot:v2];
    [*(id *)(a1 + 32) _replaceAndReloadItem:v4 withNewItem:v3];
  }
}

- (void)_loadCredentials:(id)a3 create:(BOOL)a4
{
  BOOL v67 = a4;
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_msgSend(MEMORY[0x1E4F28E10], "pk_weakPointerPersonalityToStrongObjectsMapTable");
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PKPaymentSetupCredentialsSectionController__loadCredentials_create___block_invoke;
  aBlock[3] = &unk_1E59CB328;
  id v7 = v6;
  id v91 = v7;
  int v8 = (void (**)(void *, void *))_Block_copy(aBlock);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v77 = self;
  id v9 = self->_sectionIdentifiers;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v86 objects:v96 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v87 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [(NSMutableDictionary *)v77->_allCredentials objectForKeyedSubscript:*(void *)(*((void *)&v86 + 1) + 8 * i)];
        v8[2](v8, v14);
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v86 objects:v96 count:16];
    }
    while (v11);
  }

  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v65 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  char v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  allCredentials = v77->_allCredentials;
  v77->_allCredentials = v16;

  int IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  obuint64_t j = v5;
  uint64_t v18 = [obj countByEnumeratingWithState:&v82 objects:v95 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v83;
    v70 = v8;
    id v71 = v7;
    uint64_t v68 = *(void *)v83;
    v69 = v15;
    do
    {
      uint64_t v21 = 0;
      uint64_t v73 = v19;
      do
      {
        if (*(void *)v83 != v20) {
          objc_enumerationMutation(obj);
        }
        long long v22 = *(void **)(*((void *)&v82 + 1) + 8 * v21);
        if (![v15 containsObject:v22])
        {
          double v24 = [v7 objectForKey:v22];
          double v23 = (PKPaymentSetupCredentialListItem *)[v24 copy];

          if (v23)
          {
            [v7 removeObjectForKey:v22];
          }
          else
          {
            if (!v67) {
              goto LABEL_54;
            }
            double v23 = [[PKPaymentSetupCredentialListItem alloc] initWithCredential:v22];
            [(PKPaymentSetupListItem *)v23 setReserverSpaceForSelectedAccessory:1];
          }
          if (IsSetupAssistant)
          {
            long long v25 = [v22 remoteCredential];
            goto LABEL_24;
          }
          objc_super v26 = [(PKPaymentProvisioningController *)v77->_provisioningController pendingProvisioningForCredential:v22];

          long long v25 = [v22 remoteCredential];
          if (v26)
          {
            unsigned int v75 = 0;
            uint64_t v27 = 0;
            unsigned int v76 = 0;
            uint64_t v28 = 1;
            uint64_t v29 = @"background_provisioning";
LABEL_38:
            id v38 = [(NSMutableDictionary *)v77->_allCredentials objectForKeyedSubscript:v29];
            if (!v38)
            {
              id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [(NSMutableDictionary *)v77->_allCredentials setObject:v38 forKeyedSubscript:v29];
            }
            [v38 addObject:v23];
            uint64_t v39 = [v22 hash];
            if ([(PKPaymentSetupCredentialListItem *)v23 lastCheckedCredentialHash] != v39)
            {
              int v40 = [(PKPaymentSetupCredentialsSectionController *)v77 _titleTextForCredential:v22];
              [(PKPaymentSetupListItem *)v23 setTitle:v40];

              uint64_t v28 = v28;
              v41 = [(PKPaymentSetupCredentialsSectionController *)v77 _detailTextForCredential:v22];
              [(PKPaymentSetupListItem *)v23 setSubtitle:v41];

              [(PKPaymentSetupCredentialListItem *)v23 setLastCheckedCredentialHash:v39];
            }
            if (v76) {
              unsigned int v42 = (v28 | [v22 isDeletable]) ^ 1;
            }
            else {
              unsigned int v42 = 0;
            }
            id v15 = v69;
            [(PKPaymentSetupCredentialListItem *)v23 setIsAvailable:v76];
            [(PKPaymentSetupCredentialListItem *)v23 setIsUnavailable:v27];
            [(PKPaymentSetupCredentialListItem *)v23 setIsRefund:v75];
            [(PKPaymentSetupCredentialListItem *)v23 setIsBeingProvisioned:v28];
            if (v27)
            {
              uint64_t v43 = 1;
            }
            else if (v77->_isEditing)
            {
              uint64_t v43 = v42;
            }
            else
            {
              uint64_t v43 = 0;
            }
            [(PKPaymentSetupListItem *)v23 setDisplayInfo:v43];
            [(PKPaymentSetupListItem *)v23 setUseMultiSelectAccessory:v76];
            [(PKPaymentSetupListItem *)v23 setDisplayChevron:v75];
            [(PKPaymentSetupCredentialListItem *)v23 setIsCellDisabled:v28];
            if ((v75 | v27 | v28) == 1) {
              [(PKPaymentSetupListItem *)v23 setSelected:0];
            }
            [v69 addObject:v22];

            int v8 = v70;
            id v7 = v71;
            uint64_t v19 = v73;
            uint64_t v20 = v68;
            goto LABEL_53;
          }
LABEL_24:
          if (v25)
          {
            uint64_t v30 = [v25 status];
            if (v30 == 3)
            {
              unsigned int v75 = 0;
              uint64_t v28 = 0;
              unsigned int v76 = 0;
              uint64_t v27 = 1;
              uint64_t v29 = @"unavailable";
              goto LABEL_38;
            }
            if (v30 == 5)
            {
              char v31 = [v25 transferableFromDevices];
              v32 = [v31 firstObject];
              v33 = [v32 name];

              if (v33)
              {
                PKLocalizedPaymentString(&cfstr_TransferableFr.isa, &stru_1EF1B4C70.isa, v33);
                uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
                PKLocalizedPaymentString(&cfstr_TransferableFr_0.isa, &stru_1EF1B4C70.isa, v33);
              }
              else
              {
                PKLocalizedPaymentString(&cfstr_TransferableFr_1.isa);
                uint64_t v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
                PKLocalizedPaymentString(&cfstr_TransferableFr_2.isa);
              v37 = };
              [v65 setObject:v37 forKeyedSubscript:v29];

              if (([v66 containsObject:v29] & 1) == 0) {
                [v66 addObject:v29];
              }

              if (v29)
              {
                unsigned int v75 = 0;
                uint64_t v27 = 0;
                uint64_t v28 = 0;
                unsigned int v76 = 1;
                goto LABEL_38;
              }
            }
          }
          else
          {
            char v34 = [v22 purchasedProductCredential];
            uint64_t v35 = [v34 purchase];
            uint64_t v36 = [v35 state];

            if (v36 == 3)
            {
              uint64_t v27 = 0;
              uint64_t v28 = 0;
              long long v25 = 0;
              unsigned int v76 = 0;
              unsigned int v75 = 1;
              uint64_t v29 = @"refund";
              goto LABEL_38;
            }
          }
          unsigned int v75 = 0;
          uint64_t v27 = 0;
          uint64_t v28 = 0;
          unsigned int v76 = 1;
          uint64_t v29 = @"available";
          goto LABEL_38;
        }
        PKLogFacilityTypeGetObject();
        double v23 = (PKPaymentSetupCredentialListItem *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v23->super.super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v94 = v22;
          _os_log_impl(&dword_19F450000, &v23->super.super, OS_LOG_TYPE_DEFAULT, "Attempting to show parked card screen with duplicate credential %@", buf, 0xCu);
        }
LABEL_53:

LABEL_54:
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [obj countByEnumeratingWithState:&v82 objects:v95 count:16];
    }
    while (v19);
  }

  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v45 = [(NSMutableDictionary *)v77->_allCredentials objectForKeyedSubscript:@"available"];
  uint64_t v46 = [v45 count];

  if (v46) {
    [v44 addObject:@"available"];
  }
  [v44 addObjectsFromArray:v66];
  v47 = [(NSMutableDictionary *)v77->_allCredentials objectForKeyedSubscript:@"background_provisioning"];
  uint64_t v48 = [v47 count];

  if (v48) {
    [v44 addObject:@"background_provisioning"];
  }
  uint64_t v49 = [(NSMutableDictionary *)v77->_allCredentials objectForKeyedSubscript:@"refund"];
  uint64_t v50 = [v49 count];

  if (v50) {
    [v44 addObject:@"refund"];
  }
  v51 = [(NSMutableDictionary *)v77->_allCredentials objectForKeyedSubscript:@"unavailable"];
  uint64_t v52 = [v51 count];

  if (v52) {
    [v44 addObject:@"unavailable"];
  }
  uint64_t v53 = [v44 copy];
  sectionIdentifiers = v77->_sectionIdentifiers;
  v77->_sectionIdentifiers = (NSArray *)v53;

  uint64_t v55 = [v65 copy];
  footerForSectionIdentifier = v77->_footerForSectionIdentifier;
  v77->_footerForSectionIdentifier = (NSDictionary *)v55;

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v57 = v77->_sectionIdentifiers;
  uint64_t v58 = [(NSArray *)v57 countByEnumeratingWithState:&v78 objects:v92 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v79;
    do
    {
      for (uint64_t j = 0; j != v59; ++j)
      {
        if (*(void *)v79 != v60) {
          objc_enumerationMutation(v57);
        }
        v62 = [(NSMutableDictionary *)v77->_allCredentials objectForKeyedSubscript:*(void *)(*((void *)&v78 + 1) + 8 * j)];
        [(PKPaymentSetupCredentialsSectionController *)v77 _sortCredentialItems:v62];
      }
      uint64_t v59 = [(NSArray *)v57 countByEnumeratingWithState:&v78 objects:v92 count:16];
    }
    while (v59);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&v77->_delegate);
  objc_msgSend(WeakRetained, "setShowNoResultsView:", -[PKPaymentSetupCredentialsSectionController _hasCredentialsToShow](v77, "_hasCredentialsToShow") ^ 1);

  id v64 = objc_loadWeakRetained((id *)&v77->_delegate);
  [v64 credentialSelectionDidChange];
}

void __70__PKPaymentSetupCredentialsSectionController__loadCredentials_create___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = *(void **)(a1 + 32);
        uint64_t v10 = [v8 credential];
        [v9 setObject:v8 forKey:v10];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_sortCredentialItems:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__PKPaymentSetupCredentialsSectionController__sortCredentialItems___block_invoke;
  v3[3] = &unk_1E59D7BB8;
  v3[4] = self;
  [a3 sortUsingComparator:v3];
}

uint64_t __67__PKPaymentSetupCredentialsSectionController__sortCredentialItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 credential];
  id v7 = [v5 credential];

  uint64_t v8 = [v6 compare:v7 withBackedUpDefaultPaymentPassSerialNumber:*(void *)(*(void *)(a1 + 32) + 80)];
  return v8;
}

- (void)_updateRemoteCredentialCache
{
  id v3 = [(PKPaymentProvisioningController *)self->_provisioningController associatedCredentials];
  uint64_t v4 = (void *)[v3 mutableCopy];
  id v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  id v10 = v6;

  id v7 = [(PKPaymentProvisioningController *)self->_provisioningController purchaseCredentials];
  objc_msgSend(v10, "pk_safelyAddObjectsFromArray:", v7);

  uint64_t v8 = [(PKPaymentProvisioningController *)self->_provisioningController provisioningExtensionCredentials];
  objc_msgSend(v10, "pk_safelyAddObjectsFromArray:", v8);

  id v9 = [(PKPaymentProvisioningController *)self->_provisioningController pendingCarKeyCredentials];
  objc_msgSend(v10, "pk_safelyAddObjectsFromArray:", v9);

  [(PKPaymentSetupCredentialsSectionController *)self _loadCredentials:v10 create:0];
}

- (unint64_t)_numberOfSelectedCredentials
{
  char v2 = [(PKPaymentSetupCredentialsSectionController *)self selectedCredentials];
  unint64_t v3 = objc_msgSend(v2, "pk_countObjectsPassingTest:", &__block_literal_global_87_0);

  return v3;
}

uint64_t __74__PKPaymentSetupCredentialsSectionController__numberOfSelectedCredentials__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPeerPaymentCredential] ^ 1;
}

- (unint64_t)_numberOfSelectedPeerPaymentCredentials
{
  char v2 = [(PKPaymentSetupCredentialsSectionController *)self selectedCredentials];
  unint64_t v3 = objc_msgSend(v2, "pk_countObjectsPassingTest:", &__block_literal_global_89_0);

  return v3;
}

uint64_t __85__PKPaymentSetupCredentialsSectionController__numberOfSelectedPeerPaymentCredentials__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPeerPaymentCredential];
}

- (BOOL)_canSelectedCredential:(id)a3
{
  if (self->_storageSnapshot)
  {
    uint64_t v4 = [a3 appletTypes];
    id v5 = v4;
    if (v4 && [v4 count])
    {
      if (([(PKProvisioningSEStorageSnapshot *)self->_storageSnapshot addAppletTypesToSnapshot:v5] & 1) == 0)
      {
        BOOL v6 = [(PKPaymentSetupCredentialsSectionController *)self _numberOfSelectedCredentials] == 0;
LABEL_12:

        return v6;
      }
    }
    else
    {
      id v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Allowing credential to be selected because no applet type specified", v9, 2u);
      }
    }
    BOOL v6 = 1;
    goto LABEL_12;
  }
  return ([a3 isPeerPaymentCredential] & 1) != 0
      || [(PKPaymentSetupCredentialsSectionController *)self _numberOfSelectedCredentials] < self->_maximumNumberOfSelectableCredentials;
}

- (BOOL)_hasCredentialsToShow
{
  return [(NSMutableDictionary *)self->_allCredentials count] != 0;
}

- (BOOL)_isCarKeyProduct
{
  char v2 = [(PKPaymentSetupProduct *)self->_product productIdentifier];
  char v3 = [v2 isEqualToString:*MEMORY[0x1E4F87BE8]];

  return v3;
}

- (void)_updateMaximumSelectableCredentials
{
  if ((PKPaymentSetupContextIsMerchantApp() & 1) != 0
    || [(PKPaymentSetupCredentialsSectionController *)self _isCarKeyProduct])
  {
    self->_maximumNumberOfSelectableCredentials = 1;
  }
  else
  {
    if ((PKDisableDynamicSEAllocation() & 1) != 0 || !self->_storageSnapshot)
    {
      unint64_t v3 = [(PKPaymentProvisioningController *)self->_provisioningController availableSecureElementPassSpaces];
      uint64_t v8 = 0;
      id v9 = &v8;
      uint64_t v10 = 0x2020000000;
      uint64_t v11 = 0;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __81__PKPaymentSetupCredentialsSectionController__updateMaximumSelectableCredentials__block_invoke;
      v7[3] = &unk_1E59D7AF8;
      v7[4] = &v8;
      [(PKPaymentSetupCredentialsSectionController *)self _enumerateCredentials:v7];
      if (v3 == 0x7FFFFFFFFFFFFFFFLL || v3 == 0)
      {
        unint64_t v5 = v9[3];
      }
      else
      {
        unint64_t v5 = v9[3];
        if (v3 < v5) {
          unint64_t v5 = v3;
        }
      }
      self->_maximumNumberOfSelectableCredentials = v5;
      _Block_object_dispose(&v8, 8);
    }
    else if (!self->_maximumNumberOfSelectableCredentials)
    {
      self->_maximumNumberOfSelectableCredentials = -1;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained credentialSelectionDidChange];
  }
}

uint64_t __81__PKPaymentSetupCredentialsSectionController__updateMaximumSelectableCredentials__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [a3 isAvailable];
  return 0;
}

- (BOOL)_setCredential:(id)a3 selected:(BOOL)a4 silently:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v33 = self;
  id WeakRetained = self->_sectionIdentifiers;
  uint64_t v10 = [(NSArray *)WeakRetained countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v10)
  {
    long long v12 = 0;
    id v15 = 0;
    goto LABEL_27;
  }
  uint64_t v11 = v10;
  obuint64_t j = WeakRetained;
  BOOL v30 = v5;
  unsigned int v31 = v6;
  long long v12 = 0;
  uint64_t v13 = *(void *)v35;
LABEL_3:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v35 != v13) {
      objc_enumerationMutation(obj);
    }
    id v15 = [(NSMutableDictionary *)v33->_allCredentials objectForKeyedSubscript:*(void *)(*((void *)&v34 + 1) + 8 * v14)];
    uint64_t v16 = [v15 count];
    if (v16) {
      break;
    }
LABEL_10:

LABEL_12:
    if (++v14 == v11)
    {
      uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v11) {
        goto LABEL_3;
      }
      id v15 = 0;
      BOOL v21 = 0;
      id WeakRetained = obj;
      goto LABEL_37;
    }
  }
  uint64_t v17 = v16;
  uint64_t v18 = 0;
  while (1)
  {
    uint64_t v19 = v12;
    long long v12 = [v15 objectAtIndexedSubscript:v18];

    id v20 = [v12 credential];

    if (v20 == v8) {
      break;
    }
    if (v17 == ++v18) {
      goto LABEL_10;
    }
  }
  if (!v15) {
    goto LABEL_12;
  }

  if (!v12) {
    goto LABEL_39;
  }
  if ([v12 selected] == v31)
  {
    BOOL v21 = 1;
    goto LABEL_40;
  }
  if (v31)
  {
    BOOL v22 = v30;
    if ([(PKPaymentSetupCredentialsSectionController *)v33 _canSelectedCredential:v8]) {
      goto LABEL_33;
    }
    if (v33->_maximumNumberOfSelectableCredentials == 1 && !v30)
    {
      uint64_t v23 = [v15 count];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = 0;
        while (1)
        {
          objc_super v26 = [v15 objectAtIndexedSubscript:v25];
          if ([v26 selected]) {
            break;
          }

          if (v24 == ++v25) {
            goto LABEL_33;
          }
        }
        uint64_t v29 = (void *)[v26 copy];
        [v29 setSelected:0];
        [(PKPaymentSetupCredentialsSectionController *)v33 _replaceAndReloadItem:v26 withNewItem:v29];

LABEL_32:
      }
      goto LABEL_33;
    }
    if (v30)
    {
LABEL_39:
      BOOL v21 = 0;
      goto LABEL_40;
    }
    id WeakRetained = (NSArray *)objc_loadWeakRetained((id *)&v33->_delegate);
    [(NSArray *)WeakRetained showMaxSelectionAlertForCredential:v8];
LABEL_27:
    BOOL v21 = 0;
  }
  else
  {
    BOOL v22 = v30;
    if (v33->_storageSnapshot)
    {
      objc_super v26 = [v8 appletTypes];
      if ([v26 count]) {
        [(PKProvisioningSEStorageSnapshot *)v33->_storageSnapshot removeAppletTypesFromSnapshot:v26];
      }
      goto LABEL_32;
    }
LABEL_33:
    id WeakRetained = (NSArray *)[v12 copy];
    [(NSArray *)WeakRetained setSelected:v31];
    if (v22)
    {
      [v15 replaceObjectAtIndex:v18 withObject:WeakRetained];
    }
    else
    {
      [(PKPaymentSetupCredentialsSectionController *)v33 _replaceAndReloadItem:v12 withNewItem:WeakRetained];
      id v27 = objc_loadWeakRetained((id *)&v33->_delegate);
      [v27 credentialSelectionDidChange];
    }
    BOOL v21 = 1;
  }
LABEL_37:

LABEL_40:
  return v21;
}

- (void)_primeItemSelectionAndReloadData:(BOOL)a3
{
  if (!self->_isEditing)
  {
    BOOL v3 = a3;
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v23[3] = 0;
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    BOOL v5 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
    BOOL v6 = [v5 targetDevice];
    id v7 = [v6 deviceClass];

    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __79__PKPaymentSetupCredentialsSectionController__primeItemSelectionAndReloadData___block_invoke;
    uint64_t v14 = &unk_1E59D7C00;
    id v8 = v7;
    id v15 = v8;
    uint64_t v16 = self;
    uint64_t v17 = v23;
    uint64_t v18 = &v19;
    [(PKPaymentSetupCredentialsSectionController *)self _enumerateCredentials:&v11];
    if (v3)
    {
      if (*((unsigned char *)v20 + 24))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_dataChangeDelegate);
        objc_msgSend(WeakRetained, "reloadAnimated:", 0, v11, v12, v13, v14);

        id v10 = objc_loadWeakRetained((id *)&self->_delegate);
        [v10 credentialSelectionDidChange];
      }
    }

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(v23, 8);
  }
}

uint64_t __79__PKPaymentSetupCredentialsSectionController__primeItemSelectionAndReloadData___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  if (([v6 selected] & 1) == 0 && objc_msgSend(v6, "isAvailable"))
  {
    id v7 = [v6 credential];
    id v8 = [v7 remoteCredential];

    if (!v8 || [v8 status] != 5) {
      goto LABEL_12;
    }
    id v9 = [v8 transferableFromDevices];
    id v10 = [v9 firstObject];

    uint64_t v11 = [v10 deviceClass];
    uint64_t v12 = v11;
    if (v11)
    {
      uint64_t v13 = (void *)a1[4];
      id v14 = v11;
      id v15 = v13;
      if (v14 == v15)
      {

LABEL_11:
LABEL_12:
        uint64_t v18 = (void *)a1[5];
        uint64_t v19 = [v6 credential];
        char v20 = [v18 _setCredential:v19 selected:1 silently:1];

        if ((v20 & 1) == 0)
        {
          if ((PKDisableDynamicSEAllocation() & 1) == 0 && !*(void *)(*(void *)(a1[6] + 8) + 24)) {
            *(void *)(a1[5] + 152) = 1;
          }
          *a4 = 1;
        }
        ++*(void *)(*(void *)(a1[6] + 8) + 24);
        uint64_t v21 = *(void *)(a1[7] + 8);
        if (*(unsigned char *)(v21 + 24)) {
          char v22 = 1;
        }
        else {
          char v22 = v20;
        }
        *(unsigned char *)(v21 + 24) = v22;
        goto LABEL_23;
      }
      uint64_t v16 = v15;
      if (v15)
      {
        int v17 = [v14 isEqualToString:v15];

        if (!v17) {
          goto LABEL_22;
        }
        goto LABEL_11;
      }
    }
LABEL_22:

LABEL_23:
  }

  return 0;
}

- (void)_promptToDeleteItem:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__PKPaymentSetupCredentialsSectionController__promptToDeleteItem_completion___block_invoke;
  v11[3] = &unk_1E59D0E40;
  objc_copyWeak(&v14, &location);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [WeakRetained showDeleteConfirmationWithCompletion:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

uint64_t __77__PKPaymentSetupCredentialsSectionController__promptToDeleteItem_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained deleteItem:*(void *)(a1 + 32)];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)deleteItem:(id)a3
{
  id v4 = a3;
  uint64_t v30 = 0;
  unsigned int v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__33;
  long long v34 = __Block_byref_object_dispose__33;
  id v35 = (id)[v4 copy];
  [(id)v31[5] setSelected:0];
  [(id)v31[5] setLoadingIndicatorVisible:1];
  [(PKPaymentSetupCredentialsSectionController *)self _replaceAndReloadItem:v4 withNewItem:v31[5]];
  if ([v4 selected])
  {
    char v5 = 1;
  }
  else
  {
    selectedCredentialsBeforeEditing = self->_selectedCredentialsBeforeEditing;
    id v7 = [v4 credential];
    char v5 = [(NSHashTable *)selectedCredentialsBeforeEditing containsObject:v7];
  }
  id v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__33;
  v28[4] = __Block_byref_object_dispose__33;
  id v29 = 0;
  provisioningController = self->_provisioningController;
  id v10 = [v4 credential];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __57__PKPaymentSetupCredentialsSectionController_deleteItem___block_invoke;
  v25[3] = &unk_1E59D7C28;
  id v27 = v28;
  uint64_t v11 = v8;
  objc_super v26 = v11;
  [(PKPaymentProvisioningController *)provisioningController deleteCredential:v10 completionHandler:v25];

  dispatch_group_enter(v11);
  dispatch_time_t v12 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PKPaymentSetupCredentialsSectionController_deleteItem___block_invoke_2;
  block[3] = &unk_1E59CA7D0;
  uint64_t v24 = v11;
  id v13 = v11;
  id v14 = MEMORY[0x1E4F14428];
  dispatch_after(v12, MEMORY[0x1E4F14428], block);
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__PKPaymentSetupCredentialsSectionController_deleteItem___block_invoke_3;
  v16[3] = &unk_1E59D7C50;
  objc_copyWeak(&v20, &location);
  uint64_t v18 = &v30;
  uint64_t v19 = v28;
  char v21 = v5;
  v16[4] = self;
  id v17 = v4;
  id v15 = v4;
  dispatch_group_notify(v13, v14, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);
}

void __57__PKPaymentSetupCredentialsSectionController_deleteItem___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __57__PKPaymentSetupCredentialsSectionController_deleteItem___block_invoke_2(uint64_t a1)
{
}

void __57__PKPaymentSetupCredentialsSectionController_deleteItem___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copy];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      if (*(unsigned char *)(a1 + 72))
      {
        if (*(unsigned char *)(*(void *)(a1 + 32) + 128))
        {
          char v5 = (void *)*((void *)WeakRetained + 15);
          id v6 = [*(id *)(a1 + 40) credential];
          [v5 addObject:v6];
        }
        else
        {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setSelected:1];
        }
      }
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setLoadingIndicatorVisible:0];
      [WeakRetained _replaceAndReloadItem:*(void *)(a1 + 40) withNewItem:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      id v8 = objc_loadWeakRetained((id *)WeakRetained + 20);
      [v8 showCredentialDeletionError];
    }
    else
    {
      [WeakRetained _removeCredentialItem:*(void *)(a1 + 40)];
      id v7 = objc_loadWeakRetained((id *)WeakRetained + 21);
      [v7 reloadAnimated:1];

      id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
      objc_msgSend(v8, "setShowNoResultsView:", objc_msgSend(*(id *)(a1 + 32), "_hasCredentialsToShow") ^ 1);
    }
  }
}

- (id)_titleTextForCredential:(id)a3
{
  return (id)[a3 longDescription];
}

- (id)_detailTextForCredential:(id)a3
{
  id v3 = a3;
  id v4 = [v3 detailDescriptionWithEnvironment:PKPaymentSetupContextIsSetupAssistant()];

  return v4;
}

- (id)_cardArtForCredentialItem:(id)a3
{
  id v4 = a3;
  snapshotCoordinator = self->_snapshotCoordinator;
  [(PKPaymentSetupCredentialsSectionController *)self _defaultCardSize];
  double v7 = v6;
  double v9 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PKPaymentSetupCredentialsSectionController__cardArtForCredentialItem___block_invoke;
  v13[3] = &unk_1E59D7C78;
  v13[4] = self;
  id v14 = v4;
  id v10 = v4;
  uint64_t v11 = -[PKPassSnapshotCoordinator cardSnapshotForSource:withSize:completion:](snapshotCoordinator, "cardSnapshotForSource:withSize:completion:", v10, v13, v7, v9);

  return v11;
}

void __72__PKPaymentSetupCredentialsSectionController__cardArtForCredentialItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = [a3 credential];
  double v6 = [*(id *)(a1 + 32) _credentialItemForCredential:v8];
  double v7 = (void *)[v6 copy];

  [v7 setPassSnapshot:v5];
  [v7 setIsSnapshotFetchInProgress:0];
  [*(id *)(a1 + 32) _replaceAndReloadItem:*(void *)(a1 + 40) withNewItem:v7];
}

- (CGSize)_defaultCardSize
{
  double v2 = 51.0;
  double v3 = 32.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_replaceAndReloadItem:(id)a3 withNewItem:(id)a4
{
  id v5 = a4;
  double v6 = [v5 credential];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  dispatch_time_t v12 = __80__PKPaymentSetupCredentialsSectionController__replaceAndReloadItem_withNewItem___block_invoke;
  id v13 = &unk_1E59D7CA0;
  id v14 = v6;
  id v7 = v5;
  id v15 = v7;
  id v8 = v6;
  if ([(PKPaymentSetupCredentialsSectionController *)self _enumerateCredentials:&v10])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataChangeDelegate);
    objc_msgSend(WeakRetained, "reloadItem:animated:", v7, 0, v10, v11, v12, v13, v14, v15);
  }
}

id __80__PKPaymentSetupCredentialsSectionController__replaceAndReloadItem_withNewItem___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  double v6 = [a3 credential];
  int v7 = PKEqualObjects();

  if (v7)
  {
    *a4 = 1;
    id v8 = *(id *)(a1 + 40);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_credentialItemForCredential:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  dispatch_time_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__33;
  id v15 = __Block_byref_object_dispose__33;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__PKPaymentSetupCredentialsSectionController__credentialItemForCredential___block_invoke;
  v8[3] = &unk_1E59D7CC8;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [(PKPaymentSetupCredentialsSectionController *)self _enumerateCredentials:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __75__PKPaymentSetupCredentialsSectionController__credentialItemForCredential___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  id v8 = [v7 credential];
  int v9 = PKEqualObjects();

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

  return 0;
}

- (id)_credentialItemFromIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentSetupCredentialsSectionController *)self identifiers];
  id v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));

  id v7 = [(NSMutableDictionary *)self->_allCredentials objectForKeyedSubscript:v6];
  uint64_t v8 = [v4 row];

  int v9 = [v7 objectAtIndexedSubscript:v8];

  return v9;
}

- (void)_removeCredentialItem:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PKPaymentSetupCredentialsSectionController__removeCredentialItem___block_invoke;
  aBlock[3] = &unk_1E59D7CF0;
  id v13 = v4;
  id v19 = v13;
  id v5 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = self->_sectionIdentifiers;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = [(NSMutableDictionary *)self->_allCredentials objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * v10)];
      char v12 = v5[2](v5, v11);

      if (v12) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v20 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

BOOL __68__PKPaymentSetupCredentialsSectionController__removeCredentialItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 count];
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v6 = 0;
    BOOL v7 = 1;
    while (1)
    {
      uint64_t v8 = [v3 objectAtIndexedSubscript:v6];
      uint64_t v9 = [v8 credential];
      uint64_t v10 = [*(id *)(a1 + 32) credential];

      if (v9 == v10) {
        break;
      }
      BOOL v7 = ++v6 < v5;
      if (v5 == v6) {
        goto LABEL_5;
      }
    }
    [v3 removeObjectAtIndex:v6];
  }
  else
  {
LABEL_5:
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_enumerateCredentials:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, uint64_t, void *, unsigned __int8 *))a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = self->_sectionIdentifiers;
  uint64_t v21 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  char v5 = 0;
  if (v21)
  {
    uint64_t v19 = *(void *)v25;
    id v20 = self;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v25 != v19) {
        objc_enumerationMutation(obj);
      }
      uint64_t v7 = *(void *)(*((void *)&v24 + 1) + 8 * v6);
      uint64_t v22 = v6;
      uint64_t v8 = [(NSMutableDictionary *)self->_allCredentials objectForKeyedSubscript:v7];
      uint64_t v9 = [v8 count];
      unsigned __int8 v23 = 0;
      if (v9)
      {
        unint64_t v10 = v9;
        unint64_t v11 = 1;
        do
        {
          char v12 = [v8 objectAtIndexedSubscript:v11 - 1];
          id v13 = v4[2](v4, v7, v12, &v23);

          if (v13)
          {
            [v8 setObject:v13 atIndexedSubscript:v11 - 1];
            char v5 = 1;
          }
          int v14 = v23;

          if (v14) {
            break;
          }
        }
        while (v11++ < v10);
      }
      self = v20;
      [(NSMutableDictionary *)v20->_allCredentials setObject:v8 forKeyedSubscript:v7];
      int v16 = v23;

      if (v16) {
        break;
      }
      uint64_t v6 = v22 + 1;
      if (v22 + 1 == v21)
      {
        uint64_t v21 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v21) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v5 & 1;
}

- (unint64_t)maximumNumberOfSelectableCredentials
{
  return self->_maximumNumberOfSelectableCredentials;
}

- (void)setMaximumNumberOfSelectableCredentials:(unint64_t)a3
{
  self->_maximumNumberOfSelectableCredentials = a3;
}

- (PKPaymentSetupCredentialsSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupCredentialsSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKDynamicListDataChangeDelegate)dataChangeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataChangeDelegate);

  return (PKDynamicListDataChangeDelegate *)WeakRetained;
}

- (void)setDataChangeDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataChangeDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storageSnapshot, 0);
  objc_storeStrong((id *)&self->_snapshotCoordinator, 0);
  objc_storeStrong((id *)&self->_selectedCredentialsBeforeEditing, 0);
  objc_storeStrong((id *)&self->_product, 0);
  objc_storeStrong((id *)&self->_footerForSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_allCredentials, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_lastBackedUpDefaultPaymentPassSerialNumber, 0);

  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end