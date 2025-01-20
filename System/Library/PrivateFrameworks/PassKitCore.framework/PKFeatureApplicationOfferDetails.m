@interface PKFeatureApplicationOfferDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)expiryDate;
- (NSDecimalNumber)annualFee;
- (NSDecimalNumber)aprForPurchase;
- (NSDecimalNumber)balance;
- (NSDecimalNumber)creditLimit;
- (NSString)currencyCode;
- (NSString)offerTermsIdentifier;
- (PKFeatureApplicationOfferDetails)initWithCoder:(id)a3;
- (PKFeatureApplicationOfferDetails)initWithDictionary:(id)a3;
- (PKFeatureApplicationOfferDetailsInfo)detailsInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAnnualFee:(id)a3;
- (void)setAprForPurchase:(id)a3;
- (void)setBalance:(id)a3;
- (void)setCreditLimit:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDetailsInfo:(id)a3;
- (void)setExpiryDate:(id)a3;
- (void)setOfferTermsIdentifier:(id)a3;
@end

@implementation PKFeatureApplicationOfferDetails

- (PKFeatureApplicationOfferDetails)initWithDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKFeatureApplicationOfferDetails;
  v5 = [(PKFeatureApplicationOfferDetails *)&v29 init];
  if (!v5)
  {
LABEL_7:
    v24 = v5;
    goto LABEL_11;
  }
  uint64_t v6 = [v4 PKStringForKey:@"offerTermsIdentifier"];
  offerTermsIdentifier = v5->_offerTermsIdentifier;
  v5->_offerTermsIdentifier = (NSString *)v6;

  if (v5->_offerTermsIdentifier)
  {
    uint64_t v8 = [v4 PKDateForKey:@"expiryDate"];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v8;

    uint64_t v10 = [v4 PKDecimalNumberFromStringForKey:@"creditLimit"];
    creditLimit = v5->_creditLimit;
    v5->_creditLimit = (NSDecimalNumber *)v10;

    uint64_t v12 = [v4 PKDecimalNumberFromStringForKey:@"fees"];
    annualFee = v5->_annualFee;
    v5->_annualFee = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 PKDecimalNumberFromStringForKey:@"aprForPurchase"];
    aprForPurchase = v5->_aprForPurchase;
    v5->_aprForPurchase = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 PKDecimalNumberFromStringForKey:@"balance"];
    balance = v5->_balance;
    v5->_balance = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 PKStringForKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v18;

    v20 = [v4 PKDictionaryForKey:@"detailsInfo"];
    v21 = v20;
    if (v20 && [v20 count])
    {
      v22 = [[PKFeatureApplicationOfferDetailsInfo alloc] initWithDictionary:v21];
      detailsInfo = v5->_detailsInfo;
      v5->_detailsInfo = v22;
    }
    goto LABEL_7;
  }
  v25 = PKLogFacilityTypeGetObject(0xDuLL);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    *(_DWORD *)buf = 138412290;
    v31 = v27;
    _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "Error: Offer identifier missing from :%@", buf, 0xCu);
  }
  v24 = 0;
LABEL_11:

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFeatureApplicationOfferDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKFeatureApplicationOfferDetails;
  v5 = [(PKFeatureApplicationOfferDetails *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offerTermsIdentifier"];
    offerTermsIdentifier = v5->_offerTermsIdentifier;
    v5->_offerTermsIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiryDate"];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creditLimit"];
    creditLimit = v5->_creditLimit;
    v5->_creditLimit = (NSDecimalNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"annualFee"];
    annualFee = v5->_annualFee;
    v5->_annualFee = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"aprForPurchase"];
    aprForPurchase = v5->_aprForPurchase;
    v5->_aprForPurchase = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balance"];
    balance = v5->_balance;
    v5->_balance = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"detailsInfo"];
    detailsInfo = v5->_detailsInfo;
    v5->_detailsInfo = (PKFeatureApplicationOfferDetailsInfo *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  offerTermsIdentifier = self->_offerTermsIdentifier;
  id v5 = a3;
  [v5 encodeObject:offerTermsIdentifier forKey:@"offerTermsIdentifier"];
  [v5 encodeObject:self->_expiryDate forKey:@"expiryDate"];
  [v5 encodeObject:self->_creditLimit forKey:@"creditLimit"];
  [v5 encodeObject:self->_annualFee forKey:@"annualFee"];
  [v5 encodeObject:self->_aprForPurchase forKey:@"aprForPurchase"];
  [v5 encodeObject:self->_balance forKey:@"balance"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_detailsInfo forKey:@"detailsInfo"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"offerTermsIdentifier: '%@'; ", self->_offerTermsIdentifier];
  [v3 appendFormat:@"expiryDate: '%@'; ", self->_expiryDate];
  [v3 appendFormat:@"creditLimit: '%@'; ", self->_creditLimit];
  [v3 appendFormat:@"annualFee: '%@'; ", self->_annualFee];
  [v3 appendFormat:@"aprForPurchase: '%@'; ", self->_aprForPurchase];
  [v3 appendFormat:@"balance: '%@'; ", self->_balance];
  [v3 appendFormat:@"currencyCode: '%@'; ", self->_currencyCode];
  [v3 appendFormat:@"detailsInfo: '%@'; ", self->_detailsInfo];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_39;
  }
  offerTermsIdentifier = self->_offerTermsIdentifier;
  uint64_t v6 = (NSString *)v4[1];
  if (offerTermsIdentifier && v6)
  {
    if ((-[NSString isEqual:](offerTermsIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (offerTermsIdentifier != v6)
  {
    goto LABEL_39;
  }
  expiryDate = self->_expiryDate;
  uint64_t v8 = (NSDate *)v4[2];
  if (expiryDate && v8)
  {
    if ((-[NSDate isEqual:](expiryDate, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (expiryDate != v8)
  {
    goto LABEL_39;
  }
  creditLimit = self->_creditLimit;
  uint64_t v10 = (NSDecimalNumber *)v4[3];
  if (creditLimit && v10)
  {
    if ((-[NSDecimalNumber isEqual:](creditLimit, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (creditLimit != v10)
  {
    goto LABEL_39;
  }
  annualFee = self->_annualFee;
  uint64_t v12 = (NSDecimalNumber *)v4[4];
  if (annualFee && v12)
  {
    if ((-[NSDecimalNumber isEqual:](annualFee, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (annualFee != v12)
  {
    goto LABEL_39;
  }
  aprForPurchase = self->_aprForPurchase;
  uint64_t v14 = (NSDecimalNumber *)v4[5];
  if (aprForPurchase && v14)
  {
    if ((-[NSDecimalNumber isEqual:](aprForPurchase, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (aprForPurchase != v14)
  {
    goto LABEL_39;
  }
  balance = self->_balance;
  uint64_t v16 = (NSDecimalNumber *)v4[6];
  if (balance && v16)
  {
    if ((-[NSDecimalNumber isEqual:](balance, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (balance != v16)
  {
    goto LABEL_39;
  }
  currencyCode = self->_currencyCode;
  uint64_t v18 = (NSString *)v4[7];
  if (!currencyCode || !v18)
  {
    if (currencyCode == v18) {
      goto LABEL_35;
    }
LABEL_39:
    char v21 = 0;
    goto LABEL_40;
  }
  if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0) {
    goto LABEL_39;
  }
LABEL_35:
  detailsInfo = self->_detailsInfo;
  uint64_t v20 = (PKFeatureApplicationOfferDetailsInfo *)v4[8];
  if (detailsInfo && v20) {
    char v21 = -[PKFeatureApplicationOfferDetailsInfo isEqual:](detailsInfo, "isEqual:");
  }
  else {
    char v21 = detailsInfo == v20;
  }
LABEL_40:

  return v21;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_offerTermsIdentifier];
  [v3 safelyAddObject:self->_expiryDate];
  [v3 safelyAddObject:self->_creditLimit];
  [v3 safelyAddObject:self->_annualFee];
  [v3 safelyAddObject:self->_aprForPurchase];
  [v3 safelyAddObject:self->_balance];
  [v3 safelyAddObject:self->_currencyCode];
  [v3 safelyAddObject:self->_detailsInfo];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKFeatureApplicationOfferDetails allocWithZone:](PKFeatureApplicationOfferDetails, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_offerTermsIdentifier copyWithZone:a3];
  offerTermsIdentifier = v5->_offerTermsIdentifier;
  v5->_offerTermsIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSDate *)self->_expiryDate copyWithZone:a3];
  expiryDate = v5->_expiryDate;
  v5->_expiryDate = (NSDate *)v8;

  uint64_t v10 = [(NSDecimalNumber *)self->_creditLimit copyWithZone:a3];
  creditLimit = v5->_creditLimit;
  v5->_creditLimit = (NSDecimalNumber *)v10;

  uint64_t v12 = [(NSDecimalNumber *)self->_annualFee copyWithZone:a3];
  annualFee = v5->_annualFee;
  v5->_annualFee = (NSDecimalNumber *)v12;

  uint64_t v14 = [(NSDecimalNumber *)self->_aprForPurchase copyWithZone:a3];
  aprForPurchase = v5->_aprForPurchase;
  v5->_aprForPurchase = (NSDecimalNumber *)v14;

  uint64_t v16 = [(NSDecimalNumber *)self->_balance copyWithZone:a3];
  balance = v5->_balance;
  v5->_balance = (NSDecimalNumber *)v16;

  uint64_t v18 = [(NSString *)self->_currencyCode copyWithZone:a3];
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v18;

  uint64_t v20 = [(PKFeatureApplicationOfferDetailsInfo *)self->_detailsInfo copyWithZone:a3];
  detailsInfo = v5->_detailsInfo;
  v5->_detailsInfo = v20;

  return v5;
}

- (NSString)offerTermsIdentifier
{
  return self->_offerTermsIdentifier;
}

- (void)setOfferTermsIdentifier:(id)a3
{
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
}

- (NSDecimalNumber)creditLimit
{
  return self->_creditLimit;
}

- (void)setCreditLimit:(id)a3
{
}

- (NSDecimalNumber)annualFee
{
  return self->_annualFee;
}

- (void)setAnnualFee:(id)a3
{
}

- (NSDecimalNumber)aprForPurchase
{
  return self->_aprForPurchase;
}

- (void)setAprForPurchase:(id)a3
{
}

- (NSDecimalNumber)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (PKFeatureApplicationOfferDetailsInfo)detailsInfo
{
  return self->_detailsInfo;
}

- (void)setDetailsInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsInfo, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_aprForPurchase, 0);
  objc_storeStrong((id *)&self->_annualFee, 0);
  objc_storeStrong((id *)&self->_creditLimit, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_offerTermsIdentifier, 0);
}

@end