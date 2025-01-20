@interface PKDashboardDetailHeaderItemPresenter
- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKContactAvatarManager)avatarManager;
- (PKContactResolver)contactResolver;
- (PKDashboardDetailHeaderItemPresenter)init;
- (PKMapsSnapshotManager)snapshotManager;
- (UIColor)shadowColor;
- (UIVisualEffect)overlayEffect;
- (id)_backgroundImageFromLogoImage:(id)a3;
- (id)_installmentProductHeaderCellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)_merchantHeaderCellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)_peerPaymentHeaderCellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)_transactionGroupHeaderCellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)_transactionTypeHeaderCellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCategoryHeaderCell:(id)a3 forItem:(id)a4 isUpdate:(BOOL)a5;
- (void)_configureCell:(id)a3 withRegion:(id)a4 isUpdate:(BOOL)a5;
- (void)_configureInstallmentProductHeaderCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6 downloadImage:(BOOL)a7;
- (void)_configureMerchantHeaderCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6;
- (void)_configurePeerPaymentHeaderCell:(id)a3 forItem:(id)a4;
- (void)_configureTransactionTypeHeaderCell:(id)a3 forItem:(id)a4;
- (void)_downloadLogoForItem:(id)a3 withCompletionHandler:(id)a4;
- (void)_updateMerchantHeaderImagesOnCell:(id)a3 item:(id)a4;
- (void)dealloc;
- (void)setAvatarManager:(id)a3;
- (void)setContactResolver:(id)a3;
- (void)setOverlayEffect:(id)a3;
- (void)setShadowColor:(id)a3;
- (void)setSnapshotManager:(id)a3;
- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6;
@end

@implementation PKDashboardDetailHeaderItemPresenter

- (PKDashboardDetailHeaderItemPresenter)init
{
  v4.receiver = self;
  v4.super_class = (Class)PKDashboardDetailHeaderItemPresenter;
  v2 = [(PKDashboardDetailHeaderItemPresenter *)&v4 init];
  if (v2) {
    v2->_hasNetworkAccess = PKProcessHasNetworkPrivilegies();
  }
  return v2;
}

- (void)dealloc
{
  [(PKObjectDownloader *)self->_fileDownloader invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKDashboardDetailHeaderItemPresenter;
  [(PKDashboardDetailHeaderItemPresenter *)&v3 dealloc];
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  switch([v11 type])
  {
    case 0:
      uint64_t v12 = [(PKDashboardDetailHeaderItemPresenter *)self _merchantHeaderCellForItem:v11 inCollectionView:v9 atIndexPath:v10];
      goto LABEL_8;
    case 1:
      uint64_t v12 = [(PKDashboardDetailHeaderItemPresenter *)self _peerPaymentHeaderCellForItem:v11 inCollectionView:v9 atIndexPath:v10];
      goto LABEL_8;
    case 2:
      uint64_t v12 = [(PKDashboardDetailHeaderItemPresenter *)self _transactionGroupHeaderCellForItem:v11 inCollectionView:v9 atIndexPath:v10];
      goto LABEL_8;
    case 3:
      uint64_t v12 = [(PKDashboardDetailHeaderItemPresenter *)self _transactionTypeHeaderCellForItem:v11 inCollectionView:v9 atIndexPath:v10];
      goto LABEL_8;
    case 4:
      uint64_t v12 = [(PKDashboardDetailHeaderItemPresenter *)self _installmentProductHeaderCellForItem:v11 inCollectionView:v9 atIndexPath:v10];
LABEL_8:
      v13 = (void *)v12;
      break;
    default:
      v13 = 0;
      break;
  }

  return v13;
}

- (id)collectionViewCellClasses
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"PKTransactionHistoryHeaderPresenterMerchantReuseIdentifier";
  v5[0] = objc_opt_class();
  v4[1] = @"PKTransactionHistoryHeaderPresenterPeerPaymentReuseIdentifier";
  v5[1] = objc_opt_class();
  v4[2] = @"PKTransactionHistoryTransactionGroupHeaderCellReuseIdentifier";
  v5[2] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  return 0;
}

- (Class)itemClass
{
  return (Class)objc_opt_class();
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  switch([v11 type])
  {
    case 0:
      if (!self->_templateCell)
      {
        uint64_t v12 = [PKMerchantHeaderCell alloc];
        v13 = -[PKMerchantHeaderCell initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        templateCell = self->_templateCell;
        self->_templateCell = v13;
      }
      break;
    case 1:
      v15 = self->_templateCell;
      if (!v15)
      {
        v16 = [PKTransactionHistoryPeerPaymentHeaderCell alloc];
        v17 = -[PKTransactionHistoryPeerPaymentHeaderCell initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v18 = self->_templateCell;
        self->_templateCell = v17;

        v15 = self->_templateCell;
      }
      [(PKDashboardDetailHeaderItemPresenter *)self _configurePeerPaymentHeaderCell:v15 forItem:v11];
      break;
    case 2:
      v19 = self->_templateCell;
      if (!v19)
      {
        v20 = [PKTransactionHistoryTransactionGroupHeaderCell alloc];
        v21 = -[PKTransactionHistoryTransactionGroupHeaderCell initWithFrame:](v20, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v22 = self->_templateCell;
        self->_templateCell = v21;

        v19 = self->_templateCell;
      }
      [(PKDashboardDetailHeaderItemPresenter *)self _configureCategoryHeaderCell:v19 forItem:v11 isUpdate:0];
      break;
    case 3:
      v23 = self->_templateCell;
      if (!v23)
      {
        v24 = [PKTransactionHistoryTransactionGroupHeaderCell alloc];
        v25 = -[PKTransactionHistoryTransactionGroupHeaderCell initWithFrame:](v24, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v26 = self->_templateCell;
        self->_templateCell = v25;

        v23 = self->_templateCell;
      }
      [(PKDashboardDetailHeaderItemPresenter *)self _configureTransactionTypeHeaderCell:v23 forItem:v11];
      break;
    case 4:
      v27 = self->_templateCell;
      if (!v27)
      {
        v28 = [PKTransactionHistoryTransactionGroupHeaderCell alloc];
        v29 = -[PKTransactionHistoryTransactionGroupHeaderCell initWithFrame:](v28, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v30 = self->_templateCell;
        self->_templateCell = v29;

        v27 = self->_templateCell;
      }
      [(PKDashboardDetailHeaderItemPresenter *)self _configureInstallmentProductHeaderCell:v27 forItem:v11 inCollectionView:v9 atIndexPath:v10 downloadImage:0];
      break;
    default:
      break;
  }
  [v9 bounds];
  double v32 = v31;
  v33 = self->_templateCell;
  [v9 bounds];
  -[UICollectionViewCell sizeThatFits:](v33, "sizeThatFits:", CGRectGetWidth(v41), v32);
  double v35 = v34;
  double v37 = v36;

  double v38 = v35;
  double v39 = v37;
  result.height = v39;
  result.width = v38;
  return result;
}

- (void)updateCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v10;
  switch([v13 type])
  {
    case 0:
      [(PKDashboardDetailHeaderItemPresenter *)self _configureMerchantHeaderCell:v14 forItem:v13 inCollectionView:v11 atIndexPath:v12];
      break;
    case 1:
      [(PKDashboardDetailHeaderItemPresenter *)self _configurePeerPaymentHeaderCell:v14 forItem:v13];
      break;
    case 2:
      [(PKDashboardDetailHeaderItemPresenter *)self _configureCategoryHeaderCell:v14 forItem:v13 isUpdate:1];
      break;
    case 3:
      [(PKDashboardDetailHeaderItemPresenter *)self _configureTransactionTypeHeaderCell:v14 forItem:v13];
      break;
    case 4:
      [(PKDashboardDetailHeaderItemPresenter *)self _configureInstallmentProductHeaderCell:v14 forItem:v13 inCollectionView:v11 atIndexPath:v12 downloadImage:1];
      break;
    default:
      break;
  }
}

- (id)_merchantHeaderCellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"PKTransactionHistoryHeaderPresenterMerchantReuseIdentifier" forIndexPath:v8];
  [(PKDashboardDetailHeaderItemPresenter *)self _configureMerchantHeaderCell:v11 forItem:v10 inCollectionView:v9 atIndexPath:v8];

  return v11;
}

- (id)_installmentProductHeaderCellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"PKTransactionHistoryTransactionGroupHeaderCellReuseIdentifier" forIndexPath:v8];
  [(PKDashboardDetailHeaderItemPresenter *)self _configureInstallmentProductHeaderCell:v11 forItem:v10 inCollectionView:v9 atIndexPath:v8 downloadImage:1];

  return v11;
}

- (void)_configureInstallmentProductHeaderCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6 downloadImage:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v38 = a5;
  id v14 = a6;
  v15 = [v13 installmentProduct];
  v16 = [v15 serialNumber];
  v17 = PKSerialNumber();
  id v18 = v16;
  id v19 = v17;
  if (v18 != v19)
  {
    v20 = v19;
    if (v18 && v19)
    {
      uint64_t v21 = [v18 caseInsensitiveCompare:v19];

      if (!v21) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    v22 = [v15 model];
    v23 = 0;
    goto LABEL_10;
  }

LABEL_7:
  v22 = PKDeviceName();
  v23 = [v15 model];
LABEL_10:
  [v12 setTitle:v22];
  [v12 setSubtitle:v23];
  [v12 setUseShadows:1];
  uint64_t v24 = [v15 iconURLForScale:0 suffix:PKUIScreenScale()];
  v25 = (void *)v24;
  logoImage = self->_logoImage;
  if (!logoImage && v24)
  {
    fileDownloader = self->_fileDownloader;
    if (!fileDownloader)
    {
      v28 = (PKObjectDownloader *)objc_alloc_init(MEMORY[0x1E4F84830]);
      v29 = self->_fileDownloader;
      self->_fileDownloader = v28;

      fileDownloader = self->_fileDownloader;
    }
    v30 = [(PKObjectDownloader *)fileDownloader cachedDataForURL:v25];
    if (v30)
    {
      double v31 = [MEMORY[0x1E4FB1818] imageWithData:v30];
      double v32 = self->_logoImage;
      self->_logoImage = v31;
    }
    else if (v7)
    {
      objc_initWeak(&location, self);
      double v37 = self->_fileDownloader;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __130__PKDashboardDetailHeaderItemPresenter__configureInstallmentProductHeaderCell_forItem_inCollectionView_atIndexPath_downloadImage___block_invoke;
      v39[3] = &unk_1E59DA028;
      objc_copyWeak(&v41, &location);
      id v40 = v12;
      [(PKObjectDownloader *)v37 downloadFromUrl:v25 completionHandler:v39];

      objc_destroyWeak(&v41);
      objc_destroyWeak(&location);
    }

    logoImage = self->_logoImage;
  }
  v33 = logoImage;
  if (!v33)
  {
    double v34 = PKPassKitUIBundle();
    double v35 = [v34 URLForResource:@"InstallmentsFallback" withExtension:@"pdf"];

    if (v35)
    {
      double v36 = PKUIScreenScale();
      PKUIImageFromPDF(v35, 100.0, 100.0, v36);
      v33 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = 0;
    }
  }
  [v12 setImage:v33 animated:0];
}

void __130__PKDashboardDetailHeaderItemPresenter__configureInstallmentProductHeaderCell_forItem_inCollectionView_atIndexPath_downloadImage___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a2 && !a4)
  {
    id v8 = [MEMORY[0x1E4FB1818] imageWithData:a2];
    if (v8)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __130__PKDashboardDetailHeaderItemPresenter__configureInstallmentProductHeaderCell_forItem_inCollectionView_atIndexPath_downloadImage___block_invoke_33;
      block[3] = &unk_1E59CB378;
      objc_copyWeak(&v15, (id *)(a1 + 40));
      id v13 = v8;
      id v14 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E4F14428], block);

      objc_destroyWeak(&v15);
    }
    else
    {
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v7 URL];
        id v11 = [v10 absoluteString];
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "invalid image for URL: %@", buf, 0xCu);
      }
    }
  }
}

void __130__PKDashboardDetailHeaderItemPresenter__configureInstallmentProductHeaderCell_forItem_inCollectionView_atIndexPath_downloadImage___block_invoke_33(id *a1)
{
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_super v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 4, a1[4]);
    [a1[5] setImage:a1[4] animated:1];
    WeakRetained = v3;
  }
}

- (void)_configureMerchantHeaderCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 atIndexPath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v48 = a5;
  id v47 = a6;
  id v12 = [v11 merchant];
  id v13 = v12;
  if (!v12) {
    id v12 = v11;
  }
  uint64_t v14 = [v12 category];
  if ([v13 useDisplayNameIgnoringBrand])
  {
    v46 = [v13 displayNameIgnoringBrand];
    if (!v14) {
      goto LABEL_11;
    }
  }
  else
  {
    id v15 = [v13 displayName];
    v16 = v15;
    if (v15)
    {
      id v17 = v15;
    }
    else
    {
      id v17 = [v11 title];
    }
    v46 = v17;

    if (!v14) {
      goto LABEL_11;
    }
  }
  if ([v11 showDetailedPropertyLocation])
  {
LABEL_11:
    uint64_t v18 = 0;
    goto LABEL_13;
  }
  uint64_t v18 = PKLocalizedStringFromMerchantCategory();
LABEL_13:
  if ([v11 showDetailedPropertyLocation])
  {
    id v19 = [v13 mapsMerchant];
    v20 = [v19 postalAddress];
    uint64_t v21 = PKMerchantFormattedLocationForPostalAddress();

    uint64_t v18 = (void *)v21;
  }
  uint64_t v22 = [v13 logoImageURL];
  uint64_t v23 = v22;
  if (!self->_logoImage && v22)
  {
    fileDownloader = self->_fileDownloader;
    if (!fileDownloader)
    {
      if (self->_hasNetworkAccess)
      {
        v25 = (PKObjectDownloader *)objc_alloc_init(MEMORY[0x1E4F84830]);
        v26 = self->_fileDownloader;
        self->_fileDownloader = v25;

        fileDownloader = self->_fileDownloader;
      }
      else
      {
        fileDownloader = 0;
      }
    }
    v27 = [(PKObjectDownloader *)fileDownloader cachedDataForURL:v23];
    if (v27)
    {
      v28 = [MEMORY[0x1E4FB1818] imageWithData:v27];
      logoImage = self->_logoImage;
      self->_logoImage = v28;

      v30 = [(PKDashboardDetailHeaderItemPresenter *)self _backgroundImageFromLogoImage:self->_logoImage];
      logoBackgroundImage = self->_logoBackgroundImage;
      self->_logoBackgroundImage = v30;
    }
    else
    {
      objc_initWeak(location, self);
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __106__PKDashboardDetailHeaderItemPresenter__configureMerchantHeaderCell_forItem_inCollectionView_atIndexPath___block_invoke;
      v55[3] = &unk_1E59E0DD8;
      objc_copyWeak(&v58, location);
      id v56 = v10;
      id v57 = v11;
      [(PKDashboardDetailHeaderItemPresenter *)self _downloadLogoForItem:v57 withCompletionHandler:v55];

      objc_destroyWeak(&v58);
      objc_destroyWeak(location);
    }
  }
  uint64_t v32 = objc_msgSend(v13, "heroImageURL", v23);
  v33 = (void *)v32;
  if (!self->_heroImage && v32)
  {
    double v34 = self->_fileDownloader;
    if (!v34)
    {
      if (self->_hasNetworkAccess)
      {
        double v35 = (PKObjectDownloader *)objc_alloc_init(MEMORY[0x1E4F84830]);
        double v36 = self->_fileDownloader;
        self->_fileDownloader = v35;

        double v34 = self->_fileDownloader;
      }
      else
      {
        double v34 = 0;
      }
    }
    double v37 = [(PKObjectDownloader *)v34 cachedDataForURL:v33];
    if (v37)
    {
      id v38 = [MEMORY[0x1E4FB1818] imageWithData:v37];
      heroImage = self->_heroImage;
      self->_heroImage = v38;
    }
    else
    {
      objc_initWeak(location, self);
      id v40 = self->_fileDownloader;
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __106__PKDashboardDetailHeaderItemPresenter__configureMerchantHeaderCell_forItem_inCollectionView_atIndexPath___block_invoke_3;
      v51[3] = &unk_1E59CFFA8;
      objc_copyWeak(&v54, location);
      id v52 = v10;
      id v53 = v11;
      [(PKObjectDownloader *)v40 downloadFromUrl:v33 completionHandler:v51];

      objc_destroyWeak(&v54);
      objc_destroyWeak(location);
    }
  }
  id v41 = [v10 headerView];
  [v41 setPrimaryText:v46];
  [v41 setSecondaryText:v18];
  double v42 = PKUIScreenScale();
  v43 = PKColorForMerchantCategory(v42);
  location[0] = 0;
  double v49 = 0.0;
  double v50 = 0.0;
  [v43 getRed:location green:&v50 blue:&v49 alpha:0];
  *(double *)id location = *(double *)location * 0.9;
  double v49 = v49 * 0.9;
  double v50 = v50 * 0.9;
  v44 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:");
  [v41 setFallbackColor:v44];

  [v10 setOverlayEffect:self->_overlayEffect];
  [v10 setShadowColor:self->_shadowColor];
  [(PKDashboardDetailHeaderItemPresenter *)self _updateMerchantHeaderImagesOnCell:v10 item:v11];
}

void __106__PKDashboardDetailHeaderItemPresenter__configureMerchantHeaderCell_forItem_inCollectionView_atIndexPath___block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    if (!a3)
    {
      objc_super v4 = [MEMORY[0x1E4FB1818] imageWithData:a2];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __106__PKDashboardDetailHeaderItemPresenter__configureMerchantHeaderCell_forItem_inCollectionView_atIndexPath___block_invoke_2;
      v6[3] = &unk_1E59CE888;
      objc_copyWeak(&v10, a1 + 6);
      id v7 = v4;
      id v8 = a1[4];
      id v9 = a1[5];
      id v5 = v4;
      dispatch_async(MEMORY[0x1E4F14428], v6);

      objc_destroyWeak(&v10);
    }
  }
}

void __106__PKDashboardDetailHeaderItemPresenter__configureMerchantHeaderCell_forItem_inCollectionView_atIndexPath___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    objc_storeStrong(WeakRetained + 4, *(id *)(a1 + 32));
    uint64_t v3 = [v5 _backgroundImageFromLogoImage:*(void *)(a1 + 32)];
    id v4 = v5[5];
    v5[5] = (id)v3;

    [v5 _updateMerchantHeaderImagesOnCell:*(void *)(a1 + 40) item:*(void *)(a1 + 48)];
    WeakRetained = v5;
  }
}

void __106__PKDashboardDetailHeaderItemPresenter__configureMerchantHeaderCell_forItem_inCollectionView_atIndexPath___block_invoke_3(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    if (!a4)
    {
      id v5 = [MEMORY[0x1E4FB1818] imageWithData:a2];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __106__PKDashboardDetailHeaderItemPresenter__configureMerchantHeaderCell_forItem_inCollectionView_atIndexPath___block_invoke_4;
      v7[3] = &unk_1E59CE888;
      objc_copyWeak(&v11, a1 + 6);
      id v8 = v5;
      id v9 = a1[4];
      id v10 = a1[5];
      id v6 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v7);

      objc_destroyWeak(&v11);
    }
  }
}

void __106__PKDashboardDetailHeaderItemPresenter__configureMerchantHeaderCell_forItem_inCollectionView_atIndexPath___block_invoke_4(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    objc_storeStrong(WeakRetained + 6, *(id *)(a1 + 32));
    [v3 _updateMerchantHeaderImagesOnCell:*(void *)(a1 + 40) item:*(void *)(a1 + 48)];
    WeakRetained = v3;
  }
}

- (void)_updateMerchantHeaderImagesOnCell:(id)a3 item:(id)a4
{
  id v22 = a4;
  id v6 = a3;
  id v7 = [v22 merchant];
  id v8 = [v6 headerView];

  if (v7)
  {
    logoImage = self->_logoImage;
    if (logoImage)
    {
      id v10 = logoImage;
    }
    else
    {
      double v15 = PKUIScreenScale();
      PKIconForMerchant(v7, 0, 0, 0, 73.0, 73.0, v15);
      id v10 = (UIImage *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v14 = v10;
  }
  else
  {
    double v11 = PKUIScreenScale();
    [v22 category];
    double v12 = PKUIScreenScale();
    id v13 = PKColorForMerchantCategory(v12);
    uint64_t v14 = PKUIGenericBusinessIconImage(v13, 73.0, v11);
  }
  [v8 setIconImage:v14];
  heroImage = self->_heroImage;
  if (!heroImage) {
    heroImage = self->_logoBackgroundImage;
  }
  id v17 = heroImage;
  uint64_t v18 = [v8 backgroundImage];
  BOOL v19 = v18 == 0;

  [v8 setBackgroundImage:v17 animated:v19];
  v20 = self->_heroImage;
  if (v20)
  {
    uint64_t v21 = [v7 heroImageAttribution];
    [v8 setAttributionProviderName:v21];
  }
  [v8 setShowsGradientOverlay:v20 != 0];
}

- (id)_backgroundImageFromLogoImage:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1E018];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithOptions:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1E050]) initWithImage:v4];

  id v7 = [MEMORY[0x1E4F1E040] filterWithName:@"CIAffineClamp"];
  [v7 setDefaults];
  uint64_t v8 = *MEMORY[0x1E4F1E480];
  [v7 setValue:v6 forKey:*MEMORY[0x1E4F1E480]];
  id v9 = [MEMORY[0x1E4F1E040] filterWithName:@"CIGaussianBlur"];
  id v10 = [v7 outputImage];
  [v9 setValue:v10 forKey:v8];

  [v9 setValue:&unk_1EF2B9EB8 forKey:*MEMORY[0x1E4F1E4E0]];
  double v11 = [MEMORY[0x1E4F1E040] filterWithName:@"CIColorControls"];
  double v12 = [v9 outputImage];
  [v11 setValue:v12 forKey:v8];

  [v11 setValue:&unk_1EF2B89C0 forKey:*MEMORY[0x1E4F1E4E8]];
  [v6 extent];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  uint64_t v21 = [v11 outputImage];
  id v22 = (CGImage *)objc_msgSend(v5, "createCGImage:fromRect:", v21, v14, v16, v18, v20);

  id v23 = objc_alloc(MEMORY[0x1E4FB17D8]);
  uint64_t v24 = [MEMORY[0x1E4FB17E0] preferredFormat];
  v25 = objc_msgSend(v23, "initWithBounds:format:", v24, v14, v16, v18, v20);

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __70__PKDashboardDetailHeaderItemPresenter__backgroundImageFromLogoImage___block_invoke;
  v28[3] = &__block_descriptor_72_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v28[4] = v14;
  *(double *)&v28[5] = v16;
  *(double *)&v28[6] = v18;
  *(double *)&v28[7] = v20;
  v28[8] = v22;
  v26 = [v25 imageWithActions:v28];
  if (v22) {
    CGImageRelease(v22);
  }

  return v26;
}

void __70__PKDashboardDetailHeaderItemPresenter__backgroundImageFromLogoImage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (CGContext *)[a2 CGContext];
  CGRect v6 = *(CGRect *)(a1 + 32);
  v5.b = 0.0;
  v5.c = 0.0;
  v5.a = 1.0;
  *(_OWORD *)&v5.d = xmmword_1A0443EA0;
  v5.ty = CGRectGetHeight(v6);
  CGContextConcatCTM(v3, &v5);
  CGContextDrawImage(v3, *(CGRect *)(a1 + 32), *(CGImageRef *)(a1 + 64));
  id v4 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
  [v4 setFill];

  CGContextSetBlendMode(v3, kCGBlendModePlusDarker);
  CGContextFillRect(v3, *(CGRect *)(a1 + 32));
}

- (id)_peerPaymentHeaderCellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = [a4 dequeueReusableCellWithReuseIdentifier:@"PKTransactionHistoryHeaderPresenterPeerPaymentReuseIdentifier" forIndexPath:a5];
  [(PKDashboardDetailHeaderItemPresenter *)self _configurePeerPaymentHeaderCell:v9 forItem:v8];

  return v9;
}

- (void)_configurePeerPaymentHeaderCell:(id)a3 forItem:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = [v5 peerPaymentCounterpartHandle];
  id v7 = [v5 contact];

  [v6 configureWithPeerPaymentCounterpartHandle:v8 contact:v7];
}

- (id)_transactionGroupHeaderCellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = [a4 dequeueReusableCellWithReuseIdentifier:@"PKTransactionHistoryTransactionGroupHeaderCellReuseIdentifier" forIndexPath:a5];
  [(PKDashboardDetailHeaderItemPresenter *)self _configureCategoryHeaderCell:v9 forItem:v8 isUpdate:0];

  return v9;
}

- (id)_transactionTypeHeaderCellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = [a4 dequeueReusableCellWithReuseIdentifier:@"PKTransactionHistoryTransactionGroupHeaderCellReuseIdentifier" forIndexPath:a5];
  [(PKDashboardDetailHeaderItemPresenter *)self _configureTransactionTypeHeaderCell:v9 forItem:v8];

  return v9;
}

- (void)_configureTransactionTypeHeaderCell:(id)a3 forItem:(id)a4
{
  id v5 = a3;
  if ([a4 transactionType] == 11)
  {
    PKLocalizedFeatureString();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = PKLocalizedFeatureString();
    id v7 = PKPassKitUIBundle();
    id v8 = [v7 URLForResource:@"InterestIcon" withExtension:@"pdf"];
    double v9 = PKUIScreenScale();
    id v10 = PKUIImageFromPDF(v8, 100.0, 100.0, v9);
  }
  else
  {
    id v11 = 0;
    id v6 = 0;
    id v10 = 0;
  }
  [v5 setTitle:v11];
  [v5 setSubtitle:v6];
  [v5 setImage:v10 animated:0];
}

- (void)_configureCell:(id)a3 withRegion:(id)a4 isUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (!self->_snapshotManager)
  {
    id v10 = objc_alloc_init(PKMapsSnapshotManager);
    snapshotManager = self->_snapshotManager;
    self->_snapshotManager = v10;
  }
  [v9 displayRegion];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  objc_initWeak(&location, v8);
  double v20 = self->_snapshotManager;
  uint64_t v21 = [v8 traitCollection];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __75__PKDashboardDetailHeaderItemPresenter__configureCell_withRegion_isUpdate___block_invoke;
  v26 = &unk_1E59CFB58;
  objc_copyWeak(&v27, &location);
  id v22 = -[PKMapsSnapshotManager snapshotForDisplayRegion:size:traitCollection:completion:](v20, "snapshotForDisplayRegion:size:traitCollection:completion:", v21, &v23, v13, v15, v17, v19, 100.0, 100.0);

  objc_msgSend(v8, "setImage:animated:", v22, v5, v23, v24, v25, v26);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

void __75__PKDashboardDetailHeaderItemPresenter__configureCell_withRegion_isUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__PKDashboardDetailHeaderItemPresenter__configureCell_withRegion_isUpdate___block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __75__PKDashboardDetailHeaderItemPresenter__configureCell_withRegion_isUpdate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id v4 = WeakRetained;
      [WeakRetained setImage:v3 animated:1];
      id WeakRetained = v4;
    }
  }
}

- (void)_configureCategoryHeaderCell:(id)a3 forItem:(id)a4 isUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 transactionGroup];
  unint64_t v11 = [v10 type];
  uint64_t v12 = [v9 featureIdentifier];
  uint64_t v13 = 1;
  switch(v11)
  {
    case 0uLL:
    case 0xFuLL:
      uint64_t v14 = [v10 merchantCategory];
      double v15 = PKLocalizedStringFromMerchantCategory();
      [v8 setTitle:v15];

      double v16 = PKUIScreenScale();
      double v17 = PKIconForMerchantCategory(100.0, 100.0, v16, v14, 0, 0);
      [v8 setImage:v17 animated:0];

      uint64_t v13 = 1;
      if (v11 > 0xF) {
        goto LABEL_35;
      }
      if (((1 << v11) & 0xA553) != 0) {
        goto LABEL_21;
      }
      if (v11 != 14) {
        goto LABEL_35;
      }
      goto LABEL_78;
    case 1uLL:
      goto LABEL_21;
    case 2uLL:
      double v18 = [v10 startDate];
      uint64_t v19 = PKMonthAndYearStringFromDate();
      goto LABEL_8;
    case 3uLL:
      double v18 = [v10 startDate];
      uint64_t v19 = PKYearStringFromDate();
LABEL_8:
      double v20 = (void *)v19;
      [v8 setTitle:v19];

      [v8 setImage:0 animated:0];
      goto LABEL_34;
    case 4uLL:
      uint64_t v21 = PKLocalizedFeatureString();
      [v8 setTitle:v21];

      id v22 = PKPassKitUIBundle();
      uint64_t v23 = v22;
      uint64_t v24 = @"CashBackIcon";
      goto LABEL_17;
    case 5uLL:
      v25 = PKLocalizedFeatureString();
      [v8 setTitle:v25];

      v26 = PKLocalizedFeatureString();
      [v8 setSubtitle:v26];

      id v27 = PKPassKitUIBundle();
      v28 = v27;
      v29 = @"AppleCardIcon";
      goto LABEL_32;
    case 6uLL:
      v30 = PKLocalizedFeatureString();
      [v8 setTitle:v30];

      id v22 = PKPassKitUIBundle();
      uint64_t v23 = v22;
      uint64_t v24 = @"SpendingIcon";
      goto LABEL_17;
    case 7uLL:
      uint64_t v31 = v12;
      uint64_t v32 = PKLocalizedFeatureString();
      [v8 setTitle:v32];

      if (v31 == 5)
      {
        v67 = PKLocalizedString(&cfstr_TransactionsCo.isa, &cfstr_Lu.isa, [v9 historyCount]);
        [v8 setSubtitle:v67];

        id v27 = PKPassKitUIBundle();
        v28 = v27;
        v29 = @"SAVINGS_Interest";
      }
      else
      {
        if (v31 != 2) {
          goto LABEL_34;
        }
        v33 = PKLocalizedFeatureString();
        [v8 setSubtitle:v33];

        id v27 = PKPassKitUIBundle();
        v28 = v27;
        v29 = @"InterestIcon";
      }
LABEL_32:
      v68 = [v27 URLForResource:v29 withExtension:@"pdf"];
      double v69 = PKUIScreenScale();
      v70 = PKUIImageFromPDF(v68, 100.0, 100.0, v69);
      [v8 setImage:v70 animated:0];

LABEL_33:
LABEL_34:
      uint64_t v13 = 1;
      goto LABEL_35;
    case 8uLL:
    case 0xAuLL:
      double v39 = PKLocalizedFeatureString();
      [v8 setTitle:v39];

      id v22 = PKPassKitUIBundle();
      uint64_t v23 = v22;
      uint64_t v24 = @"RefundsIcon";
LABEL_17:
      id v40 = [v22 URLForResource:v24 withExtension:@"pdf"];
      double v41 = PKUIScreenScale();
      double v42 = PKUIImageFromPDF(v40, 100.0, 100.0, v41);
      [v8 setImage:v42 animated:0];

      goto LABEL_20;
    case 9uLL:
      double v34 = PKLocalizedFeatureString();
      [v8 setTitle:v34];

      double v35 = PKPassKitUIBundle();
      double v36 = [v35 URLForResource:@"AppleCardIcon" withExtension:@"pdf"];
      double v37 = PKUIScreenScale();
      id v38 = PKUIImageFromPDF(v36, 100.0, 100.0, v37);
      [v8 setImage:v38 animated:0];

      v28 = PKLocalizedFeatureString();
      [v8 setSubtitle:v28];
      goto LABEL_33;
    case 0xBuLL:
      v43 = PKLocalizedFeatureString();
      [v8 setTitle:v43];

      id v27 = PKPassKitUIBundle();
      v28 = v27;
      v29 = @"AdjustmentsIcon";
      goto LABEL_32;
    case 0xDuLL:
      v44 = [v10 regions];
      v45 = [v44 firstObject];

      v46 = [v45 localizedName];
      [v8 setTitle:v46];

      [(PKDashboardDetailHeaderItemPresenter *)self _configureCell:v8 withRegion:v45 isUpdate:v5];
LABEL_20:
      uint64_t v13 = 1;
      goto LABEL_21;
    case 0xEuLL:
      double v50 = [v10 searchQuery];
      v51 = [v50 tokens];
      unint64_t v52 = [v51 count];

      switch(v52)
      {
        case 1uLL:
          id v53 = [v50 locationTokens];
          uint64_t v54 = [v53 count];

          if (v54)
          {
            v176 = [v50 locationTokens];
            v55 = [v176 lastObject];
            id v56 = [v55 group];
            [v56 regions];
            v58 = id v57 = v50;
            v59 = [v58 firstObject];

            double v50 = v57;
            [(PKDashboardDetailHeaderItemPresenter *)self _configureCell:v8 withRegion:v59 isUpdate:v5];
LABEL_43:

LABEL_44:
            int v107 = 0;
            goto LABEL_65;
          }
          v102 = [v50 categoryToken];

          if (v102)
          {
            v103 = [v50 categoryToken];
            v104 = [v103 group];
            uint64_t v105 = [v104 merchantCategory];

            double v106 = PKUIScreenScale();
            v59 = PKIconForMerchantCategory(100.0, 100.0, v106, v105, 0, 0);
            [v8 setImage:v59 animated:0];
            goto LABEL_43;
          }
          v108 = [v50 transactionTypes];
          uint64_t v109 = [v108 count];

          if (v109)
          {
            v110 = [v50 transactionTypes];
            v111 = [v110 firstObject];
            uint64_t v112 = [v111 integerValue];

            int v107 = 1;
            uint64_t v13 = 1;
            switch(v112)
            {
              case 1:
                v113 = PKLocalizedFeatureString();
                [v8 setTitle:v113];

                v114 = PKPassKitUIBundle();
                v115 = v114;
                v116 = @"RefundsIcon";
                goto LABEL_59;
              case 2:
              case 3:
              case 4:
              case 8:
              case 9:
                goto LABEL_66;
              case 5:
                v138 = @"TRANSACTION_TYPE_WITHDRAWAL_GENERIC";
                goto LABEL_55;
              case 6:
                v138 = @"TRANSACTION_TYPE_TOP_UP";
LABEL_55:
                v139 = PKLocalizedPaymentString(&v138->isa);
                [v8 setTitle:v139];

                v114 = PKPassKitUIBundle();
                v115 = v114;
                v116 = @"CashBackIcon";
                goto LABEL_59;
              case 7:
                v140 = PKLocalizedFeatureString();
                [v8 setTitle:v140];

                v114 = PKPassKitUIBundle();
                v115 = v114;
                v116 = @"AdjustmentsIcon";
                goto LABEL_59;
              case 10:
                v141 = PKLocalizedFeatureString();
                [v8 setTitle:v141];

                v142 = PKPassKitUIBundle();
                v143 = [v142 URLForResource:@"AppleCardIcon" withExtension:@"pdf"];
                double v144 = PKUIScreenScale();
                v145 = PKUIImageFromPDF(v143, 100.0, 100.0, v144);
                [v8 setImage:v145 animated:0];

                v115 = PKLocalizedFeatureString();
                [v8 setSubtitle:v115];
                goto LABEL_60;
              case 11:
                v146 = PKLocalizedFeatureString();
                [v8 setTitle:v146];

                v147 = PKLocalizedFeatureString();
                [v8 setSubtitle:v147];

                v114 = PKPassKitUIBundle();
                v115 = v114;
                v116 = @"InterestIcon";
LABEL_59:
                v148 = [v114 URLForResource:v116 withExtension:@"pdf"];
                double v149 = PKUIScreenScale();
                v150 = PKUIImageFromPDF(v148, 100.0, 100.0, v149);
                [v8 setImage:v150 animated:0];

LABEL_60:
                uint64_t v13 = 1;
                break;
              default:
                goto LABEL_65;
            }
            goto LABEL_77;
          }
          v117 = [v50 transactionSources];
          uint64_t v118 = [v117 count];

          if (v118)
          {
            v119 = (void *)MEMORY[0x1E4FB1818];
            v120 = [MEMORY[0x1E4FB1830] configurationWithPointSize:100.0];
            v121 = [v119 _systemImageNamed:@"applecard.fill" withConfiguration:v120];
            v122 = [MEMORY[0x1E4FB1618] whiteColor];
            v123 = [v121 imageWithTintColor:v122];

            v124 = PKPassKitUIBundle();
            v125 = [v124 URLForResource:@"AppleCardSquareBackground" withExtension:@"pdf"];
            double v126 = PKUIScreenScale();
            v127 = PKUIImageFromPDF(v125, 100.0, 100.0, v126);
            v128 = ApplySymbolToBackgroundImage(v123, v127);

            [v8 setImage:v128 animated:0];
LABEL_82:

            goto LABEL_44;
          }
          v129 = [v50 dateToken];

          if (v129)
          {
            v130 = (void *)MEMORY[0x1E4FB1818];
            v131 = [MEMORY[0x1E4FB1830] configurationWithPointSize:100.0];
            v132 = [v130 systemImageNamed:@"calendar" withConfiguration:v131];
            v133 = [MEMORY[0x1E4FB1618] whiteColor];
            v123 = [v132 imageWithTintColor:v133];

            if ([v9 featureIdentifier] == 2)
            {
              v134 = PKPassKitUIBundle();
              v135 = [v134 URLForResource:@"AppleCardSquareBackground" withExtension:@"pdf"];
              double v136 = PKUIScreenScale();
              v137 = PKUIImageFromPDF(v135, 100.0, 100.0, v136);
            }
            else
            {
              v134 = [MEMORY[0x1E4FB1618] blackColor];
              v137 = ImageOfSizeAndColor(v134, 100.0, 100.0);
            }

            v173 = ApplySymbolToBackgroundImage(v123, v137);
            [v8 setImage:v173 animated:0];

            goto LABEL_82;
          }
          v151 = [v50 accountUserToken];

          if (v151)
          {
            v177 = v50;
            v152 = [v50 accountUserToken];
            v153 = [v152 group];

            v154 = [v153 familyMember];
            v155 = [v153 accountUser];
            avatarManager = self->_avatarManager;
            v157 = [v155 altDSID];
            v158 = [(PKContactAvatarManager *)avatarManager cachedAvatarForAltDSID:v157];

            if (v158)
            {
              [v8 setImage:v158 animated:0];
            }
            else
            {
              v174 = self->_avatarManager;
              v188[0] = MEMORY[0x1E4F143A8];
              v188[1] = 3221225472;
              v188[2] = __86__PKDashboardDetailHeaderItemPresenter__configureCategoryHeaderCell_forItem_isUpdate___block_invoke_3;
              v188[3] = &unk_1E59CA898;
              id v189 = v8;
              [(PKContactAvatarManager *)v174 avatarForFamilyMember:v154 accountUser:v155 invitation:0 completion:v188];
            }
            v175 = [v153 userDisplayName];
            [v8 setTitle:v175];

            int v107 = 0;
            uint64_t v13 = 0;
            double v50 = v177;
          }
          else
          {
LABEL_64:
            int v107 = 1;
LABEL_65:
            uint64_t v13 = 1;
          }
LABEL_66:
          v159 = [v50 tokens];
          v160 = [v159 firstObject];

          if (v160)
          {
            id v178 = 0;
            PKSearchAutoCompletionTextAndImageFromSuggestion(&v178, 0, 0, v160, self->_contactResolver);
            id v161 = v178;
            [v8 setTitle:v161];
          }
          else
          {
            id v161 = [v50 text];
            if ([v161 length]) {
              PKLocalizedString(&cfstr_SearchTextResu.isa, &stru_1EF1B4C70.isa, v161);
            }
            else {
            v162 = PKLocalizedString(&cfstr_SearchResults.isa);
            }
            [v8 setTitle:v162];
          }
          if (v107)
          {
LABEL_73:
            v163 = (void *)MEMORY[0x1E4FB1818];
            v164 = [MEMORY[0x1E4FB1830] configurationWithPointSize:100.0];
            v165 = [v163 systemImageNamed:@"magnifyingglass" withConfiguration:v164];
            v166 = [MEMORY[0x1E4FB1618] whiteColor];
            v167 = [v165 imageWithTintColor:v166];

            if ([v9 featureIdentifier] == 2)
            {
              v168 = PKPassKitUIBundle();
              v169 = [v168 URLForResource:@"AppleCardSquareBackground" withExtension:@"pdf"];
              double v170 = PKUIScreenScale();
              v171 = PKUIImageFromPDF(v169, 100.0, 100.0, v170);
            }
            else
            {
              v168 = [MEMORY[0x1E4FB1618] blackColor];
              v171 = ImageOfSizeAndColor(v168, 100.0, 100.0);
            }

            v172 = ApplySymbolToBackgroundImage(v167, v171);
            [v8 setImage:v172 animated:0];
          }
LABEL_77:

LABEL_78:
          uint64_t v47 = [v10 transactionCount];
          if (v47)
          {
LABEL_22:
            uint64_t v48 = PKLocalizedString(&cfstr_TransactionsCo.isa, &cfstr_Lu.isa, v47);
          }
          else
          {
            uint64_t v48 = PKLocalizedString(&cfstr_Loading_1.isa);
          }
          double v49 = (void *)v48;
          [v8 setSubtitle:v48];

LABEL_35:
          [v8 setStrokeImage:v13];

          return;
        case 2uLL:
          id v187 = 0;
          v72 = [v50 tokens];
          v73 = [v72 objectAtIndex:0];
          uint64_t v13 = 1;
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v187, 0, 1, v73, self->_contactResolver);
          id v74 = v187;

          id v186 = 0;
          v75 = [v50 tokens];
          v76 = [v75 objectAtIndex:1];
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v186, 0, 1, v76, self->_contactResolver);
          id v77 = v186;

          v78 = PKLocalizedString(&cfstr_SearchResultsT.isa, &stru_1EF1B5770.isa, v74, v77);
          [v8 setTitle:v78];

          goto LABEL_73;
        case 3uLL:
          id v185 = 0;
          v79 = [v50 tokens];
          v80 = [v79 objectAtIndex:0];
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v185, 0, 1, v80, self->_contactResolver);
          id v81 = v185;

          id v184 = 0;
          v82 = [v50 tokens];
          v83 = [v82 objectAtIndex:1];
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v184, 0, 1, v83, self->_contactResolver);
          id v84 = v184;

          id v183 = 0;
          v85 = [v50 tokens];
          v86 = [v85 objectAtIndex:2];
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v183, 0, 1, v86, self->_contactResolver);
          id v87 = v183;

          v88 = PKLocalizedString(&cfstr_SearchResultsT_0.isa, &stru_1EF1B9A70.isa, v81, v84, v87);
          [v8 setTitle:v88];

          uint64_t v13 = 1;
          goto LABEL_73;
        case 4uLL:
          id v182 = 0;
          v89 = [v50 tokens];
          v90 = [v89 objectAtIndex:0];
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v182, 0, 1, v90, self->_contactResolver);
          id v91 = v182;

          id v181 = 0;
          v92 = [v50 tokens];
          v93 = [v92 objectAtIndex:1];
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v181, 0, 1, v93, self->_contactResolver);
          id v94 = v181;

          id v180 = 0;
          v95 = [v50 tokens];
          v96 = [v95 objectAtIndex:2];
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v180, 0, 1, v96, self->_contactResolver);
          id v97 = v180;

          id v179 = 0;
          v98 = [v50 tokens];
          v99 = [v98 objectAtIndex:3];
          PKSearchAutoCompletionTextAndImageFromSuggestion(&v179, 0, 1, v99, self->_contactResolver);
          id v100 = v179;

          v101 = PKLocalizedString(&cfstr_SearchResultsF.isa, &stru_1EF1BA430.isa, v91, v94, v97, v100);
          [v8 setTitle:v101];

          uint64_t v13 = 1;
          goto LABEL_73;
        default:
          if (v52 < 5) {
            goto LABEL_64;
          }
          v71 = PKLocalizedString(&cfstr_SearchResults.isa);
          [v8 setTitle:v71];

          uint64_t v13 = 1;
          goto LABEL_73;
      }
    case 0x10uLL:
      v60 = [v10 familyMember];
      v61 = [v10 accountUser];
      v62 = self->_avatarManager;
      v63 = [v61 altDSID];
      v64 = [(PKContactAvatarManager *)v62 cachedAvatarForAltDSID:v63];

      if (v64)
      {
        [v8 setImage:v64 animated:0];
      }
      else
      {
        v65 = self->_avatarManager;
        v190[0] = MEMORY[0x1E4F143A8];
        v190[1] = 3221225472;
        v190[2] = __86__PKDashboardDetailHeaderItemPresenter__configureCategoryHeaderCell_forItem_isUpdate___block_invoke;
        v190[3] = &unk_1E59CA898;
        id v191 = v8;
        [(PKContactAvatarManager *)v65 avatarForFamilyMember:v60 accountUser:v61 invitation:0 completion:v190];
      }
      v66 = [v10 userDisplayName];
      [v8 setTitle:v66];

      uint64_t v13 = 0;
LABEL_21:
      uint64_t v47 = [v10 transactionCount];
      goto LABEL_22;
    default:
      goto LABEL_35;
  }
}

void __86__PKDashboardDetailHeaderItemPresenter__configureCategoryHeaderCell_forItem_isUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__PKDashboardDetailHeaderItemPresenter__configureCategoryHeaderCell_forItem_isUpdate___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __86__PKDashboardDetailHeaderItemPresenter__configureCategoryHeaderCell_forItem_isUpdate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40) animated:1];
}

void __86__PKDashboardDetailHeaderItemPresenter__configureCategoryHeaderCell_forItem_isUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __86__PKDashboardDetailHeaderItemPresenter__configureCategoryHeaderCell_forItem_isUpdate___block_invoke_4;
  v5[3] = &unk_1E59CA870;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __86__PKDashboardDetailHeaderItemPresenter__configureCategoryHeaderCell_forItem_isUpdate___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40) animated:1];
}

- (void)_downloadLogoForItem:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_hasNetworkAccess)
  {
    fileDownloader = self->_fileDownloader;
    id v9 = [v6 merchant];
    id v10 = [v9 logoImageURL];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __83__PKDashboardDetailHeaderItemPresenter__downloadLogoForItem_withCompletionHandler___block_invoke;
    v17[3] = &unk_1E59CE028;
    id v18 = v7;
    [(PKObjectDownloader *)fileDownloader downloadFromUrl:v10 completionHandler:v17];
  }
  else
  {
    paymentService = self->_paymentService;
    if (!paymentService)
    {
      uint64_t v12 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E4F84C38]);
      uint64_t v13 = self->_paymentService;
      self->_paymentService = v12;

      paymentService = self->_paymentService;
    }
    uint64_t v14 = [v6 transaction];
    double v15 = [v14 merchant];
    double v16 = [v15 logoImageURL];
    [(PKPaymentService *)paymentService logoImageDataForURL:v16 completion:v7];
  }
}

uint64_t __83__PKDashboardDetailHeaderItemPresenter__downloadLogoForItem_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PKMapsSnapshotManager)snapshotManager
{
  return self->_snapshotManager;
}

- (void)setSnapshotManager:(id)a3
{
}

- (PKContactResolver)contactResolver
{
  return self->_contactResolver;
}

- (void)setContactResolver:(id)a3
{
}

- (PKContactAvatarManager)avatarManager
{
  return self->_avatarManager;
}

- (void)setAvatarManager:(id)a3
{
}

- (UIVisualEffect)overlayEffect
{
  return self->_overlayEffect;
}

- (void)setOverlayEffect:(id)a3
{
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_overlayEffect, 0);
  objc_storeStrong((id *)&self->_avatarManager, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_snapshotManager, 0);
  objc_storeStrong((id *)&self->_heroImage, 0);
  objc_storeStrong((id *)&self->_logoBackgroundImage, 0);
  objc_storeStrong((id *)&self->_logoImage, 0);
  objc_storeStrong((id *)&self->_templateCell, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);

  objc_storeStrong((id *)&self->_fileDownloader, 0);
}

@end