@interface SSVSubscriptionEntitlements
+ (id)_parseJSONDictionary:(id)a3;
+ (id)_valueForKey:(id)a3 fromDictionary:(id)a4 ofType:(Class)a5;
- (NSArray)entitledSubscriptions;
- (NSDate)cachedTimestamp;
- (NSNumber)accountIdentifier;
- (NSNumber)accountStoreFrontIdentifier;
- (NSString)accountISO3Country;
- (SSVSubscriptionEntitlements)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (void)setAccountISO3Country:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountStoreFrontIdentifier:(id)a3;
- (void)setCachedTimestamp:(id)a3;
- (void)setEntitledSubscriptions:(id)a3;
@end

@implementation SSVSubscriptionEntitlements

+ (id)_parseJSONDictionary:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(SSVSubscriptionEntitlements);
  uint64_t v6 = [a1 _valueForKey:@"user" fromDictionary:v4 ofType:objc_opt_class()];
  v35 = [a1 _valueForKey:@"ISO3Country" fromDictionary:v6 ofType:objc_opt_class()];
  -[SSVSubscriptionEntitlements setAccountISO3Country:](v5, "setAccountISO3Country:");
  v34 = [a1 _valueForKey:@"dsId" fromDictionary:v6 ofType:objc_opt_class()];
  -[SSVSubscriptionEntitlements setAccountIdentifier:](v5, "setAccountIdentifier:");
  v36 = (void *)v6;
  v33 = [a1 _valueForKey:@"storeFrontId" fromDictionary:v6 ofType:objc_opt_class()];
  -[SSVSubscriptionEntitlements setAccountStoreFrontIdentifier:](v5, "setAccountStoreFrontIdentifier:");
  [a1 _valueForKey:@"cacheTimestamp" fromDictionary:v4 ofType:objc_opt_class()];
  v32 = v38 = v5;
  -[SSVSubscriptionEntitlements setCachedTimestamp:](v5, "setCachedTimestamp:");
  v37 = v4;
  v7 = [a1 _valueForKey:@"subscriptions" fromDictionary:v4 ofType:objc_opt_class()];
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v63;
    uint64_t v39 = *(void *)v63;
    do
    {
      uint64_t v11 = 0;
      uint64_t v40 = v9;
      do
      {
        if (*(void *)v63 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v62 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v43 = v11;
          id v13 = v12;
          v46 = [a1 _valueForKey:@"appAdamId" fromDictionary:v13 ofType:objc_opt_class()];
          v42 = v13;
          v14 = [a1 _valueForKey:@"inAppSubscriptions" fromDictionary:v13 ofType:objc_opt_class()];
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          id v48 = v14;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v58 objects:v66 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v59;
            uint64_t v45 = *(void *)v59;
            do
            {
              uint64_t v18 = 0;
              uint64_t v47 = v16;
              do
              {
                if (*(void *)v59 != v17) {
                  objc_enumerationMutation(v48);
                }
                v19 = *(void **)(*((void *)&v58 + 1) + 8 * v18);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v20 = v19;
                  v21 = objc_alloc_init(SSVSubscriptionEntitlementsSubscription);
                  [(SSVSubscriptionEntitlementsSubscription *)v21 setAppAdamId:v46];
                  v57 = [a1 _valueForKey:@"appVersion" fromDictionary:v20 ofType:objc_opt_class()];
                  -[SSVSubscriptionEntitlementsSubscription setAppVersion:](v21, "setAppVersion:");
                  v56 = [a1 _valueForKey:@"chargeCountryCode" fromDictionary:v20 ofType:objc_opt_class()];
                  -[SSVSubscriptionEntitlementsSubscription setChargeCountryCode:](v21, "setChargeCountryCode:");
                  v55 = [a1 _valueForKey:@"chargeCurrencyCode" fromDictionary:v20 ofType:objc_opt_class()];
                  -[SSVSubscriptionEntitlementsSubscription setChargeCurrencyCode:](v21, "setChargeCurrencyCode:");
                  v54 = [a1 _valueForKey:@"chargeStoreFrontId" fromDictionary:v20 ofType:objc_opt_class()];
                  -[SSVSubscriptionEntitlementsSubscription setChargeStoreFrontIdentifier:](v21, "setChargeStoreFrontIdentifier:");
                  uint64_t v22 = [a1 _valueForKey:@"expireDate" fromDictionary:v20 ofType:objc_opt_class()];
                  if (v22)
                  {
                    id v23 = objc_alloc_init(MEMORY[0x1E4F28C10]);
                    [v23 setDateFormat:@"EEE MMM dd HH:mm:ss z yyyy"];
                    v24 = [v23 dateFromString:v22];
                    if (v24) {
                      [(SSVSubscriptionEntitlementsSubscription *)v21 setExpireDate:v24];
                    }
                  }
                  v53 = [a1 _valueForKey:@"familyId" fromDictionary:v20 ofType:objc_opt_class()];
                  [(SSVSubscriptionEntitlementsSubscription *)v21 setFamilyId:v53];
                  v52 = [a1 _valueForKey:@"inAppAdamId" fromDictionary:v20 ofType:objc_opt_class()];
                  [(SSVSubscriptionEntitlementsSubscription *)v21 setInAppAdamId:v52];
                  v51 = [a1 _valueForKey:@"inAppVersion" fromDictionary:v20 ofType:objc_opt_class()];
                  [(SSVSubscriptionEntitlementsSubscription *)v21 setInAppVersion:v51];
                  v50 = [a1 _valueForKey:@"isNewsAppPurchase" fromDictionary:v20 ofType:objc_opt_class()];
                  -[SSVSubscriptionEntitlementsSubscription setNewsAppPurchase:](v21, "setNewsAppPurchase:", [v50 BOOLValue]);
                  v25 = [a1 _valueForKey:@"offerIdentifier" fromDictionary:v20 ofType:objc_opt_class()];
                  [(SSVSubscriptionEntitlementsSubscription *)v21 setOfferIdentifier:v25];
                  v26 = [a1 _valueForKey:@"originalPurchaseDownloadId" fromDictionary:v20 ofType:objc_opt_class()];
                  [(SSVSubscriptionEntitlementsSubscription *)v21 setOriginalPurchaseDownloadId:v26];
                  [a1 _valueForKey:@"purchasabilityType" fromDictionary:v20 ofType:objc_opt_class()];
                  v27 = v49 = (void *)v22;
                  [(SSVSubscriptionEntitlementsSubscription *)v21 setPurchasabilityType:v27];
                  v28 = [a1 _valueForKey:@"purchaseDownloadId" fromDictionary:v20 ofType:objc_opt_class()];
                  [(SSVSubscriptionEntitlementsSubscription *)v21 setPurchaseDownloadId:v28];
                  v29 = [a1 _valueForKey:@"quantity" fromDictionary:v20 ofType:objc_opt_class()];
                  [(SSVSubscriptionEntitlementsSubscription *)v21 setQuantity:v29];
                  v30 = [a1 _valueForKey:@"vendorIdentifier" fromDictionary:v20 ofType:objc_opt_class()];
                  [(SSVSubscriptionEntitlementsSubscription *)v21 setVendorIdentifier:v30];
                  [v44 addObject:v21];

                  uint64_t v17 = v45;
                  uint64_t v16 = v47;
                }
                ++v18;
              }
              while (v16 != v18);
              uint64_t v16 = [v48 countByEnumeratingWithState:&v58 objects:v66 count:16];
            }
            while (v16);
          }

          uint64_t v10 = v39;
          uint64_t v9 = v40;
          uint64_t v11 = v43;
        }
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v9);
  }

  [(SSVSubscriptionEntitlements *)v38 setEntitledSubscriptions:v44];
  return v38;
}

+ (id)_valueForKey:(id)a3 fromDictionary:(id)a4 ofType:(Class)a5
{
  v5 = [a4 valueForKey:a3];
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SSVSubscriptionEntitlements *)self accountIdentifier];
  [v4 setAccountIdentifier:v5];

  uint64_t v6 = [(SSVSubscriptionEntitlements *)self accountStoreFrontIdentifier];
  [v4 setAccountStoreFrontIdentifier:v6];

  id v7 = [(SSVSubscriptionEntitlements *)self accountISO3Country];
  [v4 setAccountISO3Country:v7];

  uint64_t v8 = [(SSVSubscriptionEntitlements *)self cachedTimestamp];
  [v4 setCachedTimestamp:v8];

  uint64_t v9 = [(SSVSubscriptionEntitlements *)self entitledSubscriptions];
  [v4 setEntitledSubscriptions:v9];

  return v4;
}

- (SSVSubscriptionEntitlements)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v25.receiver = self;
    v25.super_class = (Class)SSVSubscriptionEntitlements;
    uint64_t v6 = [(SSVSubscriptionEntitlements *)&v25 init];
    if (v6)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      accountIdentifier = v6->_accountIdentifier;
      v6->_accountIdentifier = (NSNumber *)v9;

      uint64_t v11 = objc_opt_class();
      uint64_t v12 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v11);
      accountStoreFrontIdentifier = v6->_accountStoreFrontIdentifier;
      v6->_accountStoreFrontIdentifier = (NSNumber *)v12;

      uint64_t v14 = objc_opt_class();
      uint64_t v15 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v14);
      accountISO3Country = v6->_accountISO3Country;
      v6->_accountISO3Country = (NSString *)v15;

      uint64_t v17 = objc_opt_class();
      uint64_t v18 = SSXPCDictionaryCopyObjectWithClass(v5, "4", v17);
      cachedTimestamp = v6->_cachedTimestamp;
      v6->_cachedTimestamp = (NSDate *)v18;

      id v20 = xpc_dictionary_get_value(v5, "3");
      uint64_t v21 = objc_opt_class();
      id v22 = SSXPCCreateNSArrayFromXPCEncodedArray(v20, v21);
      uint64_t v23 = [v22 copy];
      entitledSubscriptions = v6->_entitledSubscriptions;
      v6->_entitledSubscriptions = (NSArray *)v23;
    }
  }
  else
  {

    uint64_t v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_accountIdentifier);
  SSXPCDictionarySetObject(v3, "1", self->_accountStoreFrontIdentifier);
  SSXPCDictionarySetObject(v3, "2", self->_accountISO3Country);
  SSXPCDictionarySetObject(v3, "4", self->_cachedTimestamp);
  SSXPCDictionarySetObject(v3, "3", self->_entitledSubscriptions);
  return v3;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSNumber)accountStoreFrontIdentifier
{
  return self->_accountStoreFrontIdentifier;
}

- (void)setAccountStoreFrontIdentifier:(id)a3
{
}

- (NSString)accountISO3Country
{
  return self->_accountISO3Country;
}

- (void)setAccountISO3Country:(id)a3
{
}

- (NSArray)entitledSubscriptions
{
  return self->_entitledSubscriptions;
}

- (void)setEntitledSubscriptions:(id)a3
{
}

- (NSDate)cachedTimestamp
{
  return self->_cachedTimestamp;
}

- (void)setCachedTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTimestamp, 0);
  objc_storeStrong((id *)&self->_entitledSubscriptions, 0);
  objc_storeStrong((id *)&self->_accountISO3Country, 0);
  objc_storeStrong((id *)&self->_accountStoreFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end