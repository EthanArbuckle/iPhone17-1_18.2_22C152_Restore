@interface PKTransactionMapView
- ($C846FE40A8D09208926C31003B561A94)_mapRectForTransaction:(id)a3;
- (BOOL)showsMerchantName;
- (BOOL)usesDarkAppearance;
- (PKMerchant)merchant;
- (PKPaymentTransaction)transaction;
- (PKTransactionMapView)initWithFrame:(CGRect)a3;
- (id)_annotationsForTransaction:(id)a3;
- (id)_locationShifter;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (void)_centerMapAnimated:(BOOL)a3;
- (void)_createAnnotationsForTransaction:(id)a3;
- (void)_shiftLocationIfNeeded:(id)a3 completion:(id)a4;
- (void)_updateLocations;
- (void)layoutSubviews;
- (void)setMerchant:(id)a3;
- (void)setShowsMerchantName:(BOOL)a3;
- (void)setTransaction:(id)a3;
- (void)setUsesDarkAppearance:(BOOL)a3;
@end

@implementation PKTransactionMapView

- (PKTransactionMapView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PKTransactionMapView;
  v3 = -[PKTransactionMapView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F30F50]);
    [(PKTransactionMapView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    internalMapView = v3->_internalMapView;
    v3->_internalMapView = (MKMapView *)v5;

    [(MKMapView *)v3->_internalMapView setMapType:0];
    [(MKMapView *)v3->_internalMapView setShowsBuildings:1];
    v7 = v3->_internalMapView;
    v8 = [MEMORY[0x1E4F30FE0] filterIncludingAllCategories];
    [(MKMapView *)v7 setPointOfInterestFilter:v8];

    [(MKMapView *)v3->_internalMapView setDelegate:v3];
    [(MKMapView *)v3->_internalMapView setShowsAttribution:0];
    [(MKMapView *)v3->_internalMapView setUserInteractionEnabled:0];
    [(PKTransactionMapView *)v3 addSubview:v3->_internalMapView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PKTransactionMapView;
  [(PKTransactionMapView *)&v11 layoutSubviews];
  [(PKTransactionMapView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[MKMapView setFrame:](self->_internalMapView, "setFrame:");
  v12.origin.x = v4;
  v12.origin.y = v6;
  v12.size.width = v8;
  v12.size.height = v10;
  if (!CGRectEqualToRect(v12, self->_lastLaidBounds)) {
    [(PKTransactionMapView *)self _centerMapAnimated:1];
  }
}

- (void)setTransaction:(id)a3
{
  double v5 = (PKPaymentTransaction *)a3;
  if (self->_transaction != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_transaction, a3);
    CGFloat v6 = [(MKMapView *)self->_internalMapView annotations];
    if ([v6 count]) {
      [(MKMapView *)self->_internalMapView removeAnnotations:v6];
    }
    [(PKTransactionMapView *)self _updateLocations];

    double v5 = v7;
  }
}

- (void)setMerchant:(id)a3
{
  double v5 = (PKMerchant *)a3;
  if (self->_merchant != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_merchant, a3);
    CGFloat v6 = [(MKMapView *)self->_internalMapView annotations];
    if ([v6 count]) {
      [(MKMapView *)self->_internalMapView removeAnnotations:v6];
    }
    [(PKTransactionMapView *)self _updateLocations];

    double v5 = v7;
  }
}

- (void)setUsesDarkAppearance:(BOOL)a3
{
  if (((!self->_usesDarkAppearance ^ a3) & 1) == 0)
  {
    self->_usesDarkAppearance = a3;
    -[MKMapView _setShowsNightMode:](self->_internalMapView, "_setShowsNightMode:");
  }
}

- (void)_createAnnotationsForTransaction:(id)a3
{
  id v4 = [(PKTransactionMapView *)self _annotationsForTransaction:a3];
  if ([v4 count]) {
    [(MKMapView *)self->_internalMapView addAnnotations:v4];
  }
  [(PKTransactionMapView *)self _centerMapAnimated:1];
}

- (void)_centerMapAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  p_lastLaidBounds = &self->_lastLaidBounds;
  [(PKTransactionMapView *)self bounds];
  p_lastLaidBounds->origin.x = v6;
  p_lastLaidBounds->origin.y = v7;
  p_lastLaidBounds->size.width = v8;
  p_lastLaidBounds->size.height = v9;
  [(PKTransactionMapView *)self _mapRectForTransaction:self->_transaction];
  internalMapView = self->_internalMapView;

  -[MKMapView setVisibleMapRect:animated:](internalMapView, "setVisibleMapRect:animated:", v3);
}

- (id)_annotationsForTransaction:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!v4)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    goto LABEL_7;
  }
  uint64_t v6 = [v4 transactionType];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v6 != 2)
  {
LABEL_7:
    if (!self->_preferredLocation) {
      goto LABEL_20;
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F30FD8]);
    [(CLLocation *)self->_preferredLocation coordinate];
    objc_msgSend(v9, "setCoordinate:");
    if (self->_showsMerchantName)
    {
      CGFloat v10 = [v5 merchant];
      merchant = v10;
      if (!v10) {
        merchant = self->_merchant;
      }
      CGRect v12 = merchant;

      v13 = [(PKMerchant *)v12 displayName];
      if (([(PKMerchant *)v12 useRawMerchantData] & 1) == 0)
      {
        v14 = [(PKMerchant *)v12 mapsMerchant];
        uint64_t v15 = [v14 name];
        v16 = (void *)v15;
        if (v15) {
          v17 = (void *)v15;
        }
        else {
          v17 = v13;
        }
        id v18 = v17;

        v13 = v18;
      }
      [v9 setTitle:v13];
    }
    goto LABEL_19;
  }
  if (!self->_startStationLocation)
  {
    if (self->_endStationLocation) {
      goto LABEL_18;
    }
    goto LABEL_7;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F30FD8]);
  [(CLLocation *)self->_startStationLocation coordinate];
  objc_msgSend(v8, "setCoordinate:");
  [v7 addObject:v8];

  if (self->_endStationLocation)
  {
LABEL_18:
    id v9 = objc_alloc_init(MEMORY[0x1E4F30FD8]);
    [(CLLocation *)self->_endStationLocation coordinate];
    objc_msgSend(v9, "setCoordinate:");
LABEL_19:
    [v7 addObject:v9];
  }
LABEL_20:
  v19 = (void *)[v7 copy];

  return v19;
}

- ($C846FE40A8D09208926C31003B561A94)_mapRectForTransaction:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (!v4 || [v4 transactionType] != 2) {
    goto LABEL_7;
  }
  startStationLocation = self->_startStationLocation;
  endStationLocation = self->_endStationLocation;
  if (!startStationLocation)
  {
    if (endStationLocation)
    {
LABEL_10:
      v20 = endStationLocation;
      goto LABEL_11;
    }
LABEL_7:
    v20 = self->_preferredLocation;
    if (!v20)
    {
      double v13 = *MEMORY[0x1E4F30D98];
      double v15 = *(double *)(MEMORY[0x1E4F30D98] + 8);
      double v17 = *(double *)(MEMORY[0x1E4F30D98] + 16);
      double v19 = *(double *)(MEMORY[0x1E4F30D98] + 24);
      goto LABEL_12;
    }
LABEL_11:
    uint64_t v21 = [(CLLocation *)v20 coordinate];
    CLLocationDegrees v23 = v22;
    CLLocationDegrees v25 = v24;
    double v26 = MEMORY[0x1A6220CC0](v21) * 300.0;
    v34.latitude = v23;
    v34.longitude = v25;
    MKMapPoint v27 = MKMapPointForCoordinate(v34);
    double v13 = v27.x - v26;
    double v15 = v27.y - v26;
    double v19 = v26 + v26;

    double v17 = v19;
    goto LABEL_12;
  }
  if (!endStationLocation)
  {
    endStationLocation = self->_startStationLocation;
    goto LABEL_10;
  }
  [(CLLocation *)startStationLocation coordinate];
  MKMapPointForCoordinate(v32);
  [(CLLocation *)self->_endStationLocation coordinate];
  MKMapPointForCoordinate(v33);
  [(CLLocation *)self->_startStationLocation coordinate];
  double v9 = v8;
  uint64_t v10 = [(CLLocation *)self->_endStationLocation coordinate];
  MEMORY[0x1A6220CC0](v10, (v9 + v11) * 0.5);
  [(PKTransactionMapView *)self bounds];
  _MKMapRectThatFits();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
LABEL_12:

  double v28 = v13;
  double v29 = v15;
  double v30 = v17;
  double v31 = v19;
  result.var1.var1 = v31;
  result.var1.var0 = v30;
  result.var0.var1 = v29;
  result.var0.var0 = v28;
  return result;
}

- (void)_updateLocations
{
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__7;
  v37[4] = __Block_byref_object_dispose__7;
  BOOL v3 = [(PKPaymentTransaction *)self->_transaction preferredLocation];
  id v4 = v3;
  if (v3)
  {
    id v38 = v3;
  }
  else
  {
    double v5 = [(PKMerchant *)self->_merchant mapsMerchant];
    id v38 = [v5 location];
  }
  uint64_t v31 = 0;
  CLLocationCoordinate2D v32 = &v31;
  uint64_t v33 = 0x3032000000;
  CLLocationCoordinate2D v34 = __Block_byref_object_copy__7;
  v35 = __Block_byref_object_dispose__7;
  id v36 = [(PKPaymentTransaction *)self->_transaction startStationLocation];
  uint64_t v25 = 0;
  double v26 = &v25;
  uint64_t v27 = 0x3032000000;
  double v28 = __Block_byref_object_copy__7;
  double v29 = __Block_byref_object_dispose__7;
  id v30 = [(PKPaymentTransaction *)self->_transaction endStationLocation];
  uint64_t v6 = [(PKPaymentTransaction *)self->_transaction transactionType];
  id v7 = objc_alloc_init(MEMORY[0x1E4F84518]);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PKTransactionMapView__updateLocations__block_invoke;
  aBlock[3] = &unk_1E59CF1B0;
  id v8 = v7;
  id v22 = v8;
  objc_copyWeak(&v23, &location);
  double v9 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  if (v6 == 2)
  {
    uint64_t v10 = [(PKPaymentTransaction *)self->_transaction startStationLocation];
    if (v10)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __40__PKTransactionMapView__updateLocations__block_invoke_4;
      v20[3] = &unk_1E59CF1D8;
      v20[4] = &v31;
      v9[2](v9, v10, v20);
    }
    double v11 = [(PKPaymentTransaction *)self->_transaction endStationLocation];

    if (v11)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __40__PKTransactionMapView__updateLocations__block_invoke_5;
      v19[3] = &unk_1E59CF1D8;
      v19[4] = &v25;
      v9[2](v9, v11, v19);
    }
  }
  else
  {
    double v11 = 0;
  }
  if (!v32[5] && !v26[5])
  {
    uint64_t v12 = [(PKPaymentTransaction *)self->_transaction preferredLocation];

    double v11 = (void *)v12;
    if (v12
      || ([(PKMerchant *)self->_merchant mapsMerchant],
          double v13 = objc_claimAutoreleasedReturnValue(),
          [v13 location],
          double v11 = objc_claimAutoreleasedReturnValue(),
          v13,
          v11))
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __40__PKTransactionMapView__updateLocations__block_invoke_6;
      v18[3] = &unk_1E59CF1D8;
      v18[4] = v37;
      v9[2](v9, v11, v18);
    }
  }
  double v14 = [MEMORY[0x1E4F1CA98] null];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __40__PKTransactionMapView__updateLocations__block_invoke_7;
  v16[3] = &unk_1E59CF228;
  objc_copyWeak(&v17, &location);
  v16[4] = v37;
  v16[5] = &v31;
  v16[6] = &v25;
  id v15 = (id)[v8 evaluateWithInput:v14 completion:v16];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v37, 8);
}

void __40__PKTransactionMapView__updateLocations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__PKTransactionMapView__updateLocations__block_invoke_2;
    v8[3] = &unk_1E59CF188;
    objc_copyWeak(&v11, (id *)(a1 + 40));
    id v9 = v5;
    id v10 = v6;
    [v7 addOperation:v8];

    objc_destroyWeak(&v11);
  }
}

void __40__PKTransactionMapView__updateLocations__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __40__PKTransactionMapView__updateLocations__block_invoke_3;
    v10[3] = &unk_1E59CF160;
    uint64_t v9 = *(void *)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v13 = v7;
    id v11 = v6;
    [WeakRetained _shiftLocationIfNeeded:v9 completion:v10];
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }
}

uint64_t __40__PKTransactionMapView__updateLocations__block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

void __40__PKTransactionMapView__updateLocations__block_invoke_4(uint64_t a1, void *a2)
{
}

void __40__PKTransactionMapView__updateLocations__block_invoke_5(uint64_t a1, void *a2)
{
}

void __40__PKTransactionMapView__updateLocations__block_invoke_6(uint64_t a1, void *a2)
{
}

void __40__PKTransactionMapView__updateLocations__block_invoke_7(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __40__PKTransactionMapView__updateLocations__block_invoke_8;
    aBlock[3] = &unk_1E59CF200;
    void aBlock[4] = WeakRetained;
    long long v11 = *(_OWORD *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 48);
    id v6 = (void (**)(void))_Block_copy(aBlock);
    id v7 = v6;
    if (a2)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__PKTransactionMapView__updateLocations__block_invoke_9;
      block[3] = &unk_1E59CAA98;
      uint64_t v9 = v6;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      v6[2](v6);
    }
  }
}

uint64_t __40__PKTransactionMapView__updateLocations__block_invoke_8(void *a1)
{
  objc_storeStrong((id *)(a1[4] + 456), *(id *)(*(void *)(a1[5] + 8) + 40));
  objc_storeStrong((id *)(a1[4] + 464), *(id *)(*(void *)(a1[6] + 8) + 40));
  objc_storeStrong((id *)(a1[4] + 472), *(id *)(*(void *)(a1[7] + 8) + 40));
  v2 = (void *)a1[4];
  uint64_t v3 = v2[61];

  return [v2 _createAnnotationsForTransaction:v3];
}

uint64_t __40__PKTransactionMapView__updateLocations__block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_shiftLocationIfNeeded:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6 && [MEMORY[0x1E4F310E8] isLocationShiftRequiredForLocation:v6])
    {
      id v8 = [(PKTransactionMapView *)self _locationShifter];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __58__PKTransactionMapView__shiftLocationIfNeeded_completion___block_invoke;
      v9[3] = &unk_1E59CF250;
      id v11 = v7;
      id v10 = v6;
      [v8 shiftLocation:v10 withCompletionHandler:v9];
    }
    else
    {
      (*((void (**)(id, id))v7 + 2))(v7, v6);
    }
  }
}

void __58__PKTransactionMapView__shiftLocationIfNeeded_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v5 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "PKTransactionMapView: Failed to successfully shift location requiring shift. Falling back to original location.", v6, 2u);
    }

    id v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v4();
}

- (id)_locationShifter
{
  locationShifter = self->_locationShifter;
  if (!locationShifter)
  {
    id v4 = (_MKLocationShifter *)objc_alloc_init(MEMORY[0x1E4F310E8]);
    id v5 = self->_locationShifter;
    self->_locationShifter = v4;

    locationShifter = self->_locationShifter;
  }

  return locationShifter;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F30F58];
  id v6 = a4;
  id v7 = (void *)[[v5 alloc] initWithAnnotation:v6 reuseIdentifier:0];

  [v7 sizeToFit];
  id v8 = [(PKPaymentTransaction *)self->_transaction merchant];
  merchant = v8;
  if (!v8) {
    merchant = self->_merchant;
  }
  id v10 = merchant;

  id v11 = PKMapsStylingInfoForMerchant(v10);
  if (v10 || [(PKPaymentTransaction *)self->_transaction transactionType] != 2)
  {
    if (!v11) {
      goto LABEL_9;
    }
    [v7 _setWalletMerchantStylingInfo:v11];
    double v13 = PKUIScreenScale();
    [(PKMerchant *)v10 category];
    uint64_t v12 = PKColorForMerchantCategory(v13);
    [v7 setMarkerTintColor:v12];
  }
  else
  {
    uint64_t v12 = PKGEOFeaturesStyleAttributesFromTransitType([(PKPaymentTransaction *)self->_transaction transitType]);
    [v7 _setStyleAttributes:v12];
  }

LABEL_9:

  return v7;
}

- (BOOL)showsMerchantName
{
  return self->_showsMerchantName;
}

- (void)setShowsMerchantName:(BOOL)a3
{
  self->_showsMerchantName = a3;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (BOOL)usesDarkAppearance
{
  return self->_usesDarkAppearance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_endStationLocation, 0);
  objc_storeStrong((id *)&self->_startStationLocation, 0);
  objc_storeStrong((id *)&self->_preferredLocation, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);

  objc_storeStrong((id *)&self->_internalMapView, 0);
}

@end