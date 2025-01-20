@interface PKDashboardPaymentTransactionItemPresenter
- (BOOL)_shouldShowIconForTransactionSource:(id)a3 transaction:(id)a4 context:(unint64_t)a5;
- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (BOOL)hideSeparatorForItem:(id)a3 inCollectionView:(id)a4;
- (CGSize)_imageSize;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKContactResolver)contactResolver;
- (PKDashboardPaymentTransactionItemPresenter)initWithContext:(unint64_t)a3 detailViewStyle:(int64_t)a4 avatarViewDelegate:(id)a5;
- (PKPaymentTransactionDetailViewControllerDeleteOverrider)deleteOverrider;
- (id)_contactKeysToFetch;
- (id)appleCardImage;
- (id)cashbackImage;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6;
- (void)_updateAvatarOnTransactionCell:(id)a3 withTransaction:(id)a4 contact:(id)a5;
- (void)_updatePrimaryLabelOnTransactionCell:(id)a3 withPeerPaymentCounterpartHandle:(id)a4 contact:(id)a5 transaction:(id)a6;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
- (void)prefetchForItem:(id)a3 inCollectionView:(id)a4;
- (void)setContactResolver:(id)a3;
- (void)setDeleteOverrider:(id)a3;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
- (void)viewControllerForTransaction:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 bankConnectInstitution:(id)a8 physicalCards:(id)a9 forcePreventHistory:(BOOL)a10 completion:(id)a11;
@end

@implementation PKDashboardPaymentTransactionItemPresenter

- (PKDashboardPaymentTransactionItemPresenter)initWithContext:(unint64_t)a3 detailViewStyle:(int64_t)a4 avatarViewDelegate:(id)a5
{
  id v8 = a5;
  v32.receiver = self;
  v32.super_class = (Class)PKDashboardPaymentTransactionItemPresenter;
  v9 = [(PKDashboardPaymentTransactionItemPresenter *)&v32 init];
  v10 = v9;
  if (v9)
  {
    v9->_context = a3;
    objc_storeWeak((id *)&v9->_avatarViewDelegate, v8);
    v11 = [PKPaymentTransactionCollectionViewCell alloc];
    uint64_t v12 = -[PKPaymentTransactionCollectionViewCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleCell = v10->_sampleCell;
    v10->_sampleCell = (PKPaymentTransactionCollectionViewCell *)v12;

    v14 = (UIImage *)objc_alloc_init(MEMORY[0x1E4FB1818]);
    emptyImage = v10->_emptyImage;
    v10->_emptyImage = v14;

    id v16 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    id v17 = objc_alloc(MEMORY[0x1E4F845E8]);
    v18 = [(PKDashboardPaymentTransactionItemPresenter *)v10 _contactKeysToFetch];
    uint64_t v19 = [v17 initWithContactStore:v16 keysToFetch:v18];
    contactResolver = v10->_contactResolver;
    v10->_contactResolver = (PKContactResolver *)v19;

    v21 = [[PKPaymentTransactionIconGenerator alloc] initWithCache:1 scale:PKUIScreenScale()];
    iconGenerator = v10->_iconGenerator;
    v10->_iconGenerator = v21;

    v23 = (PKPaymentDefaultDataProvider *)objc_alloc_init(MEMORY[0x1E4F84A88]);
    dataProvider = v10->_dataProvider;
    v10->_dataProvider = v23;

    v25 = [MEMORY[0x1E4F84E10] sharedService];
    v26 = [[PKPaymentTransactionDetailsFactory alloc] initWithContactResolver:v10->_contactResolver peerPaymentWebService:v25 paymentServiceDataProvider:v10->_dataProvider detailViewStyle:a4];
    transactionDetailsFactory = v10->_transactionDetailsFactory;
    v10->_transactionDetailsFactory = v26;

    v28 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    v10->_useAccessibilityLayout = UIContentSizeCategoryIsAccessibilityCategory(v28);

    v29 = objc_alloc_init(PKPeerPaymentCounterpartImageResolver);
    counterpartImageResolver = v10->_counterpartImageResolver;
    v10->_counterpartImageResolver = v29;
  }
  return v10;
}

- (id)_contactKeysToFetch
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v10[0] = v2;
  Class v3 = _MergedGlobals_665();
  v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  v5 = -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", [v4 _supportsForceTouch]);
  v10[1] = v5;
  v6 = [(Class)off_1EB545990() descriptorForRequiredKeys];
  uint64_t v7 = *MEMORY[0x1E4F1ADC8];
  v10[2] = v6;
  v10[3] = v7;
  v10[4] = *MEMORY[0x1E4F1AEE0];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:5];

  return v8;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"transactionItemPresenter";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7 = a4;
  if (a3)
  {
    if (v7)
    {
      id v15 = v7;
      id v8 = [a3 preferredContentSizeCategory];
      v9 = [v15 preferredContentSizeCategory];
      NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v8, v9);

      id v7 = v15;
      if (v10)
      {
        v11 = [v15 preferredContentSizeCategory];
        self->_useAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v11, (UIContentSizeCategory)*MEMORY[0x1E4FB27B0]) == NSOrderedDescending;

        uint64_t v12 = [PKPaymentTransactionCollectionViewCell alloc];
        v13 = -[PKPaymentTransactionCollectionViewCell initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        sampleCell = self->_sampleCell;
        self->_sampleCell = v13;

        id v7 = v15;
      }
    }
  }
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  v5 = [a3 transaction];
  BOOL v6 = [v5 transactionType] != 12;

  return v6;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  v53[4] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id val = a4;
  id v41 = a5;
  id v46 = a6;
  id v42 = a7;
  id v13 = v12;
  v14 = [v13 transaction];
  if ([v14 transactionType] == 15)
  {
    id v15 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v16 = *MEMORY[0x1E4F86380];
    uint64_t v17 = *MEMORY[0x1E4F86730];
    v52[0] = *MEMORY[0x1E4F86308];
    v52[1] = v17;
    uint64_t v18 = *MEMORY[0x1E4F867D8];
    v53[0] = v16;
    v53[1] = v18;
    uint64_t v19 = *MEMORY[0x1E4F867D0];
    v52[2] = *MEMORY[0x1E4F86120];
    v52[3] = v19;
    uint64_t v20 = *MEMORY[0x1E4F86540];
    v53[2] = *MEMORY[0x1E4F86038];
    v53[3] = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:4];
    [v15 subject:*MEMORY[0x1E4F87038] sendEvent:v21];
  }
  v22 = [v13 transactionSourceCollection];
  v44 = [v13 familyCollection];
  v23 = [v13 account];
  v43 = [v13 accountUserCollection];
  v24 = [v13 physicalCards];
  BOOL v25 = [v14 transactionType] == 11 && objc_msgSend(v23, "feature") == 5;
  if (self->_context) {
    char v26 = 1;
  }
  else {
    char v26 = v25;
  }
  objc_initWeak(&location, val);
  if ((v26 & 1) != 0
    || ![(PKPaymentTransactionDetailsFactory *)self->_transactionDetailsFactory canShowTransactionHistoryForTransaction:v14 transactionSourceCollection:v22])
  {
    if (([v14 peerPaymentType] & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      v28 = [v14 recurringPeerPayment];
      id v29 = objc_alloc(MEMORY[0x1E4F84D80]);
      v30 = [MEMORY[0x1E4F84E10] sharedService];
      v31 = (void *)[v29 initWithPeerPaymentWebService:v30];

      objc_super v32 = [v31 account];
      v33 = [v32 recurringPaymentsFeatureDescriptor];

      v34 = [PKPeerPaymentRecurringPaymentDetailViewController alloc];
      v35 = [v28 recipientAddress];
      v36 = [(PKPeerPaymentRecurringPaymentDetailViewController *)v34 initWithRecurringPayment:v28 recipientAddress:v35 mode:2 context:0 peerPaymentController:v31 remoteMessagesComposer:0];

      v37 = [v33 minimumAmount];
      [(PKPeerPaymentRecurringPaymentDetailViewController *)v36 setMinimumAmount:v37];

      v38 = [v33 maximumAmount];
      [(PKPeerPaymentRecurringPaymentDetailViewController *)v36 setMaximumAmount:v38];

      [v46 pushViewController:v36 animated:1];
    }
    else
    {
      v39 = [v13 bankConnectInstitution];
      v40 = [(PKPaymentTransactionDetailsFactory *)self->_transactionDetailsFactory detailViewControllerForTransaction:v14 transactionSourceCollection:v22 familyCollection:v44 account:v23 accountUserCollection:v43 bankConnectInstitution:v39 physicalCards:v24];
      [v46 pushViewController:v40 animated:1];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v46 shouldPromptForReviewOnDismissalWithTrigger:2];
      }
    }
  }
  else
  {
    transactionDetailsFactory = self->_transactionDetailsFactory;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __121__PKDashboardPaymentTransactionItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke;
    v47[3] = &unk_1E59D5D78;
    objc_copyWeak(&v50, &location);
    id v49 = v42;
    id v48 = v46;
    [(PKPaymentTransactionDetailsFactory *)transactionDetailsFactory historyViewControllerForTransaction:v14 transactionSourceCollection:v22 familyCollection:v44 account:v23 accountUserCollection:v43 physicalCards:v24 completion:v47];

    objc_destroyWeak(&v50);
  }
  objc_destroyWeak(&location);
}

void __121__PKDashboardPaymentTransactionItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (!v4 || (*(unsigned int (**)(void))(v4 + 16))()) {
      [*(id *)(a1 + 32) pushViewController:v5 animated:1];
    }
  }
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"transactionItemPresenter" forIndexPath:v8];
  [(PKDashboardPaymentTransactionItemPresenter *)self _configureCell:v11 forItem:v10 inCollectionView:v9 forIndexPath:v8];

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 transaction];
  id v10 = [v7 transactionSourceCollection];
  v11 = [v9 transactionSourceIdentifier];
  id v12 = [v10 transactionSourceForTransactionSourceIdentifier:v11];

  id v13 = [(PKPaymentDefaultDataProvider *)self->_dataProvider deviceName];
  v14 = v13;
  id v49 = v8;
  id v50 = v10;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    PKDeviceName();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v16 = v15;

  uint64_t v17 = [v7 familyCollection];
  uint64_t v18 = [v17 familyMemberForTransactionSource:v12];
  uint64_t v19 = (void *)MEMORY[0x1E4F84D18];
  uint64_t v20 = [v7 secondaryTransactionSource];
  v21 = [v7 account];
  id v46 = (void *)v18;
  v22 = [v19 presentationInformationForTransaction:v9 transactionSource:v12 secondaryTransactionSource:v20 familyMember:v18 account:v21 deviceName:v16 context:self->_context];

  v23 = [v22 valueString];
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v47 = v17;
  id v48 = v16;
  v45 = v24;
  if ([v23 length])
  {
    id v25 = objc_alloc(MEMORY[0x1E4F28B18]);
    char v26 = (void *)[v24 copy];
    v27 = (void *)[v25 initWithString:v23 attributes:v26];
  }
  else
  {
    v27 = 0;
  }
  BOOL v28 = [(PKDashboardPaymentTransactionItemPresenter *)self _shouldShowIconForTransactionSource:v12 transaction:v9 context:self->_context];
  id v29 = [(PKPaymentTransactionCollectionViewCell *)self->_sampleCell transactionView];
  v30 = [v22 primaryString];
  [v29 setPrimaryString:v30];

  v31 = [v22 secondaryString];
  [v29 setSecondaryString:v31];

  objc_super v32 = [v22 tertiaryString];
  [v29 setTertiaryString:v32];

  [v29 setTransactionValueAttributedText:v27];
  if (self->_context - 3 > 1 || ([v9 transactionStatus] & 0xFFFFFFFFFFFFFFF7) != 0)
  {
    v33 = [v22 badgeString];
    [v29 setBadgeString:v33];
  }
  else
  {
    [v29 setTransactionValueAttributedText:0];
  }
  objc_msgSend(v29, "setShowsDisclosureView:", objc_msgSend(v22, "shouldShowDisclosure"));
  v34 = [v22 secondaryBadgeSymbol];
  [v29 setSecondaryBadgeSymbol:v34];

  if (v28) {
    emptyImage = self->_emptyImage;
  }
  else {
    emptyImage = 0;
  }
  [v29 setPrimaryImage:emptyImage];
  sampleCell = self->_sampleCell;
  [v49 bounds];
  double v38 = v37;

  -[PKPaymentTransactionCollectionViewCell sizeThatFits:](sampleCell, "sizeThatFits:", v38, 3.40282347e38);
  double v40 = v39;
  double v42 = v41;

  double v43 = v40;
  double v44 = v42;
  result.height = v44;
  result.width = v43;
  return result;
}

- (void)prefetchForItem:(id)a3 inCollectionView:(id)a4
{
  id v5 = a3;
  id v11 = [v5 transaction];
  BOOL v6 = [v5 transactionSourceCollection];

  id v7 = [v11 transactionSourceIdentifier];
  id v8 = [v6 transactionSourceForTransactionSourceIdentifier:v7];

  if ([(PKDashboardPaymentTransactionItemPresenter *)self _shouldShowIconForTransactionSource:v8 transaction:v11 context:self->_context])
  {
    iconGenerator = self->_iconGenerator;
    [(PKDashboardPaymentTransactionItemPresenter *)self _imageSize];
    id v10 = -[PKPaymentTransactionIconGenerator iconForTransaction:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForTransaction:size:ignoreLogoURL:requestType:iconHandler:", v11, 0, 1, &__block_literal_global_114);
  }
}

- (BOOL)hideSeparatorForItem:(id)a3 inCollectionView:(id)a4
{
  id v4 = a3;
  if ([v4 isFeaturedTransaction])
  {
    id v5 = [v4 transaction];
    BOOL v6 = [v5 preferredLocation];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)viewControllerForTransaction:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 bankConnectInstitution:(id)a8 physicalCards:(id)a9 forcePreventHistory:(BOOL)a10 completion:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = (void (**)(id, void *))a11;
  if (a10
    || self->_context
    || ![(PKPaymentTransactionDetailsFactory *)self->_transactionDetailsFactory canShowTransactionHistoryForTransaction:v17 transactionSourceCollection:v18])
  {
    char v26 = [(PKPaymentTransactionDetailsFactory *)self->_transactionDetailsFactory detailViewControllerForTransaction:v17 transactionSourceCollection:v18 familyCollection:v19 account:v20 accountUserCollection:v21 bankConnectInstitution:v22 physicalCards:v23];
    v24[2](v24, v26);
  }
  else
  {
    transactionDetailsFactory = self->_transactionDetailsFactory;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __218__PKDashboardPaymentTransactionItemPresenter_viewControllerForTransaction_transactionSourceCollection_familyCollection_account_accountUserCollection_bankConnectInstitution_physicalCards_forcePreventHistory_completion___block_invoke;
    v27[3] = &unk_1E59D5DC0;
    BOOL v28 = v24;
    [(PKPaymentTransactionDetailsFactory *)transactionDetailsFactory historyViewControllerForTransaction:v17 transactionSourceCollection:v18 familyCollection:v19 account:v20 accountUserCollection:v21 physicalCards:v23 completion:v27];
  }
}

uint64_t __218__PKDashboardPaymentTransactionItemPresenter_viewControllerForTransaction_transactionSourceCollection_familyCollection_account_accountUserCollection_bankConnectInstitution_physicalCards_forcePreventHistory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_shouldShowIconForTransactionSource:(id)a3 transaction:(id)a4 context:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 isBankConnectTransaction]) {
    goto LABEL_2;
  }
  if (v8) {
    goto LABEL_4;
  }
  uint64_t v13 = [v9 accountType];
  if ((unint64_t)(v13 - 2) < 3)
  {
LABEL_2:
    BOOL v10 = 1;
    goto LABEL_23;
  }
  if (v13 != 1
    || (v14 = [v9 peerPaymentType], BOOL v10 = 1, a5 == 1)
    && (unint64_t)(v14 - 7) >= 0xFFFFFFFFFFFFFFFCLL)
  {
LABEL_4:
    uint64_t v11 = [v8 type];
    if ((unint64_t)(v11 - 1) >= 3)
    {
      if (v11)
      {
        LOBYTE(v12) = 0;
      }
      else
      {
        id v15 = [v8 paymentPass];
        id v16 = [MEMORY[0x1E4F84D50] sharedService];
        id v17 = [v16 context];
        id v18 = [v17 configuration];

        id v19 = [v15 issuerCountryCode];
        int v20 = [v18 paymentTransactionIconsEnabledForRegion:v19];

        if ([v15 cardType] != 1) {
          int v20 = 0;
        }
        id v21 = [v15 associatedAccountServiceAccountIdentifier];
        if (v21
          || ([v15 hasAssociatedPeerPaymentAccount] & 1) != 0
          || ([v15 isStoredValuePass] & 1) != 0)
        {
          LOBYTE(v12) = 1;
        }
        else
        {
          int v12 = [v15 isIdentityPass] | v20;
        }
      }
    }
    else
    {
      LOBYTE(v12) = 1;
    }
    if (self->_context == 1) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = v12;
    }
  }
LABEL_23:

  return v10;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  uint64_t v134 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v105 = a4;
  id v100 = a5;
  id v11 = a6;
  v103 = v10;
  if (v10)
  {
    id val = self;
    id v90 = v11;
    int v12 = [v105 transaction];
    v101 = [v12 identifier];
    [v10 setIdentifier:v101];
    objc_msgSend(v10, "setDeletable:", objc_msgSend(v12, "isDeletable"));
    v99 = [v105 transactionSourceCollection];
    uint64_t v13 = [v12 transactionSourceIdentifier];
    v102 = [v99 transactionSourceForTransactionSourceIdentifier:v13];

    uint64_t v14 = [(PKPaymentDefaultDataProvider *)val->_dataProvider deviceName];
    id v15 = v14;
    if (v14)
    {
      id v96 = v14;
    }
    else
    {
      PKDeviceName();
      id v96 = (id)objc_claimAutoreleasedReturnValue();
    }

    v98 = [v105 familyCollection];
    v97 = [v98 familyMemberForTransactionSource:v102];
    id v16 = (void *)MEMORY[0x1E4F84D18];
    id v17 = [v105 secondaryTransactionSource];
    id v18 = [v105 account];
    id v19 = [v16 presentationInformationForTransaction:v12 transactionSource:v102 secondaryTransactionSource:v17 familyMember:v97 account:v18 deviceName:v96 context:val->_context];

    v94 = [MEMORY[0x1E4FB1618] labelColor];
    if ([v19 shouldGrayValue])
    {
      v95 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    else
    {
      v95 = 0;
    }
    v93 = [v19 valueString];
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v95) {
      id v21 = v95;
    }
    else {
      id v21 = v94;
    }
    v92 = v20;
    [v20 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
    id v22 = [MEMORY[0x1E4FB1618] clearColor];
    [v92 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4FB06C0]];

    if ([v19 shouldStrikeValue]) {
      [v92 setObject:&unk_1EF2B93C0 forKeyedSubscript:*MEMORY[0x1E4FB0768]];
    }
    if ([v93 length])
    {
      id v23 = objc_alloc(MEMORY[0x1E4F28B18]);
      id v24 = (void *)[v92 copy];
      v91 = (void *)[v23 initWithString:v93 attributes:v24];
    }
    else
    {
      v91 = 0;
    }
    if (([v19 destructiveSecondaryString] & 1) != 0
      || val->_context != 1
      || ![v105 isFeaturedTransaction]
      || ([v12 rewards],
          id v25 = objc_claimAutoreleasedReturnValue(),
          [v25 rewardsItems],
          char v26 = objc_claimAutoreleasedReturnValue(),
          uint64_t v27 = [v26 count],
          v26,
          v25,
          !v27))
    {
      uint64_t v39 = 0;
LABEL_35:
      double v40 = [v103 transactionView];
      double v41 = [v19 primaryString];
      [v40 setPrimaryString:v41];

      double v42 = [v19 secondaryString];
      [v40 setSecondaryString:v42];

      double v43 = [v19 tertiaryString];
      [v40 setTertiaryString:v43];

      [v40 setTransactionValueAttributedText:v91];
      if (val->_context - 3 > 1 || ([v12 transactionStatus] & 0xFFFFFFFFFFFFFFF7) != 0)
      {
        double v44 = [v19 badgeString];
        [v40 setBadgeString:v44];
      }
      else
      {
        [v40 setTransactionValueAttributedText:0];
      }
      [v40 setHideBadgeBackground:v39];
      objc_msgSend(v40, "setShowsDisclosureView:", objc_msgSend(v19, "shouldShowDisclosure"));
      v45 = [v19 secondaryBadgeSymbol];
      [v40 setSecondaryBadgeSymbol:v45];
      if ([v19 destructiveSecondaryString]) {
        [MEMORY[0x1E4FB1618] systemRedColor];
      }
      else {
      id v46 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
      }
      [v40 setSecondaryColor:v46];

      +[PKAppIntentUIUtilities annotateView:v40 withEntityForTransaction:v12];
      uint64_t v47 = [(PKDashboardPaymentTransactionItemPresenter *)val _shouldShowIconForTransactionSource:v102 transaction:v12 context:val->_context];
      uint64_t v48 = [v12 transactionType];
      if (v48 == 3)
      {
        id v49 = [v12 peerPaymentCounterpartHandle];
        [v40 setShowsAvatarView:v47];
        [v40 setPrimaryImage:0];
        id v50 = [v12 peerPaymentCounterpartImageRecordIdentifier];
        if ([v12 peerPaymentPaymentMode] != 2) {
          goto LABEL_102;
        }
        v51 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB28D8]];
        v52 = (void *)MEMORY[0x1E4FB1830];
        [v51 scaledValueForValue:9.0];
        v53 = objc_msgSend(v52, "configurationWithPointSize:weight:", 2);
        [v40 setSecondaryBadgeSymbolConfiguration:v53];

        if ((v47 & (v50 != 0)) == 1)
        {
          objc_initWeak(&location, val);
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke;
          aBlock[3] = &unk_1E59D2B48;
          objc_copyWeak(&v127, &location);
          id v54 = v103;
          id v124 = v54;
          id v125 = v12;
          id v126 = v49;
          v55 = (void (**)(void *, void *))_Block_copy(aBlock);
          BOOL v56 = [(PKPeerPaymentCounterpartImageResolver *)val->_counterpartImageResolver hasCachedImageDataForIdentifier:v50];
          counterpartImageResolver = val->_counterpartImageResolver;
          if (v56)
          {
            v58 = [(PKPeerPaymentCounterpartImageResolver *)val->_counterpartImageResolver counterpartImageDataForIdentifier:v50];
            v55[2](v55, v58);
          }
          else
          {
            v119[0] = MEMORY[0x1E4F143A8];
            v119[1] = 3221225472;
            v119[2] = __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_2;
            v119[3] = &unk_1E59D2B70;
            id v120 = v54;
            id v121 = v101;
            v122 = v55;
            [(PKPeerPaymentCounterpartImageResolver *)counterpartImageResolver counterpartImageDataForIdentifier:v50 completion:v119];

            v58 = v120;
          }

          objc_destroyWeak(&v127);
          objc_destroyWeak(&location);
        }
        else
        {
LABEL_102:
          if ([(PKContactResolver *)val->_contactResolver hasCachedResultForHandle:v49])
          {
            v66 = [(PKContactResolver *)val->_contactResolver contactForHandle:v49];
            if (v47) {
              [(PKDashboardPaymentTransactionItemPresenter *)val _updateAvatarOnTransactionCell:v103 withTransaction:v12 contact:v66];
            }
            [(PKDashboardPaymentTransactionItemPresenter *)val _updatePrimaryLabelOnTransactionCell:v103 withPeerPaymentCounterpartHandle:v49 contact:v66 transaction:v12];
          }
          else
          {
            objc_initWeak(&location, val);
            contactResolver = val->_contactResolver;
            v112[0] = MEMORY[0x1E4F143A8];
            v112[1] = 3221225472;
            v112[2] = __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_4;
            v112[3] = &unk_1E59D5DE8;
            objc_copyWeak(&v117, &location);
            id v113 = v103;
            id v114 = v101;
            char v118 = v47;
            id v115 = v12;
            id v116 = v49;
            [(PKContactResolver *)contactResolver contactForHandle:v116 withCompletion:v112];

            objc_destroyWeak(&v117);
            objc_destroyWeak(&location);
          }
        }
        v69 = [MEMORY[0x1E4FB16C8] currentDevice];
        int v70 = [v69 _supportsForceTouch];

        if (v70)
        {
          v71 = [v40 avatarView];
          [v71 setUserInteractionEnabled:1];
          id WeakRetained = objc_loadWeakRetained((id *)&val->_avatarViewDelegate);
          [v71 setDelegate:WeakRetained];
          [v71 setForcePressView:v71];
        }
        goto LABEL_67;
      }
      [v40 setShowsAvatarView:0];
      if (!v47)
      {
        [v40 setPrimaryImage:0];
LABEL_67:

        id v11 = v90;
        goto LABEL_68;
      }
      [(PKDashboardPaymentTransactionItemPresenter *)val _imageSize];
      unint64_t context = val->_context;
      if (context - 3 < 2)
      {
        uint64_t v68 = [(PKDashboardPaymentTransactionItemPresenter *)val cashbackImage];
      }
      else
      {
        double v62 = v59;
        double v63 = v60;
        if (context == 5 || !context)
        {
          objc_initWeak(&location, val);
          iconGenerator = val->_iconGenerator;
          v106[0] = MEMORY[0x1E4F143A8];
          v106[1] = 3221225472;
          v106[2] = __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_6;
          v106[3] = &unk_1E59D5E10;
          objc_copyWeak(&v111, &location);
          id v107 = v103;
          id v108 = v101;
          id v109 = v100;
          id v110 = v40;
          v65 = -[PKPaymentTransactionIconGenerator iconForTransaction:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForTransaction:size:ignoreLogoURL:requestType:iconHandler:", v12, 0, 0, v106, v62, v63);

          objc_destroyWeak(&v111);
          objc_destroyWeak(&location);
          if (!v65) {
            goto LABEL_72;
          }
LABEL_61:
          [v40 setPrimaryImage:v65 animated:0];

          goto LABEL_67;
        }
        if (v48 != 10 || context != 1) {
          goto LABEL_72;
        }
        uint64_t v68 = [(PKDashboardPaymentTransactionItemPresenter *)val appleCardImage];
      }
      v65 = (void *)v68;
      if (!v68)
      {
LABEL_72:
        [v40 setPrimaryImage:val->_emptyImage];
        goto LABEL_67;
      }
      goto LABEL_61;
    }
    v89 = [v12 rewards];
    v88 = [v89 totalEligibleValueForUnit:1];
    v87 = [v89 totalEligibleValueForUnit:2];
    v86 = [v89 promotionalRewardsItems];
    uint64_t v85 = [v86 count];
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id v29 = [v89 rewardsItems];
    char v30 = 0;
    uint64_t v31 = [v29 countByEnumeratingWithState:&v129 objects:v133 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v130;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v130 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = *(void **)(*((void *)&v129 + 1) + 8 * i);
          uint64_t v35 = [v34 state];
          if (v35 != 3)
          {
            v30 |= v35 == 1;
            if ([v34 eligibleValueUnit] == 2) {
              [v28 addObject:v34];
            }
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v129 objects:v133 count:16];
      }
      while (v31);
    }

    int v36 = objc_msgSend(v88, "pk_isZeroNumber");
    int v37 = [(NSDecimalNumber *)v87 pk_isZeroNumber];
    if (((v36 | v37 ^ 1) & 1) == 0)
    {
      PKRewardsCenterEnabled();
      v84 = PKFormattedStringMinimalFractionDigitsFromNumber();
      double v38 = PKLocalizedFeatureString();

      goto LABEL_92;
    }
    if (((v37 | v36) & 1) == 0)
    {
      PKRewardsCenterEnabled();
      double v38 = PKLocalizedFeatureString();
      goto LABEL_92;
    }
    if (v37)
    {
      double v38 = 0;
LABEL_92:
      v80 = objc_msgSend(v12, "rewardsTotalCurrencyAmount", v84);
      if (v80 && [v12 transactionType] != 1)
      {
        BOOL v82 = [v12 transactionStatus] == 3;

        if (v82)
        {
          v81 = 0;
          goto LABEL_96;
        }
        v80 = [v12 rewardsTotalCurrencyAmount];
        v83 = [v80 formattedStringValue];
        v81 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v83);
      }
      else
      {
        v81 = 0;
      }

LABEL_96:
      [v19 setSecondaryBadgeSymbol:0];
      [v19 setBadgeString:v81];
      [v19 setSecondaryString:v38];

      uint64_t v39 = 1;
      goto LABEL_35;
    }
    v73 = [v12 rewardsTotalCurrencyCode];
    if (v73)
    {
      v74 = PKCurrencyAmountCreate(v87, v73);
    }
    else
    {
      v75 = [v12 currencyCode];
      v74 = PKCurrencyAmountCreate(v87, v75);
    }
    if ([v28 count] == 1)
    {
      v76 = [v28 anyObject];
    }
    else
    {
      v76 = 0;
    }
    v77 = [v76 promotionName];
    v78 = objc_msgSend(v77, "pk_stringIfNotEmpty");

    int v79 = PKRewardsCenterEnabled() ^ 1 | (v85 == 0);
    if (v30)
    {
      if ((v79 & 1) == 0 && v78)
      {
LABEL_89:
        v84 = v78;
        double v38 = PKLocalizedFeatureString();
LABEL_91:

        goto LABEL_92;
      }
    }
    else if ((v79 & 1) == 0 && v78)
    {
      goto LABEL_89;
    }
    v84 = [v74 minimalFormattedStringValue];
    double v38 = PKLocalizedFeatureString();

    goto LABEL_91;
  }
LABEL_68:
}

void __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke(void *a1, void *a2)
{
  Class v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  [v5 setImageData:v4];

  [WeakRetained _updateAvatarOnTransactionCell:a1[4] withTransaction:a1[5] contact:v5];
  [WeakRetained _updatePrimaryLabelOnTransactionCell:a1[4] withPeerPaymentCounterpartHandle:a1[6] contact:v5 transaction:a1[5]];
}

void __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_3;
  v5[3] = &unk_1E59CB728;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = v3;
  id v9 = a1[6];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) identifier];
  id v3 = *(void **)(a1 + 40);
  id v9 = v2;
  id v4 = v3;
  if (v9 == v4)
  {

    goto LABEL_10;
  }
  if (v9) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
  }
  else
  {
    int v6 = [v9 isEqualToString:v4];

    if (v6)
    {
LABEL_10:
      uint64_t v7 = *(void *)(a1 + 48);

      if (v7)
      {
        id v8 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
        v8();
      }
      return;
    }
  }
}

void __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_5;
  block[3] = &unk_1E59CB640;
  objc_copyWeak(&v11, (id *)(a1 + 64));
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  char v12 = *(unsigned char *)(a1 + 72);
  id v8 = *(id *)(a1 + 48);
  id v9 = v3;
  id v10 = *(id *)(a1 + 56);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v11);
}

void __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    id v3 = [*(id *)(a1 + 32) identifier];
    id v4 = *(void **)(a1 + 40);
    id v5 = v3;
    id v6 = v4;
    if (v5 == v6)
    {

      goto LABEL_11;
    }
    id v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {

LABEL_14:
      id WeakRetained = v10;
      goto LABEL_15;
    }
    int v9 = [v5 isEqualToString:v6];

    id WeakRetained = v10;
    if (v9)
    {
LABEL_11:
      if (*(unsigned char *)(a1 + 80)) {
        [v10 _updateAvatarOnTransactionCell:*(void *)(a1 + 32) withTransaction:*(void *)(a1 + 48) contact:*(void *)(a1 + 56)];
      }
      [v10 _updatePrimaryLabelOnTransactionCell:*(void *)(a1 + 32) withPeerPaymentCounterpartHandle:*(void *)(a1 + 64) contact:*(void *)(a1 + 56) transaction:*(void *)(a1 + 48)];
      goto LABEL_14;
    }
  }
LABEL_15:
}

void __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_6(id *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_7;
    v4[3] = &unk_1E59D10E8;
    objc_copyWeak(&v10, a1 + 8);
    id v5 = a1[4];
    id v6 = a1[5];
    id v7 = a1[6];
    id v8 = a1[7];
    id v9 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);

    objc_destroyWeak(&v10);
  }
}

void __99__PKDashboardPaymentTransactionItemPresenter__configureCell_forItem_inCollectionView_forIndexPath___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    id v13 = WeakRetained;
    id v3 = [*(id *)(a1 + 32) identifier];
    id v4 = *(void **)(a1 + 40);
    id v5 = v3;
    id v6 = v4;
    if (v5 == v6)
    {

      goto LABEL_11;
    }
    id v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {

LABEL_12:
      id WeakRetained = v13;
      goto LABEL_13;
    }
    int v9 = [v5 isEqualToString:v6];

    id WeakRetained = v13;
    if (v9)
    {
LABEL_11:
      id v10 = [*(id *)(a1 + 48) indexPathsForVisibleItems];
      id v11 = [*(id *)(a1 + 48) indexPathForCell:*(void *)(a1 + 32)];
      uint64_t v12 = [v10 containsObject:v11];

      [*(id *)(a1 + 56) setPrimaryImage:*(void *)(a1 + 64) animated:v12];
      goto LABEL_12;
    }
  }
LABEL_13:
}

- (void)_updateAvatarOnTransactionCell:(id)a3 withTransaction:(id)a4 contact:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = [a3 transactionView];
  BOOL v8 = [v7 avatarView];

  if (v6)
  {
    v13[0] = v6;
    int v9 = (void *)MEMORY[0x1E4F1C978];
    id v10 = (id *)v13;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    [v6 setContactType:0];
    id v12 = v6;
    int v9 = (void *)MEMORY[0x1E4F1C978];
    id v10 = &v12;
  }
  id v11 = [v9 arrayWithObjects:v10 count:1];

  [v8 setContacts:v11];
}

- (void)_updatePrimaryLabelOnTransactionCell:(id)a3 withPeerPaymentCounterpartHandle:(id)a4 contact:(id)a5 transaction:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!self->_context)
  {
    id v12 = v10;
    if ([a6 peerPaymentPaymentMode] != 2)
    {
      uint64_t v13 = [MEMORY[0x1E4F84D88] displayNameForCounterpartHandle:v12 contact:v11];

      id v12 = (id)v13;
    }
    uint64_t v14 = [v15 transactionView];
    [v14 setPrimaryString:v12];
  }
}

- (CGSize)_imageSize
{
  double v2 = 100.0;
  if (!self->_useAccessibilityLayout) {
    double v2 = 45.0;
  }
  double v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)cashbackImage
{
  cashbackImage = self->_cashbackImage;
  if (!cashbackImage)
  {
    id v4 = PKPassKitUIBundle();
    id v5 = [v4 URLForResource:@"CashBackIcon" withExtension:@"pdf"];
    [(PKDashboardPaymentTransactionItemPresenter *)self _imageSize];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    double v10 = PKUIScreenScale();
    PKUIImageFromPDF(v5, v7, v9, v10);
    id v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    id v12 = self->_cashbackImage;
    self->_cashbackImage = v11;

    cashbackImage = self->_cashbackImage;
  }

  return cashbackImage;
}

- (id)appleCardImage
{
  appleCardImage = self->_appleCardImage;
  if (!appleCardImage)
  {
    id v4 = PKPassKitUIBundle();
    id v5 = [v4 URLForResource:@"AppleCardIcon" withExtension:@"pdf"];
    [(PKDashboardPaymentTransactionItemPresenter *)self _imageSize];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    double v10 = PKUIScreenScale();
    PKUIImageFromPDF(v5, v7, v9, v10);
    id v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    id v12 = self->_appleCardImage;
    self->_appleCardImage = v11;

    appleCardImage = self->_appleCardImage;
  }

  return appleCardImage;
}

- (PKContactResolver)contactResolver
{
  return self->_contactResolver;
}

- (void)setContactResolver:(id)a3
{
}

- (PKPaymentTransactionDetailViewControllerDeleteOverrider)deleteOverrider
{
  return self->_deleteOverrider;
}

- (void)setDeleteOverrider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterpartImageResolver, 0);
  objc_storeStrong((id *)&self->_sampleCell, 0);
  objc_storeStrong((id *)&self->_deleteOverrider, 0);
  objc_destroyWeak((id *)&self->_avatarViewDelegate);
  objc_storeStrong((id *)&self->_transactionDetailsFactory, 0);
  objc_storeStrong((id *)&self->_appleCardImage, 0);
  objc_storeStrong((id *)&self->_cashbackImage, 0);
  objc_storeStrong((id *)&self->_emptyImage, 0);
  objc_storeStrong((id *)&self->_transactionCellSecondaryLabelPeerPaymentFont, 0);
  objc_storeStrong((id *)&self->_transactionCellSecondaryLabelFont, 0);
  objc_storeStrong((id *)&self->_transactionCellValueLabelPeerPaymentFont, 0);
  objc_storeStrong((id *)&self->_transactionCellValueLabelFont, 0);
  objc_storeStrong((id *)&self->_transactionCellPrimaryLabelPeerPaymentFont, 0);
  objc_storeStrong((id *)&self->_transactionCellPrimaryLabelFont, 0);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);

  objc_storeStrong((id *)&self->_contactResolver, 0);
}

@end