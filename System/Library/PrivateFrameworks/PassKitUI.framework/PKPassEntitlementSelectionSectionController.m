@interface PKPassEntitlementSelectionSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (PKPassEntitlementSelectionSectionController)init;
- (PKPassEntitlementSelectionSectionController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 delegate:(id)a5;
- (PKPassEntitlementSelectionSectionControllerDelegate)delegate;
- (id)decorateListCell:(id)a3 forEntitlementEntry:(id)a4;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_clearEntitlementSelectionAnimated:(BOOL)a3;
- (void)_clearEntitlementSelectionInGroup:(id)a3 animated:(BOOL)a4;
- (void)_updateEntitlementGroups;
- (void)didSelectItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)toggleValueChanged:(id)a3;
@end

@implementation PKPassEntitlementSelectionSectionController

- (PKPassEntitlementSelectionSectionController)init
{
  return 0;
}

- (PKPassEntitlementSelectionSectionController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PKPassEntitlementSelectionSectionController;
  v11 = [(PKPassShareSectionController *)&v25 initWithIdentifiers:&unk_1EF2BA248];
  v12 = v11;
  if (v11)
  {
    v11->_mode = a3;
    objc_storeStrong((id *)&v11->_entitlementComposer, a4);
    [(PKPassEntitlementSelectionSectionController *)v12 _updateEntitlementGroups];
    objc_storeWeak((id *)&v12->_delegate, v10);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    toggleTags = v12->_toggleTags;
    v12->_toggleTags = v13;

    objc_initWeak(&location, v12);
    v15 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v16 = objc_opt_class();
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __89__PKPassEntitlementSelectionSectionController_initWithMode_entitlementComposer_delegate___block_invoke;
    v22 = &unk_1E59CBB38;
    objc_copyWeak(&v23, &location);
    v17 = [v15 registrationWithCellClass:v16 configurationHandler:&v19];
    -[PKPaymentSetupListSectionController setCellRegistration:](v12, "setCellRegistration:", v17, v19, v20, v21, v22);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __89__PKPassEntitlementSelectionSectionController_initWithMode_entitlementComposer_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = (id)[WeakRetained decorateListCell:v9 forEntitlementEntry:v6];
  }
}

- (void)_updateEntitlementGroups
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(PKPassEntitlementsComposer *)self->_entitlementComposer entitlementEntries];
  v5 = objc_msgSend(v4, "pk_groupDictionaryByApplyingBlock:", &__block_literal_global_216);
  id v6 = (void *)[v5 mutableCopy];

  v7 = [v6 allKeys];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __71__PKPassEntitlementSelectionSectionController__updateEntitlementGroups__block_invoke_2;
  v24[3] = &unk_1E59DE760;
  id v8 = v6;
  id v25 = v8;
  id v9 = [v7 sortedArrayUsingComparator:v24];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v8, "objectForKeyedSubscript:", v15, (void)v20);
        v17 = [v16 sortedArrayUsingComparator:&__block_literal_global_24];

        [v8 setObject:v17 forKeyedSubscript:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v12);
  }

  [(PKPaymentSetupListSectionController *)self setIdentifiers:v10];
  v18 = (NSDictionary *)[v8 copy];
  groupedEntitlements = self->_groupedEntitlements;
  self->_groupedEntitlements = v18;
}

__CFString *__71__PKPassEntitlementSelectionSectionController__updateEntitlementGroups__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 displayableEntitlement];
  id v3 = [v2 localizedGroup];
  v4 = v3;
  if (!v3) {
    id v3 = @"Default";
  }
  v5 = v3;

  return v5;
}

uint64_t __71__PKPassEntitlementSelectionSectionController__updateEntitlementGroups__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v13 = [v12 displayableEntitlement];
        if (v9 <= [v13 groupPriority])
        {
          v14 = [v12 displayableEntitlement];
          uint64_t v9 = [v14 groupPriority];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v15 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5, 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v28 != v19) {
          objc_enumerationMutation(v15);
        }
        long long v21 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        long long v22 = [v21 displayableEntitlement];
        if (v18 <= [v22 groupPriority])
        {
          long long v23 = [v21 displayableEntitlement];
          uint64_t v18 = [v23 groupPriority];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v17);
  }
  else
  {
    uint64_t v18 = 0;
  }

  uint64_t v24 = 1;
  if (v9 >= v18) {
    uint64_t v24 = -1;
  }
  if (v9 == v18) {
    uint64_t v25 = 0;
  }
  else {
    uint64_t v25 = v24;
  }

  return v25;
}

uint64_t __71__PKPassEntitlementSelectionSectionController__updateEntitlementGroups__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 displayableEntitlement];
  id v6 = [v4 displayableEntitlement];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (id)decorateListCell:(id)a3 forEntitlementEntry:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 displayableEntitlement];
  uint64_t v9 = [(PKPassEntitlementsComposer *)self->_entitlementComposer viewFor:v7];
  uint64_t v10 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  uint64_t v11 = [v8 localizedTitle];
  [v10 setText:v11];

  uint64_t v12 = [v8 localizedSubtitle];
  [v10 setSecondaryText:v12];

  uint64_t v13 = [v10 secondaryTextProperties];
  v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v13 setColor:v14];

  objc_msgSend(v10, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 8.0);
  uint64_t v15 = [v8 iconName];

  if (v15)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v17 = [v8 iconName];
    uint64_t v18 = [v16 systemImageNamed:v17];
    [v10 setImage:v18];
  }
  [v6 setContentConfiguration:v10];
  [v6 setConfigurationUpdateHandler:&__block_literal_global_30];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v20 = [v9 enabled];
  if (([v9 isManagingTimeConfiguration] & 1) != 0
    || [v9 isManagingEntitlementConfiguration])
  {
    if (v20) {
      long long v21 = @"SHARED_ENTITLEMENT_ENABLED";
    }
    else {
      long long v21 = @"SHARED_ENTITLEMENT_DISABLED";
    }
    PKLocalizedShareableCredentialString(&v21->isa);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    long long v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1528]) initWithText:v22];
    uint64_t v24 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27F0]);
    [v23 setFont:v24];

    [v19 addObject:v23];
    id v25 = objc_alloc_init(MEMORY[0x1E4FB1518]);
    [v19 addObject:v25];

LABEL_9:
    goto LABEL_10;
  }
  if ([(PKPassEntitlementsComposer *)self->_entitlementComposer editable])
  {
    uint64_t v27 = [v8 displayStyle];
    if (v27)
    {
      if (v27 == 2)
      {
        id v22 = objc_alloc_init(MEMORY[0x1E4FB14F8]);
        [v22 setReservedLayoutWidth:*MEMORY[0x1E4FB2750]];
        if ((v20 & 1) == 0) {
          [v22 setHidden:1];
        }
        [v19 addObject:v22];
        goto LABEL_9;
      }
      if (v27 == 1)
      {
        id v28 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
        [v28 setOn:v20];
        long long v29 = [v8 entitlementIdentifier];
        uint64_t v30 = [v29 hash];

        [v28 setTag:v30];
        toggleTags = self->_toggleTags;
        long long v32 = [NSNumber numberWithUnsignedInteger:v30];
        [(NSMutableDictionary *)toggleTags setObject:v7 forKey:v32];

        [v28 addTarget:self action:sel_toggleValueChanged_ forControlEvents:4096];
        long long v33 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v28 placement:1];
        [v33 setMaintainsFixedSize:1];
        [v19 addObject:v33];
      }
    }
    else
    {
      long long v34 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = [v8 entitlementIdentifier];
        int v36 = 138412290;
        uint64_t v37 = v35;
        _os_log_impl(&dword_19F450000, v34, OS_LOG_TYPE_DEFAULT, "Disabling entitlement %@ due to unknown display style", (uint8_t *)&v36, 0xCu);
      }
      [v6 setUserInteractionEnabled:0];
    }
  }
LABEL_10:
  [v6 setAccessories:v19];

  return v10;
}

void __84__PKPassEntitlementSelectionSectionController_decorateListCell_forEntitlementEntry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v4 = (void *)MEMORY[0x1E4FB1498];
  id v5 = a2;
  id v6 = [v4 listGroupedCellConfiguration];
  if ([v9 isHighlighted] & 1) != 0 || (objc_msgSend(v9, "isSelected"))
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  uint64_t v8 = (void *)v7;
  [v6 setBackgroundColor:v7];

  [v5 setBackgroundConfiguration:v6];
}

- (void)toggleValueChanged:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "tag"));
  id v6 = [(NSMutableDictionary *)self->_toggleTags objectForKeyedSubscript:v5];
  if (v6)
  {
    [(PKPassEntitlementSelectionSectionController *)self didSelectItem:v6];
  }
  else
  {
    uint64_t v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Error: Did not find matching entitlement for toggle", v8, 2u);
    }

    objc_msgSend(v4, "setOn:", objc_msgSend(v4, "isOn") ^ 1);
  }
}

- (void)didSelectItem:(id)a3
{
  id v12 = a3;
  id v4 = [v12 displayableEntitlement];
  id v5 = [(PKPassEntitlementsComposer *)self->_entitlementComposer viewFor:v12];
  if (([v5 isManagingTimeConfiguration] & 1) != 0
    || [v5 isManagingEntitlementConfiguration])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained showAdvancedScheduleSelectionFlowForEntitlementEntry:v12];
LABEL_4:

    goto LABEL_5;
  }
  if ([(PKPassEntitlementsComposer *)self->_entitlementComposer editable])
  {
    int v7 = [v5 enabled];
    if ((v7 & 1) == 0)
    {
      if ([v5 maxSelectionCount] == 1) {
        [(PKPassEntitlementSelectionSectionController *)self _clearEntitlementSelectionAnimated:1];
      }
      if ([v4 clearGroupWhenSelected])
      {
        uint64_t v8 = [v4 localizedGroup];
        [(PKPassEntitlementSelectionSectionController *)self _clearEntitlementSelectionInGroup:v8 animated:1];
      }
    }
    [v5 setEnabled:v7 ^ 1u];
    p_delegate = &self->_delegate;
    id v10 = objc_loadWeakRetained((id *)p_delegate);
    [v10 reloadItem:v12 animated:1];

    id v11 = objc_loadWeakRetained((id *)p_delegate);
    [v11 deselectCells];

    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained entitlementSelectionDidChange];
    goto LABEL_4;
  }
LABEL_5:
}

- (void)_clearEntitlementSelectionInGroup:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = [(NSDictionary *)self->_groupedEntitlements objectForKeyedSubscript:a3];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v12 = [(PKPassEntitlementsComposer *)self->_entitlementComposer viewFor:v11];
        [v12 setEnabled:0];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained reloadItem:v11 animated:v4];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)_clearEntitlementSelectionAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = [(PKPassEntitlementsComposer *)self->_entitlementComposer globalView];
  [v5 setEnabled:0];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(PKPassEntitlementsComposer *)self->_entitlementComposer entitlementEntries];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained reloadItem:v11 animated:v3];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 length]
    || (BOOL v4 = (__CFString *)v3, v4 == @"Default")
    || (id v5 = v4) != 0
    && (char v6 = [(__CFString *)v4 isEqualToString:@"Default"], v5, (v6 & 1) != 0))
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
    v13[0] = *MEMORY[0x1E4FB06F8];
    uint64_t v9 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB27B8], 2, 0);
    v14[0] = v9;
    v13[1] = *MEMORY[0x1E4FB0700];
    uint64_t v10 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v14[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    uint64_t v7 = (void *)[v8 initWithString:v5 attributes:v11];
  }

  return v7;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassEntitlementsComposer *)self->_entitlementComposer viewFor:v4];
  if (([v5 isManagingTimeConfiguration] & 1) != 0
    || ([v5 isManagingEntitlementConfiguration] & 1) != 0)
  {
    BOOL v6 = 1;
  }
  else if ([(PKPassEntitlementsComposer *)self->_entitlementComposer editable])
  {
    id v8 = [v4 displayableEntitlement];
    BOOL v6 = [v8 displayStyle] == 2;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  uint64_t v7 = [(NSDictionary *)self->_groupedEntitlements objectForKeyedSubscript:v5];

  if (v7)
  {
    id v8 = [(NSDictionary *)self->_groupedEntitlements objectForKeyedSubscript:v5];
    [v6 appendItems:v8];
  }

  return v6;
}

- (PKPassEntitlementSelectionSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPassEntitlementSelectionSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entitlementComposer, 0);
  objc_storeStrong((id *)&self->_toggleTags, 0);

  objc_storeStrong((id *)&self->_groupedEntitlements, 0);
}

@end