@interface PKPassEntitlementCapabilitySectionController
- (BOOL)isDisabled;
- (BOOL)shouldHighlightItem:(id)a3;
- (PKPassEntitlementCapabilitySectionController)init;
- (PKPassEntitlementCapabilitySectionController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 composerView:(id)a5 isDisabled:(BOOL)a6 delegate:(id)a7;
- (id)decorateListCell:(id)a3 forRowItem:(id)a4;
- (id)footerAttributedStringForIdentifier:(id)a3;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_allowSharingSwitchValueChanged:(id)a3;
- (void)_buildRowItemsWithNotify:(BOOL)a3;
- (void)_canSeeAllSwitchValueChanged:(id)a3;
- (void)_updateAllowSharingTo:(BOOL)a3;
- (void)didSelectItem:(id)a3;
- (void)setIsDisabled:(BOOL)a3;
@end

@implementation PKPassEntitlementCapabilitySectionController

- (PKPassEntitlementCapabilitySectionController)init
{
  return 0;
}

- (PKPassEntitlementCapabilitySectionController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 composerView:(id)a5 isDisabled:(BOOL)a6 delegate:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PKPassEntitlementCapabilitySectionController;
  v16 = [(PKPassShareSectionController *)&v28 initWithIdentifiers:MEMORY[0x1E4F1CBF0]];
  v17 = v16;
  if (v16)
  {
    v16->_mode = a3;
    objc_storeStrong((id *)&v16->_entitlementComposer, a4);
    objc_storeStrong((id *)&v17->_composerView, a5);
    v17->_isDisabled = a6;
    objc_storeWeak((id *)&v17->_delegate, v15);
    [(PKPassEntitlementCapabilitySectionController *)v17 _buildRowItemsWithNotify:0];
    objc_initWeak(&location, v17);
    v18 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v19 = objc_opt_class();
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    v24 = __114__PKPassEntitlementCapabilitySectionController_initWithMode_entitlementComposer_composerView_isDisabled_delegate___block_invoke;
    v25 = &unk_1E59CBB38;
    objc_copyWeak(&v26, &location);
    v20 = [v18 registrationWithCellClass:v19 configurationHandler:&v22];
    -[PKPaymentSetupListSectionController setCellRegistration:](v17, "setCellRegistration:", v20, v22, v23, v24, v25);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __114__PKPassEntitlementCapabilitySectionController_initWithMode_entitlementComposer_composerView_isDisabled_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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

- (void)_buildRowItemsWithNotify:(BOOL)a3
{
  BOOL v83 = a3;
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v86 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = [(PKPassEntitlementsComposer *)self->_entitlementComposer editable];
  uint64_t v6 = [(PKPassEntitlementsComposerView *)self->_composerView shareability];
  uint64_t v92 = [(PKPassEntitlementsComposerView *)self->_composerView visibility];
  id v90 = (id)[(PKPassEntitlementsComposerView *)self->_composerView manageability];
  v96 = self;
  v7 = [(PKPassEntitlementsComposerView *)self->_composerView allPossibleCapabilitySets];
  v82 = v7;
  if (PKSharingUsePredefinedCapabilitySets() && [v7 count])
  {
    v84 = v4;
    id v93 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    obuint64_t j = v7;
    uint64_t v8 = [obj countByEnumeratingWithState:&v110 objects:v117 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v111;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v111 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v110 + 1) + 8 * i);
          BOOL v13 = v6 == [v12 shareability]
             && v92 == [v12 visibility]
             && v90 == (id)[v12 manageability];
          if (v13 | v5)
          {
            id v14 = [NSString alloc];
            id v15 = [v12 localizedName];
            v16 = (void *)[v14 initWithFormat:@"%@-%@", @"CapabilitySetSectionIdentifier", v15, v82];

            v17 = [(PKSharePreviewRowItem *)[PKShareCapabilityRowItem alloc] initWithIdentifier:v16];
            [(PKShareCapabilityRowItem *)v17 setSectionIdentifier:@"CapabilitySetSectionIdentifier"];
            [(PKShareCapabilityRowItem *)v17 setCapabilitySet:v12];
            v18 = [v12 localizedName];
            [(PKSharePreviewRowItem *)v17 setTitle:v18];

            [(PKSharePreviewRowItem *)v17 setDisplayCheckmark:v13];
            [(PKSharePreviewRowItem *)v17 setEnabled:!v96->_isDisabled];
            [(PKSharePreviewRowItem *)v17 setAccessoryEnabled:v5];
            [v93 addObject:v17];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v110 objects:v117 count:16];
      }
      while (v9);
    }

    id v4 = v84;
    [v84 addObject:@"CapabilitySetSectionIdentifier"];
    uint64_t v19 = (void *)[v93 copy];
    v20 = v86;
    [v86 setObject:v19 forKeyedSubscript:@"CapabilitySetSectionIdentifier"];

    v21 = v96;
  }
  else
  {
    if (v5 && !PKSharingAllowAdvancedCapabilitySelection())
    {
      id v93 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v21 = self;
      [(PKPassEntitlementsComposerView *)self->_composerView shareability];
      unint64_t v63 = PKSharingCapabilityShareabilityMaxDepth();
      unint64_t v64 = PKSharingCapabilityShareabilityMaxDepth();
      v65 = [(PKPassEntitlementsComposerView *)v96->_composerView allPossibleShareability];
      v66 = [NSNumber numberWithUnsignedInteger:1];
      int v67 = [v65 containsObject:v66];

      if (v67) {
        BOOL v68 = [(PKPassEntitlementsComposerView *)v96->_composerView possibleVisibility] == 2;
      }
      else {
        BOOL v68 = 0;
      }
      uint64_t v69 = [(PKPassEntitlementsComposerView *)v96->_composerView visibility];
      v70 = [(PKSharePreviewRowItem *)[PKShareCapabilityRowItem alloc] initWithIdentifier:@"SimpleCapabilityOptionAllowSharingIdentifier"];
      [(PKShareCapabilityRowItem *)v70 setSectionIdentifier:@"SimpleCapabilityOptionsSectionIdentifier"];
      v71 = PKLocalizedShareableCredentialString(&cfstr_SimpleCapabili.isa);
      [(PKSharePreviewRowItem *)v70 setTitle:v71];

      if (v63 >= v64) {
        uint64_t v72 = 1;
      }
      else {
        uint64_t v72 = 2;
      }
      [(PKSharePreviewRowItem *)v70 setDisplayToggleState:v72];
      BOOL v73 = v67 && !v96->_isDisabled;
      [(PKSharePreviewRowItem *)v70 setEnabled:v73];
      [(PKSharePreviewRowItem *)v70 setAccessoryEnabled:1];
      [v93 addObject:v70];
      v62 = [(PKSharePreviewRowItem *)[PKShareCapabilityRowItem alloc] initWithIdentifier:@"SimpleCapabilityOptionCanSeeAllIdentifier"];

      [(PKShareCapabilityRowItem *)v62 setSectionIdentifier:@"SimpleCapabilityOptionsSectionIdentifier"];
      v74 = PKLocalizedShareableCredentialString(&cfstr_SimpleCapabili_0.isa);
      [(PKSharePreviewRowItem *)v62 setTitle:v74];

      if (v69 == 2) {
        uint64_t v75 = 1;
      }
      else {
        uint64_t v75 = 2;
      }
      [(PKSharePreviewRowItem *)v62 setDisplayToggleState:v75];
      BOOL v76 = v68 && !v96->_isDisabled;
      v20 = v86;
      [(PKSharePreviewRowItem *)v62 setEnabled:v76];
      [(PKSharePreviewRowItem *)v62 setAccessoryEnabled:1];
      [v93 addObject:v62];
      [v4 addObject:@"SimpleCapabilityOptionsSectionIdentifier"];
      v77 = (void *)[v93 copy];
      [v86 setObject:v77 forKeyedSubscript:@"SimpleCapabilityOptionsSectionIdentifier"];
    }
    else
    {
      v85 = v4;
      id v87 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      v21 = self;
      id v94 = [(PKPassEntitlementsComposerView *)self->_composerView allPossibleShareability];
      uint64_t v22 = [v94 countByEnumeratingWithState:&v106 objects:v116 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v107;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v107 != v24) {
              objc_enumerationMutation(v94);
            }
            id v26 = *(void **)(*((void *)&v106 + 1) + 8 * j);
            uint64_t v27 = [v26 unsignedIntegerValue];
            uint64_t v28 = [(PKPassEntitlementsComposerView *)v21->_composerView shareability];
            if (v28 == v27) {
              int v29 = 1;
            }
            else {
              int v29 = v5;
            }
            if (v29 == 1)
            {
              if (v28 == v27) {
                uint64_t v30 = v5;
              }
              else {
                uint64_t v30 = 0;
              }
              v31 = (void *)[[NSString alloc] initWithFormat:@"%@-%@", @"SharabilitySectionIdentifier", v26, v82];
              v32 = [(PKSharePreviewRowItem *)[PKShareCapabilityRowItem alloc] initWithIdentifier:v31];
              [(PKShareCapabilityRowItem *)v32 setSectionIdentifier:@"SharabilitySectionIdentifier"];
              [(PKShareCapabilityRowItem *)v32 setCapability:v27];
              uint64_t v105 = 0;
              v33 = PKSharingCapabilityShareabilityToLocalizedString();
              [(PKSharePreviewRowItem *)v32 setTitle:v33];

              [(PKSharePreviewRowItem *)v32 setSubtitle:0];
              [(PKSharePreviewRowItem *)v32 setDisplayCheckmark:v30];
              [(PKSharePreviewRowItem *)v32 setEnabled:!self->_isDisabled];
              [(PKSharePreviewRowItem *)v32 setAccessoryEnabled:v5];
              [v87 addObject:v32];

              v21 = self;
            }
          }
          uint64_t v23 = [v94 countByEnumeratingWithState:&v106 objects:v116 count:16];
        }
        while (v23);
      }

      [v85 addObject:@"SharabilitySectionIdentifier"];
      v34 = (void *)[v87 copy];
      [v86 setObject:v34 forKeyedSubscript:@"SharabilitySectionIdentifier"];

      id obja = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v103 = 0u;
      long long v104 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      id v95 = [(PKPassEntitlementsComposerView *)v21->_composerView allPossibleVisibility];
      uint64_t v35 = [v95 countByEnumeratingWithState:&v101 objects:v115 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v102;
        do
        {
          for (uint64_t k = 0; k != v36; ++k)
          {
            if (*(void *)v102 != v37) {
              objc_enumerationMutation(v95);
            }
            v39 = *(void **)(*((void *)&v101 + 1) + 8 * k);
            uint64_t v40 = [v39 unsignedIntegerValue];
            uint64_t v41 = [(PKPassEntitlementsComposerView *)v21->_composerView visibility];
            if (v41 == v40) {
              int v42 = 1;
            }
            else {
              int v42 = v5;
            }
            if (v42 == 1)
            {
              if (v41 == v40) {
                uint64_t v43 = v5;
              }
              else {
                uint64_t v43 = 0;
              }
              v44 = (void *)[[NSString alloc] initWithFormat:@"%@-%@", @"VisibilitySectionIdentifier", v39];
              v45 = [(PKSharePreviewRowItem *)[PKShareCapabilityRowItem alloc] initWithIdentifier:v44];
              [(PKShareCapabilityRowItem *)v45 setSectionIdentifier:@"VisibilitySectionIdentifier"];
              [(PKShareCapabilityRowItem *)v45 setCapability:v40];
              v46 = PKSharingCapabilityVisibilityToLocalizedString();
              [(PKSharePreviewRowItem *)v45 setTitle:v46];

              [(PKSharePreviewRowItem *)v45 setDisplayCheckmark:v43];
              if (PKSharingCapabilityIsVisibilityValidForManageability())
              {
                v21 = v96;
                BOOL v47 = !v96->_isDisabled;
              }
              else
              {
                BOOL v47 = 0;
                v21 = v96;
              }
              [(PKSharePreviewRowItem *)v45 setEnabled:v47];
              [(PKSharePreviewRowItem *)v45 setAccessoryEnabled:v5];
              [obja addObject:v45];
            }
          }
          uint64_t v36 = [v95 countByEnumeratingWithState:&v101 objects:v115 count:16];
        }
        while (v36);
      }

      [v85 addObject:@"VisibilitySectionIdentifier"];
      v48 = (void *)[obja copy];
      [v86 setObject:v48 forKeyedSubscript:@"VisibilitySectionIdentifier"];

      id v93 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v99 = 0u;
      long long v100 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      id v91 = [(PKPassEntitlementsComposerView *)v21->_composerView allPossibleManageability];
      uint64_t v49 = [v91 countByEnumeratingWithState:&v97 objects:v114 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v98;
        do
        {
          for (uint64_t m = 0; m != v50; ++m)
          {
            if (*(void *)v98 != v51) {
              objc_enumerationMutation(v91);
            }
            v53 = *(void **)(*((void *)&v97 + 1) + 8 * m);
            uint64_t v54 = [v53 unsignedIntegerValue];
            uint64_t v55 = [(PKPassEntitlementsComposerView *)v21->_composerView manageability];
            if (v55 == v54) {
              int v56 = 1;
            }
            else {
              int v56 = v5;
            }
            if (v56 == 1)
            {
              if (v55 == v54) {
                uint64_t v57 = v5;
              }
              else {
                uint64_t v57 = 0;
              }
              v58 = (void *)[[NSString alloc] initWithFormat:@"%@-%@", @"ManageabilitySectionIdentifier", v53];
              v59 = [(PKSharePreviewRowItem *)[PKShareCapabilityRowItem alloc] initWithIdentifier:v58];
              [(PKShareCapabilityRowItem *)v59 setSectionIdentifier:@"ManageabilitySectionIdentifier"];
              [(PKShareCapabilityRowItem *)v59 setCapability:v54];
              v60 = PKSharingCapabilityManageabilityToLocalizedString();
              [(PKSharePreviewRowItem *)v59 setTitle:v60];

              [(PKSharePreviewRowItem *)v59 setDisplayCheckmark:v57];
              if (PKSharingCapabilityIsManageabilityValidForVisibility()) {
                BOOL v61 = !v96->_isDisabled;
              }
              else {
                BOOL v61 = 0;
              }
              [(PKSharePreviewRowItem *)v59 setEnabled:v61];
              [(PKSharePreviewRowItem *)v59 setAccessoryEnabled:v5];
              [v93 addObject:v59];

              v21 = v96;
            }
          }
          uint64_t v50 = [v91 countByEnumeratingWithState:&v97 objects:v114 count:16];
        }
        while (v50);
      }

      id v4 = v85;
      [v85 addObject:@"ManageabilitySectionIdentifier"];
      v62 = (PKShareCapabilityRowItem *)[v93 copy];
      v20 = v86;
      [v86 setObject:v62 forKeyedSubscript:@"ManageabilitySectionIdentifier"];
    }
  }
  uint64_t v78 = [v20 copy];
  rowItemsForSection = v21->_rowItemsForSection;
  v21->_rowItemsForSection = (NSDictionary *)v78;

  v80 = (void *)[v4 copy];
  [(PKPaymentSetupListSectionController *)v21 setIdentifiers:v80];

  if (v83)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v21->_delegate);
    [WeakRetained reloadDataAnimated:1];
  }
}

- (void)setIsDisabled:(BOOL)a3
{
  if (((!self->_isDisabled ^ a3) & 1) == 0)
  {
    self->_isDisabled = a3;
    [(PKPassEntitlementCapabilitySectionController *)self _buildRowItemsWithNotify:1];
  }
}

- (id)decorateListCell:(id)a3 forRowItem:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  uint64_t v9 = [v7 title];
  [v8 setText:v9];

  uint64_t v10 = [v7 subtitle];
  [v8 setSecondaryText:v10];

  v11 = [v8 secondaryTextProperties];
  v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v11 setColor:v12];

  objc_msgSend(v8, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  [v6 setContentConfiguration:v8];
  objc_msgSend(v6, "setUserInteractionEnabled:", objc_msgSend(v7, "enabled"));
  if (([v7 displayChevron] & 1) != 0 || !objc_msgSend(v7, "displayToggleState"))
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4FB14F8]);
    [v19 setReservedLayoutWidth:*MEMORY[0x1E4FB2750]];
    objc_msgSend(v19, "setHidden:", objc_msgSend(v7, "displayCheckmark") ^ 1);
    goto LABEL_12;
  }
  uint64_t v13 = [v7 displayToggleState];
  if (!v13)
  {
    id v19 = 0;
    goto LABEL_12;
  }
  uint64_t v14 = v13;
  id v15 = objc_alloc_init(MEMORY[0x1E4FB1CD0]);
  v16 = [v7 identifier];
  char v17 = PKEqualObjects();

  if (v17)
  {
    v18 = &selRef__allowSharingSwitchValueChanged_;
LABEL_10:
    [v15 addTarget:self action:*v18 forControlEvents:4096];
    goto LABEL_11;
  }
  v20 = [v7 identifier];
  int v21 = PKEqualObjects();

  if (v21)
  {
    v18 = &selRef__canSeeAllSwitchValueChanged_;
    goto LABEL_10;
  }
LABEL_11:
  [v15 setOn:v14 == 1];
  objc_msgSend(v15, "setEnabled:", objc_msgSend(v7, "accessoryEnabled"));
  id v19 = (id)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v15 placement:1];
  [v19 setMaintainsFixedSize:1];

LABEL_12:
  if ([v7 accessoryEnabled]) {
    [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  else {
  uint64_t v22 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
  }
  [v19 setTintColor:v22];

  v25[0] = v19;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [v6 setAccessories:v23];

  [v6 setConfigurationUpdateHandler:&__block_literal_global_253];

  return v8;
}

void __76__PKPassEntitlementCapabilitySectionController_decorateListCell_forRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)headerAttributedStringForIdentifier:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v3 = (__CFString *)a3;
  id v4 = v3;
  if (v3 == @"SharabilitySectionIdentifier") {
    goto LABEL_4;
  }
  if (!v3)
  {
LABEL_18:

    goto LABEL_19;
  }
  char v5 = [(__CFString *)v3 isEqualToString:@"SharabilitySectionIdentifier"];

  if (v5)
  {
LABEL_4:
    id v6 = @"SHARED_ENTITLEMENT_CAPABILITY_SHAREABILITY_HEADER";
    goto LABEL_5;
  }
  uint64_t v14 = v4;
  if (v14 == @"VisibilitySectionIdentifier"
    || (id v15 = v14,
        char v16 = [(__CFString *)v14 isEqualToString:@"VisibilitySectionIdentifier"],
        v15,
        (v16 & 1) != 0))
  {
    id v6 = @"SHARED_ENTITLEMENT_CAPABILITY_VISIBILITY_HEADER";
    goto LABEL_5;
  }
  char v17 = v15;
  if (v17 == @"ManageabilitySectionIdentifier"
    || (v18 = v17,
        char v19 = [(__CFString *)v17 isEqualToString:@"ManageabilitySectionIdentifier"],
        v18,
        (v19 & 1) != 0))
  {
    id v6 = @"SHARED_ENTITLEMENT_CAPABILITY_MANAGEABILITY_HEADER";
    goto LABEL_5;
  }
  v20 = v18;
  if (v20 != @"CapabilitySetSectionIdentifier")
  {
    int v21 = v20;
    char v22 = [(__CFString *)v20 isEqualToString:@"CapabilitySetSectionIdentifier"];

    if ((v22 & 1) == 0)
    {
      uint64_t v23 = v21;
      if (v23 != @"OverviewSectionIdentifier") {
        [(__CFString *)v23 isEqualToString:@"OverviewSectionIdentifier"];
      }
      goto LABEL_18;
    }
  }
  id v6 = @"SHARED_ENTITLEMENT_CAPABILITY_SET_HEADER";
LABEL_5:
  uint64_t v7 = PKLocalizedShareableCredentialString(&v6->isa);
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
    v25[0] = *MEMORY[0x1E4FB06F8];
    uint64_t v10 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB27B8], 2, 0);
    v26[0] = v10;
    v25[1] = *MEMORY[0x1E4FB0700];
    v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v26[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    uint64_t v13 = (void *)[v9 initWithString:v8 attributes:v12];

    goto LABEL_20;
  }
LABEL_19:
  uint64_t v13 = 0;
LABEL_20:

  return v13;
}

- (id)footerAttributedStringForIdentifier:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v3 = (__CFString *)a3;
  id v4 = v3;
  if (v3 == @"CapabilitySetSectionIdentifier") {
    goto LABEL_4;
  }
  if (!v3)
  {
LABEL_12:

    goto LABEL_13;
  }
  char v5 = [(__CFString *)v3 isEqualToString:@"CapabilitySetSectionIdentifier"];

  if (v5)
  {
LABEL_4:
    id v6 = @"SHARED_ENTITLEMENT_CAPABILITY_SET_FOOTER";
    goto LABEL_5;
  }
  uint64_t v14 = v4;
  if (v14 != @"SimpleCapabilityOptionsSectionIdentifier")
  {
    id v15 = v14;
    char v16 = [(__CFString *)v14 isEqualToString:@"SimpleCapabilityOptionsSectionIdentifier"];

    if ((v16 & 1) == 0)
    {
      char v17 = v15;
      if (v17 != @"OverviewSectionIdentifier") {
        [(__CFString *)v17 isEqualToString:@"OverviewSectionIdentifier"];
      }
      goto LABEL_12;
    }
  }
  id v6 = @"SIMPLE_CAPABILITY_CREATION_FOOTER";
LABEL_5:
  uint64_t v7 = PKLocalizedShareableCredentialString(&v6->isa);
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
    v19[0] = *MEMORY[0x1E4FB06F8];
    uint64_t v10 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], (NSString *)*MEMORY[0x1E4FB27C0]);
    v20[0] = v10;
    v19[1] = *MEMORY[0x1E4FB0700];
    v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v20[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    uint64_t v13 = (void *)[v9 initWithString:v8 attributes:v12];

    goto LABEL_14;
  }
LABEL_13:
  uint64_t v13 = 0;
LABEL_14:

  return v13;
}

- (void)didSelectItem:(id)a3
{
  id v20 = a3;
  id v4 = [v20 sectionIdentifier];
  char v5 = v4;
  if (v4 == @"SharabilitySectionIdentifier") {
    goto LABEL_4;
  }
  if (v4)
  {
    int v6 = [(__CFString *)v4 isEqualToString:@"SharabilitySectionIdentifier"];

    if (v6)
    {
LABEL_4:
      -[PKPassEntitlementsComposerView setShareability:](self->_composerView, "setShareability:", [v20 capability]);
      goto LABEL_17;
    }
    uint64_t v7 = v5;
    if (v7 == @"VisibilitySectionIdentifier"
      || (uint64_t v8 = v7,
          int v9 = [(__CFString *)v7 isEqualToString:@"VisibilitySectionIdentifier"],
          v8,
          v9))
    {
      -[PKPassEntitlementsComposerView setVisibility:](self->_composerView, "setVisibility:", [v20 capability]);
      goto LABEL_17;
    }
    uint64_t v10 = v8;
    if (v10 == @"ManageabilitySectionIdentifier"
      || (v11 = v10,
          int v12 = [(__CFString *)v10 isEqualToString:@"ManageabilitySectionIdentifier"],
          v11,
          v12))
    {
      -[PKPassEntitlementsComposerView setManageability:](self->_composerView, "setManageability:", [v20 capability]);
      goto LABEL_17;
    }
    uint64_t v13 = v11;
    if (v13 == @"CapabilitySetSectionIdentifier"
      || (uint64_t v14 = v13,
          int v15 = [(__CFString *)v13 isEqualToString:@"CapabilitySetSectionIdentifier"],
          v14,
          v15))
    {
      composerView = self->_composerView;
      char v17 = [v20 capabilitySet];
      [(PKPassEntitlementsComposerView *)composerView updateCapabilitiesWithSet:v17];

      goto LABEL_17;
    }
    v18 = v14;
    if (v18 != @"OverviewSectionIdentifier") {
      [(__CFString *)v18 isEqualToString:@"OverviewSectionIdentifier"];
    }
  }

LABEL_17:
  [(PKPassEntitlementCapabilitySectionController *)self _buildRowItemsWithNotify:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained deselectCells];
}

- (BOOL)shouldHighlightItem:(id)a3
{
  id v4 = a3;
  BOOL v8 = 0;
  if ([(PKPassEntitlementsComposer *)self->_entitlementComposer editable])
  {
    char v5 = [v4 sectionIdentifier];
    if (v5 != @"SimpleCapabilityOptionsSectionIdentifier")
    {
      int v6 = v5;
      if (!v5
        || (int v7 = [(__CFString *)v5 isEqualToString:@"SimpleCapabilityOptionsSectionIdentifier"], v6, v6, !v7))
      {
        BOOL v8 = 1;
      }
    }
  }

  return v8;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  char v5 = (objc_class *)MEMORY[0x1E4FB1358];
  id v6 = a4;
  id v7 = objc_alloc_init(v5);
  BOOL v8 = [(NSDictionary *)self->_rowItemsForSection objectForKeyedSubscript:v6];

  [v7 appendItems:v8];

  return v7;
}

- (void)_allowSharingSwitchValueChanged:(id)a3
{
  -[PKPassEntitlementCapabilitySectionController _updateAllowSharingTo:](self, "_updateAllowSharingTo:", [a3 isOn]);

  [(PKPassEntitlementCapabilitySectionController *)self _buildRowItemsWithNotify:1];
}

- (void)_canSeeAllSwitchValueChanged:(id)a3
{
  uint64_t v4 = [a3 isOn];
  if (v4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [(PKPassEntitlementsComposerView *)self->_composerView setVisibility:v5];
  [(PKPassEntitlementCapabilitySectionController *)self _updateAllowSharingTo:v4];

  [(PKPassEntitlementCapabilitySectionController *)self _buildRowItemsWithNotify:1];
}

- (void)_updateAllowSharingTo:(BOOL)a3
{
  composerView = self->_composerView;
  if (a3)
  {
    uint64_t v5 = [(PKPassEntitlementsComposerView *)composerView visibility];
    id v6 = self->_composerView;
    if (v5 != 2) {
      goto LABEL_8;
    }
    id v7 = [(PKPassEntitlementsComposerView *)v6 allPossibleShareability];
    BOOL v8 = [NSNumber numberWithUnsignedInteger:2];
    int v9 = [v7 containsObject:v8];

    id v6 = self->_composerView;
    if (v9) {
      uint64_t v10 = 2;
    }
    else {
LABEL_8:
    }
      uint64_t v10 = 1;
    [(PKPassEntitlementsComposerView *)v6 setShareability:v10];
  }
  else
  {
    [(PKPassEntitlementsComposerView *)composerView setShareability:0];
    v11 = self->_composerView;
    [(PKPassEntitlementsComposerView *)v11 setVisibility:1];
  }
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowItemsForSection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_composerView, 0);

  objc_storeStrong((id *)&self->_entitlementComposer, 0);
}

@end