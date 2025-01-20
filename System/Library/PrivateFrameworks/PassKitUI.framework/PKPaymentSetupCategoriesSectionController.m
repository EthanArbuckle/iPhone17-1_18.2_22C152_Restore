@interface PKPaymentSetupCategoriesSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (BOOL)updateWithRequirements:(unint64_t)a3 provisioningController:(id)a4 paymentSetupProductModel:(id)a5 forceProductConfiguration:(BOOL)a6;
- (PKPaymentSetupCategoriesSectionController)init;
- (PKPaymentSetupCategoriesSectionControllerDelegate)delegate;
- (id)_listItemForItemIdentifier:(id)a3 paymentSetupProductModel:(id)a4;
- (id)decoratePaymentSetListCell:(id)a3 forItem:(id)a4;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_updateItemIdentifier:(id)a3 loadingIndicatorVisibility:(BOOL)a4 animated:(BOOL)a5;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)didSelectItem:(id)a3;
- (void)hideLoadingIndicatorsAnimated:(BOOL)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PKPaymentSetupCategoriesSectionController

- (PKPaymentSetupCategoriesSectionController)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupCategoriesSectionController;
  result = [(PKPaymentSetupListSectionController *)&v8 init];
  if (result)
  {
    __asm { FMOV            V0.2D, #28.0 }
    result->_iconSize = _Q0;
  }
  return result;
}

- (id)decoratePaymentSetListCell:(id)a3 forItem:(id)a4
{
  v5 = (double *)self;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentSetupCategoriesSectionController;
  id v6 = a3;
  v7 = [(PKPaymentSetupListSectionController *)&v10 decoratePaymentSetListCell:v6 forItem:a4];
  objc_super v8 = objc_msgSend(v7, "imageProperties", v10.receiver, v10.super_class);
  v5 += 12;
  objc_msgSend(v8, "setMaximumSize:", *v5, v5[1]);
  objc_msgSend(v8, "setReservedLayoutSize:", *v5, v5[1]);
  [v8 setCornerRadius:6.0];
  [v6 setContentConfiguration:v7];

  return v7;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v8 = -[NSMutableDictionary objectForKey:](self->_sectionIdentifiersToItemIdentifierMapping, "objectForKey:", v5, 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [(NSMutableDictionary *)self->_itemIdentifierToItemMapping objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v7 safelyAddObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [v6 appendItems:v7];

  return v6;
}

- (id)identifiers
{
  return self->_orderedSectionIdentifiers;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(PKPaymentSetupListSectionController *)self defaultListLayout];
  uint64_t v9 = [(NSMutableDictionary *)self->_sectionIdentifierToSectionTitleMapping objectForKey:v6];

  objc_msgSend(v8, "setHeaderMode:", objc_msgSend(v9, "length") != 0);
  uint64_t v10 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v8 layoutEnvironment:v7];

  return v10;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4FB1948];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [v7 plainHeaderConfiguration];
  uint64_t v11 = [(NSMutableDictionary *)self->_sectionIdentifierToSectionTitleMapping objectForKey:v8];

  if ([v11 length])
  {
    v16[0] = *MEMORY[0x1E4FB06F8];
    v12 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2990], (void *)*MEMORY[0x1E4FB27B8], 2, 0);
    v17[0] = v12;
    v16[1] = *MEMORY[0x1E4FB0700];
    v13 = [MEMORY[0x1E4FB1618] labelColor];
    v17[1] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

    long long v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11 attributes:v14];
    [v10 setAttributedText:v15];

    objc_msgSend(v10, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  }
  else
  {
    [v10 setAttributedText:0];
  }
  [v9 setContentConfiguration:v10];
}

- (void)didSelectItem:(id)a3
{
  id v4 = a3;
  self->_didHideLoadingIndicators = 0;
  id v5 = [v4 identifier];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F87BE0]];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v8 = WeakRetained;
  if (v6)
  {
    [WeakRetained didSelectYourCardsWithCompletion:0];
  }
  else
  {
    id v9 = [v4 category];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __59__PKPaymentSetupCategoriesSectionController_didSelectItem___block_invoke;
    long long v15 = &unk_1E59CAEA8;
    long long v16 = self;
    id v10 = v5;
    id v17 = v10;
    int v11 = [v8 didSelectCategory:v9 completion:&v12];

    if (v11 && !self->_didHideLoadingIndicators) {
      -[PKPaymentSetupCategoriesSectionController _updateItemIdentifier:loadingIndicatorVisibility:animated:](self, "_updateItemIdentifier:loadingIndicatorVisibility:animated:", v10, 1, 0, v12, v13, v14, v15, v16);
    }
  }
}

uint64_t __59__PKPaymentSetupCategoriesSectionController_didSelectItem___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _updateItemIdentifier:*(void *)(result + 40) loadingIndicatorVisibility:0 animated:0];
  }
  return result;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  id v4 = [a3 identifier];
  if ([v4 isEqualToString:*MEMORY[0x1E4F87BE0]]) {
    BOOL hasCardsOnFileSelectable = self->_hasCardsOnFileSelectable;
  }
  else {
    BOOL hasCardsOnFileSelectable = 1;
  }

  return hasCardsOnFileSelectable;
}

- (void)_updateItemIdentifier:(id)a3 loadingIndicatorVisibility:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v12 = a3;
  id v8 = -[NSMutableDictionary objectForKey:](self->_itemIdentifierToItemMapping, "objectForKey:");
  id v9 = v8;
  if (v8 && [v8 loadingIndicatorVisible] != v6)
  {
    id v10 = (void *)[v9 copy];
    [v10 setLoadingIndicatorVisible:v6];
    [(NSMutableDictionary *)self->_itemIdentifierToItemMapping setObject:v10 forKey:v12];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained reloadItem:v10 animated:v5];
  }
}

- (void)hideLoadingIndicatorsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self->_didHideLoadingIndicators = 1;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v5 = [(NSMutableDictionary *)self->_itemIdentifierToItemMapping allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    id v9 = (id)*MEMORY[0x1E4F87BE0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(id *)(*((void *)&v14 + 1) + 8 * i);
        id v12 = v11;
        if (v11 == v9)
        {
        }
        else
        {
          if (!v9 || !v11)
          {

LABEL_15:
            [(PKPaymentSetupCategoriesSectionController *)self _updateItemIdentifier:v12 loadingIndicatorVisibility:0 animated:v3];
            continue;
          }
          int v13 = [v11 isEqualToString:v9];

          if (!v13) {
            goto LABEL_15;
          }
        }
        if (self->_hasCardsOnFileSelectable) {
          goto LABEL_15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (BOOL)updateWithRequirements:(unint64_t)a3 provisioningController:(id)a4 paymentSetupProductModel:(id)a5 forceProductConfiguration:(BOOL)a6
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v93 = a4;
  id v118 = a5;
  BOOL v9 = a6
    || (a3 & 2) != 0 && (self->_currentConfiguredRequirements & 2) == 0
    || (a3 & 8) != 0 && (self->_currentConfiguredRequirements & 8) == 0;
  id v10 = self->_sectionIdentifierToSectionTitleMapping;
  id v11 = self->_itemIdentifierToItemMapping;
  uint64_t v91 = 80;
  id v12 = self->_sectionIdentifiersToItemIdentifierMapping;
  int v13 = self->_orderedSectionIdentifiers;
  long long v14 = v13;
  if (v9)
  {
    long long v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);

    long long v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v95 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);

    v96 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    obuint64_t j = [v118 allSections];
    uint64_t v100 = [obj countByEnumeratingWithState:&v137 objects:v146 count:16];
    if (!v100) {
      goto LABEL_81;
    }
    uint64_t v98 = *(void *)v138;
    v105 = v16;
    v103 = self;
    v99 = v15;
    while (1)
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v138 != v98) {
          objc_enumerationMutation(obj);
        }
        uint64_t v102 = v17;
        long long v18 = *(void **)(*((void *)&v137 + 1) + 8 * v17);
        id v19 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        id v106 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v107 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v133 = 0u;
        long long v134 = 0u;
        long long v135 = 0u;
        long long v136 = 0u;
        v101 = v18;
        id v109 = [v18 categories];
        uint64_t v20 = [v109 countByEnumeratingWithState:&v133 objects:v145 count:16];
        id v110 = v19;
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v134;
          uint64_t v104 = *(void *)v134;
          do
          {
            uint64_t v23 = 0;
            uint64_t v108 = v21;
            do
            {
              if (*(void *)v134 != v22) {
                objc_enumerationMutation(v109);
              }
              v24 = *(void **)(*((void *)&v133 + 1) + 8 * v23);
              v25 = objc_msgSend(v24, "identifier", v91);
              [v19 appendString:v25];
              v26 = [(NSMutableDictionary *)self->_itemIdentifierToItemMapping objectForKey:v25];
              v27 = v26;
              if (v26)
              {
                v28 = (void *)[v26 copy];
              }
              else
              {
                v28 = [(PKPaymentSetupCategoriesSectionController *)self _listItemForItemIdentifier:v25 paymentSetupProductModel:v118];
                [v28 setIdentifier:v25];
                [v28 setDisplayChevron:1];
              }
              if (v25) {
                BOOL v29 = v28 == 0;
              }
              else {
                BOOL v29 = 1;
              }
              if (!v29)
              {
                v30 = v16;
                [(NSMutableDictionary *)v16 setObject:v28 forKey:v25];
                [v107 addObject:v25];
                [v106 addObject:v28];
                [v28 setCategory:v24];
                uint64_t v31 = [v24 localizedDisplayName];
                if (v31) {
                  [v28 setTitle:v31];
                }
                v111 = (void *)v31;
                v112 = v27;
                v115 = v28;
                v113 = v25;
                uint64_t v114 = v23;
                long long v131 = 0u;
                long long v132 = 0u;
                long long v129 = 0u;
                long long v130 = 0u;
                v32 = [v24 productIdentifiers];
                uint64_t v33 = [v32 countByEnumeratingWithState:&v129 objects:v144 count:16];
                if (v33)
                {
                  uint64_t v34 = v33;
                  uint64_t v35 = 0;
                  id v116 = v32;
                  uint64_t v117 = *(void *)v130;
                  do
                  {
                    for (uint64_t i = 0; i != v34; ++i)
                    {
                      if (*(void *)v130 != v117) {
                        objc_enumerationMutation(v116);
                      }
                      v37 = [v118 productForProductIdentifier:*(void *)(*((void *)&v129 + 1) + 8 * i)];
                      long long v125 = 0u;
                      long long v126 = 0u;
                      long long v127 = 0u;
                      long long v128 = 0u;
                      v38 = [v37 featureApplications];
                      uint64_t v39 = [v38 countByEnumeratingWithState:&v125 objects:v143 count:16];
                      if (v39)
                      {
                        uint64_t v40 = v39;
                        unint64_t v41 = 0;
                        uint64_t v42 = *(void *)v126;
                        do
                        {
                          for (uint64_t j = 0; j != v40; ++j)
                          {
                            if (*(void *)v126 != v42) {
                              objc_enumerationMutation(v38);
                            }
                            v44 = *(void **)(*((void *)&v125 + 1) + 8 * j);
                            if ([v44 applicationState] == 5 && objc_msgSend(v44, "applicationType") == 1) {
                              ++v41;
                            }
                          }
                          uint64_t v40 = [v38 countByEnumeratingWithState:&v125 objects:v143 count:16];
                        }
                        while (v40);
                      }
                      else
                      {
                        unint64_t v41 = 0;
                      }

                      unint64_t v45 = [v37 provisioningStatus];
                      if (v41 <= 1) {
                        uint64_t v46 = 1;
                      }
                      else {
                        uint64_t v46 = v41;
                      }
                      if (v41) {
                        BOOL v47 = 1;
                      }
                      else {
                        BOOL v47 = v45 > 1;
                      }
                      if (!v47) {
                        uint64_t v46 = 0;
                      }
                      v35 += v46;
                    }
                    uint64_t v34 = [v116 countByEnumeratingWithState:&v129 objects:v144 count:16];
                  }
                  while (v34);

                  self = v103;
                  uint64_t v22 = v104;
                  long long v16 = v105;
                  id v19 = v110;
                  if (v35)
                  {
                    v48 = (void *)MEMORY[0x1E4F28EE0];
                    v49 = [NSNumber numberWithUnsignedInteger:v35];
                    v50 = [v48 localizedStringFromNumber:v49 numberStyle:0];
                    [v115 setBadgeText:v50];

LABEL_59:
                    uint64_t v21 = v108;
                    v25 = v113;
                    uint64_t v23 = v114;
                    v27 = v112;

                    v28 = v115;
                    goto LABEL_60;
                  }
                }
                else
                {

                  long long v16 = v30;
                  id v19 = v110;
                }
                [v115 setBadgeText:0];
                goto LABEL_59;
              }
LABEL_60:

              ++v23;
            }
            while (v23 != v21);
            uint64_t v21 = [v109 countByEnumeratingWithState:&v133 objects:v145 count:16];
          }
          while (v21);
        }

        long long v123 = 0u;
        long long v124 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        id v51 = v106;
        uint64_t v52 = [v51 countByEnumeratingWithState:&v121 objects:v142 count:16];
        if (v52)
        {
          uint64_t v53 = v52;
          uint64_t v54 = *(void *)v122;
          do
          {
            for (uint64_t k = 0; k != v53; ++k)
            {
              if (*(void *)v122 != v54) {
                objc_enumerationMutation(v51);
              }
              v56 = *(void **)(*((void *)&v121 + 1) + 8 * k);
              objc_msgSend(v56, "setSectionIdentifier:", v19, v91);
              if (![v56 isLoadingIcon])
              {
                [v56 setIsLoadingIcon:1];
                uint64_t v57 = [v56 category];
                v58 = v19;
                v59 = (void *)v57;
                v119[0] = MEMORY[0x1E4F143A8];
                v119[1] = 3221225472;
                v119[2] = __142__PKPaymentSetupCategoriesSectionController_updateWithRequirements_provisioningController_paymentSetupProductModel_forceProductConfiguration___block_invoke;
                v119[3] = &unk_1E59CCFC8;
                v119[4] = v56;
                v119[5] = self;
                id v120 = v58;
                v60 = [v59 logoCachedImage:v119];
                if (v60)
                {
                  [v56 setIcon:v60];
                }
                else
                {
                  v61 = PKUIImageNamed(@"default_welcome_icon");
                  [v56 setIcon:v61];
                }
                id v19 = v110;
              }
            }
            uint64_t v53 = [v51 countByEnumeratingWithState:&v121 objects:v142 count:16];
          }
          while (v53);
        }

        long long v15 = v99;
        long long v16 = v105;
        if ([v107 count] && objc_msgSend(v19, "length"))
        {
          [(NSMutableArray *)v96 addObject:v19];
          v62 = [v101 localizedTitle];
          if (v62) {
            [(NSMutableDictionary *)v99 setObject:v62 forKey:v19];
          }
          -[NSMutableDictionary setObject:forKey:](v95, "setObject:forKey:", v107, v19, v91);
        }
        uint64_t v17 = v102 + 1;
      }
      while (v102 + 1 != v100);
      uint64_t v100 = [obj countByEnumeratingWithState:&v137 objects:v146 count:16];
      if (!v100)
      {
LABEL_81:

        v63 = v16;
        goto LABEL_83;
      }
    }
  }
  v95 = v12;
  v96 = v13;
  v63 = v11;
  long long v15 = v10;
LABEL_83:
  v64 = objc_msgSend(v93, "associatedCredentials", v91);
  uint64_t v65 = [v64 count];

  uint64_t v66 = *MEMORY[0x1E4F87BE0];
  v67 = v63;
  v68 = [(NSMutableDictionary *)v63 objectForKey:*MEMORY[0x1E4F87BE0]];
  if (v68)
  {
    v69 = v68;
    v70 = (PKPaymentSetupListItem *)[v68 copy];
  }
  else
  {
    v71 = [PKPaymentSetupListItem alloc];
    v72 = PKLocalizedPaymentString(&cfstr_PaymentSetupYo.isa);
    v73 = PKUIImageNamed(@"your_cards_welcome_icon");
    v70 = [(PKPaymentSetupListItem *)v71 initWithTitle:v72 subtitle:0 icon:v73];

    [(PKPaymentSetupListItem *)v70 setIdentifier:v66];
    [(PKPaymentSetupListItem *)v70 setDisplayChevron:1];
    v69 = [(NSMutableArray *)v96 firstObject];
    if (v69) {
      [(NSMutableDictionary *)v15 removeObjectForKey:v69];
    }
    uint64_t v141 = v66;
    v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v141 count:1];
    [(NSMutableDictionary *)v95 setObject:v74 forKey:v66];

    [(NSMutableArray *)v96 insertObject:v66 atIndex:0];
  }

  if ((a3 & 0x20) != 0)
  {
    if (v65)
    {
      v76 = (void *)MEMORY[0x1E4F28EE0];
      v77 = [NSNumber numberWithUnsignedInteger:v65];
      v78 = [v76 localizedStringFromNumber:v77 numberStyle:0];
      [(PKPaymentSetupListItem *)v70 setLabelText:v78];

      BOOL v75 = 1;
    }
    else
    {
      v77 = PKLocalizedPaymentString(&cfstr_None_0.isa);
      [(PKPaymentSetupListItem *)v70 setLabelText:v77];
      BOOL v75 = 0;
    }

    [(PKPaymentSetupListItem *)v70 setDisplayChevron:v65 != 0];
  }
  else
  {
    [(PKPaymentSetupListItem *)v70 setLabelText:0];
    BOOL v75 = 0;
  }
  self->_BOOL hasCardsOnFileSelectable = v75;
  [(PKPaymentSetupListItem *)v70 setLoadingIndicatorVisible:(a3 & 0x20) == 0];
  [(NSMutableDictionary *)v67 setObject:v70 forKey:v66];
  v79 = [(NSMutableArray *)v96 firstObject];
  if (v79)
  {
    v80 = PKLocalizedPaymentString(&cfstr_PaymentSetupAv.isa);
    [(NSMutableDictionary *)v15 setObject:v80 forKey:v79];
  }
  itemIdentifierToItemMapping = self->_itemIdentifierToItemMapping;
  self->_itemIdentifierToItemMapping = v67;
  v82 = v67;

  v83 = *(Class *)((char *)&self->super.super.isa + v92);
  *(Class *)((char *)&self->super.super.isa + v92) = (Class)v95;
  v84 = v95;

  sectionIdentifierToSectionTitleMapping = self->_sectionIdentifierToSectionTitleMapping;
  self->_sectionIdentifierToSectionTitleMapping = v15;
  v86 = v15;

  orderedSectionIdentifiers = self->_orderedSectionIdentifiers;
  self->_orderedSectionIdentifiers = v96;
  v88 = v96;

  self->_currentConfiguredRequirements = a3;
  uint64_t v89 = [(NSMutableArray *)self->_orderedSectionIdentifiers count];

  return v89 != 0;
}

void __142__PKPaymentSetupCategoriesSectionController_updateWithRequirements_provisioningController_paymentSetupProductModel_forceProductConfiguration___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v9 = a3;
  [*(id *)(a1 + 32) setIsLoadingIcon:2];
  if (v9 && a2)
  {
    BOOL v5 = (void *)[*(id *)(a1 + 32) copy];
    [*(id *)(a1 + 32) setIcon:v9];
    uint64_t v6 = *(void **)(*(void *)(a1 + 40) + 72);
    uint64_t v7 = [*(id *)(a1 + 32) identifier];
    [v6 setObject:v5 forKey:v7];

    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 128));
    [WeakRetained reloadRequiredForSectionIdentifier:*(void *)(a1 + 48) animated:0];
  }
}

- (id)_listItemForItemIdentifier:(id)a3 paymentSetupProductModel:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:*MEMORY[0x1E4F87BB0]])
  {
    uint64_t v7 = PKLocalizedPaymentString(&cfstr_PaymentSetupAp.isa);
    uint64_t v8 = [v6 productsForFeatureIdentifier:2];
    if ([v8 count])
    {
      id v9 = [v8 firstObject];
      uint64_t v10 = [v9 displayName];

      uint64_t v7 = (void *)v10;
    }
    id v11 = [PKPaymentSetupCategoriesListItem alloc];
    id v12 = PKUIImageNamed(@"apple_card_welcome_icon");
    int v13 = [(PKPaymentSetupListItem *)v11 initWithTitle:v7 subtitle:0 icon:v12];

    [(PKPaymentSetupCategoriesListItem *)v13 setIsLoadingIcon:2];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F87BA8]])
  {
    uint64_t v7 = PKLocalizedLynxString(&cfstr_ApplyFlowNewAp.isa);
    long long v14 = [PKPaymentSetupCategoriesListItem alloc];
    long long v15 = PKUIImageNamed(@"AppleBalance_welcome_icon");
    int v13 = [(PKPaymentSetupListItem *)v14 initWithTitle:v7 subtitle:0 icon:v15];

    [(PKPaymentSetupCategoriesListItem *)v13 setIsLoadingIcon:2];
LABEL_7:

    goto LABEL_32;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F87BC0]])
  {
    if (PKPaymentSetupMergeProductsPartnersAPIEnabled())
    {
      long long v16 = 0;
    }
    else
    {
      uint64_t v17 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 136315138;
        BOOL v29 = "-[PKPaymentSetupCategoriesSectionController _listItemForItemIdentifier:paymentSetupProductModel:]";
        _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled PKPaymentSetupProductCategoryTypeCreditDebit", (uint8_t *)&v28, 0xCu);
      }

      long long v16 = @"Old Products API for Bank App";
    }
    long long v18 = [PKPaymentSetupCategoriesListItem alloc];
    id v19 = PKLocalizedPaymentString(&cfstr_PaymentSetupCr.isa);
    uint64_t v20 = @"credit_debit_welcome_icon";
LABEL_24:
    v25 = PKUIImageNamed(v20);
    int v13 = [(PKPaymentSetupListItem *)v18 initWithTitle:v19 subtitle:v16 icon:v25];

LABEL_31:
    [(PKPaymentSetupCategoriesListItem *)v13 setIsLoadingIcon:2];
    goto LABEL_32;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F87BD8]])
  {
    if (PKPaymentSetupMergeProductsPartnersAPIEnabled())
    {
      long long v16 = 0;
    }
    else
    {
      v24 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = 136315138;
        BOOL v29 = "-[PKPaymentSetupCategoriesSectionController _listItemForItemIdentifier:paymentSetupProductModel:]";
        _os_log_impl(&dword_19F450000, v24, OS_LOG_TYPE_DEFAULT, "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled PKPaymentSetupProductCategoryTypeTransit", (uint8_t *)&v28, 0xCu);
      }

      long long v16 = @"Old Products API for Transit";
    }
    long long v18 = [PKPaymentSetupCategoriesListItem alloc];
    id v19 = PKLocalizedPaymentString(&cfstr_PaymentSetupRi.isa);
    uint64_t v20 = @"transit_welcome_icon";
    goto LABEL_24;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F87BB8]])
  {
    uint64_t v21 = [PKPaymentSetupCategoriesListItem alloc];
    uint64_t v22 = PKLocalizedPaymentString(&cfstr_PaymentSetupCa.isa);
    uint64_t v23 = @"carkey_welcome_icon";
LABEL_30:
    v26 = PKUIImageNamed(v23);
    int v13 = [(PKPaymentSetupListItem *)v21 initWithTitle:v22 subtitle:0 icon:v26];

    goto LABEL_31;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F87BD0]])
  {
    if (PKIdentityEnabled())
    {
      uint64_t v21 = [PKPaymentSetupCategoriesListItem alloc];
      uint64_t v22 = PKLocalizedIdentityString(&cfstr_PaymentSetupId.isa);
      uint64_t v23 = @"IDENTITY_welcome_icon";
      goto LABEL_30;
    }
    int v13 = 0;
  }
  else
  {
    if ([v5 isEqualToString:*MEMORY[0x1E4F87BC8]])
    {
      uint64_t v21 = [PKPaymentSetupCategoriesListItem alloc];
      uint64_t v22 = PKLocalizedPaymentString(&cfstr_PaymentSetupEm.isa);
      uint64_t v23 = @"emoney_welcome_icon";
      goto LABEL_30;
    }
    int v13 = objc_alloc_init(PKPaymentSetupCategoriesListItem);
  }
LABEL_32:

  return v13;
}

- (PKPaymentSetupCategoriesSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupCategoriesSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_orderedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionIdentifiersToItemIdentifierMapping, 0);
  objc_storeStrong((id *)&self->_itemIdentifierToItemMapping, 0);

  objc_storeStrong((id *)&self->_sectionIdentifierToSectionTitleMapping, 0);
}

@end