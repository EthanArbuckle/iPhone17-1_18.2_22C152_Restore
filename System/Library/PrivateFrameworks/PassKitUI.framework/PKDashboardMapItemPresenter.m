@interface PKDashboardMapItemPresenter
- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (Class)itemClass;
- (PKDashboardMapItemPresenter)init;
- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5;
- (id)collectionViewCellClasses;
- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6;
- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7;
@end

@implementation PKDashboardMapItemPresenter

- (PKDashboardMapItemPresenter)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKDashboardMapItemPresenter;
  v2 = [(PKDashboardMapItemPresenter *)&v7 init];
  if (v2)
  {
    v3 = [PKPaymentTransactionMapCollectionViewCell alloc];
    uint64_t v4 = -[PKPaymentTransactionMapCollectionViewCell initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    sampleCell = v2->_sampleCell;
    v2->_sampleCell = (PKPaymentTransactionMapCollectionViewCell *)v4;
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
  uint64_t v4 = @"TransactionMapItemCellReuseIdentifier";
  v5[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (BOOL)canSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v5 = a3;
  v6 = [v5 merchant];
  if (!v6)
  {
    objc_super v7 = [v5 transaction];
    v6 = [v7 merchant];
  }
  if ([v6 useRawMerchantData])
  {
    BOOL v8 = 0;
  }
  else
  {
    v9 = [v6 mapsMerchant];
    BOOL v8 = v9 != 0;
  }
  return v8;
}

- (void)didSelectItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5 navigationController:(id)a6 canPresent:(id)a7
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v33 = a6;
  id v15 = a7;
  if (!self->_loadingMapsViewController)
  {
    id v32 = v12;
    v16 = [v32 merchant];
    v17 = [v16 mapsMerchant];

    if (v17) {
      goto LABEL_4;
    }
    v18 = [v32 transaction];
    v19 = [v18 merchant];
    v17 = [v19 mapsMerchant];

    if (v17)
    {
LABEL_4:
      uint64_t v20 = [v17 identifier];
      if (v20)
      {
        v21 = (void *)v20;
        self->_loadingMapsViewController = 1;
        v22 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
        dispatch_time_t v23 = dispatch_time(0, 1000000000);
        dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __106__PKDashboardMapItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke;
        handler[3] = &unk_1E59CA8E8;
        v24 = v22;
        v42 = v24;
        id v30 = v13;
        id v43 = v30;
        id v29 = v14;
        id v44 = v29;
        dispatch_source_set_event_handler(v24, handler);
        dispatch_resume(v24);
        id v31 = objc_alloc_init(MEMORY[0x1E4F30EF0]);
        v25 = [NSNumber numberWithUnsignedLongLong:v21];
        v45[0] = v25;
        v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
        [v31 _setMuids:v26];

        objc_initWeak(&location, self);
        v27 = (void *)[objc_alloc(MEMORY[0x1E4F30ED8]) initWithRequest:v31];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __106__PKDashboardMapItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_2;
        v34[3] = &unk_1E59DC798;
        v28 = v24;
        v35 = v28;
        objc_copyWeak(v39, &location);
        id v38 = v15;
        id v36 = v30;
        id v37 = v29;
        v39[1] = v21;
        [v27 startWithCompletionHandler:v34];

        objc_destroyWeak(v39);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __106__PKDashboardMapItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(a1 + 32);
  if (v2) {
    dispatch_source_cancel(v2);
  }
  id v3 = [*(id *)(a1 + 40) cellForItemAtIndexPath:*(void *)(a1 + 48)];
  [v3 setShowSpinner:1];
}

void __106__PKDashboardMapItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __106__PKDashboardMapItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_3;
  v10[3] = &unk_1E59DC770;
  id v11 = *(id *)(a1 + 32);
  objc_copyWeak(v17, (id *)(a1 + 64));
  id v16 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v14 = v6;
  objc_super v7 = *(void **)(a1 + 72);
  id v15 = v5;
  v17[1] = v7;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(v17);
}

void __106__PKDashboardMapItemPresenter_didSelectItem_inCollectionView_atIndexPath_navigationController_canPresent___block_invoke_3(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(a1 + 32);
  if (v2) {
    dispatch_source_cancel(v2);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 16) = 0;
    uint64_t v5 = *(void *)(a1 + 72);
    if (!v5 || (*(unsigned int (**)(void))(v5 + 16))())
    {
      id v6 = [*(id *)(a1 + 40) cellForItemAtIndexPath:*(void *)(a1 + 48)];
      [v6 setShowSpinner:0];
      if (*(void *)(a1 + 56)
        || ([*(id *)(a1 + 64) mapItems],
            id v11 = objc_claimAutoreleasedReturnValue(),
            uint64_t v12 = [v11 count],
            v11,
            !v12))
      {
        objc_super v7 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v8 = *(void *)(a1 + 88);
          uint64_t v9 = *(void *)(a1 + 56);
          if (v9)
          {
            v10 = [*(id *)(a1 + 56) localizedDescription];
          }
          else
          {
            v10 = @"no map items.";
          }
          int v24 = 134218242;
          uint64_t v25 = v8;
          __int16 v26 = 2112;
          v27 = v10;
          _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "PKDashboardTransactionMapItemPresenter: MKLocalSearch could not resolve merchant maps for mapsID: %llu. Error: %@", (uint8_t *)&v24, 0x16u);
          if (v9) {
        }
          }
        v19 = (void *)MEMORY[0x1E4FB1418];
        uint64_t v20 = PKLocalizedPaymentString(&cfstr_DashboardMapsM.isa);
        id v16 = [v19 alertControllerWithTitle:0 message:v20 preferredStyle:1];

        v21 = (void *)MEMORY[0x1E4FB1410];
        v22 = PKLocalizedPaymentString(&cfstr_DashboardMapsM_0.isa);
        dispatch_time_t v23 = [v21 actionWithTitle:v22 style:0 handler:0];
        [(PKMerchantMapViewController *)v16 addAction:v23];

        v17 = objc_msgSend(*(id *)(a1 + 40), "pkui_viewControllerFromResponderChain");
        [v17 presentViewController:v16 animated:1 completion:0];
      }
      else
      {
        id v13 = [PKMerchantMapViewController alloc];
        id v14 = [*(id *)(a1 + 64) mapItems];
        id v15 = [v14 firstObject];
        id v16 = [(PKMerchantMapViewController *)v13 initWithMapItem:v15];

        v17 = objc_msgSend(*(id *)(a1 + 40), "pkui_viewControllerFromResponderChain");
        v18 = [v17 navigationController];
        [v18 pushViewController:v16 animated:1];
      }
    }
  }
}

- (id)cellForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v9 dequeueReusableCellWithReuseIdentifier:@"TransactionMapItemCellReuseIdentifier" forIndexPath:v8];
  [(PKDashboardMapItemPresenter *)self _configureCell:v11 forItem:v10 inCollectionView:v9 forIndexPath:v8];

  return v11;
}

- (CGSize)sizeForItem:(id)a3 inCollectionView:(id)a4 atIndexPath:(id)a5
{
  sampleCell = self->_sampleCell;
  id v9 = a4;
  [(PKDashboardMapItemPresenter *)self _configureCell:sampleCell forItem:a3 inCollectionView:v9 forIndexPath:a5];
  id v10 = self->_sampleCell;
  [v9 bounds];
  double v12 = v11;

  -[PKPaymentTransactionMapCollectionViewCell sizeThatFits:](v10, "sizeThatFits:", v12, 1.79769313e308);
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_configureCell:(id)a3 forItem:(id)a4 inCollectionView:(id)a5 forIndexPath:(id)a6
{
  id v22 = a3;
  id v8 = a4;
  id v9 = [v8 transaction];
  [v22 setItem:v8];
  id v10 = [v22 mapView];
  [v10 setTransaction:v9];

  double v11 = [v8 merchant];

  if (!v11)
  {
    double v11 = [v9 merchant];
  }
  double v12 = [v22 mapView];
  [v12 setMerchant:v11];

  if ([v11 useRawMerchantData])
  {
    BOOL v13 = 0;
  }
  else
  {
    double v14 = [v11 mapsMerchant];
    BOOL v13 = v14 != 0;
  }
  [v22 setShowDisclosureIndicator:v13];
  [v22 setShowSpinner:self->_loadingMapsViewController];
  id v15 = [v11 displayName];
  if ([v11 useDisplayNameIgnoringBrand])
  {
    uint64_t v16 = [v11 displayNameIgnoringBrand];

    id v15 = (void *)v16;
  }
  v17 = [v9 displayLocation];

  if (v17)
  {
    if (v15)
    {
      v18 = NSString;
      v19 = [v9 displayLocation];
      uint64_t v20 = [v18 stringWithFormat:@"%@, %@", v15, v19];

      id v15 = (void *)v20;
    }
    else
    {
      id v15 = [v9 displayLocation];
    }
  }
  v21 = [v22 titleLabel];
  [v21 setText:v15];
}

- (void).cxx_destruct
{
}

@end