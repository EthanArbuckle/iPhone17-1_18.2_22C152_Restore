@interface PKSharePreviewOverviewSectionController
- (PKPassShareInitiationContext)context;
- (PKSharePreviewOverviewSectionController)init;
- (PKSharePreviewOverviewSectionController)initWithInitiationContext:(id)a3 accessType:(int64_t)a4 entitlementComposer:(id)a5 delegate:(id)a6;
- (PKSharePreviewOverviewSectionController)initWithMode:(unint64_t)a3 accessType:(int64_t)a4 entitlementComposer:(id)a5 delegate:(id)a6;
- (PKSharePreviewOverviewSectionControllerDelegate)delegate;
- (id)_initWithMode:(unint64_t)a3 accessType:(int64_t)a4 entitlementComposer:(id)a5 context:(id)a6 delegate:(id)a7;
- (id)_localizedEntitlementSummary;
- (id)decorateListCell:(id)a3 forRowItem:(id)a4;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (id)sharedEntitlements;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_shareabilitySwitchValueChanged:(id)a3;
- (void)didSelectItem:(id)a3;
- (void)reloadItemsAnimated:(BOOL)a3;
- (void)setContext:(id)a3;
@end

@implementation PKSharePreviewOverviewSectionController

- (PKSharePreviewOverviewSectionController)init
{
  return 0;
}

- (PKSharePreviewOverviewSectionController)initWithInitiationContext:(id)a3 accessType:(int64_t)a4 entitlementComposer:(id)a5 delegate:(id)a6
{
  return (PKSharePreviewOverviewSectionController *)[(PKSharePreviewOverviewSectionController *)self _initWithMode:0 accessType:a4 entitlementComposer:a5 context:a3 delegate:a6];
}

- (PKSharePreviewOverviewSectionController)initWithMode:(unint64_t)a3 accessType:(int64_t)a4 entitlementComposer:(id)a5 delegate:(id)a6
{
  return (PKSharePreviewOverviewSectionController *)[(PKSharePreviewOverviewSectionController *)self _initWithMode:a3 accessType:a4 entitlementComposer:a5 context:0 delegate:a6];
}

- (id)_initWithMode:(unint64_t)a3 accessType:(int64_t)a4 entitlementComposer:(id)a5 context:(id)a6 delegate:(id)a7
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v26[0] = @"RecipientSection";
  v26[1] = @"EntitlementsSection";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v25.receiver = self;
  v25.super_class = (Class)PKSharePreviewOverviewSectionController;
  v17 = [(PKPassShareSectionController *)&v25 initWithIdentifiers:v16];

  if (v17)
  {
    v17->_mode = a3;
    v17->_accessType = a4;
    objc_storeWeak((id *)&v17->_delegate, v15);
    objc_storeStrong((id *)&v17->_context, a6);
    objc_storeStrong((id *)&v17->_entitlementComposer, a5);
    objc_initWeak(&location, v17);
    v18 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v19 = objc_opt_class();
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __105__PKSharePreviewOverviewSectionController__initWithMode_accessType_entitlementComposer_context_delegate___block_invoke;
    v22[3] = &unk_1E59CBB38;
    objc_copyWeak(&v23, &location);
    v20 = [v18 registrationWithCellClass:v19 configurationHandler:v22];
    [(PKPaymentSetupListSectionController *)v17 setCellRegistration:v20];

    [(PKSharePreviewOverviewSectionController *)v17 reloadItemsAnimated:0];
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __105__PKSharePreviewOverviewSectionController__initWithMode_accessType_entitlementComposer_context_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = (id)[WeakRetained decorateListCell:v9 forRowItem:v6];
  }
}

- (id)sharedEntitlements
{
  return (id)[(PKPassEntitlementsComposer *)self->_entitlementComposer composeSharedEntitlements];
}

- (void)reloadItemsAnimated:(BOOL)a3
{
  BOOL v43 = a3;
  v45[1] = *MEMORY[0x1E4F143B8];
  unint64_t mode = self->_mode;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  BOOL v8 = [(PKPassShareInitiationContext *)self->_context requiresContactSelection];
  if (!mode && (v7 & 1) != 0 && v8)
  {
    id v9 = [[PKSharePreviewRowItem alloc] initWithIdentifier:@"RecipientRowItemIdentifier"];
    v10 = [(PKPassShareInitiationContext *)self->_context composedShare];
    v11 = [v10 recipientNickname];

    if ([v11 length])
    {
      [(PKSharePreviewRowItem *)v9 setTitle:v11];
      [MEMORY[0x1E4FB1618] systemBlueColor];
    }
    else
    {
      v12 = PKLocalizedShareableCredentialString(&cfstr_ShareOverviewS_1.isa);
      [(PKSharePreviewRowItem *)v9 setTitle:v12];

      [MEMORY[0x1E4FB1618] secondaryLabelColor];
    id v13 = };
    [(PKSharePreviewRowItem *)v9 setTitleColor:v13];

    [v5 addObject:v9];
  }
  id v14 = (NSArray *)[v5 copy];
  recipientItems = self->_recipientItems;
  self->_recipientItems = v14;

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v17 = [(PKPassEntitlementsComposer *)self->_entitlementComposer predefinedEntitlementEntries];
  uint64_t v18 = [v17 count];

  if (!v18
    && [(PKPassEntitlementsComposer *)self->_entitlementComposer canAllowResharing])
  {
    uint64_t v19 = [(PKPassEntitlementsComposer *)self->_entitlementComposer globalView];
    if ([(PKSharePreviewRowItem *)v19 isManagingEntitlementConfiguration])
    {
      char v20 = [(PKPassEntitlementsComposer *)self->_entitlementComposer preferDetailedCapabilityDisplay];

      if (v20) {
        goto LABEL_17;
      }
      uint64_t v19 = [[PKSharePreviewRowItem alloc] initWithIdentifier:@"ShareabilityRowItem"];
      v21 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.2.fill" withConfiguration:0];
      [(PKSharePreviewRowItem *)v19 setIcon:v21];

      v22 = PKLocalizedShareableCredentialString(&cfstr_ShareOverviewS_2.isa);
      [(PKSharePreviewRowItem *)v19 setTitle:v22];

      id v23 = [(PKPassEntitlementsComposer *)self->_entitlementComposer globalView];
      [v23 shareability];
      int CanAllowResharing = PKSharingCapabilityShareabilityCanAllowResharing();

      if (CanAllowResharing) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = 2;
      }
      [(PKSharePreviewRowItem *)v19 setDisplayToggleState:v25];
      [(PKSharePreviewRowItem *)v19 setAccessoryEnabled:[(PKPassEntitlementsComposer *)self->_entitlementComposer editable]];
      [v16 addObject:v19];
    }
  }
LABEL_17:
  v26 = [[PKSharePreviewRowItem alloc] initWithIdentifier:@"EntitlementsRowItem"];
  int64_t accessType = self->_accessType;
  if (mode) {
    BOOL v28 = accessType == 4;
  }
  else {
    BOOL v28 = 0;
  }
  BOOL v29 = v28 || mode == 1;
  v30 = @"checklist.checked";
  if (v29) {
    v30 = @"lock.shield.fill";
  }
  v31 = v30;
  if (accessType == 4)
  {
    v32 = @"SHARE_OVERVIEW_SECTION_ENTITLEMENTS_TITLE_VEHICLE";
  }
  else
  {
    if (self->_mode == 1)
    {
      v33 = PKLocalizedShareableCredentialString(&cfstr_ShareOverviewS_5.isa);
      [(PKSharePreviewRowItem *)v26 setTitle:v33];
      goto LABEL_31;
    }
    v32 = @"SHARE_OVERVIEW_SECTION_ENTITLEMENTS_TITLE";
  }
  v34 = [MEMORY[0x1E4FB1818] systemImageNamed:v31 withConfiguration:0];
  [(PKSharePreviewRowItem *)v26 setIcon:v34];

  v35 = PKLocalizedShareableCredentialString(&v32->isa);
  [(PKSharePreviewRowItem *)v26 setTitle:v35];

  v33 = [(PKSharePreviewOverviewSectionController *)self _localizedEntitlementSummary];
  [(PKSharePreviewRowItem *)v26 setSubtitle:v33];
LABEL_31:

  [(PKSharePreviewRowItem *)v26 setDisplayChevron:1];
  [v16 addObject:v26];
  v36 = (NSArray *)[v16 copy];
  entitlementItems = self->_entitlementItems;
  self->_entitlementItems = v36;

  if ([(NSArray *)self->_recipientItems count])
  {
    v44[0] = @"RecipientSection";
    v44[1] = @"EntitlementsSection";
    v38 = (void *)MEMORY[0x1E4F1C978];
    v39 = v44;
    uint64_t v40 = 2;
  }
  else
  {
    v45[0] = @"EntitlementsSection";
    v38 = (void *)MEMORY[0x1E4F1C978];
    v39 = v45;
    uint64_t v40 = 1;
  }
  v41 = [v38 arrayWithObjects:v39 count:v40];
  [(PKPaymentSetupListSectionController *)self setIdentifiers:v41];

  id v42 = objc_loadWeakRetained((id *)&self->_delegate);
  [v42 reloadDataAnimated:v43];
}

- (id)_localizedEntitlementSummary
{
  return (id)[(PKPassEntitlementsComposer *)self->_entitlementComposer localizedSelectedEntitlementSummaryForAccessType:self->_accessType];
}

- (id)decorateListCell:(id)a3 forRowItem:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [MEMORY[0x1E4FB1948] valueCellConfiguration];
  id v9 = [v7 title];
  [v8 setText:v9];

  v10 = [v7 titleColor];
  if (v10)
  {
    v11 = [v8 textProperties];
    [v11 setColor:v10];
  }
  v12 = [v7 subtitle];
  [v8 setSecondaryText:v12];

  id v13 = [v8 secondaryTextProperties];
  id v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v13 setColor:v14];

  objc_msgSend(v8, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 8.0);
  id v15 = [v7 icon];
  [v8 setImage:v15];

  id v16 = [v8 imageProperties];
  v17 = [MEMORY[0x1E4FB1618] systemBlueColor];
  [v16 setTintColor:v17];

  [v6 setContentConfiguration:v8];
  if (self->_mode == 2) {
    [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  else {
  uint64_t v18 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __71__PKSharePreviewOverviewSectionController_decorateListCell_forRowItem___block_invoke;
  v28[3] = &unk_1E59D4018;
  id v19 = v18;
  id v29 = v19;
  [v6 setConfigurationUpdateHandler:v28];
  if (![v7 displayChevron])
  {
    uint64_t v21 = [v7 displayToggleState];
    if (!v21) {
      goto LABEL_14;
    }
    uint64_t v22 = v21;
    id v23 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    v24 = [v7 identifier];
    int v25 = PKEqualObjects();

    if (v25) {
      [v23 addTarget:self action:sel__shareabilitySwitchValueChanged_ forControlEvents:4096];
    }
    [v23 setOn:v22 == 1];
    objc_msgSend(v23, "setEnabled:", objc_msgSend(v7, "accessoryEnabled"));
    id v20 = (id)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v23 placement:1];
    [v20 setMaintainsFixedSize:1];

    if (!v20) {
      goto LABEL_14;
    }
LABEL_13:
    v30[0] = v20;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    [v6 setAccessories:v26];

    goto LABEL_15;
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4FB1518]);
  if (v20) {
    goto LABEL_13;
  }
LABEL_14:
  [v6 setAccessories:MEMORY[0x1E4F1CBF0]];
LABEL_15:

  return v8;
}

void __71__PKSharePreviewOverviewSectionController_decorateListCell_forRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = (void *)MEMORY[0x1E4FB1498];
  id v6 = a2;
  id v7 = [v5 listGroupedCellConfiguration];
  if ([v9 isHighlighted] & 1) != 0 || (objc_msgSend(v9, "isSelected"))
  {
    BOOL v8 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
    [v7 setBackgroundColor:v8];
  }
  else
  {
    [v7 setBackgroundColor:*(void *)(a1 + 32)];
  }
  [v6 setBackgroundConfiguration:v7];
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (self->_mode == 1)
  {
    v3 = 0;
  }
  else
  {
    int v4 = PKEqualObjects();
    id v5 = @"SHARE_OVERVIEW_SECTION_ENTITLEMENTS_HEADER";
    if (v4) {
      id v5 = @"SHARE_OVERVIEW_SECTION_RECIPIENT_HEADER";
    }
    id v6 = (objc_class *)MEMORY[0x1E4F28B18];
    id v7 = v5;
    id v8 = [v6 alloc];
    id v9 = PKLocalizedShareableCredentialString(v7);

    v14[0] = *MEMORY[0x1E4FB06F8];
    v10 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB27B8], 2, 0);
    v15[0] = v10;
    v14[1] = *MEMORY[0x1E4FB0700];
    v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v15[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    v3 = (void *)[v8 initWithString:v9 attributes:v12];
  }

  return v3;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  if (PKEqualObjects() && self->_recipientItems
    || PKEqualObjects() && self->_entitlementItems)
  {
    objc_msgSend(v6, "appendItems:");
  }

  return v6;
}

- (void)didSelectItem:(id)a3
{
  id v8 = [a3 identifier];
  if (PKEqualObjects())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 sharePreviewSectionControllerDidSelectShowContactPicker:self];
    goto LABEL_7;
  }
  if (!PKEqualObjects() && PKEqualObjects())
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 sharePreviewSectionControllerDidSelectEntitlements:self];
LABEL_7:
  }
LABEL_8:
  id v7 = objc_loadWeakRetained((id *)&self->_delegate);
  [v7 deselectCells];
}

- (void)_shareabilitySwitchValueChanged:(id)a3
{
  unsigned int v4 = [a3 isOn];
  char v5 = [(PKPassEntitlementsComposer *)self->_entitlementComposer globalView];
  [v5 setShareability:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sharePreviewSectionControllerDidUpdateEntitlements:self];
}

- (PKSharePreviewOverviewSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKSharePreviewOverviewSectionControllerDelegate *)WeakRetained;
}

- (PKPassShareInitiationContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entitlementItems, 0);
  objc_storeStrong((id *)&self->_recipientItems, 0);

  objc_storeStrong((id *)&self->_entitlementComposer, 0);
}

@end