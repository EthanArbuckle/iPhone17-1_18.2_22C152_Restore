@interface PKTransactionGroupThumbnailPresenter
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKContactAvatarManager)avatarManager;
- (PKMapsSnapshotManager)snapshotManager;
- (PKPaymentDataProvider)paymentDataProvider;
- (PKTransactionGroupThumbnailPresenter)init;
- (double)thumbnailWidth;
- (id)_contactKeysToFetch;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_updateAvatarOnThumbnailCell:(id)a3 contact:(id)a4;
- (void)_updateTitleOnThumbnailCell:(id)a3 withPeerPaymentCounterpartHandle:(id)a4 contact:(id)a5;
- (void)setAvatarManager:(id)a3;
- (void)setPaymentDataProvider:(id)a3;
- (void)setSnapshotManager:(id)a3;
- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5;
- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6;
@end

@implementation PKTransactionGroupThumbnailPresenter

- (PKTransactionGroupThumbnailPresenter)init
{
  v16.receiver = self;
  v16.super_class = (Class)PKTransactionGroupThumbnailPresenter;
  v2 = [(PKTransactionGroupThumbnailPresenter *)&v16 init];
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
    v9 = [(PKTransactionGroupThumbnailPresenter *)v2 _contactKeysToFetch];
    uint64_t v10 = [v7 initWithContactStore:v8 keysToFetch:v9];
    contactResolver = v2->_contactResolver;
    v2->_contactResolver = (PKContactResolver *)v10;

    v12 = [PKThumbnailCollectionViewCell alloc];
    uint64_t v13 = -[PKThumbnailCollectionViewCell initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKThumbnailCollectionViewCell *)v13;
  }
  return v2;
}

- (double)thumbnailWidth
{
  unint64_t v2 = PKUIGetMinScreenWidthType();
  double result = dbl_1A0445CF0[v2 < 5];
  if (!v2) {
    return 65.0;
  }
  return result;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (id)collectionViewCellClasses
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"PKTransactionGroupThumbnailPresenterIdentifier";
  v5[0] = objc_opt_class();
  unint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"PKTransactionGroupThumbnailPresenterIdentifier" forIndexPath:v8];
  [(PKTransactionGroupThumbnailPresenter *)self updateCell:v11 forItem:v10 inCollectionView:v9 atIndexPath:v8];

  return v11;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v58 = a5;
  id v12 = a6;
  id v13 = v10;
  v14 = [v11 group];
  [(PKTransactionGroupThumbnailPresenter *)self thumbnailWidth];
  CGFloat v16 = v15;
  objc_initWeak(location, self);
  uint64_t v17 = [v14 type];
  uint64_t v18 = 0;
  id v19 = 0;
  uint64_t v20 = 1;
  if (v17 <= 11)
  {
    if (!v17)
    {
      uint64_t v52 = objc_msgSend(v14, "merchantCategory", 0);
      v27 = PKLocalizedStringFromMerchantCategory();
      [v13 setTitle:v27];
      [v13 setIdentifier:v27];
      v28 = [NSNumber numberWithInteger:v52];
      v53 = [(NSCache *)self->_iconsPerMerchantCategory objectForKey:v28];
      if (!v53)
      {
        double v54 = PKUIScreenScale();
        v53 = PKIconForMerchantCategory(v16, v16, v54, v52, 0, 0);
        if (v53) {
          [(NSCache *)self->_iconsPerMerchantCategory setObject:v53 forKey:v28];
        }
      }
      [v13 setImage:v53 animated:0];

      goto LABEL_18;
    }
    if (v17 != 1) {
      goto LABEL_22;
    }
    v27 = objc_msgSend(v14, "merchant", 0);
    v28 = [v27 displayName];
    v29 = [v27 uniqueIdentifier];
    [v13 setTitle:v28];
    [v13 setIdentifier:v29];
    iconGenerator = self->_iconGenerator;
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke;
    v70[3] = &unk_1E59D0EB8;
    objc_copyWeak(&v73, location);
    id v31 = v29;
    id v71 = v31;
    id v32 = v13;
    id v72 = v32;
    v33 = -[PKPaymentTransactionIconGenerator iconForMerchant:size:ignoreLogoURL:requestType:iconHandler:](iconGenerator, "iconForMerchant:size:ignoreLogoURL:requestType:iconHandler:", v27, 0, 0, v70, v16, v16);
    [v32 setImage:v33 animated:0];

    p_id from = &v73;
LABEL_13:
    objc_destroyWeak(p_from);

LABEL_18:
    id v19 = 0;
    uint64_t v18 = 0;
LABEL_21:
    uint64_t v20 = 1;
    goto LABEL_22;
  }
  switch(v17)
  {
    case 12:
      v35 = objc_msgSend(v14, "handles", 0);
      id v19 = [v35 anyObject];

      [v13 setIdentifier:v19];
      int v36 = [(PKContactResolver *)self->_contactResolver hasCachedResultForHandle:v19];
      contactResolver = self->_contactResolver;
      if (v36)
      {
        v38 = [(PKContactResolver *)self->_contactResolver contactForHandle:v19];
        [(PKTransactionGroupThumbnailPresenter *)self _updateAvatarOnThumbnailCell:v13 contact:v38];
        [(PKTransactionGroupThumbnailPresenter *)self _updateTitleOnThumbnailCell:v13 withPeerPaymentCounterpartHandle:v19 contact:v38];
      }
      else
      {
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_3;
        v66[3] = &unk_1E59D6D70;
        objc_copyWeak(&v69, location);
        id v19 = v19;
        id v67 = v19;
        id v68 = v13;
        [(PKContactResolver *)contactResolver contactForHandle:v19 withCompletion:v66];

        objc_destroyWeak(&v69);
      }
      uint64_t v18 = 1;
      goto LABEL_21;
    case 13:
      v39 = objc_msgSend(v14, "regions", 0);
      v27 = [v39 firstObject];

      v28 = [v27 localizedName];
      v40 = [v27 identifier];
      [v13 setTitle:v28];
      [v13 setIdentifier:v40];
      [v27 displayRegion];
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;
      objc_initWeak(&from, v13);
      snapshotManager = self->_snapshotManager;
      v50 = [v58 traitCollection];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_5;
      v62[3] = &unk_1E59CB888;
      objc_copyWeak(&v64, &from);
      id v31 = v40;
      id v63 = v31;
      v51 = -[PKMapsSnapshotManager snapshotForDisplayRegion:size:traitCollection:completion:](snapshotManager, "snapshotForDisplayRegion:size:traitCollection:completion:", v50, v62, v42, v44, v46, v48, v16, v16);

      [v13 setImage:v51 animated:0];
      objc_destroyWeak(&v64);
      p_id from = &from;
      goto LABEL_13;
    case 16:
      v21 = objc_msgSend(v14, "familyMember", 0);
      v22 = [v14 accountUser];
      v23 = [v22 altDSID];
      [v13 setIdentifier:v23];
      avatarManager = self->_avatarManager;
      v25 = [v22 altDSID];
      v26 = [(PKContactAvatarManager *)avatarManager cachedAvatarForAltDSID:v25];

      if (v26)
      {
        [v13 setImage:v26 animated:0];
      }
      else
      {
        v56 = self->_avatarManager;
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_7;
        v59[3] = &unk_1E59CA910;
        id v60 = v23;
        id v61 = v13;
        [(PKContactAvatarManager *)v56 avatarForFamilyMember:v21 accountUser:v22 invitation:0 completion:v59];
      }
      v57 = [v14 userDisplayName];
      [v13 setTitle:v57];

      id v19 = 0;
      uint64_t v18 = 0;
      uint64_t v20 = 0;
      break;
  }
LABEL_22:
  [v13 showAvatarView:v18];
  v55 = [MEMORY[0x1E4FB1618] clearColor];
  [v13 setBackgroundColor:v55];

  [v13 setWantsCustomAppearance:1];
  [v13 setWantsDefaultHighlightBehavior:0];
  [v13 setShowsBottomSeparator:0];
  [v13 setStrokeImage:v20];
  objc_destroyWeak(location);
}

void __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_2;
  v5[3] = &unk_1E59CE888;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v9 = WeakRetained;
    id v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 48) identifier];
    id v5 = v3;
    id v6 = v4;
    if (v5 == v6)
    {
    }
    else
    {
      id v7 = v6;
      if (!v5 || !v6)
      {

        goto LABEL_11;
      }
      int v8 = [v5 isEqualToString:v6];

      id WeakRetained = v9;
      if (!v8) {
        goto LABEL_12;
      }
    }
    [*(id *)(a1 + 48) setImage:*(void *)(a1 + 32) animated:1];
LABEL_11:
    id WeakRetained = v9;
  }
LABEL_12:
}

void __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_4;
  v5[3] = &unk_1E59CE888;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    id v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) identifier];
    id v5 = v3;
    id v6 = v4;
    if (v5 == v6)
    {
    }
    else
    {
      id v7 = v6;
      if (!v5 || !v6)
      {

        goto LABEL_10;
      }
      int v8 = [v5 isEqualToString:v6];

      id WeakRetained = v9;
      if (!v8) {
        goto LABEL_11;
      }
    }
    [v9 _updateAvatarOnThumbnailCell:*(void *)(a1 + 40) contact:*(void *)(a1 + 48)];
    [v9 _updateTitleOnThumbnailCell:*(void *)(a1 + 40) withPeerPaymentCounterpartHandle:*(void *)(a1 + 32) contact:*(void *)(a1 + 48)];
LABEL_10:
    id WeakRetained = v9;
  }
LABEL_11:
}

void __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_6;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v3 = *(void **)(a1 + 40);
    id v9 = WeakRetained;
    id v4 = [WeakRetained identifier];
    id v5 = v3;
    id v6 = v4;
    if (v5 == v6)
    {
    }
    else
    {
      id v7 = v6;
      if (!v5 || !v6)
      {

        goto LABEL_11;
      }
      int v8 = [v5 isEqualToString:v6];

      id WeakRetained = v9;
      if (!v8) {
        goto LABEL_12;
      }
    }
    [v9 setImage:*(void *)(a1 + 32) animated:1];
LABEL_11:
    id WeakRetained = v9;
  }
LABEL_12:
}

void __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_8;
  block[3] = &unk_1E59CA8E8;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __88__PKTransactionGroupThumbnailPresenter_updateCell_forItem_inCollectionView_atIndexPath___block_invoke_8(uint64_t a1)
{
  if (!*(void *)(a1 + 32)) {
    return;
  }
  unint64_t v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) identifier];
  id v4 = v2;
  id v5 = v3;
  if (v4 == v5)
  {

LABEL_8:
    id v7 = *(void **)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 32);
    [v7 setImage:v8 animated:0];
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

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  sampleCell = self->_sampleCell;
  [(PKTransactionGroupThumbnailPresenter *)self thumbnailWidth];

  -[PKThumbnailCollectionViewCell sizeThatFits:](sampleCell, "sizeThatFits:");
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)traitCollectionDidChangeFromTrait:(id)a3 toTrait:(id)a4 inCollectionView:(id)a5
{
  id v7 = a4;
  uint64_t v8 = [a3 userInterfaceStyle];
  uint64_t v9 = [v7 userInterfaceStyle];

  if (v8 != v9)
  {
    mapsPlaceholderImage = self->_mapsPlaceholderImage;
    self->_mapsPlaceholderImage = 0;
  }
  id v11 = [PKThumbnailCollectionViewCell alloc];
  id v12 = -[PKThumbnailCollectionViewCell initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  sampleCell = self->_sampleCell;
  self->_sampleCell = v12;
}

- (id)_contactKeysToFetch
{
  v10[5] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v10[0] = v2;
  Class v3 = _MergedGlobals_669();
  id v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  id v5 = -[objc_class descriptorForRequiredKeysWithThreeDTouchEnabled:](v3, "descriptorForRequiredKeysWithThreeDTouchEnabled:", [v4 _supportsForceTouch]);
  v10[1] = v5;
  double v6 = [(Class)off_1EB545A00() descriptorForRequiredKeys];
  uint64_t v7 = *MEMORY[0x1E4F1ADC8];
  v10[2] = v6;
  v10[3] = v7;
  v10[4] = *MEMORY[0x1E4F1AEE0];
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:5];

  return v8;
}

- (void)_updateAvatarOnThumbnailCell:(id)a3 contact:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = [a3 avatarView];
  if (v5)
  {
    v11[0] = v5;
    uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v8 = (id *)v11;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    [v5 setContactType:0];
    id v10 = v5;
    uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v8 = &v10;
  }
  uint64_t v9 = [v7 arrayWithObjects:v8 count:1];

  [v6 setContacts:v9];
}

- (void)_updateTitleOnThumbnailCell:(id)a3 withPeerPaymentCounterpartHandle:(id)a4 contact:(id)a5
{
  uint64_t v7 = (void *)MEMORY[0x1E4F84D88];
  id v8 = a3;
  id v9 = [v7 displayNameForCounterpartHandle:a4 contact:a5];
  [v8 setTitle:v9];
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
  objc_storeStrong((id *)&self->_sampleCell, 0);
  objc_storeStrong((id *)&self->_snapshotManager, 0);
  objc_storeStrong((id *)&self->_mapsPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_iconsPerMerchantCategory, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);

  objc_storeStrong((id *)&self->_iconGenerator, 0);
}

@end