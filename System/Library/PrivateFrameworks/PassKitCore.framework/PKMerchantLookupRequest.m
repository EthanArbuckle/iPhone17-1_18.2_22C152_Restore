@interface PKMerchantLookupRequest
- (PKMerchantLookupRequest)initWithSource:(id)a3;
- (id)_brandFromMapItem:(id)a3;
- (id)_merchantFromMapItem:(id)a3;
- (void)_mapItemBrandWithMUID:(unint64_t)a3 completion:(id)a4;
- (void)_mapsDataWithResponse:(id)a3 searchMapItem:(id)a4 completion:(id)a5;
- (void)startLookupWithCompletion:(id)a3;
@end

@implementation PKMerchantLookupRequest

- (PKMerchantLookupRequest)initWithSource:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKMerchantLookupRequest;
  v6 = [(PKMerchantLookupRequest *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_source, a3);
    v8 = (MKMapService *)objc_alloc_init((Class)getMKMapServiceClass[0]());
    service = v7->_service;
    v7->_service = v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.passd.PKMerchantLookupRequest", 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v10;
  }
  return v7;
}

- (void)startLookupWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PKMerchantLookupRequestSource *)self->_source mapsMerchantLookupRequest];
    v6 = [(PKMerchantLookupRequestSource *)self->_source mapsURL];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__PKMerchantLookupRequest_startLookupWithCompletion___block_invoke;
    aBlock[3] = &unk_1E56EB6D0;
    id v20 = v4;
    v7 = _Block_copy(aBlock);
    if (v5)
    {
      v8 = [v5 traits];
      v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v10 = [(MKMapService *)self->_service defaultTraits];
      }
      v11 = v10;

      [v11 setWantsBrandIcon:1];
      [v11 setSupportsBrandFallback:1];
      objc_msgSend(v11, "setIsSettlement:", -[PKMerchantLookupRequestSource isSettlement](self->_source, "isSettlement"));
      objc_msgSend(v11, "setIsSettlement:", -[PKMerchantLookupRequestSource isRefund](self->_source, "isRefund"));
      objc_msgSend(v11, "setContainsSensitiveData:", -[PKMerchantLookupRequestSource containsSensitiveData](self->_source, "containsSensitiveData"));
      v12 = [(MKMapService *)self->_service ticketForWalletMerchantLookupRequest:v5 traits:v11];
      internalQueue = self->_internalQueue;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __53__PKMerchantLookupRequest_startLookupWithCompletion___block_invoke_2;
      v17[3] = &unk_1E56EB6F8;
      v17[4] = self;
      objc_super v13 = &v18;
      id v18 = v7;
      [v12 submitWithCompletionQueue:internalQueue handler:v17];
    }
    else
    {
      if (!v6 || [(PKMerchantLookupRequestSource *)self->_source type] != 3) {
        goto LABEL_13;
      }
      v11 = (void *)[objc_alloc(_MergedGlobals_179()) initWithMapsURL:v6];
      if (!v11)
      {
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      v12 = (void *)[objc_alloc(off_1EB402498()) initWithRequest:v11];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __53__PKMerchantLookupRequest_startLookupWithCompletion___block_invoke_30;
      v15[3] = &unk_1E56EB720;
      v15[4] = self;
      objc_super v13 = &v16;
      id v16 = v7;
      [v12 startWithCompletionHandler:v15];
    }

    goto LABEL_12;
  }
LABEL_14:
}

void __53__PKMerchantLookupRequest_startLookupWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    v8 = @"code";
    v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "code"));
    v9[0] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    AnalyticsSendEvent();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__PKMerchantLookupRequest_startLookupWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 domain];
  v8 = GEOErrorDomain();
  int v9 = [v7 isEqualToString:v8];

  if (v9) {
    uint64_t v10 = [v6 code];
  }
  else {
    uint64_t v10 = 0;
  }
  if (v5) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  int v12 = v11;
  objc_super v13 = PKLogFacilityTypeGetObject(0x17uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [*(id *)(*(void *)(a1 + 32) + 16) identifier];
    unint64_t v15 = [*(id *)(*(void *)(a1 + 32) + 16) type];
    if (v15 > 3) {
      id v16 = @"unknown";
    }
    else {
      id v16 = off_1E56EB790[v15];
    }
    v17 = @"NO";
    int v19 = 138413058;
    id v20 = v14;
    if (v12) {
      v17 = @"YES";
    }
    __int16 v21 = 2112;
    v22 = v16;
    __int16 v23 = 2112;
    v24 = v17;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Maps merchant lookup for identifier %@, type %@: Success: %@, Error: %@", (uint8_t *)&v19, 0x2Au);
  }
  if (v12)
  {
    [*(id *)(a1 + 32) _mapsDataWithResponse:v5 searchMapItem:0 completion:*(void *)(a1 + 40)];
  }
  else
  {
    id v18 = objc_alloc_init(PKMerchantLookupResponse);
    [(PKMerchantLookupResponse *)v18 setResult:v10 == -3];
    (*(void (**)(void, PKMerchantLookupResponse *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v18);
  }
}

void __53__PKMerchantLookupRequest_startLookupWithCompletion___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = [a2 mapItems];
  id v6 = [v5 firstObject];

  if (v6) {
    [*(id *)(a1 + 32) _mapsDataWithResponse:0 searchMapItem:v6 completion:*(void *)(a1 + 40)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_mapsDataWithResponse:(id)a3 searchMapItem:(id)a4 completion:(id)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = a5;
  if (v10 && v8 | v9)
  {
    v38 = [(id)v9 _geoMapItem];
    if (v8)
    {
      BOOL v11 = [(id)v8 mapsCategoryIdentifier];
      [(id)v8 walletCategoryIdentifier];
    }
    else
    {
      BOOL v11 = [v38 _mapsCategoryId];
      [v38 _walletCategoryIdentifier];
    int v12 = };
    uint64_t v13 = PKMerchantCategoryFromString(v12);

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PKMerchantLookupRequest__mapsDataWithResponse_searchMapItem_completion___block_invoke;
    aBlock[3] = &unk_1E56EB748;
    uint64_t v50 = v13;
    id v49 = v10;
    v14 = _Block_copy(aBlock);
    if (v8)
    {
      id v15 = [(id)v8 mapItem];
      id v16 = objc_msgSend((id)v8, "bestHeroImageForSize:allowSmaller:", 1, 1.79769313e308, 1.79769313e308);
      [(id)v8 heroImageProviderName];
    }
    else
    {
      id v15 = (id)v9;
      id v16 = objc_msgSend(v15, "_bestWalletHeroImageForSize:allowSmaller:", 1, 1.79769313e308, 1.79769313e308);
      [v15 _walletHeroImageProviderName];
    v17 = };
    if (!v15)
    {
      (*((void (**)(void *, void, void, void, void, void))v14 + 2))(v14, 0, 0, 0, 0, 0);
      goto LABEL_27;
    }
    v37 = v16;
    v36 = v11;
    if ([v15 _isMapItemTypeBrand])
    {
      id v18 = [(PKMerchantLookupRequest *)self _brandFromMapItem:v15];
      [v18 setCategory:v13];
      [v18 setDetailedCategory:v11];
      if (v8)
      {
        int v19 = [(id)v8 placeStyling];
        if (!v19)
        {
LABEL_14:
          [v18 setHeroImageURL:v37];
          [v18 setHeroImageAttributionName:v17];
          __int16 v21 = [MEMORY[0x1E4F1C9C8] date];
          [v18 setLastProcessedDate:v21];

          (*((void (**)(void *, uint64_t, void, void, void *, void))v14 + 2))(v14, 1, 0, 0, v18, 0);
          id v16 = v37;
          BOOL v11 = v36;
LABEL_27:

          goto LABEL_28;
        }
      }
      else
      {
        id v29 = objc_alloc((Class)getMKWalletMerchantStylingInfoClass_0[0]());
        v30 = [v38 _walletPlaceStyling];
        int v19 = (void *)[v29 initWithStyleAttributes:v30];

        if (!v19) {
          goto LABEL_14;
        }
      }
      id v20 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v19 requiringSecureCoding:1 error:0];
      [v18 setStylingInfoData:v20];

      goto LABEL_14;
    }
    v35 = (void (**)(void, void, void, void, void, void))v14;
    v34 = [v15 placemark];
    v22 = [(PKMerchantLookupRequest *)self _merchantFromMapItem:v15];
    [v22 setCategory:v13];
    [v22 setDetailedCategory:v11];
    if (v8)
    {
      __int16 v23 = [(id)v8 placeStyling];
      if (!v23)
      {
LABEL_19:
        [v22 setHeroImageURL:v37];
        [v22 setHeroImageAttributionName:v17];
        __int16 v25 = [MEMORY[0x1E4F1C9C8] date];
        [v22 setLastProcessedDate:v25];

        uint64_t v26 = [v15 _brandMUID];
        if (v26)
        {
          uint64_t v27 = v26;
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __74__PKMerchantLookupRequest__mapsDataWithResponse_searchMapItem_completion___block_invoke_2;
          v39[3] = &unk_1E56EB770;
          v39[4] = self;
          uint64_t v47 = v13;
          id v40 = v36;
          id v41 = (id)v8;
          id v42 = v38;
          id v43 = v15;
          v46 = v35;
          v28 = v34;
          id v44 = v34;
          id v45 = v22;
          [(PKMerchantLookupRequest *)self _mapItemBrandWithMUID:v27 completion:v39];
        }
        else
        {
          v28 = v34;
          ((void (**)(void, uint64_t, void *, void *, void, void))v35)[2](v35, 1, v34, v22, 0, 0);
        }

        BOOL v11 = v36;
        id v16 = v37;
        v14 = v35;
        goto LABEL_27;
      }
    }
    else
    {
      id v31 = objc_alloc((Class)getMKWalletMerchantStylingInfoClass_0[0]());
      [v38 _walletPlaceStyling];
      v32 = v33 = v17;
      __int16 v23 = (void *)[v31 initWithStyleAttributes:v32];

      v17 = v33;
      if (!v23) {
        goto LABEL_19;
      }
    }
    v24 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v23 requiringSecureCoding:1 error:0];
    [v22 setStylingInfoData:v24];

    goto LABEL_19;
  }
LABEL_28:
}

void __74__PKMerchantLookupRequest__mapsDataWithResponse_searchMapItem_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = objc_alloc_init(PKMerchantLookupResponse);
  v17 = v15;
  if (a2) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 0;
  }
  [(PKMerchantLookupResponse *)v15 setResult:v16];
  [(PKMerchantLookupResponse *)v17 setBrand:v12];

  [(PKMerchantLookupResponse *)v17 setMerchant:v13];
  [(PKMerchantLookupResponse *)v17 setPlacemark:v14];

  [(PKMerchantLookupResponse *)v17 setFallbackCategory:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__PKMerchantLookupRequest__mapsDataWithResponse_searchMapItem_completion___block_invoke_2(uint64_t a1, int a2, uint64_t a3)
{
  id v4 = 0;
  if (!a3 || !a2) {
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "_brandFromMapItem:");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v13 setCategory:*(void *)(a1 + 96)];
  [v13 setDetailedCategory:*(void *)(a1 + 40)];
  id v5 = *(void **)(a1 + 48);
  if (!v5)
  {
    id v11 = objc_alloc((Class)getMKWalletMerchantStylingInfoClass_0[0]());
    id v12 = [*(id *)(a1 + 56) _walletPlaceStyling];
    id v6 = (void *)[v11 initWithStyleAttributes:v12];

    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v6 = [v5 placeStyling];
  if (v6)
  {
LABEL_5:
    id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
    [v13 setStylingInfoData:v7];
  }
LABEL_6:
  unint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  [v13 setLastProcessedDate:v8];

  unint64_t v9 = [v13 logoURL];

  if (!v9)
  {
    id v10 = objc_msgSend(*(id *)(a1 + 64), "_bestBrandIconURLForSize:allowSmaller:", 1, 500.0, 500.0);
    [v13 setLogoURL:v10];
  }
  id v4 = v13;
LABEL_9:
  id v14 = v4;
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
}

- (void)_mapItemBrandWithMUID:(unint64_t)a3 completion:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    id v7 = objc_alloc_init(_MergedGlobals_179());
    unint64_t v8 = [NSNumber numberWithUnsignedLongLong:a3];
    v13[0] = v8;
    unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v7 _setMuids:v9];

    id v10 = (void *)[objc_alloc(off_1EB402498()) initWithRequest:v7];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__PKMerchantLookupRequest__mapItemBrandWithMUID_completion___block_invoke;
    v11[3] = &unk_1E56EB720;
    v11[4] = self;
    id v12 = v6;
    [v10 startWithCompletionHandler:v11];
  }
}

void __60__PKMerchantLookupRequest__mapItemBrandWithMUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v8 = *(NSObject **)(v7 + 8);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__PKMerchantLookupRequest__mapItemBrandWithMUID_completion___block_invoke_2;
  v12[3] = &unk_1E56DEB98;
  id v13 = v6;
  uint64_t v14 = v7;
  id v9 = *(id *)(a1 + 40);
  id v15 = v5;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, v12);
}

void __60__PKMerchantLookupRequest__mapItemBrandWithMUID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2) {
    BOOL v3 = objc_msgSend(v2, "_mapkit_underlyingGEOError") != -8;
  }
  else {
    BOOL v3 = 0;
  }
  id v4 = PKLogFacilityTypeGetObject(0x17uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(*(void *)(a1 + 40) + 16) identifier];
    unint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 16) type];
    if (v6 > 3) {
      uint64_t v7 = @"unknown";
    }
    else {
      uint64_t v7 = off_1E56EB790[v6];
    }
    unint64_t v8 = @"YES";
    uint64_t v9 = *(void *)(a1 + 32);
    int v13 = 138413058;
    if (v3) {
      unint64_t v8 = @"NO";
    }
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    uint64_t v20 = v9;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Maps brand lookup for for identifier %@, type %@: Success: %@, Error: %@", (uint8_t *)&v13, 0x2Au);
  }
  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56));
  }
  else
  {
    id v10 = [*(id *)(a1 + 48) mapItems];
    id v11 = [v10 firstObject];

    if (!v11)
    {
      id v12 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "No brand item from brand search.", (uint8_t *)&v13, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (id)_merchantFromMapItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PKMapsMerchant);
  -[PKMapsMerchant setIdentifier:](v4, "setIdentifier:", [v3 _muid]);
  -[PKMapsMerchant setResultProviderIdentifier:](v4, "setResultProviderIdentifier:", [v3 _resultProviderID]);
  id v5 = [v3 name];
  [(PKMapsMerchant *)v4 setName:v5];

  unint64_t v6 = [v3 phoneNumber];
  [(PKMapsMerchant *)v4 setPhoneNumber:v6];

  uint64_t v7 = [v3 url];
  [(PKMapsMerchant *)v4 setURL:v7];

  unint64_t v8 = [v3 placemark];

  uint64_t v9 = [v8 location];
  [(PKMapsMerchant *)v4 setLocation:v9];

  id v10 = [v8 postalAddress];
  [(PKMapsMerchant *)v4 setPostalAddress:v10];

  return v4;
}

- (id)_brandFromMapItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PKMapsBrand);
  -[PKMapsBrand setIdentifier:](v4, "setIdentifier:", [v3 _muid]);
  -[PKMapsBrand setResultProviderIdentifier:](v4, "setResultProviderIdentifier:", [v3 _resultProviderID]);
  id v5 = [v3 name];
  [(PKMapsBrand *)v4 setName:v5];

  unint64_t v6 = [v3 phoneNumber];
  [(PKMapsBrand *)v4 setPhoneNumber:v6];

  uint64_t v7 = [v3 url];
  [(PKMapsBrand *)v4 setURL:v7];

  unint64_t v8 = objc_msgSend(v3, "_bestBrandIconURLForSize:allowSmaller:", 1, 500.0, 500.0);

  [(PKMapsBrand *)v4 setLogoURL:v8];
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end