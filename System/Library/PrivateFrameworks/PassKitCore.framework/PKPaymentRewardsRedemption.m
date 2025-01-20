@interface PKPaymentRewardsRedemption
+ (BOOL)supportsSecureCoding;
- (BOOL)hasOriginalTransactionDetails;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInGoodStanding;
- (NSDate)createdAt;
- (NSDate)updatedAt;
- (NSString)balanceIdentifier;
- (NSString)identifier;
- (NSString)paymentHash;
- (NSURL)statusLink;
- (PKPaymentRewardsRedemption)initWithCoder:(id)a3;
- (PKPaymentRewardsRedemption)initWithDictionary:(id)a3;
- (PKPaymentRewardsRedemption)initWithIdentifier:(id)a3 balanceIdentifier:(id)a4 status:(unint64_t)a5 statusLink:(id)a6 paymentHash:(id)a7;
- (PKPaymentRewardsRedemption)initWithIdentifier:(id)a3 balanceIdentifier:(id)a4 status:(unint64_t)a5 statusLink:(id)a6 paymentHash:(id)a7 createdAt:(id)a8 updatedAt:(id)a9;
- (PKPaymentRewardsRedemptionDetails)details;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setBalanceIdentifier:(id)a3;
- (void)setCreatedAt:(id)a3;
- (void)setDetails:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOriginalTransactionDetails:(id)a3;
- (void)setPaymentHash:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setStatusLink:(id)a3;
- (void)setUpdatedAt:(id)a3;
@end

@implementation PKPaymentRewardsRedemption

- (PKPaymentRewardsRedemption)initWithIdentifier:(id)a3 balanceIdentifier:(id)a4 status:(unint64_t)a5 statusLink:(id)a6 paymentHash:(id)a7
{
  v12 = (void *)MEMORY[0x1E4F1C9C8];
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  v17 = [v12 now];
  v18 = [(PKPaymentRewardsRedemption *)self initWithIdentifier:v16 balanceIdentifier:v15 status:a5 statusLink:v14 paymentHash:v13 createdAt:v17 updatedAt:v17];

  return v18;
}

- (PKPaymentRewardsRedemption)initWithIdentifier:(id)a3 balanceIdentifier:(id)a4 status:(unint64_t)a5 statusLink:(id)a6 paymentHash:(id)a7 createdAt:(id)a8 updatedAt:(id)a9
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v39.receiver = self;
  v39.super_class = (Class)PKPaymentRewardsRedemption;
  v21 = [(PKPaymentRewardsRedemption *)&v39 init];
  if (v21)
  {
    uint64_t v22 = [v15 copy];
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    balanceIdentifier = v21->_balanceIdentifier;
    v21->_balanceIdentifier = (NSString *)v24;

    v21->_status = a5;
    uint64_t v26 = [v17 copy];
    statusLink = v21->_statusLink;
    v21->_statusLink = (NSURL *)v26;

    uint64_t v28 = [v18 copy];
    paymentHash = v21->_paymentHash;
    v21->_paymentHash = (NSString *)v28;

    uint64_t v30 = [v19 copy];
    createdAt = v21->_createdAt;
    v21->_createdAt = (NSDate *)v30;

    uint64_t v32 = [v20 copy];
    updatedAt = v21->_updatedAt;
    v21->_updatedAt = (NSDate *)v32;
  }
  v34 = v21->_identifier;
  if (v34 && v21->_balanceIdentifier && v21->_statusLink)
  {
    v35 = v21;
  }
  else
  {
    v36 = PKLogFacilityTypeGetObject(0x31uLL);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = v21->_balanceIdentifier;
      *(_DWORD *)buf = 138412546;
      v41 = v34;
      __int16 v42 = 2112;
      v43 = v37;
      _os_log_impl(&dword_190E10000, v36, OS_LOG_TYPE_DEFAULT, "Got Invalid Payment Rewards Redemption, with identifier: %@, balanceIdentifier: %@", buf, 0x16u);
    }

    v35 = 0;
  }

  return v35;
}

- (PKPaymentRewardsRedemption)initWithDictionary:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PKPaymentRewardsRedemption;
  v5 = [(PKPaymentRewardsRedemption *)&v39 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"balanceIdentifier"];
    balanceIdentifier = v5->_balanceIdentifier;
    v5->_balanceIdentifier = (NSString *)v8;

    v10 = [v4 PKStringForKey:@"status"];
    v5->_status = PKPaymentRewardsRedemptionStatusFromString(v10);

    uint64_t v11 = [v4 PKURLForKey:@"statusLink"];
    statusLink = v5->_statusLink;
    v5->_statusLink = (NSURL *)v11;

    uint64_t v13 = [v4 PKStringForKey:@"paymentHash"];
    paymentHash = v5->_paymentHash;
    v5->_paymentHash = (NSString *)v13;

    id v15 = [[PKPaymentRewardsRedemptionDetails alloc] initWithDictionary:v4];
    details = v5->_details;
    v5->_details = v15;

    uint64_t v17 = [v4 PKDateForKey:@"lastUpdatedAt"];
    updatedAt = v5->_updatedAt;
    v5->_updatedAt = (NSDate *)v17;

    if (!v5->_updatedAt)
    {
      id v19 = [v4 PKStringForKey:@"lastUpdatedAt"];
      uint64_t v20 = PKISO8601DateFromDateStringContainingFractionalSeconds(v19);
      v21 = v5->_updatedAt;
      v5->_updatedAt = (NSDate *)v20;

      if (!v5->_updatedAt)
      {
        uint64_t v22 = [MEMORY[0x1E4F1C9C8] now];
        v23 = v5->_updatedAt;
        v5->_updatedAt = (NSDate *)v22;
      }
    }
    uint64_t v24 = [v4 PKDateForKey:@"createdAt"];
    createdAt = v5->_createdAt;
    v5->_createdAt = (NSDate *)v24;

    if (!v5->_createdAt)
    {
      uint64_t v26 = [v4 PKStringForKey:@"createdAt"];
      uint64_t v27 = PKISO8601DateFromDateStringContainingFractionalSeconds(v26);
      uint64_t v28 = v5->_createdAt;
      v5->_createdAt = (NSDate *)v27;

      if (!v5->_createdAt)
      {
        v29 = [(PKPaymentRewardsRedemptionDetails *)v5->_details originalTransaction];
        uint64_t v30 = [v29 timestamp];
        v31 = v5->_createdAt;
        v5->_createdAt = (NSDate *)v30;

        if (!v5->_createdAt)
        {
          uint64_t v32 = [MEMORY[0x1E4F1C9C8] now];
          v33 = v5->_createdAt;
          v5->_createdAt = (NSDate *)v32;
        }
      }
    }
  }
  v34 = v5->_identifier;
  if (v34 && v5->_balanceIdentifier && v5->_statusLink)
  {
    v35 = v5;
  }
  else
  {
    v36 = PKLogFacilityTypeGetObject(0x31uLL);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = v5->_balanceIdentifier;
      *(_DWORD *)buf = 138412546;
      v41 = v34;
      __int16 v42 = 2112;
      v43 = v37;
      _os_log_impl(&dword_190E10000, v36, OS_LOG_TYPE_DEFAULT, "Got Invalid Payment Rewards Redemption, with identifier: %@, balanceIdentifier: %@", buf, 0x16u);
    }

    v35 = 0;
  }

  return v35;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  [v3 setObject:self->_balanceIdentifier forKeyedSubscript:@"balanceIdentifier"];
  unint64_t v4 = self->_status - 1;
  if (v4 > 5) {
    v5 = @"unknown";
  }
  else {
    v5 = off_1E56F7020[v4];
  }
  [v3 setObject:v5 forKeyedSubscript:@"status"];
  uint64_t v6 = [(NSURL *)self->_statusLink absoluteString];
  [v3 setObject:v6 forKeyedSubscript:@"statusLink"];

  [v3 setObject:self->_paymentHash forKeyedSubscript:@"paymentHash"];
  v7 = PKW3CDateStringFromDate(self->_createdAt);
  [v3 setObject:v7 forKeyedSubscript:@"createdAt"];

  uint64_t v8 = PKW3CDateStringFromDate(self->_updatedAt);
  [v3 setObject:v8 forKeyedSubscript:@"lastUpdatedAt"];

  v9 = [(PKPaymentRewardsRedemptionDetails *)self->_details dictionaryRepresentation];
  [v3 addEntriesFromDictionary:v9];

  v10 = (void *)[v3 copy];
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPaymentRewardsRedemption *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        identifier = self->_identifier;
        uint64_t v8 = v6->_identifier;
        if (identifier && v8)
        {
          if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
            goto LABEL_41;
          }
        }
        else if (identifier != v8)
        {
          goto LABEL_41;
        }
        balanceIdentifier = self->_balanceIdentifier;
        uint64_t v11 = v6->_balanceIdentifier;
        if (balanceIdentifier && v11)
        {
          if ((-[NSString isEqual:](balanceIdentifier, "isEqual:") & 1) == 0) {
            goto LABEL_41;
          }
        }
        else if (balanceIdentifier != v11)
        {
          goto LABEL_41;
        }
        statusLink = self->_statusLink;
        uint64_t v13 = v6->_statusLink;
        if (statusLink && v13)
        {
          if ((-[NSURL isEqual:](statusLink, "isEqual:") & 1) == 0) {
            goto LABEL_41;
          }
        }
        else if (statusLink != v13)
        {
          goto LABEL_41;
        }
        paymentHash = self->_paymentHash;
        id v15 = v6->_paymentHash;
        if (paymentHash && v15)
        {
          if ((-[NSString isEqual:](paymentHash, "isEqual:") & 1) == 0) {
            goto LABEL_41;
          }
        }
        else if (paymentHash != v15)
        {
          goto LABEL_41;
        }
        createdAt = self->_createdAt;
        uint64_t v17 = v6->_createdAt;
        if (createdAt && v17)
        {
          if ((-[NSDate isEqual:](createdAt, "isEqual:") & 1) == 0) {
            goto LABEL_41;
          }
        }
        else if (createdAt != v17)
        {
          goto LABEL_41;
        }
        updatedAt = self->_updatedAt;
        id v19 = v6->_updatedAt;
        if (updatedAt && v19)
        {
          if ((-[NSDate isEqual:](updatedAt, "isEqual:") & 1) == 0) {
            goto LABEL_41;
          }
        }
        else if (updatedAt != v19)
        {
          goto LABEL_41;
        }
        details = self->_details;
        v21 = v6->_details;
        if (details && v21)
        {
          if (-[PKPaymentRewardsRedemptionDetails isEqual:](details, "isEqual:"))
          {
LABEL_39:
            BOOL v9 = self->_status == v6->_status;
LABEL_42:

            goto LABEL_43;
          }
        }
        else if (details == v21)
        {
          goto LABEL_39;
        }
LABEL_41:
        BOOL v9 = 0;
        goto LABEL_42;
      }
    }
    BOOL v9 = 0;
  }
LABEL_43:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_balanceIdentifier];
  [v3 safelyAddObject:self->_statusLink];
  [v3 safelyAddObject:self->_paymentHash];
  [v3 safelyAddObject:self->_createdAt];
  [v3 safelyAddObject:self->_updatedAt];
  [v3 safelyAddObject:self->_details];
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentRewardsRedemption;
  id v4 = [(PKPaymentRewardsRedemption *)&v8 hash];
  uint64_t v5 = PKCombinedHash((uint64_t)v4, v3);
  unint64_t v6 = self->_status - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"balanceIdentifier: '%@'; ", self->_balanceIdentifier];
  unint64_t v4 = self->_status - 1;
  if (v4 > 5) {
    uint64_t v5 = @"unknown";
  }
  else {
    uint64_t v5 = off_1E56F7020[v4];
  }
  [v3 appendFormat:@"status: '%@'; ", v5];
  [v3 appendFormat:@"statusLink: '%@'; ", self->_statusLink];
  [v3 appendFormat:@"paymentHash: '%@'; ", self->_paymentHash];
  [v3 appendFormat:@"created at: '%@'; ", self->_createdAt];
  [v3 appendFormat:@"updated at: '%@'; ", self->_updatedAt];
  [v3 appendFormat:@"details: '%@'; ", self->_details];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentRewardsRedemption)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentRewardsRedemption;
  uint64_t v5 = [(PKPaymentRewardsRedemption *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"balanceIdentifier"];
    balanceIdentifier = v5->_balanceIdentifier;
    v5->_balanceIdentifier = (NSString *)v8;

    v5->_status = [v4 decodeIntegerForKey:@"status"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusLink"];
    statusLink = v5->_statusLink;
    v5->_statusLink = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentHash"];
    paymentHash = v5->_paymentHash;
    v5->_paymentHash = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"createdAt"];
    createdAt = v5->_createdAt;
    v5->_createdAt = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdatedAt"];
    updatedAt = v5->_updatedAt;
    v5->_updatedAt = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"details"];
    details = v5->_details;
    v5->_details = (PKPaymentRewardsRedemptionDetails *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_balanceIdentifier forKey:@"balanceIdentifier"];
  [v5 encodeInteger:self->_status forKey:@"status"];
  [v5 encodeObject:self->_statusLink forKey:@"statusLink"];
  [v5 encodeObject:self->_paymentHash forKey:@"paymentHash"];
  [v5 encodeObject:self->_createdAt forKey:@"createdAt"];
  [v5 encodeObject:self->_updatedAt forKey:@"lastUpdatedAt"];
  [v5 encodeObject:self->_details forKey:@"details"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_balanceIdentifier copyWithZone:a3];
  BOOL v9 = (void *)v5[2];
  v5[2] = v8;

  v5[3] = self->_status;
  uint64_t v10 = [(NSURL *)self->_statusLink copyWithZone:a3];
  uint64_t v11 = (void *)v5[4];
  v5[4] = v10;

  uint64_t v12 = [(NSString *)self->_paymentHash copyWithZone:a3];
  uint64_t v13 = (void *)v5[5];
  v5[5] = v12;

  uint64_t v14 = [(NSDate *)self->_createdAt copyWithZone:a3];
  id v15 = (void *)v5[6];
  v5[6] = v14;

  uint64_t v16 = [(NSDate *)self->_updatedAt copyWithZone:a3];
  uint64_t v17 = (void *)v5[7];
  v5[7] = v16;

  id v18 = [(PKPaymentRewardsRedemptionDetails *)self->_details copyWithZone:a3];
  id v19 = (void *)v5[8];
  v5[8] = v18;

  return v5;
}

- (NSDate)createdAt
{
  createdAt = self->_createdAt;
  if (!createdAt)
  {
    id v4 = [(PKPaymentRewardsRedemptionDetails *)self->_details originalTransaction];
    id v5 = [v4 timestamp];
    uint64_t v6 = self->_createdAt;
    self->_createdAt = v5;

    createdAt = self->_createdAt;
  }
  return createdAt;
}

- (BOOL)hasOriginalTransactionDetails
{
  v2 = [(PKPaymentRewardsRedemption *)self details];
  id v3 = [v2 originalTransaction];

  if (v3)
  {
    id v4 = [v3 identifier];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)setOriginalTransactionDetails:(id)a3
{
  details = self->_details;
  if (!a3 || details)
  {
    uint64_t v8 = (PKPaymentRewardsRedemptionDetails *)a3;
    [(PKPaymentRewardsRedemptionDetails *)details setOriginalTransaction:v8];
    v7 = v8;
  }
  else
  {
    id v5 = a3;
    uint64_t v6 = [[PKPaymentRewardsRedemptionDetails alloc] initWithIntended:0 redeemed:0 originalTransactionDetails:v5];

    v7 = self->_details;
    self->_details = v6;
  }
}

- (BOOL)isInGoodStanding
{
  return self->_statusLink && self->_status - 1 < 3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)balanceIdentifier
{
  return self->_balanceIdentifier;
}

- (void)setBalanceIdentifier:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (NSURL)statusLink
{
  return self->_statusLink;
}

- (void)setStatusLink:(id)a3
{
}

- (NSString)paymentHash
{
  return self->_paymentHash;
}

- (void)setPaymentHash:(id)a3
{
}

- (void)setCreatedAt:(id)a3
{
}

- (NSDate)updatedAt
{
  return self->_updatedAt;
}

- (void)setUpdatedAt:(id)a3
{
}

- (PKPaymentRewardsRedemptionDetails)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_updatedAt, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_paymentHash, 0);
  objc_storeStrong((id *)&self->_statusLink, 0);
  objc_storeStrong((id *)&self->_balanceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end