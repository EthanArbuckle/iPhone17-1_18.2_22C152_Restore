@interface SSVSubscriptionEntitlementsSubscription
- (BOOL)isNewsAppPurchase;
- (NSDate)expireDate;
- (NSNumber)appAdamId;
- (NSNumber)appVersion;
- (NSNumber)chargeStoreFrontIdentifier;
- (NSNumber)familyId;
- (NSNumber)inAppAdamId;
- (NSNumber)originalPurchaseDownloadId;
- (NSNumber)purchasabilityType;
- (NSNumber)purchaseDownloadId;
- (NSNumber)quantity;
- (NSString)chargeCountryCode;
- (NSString)chargeCurrencyCode;
- (NSString)inAppVersion;
- (NSString)offerIdentifier;
- (NSString)vendorIdentifier;
- (SSVSubscriptionEntitlementsSubscription)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (void)setAppAdamId:(id)a3;
- (void)setAppVersion:(id)a3;
- (void)setChargeCountryCode:(id)a3;
- (void)setChargeCurrencyCode:(id)a3;
- (void)setChargeStoreFrontIdentifier:(id)a3;
- (void)setExpireDate:(id)a3;
- (void)setFamilyId:(id)a3;
- (void)setInAppAdamId:(id)a3;
- (void)setInAppVersion:(id)a3;
- (void)setNewsAppPurchase:(BOOL)a3;
- (void)setOfferIdentifier:(id)a3;
- (void)setOriginalPurchaseDownloadId:(id)a3;
- (void)setPurchasabilityType:(id)a3;
- (void)setPurchaseDownloadId:(id)a3;
- (void)setQuantity:(id)a3;
- (void)setVendorIdentifier:(id)a3;
@end

@implementation SSVSubscriptionEntitlementsSubscription

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SSVSubscriptionEntitlementsSubscription *)self appAdamId];
  [v4 setAppAdamId:v5];

  v6 = [(SSVSubscriptionEntitlementsSubscription *)self appVersion];
  [v4 setAppVersion:v6];

  v7 = [(SSVSubscriptionEntitlementsSubscription *)self chargeCountryCode];
  [v4 setChargeCountryCode:v7];

  v8 = [(SSVSubscriptionEntitlementsSubscription *)self chargeCurrencyCode];
  [v4 setChargeCurrencyCode:v8];

  v9 = [(SSVSubscriptionEntitlementsSubscription *)self chargeStoreFrontIdentifier];
  [v4 setChargeStoreFrontIdentifier:v9];

  v10 = [(SSVSubscriptionEntitlementsSubscription *)self expireDate];
  [v4 setExpireDate:v10];

  v11 = [(SSVSubscriptionEntitlementsSubscription *)self familyId];
  [v4 setFamilyId:v11];

  v12 = [(SSVSubscriptionEntitlementsSubscription *)self inAppAdamId];
  [v4 setInAppAdamId:v12];

  v13 = [(SSVSubscriptionEntitlementsSubscription *)self inAppVersion];
  [v4 setInAppVersion:v13];

  objc_msgSend(v4, "setNewsAppPurchase:", -[SSVSubscriptionEntitlementsSubscription isNewsAppPurchase](self, "isNewsAppPurchase"));
  v14 = [(SSVSubscriptionEntitlementsSubscription *)self offerIdentifier];
  [v4 setOfferIdentifier:v14];

  v15 = [(SSVSubscriptionEntitlementsSubscription *)self originalPurchaseDownloadId];
  [v4 setOriginalPurchaseDownloadId:v15];

  v16 = [(SSVSubscriptionEntitlementsSubscription *)self purchasabilityType];
  [v4 setPurchasabilityType:v16];

  v17 = [(SSVSubscriptionEntitlementsSubscription *)self purchaseDownloadId];
  [v4 setPurchaseDownloadId:v17];

  v18 = [(SSVSubscriptionEntitlementsSubscription *)self quantity];
  [v4 setQuantity:v18];

  v19 = [(SSVSubscriptionEntitlementsSubscription *)self vendorIdentifier];
  [v4 setVendorIdentifier:v19];

  return v4;
}

- (SSVSubscriptionEntitlementsSubscription)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v55.receiver = self;
    v55.super_class = (Class)SSVSubscriptionEntitlementsSubscription;
    v6 = [(SSVSubscriptionEntitlementsSubscription *)&v55 init];
    if (v6)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      appAdamId = v6->_appAdamId;
      v6->_appAdamId = (NSNumber *)v9;

      uint64_t v11 = objc_opt_class();
      uint64_t v12 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v11);
      appVersion = v6->_appVersion;
      v6->_appVersion = (NSNumber *)v12;

      uint64_t v14 = objc_opt_class();
      uint64_t v15 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v14);
      chargeCountryCode = v6->_chargeCountryCode;
      v6->_chargeCountryCode = (NSString *)v15;

      uint64_t v17 = objc_opt_class();
      uint64_t v18 = SSXPCDictionaryCopyObjectWithClass(v5, "14", v17);
      chargeCurrencyCode = v6->_chargeCurrencyCode;
      v6->_chargeCurrencyCode = (NSString *)v18;

      uint64_t v20 = objc_opt_class();
      uint64_t v21 = SSXPCDictionaryCopyObjectWithClass(v5, "15", v20);
      chargeStoreFrontIdentifier = v6->_chargeStoreFrontIdentifier;
      v6->_chargeStoreFrontIdentifier = (NSNumber *)v21;

      uint64_t v23 = objc_opt_class();
      uint64_t v24 = SSXPCDictionaryCopyObjectWithClass(v5, "3", v23);
      expireDate = v6->_expireDate;
      v6->_expireDate = (NSDate *)v24;

      uint64_t v26 = objc_opt_class();
      uint64_t v27 = SSXPCDictionaryCopyObjectWithClass(v5, "4", v26);
      familyId = v6->_familyId;
      v6->_familyId = (NSNumber *)v27;

      uint64_t v29 = objc_opt_class();
      uint64_t v30 = SSXPCDictionaryCopyObjectWithClass(v5, "5", v29);
      inAppAdamId = v6->_inAppAdamId;
      v6->_inAppAdamId = (NSNumber *)v30;

      uint64_t v32 = objc_opt_class();
      uint64_t v33 = SSXPCDictionaryCopyObjectWithClass(v5, "6", v32);
      inAppVersion = v6->_inAppVersion;
      v6->_inAppVersion = (NSString *)v33;

      uint64_t v35 = objc_opt_class();
      v36 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "13", v35);
      v6->_newsAppPurchase = [v36 BOOLValue];

      uint64_t v37 = objc_opt_class();
      uint64_t v38 = SSXPCDictionaryCopyObjectWithClass(v5, "7", v37);
      offerIdentifier = v6->_offerIdentifier;
      v6->_offerIdentifier = (NSString *)v38;

      uint64_t v40 = objc_opt_class();
      uint64_t v41 = SSXPCDictionaryCopyObjectWithClass(v5, "8", v40);
      originalPurchaseDownloadId = v6->_originalPurchaseDownloadId;
      v6->_originalPurchaseDownloadId = (NSNumber *)v41;

      uint64_t v43 = objc_opt_class();
      uint64_t v44 = SSXPCDictionaryCopyObjectWithClass(v5, "9", v43);
      purchasabilityType = v6->_purchasabilityType;
      v6->_purchasabilityType = (NSNumber *)v44;

      uint64_t v46 = objc_opt_class();
      uint64_t v47 = SSXPCDictionaryCopyObjectWithClass(v5, "10", v46);
      purchaseDownloadId = v6->_purchaseDownloadId;
      v6->_purchaseDownloadId = (NSNumber *)v47;

      uint64_t v49 = objc_opt_class();
      uint64_t v50 = SSXPCDictionaryCopyObjectWithClass(v5, "11", v49);
      quantity = v6->_quantity;
      v6->_quantity = (NSNumber *)v50;

      uint64_t v52 = objc_opt_class();
      uint64_t v53 = SSXPCDictionaryCopyObjectWithClass(v5, "12", v52);
      vendorIdentifier = v6->_vendorIdentifier;
      v6->_vendorIdentifier = (NSString *)v53;
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_appAdamId);
  SSXPCDictionarySetObject(v3, "1", self->_appVersion);
  SSXPCDictionarySetObject(v3, "2", self->_chargeCountryCode);
  SSXPCDictionarySetObject(v3, "14", self->_chargeCurrencyCode);
  SSXPCDictionarySetObject(v3, "15", self->_chargeStoreFrontIdentifier);
  SSXPCDictionarySetObject(v3, "3", self->_expireDate);
  SSXPCDictionarySetObject(v3, "4", self->_familyId);
  SSXPCDictionarySetObject(v3, "5", self->_inAppAdamId);
  SSXPCDictionarySetObject(v3, "6", self->_inAppVersion);
  id v4 = [NSNumber numberWithBool:self->_newsAppPurchase];
  SSXPCDictionarySetObject(v3, "13", v4);

  SSXPCDictionarySetObject(v3, "7", self->_offerIdentifier);
  SSXPCDictionarySetObject(v3, "8", self->_originalPurchaseDownloadId);
  SSXPCDictionarySetObject(v3, "9", self->_purchasabilityType);
  SSXPCDictionarySetObject(v3, "10", self->_purchaseDownloadId);
  SSXPCDictionarySetObject(v3, "11", self->_quantity);
  SSXPCDictionarySetObject(v3, "12", self->_vendorIdentifier);
  return v3;
}

- (NSNumber)appAdamId
{
  return self->_appAdamId;
}

- (void)setAppAdamId:(id)a3
{
}

- (NSNumber)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
}

- (NSString)chargeCountryCode
{
  return self->_chargeCountryCode;
}

- (void)setChargeCountryCode:(id)a3
{
}

- (NSString)chargeCurrencyCode
{
  return self->_chargeCurrencyCode;
}

- (void)setChargeCurrencyCode:(id)a3
{
}

- (NSNumber)chargeStoreFrontIdentifier
{
  return self->_chargeStoreFrontIdentifier;
}

- (void)setChargeStoreFrontIdentifier:(id)a3
{
}

- (NSDate)expireDate
{
  return self->_expireDate;
}

- (void)setExpireDate:(id)a3
{
}

- (NSNumber)familyId
{
  return self->_familyId;
}

- (void)setFamilyId:(id)a3
{
}

- (NSNumber)inAppAdamId
{
  return self->_inAppAdamId;
}

- (void)setInAppAdamId:(id)a3
{
}

- (NSString)inAppVersion
{
  return self->_inAppVersion;
}

- (void)setInAppVersion:(id)a3
{
}

- (BOOL)isNewsAppPurchase
{
  return self->_newsAppPurchase;
}

- (void)setNewsAppPurchase:(BOOL)a3
{
  self->_newsAppPurchase = a3;
}

- (NSString)offerIdentifier
{
  return self->_offerIdentifier;
}

- (void)setOfferIdentifier:(id)a3
{
}

- (NSNumber)originalPurchaseDownloadId
{
  return self->_originalPurchaseDownloadId;
}

- (void)setOriginalPurchaseDownloadId:(id)a3
{
}

- (NSNumber)purchasabilityType
{
  return self->_purchasabilityType;
}

- (void)setPurchasabilityType:(id)a3
{
}

- (NSNumber)purchaseDownloadId
{
  return self->_purchaseDownloadId;
}

- (void)setPurchaseDownloadId:(id)a3
{
}

- (NSNumber)quantity
{
  return self->_quantity;
}

- (void)setQuantity:(id)a3
{
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (void)setVendorIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorIdentifier, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
  objc_storeStrong((id *)&self->_purchaseDownloadId, 0);
  objc_storeStrong((id *)&self->_purchasabilityType, 0);
  objc_storeStrong((id *)&self->_originalPurchaseDownloadId, 0);
  objc_storeStrong((id *)&self->_offerIdentifier, 0);
  objc_storeStrong((id *)&self->_inAppVersion, 0);
  objc_storeStrong((id *)&self->_inAppAdamId, 0);
  objc_storeStrong((id *)&self->_familyId, 0);
  objc_storeStrong((id *)&self->_expireDate, 0);
  objc_storeStrong((id *)&self->_chargeStoreFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_chargeCurrencyCode, 0);
  objc_storeStrong((id *)&self->_chargeCountryCode, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
}

@end