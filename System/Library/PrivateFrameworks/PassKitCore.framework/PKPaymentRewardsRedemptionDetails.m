@interface PKPaymentRewardsRedemptionDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKPaymentRewardsRedemptionDetails)initWithCoder:(id)a3;
- (PKPaymentRewardsRedemptionDetails)initWithDictionary:(id)a3;
- (PKPaymentRewardsRedemptionDetails)initWithIntended:(id)a3 redeemed:(id)a4 originalTransactionDetails:(id)a5;
- (PKPaymentRewardsRedemptionTransactionDetails)originalTransaction;
- (PKPaymentRewardsRedemptionUnit)intended;
- (PKPaymentRewardsRedemptionUnit)redeemed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIntended:(id)a3;
- (void)setOriginalTransaction:(id)a3;
- (void)setRedeemed:(id)a3;
@end

@implementation PKPaymentRewardsRedemptionDetails

- (PKPaymentRewardsRedemptionDetails)initWithIntended:(id)a3 redeemed:(id)a4 originalTransactionDetails:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentRewardsRedemptionDetails;
  v11 = [(PKPaymentRewardsRedemptionDetails *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    intended = v11->_intended;
    v11->_intended = (PKPaymentRewardsRedemptionUnit *)v12;

    uint64_t v14 = [v9 copy];
    redeemed = v11->_redeemed;
    v11->_redeemed = (PKPaymentRewardsRedemptionUnit *)v14;

    uint64_t v16 = [v10 copy];
    originalTransaction = v11->_originalTransaction;
    v11->_originalTransaction = (PKPaymentRewardsRedemptionTransactionDetails *)v16;
  }
  return v11;
}

- (PKPaymentRewardsRedemptionDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKPaymentRewardsRedemptionDetails;
  v5 = [(PKPaymentRewardsRedemptionDetails *)&v20 init];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = [PKPaymentRewardsRedemptionUnit alloc];
  v7 = [v4 PKDictionaryForKey:@"redemptionRequest"];
  uint64_t v8 = [(PKPaymentRewardsRedemptionUnit *)v6 initWithDictionary:v7];
  intended = v5->_intended;
  v5->_intended = (PKPaymentRewardsRedemptionUnit *)v8;

  id v10 = [PKPaymentRewardsRedemptionUnit alloc];
  v11 = [v4 PKDictionaryForKey:@"redemptionDetails"];
  uint64_t v12 = [(PKPaymentRewardsRedemptionUnit *)v10 initWithDictionary:v11];
  redeemed = v5->_redeemed;
  v5->_redeemed = (PKPaymentRewardsRedemptionUnit *)v12;

  uint64_t v14 = [PKPaymentRewardsRedemptionTransactionDetails alloc];
  v15 = [v4 PKDictionaryForKey:@"originalTransaction"];
  uint64_t v16 = [(PKPaymentRewardsRedemptionTransactionDetails *)v14 initWithDictionary:v15];
  originalTransaction = v5->_originalTransaction;
  v5->_originalTransaction = (PKPaymentRewardsRedemptionTransactionDetails *)v16;

  if (v5->_intended || v5->_redeemed || v5->_originalTransaction) {
LABEL_5:
  }
    v18 = v5;
  else {
    v18 = 0;
  }

  return v18;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(PKPaymentRewardsRedemptionUnit *)self->_intended dictionaryRepresentation];
  [v3 setObject:v4 forKeyedSubscript:@"redemptionRequest"];

  v5 = [(PKPaymentRewardsRedemptionUnit *)self->_redeemed dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"redemptionDetails"];

  v6 = [(PKPaymentRewardsRedemptionTransactionDetails *)self->_originalTransaction dictionaryRepresentation];
  [v3 setObject:v6 forKeyedSubscript:@"originalTransaction"];

  v7 = (void *)[v3 copy];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentRewardsRedemptionDetails *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        intended = self->_intended;
        uint64_t v8 = v6->_intended;
        if (intended && v8)
        {
          if (!-[PKPaymentRewardsRedemptionUnit isEqual:](intended, "isEqual:")) {
            goto LABEL_18;
          }
        }
        else if (intended != v8)
        {
          goto LABEL_18;
        }
        redeemed = self->_redeemed;
        v11 = v6->_redeemed;
        if (redeemed && v11)
        {
          if (-[PKPaymentRewardsRedemptionUnit isEqual:](redeemed, "isEqual:"))
          {
LABEL_14:
            originalTransaction = self->_originalTransaction;
            v13 = v6->_originalTransaction;
            if (originalTransaction && v13) {
              char v9 = -[PKPaymentRewardsRedemptionTransactionDetails isEqual:](originalTransaction, "isEqual:");
            }
            else {
              char v9 = originalTransaction == v13;
            }
            goto LABEL_19;
          }
        }
        else if (redeemed == v11)
        {
          goto LABEL_14;
        }
LABEL_18:
        char v9 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    char v9 = 0;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_intended];
  [v3 safelyAddObject:self->_redeemed];
  [v3 safelyAddObject:self->_originalTransaction];
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentRewardsRedemptionDetails;
  id v4 = [(PKPaymentRewardsRedemptionDetails *)&v7 hash];
  unint64_t v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"intendedDetails: '%@'; ", self->_intended];
  [v3 appendFormat:@"redeemedDetails: '%@'; ", self->_redeemed];
  [v3 appendFormat:@"originalTransaction: '%@'; ", self->_originalTransaction];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentRewardsRedemptionDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentRewardsRedemptionDetails;
  unint64_t v5 = [(PKPaymentRewardsRedemptionDetails *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"redemptionRequest"];
    intended = v5->_intended;
    v5->_intended = (PKPaymentRewardsRedemptionUnit *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"redemptionDetails"];
    redeemed = v5->_redeemed;
    v5->_redeemed = (PKPaymentRewardsRedemptionUnit *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalTransaction"];
    originalTransaction = v5->_originalTransaction;
    v5->_originalTransaction = (PKPaymentRewardsRedemptionTransactionDetails *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  intended = self->_intended;
  id v5 = a3;
  [v5 encodeObject:intended forKey:@"redemptionRequest"];
  [v5 encodeObject:self->_redeemed forKey:@"redemptionDetails"];
  [v5 encodeObject:self->_originalTransaction forKey:@"originalTransaction"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PKPaymentRewardsRedemptionUnit *)self->_intended copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(PKPaymentRewardsRedemptionUnit *)self->_redeemed copyWithZone:a3];
  char v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(PKPaymentRewardsRedemptionTransactionDetails *)self->_originalTransaction copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (PKPaymentRewardsRedemptionUnit)intended
{
  return self->_intended;
}

- (void)setIntended:(id)a3
{
}

- (PKPaymentRewardsRedemptionUnit)redeemed
{
  return self->_redeemed;
}

- (void)setRedeemed:(id)a3
{
}

- (PKPaymentRewardsRedemptionTransactionDetails)originalTransaction
{
  return self->_originalTransaction;
}

- (void)setOriginalTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalTransaction, 0);
  objc_storeStrong((id *)&self->_redeemed, 0);
  objc_storeStrong((id *)&self->_intended, 0);
}

@end