@interface PKPaymentSetupProductModel
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (PKPaymentSetupProductModel)init;
- (id)_paymentSetupProductsWithPartners:(id)a3 products:(id)a4 existingPaymentSetupProducts:(id)a5;
- (id)_paymentSetupProductsWithProducts:(id)a3 existingPaymentSetupProducts:(id)a4;
- (id)allSections;
- (id)allSetupProducts;
- (id)availableProductsForFeatureIdentifier:(unint64_t)a3;
- (id)availableProductsForProductIdentifiers:(id)a3;
- (id)description;
- (id)filteredPaymentSetupProductModel:(id)a3 mobileCarrierRegion:(id)a4 deviceRegion:(id)a5 cardOnFiles:(id)a6;
- (id)identityProductForState:(id)a3 country:(id)a4;
- (id)productForProductIdentifier:(id)a3;
- (id)productsForFeatureIdentifier:(unint64_t)a3;
- (id)productsForProductIdentifiers:(id)a3;
- (id)setupProductsOfType:(unint64_t)a3;
- (void)_updatePaymentSetupProduct:(id)a3 displayName:(id)a4 localizedDescription:(id)a5 partnerArray:(id)a6 productIdentifier:(id)a7 paymentOptions:(id)a8 termsURL:(id)a9 provisioningMethodDetailsList:(id)a10 readerModeMetadata:(id)a11 requiredFields:(id)a12 imageAssets:(id)a13 minimumOSVersion:(id)a14 region:(id)a15 regionData:(id)a16 hsa2Requirement:(id)a17 suppressPendingPurchases:(id)a18 supportedTransitNetworkIdentifiers:(id)a19 onboardingItems:(id)a20 actionBaseURL:(id)a21 productState:(id)a22 minimumProductAge:(id)a23 maximumProductAge:(id)a24 minimumTargetUserSupportedAge:(id)a25 associatedStoreIdentifiers:(id)a26 appLaunchURL:(id)a27 regionIdentifier:(id)a28 type:(id)a29 localizedNotificationTitle:(id)a30 localizedNotificationMessage:(id)a31 discoveryCardIdentifier:(id)a32 clientInfo:(id)a33 searchTerms:(id)a34 featureIdentifier:(id)a35;
- (void)_updatePaymentSetupProduct:(id)a3 displayName:(id)a4 localizedDescription:(id)a5 partnerDictionary:(id)a6 productIdentifier:(id)a7 paymentOptions:(id)a8 termsURL:(id)a9 provisioningMethods:(id)a10 readerModeMetadata:(id)a11 requiredFields:(id)a12 imageAssets:(id)a13 minimumOSVersion:(id)a14 region:(id)a15 regionData:(id)a16 hsa2Requirement:(id)a17 suppressPendingPurchases:(id)a18 supportedTransitNetworkIdentifiers:(id)a19 onboardingItems:(id)a20 actionBaseURL:(id)a21 productState:(id)a22 minimumProductAge:(id)a23 maximumProductAge:(id)a24 minimumTargetUserSupportedAge:(id)a25 associatedStoreIdentifiers:(id)a26 appLaunchURL:(id)a27 regionIdentifier:(id)a28 type:(id)a29 localizedNotificationTitle:(id)a30 localizedNotificationMessage:(id)a31 discoveryCardIdentifier:(id)a32 clientInfo:(id)a33 searchTerms:(id)a34 featureIdentifier:(id)a35 allowOnManagedAccount:(BOOL)a36;
- (void)addCarKeyCategory;
- (void)addManualEntrySection:(id)a3;
- (void)removeCarKeyCategory;
- (void)removePaymentSetupProducts:(id)a3;
- (void)setAllSections:(id)a3;
- (void)setPaymentSetupProducts:(id)a3;
- (void)updatePaymentSetupProducts:(id)a3;
- (void)updateWithPaymentSetupProductsResponse:(id)a3 productsFilter:(id)a4 sectionsFilter:(id)a5;
@end

@implementation PKPaymentSetupProductModel

- (PKPaymentSetupProductModel)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupProductModel;
  v2 = [(PKPaymentSetupProductModel *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    paymentSetupProducts = v2->_paymentSetupProducts;
    v2->_paymentSetupProducts = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    allSections = v2->_allSections;
    v2->_allSections = v5;
  }
  return v2;
}

- (id)allSections
{
  v2 = (void *)[(NSMutableArray *)self->_allSections copy];
  return v2;
}

- (void)setAllSections:(id)a3
{
  v4 = (NSMutableArray *)[a3 mutableCopy];
  allSections = self->_allSections;
  self->_allSections = v4;
}

- (void)updatePaymentSetupProducts:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        paymentSetupProducts = self->_paymentSetupProducts;
        v11 = [v9 productIdentifier];
        [(NSMutableDictionary *)paymentSetupProducts safelySetObject:v9 forKey:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)removePaymentSetupProducts:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        paymentSetupProducts = self->_paymentSetupProducts;
        v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) productIdentifier];
        [(NSMutableDictionary *)paymentSetupProducts removeObjectForKey:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)setPaymentSetupProducts:(id)a3
{
  paymentSetupProducts = self->_paymentSetupProducts;
  id v5 = a3;
  [(NSMutableDictionary *)paymentSetupProducts removeAllObjects];
  [(PKPaymentSetupProductModel *)self updatePaymentSetupProducts:v5];
}

- (id)allSetupProducts
{
  return (id)[(NSMutableDictionary *)self->_paymentSetupProducts allValues];
}

- (id)productForProductIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_paymentSetupProducts objectForKey:a3];
}

- (id)setupProductsOfType:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [(NSMutableDictionary *)self->_paymentSetupProducts allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = [v11 configuration];
        uint64_t v13 = [v12 type];

        if (v13 == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  long long v14 = (void *)[v5 copy];
  return v14;
}

- (id)productsForProductIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
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
        long long v11 = -[NSMutableDictionary objectForKey:](self->_paymentSetupProducts, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        [v5 safelyAddObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  long long v12 = (void *)[v5 copy];
  return v12;
}

- (id)availableProductsForProductIdentifiers:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = -[NSMutableDictionary objectForKey:](self->_paymentSetupProducts, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        long long v12 = [v11 configuration];
        uint64_t v13 = [v12 state];

        if (v13 != 2) {
          [v5 safelyAddObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  long long v14 = (void *)[v5 copy];
  return v14;
}

- (id)productsForFeatureIdentifier:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(NSMutableDictionary *)self->_paymentSetupProducts allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = [v11 configuration];
        uint64_t v13 = [v12 featureIdentifier];

        if (v13 == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  long long v14 = (void *)[v5 copy];
  return v14;
}

- (id)availableProductsForFeatureIdentifier:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [(NSMutableDictionary *)self->_paymentSetupProducts allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v12 = [v11 configuration];
        uint64_t v13 = [v12 state];

        long long v14 = [v11 configuration];
        if ([v14 featureIdentifier] != a3 || v13 == 2)
        {
        }
        else
        {

          if (v13) {
            [v5 addObject:v11];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  long long v16 = (void *)[v5 copy];
  return v16;
}

- (id)identityProductForState:(id)a3 country:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v27 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = [(NSMutableDictionary *)self->_paymentSetupProducts allValues];
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(obj);
      }
      long long v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
      long long v12 = [v11 configuration];
      uint64_t v13 = [v12 type];

      if (v13 != 10) {
        goto LABEL_21;
      }
      long long v14 = [v11 clientInfo];
      long long v15 = [v14 PKStringForKey:@"administrativeArea"];

      long long v16 = [v11 clientInfo];
      long long v17 = [v16 PKStringForKey:@"country"];

      id v18 = v15;
      id v19 = v6;
      long long v20 = v19;
      if (v18 == v19) {
        break;
      }
      if (v6 && v18)
      {
        int v21 = [v18 isEqualToString:v19];

        if (!v21) {
          goto LABEL_20;
        }
        goto LABEL_13;
      }
      id v22 = v18;
LABEL_19:

LABEL_20:
LABEL_21:
      if (v8 == ++v10)
      {
        uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_23;
      }
    }

LABEL_13:
    id v22 = v17;
    id v23 = v27;
    long long v20 = v23;
    if (v22 == v23)
    {

      id v22 = v20;
LABEL_25:
      id v25 = v11;

      goto LABEL_26;
    }
    if (v27 && v22)
    {
      char v24 = [v22 isEqualToString:v23];

      if (v24) {
        goto LABEL_25;
      }
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_23:
  id v25 = 0;
LABEL_26:

  return v25;
}

- (void)updateWithPaymentSetupProductsResponse:(id)a3 productsFilter:(id)a4 sectionsFilter:(id)a5
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v63 = (void (**)(void))a4;
  v64 = (void (**)(void))a5;
  uint64_t v9 = [v8 objectForKeyedSubscript:@"partners"];
  v66 = v8;
  v65 = [v8 objectForKeyedSubscript:@"products"];
  objc_opt_class();
  v62 = (void *)v9;
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    long long v11 = [(NSMutableDictionary *)self->_paymentSetupProducts allValues];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v93 objects:v103 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v94;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v94 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v93 + 1) + 8 * i);
          if (([v16 isServerDriven] & 1) == 0)
          {
            long long v17 = [v16 productIdentifier];
            [(NSMutableDictionary *)v10 safelySetObject:v16 forKey:v17];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v93 objects:v103 count:16];
      }
      while (v13);
    }

    if (PKPaymentSetupMergeProductsPartnersAPIEnabled()) {
      [(PKPaymentSetupProductModel *)self _paymentSetupProductsWithProducts:v65 existingPaymentSetupProducts:self->_paymentSetupProducts];
    }
    else {
    id v19 = [(PKPaymentSetupProductModel *)self _paymentSetupProductsWithPartners:v62 products:v65 existingPaymentSetupProducts:self->_paymentSetupProducts];
    }
    if (v63)
    {
      v63[2]();
      id v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v20 = v19;
    }
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v89 objects:v102 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v90;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v90 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v89 + 1) + 8 * j);
          id v27 = [v26 productIdentifier];
          [(NSMutableDictionary *)v10 safelySetObject:v26 forKey:v27];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v89 objects:v102 count:16];
      }
      while (v23);
    }

    paymentSetupProducts = self->_paymentSetupProducts;
    self->_paymentSetupProducts = v10;
  }
  else
  {
    id v18 = self->_paymentSetupProducts;
    self->_paymentSetupProducts = 0;
  }
  long long v29 = [v66 objectForKeyedSubscript:@"categories"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    allSections = self->_allSections;
    self->_allSections = 0;
    goto LABEL_89;
  }
  long long v30 = [v29 PKStringForKey:@"localizedTitle"];
  localizedTitle = self->_localizedTitle;
  self->_localizedTitle = v30;

  long long v32 = [v29 PKStringForKey:@"localizedSubtitle"];
  localizedSubtitle = self->_localizedSubtitle;
  self->_localizedSubtitle = v32;

  v67 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v61 = v29;
  [v29 PKArrayContaining:objc_opt_class() forKey:@"sections"];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v70 = [obj countByEnumeratingWithState:&v85 objects:v101 count:16];
  if (!v70) {
    goto LABEL_84;
  }
  uint64_t v69 = *(void *)v86;
  do
  {
    for (uint64_t k = 0; k != v70; ++k)
    {
      if (*(void *)v86 != v69) {
        objc_enumerationMutation(obj);
      }
      v35 = [[PKPaymentSetupProductSection alloc] initWithDictionary:*(void *)(*((void *)&v85 + 1) + 8 * k)];
      if (v35)
      {
        uint64_t v71 = k;
        id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v72 = [(PKPaymentSetupProductSection *)v35 categories];
        uint64_t v76 = [v72 countByEnumeratingWithState:&v81 objects:v100 count:16];
        if (!v76) {
          goto LABEL_76;
        }
        v74 = v35;
        uint64_t v75 = *(void *)v82;
        id v73 = v36;
        while (1)
        {
          for (uint64_t m = 0; m != v76; ++m)
          {
            if (*(void *)v82 != v75) {
              objc_enumerationMutation(v72);
            }
            v38 = *(void **)(*((void *)&v81 + 1) + 8 * m);
            v39 = [v38 identifier];
            if ([v39 isEqualToString:@"transit"])
            {
              v40 = self;
              uint64_t v41 = 3;
LABEL_47:
              uint64_t v42 = [(PKPaymentSetupProductModel *)v40 setupProductsOfType:v41];
              goto LABEL_48;
            }
            if ([v39 isEqualToString:@"carKey"])
            {
              v40 = self;
              uint64_t v41 = 11;
              goto LABEL_47;
            }
            if ([v39 isEqualToString:@"identity"])
            {
              v40 = self;
              uint64_t v41 = 10;
              goto LABEL_47;
            }
            if ([v39 isEqualToString:@"eMoney"])
            {
              v40 = self;
              uint64_t v41 = 4;
              goto LABEL_47;
            }
            if ([v39 isEqualToString:@"appleCard"])
            {
              v50 = self;
              uint64_t v51 = 2;
            }
            else
            {
              if (![v39 isEqualToString:@"asp"])
              {
                if ([v39 isEqualToString:@"creditDebit"])
                {
                  v40 = self;
                  uint64_t v41 = 5;
                }
                else
                {
                  if (![v39 isEqualToString:@"Barcode"])
                  {
                    id v43 = 0;
LABEL_67:
                    id v44 = 0;
                    goto LABEL_68;
                  }
                  v40 = self;
                  uint64_t v41 = 9;
                }
                goto LABEL_47;
              }
              v50 = self;
              uint64_t v51 = 4;
            }
            uint64_t v42 = [(PKPaymentSetupProductModel *)v50 productsForFeatureIdentifier:v51];
LABEL_48:
            id v43 = (id)v42;
            if (!v42) {
              goto LABEL_67;
            }
            id v44 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            long long v77 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            id v43 = v43;
            uint64_t v45 = [v43 countByEnumeratingWithState:&v77 objects:v99 count:16];
            if (v45)
            {
              uint64_t v46 = v45;
              uint64_t v47 = *(void *)v78;
              do
              {
                for (uint64_t n = 0; n != v46; ++n)
                {
                  if (*(void *)v78 != v47) {
                    objc_enumerationMutation(v43);
                  }
                  v49 = [*(id *)(*((void *)&v77 + 1) + 8 * n) productIdentifier];
                  [v44 addObject:v49];
                }
                uint64_t v46 = [v43 countByEnumeratingWithState:&v77 objects:v99 count:16];
              }
              while (v46);
            }

            id v36 = v73;
            v35 = v74;
LABEL_68:
            char v52 = [v38 needsProducts];
            if ([v44 count] || (v52 & 1) == 0)
            {
              [v38 setProductIdentifiers:v44];
              [v36 addObject:v38];
            }
            else
            {
              v53 = PKLogFacilityTypeGetObject(6uLL);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                v54 = [v38 identifier];
                *(_DWORD *)buf = 138412290;
                v98 = v54;
                _os_log_impl(&dword_190E10000, v53, OS_LOG_TYPE_DEFAULT, "Dropping category: %@ as no matching products found", buf, 0xCu);
              }
            }
            [(PKPaymentSetupProductSection *)v35 setCategories:v36];
          }
          uint64_t v76 = [v72 countByEnumeratingWithState:&v81 objects:v100 count:16];
          if (!v76)
          {
LABEL_76:

            v55 = [(PKPaymentSetupProductSection *)v35 categories];
            uint64_t v56 = [v55 count];

            if (v56)
            {
              [(NSMutableArray *)v67 addObject:v35];
            }
            else
            {
              v57 = PKLogFacilityTypeGetObject(6uLL);
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_190E10000, v57, OS_LOG_TYPE_DEFAULT, "Dropping section as no matching products found for any category", buf, 2u);
              }
            }
            uint64_t k = v71;

            break;
          }
        }
      }
    }
    uint64_t v70 = [obj countByEnumeratingWithState:&v85 objects:v101 count:16];
  }
  while (v70);
LABEL_84:
  if (v64)
  {
    v64[2]();
    v58 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v58 = v67;
  }
  v60 = self->_allSections;
  self->_allSections = v58;

  long long v29 = v61;
  allSections = v67;
LABEL_89:
}

- (void)addManualEntrySection:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = objc_alloc_init(PKPaymentSetupProductCategory);
  [(PKPaymentSetupProductCategory *)v5 setIdentifier:@"creditDebit"];
  id v6 = objc_alloc_init(PKPaymentSetupProductSection);
  v10[0] = v5;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [(PKPaymentSetupProductSection *)v6 setCategories:v7];

  id v8 = [MEMORY[0x1E4F1CA48] arrayWithObject:v6];
  if (v4)
  {
    uint64_t v9 = v4[2](v4, v8);

    id v8 = (void *)v9;
  }
  [(NSMutableArray *)self->_allSections addObjectsFromArray:v8];
}

- (void)addCarKeyCategory
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(PKPaymentSetupProductCategory);
  [(PKPaymentSetupProductCategory *)v3 setIdentifier:@"carKey"];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"carKey", 0);
  [(PKPaymentSetupProductCategory *)v3 setProductIdentifiers:v4];

  [(PKPaymentSetupProductCategory *)v3 setExcludedContexts:7];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(PKPaymentSetupProductModel *)self allSections];
  uint64_t v6 = [(PKPaymentSetupProductSection *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    uint64_t v14 = self;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v11 = [v10 categories];
        if ([v11 indexOfObjectPassingTest:&__block_literal_global_1093] != 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_12;
        }
        if ([v11 indexOfObjectPassingTest:&__block_literal_global_1095] != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v13 = [v11 arrayByAddingObject:v3];
          [v10 setCategories:v13];

LABEL_12:
          goto LABEL_13;
        }
      }
      uint64_t v7 = [(PKPaymentSetupProductSection *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      self = v14;
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v5 = objc_alloc_init(PKPaymentSetupProductSection);
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v3, 0);
  [(PKPaymentSetupProductSection *)v5 setCategories:v12];

  [(NSMutableArray *)self->_allSections addObject:v5];
LABEL_13:
}

uint64_t __47__PKPaymentSetupProductModel_addCarKeyCategory__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:@"carKey"];

  return v3;
}

uint64_t __47__PKPaymentSetupProductModel_addCarKeyCategory__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:@"creditDebit"];

  return v3;
}

- (void)removeCarKeyCategory
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(PKPaymentSetupProductModel *)self allSections];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v8 = [v7 categories];
        uint64_t v9 = (void *)[v8 mutableCopy];

        uint64_t v10 = [v9 indexOfObjectPassingTest:&__block_literal_global_1097];
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          [v9 removeObjectAtIndex:v10];
          [v7 setCategories:v9];

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

uint64_t __50__PKPaymentSetupProductModel_removeCarKeyCategory__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:@"carKey"];

  return v3;
}

- (id)filteredPaymentSetupProductModel:(id)a3 mobileCarrierRegion:(id)a4 deviceRegion:(id)a5 cardOnFiles:(id)a6
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v82 = a4;
  id v81 = a5;
  id v87 = a6;
  id v79 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = [v10 targetDevice];
  uint64_t v12 = [v11 deviceClass];
  if (!v12)
  {
    long long v13 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Filtering products for target device received no deviceClass. Falling back to PKDeviceClass().", buf, 2u);
    }

    uint64_t v12 = PKDeviceClass();
  }
  long long v14 = [v11 deviceVersion];
  uint64_t v15 = [v14 versionForDeviceClass:v12];

  long long v88 = (void *)v15;
  if (!v15)
  {
    uint64_t v16 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Filtering products for target device received no osVersion. Falling back to PKOSVersion().", buf, 2u);
    }

    long long v88 = PKOSVersion();
  }
  long long v17 = [v10 targetDevice];
  [v17 appleAccountInformation];
  long long v18 = v86 = (void *)v12;
  int v80 = [v18 isManagedAppleAccount];

  id v19 = v86;
  long long v78 = v10;
  uint64_t v85 = [v10 paymentSetupSupportedInRegion];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id obj = [(PKPaymentSetupProductModel *)self allSetupProducts];
  uint64_t v89 = [obj countByEnumeratingWithState:&v94 objects:v101 count:16];
  if (v89)
  {
    uint64_t v84 = *(void *)v95;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v95 != v84) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v94 + 1) + 8 * v20);
        int v22 = [v87 containsObject:v21];
        uint64_t v23 = [v21 configuration];
        uint64_t v24 = [v23 type];

        if ([v21 supportsOSVersion:v88 deviceClass:v19])
        {
          if ([v21 meetsAgeRequirements])
          {
            int v25 = 1;
            goto LABEL_23;
          }
          v26 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            id v27 = [v21 displayName];
            *(_DWORD *)buf = 138412290;
            v100 = v27;
            v28 = v26;
            long long v29 = "Product: %@ is not supported due to current user being a child account and the product requiring an age >= 13.";
            goto LABEL_21;
          }
        }
        else
        {
          v26 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            id v27 = [v21 displayName];
            *(_DWORD *)buf = 138412290;
            v100 = v27;
            v28 = v26;
            long long v29 = "Product: %@ is not supported due to device OS version";
LABEL_21:
            _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0xCu);
          }
        }

        int v25 = 0;
LABEL_23:
        long long v30 = [v21 regions];
        long long v31 = v30;
        if ((v24 & 0xFFFFFFFFFFFFFFF7) == 3 && v85 == 1)
        {
          char v37 = 1;
          if (!v25) {
            goto LABEL_39;
          }
        }
        else
        {
          BOOL v34 = v24 != 7 && v24 != 10;
          BOOL v35 = v85 == 1 && v34;
          if (v81) {
            char v36 = objc_msgSend(v30, "containsObject:");
          }
          else {
            char v36 = 0;
          }
          char v39 = !v35;
          if (!v82) {
            char v39 = 1;
          }
          if (v39) {
            char v40 = 0;
          }
          else {
            char v40 = objc_msgSend(v31, "containsObject:");
          }
          char v37 = v36 | v40;
          if (!v25)
          {
LABEL_39:
            char v38 = 1;
            goto LABEL_59;
          }
        }
        if ([v31 count]) {
          char v41 = v37;
        }
        else {
          char v41 = 1;
        }
        if (v41)
        {
          char v38 = 1;
          int v25 = 1;
          goto LABEL_59;
        }
        uint64_t v42 = PKLogFacilityTypeGetObject(6uLL);
        BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
        if (v22)
        {
          if (v43)
          {
            id v44 = [v21 displayName];
            *(_DWORD *)buf = 138412290;
            v100 = v44;
            uint64_t v45 = v42;
            uint64_t v46 = "Product: %@ is supported due to matching card on file (device/cellular region check)";
LABEL_57:
            _os_log_impl(&dword_190E10000, v45, OS_LOG_TYPE_DEFAULT, v46, buf, 0xCu);
          }
        }
        else if (v43)
        {
          id v44 = [v21 displayName];
          *(_DWORD *)buf = 138412290;
          v100 = v44;
          uint64_t v45 = v42;
          uint64_t v46 = "Product: %@ is not supported in this device region";
          goto LABEL_57;
        }
        char v38 = v22 ^ 1;

        int v25 = v22;
LABEL_59:
        if (PKPaymentSetupMergeProductsPartnersAPIEnabled())
        {
          uint64_t v47 = [v21 configuration];
          if ([v47 type] == 7)
          {
            v48 = [v21 configuration];
            BOOL v49 = [v48 featureIdentifier] == 2;
          }
          else
          {
            BOOL v49 = 0;
          }

          int v50 = [v21 supportsProvisioningMethodForType:0];
        }
        else
        {
          BOOL v49 = [v21 supportedProvisioningMethods] == 4;
          int v50 = [v21 supportedProvisioningMethods] == 0;
        }
        if ((v25 & v49) == 1 && [v21 preventsFeatureApplication])
        {
          uint64_t v51 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            char v52 = [v21 displayName];
            *(_DWORD *)buf = 138412290;
            v100 = v52;
            v53 = v51;
            v54 = "Product: %@ feature application prevented";
            goto LABEL_90;
          }
          goto LABEL_91;
        }
        if ((v25 & v50) == 1)
        {
          uint64_t v51 = PKLogFacilityTypeGetObject(6uLL);
          BOOL v55 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
          if (v22)
          {
            if (v55)
            {
              uint64_t v56 = [v21 displayName];
              *(_DWORD *)buf = 138412290;
              v100 = v56;
              _os_log_impl(&dword_190E10000, v51, OS_LOG_TYPE_DEFAULT, "Product: %@ is supported due to matching card on file (provisioning method check)", buf, 0xCu);
            }
            v57 = [v21 paymentOptions];
            char v38 = 0;
LABEL_75:
            if ([v57 count])
            {
              if (objc_opt_respondsToSelector())
              {
                long long v92 = 0u;
                long long v93 = 0u;
                long long v90 = 0u;
                long long v91 = 0u;
                id v58 = v57;
                uint64_t v59 = [v58 countByEnumeratingWithState:&v90 objects:v98 count:16];
                if (v59)
                {
                  uint64_t v60 = v59;
                  uint64_t v61 = *(void *)v91;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v60; ++i)
                    {
                      if (*(void *)v91 != v61) {
                        objc_enumerationMutation(v58);
                      }
                      if (objc_msgSend(v11, "supportsCredentialType:", objc_msgSend(*(id *)(*((void *)&v90 + 1) + 8 * i), "cardType")))
                      {

                        goto LABEL_93;
                      }
                    }
                    uint64_t v60 = [v58 countByEnumeratingWithState:&v90 objects:v98 count:16];
                    if (v60) {
                      continue;
                    }
                    break;
                  }
                }
              }
              v63 = PKLogFacilityTypeGetObject(6uLL);
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                v64 = [v21 displayName];
                *(_DWORD *)buf = 138412290;
                v100 = v64;
                v65 = v63;
                v66 = "Product: %@ is not supported on device";
                goto LABEL_102;
              }
            }
            else
            {
LABEL_93:
              if (!v80 || ([v21 allowOnManagedAccount] & 1) != 0)
              {
                v67 = v21;
                v68 = v67;
                if (v38)
                {
                  uint64_t v69 = v67;
                  id v19 = v86;
LABEL_115:
                  [v79 addObject:v69];
                  goto LABEL_107;
                }
                uint64_t v69 = [v67 copy];

                id v19 = v86;
                if (PKPaymentSetupMergeProductsPartnersAPIEnabled())
                {
                  [v69 addProvisioningMethodType:0];
                  uint64_t v70 = PKLogFacilityTypeGetObject(6uLL);
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v100 = "-[PKPaymentSetupProductModel filteredPaymentSetupProductModel:mobileCarrierRegion:deviceRegion:cardOnFiles:]";
                    uint64_t v71 = v70;
                    id v72 = "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled On: add PKPaymentSupportedProvisioningMethodUnknown";
                    goto LABEL_111;
                  }
                }
                else
                {
                  [v69 setSupportedProvisioningMethods:0];
                  uint64_t v70 = PKLogFacilityTypeGetObject(6uLL);
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v100 = "-[PKPaymentSetupProductModel filteredPaymentSetupProductModel:mobileCarrierRegion:deviceRegion:cardOnFiles:]";
                    uint64_t v71 = v70;
                    id v72 = "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled Off: add PKPaymentSupportedProvisioningMethodUnknown";
LABEL_111:
                    _os_log_impl(&dword_190E10000, v71, OS_LOG_TYPE_DEFAULT, v72, buf, 0xCu);
                  }
                }

                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                {
                  v74 = [v68 displayName];
                  *(_DWORD *)buf = 138412290;
                  v100 = v74;
                  _os_log_impl(&dword_190E10000, v70, OS_LOG_TYPE_DEFAULT, "Product: %@ is supported due to matching card but cannot be manually provisioned", buf, 0xCu);
                }
                goto LABEL_115;
              }
              v63 = PKLogFacilityTypeGetObject(6uLL);
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
              {
                v64 = [v21 displayName];
                *(_DWORD *)buf = 138412290;
                v100 = v64;
                v65 = v63;
                v66 = "Product: %@ is not supported on managed account";
LABEL_102:
                _os_log_impl(&dword_190E10000, v65, OS_LOG_TYPE_DEFAULT, v66, buf, 0xCu);
              }
            }

            goto LABEL_104;
          }
          if (v55)
          {
            char v52 = [v21 displayName];
            *(_DWORD *)buf = 138412290;
            v100 = v52;
            v53 = v51;
            v54 = "Product: %@ is not supported due to lack of card on file and unknown provisioning method";
LABEL_90:
            _os_log_impl(&dword_190E10000, v53, OS_LOG_TYPE_DEFAULT, v54, buf, 0xCu);
          }
LABEL_91:

          v57 = [v21 paymentOptions];
          goto LABEL_104;
        }
        v57 = [v21 paymentOptions];
        if (v25) {
          goto LABEL_75;
        }
LABEL_104:
        uint64_t v69 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          id v73 = [v21 displayName];
          *(_DWORD *)buf = 138412290;
          v100 = v73;
          _os_log_impl(&dword_190E10000, v69, OS_LOG_TYPE_DEFAULT, "Product: %@ is unsupported and will not be shown in the flow picker", buf, 0xCu);
        }
        id v19 = v86;
LABEL_107:

        ++v20;
      }
      while (v20 != v89);
      uint64_t v75 = [obj countByEnumeratingWithState:&v94 objects:v101 count:16];
      uint64_t v89 = v75;
    }
    while (v75);
  }

  uint64_t v76 = (void *)[v79 copy];
  return v76;
}

- (id)_paymentSetupProductsWithPartners:(id)a3 products:(id)a4 existingPaymentSetupProducts:(id)a5
{
  uint64_t v208 = *MEMORY[0x1E4F143B8];
  id v82 = a3;
  id v7 = a4;
  id v120 = a5;
  v113 = [MEMORY[0x1E4F1CA60] dictionary];
  v112 = [MEMORY[0x1E4F1CA60] dictionary];
  v111 = [MEMORY[0x1E4F1CA60] dictionary];
  v110 = [MEMORY[0x1E4F1CA60] dictionary];
  id v81 = [MEMORY[0x1E4F1CA60] dictionary];
  v109 = [MEMORY[0x1E4F1CA60] dictionary];
  v108 = [MEMORY[0x1E4F1CA60] dictionary];
  v107 = [MEMORY[0x1E4F1CA60] dictionary];
  v106 = [MEMORY[0x1E4F1CA60] dictionary];
  v105 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v104 = [MEMORY[0x1E4F1CA60] dictionary];
  v103 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v102 = [MEMORY[0x1E4F1CA60] dictionary];
  v101 = [MEMORY[0x1E4F1CA60] dictionary];
  v100 = [MEMORY[0x1E4F1CA60] dictionary];
  v99 = [MEMORY[0x1E4F1CA60] dictionary];
  v98 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v97 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v96 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v95 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v94 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v93 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v92 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v91 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v90 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v89 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v88 = [MEMORY[0x1E4F1CA60] dictionary];
  id v87 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v86 = [MEMORY[0x1E4F1CA60] dictionary];
  id v85 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v84 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v195 = 0u;
  long long v196 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  id obj = v7;
  id v117 = (id)[obj countByEnumeratingWithState:&v195 objects:v207 count:16];
  if (v117)
  {
    uint64_t v116 = *(void *)v196;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v196 != v116) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v195 + 1) + 8 * v8);
        uint64_t v10 = [v9 PKStringForKey:@"identifier"];
        uint64_t v11 = [v9 PKStringForKey:@"type"];
        uint64_t v12 = [v9 PKStringForKey:@"localizedNotificationTitle"];
        v177 = [v9 PKStringForKey:@"localizedNotificationMessage"];
        v175 = [v9 PKStringForKey:@"discoveryCardIdentifier"];
        long long v13 = [v9 PKStringForKey:@"localizedProductName"];
        long long v14 = v13;
        uint64_t v129 = v8;
        v127 = (void *)v10;
        v125 = (void *)v11;
        v123 = (void *)v12;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = [v9 PKStringForKey:@"localizedDisplayName"];
        }
        v173 = v15;

        v171 = [v9 PKDictionaryForKey:@"readerModeMetadata"];
        v169 = [v9 PKStringForKey:@"termsURL"];
        v167 = [v9 PKArrayForKey:@"provisioningMethods"];
        v165 = [v9 PKDictionaryForKey:@"imageAssets"];
        v163 = [v9 PKDictionaryForKey:@"minimumOSVersion"];
        v161 = [v9 PKStringForKey:@"region"];
        v159 = [v9 PKDictionaryForKey:@"regionData"];
        v157 = [v9 PKStringForKey:@"hsa2Requirement"];
        v155 = [v9 PKNumberForKey:@"suppressPendingPurchases"];
        v153 = [v9 PKArrayContaining:objc_opt_class() forKey:@"supportedTransitNetworkIdentifiers"];
        v151 = [v9 PKArrayForKey:@"onboardingItems"];
        v149 = [v9 PKURLForKey:@"actionBaseURL"];
        v147 = [v9 PKStringForKey:@"state"];
        v145 = [v9 PKArrayContaining:objc_opt_class() forKey:@"searchTerms"];
        v143 = [v9 PKStringForKey:@"featureIdentifier"];
        unsigned int v121 = [v9 PKBoolForKey:@"allowOnManagedAccount"];
        uint64_t v16 = [v9 PKNumberForKey:@"minimumSupportedAge"];
        uint64_t v17 = [v9 PKNumberForKey:@"maximumSupportedAge"];
        uint64_t v18 = [v9 PKNumberForKey:@"minimumTargetUserSupportedAge"];
        id v19 = &unk_1EE22C7D0;
        if (v16) {
          uint64_t v20 = (void *)v16;
        }
        else {
          uint64_t v20 = &unk_1EE22C7D0;
        }
        v141 = v20;
        id v21 = &unk_1EE22C7E8;
        if (v17) {
          id v21 = (void *)v17;
        }
        v139 = v21;
        if (v18) {
          id v19 = (void *)v18;
        }
        v137 = v19;
        v135 = [v9 PKArrayForKey:@"associatedStoreIdentifiers"];
        v133 = [v9 PKStringForKey:@"appLaunchURL"];
        v131 = [v9 PKStringForKey:@"registrationRegionIdentifier"];
        int v22 = [MEMORY[0x1E4F1CA48] array];
        long long v191 = 0u;
        long long v192 = 0u;
        long long v193 = 0u;
        long long v194 = 0u;
        uint64_t v23 = [v9 PKArrayContaining:objc_opt_class() forKey:@"requiredFields"];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v191 objects:v206 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v192;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v192 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void *)(*((void *)&v191 + 1) + 8 * i);
              long long v29 = [v9 PKDictionaryForKey:@"requiredFieldOptions"];
              long long v30 = [v29 PKDictionaryForKey:v28];

              long long v31 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:v28 configuration:v30];
              [v22 safelyAddObject:v31];
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v191 objects:v206 count:16];
          }
          while (v25);
        }

        long long v32 = [v9 PKArrayContaining:objc_opt_class() forKey:@"paymentOptions"];
        long long v187 = 0u;
        long long v188 = 0u;
        long long v189 = 0u;
        long long v190 = 0u;
        id v33 = v32;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v187 objects:v205 count:16];
        BOOL v35 = v33;
        if (v34)
        {
          uint64_t v36 = v34;
          uint64_t v37 = *(void *)v188;
LABEL_25:
          uint64_t v38 = 0;
          while (1)
          {
            if (*(void *)v188 != v37) {
              objc_enumerationMutation(v33);
            }
            char v39 = [[PKPaymentSetupProductPaymentOption alloc] initWithPaymentOptionDictionary:*(void *)(*((void *)&v187 + 1) + 8 * v38)];
            uint64_t v40 = [(PKPaymentSetupProductPaymentOption *)v39 cardType];

            if (v40 == 103) {
              break;
            }
            if (v36 == ++v38)
            {
              uint64_t v36 = [v33 countByEnumeratingWithState:&v187 objects:v205 count:16];
              if (v36) {
                goto LABEL_25;
              }
              BOOL v35 = v33;
              goto LABEL_34;
            }
          }

          if (objc_msgSend(v22, "pk_containsObjectPassingTest:", &__block_literal_global_1104)) {
            goto LABEL_35;
          }
          v203[0] = @"fieldType";
          char v41 = PKPaymentSetupFieldTypeToString(4);
          v204[0] = v41;
          v203[1] = @"defaultValue";
          uint64_t v42 = PKLocalizedPaymentString(&cfstr_AddPaymentSuic.isa, 0);
          v204[1] = v42;
          BOOL v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v204 forKeys:v203 count:2];

          BOOL v43 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"suicaPrivacyFooter" configuration:v35];
          [v22 safelyAddObject:v43];
        }
LABEL_34:

LABEL_35:
        if (v127)
        {
          [v112 setObject:v173 forKeyedSubscript:v127];
          [v91 setObject:v123 forKeyedSubscript:v127];
          [v90 setObject:v177 forKeyedSubscript:v127];
          [v89 setObject:v175 forKeyedSubscript:v127];
          [v92 setObject:v125 forKeyedSubscript:v127];
          [v111 setObject:v171 forKeyedSubscript:v127];
          [v110 setObject:v169 forKeyedSubscript:v127];
          id v44 = [MEMORY[0x1E4F1C978] arrayWithArray:v22];
          [v113 setObject:v44 forKeyedSubscript:v127];

          uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithArray:v22];
          [v113 setObject:v45 forKey:v127];

          uint64_t v46 = [v9 PKArrayForKey:@"paymentOptions"];
          if (v46) {
            [v81 setObject:v46 forKey:v127];
          }
          [v109 setObject:v167 forKeyedSubscript:v127];
          [v108 setObject:v165 forKeyedSubscript:v127];
          [v107 setObject:v163 forKeyedSubscript:v127];
          [v106 setObject:v161 forKeyedSubscript:v127];
          [v105 setObject:v159 forKeyedSubscript:v127];
          if (v157)
          {
            [v104 setObject:v157 forKeyedSubscript:v127];
          }
          else
          {
            uint64_t v47 = [MEMORY[0x1E4F1CA98] null];
            [v104 setObject:v47 forKeyedSubscript:v127];
          }
          if (v155)
          {
            [v103 setObject:v155 forKeyedSubscript:v127];
          }
          else
          {
            v48 = [MEMORY[0x1E4F1CA98] null];
            [v103 setObject:v48 forKeyedSubscript:v127];
          }
          if (v153) {
            BOOL v49 = v153;
          }
          else {
            BOOL v49 = (void *)MEMORY[0x1E4F1CBF0];
          }
          [v102 setObject:v49 forKeyedSubscript:v127];
          [v101 setObject:v151 forKeyedSubscript:v127];
          [v100 setObject:v149 forKeyedSubscript:v127];
          [v99 setObject:v147 forKeyedSubscript:v127];
          [v98 setObject:v141 forKeyedSubscript:v127];
          [v97 setObject:v139 forKeyedSubscript:v127];
          [v96 setObject:v137 forKeyedSubscript:v127];
          [v95 setObject:v135 forKeyedSubscript:v127];
          [v94 setObject:v133 forKeyedSubscript:v127];
          [v93 setObject:v131 forKeyedSubscript:v127];
          int v50 = [v9 PKDictionaryForKey:@"clientInfo"];
          [v88 setObject:v50 forKeyedSubscript:v127];

          uint64_t v51 = [v9 PKStringForKey:@"localizedDescription"];
          [v87 setObject:v51 forKeyedSubscript:v127];

          [v85 setObject:v145 forKeyedSubscript:v127];
          [v84 setObject:v143 forKeyedSubscript:v127];
          char v52 = [NSNumber numberWithBool:v121];
          [v86 setObject:v52 forKeyedSubscript:v127];
        }
        uint64_t v8 = v129 + 1;
      }
      while ((id)(v129 + 1) != v117);
      id v117 = (id)[obj countByEnumeratingWithState:&v195 objects:v207 count:16];
    }
    while (v117);
  }

  if (os_variant_has_internal_ui())
  {
    v53 = PKGetPaymentSetupProductState();
    uint64_t v178 = PKPaymentSetupProductStateFromString(v53);
  }
  else
  {
    uint64_t v178 = 0;
  }
  id v118 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v183 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  id v75 = v82;
  uint64_t v78 = [v75 countByEnumeratingWithState:&v183 objects:v202 count:16];
  if (v78)
  {
    uint64_t v77 = *(void *)v184;
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v184 != v77) {
          objc_enumerationMutation(v75);
        }
        uint64_t v79 = v54;
        v122 = *(void **)(*((void *)&v183 + 1) + 8 * v54);
        BOOL v55 = [v122 PKArrayContaining:objc_opt_class() forKey:@"productIdentifiers"];
        long long v179 = 0u;
        long long v180 = 0u;
        long long v181 = 0u;
        long long v182 = 0u;
        id v80 = v55;
        uint64_t v114 = [v55 countByEnumeratingWithState:&v179 objects:v201 count:16];
        if (v114)
        {
          uint64_t v83 = *(void *)v180;
          do
          {
            uint64_t v56 = 0;
            do
            {
              if (*(void *)v180 != v83) {
                objc_enumerationMutation(v80);
              }
              v57 = *(void **)(*((void *)&v179 + 1) + 8 * v56);
              v176 = [v112 objectForKey:v57];
              v174 = [v87 objectForKey:v57];
              v172 = [v111 objectForKey:v57];
              v170 = [v110 objectForKey:v57];
              v168 = [v81 objectForKey:v57];
              v166 = [v109 objectForKey:v57];
              v164 = [v113 objectForKey:v57];
              v162 = [v108 objectForKey:v57];
              v160 = [v107 objectForKey:v57];
              v158 = [v106 objectForKey:v57];
              v156 = [v105 objectForKey:v57];
              v154 = [v104 PKStringForKey:v57];
              v152 = [v103 PKNumberForKey:v57];
              v150 = [v102 PKArrayForKey:v57];
              v148 = [v101 objectForKey:v57];
              v146 = [v100 objectForKey:v57];
              v144 = [v99 objectForKey:v57];
              v142 = [v98 objectForKey:v57];
              v140 = [v97 objectForKey:v57];
              v138 = [v96 objectForKey:v57];
              v136 = [v95 objectForKey:v57];
              v134 = [v94 objectForKey:v57];
              v132 = [v93 objectForKey:v57];
              v130 = [v92 objectForKey:v57];
              v128 = [v91 objectForKey:v57];
              v126 = [v90 objectForKey:v57];
              v124 = [v89 objectForKey:v57];
              id v58 = [v88 objectForKey:v57];
              uint64_t v59 = [v85 objectForKey:v57];
              uint64_t v60 = [v84 objectForKey:v57];
              uint64_t v61 = [v86 objectForKeyedSubscript:v57];
              char v62 = [v61 BOOLValue];

              uint64_t v115 = v56;
              if (os_variant_has_internal_ui())
              {
                int v63 = PKForceLargeAmountOfProducts();
                char v64 = v63;
                if (v63) {
                  uint64_t v65 = 50;
                }
                else {
                  uint64_t v65 = 1;
                }
              }
              else
              {
                char v64 = 0;
                uint64_t v65 = 1;
              }
              do
              {
                if (v64)
                {
                  v66 = [MEMORY[0x1E4F29128] UUID];
                  id v67 = [v66 UUIDString];
                }
                else
                {
                  id v67 = v57;
                }
                v68 = [v120 objectForKey:v67];
                uint64_t v69 = v68;
                if (v68) {
                  uint64_t v70 = v68;
                }
                else {
                  uint64_t v70 = objc_alloc_init(PKPaymentSetupProduct);
                }
                uint64_t v71 = v70;

                LOBYTE(v74) = v62;
                -[PKPaymentSetupProductModel _updatePaymentSetupProduct:displayName:localizedDescription:partnerDictionary:productIdentifier:paymentOptions:termsURL:provisioningMethods:readerModeMetadata:requiredFields:imageAssets:minimumOSVersion:region:regionData:hsa2Requirement:suppressPendingPurchases:supportedTransitNetworkIdentifiers:onboardingItems:actionBaseURL:productState:minimumProductAge:maximumProductAge:minimumTargetUserSupportedAge:associatedStoreIdentifiers:appLaunchURL:regionIdentifier:type:localizedNotificationTitle:localizedNotificationMessage:discoveryCardIdentifier:clientInfo:searchTerms:featureIdentifier:allowOnManagedAccount:](self, "_updatePaymentSetupProduct:displayName:localizedDescription:partnerDictionary:productIdentifier:paymentOptions:termsURL:provisioningMethods:readerModeMetadata:requiredFields:imageAssets:minimumOSVersion:region:regionData:hsa2Requirement:suppressPendingPurchases:supportedTransitNetworkIdentifiers:onboardingItems:actionBaseURL:productState:minimumProductAge:maximumProductAge:minimumTargetUserSupportedAge:associatedStoreIdentifiers:appLaunchURL:regionIdentifier:type:localizedNotificationTitle:localizedNotificationMessage:discoveryCardIdentifier:clientInfo:searchTerms:featureIdentifier:allowOnManagedAccount:", v71, v176, v174, v122, v67, v168, v170, v166, v172, v164, v162, v160,
                  v158,
                  v156,
                  v154,
                  v152,
                  v150,
                  v148,
                  v146,
                  v144,
                  v142,
                  v140,
                  v138,
                  v136,
                  v134,
                  v132,
                  v130,
                  v128,
                  v126,
                  v124,
                  v58,
                  v59,
                  v60,
                  v74);
                if (v178)
                {
                  id v72 = PKLogFacilityTypeGetObject(6uLL);
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v200 = v57;
                    _os_log_impl(&dword_190E10000, v72, OS_LOG_TYPE_DEFAULT, "WARNING: Using debug product state to override server state for: %@", buf, 0xCu);
                  }

                  [(PKPaymentSetupProduct *)v71 _updateDebugConfigurationForState:v178];
                }
                if (v71)
                {
                  [(PKPaymentSetupProduct *)v71 setIsServerDriven:1];
                  [v118 addObject:v71];
                }

                --v65;
              }
              while (v65);

              uint64_t v56 = v115 + 1;
            }
            while (v115 + 1 != v114);
            uint64_t v114 = [v80 countByEnumeratingWithState:&v179 objects:v201 count:16];
          }
          while (v114);
        }

        uint64_t v54 = v79 + 1;
      }
      while (v79 + 1 != v78);
      uint64_t v78 = [v75 countByEnumeratingWithState:&v183 objects:v202 count:16];
    }
    while (v78);
  }

  return v118;
}

uint64_t __102__PKPaymentSetupProductModel__paymentSetupProductsWithPartners_products_existingPaymentSetupProducts___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isFieldTypeFooter];
}

- (void)_updatePaymentSetupProduct:(id)a3 displayName:(id)a4 localizedDescription:(id)a5 partnerDictionary:(id)a6 productIdentifier:(id)a7 paymentOptions:(id)a8 termsURL:(id)a9 provisioningMethods:(id)a10 readerModeMetadata:(id)a11 requiredFields:(id)a12 imageAssets:(id)a13 minimumOSVersion:(id)a14 region:(id)a15 regionData:(id)a16 hsa2Requirement:(id)a17 suppressPendingPurchases:(id)a18 supportedTransitNetworkIdentifiers:(id)a19 onboardingItems:(id)a20 actionBaseURL:(id)a21 productState:(id)a22 minimumProductAge:(id)a23 maximumProductAge:(id)a24 minimumTargetUserSupportedAge:(id)a25 associatedStoreIdentifiers:(id)a26 appLaunchURL:(id)a27 regionIdentifier:(id)a28 type:(id)a29 localizedNotificationTitle:(id)a30 localizedNotificationMessage:(id)a31 discoveryCardIdentifier:(id)a32 clientInfo:(id)a33 searchTerms:(id)a34 featureIdentifier:(id)a35 allowOnManagedAccount:(BOOL)a36
{
  id v80 = a3;
  id v41 = a4;
  id v42 = a5;
  id v43 = a6;
  id v44 = a7;
  id v45 = a8;
  id v60 = a9;
  id v57 = a10;
  id v59 = a11;
  id v79 = a12;
  id v78 = a13;
  id v77 = a14;
  id v76 = a15;
  id v75 = a16;
  id v74 = a17;
  id v73 = a18;
  id v72 = a19;
  id v71 = a20;
  id v70 = a21;
  id v69 = a22;
  id v68 = a23;
  id v67 = a24;
  id v66 = a25;
  id v65 = a26;
  id v64 = a27;
  id v63 = a28;
  id v46 = a29;
  id v61 = a30;
  id v47 = a31;
  id v48 = a32;
  id v49 = a33;
  id v56 = a34;
  id v55 = a35;
  int v50 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v43];
  id v58 = v43;
  uint64_t v51 = [v43 PKStringForKey:@"localizedDisplayName"];
  if ([v51 length]) {
    [v50 setObject:v51 forKey:@"partnerLocalizedDisplayName"];
  }
  char v62 = v46;
  if ([v41 length]) {
    [v50 setObject:v41 forKey:@"localizedProductName"];
  }
  char v52 = v59;
  if ([v42 length]) {
    [v50 setObject:v42 forKey:@"localizedDescription"];
  }
  if ([v62 length]) {
    [v50 setObject:v62 forKey:@"type"];
  }
  if ([v61 length]) {
    [v50 setObject:v61 forKey:@"localizedNotificationTitle"];
  }
  if ([v47 length]) {
    [v50 setObject:v47 forKey:@"localizedNotificationMessage"];
  }
  if ([v48 length]) {
    [v50 setObject:v48 forKey:@"discoveryCardIdentifier"];
  }
  if (objc_msgSend(v44, "length", v47)) {
    [v50 setObject:v44 forKey:@"productIdentifier"];
  }
  if ([v60 length]) {
    [v50 setObject:v60 forKey:@"termsURL"];
  }
  if ([v45 count]) {
    [v50 setObject:v45 forKey:@"paymentOptions"];
  }
  if ([v57 count]) {
    [v50 setObject:v57 forKey:@"provisioningMethods"];
  }
  if (v59) {
    [v50 setObject:v59 forKey:@"readerModeMetadata"];
  }
  if ([v79 count])
  {
    [v50 removeObjectForKey:@"requiredFields"];
    [v50 removeObjectForKey:@"requiredFieldOptions"];
  }
  if ([v78 count]) {
    [v50 setObject:v78 forKey:@"imageAssets"];
  }
  if ([v77 count]) {
    [v50 setObject:v77 forKey:@"minimumOSVersion"];
  }
  if ([v76 length]) {
    [v50 setObject:v76 forKey:@"region"];
  }
  if ([v75 count]) {
    [v50 setObject:v75 forKey:@"regionData"];
  }
  if (v74) {
    [v50 setObject:v74 forKey:@"hsa2Requirement"];
  }
  if (v73) {
    [v50 setObject:v73 forKey:@"suppressPendingPurchases"];
  }
  if ([v72 count]) {
    [v50 setObject:v72 forKey:@"supportedTransitNetworkIdentifiers"];
  }
  if (v71) {
    [v50 setObject:v71 forKey:@"onboardingItems"];
  }
  if (v70) {
    [v50 setObject:v70 forKey:@"actionBaseURL"];
  }
  if (v69) {
    [v50 setObject:v69 forKey:@"state"];
  }
  if (v68) {
    [v50 setObject:v68 forKey:@"minimumSupportedAge"];
  }
  if (v67) {
    [v50 setObject:v67 forKey:@"maximumSupportedAge"];
  }
  if (v66) {
    [v50 setObject:v66 forKey:@"minimumTargetUserSupportedAge"];
  }
  if ([v65 count]) {
    [v50 setObject:v65 forKey:@"associatedStoreIdentifiers"];
  }
  if (v64) {
    [v50 setObject:v64 forKey:@"appLaunchURL"];
  }
  if ([v63 length]) {
    [v50 setObject:v63 forKey:@"registrationRegionIdentifier"];
  }
  if (v49) {
    [v50 setObject:v49 forKey:@"clientInfo"];
  }
  if (v56) {
    [v50 setObject:v56 forKey:@"searchTerms"];
  }
  if (v55) {
    [v50 setObject:v55 forKey:@"featureIdentifier"];
  }
  if (a36) {
    [v50 setObject:MEMORY[0x1E4F1CC38] forKey:@"allowOnManagedAccount"];
  }
  [v80 updateWithProductDictionary:v50];
  if ([v79 count])
  {
    v53 = (void *)[v79 copy];
    [v80 setRequiredFields:v53];

    char v52 = v59;
  }
}

- (id)_paymentSetupProductsWithProducts:(id)a3 existingPaymentSetupProducts:(id)a4
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_ui())
  {
    uint64_t v8 = PKGetPaymentSetupProductState();
    uint64_t v100 = PKPaymentSetupProductStateFromString(v8);
  }
  else
  {
    uint64_t v100 = 0;
  }
  id v72 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  id obj = v6;
  uint64_t v68 = [obj countByEnumeratingWithState:&v115 objects:v126 count:16];
  if (v68)
  {
    uint64_t v65 = *(void *)v116;
    id v66 = v7;
    id v67 = self;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v116 != v65) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v115 + 1) + 8 * v9);
        v98 = [v10 PKArrayContaining:objc_opt_class() forKey:@"partners"];
        v101 = [v10 PKStringForKey:@"identifier"];
        long long v97 = [v10 PKStringForKey:@"type"];
        long long v96 = [v10 PKStringForKey:@"localizedNotificationTitle"];
        long long v95 = [v10 PKStringForKey:@"localizedNotificationMessage"];
        long long v94 = [v10 PKStringForKey:@"discoveryCardIdentifier"];
        uint64_t v11 = [v10 PKStringForKey:@"localizedProductName"];
        uint64_t v12 = v11;
        uint64_t v70 = v9;
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          id v13 = [v10 PKStringForKey:@"localizedDisplayName"];
        }
        v99 = v13;

        long long v93 = [v10 PKDictionaryForKey:@"readerModeMetadata"];
        long long v92 = [v10 PKStringForKey:@"termsURL"];
        long long v14 = [v10 PKArrayForKey:@"provisioningMethodDetailsList"];
        long long v91 = [v10 PKDictionaryForKey:@"imageAssets"];
        long long v90 = [v10 PKDictionaryForKey:@"minimumOSVersion"];
        uint64_t v89 = [v10 PKStringForKey:@"region"];
        long long v88 = [v10 PKDictionaryForKey:@"regionData"];
        id v87 = [v10 PKStringForKey:@"hsa2Requirement"];
        long long v86 = [v10 PKNumberForKey:@"suppressPendingPurchases"];
        id v85 = [v10 PKArrayContaining:objc_opt_class() forKey:@"supportedTransitNetworkIdentifiers"];
        id v84 = [v10 PKArrayForKey:@"onboardingItems"];
        uint64_t v83 = [v10 PKURLForKey:@"actionBaseURL"];
        id v82 = [v10 PKStringForKey:@"state"];
        id v81 = [v10 PKArrayContaining:objc_opt_class() forKey:@"searchTerms"];
        id v80 = [v10 PKStringForKey:@"featureIdentifier"];
        id v79 = [v10 PKArrayForKey:@"paymentOptions"];
        id v78 = [v10 PKStringForKey:@"localizedDescription"];
        id v77 = [v10 PKDictionaryForKey:@"clientInfo"];
        uint64_t v15 = [v10 PKNumberForKey:@"minimumSupportedAge"];
        uint64_t v16 = [v10 PKNumberForKey:@"maximumSupportedAge"];
        uint64_t v17 = [v10 PKNumberForKey:@"minimumTargetUserSupportedAge"];
        uint64_t v18 = &unk_1EE22C7D0;
        if (v15) {
          id v19 = (void *)v15;
        }
        else {
          id v19 = &unk_1EE22C7D0;
        }
        uint64_t v20 = &unk_1EE22C7E8;
        if (v16) {
          uint64_t v20 = (void *)v16;
        }
        id v75 = v20;
        id v76 = v19;
        if (v17) {
          uint64_t v18 = (void *)v17;
        }
        id v74 = v18;
        id v73 = [v10 PKArrayForKey:@"associatedStoreIdentifiers"];
        long long v111 = 0u;
        long long v112 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        id v102 = v14;
        uint64_t v21 = [v102 countByEnumeratingWithState:&v111 objects:v125 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = 0;
          uint64_t v24 = *(void *)v112;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v112 != v24) {
                objc_enumerationMutation(v102);
              }
              uint64_t v26 = *(void **)(*((void *)&v111 + 1) + 8 * i);
              id v27 = [v26 PKStringForKey:@"provisioningMethodType"];
              if ([v27 isEqualToString:@"inApp"]
                || [v27 isEqualToString:@"cameraCapture"])
              {
                uint64_t v28 = [v26 PKStringForKey:@"appLaunchURLScheme"];
                long long v29 = [v26 PKStringForKey:@"appLaunchURLPath"];
                long long v30 = +[PKPaymentSetupProduct _inAppProvisioningURLWthScheme:v28 path:v29];
                uint64_t v31 = [v30 absoluteString];

                uint64_t v23 = (void *)v31;
              }
            }
            uint64_t v22 = [v102 countByEnumeratingWithState:&v111 objects:v125 count:16];
          }
          while (v22);
        }
        else
        {
          uint64_t v23 = 0;
        }

        id v69 = [v10 PKStringForKey:@"registrationRegionIdentifier"];
        long long v32 = [MEMORY[0x1E4F1CA48] array];
        long long v107 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        id v33 = [v10 PKArrayContaining:objc_opt_class() forKey:@"requiredFields"];
        uint64_t v34 = [v33 countByEnumeratingWithState:&v107 objects:v124 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v108;
          do
          {
            for (uint64_t j = 0; j != v35; ++j)
            {
              if (*(void *)v108 != v36) {
                objc_enumerationMutation(v33);
              }
              uint64_t v38 = *(void *)(*((void *)&v107 + 1) + 8 * j);
              char v39 = [v10 PKDictionaryForKey:@"requiredFieldOptions"];
              uint64_t v40 = [v39 PKDictionaryForKey:v38];

              id v41 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:v38 configuration:v40];
              [v32 safelyAddObject:v41];
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v107 objects:v124 count:16];
          }
          while (v35);
        }

        id v42 = [v10 PKArrayContaining:objc_opt_class() forKey:@"paymentOptions"];
        long long v103 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        id v43 = v42;
        uint64_t v44 = [v43 countByEnumeratingWithState:&v103 objects:v123 count:16];
        id v71 = v43;
        id v7 = v66;
        if (!v44)
        {
LABEL_49:

          goto LABEL_50;
        }
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v104;
LABEL_40:
        uint64_t v47 = 0;
        while (1)
        {
          if (*(void *)v104 != v46) {
            objc_enumerationMutation(v71);
          }
          id v48 = [[PKPaymentSetupProductPaymentOption alloc] initWithPaymentOptionDictionary:*(void *)(*((void *)&v103 + 1) + 8 * v47)];
          uint64_t v49 = [(PKPaymentSetupProductPaymentOption *)v48 cardType];

          if (v49 == 103) {
            break;
          }
          if (v45 == ++v47)
          {
            uint64_t v45 = [v71 countByEnumeratingWithState:&v103 objects:v123 count:16];
            if (!v45)
            {
              id v43 = v71;
              goto LABEL_49;
            }
            goto LABEL_40;
          }
        }

        if ((objc_msgSend(v32, "pk_containsObjectPassingTest:", &__block_literal_global_1113) & 1) == 0)
        {
          v121[0] = @"fieldType";
          int v50 = PKPaymentSetupFieldTypeToString(4);
          v122[0] = v50;
          v121[1] = @"defaultValue";
          uint64_t v51 = PKLocalizedPaymentString(&cfstr_AddPaymentSuic.isa, 0);
          v122[1] = v51;
          id v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v122 forKeys:v121 count:2];

          char v52 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"suicaPrivacyFooter" configuration:v43];
          [v32 safelyAddObject:v52];

          goto LABEL_49;
        }
LABEL_50:
        if (os_variant_has_internal_ui())
        {
          int v53 = PKForceLargeAmountOfProducts();
          char v54 = v53;
          if (v53) {
            uint64_t v55 = 50;
          }
          else {
            uint64_t v55 = 1;
          }
        }
        else
        {
          char v54 = 0;
          uint64_t v55 = 1;
        }
        do
        {
          if (v101)
          {
            if (v54) {
              goto LABEL_57;
            }
          }
          else
          {
            v101 = [NSString stringWithFormat:@"%@%@", v99, v23];
            if (v54)
            {
LABEL_57:
              id v56 = [MEMORY[0x1E4F29128] UUID];
              id v57 = [v56 UUIDString];

              goto LABEL_60;
            }
          }
          id v57 = v101;
LABEL_60:
          id v58 = [v66 objectForKey:v57];
          id v59 = v58;
          if (v58) {
            id v60 = v58;
          }
          else {
            id v60 = objc_alloc_init(PKPaymentSetupProduct);
          }
          id v61 = v60;

          -[PKPaymentSetupProductModel _updatePaymentSetupProduct:displayName:localizedDescription:partnerArray:productIdentifier:paymentOptions:termsURL:provisioningMethodDetailsList:readerModeMetadata:requiredFields:imageAssets:minimumOSVersion:region:regionData:hsa2Requirement:suppressPendingPurchases:supportedTransitNetworkIdentifiers:onboardingItems:actionBaseURL:productState:minimumProductAge:maximumProductAge:minimumTargetUserSupportedAge:associatedStoreIdentifiers:appLaunchURL:regionIdentifier:type:localizedNotificationTitle:localizedNotificationMessage:discoveryCardIdentifier:clientInfo:searchTerms:featureIdentifier:](v67, "_updatePaymentSetupProduct:displayName:localizedDescription:partnerArray:productIdentifier:paymentOptions:termsURL:provisioningMethodDetailsList:readerModeMetadata:requiredFields:imageAssets:minimumOSVersion:region:regionData:hsa2Requirement:suppressPendingPurchases:supportedTransitNetworkIdentifiers:onboardingItems:actionBaseURL:productState:minimumProductAge:maximumProductAge:minimumTargetUserSupportedAge:associatedStoreIdentifiers:appLaunchURL:regionIdentifier:type:localizedNotificationTitle:localizedNotificationMessage:discoveryCardIdentifier:clientInfo:searchTerms:featureIdentifier:", v61, v99, v78, v98, v57, v79, v92, v102, v93, v32, v91, v90,
            v89,
            v88,
            v87,
            v86,
            v85,
            v84,
            v83,
            v82,
            v76,
            v75,
            v74,
            v73,
            v23,
            v69,
            v97,
            v96,
            v95,
            v94,
            v77,
            v81,
            v80);
          if (v100)
          {
            char v62 = PKLogFacilityTypeGetObject(6uLL);
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v120 = v101;
              _os_log_impl(&dword_190E10000, v62, OS_LOG_TYPE_DEFAULT, "WARNING: Using debug product state to override server state for: %@", buf, 0xCu);
            }

            [(PKPaymentSetupProduct *)v61 _updateDebugConfigurationForState:v100];
          }
          if (v61)
          {
            [(PKPaymentSetupProduct *)v61 setIsServerDriven:1];
            [v72 addObject:v61];
          }

          --v55;
        }
        while (v55);

        uint64_t v9 = v70 + 1;
      }
      while (v70 + 1 != v68);
      uint64_t v68 = [obj countByEnumeratingWithState:&v115 objects:v126 count:16];
    }
    while (v68);
  }

  return v72;
}

uint64_t __93__PKPaymentSetupProductModel__paymentSetupProductsWithProducts_existingPaymentSetupProducts___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isFieldTypeFooter];
}

- (void)_updatePaymentSetupProduct:(id)a3 displayName:(id)a4 localizedDescription:(id)a5 partnerArray:(id)a6 productIdentifier:(id)a7 paymentOptions:(id)a8 termsURL:(id)a9 provisioningMethodDetailsList:(id)a10 readerModeMetadata:(id)a11 requiredFields:(id)a12 imageAssets:(id)a13 minimumOSVersion:(id)a14 region:(id)a15 regionData:(id)a16 hsa2Requirement:(id)a17 suppressPendingPurchases:(id)a18 supportedTransitNetworkIdentifiers:(id)a19 onboardingItems:(id)a20 actionBaseURL:(id)a21 productState:(id)a22 minimumProductAge:(id)a23 maximumProductAge:(id)a24 minimumTargetUserSupportedAge:(id)a25 associatedStoreIdentifiers:(id)a26 appLaunchURL:(id)a27 regionIdentifier:(id)a28 type:(id)a29 localizedNotificationTitle:(id)a30 localizedNotificationMessage:(id)a31 discoveryCardIdentifier:(id)a32 clientInfo:(id)a33 searchTerms:(id)a34 featureIdentifier:(id)a35
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v97 = a3;
  id v71 = a4;
  id v70 = a5;
  id v40 = a6;
  id v69 = a7;
  id v95 = a8;
  id v94 = a9;
  id v41 = a10;
  id v68 = a11;
  id v42 = a12;
  id v43 = a13;
  id v67 = a14;
  id v44 = a15;
  id v45 = a16;
  id v90 = a17;
  id v89 = a18;
  id v88 = a19;
  id v87 = a20;
  id v86 = a21;
  id v85 = a22;
  id v84 = a23;
  id v83 = a24;
  id v82 = a25;
  id v81 = a26;
  id v80 = a27;
  id v79 = a28;
  id v78 = a29;
  id v77 = a30;
  id v76 = a31;
  id v75 = a32;
  id v74 = a33;
  id v73 = a34;
  id v72 = a35;
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v40 count]) {
    [v46 setObject:v40 forKey:@"partners"];
  }
  long long v92 = v44;
  long long v93 = v43;
  v98 = v42;
  uint64_t v47 = v71;
  if ([v71 length]) {
    [v46 setObject:v71 forKey:@"localizedProductName"];
  }
  id v48 = v70;
  int v50 = v68;
  uint64_t v49 = v69;
  if ([v70 length]) {
    [v46 setObject:v70 forKey:@"localizedDescription"];
  }
  if ([v78 length]) {
    [v46 setObject:v78 forKey:@"type"];
  }
  if ([v77 length]) {
    [v46 setObject:v77 forKey:@"localizedNotificationTitle"];
  }
  if ([v76 length]) {
    [v46 setObject:v76 forKey:@"localizedNotificationMessage"];
  }
  if ([v75 length]) {
    [v46 setObject:v75 forKey:@"discoveryCardIdentifier"];
  }
  if ([v69 length]) {
    [v46 setObject:v69 forKey:@"productIdentifier"];
  }
  if ([v94 length]) {
    [v46 setObject:v94 forKey:@"termsURL"];
  }
  if ([v95 count]) {
    [v46 setObject:v95 forKey:@"paymentOptions"];
  }
  if ([v41 count]) {
    [v46 setObject:v41 forKey:@"provisioningMethodDetailsList"];
  }
  if (v68) {
    [v46 setObject:v68 forKey:@"readerModeMetadata"];
  }
  if ([v42 count])
  {
    [v46 removeObjectForKey:@"requiredFields"];
    [v46 removeObjectForKey:@"requiredFieldOptions"];
  }
  if ([v93 count]) {
    [v46 setObject:v93 forKey:@"imageAssets"];
  }
  long long v91 = v45;
  uint64_t v51 = v67;
  if ([v67 count]) {
    [v46 setObject:v67 forKey:@"minimumOSVersion"];
  }
  if ([v92 length]) {
    [v46 setObject:v92 forKey:@"region"];
  }
  if ([v45 count]) {
    [v46 setObject:v45 forKey:@"regionData"];
  }
  if (v90) {
    [v46 setObject:v90 forKey:@"hsa2Requirement"];
  }
  if (v89) {
    [v46 setObject:v89 forKey:@"suppressPendingPurchases"];
  }
  if ([v88 count]) {
    [v46 setObject:v88 forKey:@"supportedTransitNetworkIdentifiers"];
  }
  if (v87) {
    [v46 setObject:v87 forKey:@"onboardingItems"];
  }
  if (v86) {
    [v46 setObject:v86 forKey:@"actionBaseURL"];
  }
  if (v85) {
    [v46 setObject:v85 forKey:@"state"];
  }
  if (v84) {
    [v46 setObject:v84 forKey:@"minimumSupportedAge"];
  }
  if (v83) {
    [v46 setObject:v83 forKey:@"maximumSupportedAge"];
  }
  if (v82) {
    [v46 setObject:v82 forKey:@"minimumTargetUserSupportedAge"];
  }
  if ([v81 count]) {
    [v46 setObject:v81 forKey:@"associatedStoreIdentifiers"];
  }
  if (v80) {
    [v46 setObject:v80 forKey:@"appLaunchURL"];
  }
  if ([v79 length]) {
    [v46 setObject:v79 forKey:@"registrationRegionIdentifier"];
  }
  if (v74) {
    [v46 setObject:v74 forKey:@"clientInfo"];
  }
  if (v73) {
    [v46 setObject:v73 forKey:@"searchTerms"];
  }
  if (v72) {
    [v46 setObject:v72 forKey:@"featureIdentifier"];
  }
  if ([v40 count])
  {
    id v65 = v41;
    id v66 = v40;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id obj = v40;
    uint64_t v52 = [obj countByEnumeratingWithState:&v99 objects:v103 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      uint64_t v54 = *(void *)v100;
      do
      {
        for (uint64_t i = 0; i != v53; ++i)
        {
          if (*(void *)v100 != v54) {
            objc_enumerationMutation(obj);
          }
          id v56 = *(void **)(*((void *)&v99 + 1) + 8 * i);
          id v57 = objc_msgSend(v56, "PKStringForKey:", @"localizedDisplayName", v65, v66);
          if ([v57 length]) {
            [v46 setObject:v57 forKey:@"partnerLocalizedDisplayName"];
          }
          id v58 = [v56 PKStringForKey:@"identifier"];
          if ([v58 length]) {
            [v46 setObject:v58 forKey:@"identifier"];
          }
          if ([v98 count])
          {
            id v59 = (void *)[v98 copy];
            [v97 setRequiredFields:v59];
          }
          id v60 = (void *)[v46 copy];
          [v97 updateWithProductDictionary:v60];
        }
        uint64_t v53 = [obj countByEnumeratingWithState:&v99 objects:v103 count:16];
      }
      while (v53);
    }

    id v61 = v97;
    id v48 = v70;
    uint64_t v47 = v71;
    id v41 = v65;
    id v40 = v66;
    int v50 = v68;
    uint64_t v49 = v69;
    char v62 = v94;
    uint64_t v51 = v67;
  }
  else
  {
    id v61 = v97;
    if ([v98 count])
    {
      id v63 = (void *)[v98 copy];
      [v97 setRequiredFields:v63];
    }
    id v64 = (void *)[v46 copy];
    [v97 updateWithProductDictionary:v64];

    char v62 = v94;
  }
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = [(NSMutableDictionary *)self->_paymentSetupProducts description];
  [v3 appendFormat:@"products: '%@'; ", v4];

  uint64_t v5 = [(NSMutableArray *)self->_allSections description];
  [v3 appendFormat:@"sections: '%@'; ", v5];

  [v3 appendFormat:@">"];
  id v6 = (void *)[v3 copy];

  return v6;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_allSections, 0);
  objc_storeStrong((id *)&self->_paymentSetupProducts, 0);
}

@end