@interface PKPaymentSetupProductsSectionController
- (BOOL)_needsManualEntryButton;
- (PKPaymentSetupProductsSectionController)initWithProvisoningController:(id)a3;
- (PKPaymentSetupProductsSectionControllerDelegate)delegate;
- (id)_cleanedSearchTermsFromString:(id)a3;
- (id)_listItemFromProduct:(id)a3 sectionIdentifier:(id)a4;
- (id)_sectionIdentifierForProduct:(id)a3 alwaysWantsHeaders:(BOOL *)a4 wantsAddAdifferentCardButton:(BOOL *)a5;
- (id)decoratePaymentSetListCell:(id)a3 forItem:(id)a4;
- (id)identifiers;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_updateItemWithIdentifier:(id)a3 loadingIndicatorVisibility:(BOOL)a4 animated:(BOOL)a5;
- (void)applySearchString:(id)a3;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)didSelectItem:(id)a3;
- (void)hideLoadingIndicatorsAnimated:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)updateWithPaymentSetupProducts:(id)a3;
@end

@implementation PKPaymentSetupProductsSectionController

- (PKPaymentSetupProductsSectionController)initWithProvisoningController:(id)a3
{
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PKPaymentSetupProductsSectionController;
  v6 = [(PKPaymentSetupListSectionController *)&v32 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_provisioningController, a3);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.passkit.products.search", v8);
    searchQueue = v7->_searchQueue;
    v7->_searchQueue = (OS_dispatch_queue *)v9;

    v7->_iconSize = (CGSize)xmmword_1A0444C10;
    id v11 = objc_alloc_init(MEMORY[0x1E4F28E58]);
    v12 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    [v11 formUnionWithCharacterSet:v12];

    v13 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    [v11 formUnionWithCharacterSet:v13];

    v14 = [MEMORY[0x1E4F28B88] controlCharacterSet];
    [v11 formUnionWithCharacterSet:v14];

    v15 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
    [v11 formUnionWithCharacterSet:v15];

    uint64_t v16 = [v11 copy];
    tokenizerCharacterSet = v7->_tokenizerCharacterSet;
    v7->_tokenizerCharacterSet = (NSCharacterSet *)v16;

    v18 = [v5 webService];
    v19 = [v18 targetDevice];

    uint64_t v20 = [MEMORY[0x1E4F1CA20] currentLocale];
    currentLocale = v7->_currentLocale;
    v7->_currentLocale = (NSLocale *)v20;

    char v22 = objc_opt_respondsToSelector();
    if (v22)
    {
      v23 = [v19 cellularNetworkRegion];
    }
    else
    {
      v23 = 0;
    }
    objc_storeStrong((id *)&v7->_primaryRegion, v23);
    if (v22) {

    }
    uint64_t v24 = PKLocalizedStringForCountryCode();
    primaryCountryName = v7->_primaryCountryName;
    v7->_primaryCountryName = (NSString *)v24;

    if (objc_opt_respondsToSelector()) {
      [v19 deviceRegion];
    }
    else {
    v26 = PKCurrentRegion();
    }
    objc_storeStrong((id *)&v7->_secondaryRegion, v26);

    uint64_t v27 = PKLocalizedStringForCountryCode();
    secondaryCountryName = v7->_secondaryCountryName;
    v7->_secondaryCountryName = (NSString *)v27;

    uint64_t v29 = [v5 cachedLocation];
    cachedLocation = v7->_cachedLocation;
    v7->_cachedLocation = (CLLocation *)v29;
  }
  return v7;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v7 = -[NSDictionary objectForKey:](self->_sectionIdentifierToItemIdentifierMapping, "objectForKey:", v5, 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [(NSMutableDictionary *)self->_itemIdentifierToItemMapping objectForKey:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v6 safelyAddObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v13 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  [v13 appendItems:v6];

  return v13;
}

- (id)identifiers
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self->_orderedSectionIdentifiers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = -[NSDictionary objectForKey:](self->_sectionIdentifierToItemIdentifierMapping, "objectForKey:", v9, (void)v13);
        uint64_t v11 = [v10 count];

        if (v11) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [(PKPaymentSetupListSectionController *)self defaultListLayout];
  uint64_t v7 = v6;
  if (self->_showSectionHeaders) {
    [v6 setHeaderMode:1];
  }
  uint64_t v8 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v7 layoutEnvironment:v5];

  return v8;
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (self->_showSectionHeaders)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4FB1948];
    id v7 = a5;
    id v8 = a3;
    uint64_t v9 = [v6 plainHeaderConfiguration];
    v14[0] = *MEMORY[0x1E4FB06F8];
    uint64_t v10 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2990], (void *)*MEMORY[0x1E4FB27B8], 2, 0);
    v15[0] = v10;
    v14[1] = *MEMORY[0x1E4FB0700];
    uint64_t v11 = [MEMORY[0x1E4FB1618] labelColor];
    v15[1] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

    long long v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v7 attributes:v12];
    [v9 setAttributedText:v13];

    objc_msgSend(v9, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
    [v8 setContentConfiguration:v9];
  }
}

- (id)decoratePaymentSetListCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentSetupProductsSectionController;
  id v8 = [(PKPaymentSetupListSectionController *)&v22 decoratePaymentSetListCell:v6 forItem:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    uint64_t v10 = [v9 identifier];
    if (![v9 isLoadingIcon])
    {
      [v9 setIsLoadingIcon:1];
      uint64_t v11 = [v9 product];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      uint64_t v18 = __78__PKPaymentSetupProductsSectionController_decoratePaymentSetListCell_forItem___block_invoke;
      v19 = &unk_1E59CC3C8;
      uint64_t v20 = self;
      id v21 = v10;
      v12 = objc_msgSend(v11, "thumbnailCachedImageForSize:completion:", &v16, self->_iconSize.width, self->_iconSize.height);

      if (v12) {
        objc_msgSend(v8, "setImage:", v12, v16, v17, v18, v19, v20);
      }
    }
    long long v13 = objc_msgSend(v8, "imageProperties", v16, v17, v18, v19, v20);
    p_iconSize = &self->_iconSize;
    objc_msgSend(v13, "setMaximumSize:", p_iconSize->width, p_iconSize->height);
    objc_msgSend(v13, "setReservedLayoutSize:", p_iconSize->width, p_iconSize->height);
    [v13 setCornerRadius:2.0];
    [v6 setContentConfiguration:v8];
  }

  return v8;
}

void __78__PKPaymentSetupProductsSectionController_decoratePaymentSetListCell_forItem___block_invoke(uint64_t a1, int a2, void *a3)
{
  if (a3)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(*(void *)(a1 + 32) + 80);
    id v7 = a3;
    id v9 = [v6 objectForKey:v5];
    [v9 setIsLoadingIcon:2];
    [v9 setIcon:v7];

    if (a2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
      [WeakRetained reloadItem:v9 animated:0];
    }
  }
}

- (void)didSelectItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __57__PKPaymentSetupProductsSectionController_didSelectItem___block_invoke;
  uint64_t v18 = &unk_1E59CAEA8;
  v19 = self;
  id v6 = v5;
  id v20 = v6;
  id v7 = _Block_copy(&v15);
  self->_didHideLoadingIndicators = 0;
  id v8 = objc_msgSend(v4, "identifier", v15, v16, v17, v18, v19);
  int v9 = [v8 isEqualToString:@"PKAddADifferentCardListItemIdentifier"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v11 = WeakRetained;
  if (v9)
  {
    char v12 = [WeakRetained didSelectManualEntryWithCompletion:v7];

    if ((v12 & 1) == 0) {
      goto LABEL_7;
    }
  }
  else
  {
    long long v13 = [v4 product];
    int v14 = [v11 didSelectProduct:v13 completion:v7];

    if (!v14) {
      goto LABEL_7;
    }
  }
  if (!self->_didHideLoadingIndicators) {
    [(PKPaymentSetupProductsSectionController *)self _updateItemWithIdentifier:v6 loadingIndicatorVisibility:1 animated:1];
  }
LABEL_7:
}

uint64_t __57__PKPaymentSetupProductsSectionController_didSelectItem___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
    [WeakRetained deselectCells];
  }
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 _updateItemWithIdentifier:v5 loadingIndicatorVisibility:0 animated:1];
}

- (void)_updateItemWithIdentifier:(id)a3 loadingIndicatorVisibility:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = [(NSMutableDictionary *)self->_itemIdentifierToItemMapping objectForKey:a3];
  if (v8)
  {
    id v14 = v8;
    BOOL v9 = [v8 loadingIndicatorVisible] == v6;
    id v8 = v14;
    if (!v9)
    {
      uint64_t v10 = (void *)[v14 copy];
      [v10 setLoadingIndicatorVisible:v6];
      itemIdentifierToItemMapping = self->_itemIdentifierToItemMapping;
      char v12 = [v10 identifier];
      [(NSMutableDictionary *)itemIdentifierToItemMapping setObject:v10 forKey:v12];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained reloadItem:v10 animated:v5];

      id v8 = v14;
    }
  }
}

- (void)hideLoadingIndicatorsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_didHideLoadingIndicators = 1;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v5 = [(NSMutableDictionary *)self->_itemIdentifierToItemMapping allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PKPaymentSetupProductsSectionController *)self _updateItemWithIdentifier:*(void *)(*((void *)&v10 + 1) + 8 * v9++) loadingIndicatorVisibility:0 animated:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)applySearchString:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[(NSMutableDictionary *)self->_itemIdentifierToItemMapping copy];
  searchQueue = self->_searchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__PKPaymentSetupProductsSectionController_applySearchString___block_invoke;
  block[3] = &unk_1E59CA8E8;
  id v10 = v5;
  long long v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(searchQueue, block);
}

void __61__PKPaymentSetupProductsSectionController_applySearchString___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) allValues];
  BOOL v3 = (void *)[v2 mutableCopy];

  id v4 = *(void **)(a1 + 40);
  BOOL v5 = +[PKPaymentSetupProductsSectionFactoryContext contextWithPrimaryRegion:v4[19] primaryCountryName:v4[20] secondaryRegion:v4[21] secondaryCountryName:v4[22] location:v4[17] tokenizerCharacterSet:v4[14]];
  if ([*(id *)(a1 + 48) length])
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    id v7 = (id *)&v23;
    id v8 = (id *)&v22;
    +[PKPaymentSetupProductsSectionMainFactory generateSectionsWithSearchFilter:v6 forItems:v3 withContext:v5 outSectionIdentifierToItemIdentifierMapping:&v23 outOrderedSectionIdentifiers:&v22];
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    id v7 = (id *)&v21;
    id v8 = (id *)&v20;
    +[PKPaymentSetupProductsSectionMainFactory generateSectionsWithDefaultSortingForItems:v3 withContext:v5 outSectionIdentifierToItemIdentifierMapping:&v21 outOrderedSectionIdentifiers:&v20];
  }
  id v9 = *v7;
  id v10 = *v8;
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = *(void **)(v11 + 88);
  *(void *)(v11 + 88) = v9;
  id v13 = v9;

  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void **)(v14 + 96);
  *(void *)(v14 + 96) = v10;
  id v16 = v10;

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __61__PKPaymentSetupProductsSectionController_applySearchString___block_invoke_2;
  v18[3] = &unk_1E59CA870;
  uint64_t v17 = *(void **)(a1 + 48);
  v18[4] = *(void *)(a1 + 40);
  id v19 = v17;
  dispatch_async(MEMORY[0x1E4F14428], v18);
}

void __61__PKPaymentSetupProductsSectionController_applySearchString___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 88) count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
    [WeakRetained hideNoResultsView];

    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
    [v4 reloadSectionsRequired];
  }
  else
  {
    PKLocalizedPaymentString(&cfstr_PaymentSetupNo_0.isa, &stru_1EF1B4C70.isa, *(void *)(a1 + 40));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 192));
    objc_msgSend(v3, "displayNoResultsViewWithSubtitle:needsManualEntryButton:", v4, objc_msgSend(*(id *)(a1 + 32), "_needsManualEntryButton"));
  }
}

- (BOOL)_needsManualEntryButton
{
  v2 = [(NSMutableDictionary *)self->_itemIdentifierToItemMapping allValues];
  id v3 = [v2 firstObject];
  id v4 = [v3 product];
  BOOL v5 = [v4 configuration];
  BOOL v6 = [v5 type] == 5;

  return v6;
}

- (id)_sectionIdentifierForProduct:(id)a3 alwaysWantsHeaders:(BOOL *)a4 wantsAddAdifferentCardButton:(BOOL *)a5
{
  id v8 = a3;
  id v9 = [v8 configuration];
  unint64_t v10 = [v9 type];

  if (v10 <= 0xB)
  {
    if (((1 << v10) & 0x39F) != 0)
    {
      *a4 = 1;
    }
    else if (((1 << v10) & 0x60) != 0)
    {
      *a4 = 1;
      *a5 = 1;
      PKLocalizedPaymentString(&cfstr_PaymentSetupCr_0.isa);
      self = (PKPaymentSetupProductsSectionController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    uint64_t v11 = [v8 primaryRegion];
    primaryRegion = v11;
    if (!v11)
    {
      primaryRegion = self->_primaryRegion;
      if (!primaryRegion) {
        primaryRegion = self->_secondaryRegion;
      }
    }
    id v13 = primaryRegion;

    PKLocalizedStringForCountryCode();
    self = (PKPaymentSetupProductsSectionController *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

  return self;
}

- (void)updateWithPaymentSetupProducts:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    LOBYTE(v9) = 0;
    uint64_t v31 = *(void *)v39;
    objc_super v32 = 0;
    id obj = v5;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        __int16 v37 = 0;
        id v12 = self;
        id v13 = -[PKPaymentSetupProductsSectionController _sectionIdentifierForProduct:alwaysWantsHeaders:wantsAddAdifferentCardButton:](self, "_sectionIdentifierForProduct:alwaysWantsHeaders:wantsAddAdifferentCardButton:", v11, (char *)&v37 + 1, &v37, obj);
        uint64_t v14 = v13;
        BOOL v15 = HIBYTE(v37) != 0;
        if (v9)
        {
          BOOL v9 = 1;
        }
        else
        {
          id v16 = v13;

          BOOL v9 = (_BYTE)v37 != 0;
          objc_super v32 = v16;
        }
        uint64_t v17 = [v11 productIdentifier];
        uint64_t v18 = [v34 objectForKey:v17];
        if (!v18)
        {
          uint64_t v18 = [(PKPaymentSetupProductsSectionController *)v12 _listItemFromProduct:v11 sectionIdentifier:v14];
          id v19 = [v18 identifier];
          [v34 setObject:v18 forKey:v19];
        }
        v8 |= v15;
        [v33 addObject:v18];

        self = v12;
      }
      id v5 = obj;
      uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v7);

    if (v9)
    {
      addADifferentCardListItem = v12->_addADifferentCardListItem;
      if (!addADifferentCardListItem)
      {
        uint64_t v22 = PKLocalizedPaymentString(&cfstr_AddADifferentC.isa);
        uint64_t v23 = [(PKPaymentSetupListItem *)[PKPaymentSetupProductsSectionListItem alloc] initWithTitle:v22 subtitle:0 icon:0];
        uint64_t v24 = v12->_addADifferentCardListItem;
        v12->_addADifferentCardListItem = v23;

        [(PKPaymentSetupListItem *)v12->_addADifferentCardListItem setDisplayChevron:1];
        [(PKPaymentSetupListItem *)v12->_addADifferentCardListItem setIdentifier:@"PKAddADifferentCardListItemIdentifier"];

        addADifferentCardListItem = v12->_addADifferentCardListItem;
      }
      uint64_t v21 = v32;
      [(PKPaymentSetupProductsSectionListItem *)addADifferentCardListItem setSectionIdentifier:v32];
      [v34 setObject:v12->_addADifferentCardListItem forKey:@"PKAddADifferentCardListItemIdentifier"];
      [v33 addObject:v12->_addADifferentCardListItem];
    }
    else
    {
      uint64_t v21 = v32;
    }
  }
  else
  {

    uint64_t v21 = 0;
    char v8 = 0;
  }
  objc_storeStrong((id *)&self->_itemIdentifierToItemMapping, v34);
  v25 = +[PKPaymentSetupProductsSectionFactoryContext contextWithPrimaryRegion:self->_primaryRegion primaryCountryName:self->_primaryCountryName secondaryRegion:self->_secondaryRegion secondaryCountryName:self->_secondaryCountryName location:self->_cachedLocation];
  id v35 = 0;
  id v36 = 0;
  +[PKPaymentSetupProductsSectionMainFactory generateSectionsWithDefaultSortingForItems:v33 withContext:v25 outSectionIdentifierToItemIdentifierMapping:&v36 outOrderedSectionIdentifiers:&v35];
  id v26 = v36;
  id v27 = v36;
  id v28 = v35;
  id v29 = v35;
  objc_storeStrong((id *)&self->_sectionIdentifierToItemIdentifierMapping, v26);
  objc_storeStrong((id *)&self->_orderedSectionIdentifiers, v28);
  if ((v8 & 1) != 0 || [(NSArray *)self->_orderedSectionIdentifiers count] >= 2) {
    self->_showSectionHeaders = 1;
  }
}

- (id)_cleanedSearchTermsFromString:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 localizedLowercaseString];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", self->_tokenizerCharacterSet, 0);
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
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 length]) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  id v12 = (void *)[v5 copy];

  return v12;
}

- (id)_listItemFromProduct:(id)a3 sectionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 displayName];
  id v9 = [v6 localizedDescription];
  uint64_t v23 = [v6 badge];
  unint64_t v10 = [v6 displayStatus];
  id v11 = v9;
  if (![v9 length])
  {
    id v11 = v10;
  }
  id v12 = objc_msgSend(v6, "productIdentifier", v10);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v14 = [v6 searchTerms];
  if ([v14 count])
  {
    [v13 addObjectsFromArray:v14];
  }
  else
  {
    long long v15 = [(PKPaymentSetupProductsSectionController *)self _cleanedSearchTermsFromString:v8];
    [v13 unionOrderedSet:v15];

    long long v16 = [(PKPaymentSetupProductsSectionController *)self _cleanedSearchTermsFromString:v9];
    [v13 unionOrderedSet:v16];
  }
  long long v17 = [v6 configuration];
  unint64_t v18 = [v17 type];

  uint64_t v19 = 0;
  if (v18 <= 0xB && ((1 << v18) & 0xF9B) != 0)
  {
    uint64_t v19 = PKUIImageNamed(@"PlaceholderCardArt_Small");
  }
  uint64_t v20 = [(PKPaymentSetupListItem *)[PKPaymentSetupProductsSectionListItem alloc] initWithTitle:v8 subtitle:v11 icon:v19];
  [(PKPaymentSetupProductsSectionListItem *)v20 setSearchTerms:v13];
  [(PKPaymentSetupListItem *)v20 setIdentifier:v12];
  [(PKPaymentSetupProductsSectionListItem *)v20 setProduct:v6];
  [(PKPaymentSetupProductsSectionListItem *)v20 setSectionIdentifier:v7];

  [(PKPaymentSetupListItem *)v20 setDisplayChevron:1];
  [(PKPaymentSetupListItem *)v20 setBadgeText:v23];

  return v20;
}

- (PKPaymentSetupProductsSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupProductsSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondaryCountryName, 0);
  objc_storeStrong((id *)&self->_secondaryRegion, 0);
  objc_storeStrong((id *)&self->_primaryCountryName, 0);
  objc_storeStrong((id *)&self->_primaryRegion, 0);
  objc_storeStrong((id *)&self->_currentLocale, 0);
  objc_storeStrong((id *)&self->_cachedLocation, 0);
  objc_storeStrong((id *)&self->_tokenizerCharacterSet, 0);
  objc_storeStrong((id *)&self->_searchQueue, 0);
  objc_storeStrong((id *)&self->_orderedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierToItemIdentifierMapping, 0);
  objc_storeStrong((id *)&self->_itemIdentifierToItemMapping, 0);
  objc_storeStrong((id *)&self->_addADifferentCardListItem, 0);

  objc_storeStrong((id *)&self->_provisioningController, 0);
}

@end