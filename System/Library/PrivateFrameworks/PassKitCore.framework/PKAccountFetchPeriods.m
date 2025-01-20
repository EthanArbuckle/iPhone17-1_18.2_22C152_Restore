@interface PKAccountFetchPeriods
+ (BOOL)isLastUpdatedOutOfDate:(id)a3 fetchPeriod:(double)a4;
+ (BOOL)supportsSecureCoding;
- (BOOL)endpointIsBlocked:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccountFetchPeriods:(id)a3;
- (NSSet)blockedEndpoints;
- (PKAccountFetchPeriods)initWithCoder:(id)a3;
- (PKAccountFetchPeriods)initWithDictionary:(id)a3;
- (double)accountFetchPeriod;
- (double)extendedAccountFetchPeriod;
- (double)fetchPeriodForEndpoint:(unint64_t)a3;
- (double)financingPlansFetchPeriod;
- (double)fundingSourcesFetchPeriod;
- (double)physicalCardsFetchPeriod;
- (double)promotionsFetchPeriod;
- (double)recoveryPaymentPlansFetchPeriod;
- (double)sharedCloudStoreModelFetchPeriod;
- (double)usersFetchPeriod;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountFetchPeriod:(double)a3;
- (void)setBlockedEndpoints:(id)a3;
- (void)setExtendedAccountFetchPeriod:(double)a3;
- (void)setFinancingPlansFetchPeriod:(double)a3;
- (void)setFundingSourcesFetchPeriod:(double)a3;
- (void)setPhysicalCardsFetchPeriod:(double)a3;
- (void)setPromotionsFetchPeriod:(double)a3;
- (void)setRecoveryPaymentPlansFetchPeriod:(double)a3;
- (void)setSharedCloudStoreModelFetchPeriod:(double)a3;
- (void)setUsersFetchPeriod:(double)a3;
@end

@implementation PKAccountFetchPeriods

- (PKAccountFetchPeriods)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKAccountFetchPeriods;
  v5 = [(PKAccountFetchPeriods *)&v10 init];
  if (v5)
  {
    v5->_accountFetchPeriod = (double)[v4 PKIntegerForKey:@"account"];
    v5->_extendedAccountFetchPeriod = (double)[v4 PKIntegerForKey:@"extendedAccount"];
    v5->_usersFetchPeriod = (double)[v4 PKIntegerForKey:@"users"];
    v5->_sharedCloudStoreModelFetchPeriod = (double)[v4 PKIntegerForKey:@"sharedAccountCloudStore"];
    v5->_financingPlansFetchPeriod = (double)[v4 PKIntegerForKey:@"financingPlans"];
    v5->_fundingSourcesFetchPeriod = (double)[v4 PKIntegerForKey:@"fundingSources"];
    v5->_promotionsFetchPeriod = (double)[v4 PKIntegerForKey:@"promotions"];
    v5->_recoveryPaymentPlansFetchPeriod = (double)[v4 PKIntegerForKey:@"recoveryPaymentPlans"];
    v5->_physicalCardsFetchPeriod = (double)[v4 PKIntegerForKey:@"physicalCards"];
    v6 = [v4 PKSetContaining:objc_opt_class() forKey:@"blockedEndpoints"];
    if ([v6 count])
    {
      uint64_t v7 = objc_msgSend(v6, "pk_setByApplyingBlock:", &__block_literal_global_203);
      blockedEndpoints = v5->_blockedEndpoints;
      v5->_blockedEndpoints = (NSSet *)v7;
    }
  }

  return v5;
}

id __44__PKAccountFetchPeriods_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = NSNumber;
  id v4 = (__CFString *)v2;
  v5 = v4;
  if (v4 == @"account") {
    goto LABEL_4;
  }
  if (!v4) {
    goto LABEL_26;
  }
  char v6 = [(__CFString *)v4 isEqualToString:@"account"];

  if (v6)
  {
LABEL_4:
    uint64_t v7 = 1;
    goto LABEL_27;
  }
  v8 = v5;
  if (v8 == @"extendedAccount"
    || (v9 = v8,
        char v10 = [(__CFString *)v8 isEqualToString:@"extendedAccount"],
        v9,
        (v10 & 1) != 0))
  {
    uint64_t v7 = 2;
    goto LABEL_27;
  }
  v11 = v9;
  if (v11 == @"users"
    || (v12 = v11,
        char v13 = [(__CFString *)v11 isEqualToString:@"users"],
        v12,
        (v13 & 1) != 0))
  {
    uint64_t v7 = 3;
    goto LABEL_27;
  }
  v14 = v12;
  if (v14 == @"sharedAccountCloudStore"
    || (v15 = v14,
        char v16 = [(__CFString *)v14 isEqualToString:@"sharedAccountCloudStore"],
        v15,
        (v16 & 1) != 0))
  {
    uint64_t v7 = 4;
    goto LABEL_27;
  }
  v17 = v15;
  if (v17 == @"financingPlans"
    || (v18 = v17,
        char v19 = [(__CFString *)v17 isEqualToString:@"financingPlans"],
        v18,
        (v19 & 1) != 0))
  {
    uint64_t v7 = 5;
    goto LABEL_27;
  }
  v20 = v18;
  if (v20 == @"promotions"
    || (v21 = v20,
        char v22 = [(__CFString *)v20 isEqualToString:@"promotions"],
        v21,
        (v22 & 1) != 0))
  {
    uint64_t v7 = 7;
    goto LABEL_27;
  }
  v23 = v21;
  if (v23 == @"recoveryPaymentPlans"
    || (v24 = v23,
        char v25 = [(__CFString *)v23 isEqualToString:@"recoveryPaymentPlans"],
        v24,
        (v25 & 1) != 0))
  {
    uint64_t v7 = 8;
    goto LABEL_27;
  }
  v26 = v24;
  if (v26 == @"physicalCards"
    || (v27 = v26,
        int v28 = [(__CFString *)v26 isEqualToString:@"physicalCards"],
        v27,
        v28))
  {
    uint64_t v7 = 9;
  }
  else
  {
LABEL_26:
    uint64_t v7 = 0;
  }
LABEL_27:

  v29 = [v3 numberWithUnsignedInteger:v7];

  return v29;
}

- (double)fetchPeriodForEndpoint:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      double result = self->_accountFetchPeriod;
      goto LABEL_12;
    case 2uLL:
      double result = self->_extendedAccountFetchPeriod;
      goto LABEL_12;
    case 3uLL:
      double result = self->_usersFetchPeriod;
      goto LABEL_12;
    case 4uLL:
      double result = self->_sharedCloudStoreModelFetchPeriod;
      goto LABEL_12;
    case 5uLL:
      double result = self->_financingPlansFetchPeriod;
      goto LABEL_12;
    case 6uLL:
      double result = self->_fundingSourcesFetchPeriod;
      goto LABEL_12;
    case 7uLL:
      double result = self->_promotionsFetchPeriod;
      goto LABEL_12;
    case 8uLL:
      double result = self->_recoveryPaymentPlansFetchPeriod;
      goto LABEL_12;
    case 9uLL:
      double result = self->_physicalCardsFetchPeriod;
LABEL_12:
      if (result <= 0.0) {
        double result = 86400.0;
      }
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

- (BOOL)endpointIsBlocked:(unint64_t)a3
{
  blockedEndpoints = self->_blockedEndpoints;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  LOBYTE(blockedEndpoints) = [(NSSet *)blockedEndpoints containsObject:v4];

  return (char)blockedEndpoints;
}

+ (BOOL)isLastUpdatedOutOfDate:(id)a3 fetchPeriod:(double)a4
{
  if (!a3) {
    return 1;
  }
  if (a4 <= 0.0) {
    double v4 = 86400.0;
  }
  else {
    double v4 = a4;
  }
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a3;
  uint64_t v7 = [v5 date];
  [v7 timeIntervalSinceDate:v6];
  double v9 = v8;

  BOOL v10 = v9 >= v4;
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PKAccountFetchPeriods *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountFetchPeriods *)self isEqualToAccountFetchPeriods:v5];

  return v6;
}

- (BOOL)isEqualToAccountFetchPeriods:(id)a3
{
  double v4 = (double *)a3;
  v5 = v4;
  if (!v4 || self->_accountFetchPeriod != v4[1]) {
    goto LABEL_16;
  }
  blockedEndpoints = self->_blockedEndpoints;
  uint64_t v7 = (NSSet *)*((void *)v5 + 10);
  if (blockedEndpoints && v7)
  {
    if ((-[NSSet isEqual:](blockedEndpoints, "isEqual:") & 1) == 0) {
      goto LABEL_16;
    }
  }
  else if (blockedEndpoints != v7)
  {
LABEL_16:
    BOOL v8 = 0;
    goto LABEL_17;
  }
  if (self->_usersFetchPeriod != v5[3]
    || self->_sharedCloudStoreModelFetchPeriod != v5[4]
    || self->_financingPlansFetchPeriod != v5[5]
    || self->_extendedAccountFetchPeriod != v5[2]
    || self->_fundingSourcesFetchPeriod != v5[6]
    || self->_promotionsFetchPeriod != v5[7]
    || self->_recoveryPaymentPlansFetchPeriod != v5[8])
  {
    goto LABEL_16;
  }
  BOOL v8 = self->_physicalCardsFetchPeriod == v5[9];
LABEL_17:

  return v8;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_blockedEndpoints];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = (unint64_t)self->_accountFetchPeriod - v4 + 32 * v4;
  unint64_t v6 = (unint64_t)self->_extendedAccountFetchPeriod - v5 + 32 * v5;
  unint64_t v7 = (unint64_t)self->_usersFetchPeriod - v6 + 32 * v6;
  unint64_t v8 = (unint64_t)self->_sharedCloudStoreModelFetchPeriod - v7 + 32 * v7;
  unint64_t v9 = (unint64_t)self->_financingPlansFetchPeriod - v8 + 32 * v8;
  unint64_t v10 = (unint64_t)self->_fundingSourcesFetchPeriod - v9 + 32 * v9;
  unint64_t v11 = (unint64_t)self->_promotionsFetchPeriod - v10 + 32 * v10;
  unint64_t v12 = (unint64_t)self->_recoveryPaymentPlansFetchPeriod - v11 + 32 * v11;
  unint64_t v13 = (unint64_t)self->_physicalCardsFetchPeriod - v12 + 32 * v12;

  return v13;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  if ([(NSSet *)self->_blockedEndpoints count]) {
    [v3 appendFormat:@"blockedEndpoints: %@; ", self->_blockedEndpoints];
  }
  objc_msgSend(v3, "appendFormat:", @"account: '%ld'; ", (uint64_t)self->_accountFetchPeriod);
  objc_msgSend(v3, "appendFormat:", @"extendedAccount: '%ld'; ", (uint64_t)self->_extendedAccountFetchPeriod);
  objc_msgSend(v3, "appendFormat:", @"users: '%ld'; ", (uint64_t)self->_usersFetchPeriod);
  objc_msgSend(v3, "appendFormat:", @"sharedAccountCloudStore: '%ld'; ",
    (uint64_t)self->_sharedCloudStoreModelFetchPeriod);
  objc_msgSend(v3, "appendFormat:", @"financingPlans: '%ld'; ", (uint64_t)self->_financingPlansFetchPeriod);
  objc_msgSend(v3, "appendFormat:", @"fundingSources: '%ld'; ", (uint64_t)self->_fundingSourcesFetchPeriod);
  objc_msgSend(v3, "appendFormat:", @"promotions: '%ld'; ", (uint64_t)self->_promotionsFetchPeriod);
  objc_msgSend(v3, "appendFormat:", @"creditRecoveryPaymentPlans: '%ld'; ",
    (uint64_t)self->_recoveryPaymentPlansFetchPeriod);
  objc_msgSend(v3, "appendFormat:", @"physicalCards: '%ld'; ", (uint64_t)self->_physicalCardsFetchPeriod);
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKAccountFetchPeriods allocWithZone:](PKAccountFetchPeriods, "allocWithZone:") init];
  uint64_t v6 = [(NSSet *)self->_blockedEndpoints copyWithZone:a3];
  blockedEndpoints = v5->_blockedEndpoints;
  v5->_blockedEndpoints = (NSSet *)v6;

  v5->_accountFetchPeriod = self->_accountFetchPeriod;
  v5->_extendedAccountFetchPeriod = self->_extendedAccountFetchPeriod;
  v5->_usersFetchPeriod = self->_usersFetchPeriod;
  v5->_sharedCloudStoreModelFetchPeriod = self->_sharedCloudStoreModelFetchPeriod;
  v5->_financingPlansFetchPeriod = self->_financingPlansFetchPeriod;
  v5->_fundingSourcesFetchPeriod = self->_fundingSourcesFetchPeriod;
  v5->_promotionsFetchPeriod = self->_promotionsFetchPeriod;
  v5->_recoveryPaymentPlansFetchPeriod = self->_recoveryPaymentPlansFetchPeriod;
  v5->_physicalCardsFetchPeriod = self->_physicalCardsFetchPeriod;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountFetchPeriods)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountFetchPeriods;
  unint64_t v5 = [(PKAccountFetchPeriods *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    unint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"blockedEndpoints"];
    blockedEndpoints = v5->_blockedEndpoints;
    v5->_blockedEndpoints = (NSSet *)v9;

    v5->_accountFetchPeriod = (double)[v4 decodeIntegerForKey:@"account"];
    v5->_extendedAccountFetchPeriod = (double)[v4 decodeIntegerForKey:@"extendedAccount"];
    v5->_usersFetchPeriod = (double)[v4 decodeIntegerForKey:@"users"];
    v5->_sharedCloudStoreModelFetchPeriod = (double)[v4 decodeIntegerForKey:@"sharedAccountCloudStore"];
    v5->_financingPlansFetchPeriod = (double)[v4 decodeIntegerForKey:@"financingPlans"];
    v5->_fundingSourcesFetchPeriod = (double)[v4 decodeIntegerForKey:@"fundingSources"];
    v5->_promotionsFetchPeriod = (double)[v4 decodeIntegerForKey:@"promotions"];
    v5->_recoveryPaymentPlansFetchPeriod = (double)[v4 decodeIntegerForKey:@"recoveryPaymentPlans"];
    v5->_physicalCardsFetchPeriod = (double)[v4 decodeIntegerForKey:@"physicalCards"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  blockedEndpoints = self->_blockedEndpoints;
  id v5 = a3;
  [v5 encodeObject:blockedEndpoints forKey:@"blockedEndpoints"];
  [v5 encodeInteger:(uint64_t)self->_accountFetchPeriod forKey:@"account"];
  [v5 encodeInteger:(uint64_t)self->_extendedAccountFetchPeriod forKey:@"extendedAccount"];
  [v5 encodeInteger:(uint64_t)self->_usersFetchPeriod forKey:@"users"];
  [v5 encodeInteger:(uint64_t)self->_sharedCloudStoreModelFetchPeriod forKey:@"sharedAccountCloudStore"];
  [v5 encodeInteger:(uint64_t)self->_financingPlansFetchPeriod forKey:@"financingPlans"];
  [v5 encodeInteger:(uint64_t)self->_fundingSourcesFetchPeriod forKey:@"fundingSources"];
  [v5 encodeInteger:(uint64_t)self->_promotionsFetchPeriod forKey:@"promotions"];
  [v5 encodeInteger:(uint64_t)self->_recoveryPaymentPlansFetchPeriod forKey:@"recoveryPaymentPlans"];
  [v5 encodeInteger:(uint64_t)self->_physicalCardsFetchPeriod forKey:@"physicalCards"];
}

- (double)accountFetchPeriod
{
  return self->_accountFetchPeriod;
}

- (void)setAccountFetchPeriod:(double)a3
{
  self->_accountFetchPeriod = a3;
}

- (double)extendedAccountFetchPeriod
{
  return self->_extendedAccountFetchPeriod;
}

- (void)setExtendedAccountFetchPeriod:(double)a3
{
  self->_extendedAccountFetchPeriod = a3;
}

- (double)usersFetchPeriod
{
  return self->_usersFetchPeriod;
}

- (void)setUsersFetchPeriod:(double)a3
{
  self->_usersFetchPeriod = a3;
}

- (double)sharedCloudStoreModelFetchPeriod
{
  return self->_sharedCloudStoreModelFetchPeriod;
}

- (void)setSharedCloudStoreModelFetchPeriod:(double)a3
{
  self->_sharedCloudStoreModelFetchPeriod = a3;
}

- (double)financingPlansFetchPeriod
{
  return self->_financingPlansFetchPeriod;
}

- (void)setFinancingPlansFetchPeriod:(double)a3
{
  self->_financingPlansFetchPeriod = a3;
}

- (double)fundingSourcesFetchPeriod
{
  return self->_fundingSourcesFetchPeriod;
}

- (void)setFundingSourcesFetchPeriod:(double)a3
{
  self->_fundingSourcesFetchPeriod = a3;
}

- (double)promotionsFetchPeriod
{
  return self->_promotionsFetchPeriod;
}

- (void)setPromotionsFetchPeriod:(double)a3
{
  self->_promotionsFetchPeriod = a3;
}

- (double)recoveryPaymentPlansFetchPeriod
{
  return self->_recoveryPaymentPlansFetchPeriod;
}

- (void)setRecoveryPaymentPlansFetchPeriod:(double)a3
{
  self->_recoveryPaymentPlansFetchPeriod = a3;
}

- (double)physicalCardsFetchPeriod
{
  return self->_physicalCardsFetchPeriod;
}

- (void)setPhysicalCardsFetchPeriod:(double)a3
{
  self->_physicalCardsFetchPeriod = a3;
}

- (NSSet)blockedEndpoints
{
  return self->_blockedEndpoints;
}

- (void)setBlockedEndpoints:(id)a3
{
}

- (void).cxx_destruct
{
}

@end