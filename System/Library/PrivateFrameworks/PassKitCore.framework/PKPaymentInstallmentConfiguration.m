@interface PKPaymentInstallmentConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInstallmentConfiguration:(id)a3;
- (BOOL)isInStorePurchase;
- (NSArray)installmentItems;
- (NSData)merchandisingImageData;
- (NSDecimalNumber)bindingTotalAmount;
- (NSDecimalNumber)openToBuyThresholdAmount;
- (NSDictionary)applicationMetadata;
- (NSString)currencyCode;
- (NSString)installmentMerchantIdentifier;
- (NSString)referrerIdentifier;
- (PKPaymentInstallmentConfiguration)initWithCoder:(id)a3;
- (int64_t)feature;
- (int64_t)retailChannel;
- (unint64_t)hash;
- (void)encodeToBodyDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationMetadata:(id)a3;
- (void)setBindingTotalAmount:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setFeature:(int64_t)a3;
- (void)setInStorePurchase:(BOOL)a3;
- (void)setInstallmentItems:(id)a3;
- (void)setInstallmentMerchantIdentifier:(id)a3;
- (void)setMerchandisingImageData:(id)a3;
- (void)setOpenToBuyThresholdAmount:(id)a3;
- (void)setReferrerIdentifier:(id)a3;
- (void)setRetailChannel:(int64_t)a3;
@end

@implementation PKPaymentInstallmentConfiguration

- (void)encodeToBodyDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isInstallment"];
  v5 = [(PKPaymentInstallmentConfiguration *)self openToBuyThresholdAmount];
  v6 = [v5 stringValue];
  [v4 setObject:v6 forKeyedSubscript:@"installmentAmount"];

  v7 = [(PKPaymentInstallmentConfiguration *)self currencyCode];
  [v4 setObject:v7 forKeyedSubscript:@"installmentCurrencyCode"];

  v8 = PKInstallmentRetailChannelToString([(PKPaymentInstallmentConfiguration *)self retailChannel]);
  [v4 setObject:v8 forKeyedSubscript:@"installmentChannel"];

  v9 = [(PKPaymentInstallmentConfiguration *)self installmentItems];
  if ([v9 count])
  {
    v10 = objc_msgSend(v9, "pk_arrayByApplyingBlock:", &__block_literal_global_1);
    [v4 setObject:v10 forKeyedSubscript:@"installmentItems"];
  }
  v11 = [(PKPaymentInstallmentConfiguration *)self applicationMetadata];
  if (v11)
  {
    id v15 = 0;
    v12 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v11 options:0 error:&v15];
    id v13 = v15;
    if (v12)
    {
      [v4 setObject:v11 forKeyedSubscript:@"installmentMetadata"];
    }
    else
    {
      v14 = PKLogFacilityTypeGetObject(0xDuLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v13;
        _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Invalid JSON data with PKPaymentInstallmentConfiguration: %@", buf, 0xCu);
      }
    }
  }
}

id __86__PKPaymentInstallmentConfiguration_PKApplyWebServiceRequest__encodeToBodyDictionary___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v3 = a2;
  id v4 = objc_alloc_init(v2);
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "installmentItemType"));
  v6 = [v5 stringValue];
  [v4 setObject:v6 forKeyedSubscript:@"installmentItemType"];

  v7 = [v3 amount];
  v8 = [v7 stringValue];
  [v4 setObject:v8 forKeyedSubscript:@"amount"];

  v9 = [v3 currencyCode];
  [v4 setObject:v9 forKeyedSubscript:@"currencyCode"];

  v10 = [v3 programIdentifier];
  [v4 setObject:v10 forKeyedSubscript:@"programIdentifier"];

  v11 = [v3 apr];
  v12 = [v11 stringValue];
  [v4 setObject:v12 forKeyedSubscript:@"apr"];

  id v13 = [v3 programTerms];

  [v4 setObject:v13 forKeyedSubscript:@"terms"];
  v14 = (void *)[v4 copy];

  return v14;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_merchandisingImageData];
  [v3 safelyAddObject:self->_openToBuyThresholdAmount];
  [v3 safelyAddObject:self->_bindingTotalAmount];
  [v3 safelyAddObject:self->_currencyCode];
  [v3 safelyAddObject:self->_installmentMerchantIdentifier];
  [v3 safelyAddObject:self->_referrerIdentifier];
  [v3 safelyAddObject:self->_applicationMetadata];
  uint64_t v4 = PKCombinedHash(17, v3);
  uint64_t v5 = self->_inStorePurchase - v4 + 32 * v4;
  int64_t v6 = self->_feature - v5 + 32 * v5;
  unint64_t v7 = self->_retailChannel - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKPaymentInstallmentConfiguration *)a3;
  uint64_t v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPaymentInstallmentConfiguration *)self isEqualToInstallmentConfiguration:v5];

  return v6;
}

- (BOOL)isEqualToInstallmentConfiguration:(id)a3
{
  uint64_t v4 = a3;
  if (!v4) {
    goto LABEL_47;
  }
  merchandisingImageData = self->_merchandisingImageData;
  BOOL v6 = (NSData *)v4[3];
  if (merchandisingImageData) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (merchandisingImageData != v6) {
      goto LABEL_47;
    }
  }
  else if ((-[NSData isEqual:](merchandisingImageData, "isEqual:") & 1) == 0)
  {
    goto LABEL_47;
  }
  if (self->_feature != v4[2]) {
    goto LABEL_47;
  }
  openToBuyThresholdAmount = self->_openToBuyThresholdAmount;
  v9 = (NSDecimalNumber *)v4[4];
  if (openToBuyThresholdAmount && v9)
  {
    if ((-[NSDecimalNumber isEqual:](openToBuyThresholdAmount, "isEqual:") & 1) == 0) {
      goto LABEL_47;
    }
  }
  else if (openToBuyThresholdAmount != v9)
  {
    goto LABEL_47;
  }
  bindingTotalAmount = self->_bindingTotalAmount;
  v11 = (NSDecimalNumber *)v4[5];
  if (bindingTotalAmount && v11)
  {
    if ((-[NSDecimalNumber isEqual:](bindingTotalAmount, "isEqual:") & 1) == 0) {
      goto LABEL_47;
    }
  }
  else if (bindingTotalAmount != v11)
  {
    goto LABEL_47;
  }
  currencyCode = self->_currencyCode;
  id v13 = (NSString *)v4[6];
  if (currencyCode && v13)
  {
    if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0) {
      goto LABEL_47;
    }
  }
  else if (currencyCode != v13)
  {
    goto LABEL_47;
  }
  if (self->_inStorePurchase != *((unsigned __int8 *)v4 + 8)) {
    goto LABEL_47;
  }
  installmentMerchantIdentifier = self->_installmentMerchantIdentifier;
  id v15 = (NSString *)v4[7];
  if (installmentMerchantIdentifier && v15)
  {
    if ((-[NSString isEqual:](installmentMerchantIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_47;
    }
  }
  else if (installmentMerchantIdentifier != v15)
  {
    goto LABEL_47;
  }
  referrerIdentifier = self->_referrerIdentifier;
  id v17 = (NSString *)v4[8];
  if (referrerIdentifier && v17)
  {
    if ((-[NSString isEqual:](referrerIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_47;
    }
  }
  else if (referrerIdentifier != v17)
  {
    goto LABEL_47;
  }
  installmentItems = self->_installmentItems;
  v19 = (NSArray *)v4[9];
  if (installmentItems && v19)
  {
    if ((-[NSArray isEqual:](installmentItems, "isEqual:") & 1) == 0) {
      goto LABEL_47;
    }
  }
  else if (installmentItems != v19)
  {
    goto LABEL_47;
  }
  applicationMetadata = self->_applicationMetadata;
  v21 = (NSDictionary *)v4[10];
  if (!applicationMetadata || !v21)
  {
    if (applicationMetadata == v21) {
      goto LABEL_45;
    }
LABEL_47:
    BOOL v22 = 0;
    goto LABEL_48;
  }
  if ((-[NSDictionary isEqual:](applicationMetadata, "isEqual:") & 1) == 0) {
    goto LABEL_47;
  }
LABEL_45:
  BOOL v22 = self->_retailChannel == v4[11];
LABEL_48:

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentInstallmentConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKPaymentInstallmentConfiguration;
  uint64_t v5 = [(PKPaymentInstallmentConfiguration *)&v27 init];
  if (v5)
  {
    v5->_feature = [v4 decodeIntegerForKey:@"feature"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchandisingImageData"];
    merchandisingImageData = v5->_merchandisingImageData;
    v5->_merchandisingImageData = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"openToBuyThresholdAmount"];
    openToBuyThresholdAmount = v5->_openToBuyThresholdAmount;
    v5->_openToBuyThresholdAmount = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bindingTotalAmount"];
    bindingTotalAmount = v5->_bindingTotalAmount;
    v5->_bindingTotalAmount = (NSDecimalNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v12;

    v5->_inStorePurchase = [v4 decodeBoolForKey:@"inStorePurchase"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentMerchantIdentifier"];
    installmentMerchantIdentifier = v5->_installmentMerchantIdentifier;
    v5->_installmentMerchantIdentifier = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referrerIdentifier"];
    referrerIdentifier = v5->_referrerIdentifier;
    v5->_referrerIdentifier = (NSString *)v16;

    uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"installmentItems"];
    installmentItems = v5->_installmentItems;
    v5->_installmentItems = (NSArray *)v21;

    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationMetadata"];
    if (v23)
    {
      uint64_t v24 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v23 options:0 error:0];
      applicationMetadata = v5->_applicationMetadata;
      v5->_applicationMetadata = (NSDictionary *)v24;
    }
    v5->_retailChannel = [v4 decodeIntegerForKey:@"retailChannel"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeInteger:self->_feature forKey:@"feature"];
  [v6 encodeObject:self->_merchandisingImageData forKey:@"merchandisingImageData"];
  [v6 encodeObject:self->_openToBuyThresholdAmount forKey:@"openToBuyThresholdAmount"];
  [v6 encodeObject:self->_bindingTotalAmount forKey:@"bindingTotalAmount"];
  [v6 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v6 encodeBool:self->_inStorePurchase forKey:@"inStorePurchase"];
  [v6 encodeObject:self->_installmentMerchantIdentifier forKey:@"installmentMerchantIdentifier"];
  [v6 encodeObject:self->_referrerIdentifier forKey:@"referrerIdentifier"];
  [v6 encodeObject:self->_installmentItems forKey:@"installmentItems"];
  applicationMetadata = self->_applicationMetadata;
  if (applicationMetadata)
  {
    uint64_t v5 = [MEMORY[0x1E4F28D90] dataWithJSONObject:applicationMetadata options:0 error:0];
    [v6 encodeObject:v5 forKey:@"applicationMetadata"];
  }
  [v6 encodeInteger:self->_retailChannel forKey:@"retailChannel"];
}

- (int64_t)feature
{
  return self->_feature;
}

- (void)setFeature:(int64_t)a3
{
  self->_feature = a3;
}

- (NSData)merchandisingImageData
{
  return self->_merchandisingImageData;
}

- (void)setMerchandisingImageData:(id)a3
{
}

- (NSDecimalNumber)openToBuyThresholdAmount
{
  return self->_openToBuyThresholdAmount;
}

- (void)setOpenToBuyThresholdAmount:(id)a3
{
}

- (NSDecimalNumber)bindingTotalAmount
{
  return self->_bindingTotalAmount;
}

- (void)setBindingTotalAmount:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (BOOL)isInStorePurchase
{
  return self->_inStorePurchase;
}

- (void)setInStorePurchase:(BOOL)a3
{
  self->_inStorePurchase = a3;
}

- (NSString)installmentMerchantIdentifier
{
  return self->_installmentMerchantIdentifier;
}

- (void)setInstallmentMerchantIdentifier:(id)a3
{
}

- (NSString)referrerIdentifier
{
  return self->_referrerIdentifier;
}

- (void)setReferrerIdentifier:(id)a3
{
}

- (NSArray)installmentItems
{
  return self->_installmentItems;
}

- (void)setInstallmentItems:(id)a3
{
}

- (NSDictionary)applicationMetadata
{
  return self->_applicationMetadata;
}

- (void)setApplicationMetadata:(id)a3
{
}

- (int64_t)retailChannel
{
  return self->_retailChannel;
}

- (void)setRetailChannel:(int64_t)a3
{
  self->_retailChannel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationMetadata, 0);
  objc_storeStrong((id *)&self->_installmentItems, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_installmentMerchantIdentifier, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_bindingTotalAmount, 0);
  objc_storeStrong((id *)&self->_openToBuyThresholdAmount, 0);
  objc_storeStrong((id *)&self->_merchandisingImageData, 0);
}

@end