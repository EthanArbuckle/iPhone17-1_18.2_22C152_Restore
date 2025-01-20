@interface PKAccountAdditionalPushTopics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)account;
- (NSString)applications;
- (NSString)creditRecoveryPaymentPlans;
- (NSString)extendedAccount;
- (NSString)financingPlans;
- (NSString)fundingSources;
- (NSString)payments;
- (NSString)physicalCards;
- (NSString)servicingToken;
- (NSString)sharedAccountCloudStore;
- (NSString)users;
- (NSString)virtualCards;
- (PKAccountAdditionalPushTopics)initWithCoder:(id)a3;
- (PKAccountAdditionalPushTopics)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAccount:(id)a3;
- (void)setApplications:(id)a3;
- (void)setCreditRecoveryPaymentPlans:(id)a3;
- (void)setExtendedAccount:(id)a3;
- (void)setFinancingPlans:(id)a3;
- (void)setFundingSources:(id)a3;
- (void)setPayments:(id)a3;
- (void)setPhysicalCards:(id)a3;
- (void)setServicingToken:(id)a3;
- (void)setSharedAccountCloudStore:(id)a3;
- (void)setUsers:(id)a3;
- (void)setVirtualCards:(id)a3;
@end

@implementation PKAccountAdditionalPushTopics

- (PKAccountAdditionalPushTopics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKAccountAdditionalPushTopics;
  v5 = [(PKAccountAdditionalPushTopics *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"account"];
    account = v5->_account;
    v5->_account = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"extendedAccount"];
    extendedAccount = v5->_extendedAccount;
    v5->_extendedAccount = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"payments"];
    payments = v5->_payments;
    v5->_payments = (NSString *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"users"];
    users = v5->_users;
    v5->_users = (NSString *)v12;

    uint64_t v14 = [v4 PKStringForKey:@"sharedAccountCloudStore"];
    sharedAccountCloudStore = v5->_sharedAccountCloudStore;
    v5->_sharedAccountCloudStore = (NSString *)v14;

    uint64_t v16 = [v4 PKStringForKey:@"applications"];
    applications = v5->_applications;
    v5->_applications = (NSString *)v16;

    uint64_t v18 = [v4 PKStringForKey:@"financingPlans"];
    financingPlans = v5->_financingPlans;
    v5->_financingPlans = (NSString *)v18;

    uint64_t v20 = [v4 PKStringForKey:@"physicalCards"];
    physicalCards = v5->_physicalCards;
    v5->_physicalCards = (NSString *)v20;

    uint64_t v22 = [v4 PKStringForKey:@"virtualCards"];
    virtualCards = v5->_virtualCards;
    v5->_virtualCards = (NSString *)v22;

    uint64_t v24 = [v4 PKStringForKey:@"servicingToken"];
    servicingToken = v5->_servicingToken;
    v5->_servicingToken = (NSString *)v24;

    uint64_t v26 = [v4 PKStringForKey:@"fundingSources"];
    fundingSources = v5->_fundingSources;
    v5->_fundingSources = (NSString *)v26;

    uint64_t v28 = [v4 PKStringForKey:@"recoveryPaymentPlans"];
    creditRecoveryPaymentPlans = v5->_creditRecoveryPaymentPlans;
    v5->_creditRecoveryPaymentPlans = (NSString *)v28;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_59;
  }
  account = self->_account;
  uint64_t v6 = (NSString *)v4[1];
  if (account && v6)
  {
    if ((-[NSString isEqual:](account, "isEqual:") & 1) == 0) {
      goto LABEL_59;
    }
  }
  else if (account != v6)
  {
    goto LABEL_59;
  }
  extendedAccount = self->_extendedAccount;
  uint64_t v8 = (NSString *)v4[2];
  if (extendedAccount && v8)
  {
    if ((-[NSString isEqual:](extendedAccount, "isEqual:") & 1) == 0) {
      goto LABEL_59;
    }
  }
  else if (extendedAccount != v8)
  {
    goto LABEL_59;
  }
  users = self->_users;
  uint64_t v10 = (NSString *)v4[4];
  if (users && v10)
  {
    if ((-[NSString isEqual:](users, "isEqual:") & 1) == 0) {
      goto LABEL_59;
    }
  }
  else if (users != v10)
  {
    goto LABEL_59;
  }
  payments = self->_payments;
  uint64_t v12 = (NSString *)v4[3];
  if (payments && v12)
  {
    if ((-[NSString isEqual:](payments, "isEqual:") & 1) == 0) {
      goto LABEL_59;
    }
  }
  else if (payments != v12)
  {
    goto LABEL_59;
  }
  sharedAccountCloudStore = self->_sharedAccountCloudStore;
  uint64_t v14 = (NSString *)v4[5];
  if (sharedAccountCloudStore && v14)
  {
    if ((-[NSString isEqual:](sharedAccountCloudStore, "isEqual:") & 1) == 0) {
      goto LABEL_59;
    }
  }
  else if (sharedAccountCloudStore != v14)
  {
    goto LABEL_59;
  }
  applications = self->_applications;
  uint64_t v16 = (NSString *)v4[6];
  if (applications && v16)
  {
    if ((-[NSString isEqual:](applications, "isEqual:") & 1) == 0) {
      goto LABEL_59;
    }
  }
  else if (applications != v16)
  {
    goto LABEL_59;
  }
  financingPlans = self->_financingPlans;
  uint64_t v18 = (NSString *)v4[7];
  if (financingPlans && v18)
  {
    if ((-[NSString isEqual:](financingPlans, "isEqual:") & 1) == 0) {
      goto LABEL_59;
    }
  }
  else if (financingPlans != v18)
  {
    goto LABEL_59;
  }
  physicalCards = self->_physicalCards;
  uint64_t v20 = (NSString *)v4[8];
  if (physicalCards && v20)
  {
    if ((-[NSString isEqual:](physicalCards, "isEqual:") & 1) == 0) {
      goto LABEL_59;
    }
  }
  else if (physicalCards != v20)
  {
    goto LABEL_59;
  }
  virtualCards = self->_virtualCards;
  uint64_t v22 = (NSString *)v4[9];
  if (virtualCards && v22)
  {
    if ((-[NSString isEqual:](virtualCards, "isEqual:") & 1) == 0) {
      goto LABEL_59;
    }
  }
  else if (virtualCards != v22)
  {
    goto LABEL_59;
  }
  servicingToken = self->_servicingToken;
  uint64_t v24 = (NSString *)v4[10];
  if (servicingToken && v24)
  {
    if ((-[NSString isEqual:](servicingToken, "isEqual:") & 1) == 0) {
      goto LABEL_59;
    }
  }
  else if (servicingToken != v24)
  {
    goto LABEL_59;
  }
  fundingSources = self->_fundingSources;
  uint64_t v26 = (NSString *)v4[11];
  if (!fundingSources || !v26)
  {
    if (fundingSources == v26) {
      goto LABEL_55;
    }
LABEL_59:
    char v29 = 0;
    goto LABEL_60;
  }
  if ((-[NSString isEqual:](fundingSources, "isEqual:") & 1) == 0) {
    goto LABEL_59;
  }
LABEL_55:
  creditRecoveryPaymentPlans = self->_creditRecoveryPaymentPlans;
  uint64_t v28 = (NSString *)v4[12];
  if (creditRecoveryPaymentPlans && v28) {
    char v29 = -[NSString isEqual:](creditRecoveryPaymentPlans, "isEqual:");
  }
  else {
    char v29 = creditRecoveryPaymentPlans == v28;
  }
LABEL_60:

  return v29;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_account];
  [v3 safelyAddObject:self->_extendedAccount];
  [v3 safelyAddObject:self->_payments];
  [v3 safelyAddObject:self->_users];
  [v3 safelyAddObject:self->_sharedAccountCloudStore];
  [v3 safelyAddObject:self->_applications];
  [v3 safelyAddObject:self->_financingPlans];
  [v3 safelyAddObject:self->_physicalCards];
  [v3 safelyAddObject:self->_virtualCards];
  [v3 safelyAddObject:self->_servicingToken];
  [v3 safelyAddObject:self->_fundingSources];
  [v3 safelyAddObject:self->_creditRecoveryPaymentPlans];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"account: '%@'; ", self->_account];
  [v3 appendFormat:@"extendedAccount: '%@'; ", self->_extendedAccount];
  [v3 appendFormat:@"payments: '%@'; ", self->_payments];
  [v3 appendFormat:@"users: '%@'; ", self->_users];
  [v3 appendFormat:@"sharedAccountCloudStore: '%@'; ", self->_sharedAccountCloudStore];
  [v3 appendFormat:@"applications: '%@'; ", self->_applications];
  [v3 appendFormat:@"financingPlans: '%@'; ", self->_financingPlans];
  [v3 appendFormat:@"physicalCards: '%@'; ", self->_physicalCards];
  [v3 appendFormat:@"virtualCards: '%@'; ", self->_virtualCards];
  [v3 appendFormat:@"serivicingToken: '%@'; ", self->_servicingToken];
  [v3 appendFormat:@"fundingSources: '%@'; ", self->_fundingSources];
  [v3 appendFormat:@"creditRecoveryPaymentPlans: '%@'; ", self->_creditRecoveryPaymentPlans];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKAccountAdditionalPushTopics allocWithZone:](PKAccountAdditionalPushTopics, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_account copyWithZone:a3];
  account = v5->_account;
  v5->_account = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_extendedAccount copyWithZone:a3];
  extendedAccount = v5->_extendedAccount;
  v5->_extendedAccount = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_payments copyWithZone:a3];
  payments = v5->_payments;
  v5->_payments = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_users copyWithZone:a3];
  users = v5->_users;
  v5->_users = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_sharedAccountCloudStore copyWithZone:a3];
  sharedAccountCloudStore = v5->_sharedAccountCloudStore;
  v5->_sharedAccountCloudStore = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_applications copyWithZone:a3];
  applications = v5->_applications;
  v5->_applications = (NSString *)v16;

  uint64_t v18 = [(NSString *)self->_financingPlans copyWithZone:a3];
  financingPlans = v5->_financingPlans;
  v5->_financingPlans = (NSString *)v18;

  uint64_t v20 = [(NSString *)self->_physicalCards copyWithZone:a3];
  physicalCards = v5->_physicalCards;
  v5->_physicalCards = (NSString *)v20;

  uint64_t v22 = [(NSString *)self->_virtualCards copyWithZone:a3];
  virtualCards = v5->_virtualCards;
  v5->_virtualCards = (NSString *)v22;

  uint64_t v24 = [(NSString *)self->_servicingToken copyWithZone:a3];
  servicingToken = v5->_servicingToken;
  v5->_servicingToken = (NSString *)v24;

  uint64_t v26 = [(NSString *)self->_fundingSources copyWithZone:a3];
  fundingSources = v5->_fundingSources;
  v5->_fundingSources = (NSString *)v26;

  uint64_t v28 = [(NSString *)self->_creditRecoveryPaymentPlans copyWithZone:a3];
  creditRecoveryPaymentPlans = v5->_creditRecoveryPaymentPlans;
  v5->_creditRecoveryPaymentPlans = (NSString *)v28;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountAdditionalPushTopics)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PKAccountAdditionalPushTopics;
  v5 = [(PKAccountAdditionalPushTopics *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"account"];
    account = v5->_account;
    v5->_account = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extendedAccount"];
    extendedAccount = v5->_extendedAccount;
    v5->_extendedAccount = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payments"];
    payments = v5->_payments;
    v5->_payments = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"users"];
    users = v5->_users;
    v5->_users = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedAccountCloudStore"];
    sharedAccountCloudStore = v5->_sharedAccountCloudStore;
    v5->_sharedAccountCloudStore = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applications"];
    applications = v5->_applications;
    v5->_applications = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"financingPlans"];
    financingPlans = v5->_financingPlans;
    v5->_financingPlans = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"physicalCards"];
    physicalCards = v5->_physicalCards;
    v5->_physicalCards = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"virtualCards"];
    virtualCards = v5->_virtualCards;
    v5->_virtualCards = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"servicingToken"];
    servicingToken = v5->_servicingToken;
    v5->_servicingToken = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fundingSources"];
    fundingSources = v5->_fundingSources;
    v5->_fundingSources = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recoveryPaymentPlans"];
    creditRecoveryPaymentPlans = v5->_creditRecoveryPaymentPlans;
    v5->_creditRecoveryPaymentPlans = (NSString *)v28;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  account = self->_account;
  id v5 = a3;
  [v5 encodeObject:account forKey:@"account"];
  [v5 encodeObject:self->_extendedAccount forKey:@"extendedAccount"];
  [v5 encodeObject:self->_payments forKey:@"payments"];
  [v5 encodeObject:self->_users forKey:@"users"];
  [v5 encodeObject:self->_sharedAccountCloudStore forKey:@"sharedAccountCloudStore"];
  [v5 encodeObject:self->_applications forKey:@"applications"];
  [v5 encodeObject:self->_financingPlans forKey:@"financingPlans"];
  [v5 encodeObject:self->_physicalCards forKey:@"physicalCards"];
  [v5 encodeObject:self->_virtualCards forKey:@"virtualCards"];
  [v5 encodeObject:self->_servicingToken forKey:@"servicingToken"];
  [v5 encodeObject:self->_fundingSources forKey:@"fundingSources"];
  [v5 encodeObject:self->_creditRecoveryPaymentPlans forKey:@"recoveryPaymentPlans"];
}

- (NSString)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)extendedAccount
{
  return self->_extendedAccount;
}

- (void)setExtendedAccount:(id)a3
{
}

- (NSString)payments
{
  return self->_payments;
}

- (void)setPayments:(id)a3
{
}

- (NSString)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
}

- (NSString)sharedAccountCloudStore
{
  return self->_sharedAccountCloudStore;
}

- (void)setSharedAccountCloudStore:(id)a3
{
}

- (NSString)applications
{
  return self->_applications;
}

- (void)setApplications:(id)a3
{
}

- (NSString)financingPlans
{
  return self->_financingPlans;
}

- (void)setFinancingPlans:(id)a3
{
}

- (NSString)physicalCards
{
  return self->_physicalCards;
}

- (void)setPhysicalCards:(id)a3
{
}

- (NSString)virtualCards
{
  return self->_virtualCards;
}

- (void)setVirtualCards:(id)a3
{
}

- (NSString)servicingToken
{
  return self->_servicingToken;
}

- (void)setServicingToken:(id)a3
{
}

- (NSString)fundingSources
{
  return self->_fundingSources;
}

- (void)setFundingSources:(id)a3
{
}

- (NSString)creditRecoveryPaymentPlans
{
  return self->_creditRecoveryPaymentPlans;
}

- (void)setCreditRecoveryPaymentPlans:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creditRecoveryPaymentPlans, 0);
  objc_storeStrong((id *)&self->_fundingSources, 0);
  objc_storeStrong((id *)&self->_servicingToken, 0);
  objc_storeStrong((id *)&self->_virtualCards, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
  objc_storeStrong((id *)&self->_financingPlans, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_sharedAccountCloudStore, 0);
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_payments, 0);
  objc_storeStrong((id *)&self->_extendedAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end