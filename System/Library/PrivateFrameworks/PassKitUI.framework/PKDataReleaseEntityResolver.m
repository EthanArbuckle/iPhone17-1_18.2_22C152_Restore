@interface PKDataReleaseEntityResolver
- (PKDataReleaseEntityResolver)init;
- (void)_merchantForIdentifier:(id)a3 withCurrentMerchant:(id)a4 fromMobileAssetLocalOnly:(BOOL)a5 completion:(id)a6;
- (void)_merchantFromMapsWithIdentifier:(id)a3 completion:(id)a4;
- (void)resolveEntityForRequest:(id)a3 completion:(id)a4;
- (void)resolveEntityForRpIdentifier:(id)a3 completion:(id)a4;
@end

@implementation PKDataReleaseEntityResolver

- (PKDataReleaseEntityResolver)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKDataReleaseEntityResolver;
  v2 = [(PKDataReleaseEntityResolver *)&v6 init];
  if (v2)
  {
    v3 = (PKPaymentService *)objc_alloc_init(MEMORY[0x1E4F84C38]);
    paymentService = v2->_paymentService;
    v2->_paymentService = v3;
  }
  return v2;
}

- (void)resolveEntityForRpIdentifier:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)resolveEntityForRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(location, self);
  if (v7)
  {
    v8 = [v6 rpIdentifier];
    v9 = [v6 organizationName];
    v10 = [v6 iconURL];
    v11 = [v6 industryCode];
    if (v6 && [v8 length])
    {
      v54[0] = 0;
      v54[1] = v54;
      v54[2] = 0x3032000000;
      v54[3] = __Block_byref_object_copy__35;
      v54[4] = __Block_byref_object_dispose__35;
      id v55 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke;
      aBlock[3] = &unk_1E59D8500;
      id v12 = v9;
      id v48 = v12;
      id v49 = v11;
      v28 = v10;
      id v50 = v10;
      id v13 = v8;
      id v51 = v13;
      v53 = v54;
      id v52 = v7;
      v14 = _Block_copy(aBlock);
      id v15 = objc_alloc_init(MEMORY[0x1E4F84518]);
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_2;
      v44[3] = &unk_1E59D8528;
      id v16 = v12;
      id v45 = v16;
      id v17 = v14;
      id v46 = v17;
      [v15 addOperation:v44];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_3;
      v40[3] = &unk_1E59CF188;
      objc_copyWeak(&v43, location);
      id v18 = v13;
      id v41 = v18;
      id v19 = v17;
      id v42 = v19;
      [v15 addOperation:v40];
      v27 = v9;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_2_102;
      v35[3] = &unk_1E59D85A0;
      objc_copyWeak(&v39, location);
      id v20 = v18;
      id v36 = v20;
      id v37 = v16;
      id v21 = v19;
      id v38 = v21;
      [v15 addOperation:v35];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_4;
      v29[3] = &unk_1E59D8618;
      id v22 = v15;
      id v30 = v22;
      objc_copyWeak(&v34, location);
      id v31 = v20;
      v33 = v54;
      id v23 = v21;
      id v32 = v23;
      v24 = (void (**)(void *, uint64_t))_Block_copy(v29);
      v24[2](v24, 1);
      v24[2](v24, 0);
      v25 = [MEMORY[0x1E4F1CA98] null];
      id v26 = (id)[v22 evaluateWithInput:v25 completion:&__block_literal_global_145];

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v39);

      objc_destroyWeak(&v43);
      _Block_object_dispose(v54, 8);

      v9 = v27;
      v10 = v28;
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
  objc_destroyWeak(location);
}

void __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    v4 = [v6 name];
    uint64_t v5 = [v4 length];

    if (!v5) {
      [v6 setName:*(void *)(a1 + 32)];
    }
    if (![v6 industryCode]) {
      objc_msgSend(v6, "setIndustryCode:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
    }
    [v6 setFallbackLogoImageURL:*(void *)(a1 + 48)];
    [v6 setMerchantIdentifier:*(void *)(a1 + 56)];
    if ([v6 isValid])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a2);
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

void __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = (objc_class *)MEMORY[0x1E4F847E0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setName:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v7[2](v7, v8, 0);
}

void __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v9 = (void *)MEMORY[0x1E4F28F60];
    v17[0] = *(void *)(a1 + 32);
    v17[1] = &unk_1EF2B95D0;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    v11 = [v9 predicateWithFormat:@"t == %@ AND transaction_type == %lu AND (maps_merchant_pid != nil OR u != nil)" argumentArray:v10];

    id v12 = (void *)WeakRetained[1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_100;
    v13[3] = &unk_1E59D8550;
    id v15 = *(id *)(a1 + 40);
    id v16 = v7;
    id v14 = v6;
    [v12 transactionsForPredicate:v11 limit:1 completion:v13];
  }
}

void __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_100(uint64_t a1, void *a2)
{
  v3 = [a2 firstObject];
  id v4 = [v3 merchant];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_2_102(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_3_103;
    v10[3] = &unk_1E59D8578;
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 48);
    id v14 = v7;
    id v12 = v6;
    [WeakRetained _merchantFromMapsWithIdentifier:v9 completion:v10];
  }
}

uint64_t __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_3_103(void *a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = a1[4];
    id v4 = a2;
    [v4 setName:v3];
    (*(void (**)(void))(a1[6] + 16))();
  }
  uint64_t v5 = *(uint64_t (**)(void))(a1[7] + 16);

  return v5();
}

void __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_4(uint64_t a1, char a2)
{
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_5;
  v7[3] = &unk_1E59D85F0;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  id v8 = *(id *)(a1 + 40);
  char v11 = a2;
  long long v6 = *(_OWORD *)(a1 + 48);
  id v5 = (id)v6;
  long long v9 = v6;
  [v4 addOperation:v7];

  objc_destroyWeak(&v10);
}

void __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v10 = *(unsigned __int8 *)(a1 + 64);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_6;
    v12[3] = &unk_1E59D85C8;
    uint64_t v11 = *(void *)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    id v15 = v7;
    id v13 = v6;
    [WeakRetained _merchantForIdentifier:v11 withCurrentMerchant:v9 fromMobileAssetLocalOnly:v10 completion:v12];
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }
}

uint64_t __66__PKDataReleaseEntityResolver_resolveEntityForRequest_completion___block_invoke_6(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (a3)
  {
    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v6();
  }
  return result;
}

- (void)_merchantFromMapsWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [[PKDataReleaseEntityLookupSource alloc] initWithEntityIdentifier:v5];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F847F0]) initWithSource:v7];
  uint64_t v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Processing identity request for %@", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__PKDataReleaseEntityResolver__merchantFromMapsWithIdentifier_completion___block_invoke;
  v11[3] = &unk_1E59D8660;
  id v12 = v6;
  id v10 = v6;
  [v8 startLookupWithCompletion:v11];
}

void __74__PKDataReleaseEntityResolver__merchantFromMapsWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 result];
    id v6 = @"NO";
    if (v5 == 2) {
      id v6 = @"YES";
    }
    int v10 = 138412290;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Maps identity response success: %@", (uint8_t *)&v10, 0xCu);
  }

  id v7 = [v3 merchant];
  id v8 = [v3 brand];
  if (([v8 isValid] & 1) != 0 || objc_msgSend(v7, "isValid"))
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_19F450000, v4, OS_LOG_TYPE_DEFAULT, "Maps identity response found valid merchant", (uint8_t *)&v10, 2u);
    }

    id v9 = objc_alloc_init(MEMORY[0x1E4F847E0]);
    [v9 setMapsBrand:v8];
    [v9 setMapsMerchant:v7];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_merchantForIdentifier:(id)a3 withCurrentMerchant:(id)a4 fromMobileAssetLocalOnly:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  objc_initWeak(&location, self);
  id v13 = [MEMORY[0x1E4F847F8] sharedInstance];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __110__PKDataReleaseEntityResolver__merchantForIdentifier_withCurrentMerchant_fromMobileAssetLocalOnly_completion___block_invoke;
  void v17[3] = &unk_1E59D86B0;
  objc_copyWeak(&v21, &location);
  id v14 = v12;
  id v20 = v14;
  id v15 = v10;
  id v18 = v15;
  id v16 = v11;
  id v19 = v16;
  [v13 fetchRPIdentifierMappingDiscretionary:0 localOnly:v7 completionHandler:v17];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __110__PKDataReleaseEntityResolver__merchantForIdentifier_withCurrentMerchant_fromMobileAssetLocalOnly_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!v6) {
      goto LABEL_6;
    }
    id v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v6;
      _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Error fetching mapping %@", buf, 0xCu);
    }

    if (v5)
    {
LABEL_6:
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v5];
      if (v9)
      {
        id v42 = 0;
        id v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v9 options:0 error:&v42];
        id v11 = v42;
        if (!v11 && v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v12 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              id v26 = *(void **)(a1 + 32);
              *(_DWORD *)buf = 138412290;
              id v44 = v26;
              _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Mapping couldn't be parsed for %@", buf, 0xCu);
            }
            goto LABEL_43;
          }
          id v12 = [v10 objectForKey:*(void *)(a1 + 32)];
          if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v27 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              v28 = *(void **)(a1 + 32);
              *(_DWORD *)buf = 138412290;
              id v44 = v28;
              _os_log_impl(&dword_19F450000, v27, OS_LOG_TYPE_DEFAULT, "No mapped merchant for %@", buf, 0xCu);
            }

            goto LABEL_43;
          }
          id v13 = [v12 objectForKey:@"name"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            id v13 = 0;
          }
          id v38 = v13;
          id v14 = [*(id *)(a1 + 40) mapsBrand];
          if ([v14 isValid]) {
            goto LABEL_22;
          }
          id v15 = [*(id *)(a1 + 40) mapsMerchant];
          char v16 = [v15 isValid];

          if (v16) {
            goto LABEL_23;
          }
          id v14 = [v12 objectForKey:@"category"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || ![v14 length]
            || (uint64_t v17 = PKMerchantCategoryFromString()) == 0)
          {
            if (![v38 length])
            {
LABEL_22:

LABEL_23:
              id v19 = [v12 objectForKey:@"identifier"];
              id v20 = [v12 objectForKey:@"resultProviderIdentifier"];
              objc_opt_class();
              if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
              {
                uint64_t v21 = [v19 unsignedLongLongValue];
                id v22 = v20;
                uint64_t v23 = v21;
                id v37 = v22;
                unsigned int v35 = [v22 intValue];
                v24 = [*(id *)(a1 + 40) mapsBrand];
                uint64_t v36 = v23;
                if ([v24 identifier] == v23)
                {
                }
                else
                {
                  id v31 = [*(id *)(a1 + 40) mapsMerchant];
                  uint64_t v34 = [v31 identifier];

                  if (v34 != v36)
                  {
                    id v32 = (void *)WeakRetained[1];
                    v39[0] = MEMORY[0x1E4F143A8];
                    v39[1] = 3221225472;
                    v39[2] = __110__PKDataReleaseEntityResolver__merchantForIdentifier_withCurrentMerchant_fromMobileAssetLocalOnly_completion___block_invoke_123;
                    v39[3] = &unk_1E59D8688;
                    id v40 = v38;
                    id v41 = *(id *)(a1 + 48);
                    id v33 = v38;
                    [v32 mapsMerchantWithIdentifier:v36 resultProviderIdentifier:v35 completion:v39];

                    goto LABEL_44;
                  }
                }
              }
              else
              {
                v29 = PKLogFacilityTypeGetObject();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  id v30 = *(void **)(a1 + 32);
                  *(_DWORD *)buf = 138412546;
                  id v44 = v30;
                  __int16 v45 = 2112;
                  id v46 = v12;
                  _os_log_impl(&dword_19F450000, v29, OS_LOG_TYPE_DEFAULT, "No valid identifier and result provider identifier for %@. %@", buf, 0x16u);
                }
              }
LABEL_43:

              (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_44:
              id v11 = 0;
LABEL_45:

              goto LABEL_46;
            }
            uint64_t v17 = 0;
          }
          id v18 = objc_alloc_init(MEMORY[0x1E4F847E0]);
          [v18 setFallbackcategory:v17];
          [v18 setName:v38];
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

          goto LABEL_22;
        }
      }
      else
      {
        id v11 = 0;
        id v10 = 0;
      }
      v25 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v11;
        _os_log_impl(&dword_19F450000, v25, OS_LOG_TYPE_DEFAULT, "Could not read mapping with error %@", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_45;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_46:
}

void __110__PKDataReleaseEntityResolver__merchantForIdentifier_withCurrentMerchant_fromMobileAssetLocalOnly_completion___block_invoke_123(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 mapsBrand];
  if ([v3 isValid])
  {

LABEL_4:
    [v7 setName:*(void *)(a1 + 32)];
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_6;
  }
  id v4 = [v7 mapsMerchant];
  int v5 = [v4 isValid];

  if (v5) {
    goto LABEL_4;
  }
  id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_6:
  v6();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end