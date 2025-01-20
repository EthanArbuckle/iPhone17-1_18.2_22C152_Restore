@interface PKTransactionGroupItemPresenter
- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (CGSize)_imageSize;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKContactAvatarManager)avatarManager;
- (PKContactResolver)contactResolver;
- (PKMapsSnapshotManager)snapshotManager;
- (PKPaymentDataProvider)paymentDataProvider;
- (PKTransactionGroupItemPresenter)init;
- (id)_contactKeysToFetch;
- (id)adjustmentsImage;
- (id)appleCardImage;
- (id)cashbackImage;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (id)interestImage;
- (id)refundsImage;
- (id)transactionListImage;
- (void)_applyTokenFiltersFromItem:(id)a3 toFetcher:(id)a4;
- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6 forSizing:(BOOL)a7;
- (void)_updateAvatarOnTransactionCell:(id)a3 withGroup:(id)a4 contact:(id)a5;
- (void)_updatePrimaryLabelOnTransactionCell:(id)a3 withPeerPaymentCounterpartHandle:(id)a4 contact:(id)a5;
- (void)_viewControllerForItem:(id)a3 withCompletion:(id)a4;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
- (void)setAvatarManager:(id)a3;
- (void)setContactResolver:(id)a3;
- (void)setPaymentDataProvider:(id)a3;
- (void)setSnapshotManager:(id)a3;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6;
@end

@implementation PKTransactionGroupItemPresenter

- (PKTransactionGroupItemPresenter)init
{
  v24.receiver = self;
  v24.super_class = (Class)PKTransactionGroupItemPresenter;
  v2 = [(PKTransactionGroupItemPresenter *)&v24 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    iconsPerMerchantCategory = v2->_iconsPerMerchantCategory;
    v2->_iconsPerMerchantCategory = v3;

    v5 = [[PKPaymentTransactionIconGenerator alloc] initWithCache:1 scale:PKUIScreenScale()];
    iconGenerator = v2->_iconGenerator;
    v2->_iconGenerator = v5;

    id v7 = objc_alloc(MEMORY[0x1E4F845E8]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1B980]);
    v9 = [(PKTransactionGroupItemPresenter *)v2 _contactKeysToFetch];
    uint64_t v10 = [v7 initWithContactStore:v8 keysToFetch:v9];
    contactResolver = v2->_contactResolver;
    v2->_contactResolver = (PKContactResolver *)v10;

    v12 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    formatterYear = v2->_formatterYear;
    v2->_formatterYear = v12;

    v14 = v2->_formatterYear;
    id v15 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v16 = (void *)[v15 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    [(NSDateFormatter *)v14 setCalendar:v16];

    [(NSDateFormatter *)v2->_formatterYear setLocalizedDateFormatFromTemplate:@"y"];
    v17 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    formatterMonth = v2->_formatterMonth;
    v2->_formatterMonth = v17;

    [(NSDateFormatter *)v2->_formatterMonth setLocalizedDateFormatFromTemplate:@"MMMM"];
    v2->_needsSizing = 1;
    v19 = [PKPaymentTransactionCollectionViewCell alloc];
    uint64_t v20 = -[PKPaymentTransactionCollectionViewCell initWithFrame:](v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKPaymentTransactionCollectionViewCell *)v20;

    v22 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    v2->_useAccessibilityLayout = UIContentSizeCategoryIsAccessibilityCategory(v22);
  }
  return v2;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"transactionGroupPresenter";
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

        self->_needsSizing = 1;
        v12 = [PKPaymentTransactionCollectionViewCell alloc];
        v13 = -[PKPaymentTransactionCollectionViewCell initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        sampleCell = self->_sampleCell;
        self->_sampleCell = v13;

        id v7 = v15;
      }
    }
  }
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"transactionGroupPresenter" forIndexPath:v8];
  [(PKTransactionGroupItemPresenter *)self _configureCell:v11 forItem:v10 inCollectionView:v9 forIndexPath:v8 forSizing:0];

  return v11;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_needsSizing
    || self->_useAccessibilityLayout
    || ((double width = self->_groupSize.width, height = self->_groupSize.height, width == *MEMORY[0x1E4F1DB30])
      ? (BOOL v13 = height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      : (BOOL v13 = 0),
        v13))
  {
    [(PKTransactionGroupItemPresenter *)self _configureCell:self->_sampleCell forItem:v8 inCollectionView:v9 forIndexPath:v10 forSizing:1];
    sampleCell = self->_sampleCell;
    [v9 bounds];
    -[PKPaymentTransactionCollectionViewCell sizeThatFits:](sampleCell, "sizeThatFits:", v15, 3.40282347e38);
    double width = v16;
    double height = v17;
    self->_groupSize.double width = v16;
    self->_groupSize.double height = v17;
  }

  double v18 = width;
  double v19 = height;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  v5 = [a3 group];
  BOOL v6 = [v5 transactionCount] != 0;

  return v6;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  id v10 = a6;
  id v11 = a7;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __110__PKTransactionGroupItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke;
  v14[3] = &unk_1E59CB7C0;
  id v15 = v10;
  id v16 = v11;
  id v12 = v10;
  id v13 = v11;
  [(PKTransactionGroupItemPresenter *)self _viewControllerForItem:a3 withCompletion:v14];
}

void __110__PKTransactionGroupItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = v3;
  if (!v4 || (v5 = (*(uint64_t (**)(void))(v4 + 16))(), BOOL v6 = v7, v5))
  {
    [*(id *)(a1 + 32) pushViewController:v7 animated:1];
    BOOL v6 = v7;
  }
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6 forSizing:(BOOL)a7
{
  BOOL v7 = a7;
  v154[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v135 = a4;
  id v134 = a5;
  id v133 = a6;
  if (v12)
  {
    BOOL v130 = v7;
    id v13 = [v135 group];
    uint64_t v14 = [v13 merchantCategory];
    if (!self->_emptyImage)
    {
      id v15 = (UIImage *)objc_alloc_init(MEMORY[0x1E4FB1818]);
      emptyImage = self->_emptyImage;
      self->_emptyImage = v15;
    }
    CGFloat v17 = [v12 transactionView];
    double v18 = [v13 totalAmount];
    double v19 = [v18 amount];
    int v20 = objc_msgSend(v19, "pk_isNegativeNumber");

    if (v20)
    {
      uint64_t v21 = [v18 negativeValue];

      v22 = (void *)v21;
    }
    else
    {
      v22 = v18;
    }
    v132 = v22;
    v23 = [v22 formattedStringValue];
    BOOL v24 = 0;
    uint64_t v25 = 1;
    switch([v13 type])
    {
      case 0:
        v26 = PKLocalizedStringFromMerchantCategory();
        [v17 setPrimaryString:v26];

        if (v130)
        {
          [v17 setPrimaryImage:self->_emptyImage];
        }
        else
        {
          v79 = [NSNumber numberWithInteger:v14];
          v80 = [(NSCache *)self->_iconsPerMerchantCategory objectForKey:v79];
          if (!v80)
          {
            [(PKTransactionGroupItemPresenter *)self _imageSize];
            CGFloat v82 = v81;
            CGFloat v84 = v83;
            double v85 = PKUIScreenScale();
            v80 = PKIconForMerchantCategory(v82, v84, v85, v14, 0, 0);
            if (v80) {
              [(NSCache *)self->_iconsPerMerchantCategory setObject:v80 forKey:v79];
            }
          }
          [v17 setPrimaryImage:v80];
        }
        v86 = [v13 trend];
        v87 = v86;
        if (v86 && [v86 direction])
        {
          v88 = [v87 change];
          v89 = [v88 formattedStringValue];
          [v17 setBadgeString:v89];

          [v17 setHideBadgeBackground:1];
          unint64_t v90 = [v87 direction] - 1;
          if (v90 > 4) {
            v91 = 0;
          }
          else {
            v91 = off_1E59CB948[v90];
          }
          [v17 setSecondaryBadgeSymbol:v91];
          [v17 setHideSecondaryBadgeSymbolBackground:1];
          v119 = (void *)MEMORY[0x1E4FB1830];
          v120 = [MEMORY[0x1E4FB1618] labelColor];
          v154[0] = v120;
          v121 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
          v154[1] = v121;
          v122 = [MEMORY[0x1E4F1C978] arrayWithObjects:v154 count:2];
          v123 = [v119 configurationWithPaletteColors:v122];

          [v17 setSecondaryBadgeSymbolConfiguration:v123];
        }

        BOOL v24 = !v130;
        goto LABEL_80;
      case 1:
        if (v20)
        {
          uint64_t v30 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v23);

          v23 = (void *)v30;
        }
        v31 = [v13 merchant];
        v32 = [v31 displayName];
        [v17 setPrimaryString:v32];

        if (v130)
        {
          [v17 setPrimaryImage:self->_emptyImage];
        }
        else
        {
          v97 = [v31 uniqueIdentifier];
          [v12 setIdentifier:v97];
          iconGenerator = self->_iconGenerator;
          [(PKTransactionGroupItemPresenter *)self _imageSize];
          double v100 = v99;
          double v102 = v101;
          v149[0] = MEMORY[0x1E4F143A8];
          v149[1] = 3221225472;
          v149[2] = __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke;
          v149[3] = &unk_1E59CB810;
          id v150 = v12;
          id v103 = v97;
          id v151 = v103;
          id v152 = v134;
          id v104 = v17;
          id v153 = v104;
          v105 = -[PKPaymentTransactionIconGenerator iconForMerchant:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForMerchant:size:ignoreLogoURL:requestType:iconHandler:", v31, 0, 0, v149, v100, v102);
          if (v105) {
            [v104 setPrimaryImage:v105 animated:0];
          }
          else {
            [v104 setPrimaryImage:self->_emptyImage];
          }
        }
        goto LABEL_79;
      case 2:

        formatterMonth = self->_formatterMonth;
        v34 = [v13 startDate];
        v35 = [(NSDateFormatter *)formatterMonth stringFromDate:v34];
        v36 = objc_msgSend(v35, "pk_uppercaseFirstStringForPreferredLocale");
        [v17 setPrimaryString:v36];

        [v17 setSecondaryString:0];
        [v17 setTertiaryString:0];
        uint64_t v37 = [(PKTransactionGroupItemPresenter *)self transactionListImage];
        goto LABEL_18;
      case 3:

        formatterYear = self->_formatterYear;
        v39 = [v13 startDate];
        v40 = [(NSDateFormatter *)formatterYear stringFromDate:v39];
        v41 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentPas.isa, &stru_1EF1B4C70.isa, v40);
        [v17 setPrimaryString:v41];

        [v17 setSecondaryString:0];
        [v17 setTertiaryString:0];
        uint64_t v37 = [(PKTransactionGroupItemPresenter *)self transactionListImage];
LABEL_18:
        v42 = (void *)v37;
        [v17 setPrimaryImage:v37];

        BOOL v24 = 0;
        v23 = 0;
        goto LABEL_80;
      case 4:
        v43 = [v132 amount];
        v44 = [MEMORY[0x1E4F28C28] zero];
        uint64_t v45 = [v43 compare:v44];

        if (v45 == 1)
        {
          uint64_t v46 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v23);
        }
        else
        {
          uint64_t v46 = 0;
        }

        v94 = PKLocalizedFeatureString();
        [v17 setPrimaryString:v94];

        [v17 setTertiaryString:0];
        if (v130) {
          goto LABEL_53;
        }
        uint64_t v60 = [(PKTransactionGroupItemPresenter *)self cashbackImage];
        goto LABEL_61;
      case 5:
        v47 = [v132 amount];
        v48 = [MEMORY[0x1E4F28C28] zero];
        uint64_t v49 = [v47 compare:v48];

        if (v49 == 1)
        {
          uint64_t v50 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v23);

          v23 = (void *)v50;
        }
        v51 = PKLocalizedFeatureString();
        [v17 setPrimaryString:v51];

        v52 = PKLocalizedFeatureString();
        [v17 setSecondaryString:v52];

        v53 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        v54 = [v13 endDate];
        if ([v53 isDateInToday:v54])
        {
          v55 = PKLocalizedString(&cfstr_RelativeDateTo.isa);
        }
        else
        {
          v114 = PKRelativeDateStringWithFullDateForUnits();
          v55 = objc_msgSend(v114, "pk_uppercaseFirstStringForPreferredLocale");
        }
        [v17 setTertiaryString:v55];

        if (v130)
        {
          [v17 setPrimaryImage:self->_emptyImage];
        }
        else
        {
          v115 = [(PKTransactionGroupItemPresenter *)self appleCardImage];
          [v17 setPrimaryImage:v115];
        }
        goto LABEL_68;
      case 7:
        v56 = PKLocalizedFeatureString();
        [v17 setPrimaryString:v56];

        [v17 setSecondaryString:0];
        [v17 setTertiaryString:0];
        if (v130)
        {
          [v17 setPrimaryImage:self->_emptyImage];
        }
        else
        {
          v53 = [(PKTransactionGroupItemPresenter *)self interestImage];
          [v17 setPrimaryImage:v53];
LABEL_68:
        }
LABEL_69:
        uint64_t v116 = [v13 transactionCount];
        BOOL v24 = 0;
        uint64_t v25 = 1;
        goto LABEL_82;
      case 9:
        uint64_t v57 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v23);

        v58 = PKLocalizedFeatureString();
        [v17 setPrimaryString:v58];

        [v17 setTertiaryString:0];
        if (v130)
        {
          [v17 setPrimaryImage:self->_emptyImage];
        }
        else
        {
          v95 = [(PKTransactionGroupItemPresenter *)self appleCardImage];
          [v17 setPrimaryImage:v95];
        }
        v96 = PKLocalizedString(&cfstr_PaymentsCount.isa, &cfstr_Lu.isa, [v13 transactionCount]);
        [v17 setSecondaryString:v96];

        v23 = (void *)v57;
        goto LABEL_69;
      case 10:
        uint64_t v46 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v23);

        v59 = PKLocalizedFeatureString();
        [v17 setPrimaryString:v59];

        [v17 setTertiaryString:0];
        if (v130)
        {
LABEL_53:
          [v17 setPrimaryImage:self->_emptyImage];
        }
        else
        {
          uint64_t v60 = [(PKTransactionGroupItemPresenter *)self refundsImage];
LABEL_61:
          v113 = (void *)v60;
          [v17 setPrimaryImage:v60];
        }
        BOOL v24 = 0;
        uint64_t v25 = 1;
        v23 = (void *)v46;
        break;
      case 11:
        if (v20)
        {
          uint64_t v61 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EF1B4C70.isa, v23);

          v23 = (void *)v61;
        }
        v62 = PKLocalizedFeatureString();
        [v17 setPrimaryString:v62];

        [v17 setTertiaryString:0];
        if (v130)
        {
          [v17 setPrimaryImage:self->_emptyImage];
        }
        else
        {
          v92 = [(PKTransactionGroupItemPresenter *)self adjustmentsImage];
          [v17 setPrimaryImage:v92];
        }
        goto LABEL_72;
      case 12:
        v27 = [v13 handles];
        v28 = [v27 anyObject];

        [v17 setShowsAvatarView:1];
        [v17 setPrimaryImage:0];
        [v12 setIdentifier:v28];
        if ([(PKContactResolver *)self->_contactResolver hasCachedResultForHandle:v28])
        {
          v29 = [(PKContactResolver *)self->_contactResolver contactForHandle:v28];
          [(PKTransactionGroupItemPresenter *)self _updateAvatarOnTransactionCell:v12 withGroup:v13 contact:v29];
          [(PKTransactionGroupItemPresenter *)self _updatePrimaryLabelOnTransactionCell:v12 withPeerPaymentCounterpartHandle:v28 contact:v29];
        }
        else
        {
          objc_initWeak(&location, self);
          contactResolver = self->_contactResolver;
          v143[0] = MEMORY[0x1E4F143A8];
          v143[1] = 3221225472;
          v143[2] = __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_3;
          v143[3] = &unk_1E59CB860;
          objc_copyWeak(&v147, &location);
          id v144 = v12;
          id v145 = v28;
          id v146 = v13;
          [(PKContactResolver *)contactResolver contactForHandle:v145 withCompletion:v143];

          objc_destroyWeak(&v147);
          objc_destroyWeak(&location);
        }

        goto LABEL_79;
      case 13:
        v63 = [v13 regions];
        v64 = [v63 firstObject];

        [v64 displayRegion];
        double v66 = v65;
        double v68 = v67;
        double v70 = v69;
        double v72 = v71;
        v73 = [v64 localizedName];
        [v12 setIdentifier:v73];
        [v17 setPrimaryString:v73];
        [v17 setTertiaryString:0];
        if (v130)
        {
          [v17 setPrimaryImage:self->_emptyImage];
        }
        else
        {
          objc_initWeak(&location, v12);
          snapshotManager = self->_snapshotManager;
          [(PKTransactionGroupItemPresenter *)self _imageSize];
          double v108 = v107;
          double v110 = v109;
          v111 = [v12 traitCollection];
          v140[0] = MEMORY[0x1E4F143A8];
          v140[1] = 3221225472;
          v140[2] = __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_5;
          v140[3] = &unk_1E59CB888;
          objc_copyWeak(&v142, &location);
          id v141 = v73;
          v112 = -[PKMapsSnapshotManager snapshotForDisplayRegion:size:traitCollection:completion:](snapshotManager, "snapshotForDisplayRegion:size:traitCollection:completion:", v111, v140, v66, v68, v70, v72, v108, v110);

          [v17 setPrimaryImage:v112 animated:0];
          objc_destroyWeak(&v142);
          objc_destroyWeak(&location);
        }

LABEL_79:
        BOOL v24 = 0;
LABEL_80:
        uint64_t v25 = 1;
        break;
      case 16:
        v131 = [v13 familyMember];
        v74 = [v13 accountUser];
        v75 = [v74 altDSID];
        [v12 setIdentifier:v75];
        avatarManager = self->_avatarManager;
        v77 = [v74 altDSID];
        v78 = [(PKContactAvatarManager *)avatarManager cachedAvatarForAltDSID:v77];

        if (v78)
        {
          [v17 setPrimaryImage:v78 animated:0];
        }
        else
        {
          v117 = self->_avatarManager;
          v136[0] = MEMORY[0x1E4F143A8];
          v136[1] = 3221225472;
          v136[2] = __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_7;
          v136[3] = &unk_1E59CB8D8;
          id v137 = v75;
          id v138 = v12;
          id v139 = v17;
          [(PKContactAvatarManager *)v117 avatarForFamilyMember:v131 accountUser:v74 invitation:0 completion:v136];
        }
        v118 = [v13 userDisplayName];
        [v17 setPrimaryString:v118];

        uint64_t v25 = 0;
LABEL_72:
        BOOL v24 = 0;
        break;
      default:
        break;
    }
    uint64_t v116 = [v13 transactionCount];
    v124 = PKLocalizedString(&cfstr_TransactionsCo.isa, &cfstr_Lu.isa, v116);
    [v17 setSecondaryString:v124];

LABEL_82:
    id v125 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([v23 length])
    {
      id v126 = objc_alloc(MEMORY[0x1E4F28B18]);
      v127 = (void *)[v125 copy];
      v128 = (void *)[v126 initWithString:v23 attributes:v127];
    }
    else
    {
      v128 = 0;
    }
    [v17 setTransactionValueAttributedText:v128];
    [v17 setStrokeImage:v25];
    v129 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v17 setSecondaryColor:v129];

    [v17 setShowsDisclosureView:v116 != 0];
    [v17 setAllowPrimaryStringExpansion:v24];
  }
}

void __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_2;
  block[3] = &unk_1E59CB7E8;
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_2(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    return;
  }
  v2 = [*(id *)(a1 + 40) identifier];
  id v3 = *(void **)(a1 + 48);
  id v12 = v2;
  id v4 = v3;
  if (v12 == v4)
  {

LABEL_13:
    id v7 = [*(id *)(a1 + 56) indexPathsForVisibleItems];
    id v8 = [*(id *)(a1 + 56) indexPathForCell:*(void *)(a1 + 40)];
    uint64_t v9 = [v7 containsObject:v8];

    id v10 = *(void **)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 32);
    [v10 setPrimaryImage:v11 animated:v9];
    return;
  }
  if (v12) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    int v6 = [v12 isEqualToString:v4];

    if (!v6) {
      return;
    }
    goto LABEL_13;
  }
}

void __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_4;
  block[3] = &unk_1E59CB838;
  objc_copyWeak(&v10, a1 + 7);
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
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

LABEL_12:
      id WeakRetained = v10;
      goto LABEL_13;
    }
    int v9 = [v5 isEqualToString:v6];

    id WeakRetained = v10;
    if (v9)
    {
LABEL_11:
      [v10 _updateAvatarOnTransactionCell:*(void *)(a1 + 32) withGroup:*(void *)(a1 + 48) contact:*(void *)(a1 + 56)];
      [v10 _updatePrimaryLabelOnTransactionCell:*(void *)(a1 + 32) withPeerPaymentCounterpartHandle:*(void *)(a1 + 40) contact:*(void *)(a1 + 56)];
      goto LABEL_12;
    }
  }
LABEL_13:
}

void __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_6;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v10 = WeakRetained;
    id v3 = [WeakRetained transactionView];
    if (*(void *)(a1 + 32))
    {
      id v4 = [v10 identifier];
      id v5 = *(void **)(a1 + 40);
      id v6 = v4;
      id v7 = v5;
      if (v6 == v7)
      {
      }
      else
      {
        id v8 = v7;
        if (!v6 || !v7)
        {

          goto LABEL_11;
        }
        int v9 = [v6 isEqualToString:v7];

        if (!v9) {
          goto LABEL_11;
        }
      }
      [v3 setPrimaryImage:*(void *)(a1 + 32) animated:1];
    }
LABEL_11:

    id WeakRetained = v10;
  }
}

void __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_7(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_8;
  v5[3] = &unk_1E59CB8B0;
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v9 = a1[6];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __98__PKTransactionGroupItemPresenter__configureCell_forItem_inCollectionView_forIndexPath_forSizing___block_invoke_8(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    return;
  }
  v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) identifier];
  id v4 = v2;
  id v5 = v3;
  if (v4 == v5)
  {

LABEL_8:
    id v7 = *(void **)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 32);
    [v7 setPrimaryImage:v8 animated:1];
    return;
  }
  id v9 = v5;
  if (v4 && v5)
  {
    int v6 = [v4 isEqualToString:v5];

    if (!v6) {
      return;
    }
    goto LABEL_8;
  }
}

- (void)_viewControllerForItem:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 group];
  uint64_t v9 = [v8 type];
  double v107 = [v6 transactionSourceCollection];
  id v10 = [v6 account];
  v105 = [v6 familyCollection];
  v106 = [v6 accountUserCollection];
  uint64_t v11 = [v6 physicalCards];
  if (!self->_paymentDataProvider)
  {
    id v12 = (PKPaymentDataProvider *)objc_alloc_init(MEMORY[0x1E4F84A88]);
    paymentDataProvider = self->_paymentDataProvider;
    self->_paymentDataProvider = v12;
  }
  if (v9 <= 11)
  {
    double v101 = v11;
    id v103 = (void (**)(void, void))v7;
    switch(v9)
    {
      case 0:
        v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F84620]), "initWithMerchantCategory:transactionSourceCollection:paymentDataProvider:", objc_msgSend(v8, "merchantCategory"), v107, self->_paymentDataProvider);
        v41 = [v6 tokens];
        v42 = PKSearchTokensOfGroupTypeFromTokens();
        v43 = [v42 firstObject];
        [v43 group];
        v44 = v8;
        v46 = uint64_t v45 = v10;
        v47 = [v46 merchant];
        [v40 filterMerchant:v47];

        id v10 = v45;
        uint64_t v8 = v44;

        v48 = [v6 tokens];
        uint64_t v49 = PKSearchTokensOfGroupTypeFromTokens();
        uint64_t v50 = PKSearchRegionsFromLocationItems();
        [v40 filterRegions:v50];

        [(PKTransactionGroupItemPresenter *)self _applyTokenFiltersFromItem:v6 toFetcher:v40];
        v51 = [PKTransactionHistoryViewController alloc];
        v52 = v44;
        double v18 = v106;
        int v20 = v105;
        v53 = [(PKTransactionHistoryViewController *)v51 initWithTransactionGroup:v52 transactionSourceCollection:v107 familyCollection:v105 account:v10 accountUserCollection:v106 physicalCards:v101 fetcher:v40 transactionHistory:0 detailViewStyle:0];
        ((void (**)(void, PKTransactionHistoryViewController *))v103)[2](v103, v53);

        uint64_t v11 = v101;
        id v7 = v103;
        goto LABEL_27;
      case 1:
        id v60 = objc_alloc(MEMORY[0x1E4F84620]);
        uint64_t v61 = [v8 merchant];
        v62 = (void *)[v60 initWithMerchant:v61 transactionSourceCollection:v107 paymentDataProvider:self->_paymentDataProvider];

        [(PKTransactionGroupItemPresenter *)self _applyTokenFiltersFromItem:v6 toFetcher:v62];
        v63 = [v6 tokens];
        v64 = PKSearchTokensOfGroupTypeFromTokens();
        double v65 = PKSearchRegionsFromLocationItems();
        [v62 filterRegions:v65];

        double v66 = [v6 tokens];
        double v67 = PKSearchTokensOfGroupTypeFromTokens();
        double v68 = [v67 firstObject];
        double v69 = [v68 group];
        objc_msgSend(v62, "filterCategory:", objc_msgSend(v69, "merchantCategory"));

        objc_initWeak(location, self);
        v108[0] = MEMORY[0x1E4F143A8];
        v108[1] = 3221225472;
        v108[2] = __73__PKTransactionGroupItemPresenter__viewControllerForItem_withCompletion___block_invoke;
        v108[3] = &unk_1E59CB928;
        objc_copyWeak(&v117, location);
        id v70 = v62;
        id v109 = v70;
        id v110 = v107;
        int v20 = v105;
        id v111 = v105;
        id v112 = v10;
        id v113 = v106;
        uint64_t v11 = v101;
        id v114 = v101;
        id v115 = v8;
        id v7 = v103;
        uint64_t v116 = v103;
        [v70 reloadTransactionsWithCompletion:v108];

        objc_destroyWeak(&v117);
        objc_destroyWeak(location);

        goto LABEL_26;
      case 3:
        if (!v10 || [v10 feature] == 2)
        {
          uint64_t v14 = [PKTransactionHistoryViewController alloc];
          [v8 groups];
          id v15 = v97 = v10;
          id v16 = objc_alloc_init(PKTransactionGroupItemPresenter);
          CGFloat v17 = [[PKWorldRegionUpdater alloc] initWithSearchService:0];
          double v18 = v106;
          double v19 = [(PKTransactionHistoryViewController *)v14 initWithTransactionGroups:v15 headerGroup:v8 groupPresenter:v16 regionUpdater:v17 tokens:0 transactionSourceCollection:v107 familyCollection:v105 account:v97 accountUserCollection:v106 physicalCards:v11];

          id v10 = v97;
          (*((void (**)(id, PKTransactionHistoryViewController *))v7 + 2))(v7, v19);

          int v20 = v105;
          goto LABEL_27;
        }
        double v85 = [PKPaymentTransactionsInYearTableViewController alloc];
        v95 = [v8 startDate];
        v86 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        double v100 = self->_paymentDataProvider;
        id v87 = objc_alloc(MEMORY[0x1E4F845E8]);
        id v96 = objc_alloc_init(MEMORY[0x1E4F1B980]);
        v88 = [(PKTransactionGroupItemPresenter *)self _contactKeysToFetch];
        v89 = v87;
        uint64_t v11 = v101;
        unint64_t v90 = (void *)[v89 initWithContactStore:v96 keysToFetch:v88];
        [MEMORY[0x1E4F84E10] sharedService];
        v92 = v91 = v10;
        v93 = [(PKPaymentTransactionsInYearTableViewController *)v85 initWithDateFromYear:v95 calendar:v86 transactionSourceCollection:v107 familyCollection:v105 detailViewStyle:0 paymentServiceDataProvider:v100 contactResolver:v90 peerPaymentWebService:v92 account:v91];

        id v10 = v91;
        ((void (**)(void, PKPaymentTransactionsInYearTableViewController *))v103)[2](v103, v93);

        int v20 = v105;
        id v7 = v103;
LABEL_26:
        double v18 = v106;
        goto LABEL_27;
    }
    goto LABEL_17;
  }
  if (v9 == 12)
  {
    id v54 = objc_alloc(MEMORY[0x1E4F84620]);
    [v8 handles];
    v55 = v10;
    uint64_t v57 = v56 = (void (**)(void, PKTransactionHistoryViewController *))v7;
    v58 = (PKTransactionHistoryViewController *)[v54 initWithCounterpartHandles:v57 transactionSourceCollection:v107 paymentDataProvider:self->_paymentDataProvider];

    [(PKTransactionGroupItemPresenter *)self _applyTokenFiltersFromItem:v6 toFetcher:v58];
    int v20 = v105;
    double v18 = v106;
    v59 = [[PKTransactionHistoryViewController alloc] initWithFetcher:v58 transactionSourceCollection:v107 familyCollection:v105 account:v55 accountUserCollection:v106 physicalCards:v11 featuredTransaction:0 selectedTransactions:0 transactionHistory:0];
    v56[2](v56, v59);

    id v7 = v56;
    id v10 = v55;
LABEL_20:

    goto LABEL_27;
  }
  if (v9 == 13)
  {
    id v71 = objc_alloc(MEMORY[0x1E4F84620]);
    [v8 regions];
    double v72 = v99 = v10;
    v58 = (PKTransactionHistoryViewController *)[v71 initWithRegions:v72 transactionSourceCollection:v107 paymentDataProvider:self->_paymentDataProvider];

    [(PKTransactionGroupItemPresenter *)self _applyTokenFiltersFromItem:v6 toFetcher:v58];
    v73 = [v6 tokens];
    v74 = PKSearchTokensOfGroupTypeFromTokens();
    v75 = [v74 firstObject];
    v76 = [v75 group];
    [v76 merchant];
    v78 = v77 = (void (**)(void, PKTransactionHistoryViewController *))v7;
    [(PKTransactionHistoryViewController *)v58 filterMerchant:v78];

    v79 = [v6 tokens];
    v80 = PKSearchTokensOfGroupTypeFromTokens();
    double v81 = [v80 firstObject];
    CGFloat v82 = [v81 group];
    -[PKTransactionHistoryViewController filterCategory:](v58, "filterCategory:", [v82 merchantCategory]);

    id v10 = v99;
    int v20 = v105;
    double v18 = v106;
    double v83 = [[PKTransactionHistoryViewController alloc] initWithTransactionGroup:v8 transactionSourceCollection:v107 familyCollection:v105 account:v99 accountUserCollection:v106 physicalCards:v11 fetcher:v58 transactionHistory:0 detailViewStyle:0];
    v77[2](v77, v83);

    id v7 = v77;
    goto LABEL_20;
  }
  if (v9 != 16)
  {
LABEL_17:
    double v18 = v106;
    int v20 = v105;
    v58 = [[PKTransactionHistoryViewController alloc] initWithTransactionGroup:v8 transactionSourceCollection:v107 familyCollection:v105 account:v10 accountUserCollection:v106 physicalCards:v11 fetcher:0 transactionHistory:0 detailViewStyle:0];
    (*((void (**)(id, PKTransactionHistoryViewController *))v7 + 2))(v7, v58);
    goto LABEL_20;
  }
  id v104 = (void (**)(void, PKTransactionHistoryViewController *))v7;
  v98 = v10;
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F84620]) initWithTransactionSourceCollection:v107 paymentDataProvider:self->_paymentDataProvider];
  v22 = [v6 tokens];
  v23 = PKSearchTokensOfGroupTypeFromTokens();
  BOOL v24 = [v23 firstObject];
  uint64_t v25 = [v24 group];
  v26 = [v25 merchant];
  [v21 filterMerchant:v26];

  v27 = [v6 tokens];
  v28 = PKSearchTokensOfGroupTypeFromTokens();
  v29 = PKSearchRegionsFromLocationItems();
  [v21 filterRegions:v29];

  uint64_t v30 = [v6 tokens];
  v31 = PKSearchTokensOfGroupTypeFromTokens();
  v32 = [v31 firstObject];
  v33 = [v32 group];
  objc_msgSend(v21, "filterCategory:", objc_msgSend(v33, "merchantCategory"));

  v34 = v21;
  [(PKTransactionGroupItemPresenter *)self _applyTokenFiltersFromItem:v6 toFetcher:v21];
  v35 = [MEMORY[0x1E4F1C9C8] date];
  [v21 setLimit:0 startDate:0 endDate:v35];

  v36 = v8;
  uint64_t v37 = [v8 accountUser];
  if ([v37 isCurrentUser])
  {
    v38 = [v107 paymentPass];
    v39 = [v38 deviceTransactionSourceIdentifiers];
  }
  else
  {
    v39 = [v37 transactionSourceIdentifiers];
  }
  double v102 = v37;
  if ([v39 count]) {
    [v21 filterTransactionSourceIdentifiers:v39];
  }
  v94 = v21;
  uint64_t v8 = v36;
  double v18 = v106;
  int v20 = v105;
  CGFloat v84 = [[PKTransactionHistoryViewController alloc] initWithTransactionGroup:v36 transactionSourceCollection:v107 familyCollection:v105 account:v98 accountUserCollection:v106 physicalCards:v11 fetcher:v94 transactionHistory:0 detailViewStyle:0];
  [(PKTransactionHistoryViewController *)v84 setContactAvatarManager:self->_avatarManager];
  v104[2](v104, v84);

  id v10 = v98;
  id v7 = v104;

LABEL_27:
}

void __73__PKTransactionGroupItemPresenter__viewControllerForItem_withCompletion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __73__PKTransactionGroupItemPresenter__viewControllerForItem_withCompletion___block_invoke_2;
  v5[3] = &unk_1E59CB900;
  objc_copyWeak(&v15, a1 + 12);
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = a1[7];
  id v10 = a1[8];
  id v11 = a1[9];
  id v12 = a1[10];
  id v13 = v3;
  id v14 = a1[11];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v15);
}

void __73__PKTransactionGroupItemPresenter__viewControllerForItem_withCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [[PKTransactionHistoryViewController alloc] initWithFetcher:*(void *)(a1 + 32) transactionSourceCollection:*(void *)(a1 + 40) familyCollection:*(void *)(a1 + 48) account:*(void *)(a1 + 56) accountUserCollection:*(void *)(a1 + 64) physicalCards:*(void *)(a1 + 72) featuredTransaction:0 selectedTransactions:*(void *)(a1 + 80) transactionHistory:*(void *)(a1 + 88)];
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();

    id WeakRetained = v4;
  }
}

- (void)_applyTokenFiltersFromItem:(id)a3 toFetcher:(id)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 tokens];
  id v8 = PKSearchTokensOfTypeFromTokens();
  id v9 = [v8 firstObject];

  id v10 = [v9 startDate];
  v74 = v9;
  id v11 = [v9 endDate];
  v76 = v6;
  [v6 setLimit:0 startDate:v10 endDate:v11];

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = [v5 tokens];
  id v14 = PKSearchTokensOfTypeFromTokens();

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v89 objects:v96 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v90;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v90 != v18) {
          objc_enumerationMutation(v15);
        }
        int v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v89 + 1) + 8 * i), "transactionType"));
        [v12 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v89 objects:v96 count:16];
    }
    while (v17);
  }

  v73 = v12;
  [v76 filterTypes:v12];
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v22 = [v5 tokens];
  v23 = PKSearchTokensOfTypeFromTokens();

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v24 = v23;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v85 objects:v95 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v86;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v86 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v85 + 1) + 8 * j), "transactionSource"));
        [v21 addObject:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v85 objects:v95 count:16];
    }
    while (v26);
  }

  [v76 filterSources:v21];
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v75 = v5;
  v31 = [v5 tokens];
  v32 = PKSearchTokensOfTypeFromTokens();

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v33 = v32;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v81 objects:v94 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v82;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v82 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = [*(id *)(*((void *)&v81 + 1) + 8 * k) transactionStatus];
        v39 = [NSNumber numberWithInteger:v38];
        [v30 addObject:v39];

        if (!v38) {
          [v30 addObject:&unk_1EF2B8A90];
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v81 objects:v94 count:16];
    }
    while (v35);
  }

  [v76 filterStatuses:v30];
  v40 = [v75 tokens];
  v41 = PKSearchTokensOfTypeFromTokens();
  v42 = [v41 firstObject];

  v43 = [v42 amount];
  double v72 = v42;
  objc_msgSend(v76, "filterAmount:comparison:", v43, objc_msgSend(v42, "comparison"));

  v44 = [v75 tokens];
  uint64_t v45 = PKSearchTokensOfTypeFromTokens();
  uint64_t v46 = [v45 firstObject];

  v47 = [v46 rewardsValue];
  id v71 = v46;
  objc_msgSend(v76, "filterRewardsValue:unit:", v47, objc_msgSend(v46, "rewardsValueUnit"));

  v48 = [v75 tokens];
  uint64_t v49 = PKSearchTokensOfTypeFromTokens();
  uint64_t v50 = [v49 firstObject];

  id v70 = v50;
  objc_msgSend(v76, "filterPeerPaymentSubType:", objc_msgSend(v50, "subType"));
  v51 = [v75 tokens];
  v52 = PKSearchTokensOfGroupTypeFromTokens();
  v53 = [v52 firstObject];
  id v54 = [v53 group];
  v55 = [v54 accountUser];

  v56 = [v55 transactionSourceIdentifiers];
  if ([v55 isCurrentUser])
  {
    uint64_t v57 = [v75 transactionSourceCollection];
    v58 = [v57 paymentPass];
    v59 = [v58 deviceTransactionSourceIdentifiers];

    uint64_t v60 = [v56 setByAddingObjectsFromSet:v59];

    v56 = (void *)v60;
  }
  [v76 filterTransactionSourceIdentifiers:v56];
  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v62 = [v75 tokens];
  v63 = PKSearchTokensOfTypeFromTokens();

  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v64 = v63;
  uint64_t v65 = [v64 countByEnumeratingWithState:&v77 objects:v93 count:16];
  if (v65)
  {
    uint64_t v66 = v65;
    uint64_t v67 = *(void *)v78;
    do
    {
      for (uint64_t m = 0; m != v66; ++m)
      {
        if (*(void *)v78 != v67) {
          objc_enumerationMutation(v64);
        }
        double v69 = [*(id *)(*((void *)&v77 + 1) + 8 * m) tag];
        [v61 addObject:v69];
      }
      uint64_t v66 = [v64 countByEnumeratingWithState:&v77 objects:v93 count:16];
    }
    while (v66);
  }

  [v76 filterTags:v61];
}

- (id)_contactKeysToFetch
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v10[0] = v2;
  Class v3 = _MergedGlobals_657();
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  id v5 = -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", [v4 _supportsForceTouch]);
  v10[1] = v5;
  id v6 = [(Class)off_1EB5458F0() descriptorForRequiredKeys];
  uint64_t v7 = *MEMORY[0x1E4F1ADC8];
  v10[2] = v6;
  v10[3] = v7;
  v10[4] = *MEMORY[0x1E4F1AEE0];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:5];

  return v8;
}

- (id)transactionListImage
{
  transactionListImage = self->_transactionListImage;
  if (!transactionListImage)
  {
    id v4 = PKPassKitUIBundle();
    id v5 = [v4 URLForResource:@"Category_Transactions" withExtension:@"pdf"];
    [(PKTransactionGroupItemPresenter *)self _imageSize];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    double v10 = PKUIScreenScale();
    PKUIImageFromPDF(v5, v7, v9, v10);
    id v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    id v12 = self->_transactionListImage;
    self->_transactionListImage = v11;

    transactionListImage = self->_transactionListImage;
  }

  return transactionListImage;
}

- (id)cashbackImage
{
  cashbackImage = self->_cashbackImage;
  if (!cashbackImage)
  {
    id v4 = PKPassKitUIBundle();
    id v5 = [v4 URLForResource:@"CashBackIcon" withExtension:@"pdf"];
    [(PKTransactionGroupItemPresenter *)self _imageSize];
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

- (id)interestImage
{
  interestImage = self->_interestImage;
  if (!interestImage)
  {
    id v4 = PKPassKitUIBundle();
    id v5 = [v4 URLForResource:@"InterestIcon" withExtension:@"pdf"];
    [(PKTransactionGroupItemPresenter *)self _imageSize];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    double v10 = PKUIScreenScale();
    PKUIImageFromPDF(v5, v7, v9, v10);
    id v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    id v12 = self->_interestImage;
    self->_interestImage = v11;

    interestImage = self->_interestImage;
  }

  return interestImage;
}

- (id)appleCardImage
{
  appleCardImage = self->_appleCardImage;
  if (!appleCardImage)
  {
    id v4 = PKPassKitUIBundle();
    id v5 = [v4 URLForResource:@"AppleCardIcon" withExtension:@"pdf"];
    [(PKTransactionGroupItemPresenter *)self _imageSize];
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

- (id)refundsImage
{
  refundsImage = self->_refundsImage;
  if (!refundsImage)
  {
    id v4 = PKPassKitUIBundle();
    id v5 = [v4 URLForResource:@"RefundsIcon" withExtension:@"pdf"];
    [(PKTransactionGroupItemPresenter *)self _imageSize];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    double v10 = PKUIScreenScale();
    PKUIImageFromPDF(v5, v7, v9, v10);
    id v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    id v12 = self->_refundsImage;
    self->_refundsImage = v11;

    refundsImage = self->_refundsImage;
  }

  return refundsImage;
}

- (id)adjustmentsImage
{
  adjustmentsImage = self->_adjustmentsImage;
  if (!adjustmentsImage)
  {
    id v4 = PKPassKitUIBundle();
    id v5 = [v4 URLForResource:@"AdjustmentsIcon" withExtension:@"pdf"];
    [(PKTransactionGroupItemPresenter *)self _imageSize];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    double v10 = PKUIScreenScale();
    PKUIImageFromPDF(v5, v7, v9, v10);
    id v11 = (UIImage *)objc_claimAutoreleasedReturnValue();
    id v12 = self->_adjustmentsImage;
    self->_adjustmentsImage = v11;

    adjustmentsImage = self->_adjustmentsImage;
  }

  return adjustmentsImage;
}

- (CGSize)_imageSize
{
  double v2 = 100.0;
  if (!self->_useAccessibilityLayout) {
    double v2 = 45.0;
  }
  double v3 = v2;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)_updateAvatarOnTransactionCell:(id)a3 withGroup:(id)a4 contact:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  CGFloat v7 = [a3 transactionView];
  double v8 = [v7 avatarView];

  if (v6)
  {
    v13[0] = v6;
    CGFloat v9 = (void *)MEMORY[0x1E4F1C978];
    double v10 = (id *)v13;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    [v6 setContactType:0];
    id v12 = v6;
    CGFloat v9 = (void *)MEMORY[0x1E4F1C978];
    double v10 = &v12;
  }
  id v11 = [v9 arrayWithObjects:v10 count:1];

  [v8 setContacts:v11];
}

- (void)_updatePrimaryLabelOnTransactionCell:(id)a3 withPeerPaymentCounterpartHandle:(id)a4 contact:(id)a5
{
  CGFloat v7 = (void *)MEMORY[0x1E4F84D88];
  id v8 = a3;
  id v10 = [v7 displayNameForCounterpartHandle:a4 contact:a5];
  CGFloat v9 = [v8 transactionView];

  [v9 setPrimaryString:v10];
}

- (PKContactResolver)contactResolver
{
  return self->_contactResolver;
}

- (void)setContactResolver:(id)a3
{
}

- (PKMapsSnapshotManager)snapshotManager
{
  return self->_snapshotManager;
}

- (void)setSnapshotManager:(id)a3
{
}

- (PKPaymentDataProvider)paymentDataProvider
{
  return self->_paymentDataProvider;
}

- (void)setPaymentDataProvider:(id)a3
{
}

- (PKContactAvatarManager)avatarManager
{
  return self->_avatarManager;
}

- (void)setAvatarManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_snapshotManager, 0);
  objc_storeStrong((id *)&self->_iconGenerator, 0);
  objc_storeStrong((id *)&self->_formatterMonth, 0);
  objc_storeStrong((id *)&self->_formatterYear, 0);
  objc_storeStrong((id *)&self->_iconsPerMerchantCategory, 0);
  objc_storeStrong((id *)&self->_adjustmentsImage, 0);
  objc_storeStrong((id *)&self->_refundsImage, 0);
  objc_storeStrong((id *)&self->_appleCardImage, 0);
  objc_storeStrong((id *)&self->_interestImage, 0);
  objc_storeStrong((id *)&self->_transactionListImage, 0);
  objc_storeStrong((id *)&self->_cashbackImage, 0);
  objc_storeStrong((id *)&self->_emptyImage, 0);
  objc_storeStrong((id *)&self->_transactionCellSecondaryLabelFont, 0);
  objc_storeStrong((id *)&self->_transactionCellValueLabelFont, 0);
  objc_storeStrong((id *)&self->_transactionCellPrimaryLabelFont, 0);

  objc_storeStrong((id *)&self->_sampleCell, 0);
}

@end