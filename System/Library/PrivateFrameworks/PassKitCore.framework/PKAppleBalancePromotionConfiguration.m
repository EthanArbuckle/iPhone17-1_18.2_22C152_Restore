@interface PKAppleBalancePromotionConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)lastUpdatedDate;
- (NSDecimalNumber)bonusMaxAmount;
- (NSDecimalNumber)bonusMinAmount;
- (NSString)conditionText;
- (NSString)offerText;
- (NSString)programIdentifier;
- (NSString)versionIdentifier;
- (PKAppleBalancePromotionConfiguration)initWithAMSOfferDictionary:(id)a3;
- (PKAppleBalancePromotionConfiguration)initWithCoder:(id)a3;
- (PKAppleBalancePromotionConfiguration)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)uniqueIdentifier;
- (int64_t)generationIdentifier;
- (int64_t)promotionType;
- (int64_t)stamp;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBonusMaxAmount:(id)a3;
- (void)setBonusMinAmount:(id)a3;
- (void)setConditionText:(id)a3;
- (void)setGenerationIdentifier:(int64_t)a3;
- (void)setLastUpdatedDate:(id)a3;
- (void)setOfferText:(id)a3;
- (void)setProgramIdentifier:(id)a3;
- (void)setPromotionType:(int64_t)a3;
- (void)setStamp:(int64_t)a3;
- (void)setVersionIdentifier:(id)a3;
@end

@implementation PKAppleBalancePromotionConfiguration

- (PKAppleBalancePromotionConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKAppleBalancePromotionConfiguration;
  v5 = [(PKAppleBalancePromotionConfiguration *)&v25 init];
  if (!v5) {
    goto LABEL_4;
  }
  if (v4)
  {
    v6 = [v4 PKStringForKey:@"promotionType"];
    v5->_promotionType = PKAppleBalancePromotionTypeFromString(v6);

    uint64_t v7 = [v4 PKStringForKey:@"programIdentifier"];
    programIdentifier = v5->_programIdentifier;
    v5->_programIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 PKStringForKey:@"versionIdentifier"];
    versionIdentifier = v5->_versionIdentifier;
    v5->_versionIdentifier = (NSString *)v9;

    v5->_generationIdentifier = [v4 PKIntegerForKey:@"generationIdentifier"];
    v5->_stamp = [v4 PKIntegerForKey:@"stamp"];
    uint64_t v11 = [v4 PKDecimalNumberForKey:@"bonusMinAmount"];
    bonusMinAmount = v5->_bonusMinAmount;
    v5->_bonusMinAmount = (NSDecimalNumber *)v11;

    uint64_t v13 = [v4 PKDecimalNumberForKey:@"bonusMaxAmount"];
    bonusMaxAmount = v5->_bonusMaxAmount;
    v5->_bonusMaxAmount = (NSDecimalNumber *)v13;

    uint64_t v15 = [v4 PKStringForKey:@"offerText"];
    offerText = v5->_offerText;
    v5->_offerText = (NSString *)v15;

    uint64_t v17 = [v4 PKStringForKey:@"conditionText"];
    conditionText = v5->_conditionText;
    v5->_conditionText = (NSString *)v17;

    uint64_t v19 = [v4 PKDateForKey:@"lastUpdatedDate"];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v19;

LABEL_4:
    v21 = v5;
    goto LABEL_8;
  }
  v22 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Error: promotion configuration dictionary missing", v24, 2u);
  }

  v21 = 0;
LABEL_8:

  return v21;
}

- (PKAppleBalancePromotionConfiguration)initWithAMSOfferDictionary:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PKAppleBalancePromotionConfiguration;
  v5 = [(PKAppleBalancePromotionConfiguration *)&v28 init];
  if (!v5)
  {
LABEL_6:
    v24 = v5;
    goto LABEL_10;
  }
  if (v4)
  {
    v6 = [v4 PKArrayForKey:@"details"];
    uint64_t v7 = [v6 firstObject];
    v8 = [v7 PKStringForKey:@"bonus-type"];
    v5->_promotionType = PKAppleBalancePromotionTypeFromString(v8);

    uint64_t v9 = [v7 PKStringForKey:@"program-id"];
    programIdentifier = v5->_programIdentifier;
    v5->_programIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 PKStringForKey:@"version-id"];
    versionIdentifier = v5->_versionIdentifier;
    v5->_versionIdentifier = (NSString *)v11;

    v5->_generationIdentifier = [v7 PKIntegerForKey:@"generation-id"];
    v5->_stamp = [v7 PKIntegerForKey:@"stamp"];
    uint64_t v13 = [v7 PKDecimalNumberForKey:@"bonus-min-amount"];
    bonusMinAmount = v5->_bonusMinAmount;
    v5->_bonusMinAmount = (NSDecimalNumber *)v13;

    uint64_t v15 = [v7 PKDecimalNumberForKey:@"bonus-max-amount"];
    bonusMaxAmount = v5->_bonusMaxAmount;
    v5->_bonusMaxAmount = (NSDecimalNumber *)v15;

    uint64_t v17 = [v7 PKStringForKey:@"text"];
    offerText = v5->_offerText;
    v5->_offerText = (NSString *)v17;

    if ((unint64_t)[v6 count] >= 2)
    {
      uint64_t v19 = [v6 objectAtIndex:1];
      uint64_t v20 = [v19 PKStringForKey:@"text"];
      conditionText = v5->_conditionText;
      v5->_conditionText = (NSString *)v20;
    }
    uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v22;

    goto LABEL_6;
  }
  objc_super v25 = PKLogFacilityTypeGetObject(0xEuLL);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "Error: ams promotion dictionary missing", v27, 2u);
  }

  v24 = 0;
LABEL_10:

  return v24;
}

- (id)uniqueIdentifier
{
  return (id)[NSString stringWithFormat:@"%@, %@", self->_programIdentifier, self->_versionIdentifier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAppleBalancePromotionConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKAppleBalancePromotionConfiguration *)self init];
  if (v5)
  {
    v5->_promotionType = [v4 decodeIntegerForKey:@"promotionType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"programIdentifier"];
    programIdentifier = v5->_programIdentifier;
    v5->_programIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"versionIdentifier"];
    versionIdentifier = v5->_versionIdentifier;
    v5->_versionIdentifier = (NSString *)v8;

    v5->_generationIdentifier = [v4 decodeIntegerForKey:@"generationIdentifier"];
    v5->_stamp = [v4 decodeIntegerForKey:@"stamp"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bonusMinAmount"];
    bonusMinAmount = v5->_bonusMinAmount;
    v5->_bonusMinAmount = (NSDecimalNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bonusMaxAmount"];
    bonusMaxAmount = v5->_bonusMaxAmount;
    v5->_bonusMaxAmount = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"offerText"];
    offerText = v5->_offerText;
    v5->_offerText = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"conditionText"];
    conditionText = v5->_conditionText;
    v5->_conditionText = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedDate"];
    lastUpdatedDate = v5->_lastUpdatedDate;
    v5->_lastUpdatedDate = (NSDate *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t promotionType = self->_promotionType;
  id v5 = a3;
  [v5 encodeInteger:promotionType forKey:@"promotionType"];
  [v5 encodeObject:self->_programIdentifier forKey:@"programIdentifier"];
  [v5 encodeObject:self->_versionIdentifier forKey:@"versionIdentifier"];
  [v5 encodeInteger:self->_generationIdentifier forKey:@"generationIdentifier"];
  [v5 encodeInteger:self->_stamp forKey:@"stamp"];
  [v5 encodeObject:self->_bonusMinAmount forKey:@"bonusMinAmount"];
  [v5 encodeObject:self->_bonusMaxAmount forKey:@"bonusMaxAmount"];
  [v5 encodeObject:self->_offerText forKey:@"offerText"];
  [v5 encodeObject:self->_conditionText forKey:@"conditionText"];
  [v5 encodeObject:self->_lastUpdatedDate forKey:@"lastUpdatedDate"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_39;
  }
  programIdentifier = self->_programIdentifier;
  uint64_t v6 = (NSString *)v4[2];
  if (programIdentifier && v6)
  {
    if ((-[NSString isEqual:](programIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (programIdentifier != v6)
  {
    goto LABEL_39;
  }
  versionIdentifier = self->_versionIdentifier;
  uint64_t v8 = (NSString *)v4[3];
  if (versionIdentifier && v8)
  {
    if ((-[NSString isEqual:](versionIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (versionIdentifier != v8)
  {
    goto LABEL_39;
  }
  if (self->_generationIdentifier != v4[4] || self->_stamp != v4[5]) {
    goto LABEL_39;
  }
  bonusMinAmount = self->_bonusMinAmount;
  uint64_t v10 = (NSDecimalNumber *)v4[6];
  if (bonusMinAmount && v10)
  {
    if ((-[NSDecimalNumber isEqual:](bonusMinAmount, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (bonusMinAmount != v10)
  {
    goto LABEL_39;
  }
  bonusMaxAmount = self->_bonusMaxAmount;
  uint64_t v12 = (NSDecimalNumber *)v4[7];
  if (bonusMaxAmount && v12)
  {
    if ((-[NSDecimalNumber isEqual:](bonusMaxAmount, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (bonusMaxAmount != v12)
  {
    goto LABEL_39;
  }
  offerText = self->_offerText;
  uint64_t v14 = (NSString *)v4[8];
  if (offerText && v14)
  {
    if ((-[NSString isEqual:](offerText, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (offerText != v14)
  {
    goto LABEL_39;
  }
  conditionText = self->_conditionText;
  uint64_t v16 = (NSString *)v4[9];
  if (conditionText && v16)
  {
    if ((-[NSString isEqual:](conditionText, "isEqual:") & 1) == 0) {
      goto LABEL_39;
    }
  }
  else if (conditionText != v16)
  {
    goto LABEL_39;
  }
  lastUpdatedDate = self->_lastUpdatedDate;
  uint64_t v18 = (NSDate *)v4[10];
  if (!lastUpdatedDate || !v18)
  {
    if (lastUpdatedDate == v18) {
      goto LABEL_37;
    }
LABEL_39:
    BOOL v19 = 0;
    goto LABEL_40;
  }
  if ((-[NSDate isEqual:](lastUpdatedDate, "isEqual:") & 1) == 0) {
    goto LABEL_39;
  }
LABEL_37:
  BOOL v19 = self->_promotionType == v4[1];
LABEL_40:

  return v19;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_programIdentifier];
  [v3 safelyAddObject:self->_versionIdentifier];
  [v3 safelyAddObject:self->_bonusMinAmount];
  [v3 safelyAddObject:self->_bonusMaxAmount];
  [v3 safelyAddObject:self->_offerText];
  [v3 safelyAddObject:self->_conditionText];
  [v3 safelyAddObject:self->_lastUpdatedDate];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_promotionType - v4 + 32 * v4;
  int64_t v6 = self->_generationIdentifier - v5 + 32 * v5;
  unint64_t v7 = self->_stamp - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = v3;
  if (self->_promotionType) {
    int64_t v5 = @"unknown";
  }
  else {
    int64_t v5 = @"content";
  }
  [v3 appendFormat:@"promotionType: '%@'; ", v5];
  [v4 appendFormat:@"programIdentifier: '%@'; ", self->_programIdentifier];
  [v4 appendFormat:@"versionIdentifier: '%@'; ", self->_versionIdentifier];
  objc_msgSend(v4, "appendFormat:", @"generationIdentifier: '%ld'; ", self->_generationIdentifier);
  objc_msgSend(v4, "appendFormat:", @"stamp: '%ld'; ", self->_stamp);
  [v4 appendFormat:@"bonusMinAmount: '%@'; ", self->_bonusMinAmount];
  [v4 appendFormat:@"bonusMaxAmount: '%@'; ", self->_bonusMaxAmount];
  [v4 appendFormat:@"offerText: '%@'; ", self->_offerText];
  [v4 appendFormat:@"conditionText: '%@'; ", self->_conditionText];
  [v4 appendFormat:@"lastUpdateDated: '%@'; ", self->_lastUpdatedDate];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v5 = [+[PKAppleBalancePromotionConfiguration allocWithZone:](PKAppleBalancePromotionConfiguration, "allocWithZone:") init];
  v5->_int64_t promotionType = self->_promotionType;
  uint64_t v6 = [(NSString *)self->_programIdentifier copyWithZone:a3];
  programIdentifier = v5->_programIdentifier;
  v5->_programIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_versionIdentifier copyWithZone:a3];
  versionIdentifier = v5->_versionIdentifier;
  v5->_versionIdentifier = (NSString *)v8;

  v5->_generationIdentifier = self->_generationIdentifier;
  v5->_stamp = self->_stamp;
  uint64_t v10 = [(NSDecimalNumber *)self->_bonusMinAmount copyWithZone:a3];
  bonusMinAmount = v5->_bonusMinAmount;
  v5->_bonusMinAmount = (NSDecimalNumber *)v10;

  uint64_t v12 = [(NSDecimalNumber *)self->_bonusMaxAmount copyWithZone:a3];
  bonusMaxAmount = v5->_bonusMaxAmount;
  v5->_bonusMaxAmount = (NSDecimalNumber *)v12;

  uint64_t v14 = [(NSString *)self->_offerText copyWithZone:a3];
  offerText = v5->_offerText;
  v5->_offerText = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_conditionText copyWithZone:a3];
  conditionText = v5->_conditionText;
  v5->_conditionText = (NSString *)v16;

  uint64_t v18 = [(NSDate *)self->_lastUpdatedDate copyWithZone:a3];
  lastUpdatedDate = v5->_lastUpdatedDate;
  v5->_lastUpdatedDate = (NSDate *)v18;

  return v5;
}

- (int64_t)promotionType
{
  return self->_promotionType;
}

- (void)setPromotionType:(int64_t)a3
{
  self->_int64_t promotionType = a3;
}

- (NSString)programIdentifier
{
  return self->_programIdentifier;
}

- (void)setProgramIdentifier:(id)a3
{
}

- (NSString)versionIdentifier
{
  return self->_versionIdentifier;
}

- (void)setVersionIdentifier:(id)a3
{
}

- (int64_t)generationIdentifier
{
  return self->_generationIdentifier;
}

- (void)setGenerationIdentifier:(int64_t)a3
{
  self->_generationIdentifier = a3;
}

- (int64_t)stamp
{
  return self->_stamp;
}

- (void)setStamp:(int64_t)a3
{
  self->_stamp = a3;
}

- (NSDecimalNumber)bonusMinAmount
{
  return self->_bonusMinAmount;
}

- (void)setBonusMinAmount:(id)a3
{
}

- (NSDecimalNumber)bonusMaxAmount
{
  return self->_bonusMaxAmount;
}

- (void)setBonusMaxAmount:(id)a3
{
}

- (NSString)offerText
{
  return self->_offerText;
}

- (void)setOfferText:(id)a3
{
}

- (NSString)conditionText
{
  return self->_conditionText;
}

- (void)setConditionText:(id)a3
{
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (void)setLastUpdatedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_conditionText, 0);
  objc_storeStrong((id *)&self->_offerText, 0);
  objc_storeStrong((id *)&self->_bonusMaxAmount, 0);
  objc_storeStrong((id *)&self->_bonusMinAmount, 0);
  objc_storeStrong((id *)&self->_versionIdentifier, 0);
  objc_storeStrong((id *)&self->_programIdentifier, 0);
}

@end