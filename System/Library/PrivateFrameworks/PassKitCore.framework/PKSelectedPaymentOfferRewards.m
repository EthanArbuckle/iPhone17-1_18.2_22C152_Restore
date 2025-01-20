@interface PKSelectedPaymentOfferRewards
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKPaymentOfferRewardsRedemptionIntent)rewardsRedemptionIntent;
- (PKSelectedPaymentOfferRewards)initWithCoder:(id)a3;
- (PKSelectedPaymentOfferRewards)initWithRewardsRedemptionIntent:(id)a3 criteriaIdentifier:(id)a4 paymentPass:(id)a5 sessionIdentifier:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKSelectedPaymentOfferRewards

- (PKSelectedPaymentOfferRewards)initWithRewardsRedemptionIntent:(id)a3 criteriaIdentifier:(id)a4 paymentPass:(id)a5 sessionIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  v15 = [v11 balanceIdentifier];
  v18.receiver = self;
  v18.super_class = (Class)PKSelectedPaymentOfferRewards;
  v16 = [(PKSelectedPaymentOffer *)&v18 initWithType:2 selectedOfferIdentifier:v15 paymentPass:v13 criteriaIdentifier:v14 sessionIdentifier:v12 serviceProviderData:MEMORY[0x1E4F1CC08]];

  if (v16) {
    objc_storeStrong((id *)&v16->_rewardsRedemptionIntent, a3);
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKSelectedPaymentOfferRewards *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)PKSelectedPaymentOfferRewards;
    if ([(PKSelectedPaymentOffer *)&v12 isEqual:v6])
    {
      rewardsRedemptionIntent = self->_rewardsRedemptionIntent;
      v8 = v6->_rewardsRedemptionIntent;
      if (rewardsRedemptionIntent) {
        BOOL v9 = v8 == 0;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9) {
        char v10 = rewardsRedemptionIntent == v8;
      }
      else {
        char v10 = -[PKPaymentOfferRewardsRedemptionIntent isEqual:](rewardsRedemptionIntent, "isEqual:");
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_rewardsRedemptionIntent];
  v7.receiver = self;
  v7.super_class = (Class)PKSelectedPaymentOfferRewards;
  id v4 = [(PKSelectedPaymentOffer *)&v7 hash];
  unint64_t v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t v4 = [(PKSelectedPaymentOffer *)self type];
  unint64_t v5 = @"unknown";
  if (v4 == 1) {
    unint64_t v5 = @"installment";
  }
  if (v4 == 2) {
    unint64_t v5 = @"rewards";
  }
  [v3 appendFormat:@"type: '%@'; ", v5];
  v6 = [(PKSelectedPaymentOffer *)self selectedOfferIdentifier];
  [v3 appendFormat:@"selectedOfferIdentifier: '%@'; ", v6];

  [v3 appendFormat:@"rewardsRedemptionIntent: '%@'; ", self->_rewardsRedemptionIntent];
  objc_super v7 = [(PKSelectedPaymentOffer *)self criteriaIdentifier];
  [v3 appendFormat:@"criteriaIdentifier: '%@'; ", v7];

  v8 = [(PKSelectedPaymentOffer *)self paymentPass];
  [v3 appendFormat:@"passUniqueID: '%@'; ", v8];

  BOOL v9 = [(PKSelectedPaymentOffer *)self sessionIdentifier];
  [v3 appendFormat:@"sessionIdentifier: '%@'; ", v9];

  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSelectedPaymentOfferRewards)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSelectedPaymentOfferRewards;
  unint64_t v5 = [(PKSelectedPaymentOffer *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewardsRedemptionIntent"];
    rewardsRedemptionIntent = v5->_rewardsRedemptionIntent;
    v5->_rewardsRedemptionIntent = (PKPaymentOfferRewardsRedemptionIntent *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKSelectedPaymentOfferRewards;
  id v4 = a3;
  [(PKSelectedPaymentOffer *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_rewardsRedemptionIntent, @"rewardsRedemptionIntent", v5.receiver, v5.super_class);
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PKPaymentOfferRewardsRedemptionIntent *)self->_rewardsRedemptionIntent copyWithZone:a3];
  objc_super v7 = (void *)v5[7];
  v5[7] = v6;

  return v5;
}

- (PKPaymentOfferRewardsRedemptionIntent)rewardsRedemptionIntent
{
  return self->_rewardsRedemptionIntent;
}

- (void).cxx_destruct
{
}

@end