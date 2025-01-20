@interface PKEnhancedMerchantsListSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4;
- (NSArray)identifiers;
- (PKEnhancedMerchantsListSectionController)initWithSectionIdentifiers:(id)a3 fetcher:(id)a4 delegate:(id)a5;
- (UICollectionViewCellRegistration)cellRegistration;
- (id)_disclosuresCellRegistration;
- (id)_genericDisplayableErrorForError:(id)a3;
- (id)_merchantListCellRegistration;
- (id)cellRegistrationForItem:(id)a3;
- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4;
- (id)merchantForPrivateIdentifier:(id)a3;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_openMapsForMerchantSearch:(id)a3;
- (void)_performNearbyLocationsSearch:(id)a3 deviceLocation:(id)a4;
- (void)_presentError:(id)a3;
- (void)_reportEventIfNecessaryForButtonTapWithTag:(id)a3 merchant:(id)a4;
- (void)_requestLocationUpdateIfPossible;
- (void)_stopUpdatingLocation;
- (void)_updateCellBasedOnCurrentSearch:(id)a3;
- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5;
- (void)dealloc;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)performAction:(int64_t)a3 forEnhancedMerchant:(id)a4 sender:(id)a5;
- (void)preflightWithCompletion:(id)a3;
- (void)setCellRegistration:(id)a3;
- (void)setIdentifiers:(id)a3;
@end

@implementation PKEnhancedMerchantsListSectionController

- (PKEnhancedMerchantsListSectionController)initWithSectionIdentifiers:(id)a3 fetcher:(id)a4 delegate:(id)a5
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)PKEnhancedMerchantsListSectionController;
  v12 = [(PKEnhancedMerchantsListSectionController *)&v26 init];
  v13 = v12;
  if (v12)
  {
    p_identifiers = (id *)&v12->_identifiers;
    objc_storeStrong((id *)&v12->_identifiers, a3);
    if (!*p_identifiers || ![*p_identifiers count])
    {
      v27[0] = @"PKEnhancedMerchantsListSectionMerchantList";
      v27[1] = @"PKEnhancedMerchantsListSectionMerchantDisclosures";
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
      id v16 = *p_identifiers;
      id *p_identifiers = (id)v15;
    }
    objc_storeStrong((id *)&v13->_fetcher, a4);
    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_initWeak(&location, v13);
    fetcher = v13->_fetcher;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __88__PKEnhancedMerchantsListSectionController_initWithSectionIdentifiers_fetcher_delegate___block_invoke;
    v23[3] = &unk_1E59CA7F8;
    objc_copyWeak(&v24, &location);
    uint64_t v18 = [(PKAccountEnhancedMerchantsFetcher *)fetcher addUpdateHandler:v23];
    merchantsUpdateToken = v13->_merchantsUpdateToken;
    v13->_merchantsUpdateToken = (NSUUID *)v18;

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __88__PKEnhancedMerchantsListSectionController_initWithSectionIdentifiers_fetcher_delegate___block_invoke_2;
    v21[3] = &unk_1E59CA7D0;
    v22 = v13;
    dispatch_async(MEMORY[0x1E4F14428], v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __88__PKEnhancedMerchantsListSectionController_initWithSectionIdentifiers_fetcher_delegate___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 2);
    if (objc_opt_respondsToSelector()) {
      [v2 reloadDataAnimated:1];
    }

    WeakRetained = v3;
  }
}

void __88__PKEnhancedMerchantsListSectionController_initWithSectionIdentifiers_fetcher_delegate___block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F1E600]);
  v3 = PKPassKitCoreBundle();
  v4 = [v3 bundlePath];
  uint64_t v5 = [v2 initWithEffectiveBundlePath:v4 delegate:*(void *)(a1 + 32) onQueue:MEMORY[0x1E4F14428]];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  [*(id *)(*(void *)(a1 + 32) + 32) setDesiredAccuracy:*MEMORY[0x1E4F1E6F8]];
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:*(void *)(a1 + 32) selector:sel__applicationDidEnterBackground_ name:*MEMORY[0x1E4F87F38] object:0];
}

- (void)dealloc
{
  if (self->_merchantsUpdateToken) {
    -[PKAccountEnhancedMerchantsFetcher removeUpdateHandler:](self->_fetcher, "removeUpdateHandler:");
  }
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  if ([(_PKPendingEnhancedMerchantNearbyLocationSearch *)self->_pendingMerchantLocationSearch isInProgress])
  {
    [(_PKPendingEnhancedMerchantNearbyLocationSearch *)self->_pendingMerchantLocationSearch cancel];
  }
  [(PKEnhancedMerchantsListSectionController *)self _stopUpdatingLocation];
  v4.receiver = self;
  v4.super_class = (Class)PKEnhancedMerchantsListSectionController;
  [(PKEnhancedMerchantsListSectionController *)&v4 dealloc];
}

- (id)merchantForPrivateIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v5 = [(PKAccountEnhancedMerchantsFetcher *)self->_fetcher enhancedMerchants];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__PKEnhancedMerchantsListSectionController_merchantForPrivateIdentifier___block_invoke;
    v8[3] = &unk_1E59D9120;
    id v9 = v4;
    uint64_t v6 = objc_msgSend(v5, "pk_firstObjectPassingTest:", v8);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __73__PKEnhancedMerchantsListSectionController_merchantForPrivateIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 lowercaseString];
  uint64_t v5 = [v3 privateIdentifier];

  uint64_t v6 = [v5 lowercaseString];
  id v7 = v4;
  id v8 = v6;
  id v9 = v8;
  if (v7 == v8)
  {
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
    if (v7 && v8) {
      uint64_t v10 = [v7 isEqualToString:v8];
    }
  }

  return v10;
}

- (void)preflightWithCompletion:(id)a3
{
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  id v7 = [(PKAccountEnhancedMerchantsFetcher *)self->_fetcher enhancedMerchantsWithOrderingContext:2];
  if (!v7)
  {
    id v7 = [(PKAccountEnhancedMerchantsFetcher *)self->_fetcher enhancedMerchants];
  }
  id v8 = (__CFString *)v5;
  id v9 = @"PKEnhancedMerchantsListSectionMerchantList";
  if (v9 == v8)
  {

    goto LABEL_9;
  }
  uint64_t v10 = v9;
  if (!v8 || !v9)
  {

    goto LABEL_11;
  }
  int v11 = [(__CFString *)v8 isEqualToString:v9];

  if (v11)
  {
LABEL_9:
    [v6 appendItems:v7];
    goto LABEL_22;
  }
LABEL_11:
  v12 = v8;
  v13 = @"PKEnhancedMerchantsListSectionMerchantDisclosures";
  if (v13 == v12)
  {

    goto LABEL_17;
  }
  v14 = v13;
  if (v8 && v13)
  {
    int v15 = [(__CFString *)v12 isEqualToString:v13];

    if (!v15) {
      goto LABEL_19;
    }
LABEL_17:
    id v16 = objc_msgSend(v7, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_157);
    [v6 appendItems:v16];

    goto LABEL_22;
  }

LABEL_19:
  v17 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    v20 = v12;
    _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "Unrecognized section identifier for enhanced merchants list section controller: %@", (uint8_t *)&v19, 0xCu);
  }

LABEL_22:

  return v6;
}

PKAccountEnhancedMerchantDisclosurePresentationInfo *__94__PKEnhancedMerchantsListSectionController_snapshotWithPreviousSnapshot_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PKAccountEnhancedMerchantDisclosurePresentationInfo alloc] initWithAccountEnhancedMerchant:v2];

  return v3;
}

- (id)cellRegistrationForItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(PKEnhancedMerchantsListSectionController *)self _merchantListCellRegistration];
LABEL_5:
    id v6 = (void *)v5;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(PKEnhancedMerchantsListSectionController *)self _disclosuresCellRegistration];
    goto LABEL_5;
  }
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Unrecognized class for enhanced merchants list section controller", v9, 2u);
  }

  id v6 = 0;
LABEL_9:

  return v6;
}

- (id)_merchantListCellRegistration
{
  objc_initWeak(&location, self);
  id v2 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v3 = objc_opt_class();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__PKEnhancedMerchantsListSectionController__merchantListCellRegistration__block_invoke;
  v6[3] = &unk_1E59D9190;
  objc_copyWeak(&v7, &location);
  id v4 = [v2 registrationWithCellClass:v3 configurationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

void __73__PKEnhancedMerchantsListSectionController__merchantListCellRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v6 setDelegate:WeakRetained];
  [v6 updateWithAccountEnhancedMerchant:v7];
  id v9 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  objc_msgSend(v9, "setDirectionalLayoutMargins:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  uint64_t v10 = [v7 name];
  [v9 setText:v10];

  int v11 = (NSString *)*MEMORY[0x1E4FB27F0];
  v12 = PKFontForDesign((void *)*MEMORY[0x1E4FB0928], (void *)*MEMORY[0x1E4FB2990], (void *)*MEMORY[0x1E4FB27F0], 2, 0, *MEMORY[0x1E4FB09B8]);
  v13 = [v9 textProperties];
  [v13 setFont:v12];

  v14 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], v11);
  int v15 = [v9 secondaryTextProperties];
  [v15 setFont:v14];

  id v16 = [v9 secondaryTextProperties];
  v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v16 setColor:v17];

  uint64_t v18 = [v6 listContentView];
  [v18 setConfiguration:v9];

  int v19 = [v6 websiteButton];
  objc_msgSend(v19, "setHidden:", objc_msgSend(v7, "hasWebsite") ^ 1);

  v20 = [v6 appStoreButton];
  objc_msgSend(v20, "setHidden:", objc_msgSend(v7, "hasLinkedApplication") ^ 1);

  uint64_t v21 = [v6 mapsButton];
  objc_msgSend(v21, "setHidden:", objc_msgSend(v7, "hasMapsLocations") ^ 1);

  v22 = [v6 imageView];
  [v22 setImage:0];
  v23 = [MEMORY[0x1E4FB1618] systemGray4Color];
  [v22 setBackgroundColor:v23];

  id v24 = [v7 iconImage];
  PKScreenScale();
  v25 = objc_msgSend(v24, "imageForScaleFactorValue:");

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __73__PKEnhancedMerchantsListSectionController__merchantListCellRegistration__block_invoke_2;
  v31[3] = &unk_1E59D9168;
  id v32 = v7;
  id v33 = v6;
  id v34 = v22;
  id v26 = v22;
  id v27 = v6;
  id v28 = v7;
  [v25 fetchImageWithCompletion:v31];
  v29 = [v27 detailedDescriptionLabel];
  v30 = [v28 detailedDescription];
  [v29 setText:v30];

  [WeakRetained _updateCellBasedOnCurrentSearch:v27];
}

void __73__PKEnhancedMerchantsListSectionController__merchantListCellRegistration__block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __73__PKEnhancedMerchantsListSectionController__merchantListCellRegistration__block_invoke_3;
  v5[3] = &unk_1E59CB8B0;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = v3;
  id v9 = a1[6];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __73__PKEnhancedMerchantsListSectionController__merchantListCellRegistration__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) privateIdentifier];
  id v3 = [*(id *)(a1 + 40) enhancedMerchant];
  id v4 = [v3 privateIdentifier];
  id v12 = v2;
  id v5 = v4;
  if (v12 == v5)
  {

LABEL_10:
    if (*(void *)(a1 + 48))
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithPKImage:");
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v12 = (id)v9;
    [*(id *)(a1 + 56) setImage:v9];
    uint64_t v10 = *(void **)(a1 + 56);
    int v11 = [MEMORY[0x1E4FB1618] whiteColor];
    [v10 setBackgroundColor:v11];

    [*(id *)(a1 + 40) setNeedsLayout];
    goto LABEL_14;
  }
  id v6 = v5;
  if (v12) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    char v8 = [v12 isEqualToString:v5];

    if ((v8 & 1) == 0) {
      return;
    }
    goto LABEL_10;
  }

LABEL_14:
}

- (id)_disclosuresCellRegistration
{
  id v2 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 registrationWithCellClass:v3 configurationHandler:&__block_literal_global_169_1];
}

void __72__PKEnhancedMerchantsListSectionController__disclosuresCellRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (void *)MEMORY[0x1E4FB1948];
  id v6 = a4;
  id v7 = a2;
  id v26 = [v5 cellConfiguration];
  char v8 = (NSString *)*MEMORY[0x1E4FB28F0];
  uint64_t v9 = (NSString *)*MEMORY[0x1E4FB27F0];
  uint64_t v10 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], (NSString *)*MEMORY[0x1E4FB27F0], *MEMORY[0x1E4FB09B8]);
  int v11 = PKFontForDefaultDesign(v8, v9);
  id v12 = NSString;
  v13 = [v6 name];
  v14 = [v12 stringWithFormat:@"%@: ", v13];

  int v15 = objc_msgSend(MEMORY[0x1E4F28B18], "pkui_attriutedStringWithString:font:paragraphStyle:", v14, v10, 0);
  id v16 = (void *)MEMORY[0x1E4F28B18];
  v17 = [v6 disclosures];

  uint64_t v18 = objc_msgSend(v16, "pkui_attriutedStringWithString:font:paragraphStyle:", v17, v11, 0);

  id v19 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  [v19 appendAttributedString:v15];
  [v19 appendAttributedString:v18];
  v20 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  uint64_t v21 = (void *)[v20 mutableCopy];

  [v21 setLineBreakStrategy:1];
  uint64_t v22 = *MEMORY[0x1E4FB0738];
  v23 = (void *)[v21 copy];
  objc_msgSend(v19, "addAttribute:value:range:", v22, v23, 0, objc_msgSend(v19, "length"));

  [v26 setAttributedText:v19];
  id v24 = [v26 textProperties];
  v25 = [MEMORY[0x1E4FB1618] systemGray2Color];
  [v24 setColor:v25];

  [v7 setContentConfiguration:v26];
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4FB1558];
  id v7 = a3;
  char v8 = (void *)[[v6 alloc] initWithAppearance:0];
  [v8 setHeaderMode:1];
  uint64_t v9 = (__CFString *)v5;
  uint64_t v10 = @"PKEnhancedMerchantsListSectionMerchantList";
  if (v10 == v9)
  {

    goto LABEL_7;
  }
  int v11 = v10;
  if (!v9 || !v10)
  {

    goto LABEL_9;
  }
  int v12 = [(__CFString *)v9 isEqualToString:v10];

  if (v12)
  {
LABEL_7:
    [v8 setShowsSeparators:1];
    v13 = [v8 separatorConfiguration];
    v14 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v13 setColor:v14];

    [v8 setSeparatorConfiguration:v13];
    goto LABEL_20;
  }
LABEL_9:
  int v15 = v9;
  id v16 = @"PKEnhancedMerchantsListSectionMerchantDisclosures";
  if (v16 == v15)
  {

    goto LABEL_15;
  }
  v17 = v16;
  if (v9 && v16)
  {
    int v18 = [(__CFString *)v15 isEqualToString:v16];

    if (!v18) {
      goto LABEL_17;
    }
LABEL_15:
    [v8 setShowsSeparators:0];
    goto LABEL_20;
  }

LABEL_17:
  id v19 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    id v24 = v15;
    _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "Unrecognized section identifier for enhanced merchants list section controller: %@", (uint8_t *)&v23, 0xCu);
  }

LABEL_20:
  v20 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:v8 layoutEnvironment:v7];

  uint64_t v21 = [v20 boundarySupplementaryItems];
  [v21 enumerateObjectsUsingBlock:&__block_literal_global_180];

  return v20;
}

uint64_t __90__PKEnhancedMerchantsListSectionController_layoutWithLayoutEnvironment_sectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPinToVisibleBounds:0];
}

- (Class)supplementaryRegistrationClassForKind:(id)a3 sectionIdentifier:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)configureSupplementaryRegistration:(id)a3 elementKind:(id)a4 sectionIdentifier:(id)a5
{
  id v31 = a3;
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = (void *)*MEMORY[0x1E4FB2770];
    id v10 = v7;
    id v11 = v9;
    if (v11 == v10)
    {
    }
    else
    {
      int v12 = v11;
      if (!v10 || !v11) {
        goto LABEL_25;
      }
      int v13 = [v10 isEqualToString:v11];

      if (!v13) {
        goto LABEL_26;
      }
    }
    id v10 = v31;
    int v12 = [MEMORY[0x1E4FB1948] plainHeaderConfiguration];
    v14 = (__CFString *)v8;
    int v15 = @"PKEnhancedMerchantsListSectionMerchantList";
    if (v15 == v14)
    {
    }
    else
    {
      id v16 = v15;
      if (!v14 || !v15)
      {

LABEL_16:
        id v19 = v14;
        id v27 = @"PKEnhancedMerchantsListSectionMerchantDisclosures";
        if (v27 == v19)
        {
        }
        else
        {
          id v24 = v27;
          if (!v14 || !v27) {
            goto LABEL_23;
          }
          int v28 = [(__CFString *)v19 isEqualToString:v27];

          if (!v28) {
            goto LABEL_24;
          }
        }
        v29 = PKLocalizedFeatureString();
        [v12 setText:v29];

        id v19 = [v12 textProperties];
        v30 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28F0], (NSString *)*MEMORY[0x1E4FB27F0]);
        [(__CFString *)v19 setFont:v30];

        id v24 = [MEMORY[0x1E4FB1618] systemGray2Color];
        [(__CFString *)v19 setColor:v24];
LABEL_23:

LABEL_24:
        [v10 setContentConfiguration:v12];
LABEL_25:

        goto LABEL_26;
      }
      int v17 = [(__CFString *)v14 isEqualToString:v15];

      if (!v17) {
        goto LABEL_16;
      }
    }
    int v18 = PKLocalizedFeatureString();
    [v12 setText:v18];

    id v19 = [v12 textProperties];
    v20 = (NSString *)*MEMORY[0x1E4FB27F0];
    uint64_t v21 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2928], (void *)*MEMORY[0x1E4FB27F0], 2, 0);
    [(__CFString *)v19 setFont:v21];

    [(__CFString *)v19 setNumberOfLines:0];
    uint64_t v22 = [MEMORY[0x1E4FB1618] labelColor];
    [(__CFString *)v19 setColor:v22];

    int v23 = PKLocalizedFeatureString();
    [v12 setSecondaryText:v23];

    id v24 = [v12 secondaryTextProperties];
    uint64_t v25 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], v20);
    [v24 setFont:v25];

    id v26 = [MEMORY[0x1E4FB1618] labelColor];
    [v24 setColor:v26];

    [v24 setNumberOfLines:0];
    [v12 setTextToSecondaryTextVerticalPadding:15.0];
    objc_msgSend(v12, "setDirectionalLayoutMargins:", 0.0, 0.0, 32.0, 0.0);
    goto LABEL_23;
  }
LABEL_26:
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (void)performAction:(int64_t)a3 forEnhancedMerchant:(id)a4 sender:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  switch(a3)
  {
    case 0:
      id v11 = [v9 linkedApplication];
      if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        int v12 = [v11 isInstalled];
        int v13 = (void *)MEMORY[0x1E4F866E0];
        if (!v12) {
          int v13 = (void *)MEMORY[0x1E4F86070];
        }
        [(PKEnhancedMerchantsListSectionController *)self _reportEventIfNecessaryForButtonTapWithTag:*v13 merchant:v8];
        [WeakRetained openLinkedApplication:v11];
      }
      goto LABEL_15;
    case 2:
      [(PKEnhancedMerchantsListSectionController *)self _reportEventIfNecessaryForButtonTapWithTag:*MEMORY[0x1E4F865D8] merchant:v8];
      if ([(_PKPendingEnhancedMerchantNearbyLocationSearch *)self->_pendingMerchantLocationSearch isInProgress])
      {
        [(_PKPendingEnhancedMerchantNearbyLocationSearch *)self->_pendingMerchantLocationSearch cancel];
      }
      v14 = [[_PKPendingEnhancedMerchantNearbyLocationSearch alloc] initWithMerchant:v8];
      pendingMerchantLocationSearch = self->_pendingMerchantLocationSearch;
      self->_pendingMerchantLocationSearch = v14;

      id v11 = [v9 mapsButton];
      objc_msgSend(v11, "pkui_updateConfigurationShowingActivityIndicator:", 1);
      [v11 setEnabled:0];
      [(_PKPendingEnhancedMerchantNearbyLocationSearch *)self->_pendingMerchantLocationSearch didStart];
      [(PKEnhancedMerchantsListSectionController *)self _openMapsForMerchantSearch:self->_pendingMerchantLocationSearch];
      objc_initWeak(&location, self);
      id v16 = self->_pendingMerchantLocationSearch;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __85__PKEnhancedMerchantsListSectionController_performAction_forEnhancedMerchant_sender___block_invoke;
      v17[3] = &unk_1E59CE0E8;
      objc_copyWeak(&v19, &location);
      id v18 = v9;
      [(_PKPendingEnhancedMerchantNearbyLocationSearch *)v16 addCompletionHandler:v17];

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      goto LABEL_15;
    case 1:
      id v11 = [v8 website];
      if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [(PKEnhancedMerchantsListSectionController *)self _reportEventIfNecessaryForButtonTapWithTag:*MEMORY[0x1E4F86FE0] merchant:v8];
        [WeakRetained openURL:v11 sensitive:0 preferInApp:0];
      }
LABEL_15:

      break;
  }
}

void __85__PKEnhancedMerchantsListSectionController_performAction_forEnhancedMerchant_sender___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateCellBasedOnCurrentSearch:*(void *)(a1 + 32)];
}

- (void)_reportEventIfNecessaryForButtonTapWithTag:(id)a3 merchant:(id)a4
{
  v16[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F86120];
  v15[0] = *MEMORY[0x1E4F86308];
  v15[1] = v6;
  v16[0] = *MEMORY[0x1E4F86380];
  v16[1] = a3;
  id v7 = (void *)MEMORY[0x1E4F1C9E8];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v7 dictionaryWithObjects:v16 forKeys:v15 count:2];

  id v11 = (void *)[v10 mutableCopy];
  int v12 = [v8 privateIdentifier];

  if (v12) {
    [v11 setObject:v12 forKey:*MEMORY[0x1E4F86610]];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = (void *)[v11 copy];
  [WeakRetained reportEventIfNecessary:v14];
}

- (void)_updateCellBasedOnCurrentSearch:(id)a3
{
  id v4 = a3;
  id v5 = self->_pendingMerchantLocationSearch;
  uint64_t v6 = [v4 mapsButton];
  id v7 = [v6 configuration];
  int v8 = [v7 showsActivityIndicator];

  id v9 = [(_PKPendingEnhancedMerchantNearbyLocationSearch *)v5 merchant];
  id v10 = [v9 privateIdentifier];
  id v11 = [v4 enhancedMerchant];
  int v12 = [v11 privateIdentifier];
  id v13 = v10;
  id v14 = v12;
  if (v13 == v14)
  {
  }
  else
  {
    int v15 = v14;
    if (!v13 || !v14)
    {

LABEL_9:
      uint64_t v17 = 0;
      goto LABEL_10;
    }
    char v16 = [v13 isEqualToString:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_9;
    }
  }
  uint64_t v17 = [(_PKPendingEnhancedMerchantNearbyLocationSearch *)v5 isInProgress];
LABEL_10:
  [v6 setEnabled:v17 ^ 1];
  objc_msgSend(v6, "pkui_updateConfigurationShowingActivityIndicator:", v17);
  if (((v17 ^ 1) & 1) == 0 && v8 != 1)
  {
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__PKEnhancedMerchantsListSectionController__updateCellBasedOnCurrentSearch___block_invoke;
    v18[3] = &unk_1E59CE0E8;
    objc_copyWeak(&v20, &location);
    id v19 = v4;
    [(_PKPendingEnhancedMerchantNearbyLocationSearch *)v5 addCompletionHandler:v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __76__PKEnhancedMerchantsListSectionController__updateCellBasedOnCurrentSearch___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateCellBasedOnCurrentSearch:*(void *)(a1 + 32)];
}

- (void)_requestLocationUpdateIfPossible
{
  v19[2] = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F1E600] locationServicesEnabled];
  CLAuthorizationStatus v4 = [(CLLocationManager *)self->_locationManager authorizationStatus];
  if (v3) {
    BOOL v5 = (v4 - 3) > 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v16 = 0;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Location services unavailable or unauthorized", v16, 2u);
      }

      id v7 = PKLocalizedFeatureString();
      int v8 = PKLocalizedFeatureString();
      uint64_t v9 = *MEMORY[0x1E4F28590];
      uint64_t v17 = v8;
      v18[0] = v9;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      v19[0] = v10;
      v18[1] = *MEMORY[0x1E4F87210];
      id v11 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Privacy&path=LOCATION"];
      v19[1] = v11;
      int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

      id v13 = PKDisplayableErrorCustom();
      if ([(_PKPendingEnhancedMerchantNearbyLocationSearch *)self->_pendingMerchantLocationSearch isInProgress])
      {
        [(_PKPendingEnhancedMerchantNearbyLocationSearch *)self->_pendingMerchantLocationSearch didFailWithError:v13];
        [(PKEnhancedMerchantsListSectionController *)self _presentError:v13];
      }
    }
    else
    {
      [(CLLocationManager *)self->_locationManager requestWhenInUseAuthorization];
      if ([(_PKPendingEnhancedMerchantNearbyLocationSearch *)self->_pendingMerchantLocationSearch isInProgress])
      {
        pendingMerchantLocationSearch = self->_pendingMerchantLocationSearch;
        [(_PKPendingEnhancedMerchantNearbyLocationSearch *)pendingMerchantLocationSearch cancel];
      }
    }
  }
  else
  {
    locationManager = self->_locationManager;
    [(CLLocationManager *)locationManager requestLocation];
  }
}

- (void)_stopUpdatingLocation
{
}

- (void)_openMapsForMerchantSearch:(id)a3
{
  id v5 = a3;
  if ([v5 isInProgress])
  {
    CLAuthorizationStatus v4 = self->_lastValidLocation;
    if (LocationIsValid(v4)) {
      [(PKEnhancedMerchantsListSectionController *)self _performNearbyLocationsSearch:v5 deviceLocation:v4];
    }
    else {
      [(PKEnhancedMerchantsListSectionController *)self _requestLocationUpdateIfPossible];
    }
  }
}

- (void)_performNearbyLocationsSearch:(id)a3 deviceLocation:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v31 = a4;
  v29 = v6;
  id v32 = [v6 merchant];
  id v7 = [v32 mapsSearchText];
  int v8 = v7;
  if (v7)
  {
    id v30 = v7;
  }
  else
  {
    id v30 = [v32 name];
  }

  uint64_t v9 = [v32 mapsSearchStrings];
  v35 = [MEMORY[0x1E4F30F28] sharedService];
  id v34 = [v35 defaultTraits];
  id v26 = (void *)[objc_alloc(MEMORY[0x1E4F64660]) initWithCLLocation:v31];
  objc_msgSend(v34, "setDeviceLocation:");
  int v28 = [v32 brandMUIDs];
  id v27 = [v32 excludedMUIDs];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (![v9 count])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] setWithObject:v30];

    uint64_t v9 = (void *)v12;
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F84518]);
  objc_initWeak(&location, self);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v9;
  uint64_t v14 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v51 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke;
        v44[3] = &unk_1E59D9220;
        id v45 = v35;
        uint64_t v46 = v17;
        id v47 = v34;
        id v48 = v10;
        id v49 = v11;
        [v13 addOperation:v44];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v14);
  }

  id v18 = [MEMORY[0x1E4F1CA98] null];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_216;
  v36[3] = &unk_1E59D92C0;
  objc_copyWeak(&v43, &location);
  id v19 = v11;
  id v37 = v19;
  id v20 = v28;
  id v38 = v20;
  id v21 = v27;
  id v39 = v21;
  id v22 = v30;
  id v40 = v22;
  id v23 = v31;
  id v41 = v23;
  id v24 = v29;
  id v42 = v24;
  id v25 = (id)[v13 evaluateWithInput:v18 completion:v36];

  objc_destroyWeak(&v43);
  objc_destroyWeak(&location);
}

void __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [*(id *)(a1 + 32) ticketForSearchQuery:*(void *)(a1 + 40) filters:0 maxResults:50 traits:*(void *)(a1 + 48)];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_2;
  v12[3] = &unk_1E59D91F8;
  v12[4] = *(void *)(a1 + 40);
  id v13 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  id v15 = v6;
  id v16 = v7;
  id v14 = v9;
  id v10 = v6;
  id v11 = v7;
  [v8 submitWithHandler:v12 timeout:10 networkActivity:0];
}

void __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v22 = v8;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Encountered error searching for %@: %@", buf, 0x16u);
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v14, "_hasMUID", (void)v16))
        {
          id v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v14, "_muid"));
          if (([*(id *)(a1 + 40) containsObject:v15] & 1) == 0)
          {
            [*(id *)(a1 + 40) addObject:v15];
            [*(id *)(a1 + 48) addObject:v14];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_216(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 10);
  if (WeakRetained)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_2_217;
    block[3] = &unk_1E59D9298;
    id v4 = a1[4];
    id v5 = a1[5];
    id v6 = a1[6];
    id v7 = a1[7];
    id v8 = WeakRetained;
    id v9 = a1[8];
    id v10 = a1[9];
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_2_217(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_3;
  v45[3] = &unk_1E59D9248;
  id v2 = *(void **)(a1 + 32);
  id v46 = *(id *)(a1 + 40);
  id v47 = *(id *)(a1 + 48);
  int v3 = objc_msgSend(v2, "pk_objectsPassingTest:", v45);
  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = v4;
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_219;
    v43[3] = &unk_1E59D9270;
    id v44 = *(id *)(a1 + 72);
    id v6 = [v3 sortedArrayUsingComparator:v43];
    id v37 = (void *)[objc_alloc(MEMORY[0x1E4F30F08]) initWithCLLocation:*(void *)(a1 + 72)];
    id v7 = [v37 _displayMapRegion];
    if (v5 >= 5) {
      uint64_t v8 = 5;
    }
    else {
      uint64_t v8 = v5;
    }
    id v38 = v6;
    id v9 = objc_msgSend(v6, "subarrayWithRange:", 0, v8);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v50 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v39 + 1) + 8 * i) _displayMapRegion];
          id v15 = (void *)v14;
          if (v7)
          {
            uint64_t v16 = GEOMapRegionUnion();

            id v7 = (void *)v16;
          }
          else
          {
            id v7 = (void *)v14;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v50 count:16];
      }
      while (v11);
    }
    if (v5 >= 25) {
      uint64_t v17 = 25;
    }
    else {
      uint64_t v17 = v5;
    }
    long long v18 = objc_msgSend(v38, "subarrayWithRange:", 0, v17);
    long long v19 = (void *)MEMORY[0x1E4F29238];
    [v7 centerLat];
    CLLocationDegrees v21 = v20;
    [v7 centerLng];
    CLLocationCoordinate2D v23 = CLLocationCoordinate2DMake(v21, v22);
    id v24 = objc_msgSend(v19, "valueWithMKCoordinate:", v23.latitude, v23.longitude);
    uint64_t v25 = (void *)MEMORY[0x1E4F29238];
    [v7 spanLat];
    double v27 = v26;
    [v7 spanLng];
    v29 = objc_msgSend(v25, "valueWithMKCoordinateSpan:", v27, v28);
    uint64_t v30 = *MEMORY[0x1E4F30D70];
    v48[0] = *MEMORY[0x1E4F30D68];
    v48[1] = v30;
    v49[0] = v24;
    v49[1] = v29;
    v48[2] = *MEMORY[0x1E4F30D80];
    v49[2] = *(void *)(a1 + 56);
    id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:3];
    id v32 = [MEMORY[0x1E4F30F08] urlForMapItems:v18 options:v31];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 64) + 16));
    if ([*(id *)(a1 + 80) isInProgress])
    {
      [*(id *)(a1 + 80) didCompleteSuccessfully];
      if (v32)
      {
        if (objc_opt_respondsToSelector()) {
          [WeakRetained openURL:v32 sensitive:1 preferInApp:0];
        }
      }
    }

    id v34 = v44;
    goto LABEL_27;
  }
  v35 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v36 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412290;
    uint64_t v52 = v36;
    _os_log_impl(&dword_19F450000, v35, OS_LOG_TYPE_DEFAULT, "No results found for locations search for %@", buf, 0xCu);
  }

  if ([*(id *)(*(void *)(a1 + 64) + 48) isInProgress])
  {
    id v34 = [*(id *)(a1 + 64) _genericDisplayableErrorForError:0];
    [*(id *)(*(void *)(a1 + 64) + 48) didFailWithError:v34];
    [*(id *)(a1 + 64) _presentError:v34];
LABEL_27:
  }
}

uint64_t __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _hasBrandMUID] && objc_msgSend(v3, "_hasMUID"))
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "_brandMUID"));
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v3, "_muid"));
    int v6 = [*(id *)(a1 + 32) containsObject:v4];
    uint64_t v7 = v6 & ([*(id *)(a1 + 40) containsObject:v5] ^ 1);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __89__PKEnhancedMerchantsListSectionController__performNearbyLocationsSearch_deviceLocation___block_invoke_219(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  [v6 _coordinate];
  double v8 = v7;
  [v6 _coordinate];
  double v10 = v9;

  [*(id *)(a1 + 32) coordinate];
  double v12 = v11;
  uint64_t v13 = [*(id *)(a1 + 32) coordinate];
  double v15 = MEMORY[0x1A6220C90](v13, v8, v10, v12, v14);
  [v5 _coordinate];
  double v17 = v16;
  [v5 _coordinate];
  double v19 = v18;

  [*(id *)(a1 + 32) coordinate];
  double v21 = v20;
  uint64_t v22 = [*(id *)(a1 + 32) coordinate];
  if (v15 >= MEMORY[0x1A6220C90](v22, v17, v19, v21, v23)) {
    return 1;
  }
  else {
    return -1;
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  CLAuthorizationStatus v3 = [(CLLocationManager *)self->_locationManager authorizationStatus];
  uint64_t v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Enhanced merchants location manager did change authorization: %ld", (uint8_t *)&v5, 0xCu);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  lastValidLocation = self->_lastValidLocation;
  self->_lastValidLocation = 0;

  uint64_t v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = [v5 localizedDescription];
    int v10 = 138412290;
    double v11 = v8;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Location manager did fail with error: %@", (uint8_t *)&v10, 0xCu);
  }
  if ([(_PKPendingEnhancedMerchantNearbyLocationSearch *)self->_pendingMerchantLocationSearch isInProgress])
  {
    double v9 = [(PKEnhancedMerchantsListSectionController *)self _genericDisplayableErrorForError:v5];
    [(_PKPendingEnhancedMerchantNearbyLocationSearch *)self->_pendingMerchantLocationSearch didFailWithError:v9];
    [(PKEnhancedMerchantsListSectionController *)self _presentError:v9];
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = objc_msgSend(a4, "reverseObjectEnumerator", a3);
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        double v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (LocationIsValid(v9))
        {
          id v6 = v9;
          objc_storeStrong((id *)&self->_lastValidLocation, v9);
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  int v10 = self->_pendingMerchantLocationSearch;
  if ([(_PKPendingEnhancedMerchantNearbyLocationSearch *)v10 isInProgress])
  {
    if (v6)
    {
      [(PKEnhancedMerchantsListSectionController *)self _performNearbyLocationsSearch:v10 deviceLocation:v6];
    }
    else
    {
      double v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl(&dword_19F450000, v11, OS_LOG_TYPE_DEFAULT, "Unable to determine accurate device location", v13, 2u);
      }

      uint64_t v12 = [(PKEnhancedMerchantsListSectionController *)self _genericDisplayableErrorForError:0];
      [(_PKPendingEnhancedMerchantNearbyLocationSearch *)v10 didFailWithError:v12];
      [(PKEnhancedMerchantsListSectionController *)self _presentError:v12];
    }
  }
}

- (void)_applicationDidEnterBackground:(id)a3
{
  if ([(_PKPendingEnhancedMerchantNearbyLocationSearch *)self->_pendingMerchantLocationSearch isInProgress])
  {
    [(_PKPendingEnhancedMerchantNearbyLocationSearch *)self->_pendingMerchantLocationSearch cancel];
  }

  [(PKEnhancedMerchantsListSectionController *)self _stopUpdatingLocation];
}

- (id)_genericDisplayableErrorForError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = PKLocalizedFeatureString();
  id v5 = PKLocalizedFeatureString();
  id v6 = PKDisplayableErrorCustom();

  return v6;
}

- (void)_presentError:(id)a3
{
  id v7 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 presentDisplayableError:v7];
  }
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->_cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);
  objc_storeStrong((id *)&self->_pendingMerchantLocationSearch, 0);
  objc_storeStrong((id *)&self->_lastValidLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_merchantsUpdateToken, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_fetcher, 0);
}

@end