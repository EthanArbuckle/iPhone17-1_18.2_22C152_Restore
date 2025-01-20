@interface PKPaymentTransactionGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNContact)userContact;
- (NSArray)groups;
- (NSArray)regions;
- (NSArray)transactionTypes;
- (NSArray)transactions;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSSet)handles;
- (NSString)bankConnectSectionIdentifier;
- (NSString)identifier;
- (NSString)userDisplayName;
- (PKAccountUser)accountUser;
- (PKCurrencyAmount)totalAmount;
- (PKFamilyMember)familyMember;
- (PKMerchant)merchant;
- (PKPaymentTransactionGroup)initWithCoder:(id)a3;
- (PKPaymentTransactionTag)tag;
- (PKSearchQuery)searchQuery;
- (PKSpendingInsightTrend)trend;
- (id)description;
- (int64_t)merchantCategory;
- (unint64_t)hash;
- (unint64_t)secondaryGroupCount;
- (unint64_t)secondaryType;
- (unint64_t)transactionCount;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountUser:(id)a3;
- (void)setBankConnectSectionIdentifier:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setFamilyMember:(id)a3;
- (void)setGroups:(id)a3;
- (void)setHandles:(id)a3;
- (void)setMerchant:(id)a3;
- (void)setMerchantCategory:(int64_t)a3;
- (void)setRegions:(id)a3;
- (void)setSearchQuery:(id)a3;
- (void)setSecondaryGroupCount:(unint64_t)a3;
- (void)setSecondaryType:(unint64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setTag:(id)a3;
- (void)setTotalAmount:(id)a3;
- (void)setTransactionCount:(unint64_t)a3;
- (void)setTransactionTypes:(id)a3;
- (void)setTransactions:(id)a3;
- (void)setTrend:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPaymentTransactionGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PKPaymentTransactionGroup;
  v5 = [(PKPaymentTransactionGroup *)&v50 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    v5->_secondaryType = [v4 decodeIntegerForKey:@"secondaryType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;

    v5->_merchantCategory = [v4 decodeIntegerForKey:@"merchantCategory"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchant"];
    merchant = v5->_merchant;
    v5->_merchant = (PKMerchant *)v10;

    v5->_transactionCount = [v4 decodeIntegerForKey:@"transactionCount"];
    v5->_secondaryGroupCount = [v4 decodeIntegerForKey:@"secondaryGroupCount"];
    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"handles"];
    handles = v5->_handles;
    v5->_handles = (NSSet *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountUser"];
    accountUser = v5->_accountUser;
    v5->_accountUser = (PKAccountUser *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"familyMember"];
    familyMember = v5->_familyMember;
    v5->_familyMember = (PKFamilyMember *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"regions"];
    regions = v5->_regions;
    v5->_regions = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"amount"];
    totalAmount = v5->_totalAmount;
    v5->_totalAmount = (PKCurrencyAmount *)v26;

    v28 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"transactions"];
    transactions = v5->_transactions;
    v5->_transactions = (NSArray *)v31;

    v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"groups"];
    groups = v5->_groups;
    v5->_groups = (NSArray *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchQuery"];
    searchQuery = v5->_searchQuery;
    v5->_searchQuery = (PKSearchQuery *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tag"];
    tag = v5->_tag;
    v5->_tag = (PKPaymentTransactionTag *)v40;

    v42 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v43 = objc_opt_class();
    v44 = objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
    uint64_t v45 = [v4 decodeObjectOfClasses:v44 forKey:@"transactionTypes"];
    transactionTypes = v5->_transactionTypes;
    v5->_transactionTypes = (NSArray *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bankConnectSectionIdentifier"];
    bankConnectSectionIdentifier = v5->_bankConnectSectionIdentifier;
    v5->_bankConnectSectionIdentifier = (NSString *)v47;

    v5->_trend = (PKSpendingInsightTrend *)(id)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"trend"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeInteger:self->_secondaryType forKey:@"secondaryType"];
  [v5 encodeInteger:self->_secondaryGroupCount forKey:@"secondaryGroupCount"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeInteger:self->_merchantCategory forKey:@"merchantCategory"];
  [v5 encodeObject:self->_merchant forKey:@"merchant"];
  [v5 encodeInteger:self->_transactionCount forKey:@"transactionCount"];
  [v5 encodeObject:self->_totalAmount forKey:@"amount"];
  [v5 encodeObject:self->_transactions forKey:@"transactions"];
  [v5 encodeObject:self->_groups forKey:@"groups"];
  [v5 encodeObject:self->_handles forKey:@"handles"];
  [v5 encodeObject:self->_accountUser forKey:@"accountUser"];
  [v5 encodeObject:self->_familyMember forKey:@"familyMember"];
  [v5 encodeObject:self->_regions forKey:@"regions"];
  [v5 encodeObject:self->_searchQuery forKey:@"searchQuery"];
  [v5 encodeObject:self->_tag forKey:@"tag"];
  [v5 encodeObject:self->_transactionTypes forKey:@"transactionTypes"];
  [v5 encodeObject:self->_bankConnectSectionIdentifier forKey:@"bankConnectSectionIdentifier"];
  [v5 encodeObject:self->_trend forKey:@"trend"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_74;
  }
  startDate = self->_startDate;
  uint64_t v6 = (NSDate *)v4[2];
  if (startDate && v6)
  {
    if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0) {
      goto LABEL_74;
    }
  }
  else if (startDate != v6)
  {
    goto LABEL_74;
  }
  endDate = self->_endDate;
  uint64_t v8 = (NSDate *)v4[3];
  if (endDate && v8)
  {
    if ((-[NSDate isEqual:](endDate, "isEqual:") & 1) == 0) {
      goto LABEL_74;
    }
  }
  else if (endDate != v8)
  {
    goto LABEL_74;
  }
  totalAmount = self->_totalAmount;
  uint64_t v10 = (PKCurrencyAmount *)v4[14];
  if (totalAmount && v10)
  {
    if (!-[PKCurrencyAmount isEqual:](totalAmount, "isEqual:")) {
      goto LABEL_74;
    }
  }
  else if (totalAmount != v10)
  {
    goto LABEL_74;
  }
  merchant = self->_merchant;
  v12 = (PKMerchant *)v4[7];
  if (merchant && v12)
  {
    if (!-[PKMerchant isEqual:](merchant, "isEqual:")) {
      goto LABEL_74;
    }
  }
  else if (merchant != v12)
  {
    goto LABEL_74;
  }
  handles = self->_handles;
  v14 = (NSSet *)v4[8];
  if (handles && v14)
  {
    if ((-[NSSet isEqual:](handles, "isEqual:") & 1) == 0) {
      goto LABEL_74;
    }
  }
  else if (handles != v14)
  {
    goto LABEL_74;
  }
  accountUser = self->_accountUser;
  v16 = (PKAccountUser *)v4[11];
  if (accountUser && v16)
  {
    if (!-[PKAccountUser isEqual:](accountUser, "isEqual:")) {
      goto LABEL_74;
    }
  }
  else if (accountUser != v16)
  {
    goto LABEL_74;
  }
  familyMember = self->_familyMember;
  v18 = (PKFamilyMember *)v4[12];
  if (familyMember && v18)
  {
    if (!-[PKFamilyMember isEqual:](familyMember, "isEqual:")) {
      goto LABEL_74;
    }
  }
  else if (familyMember != v18)
  {
    goto LABEL_74;
  }
  regions = self->_regions;
  v20 = (NSArray *)v4[9];
  if (regions && v20)
  {
    if ((-[NSArray isEqual:](regions, "isEqual:") & 1) == 0) {
      goto LABEL_74;
    }
  }
  else if (regions != v20)
  {
    goto LABEL_74;
  }
  searchQuery = self->_searchQuery;
  uint64_t v22 = (PKSearchQuery *)v4[10];
  if (searchQuery && v22)
  {
    if (!-[PKSearchQuery isEqual:](searchQuery, "isEqual:")) {
      goto LABEL_74;
    }
  }
  else if (searchQuery != v22)
  {
    goto LABEL_74;
  }
  if (self->_merchantCategory != v4[4]
    || self->_type != v4[1]
    || self->_secondaryType != v4[18]
    || self->_transactionCount != v4[13]
    || self->_secondaryGroupCount != v4[19])
  {
    goto LABEL_74;
  }
  groups = self->_groups;
  uint64_t v24 = (NSArray *)v4[16];
  if (groups && v24)
  {
    if ((-[NSArray isEqual:](groups, "isEqual:") & 1) == 0) {
      goto LABEL_74;
    }
  }
  else if (groups != v24)
  {
    goto LABEL_74;
  }
  tag = self->_tag;
  uint64_t v26 = (PKPaymentTransactionTag *)v4[6];
  if (tag && v26)
  {
    if (!-[PKPaymentTransactionTag isEqual:](tag, "isEqual:")) {
      goto LABEL_74;
    }
  }
  else if (tag != v26)
  {
    goto LABEL_74;
  }
  bankConnectSectionIdentifier = self->_bankConnectSectionIdentifier;
  v28 = (NSString *)v4[20];
  if (bankConnectSectionIdentifier && v28)
  {
    if ((-[NSString isEqual:](bankConnectSectionIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_74;
    }
  }
  else if (bankConnectSectionIdentifier != v28)
  {
    goto LABEL_74;
  }
  transactionTypes = self->_transactionTypes;
  v30 = (NSArray *)v4[17];
  if (!transactionTypes || !v30)
  {
    if (transactionTypes == v30) {
      goto LABEL_70;
    }
LABEL_74:
    BOOL v33 = 0;
    goto LABEL_75;
  }
  if ((-[NSArray isEqual:](transactionTypes, "isEqual:") & 1) == 0) {
    goto LABEL_74;
  }
LABEL_70:
  trend = self->_trend;
  v32 = (PKSpendingInsightTrend *)v4[5];
  if (trend && v32) {
    BOOL v33 = -[PKSpendingInsightTrend isEqual:](trend, "isEqual:");
  }
  else {
    BOOL v33 = trend == v32;
  }
LABEL_75:

  return v33;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_startDate];
  [v3 safelyAddObject:self->_endDate];
  [v3 safelyAddObject:self->_totalAmount];
  [v3 safelyAddObject:self->_merchant];
  [v3 safelyAddObject:self->_handles];
  [v3 safelyAddObject:self->_accountUser];
  [v3 safelyAddObject:self->_familyMember];
  [v3 safelyAddObject:self->_regions];
  [v3 safelyAddObject:self->_searchQuery];
  [v3 safelyAddObject:self->_tag];
  [v3 safelyAddObject:self->_groups];
  [v3 safelyAddObject:self->_transactionTypes];
  [v3 safelyAddObject:self->_bankConnectSectionIdentifier];
  [v3 safelyAddObject:self->_trend];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_merchantCategory - v4 + 32 * v4;
  unint64_t v6 = self->_type - v5 + 32 * v5;
  unint64_t v7 = self->_secondaryType - v6 + 32 * v6;
  unint64_t v8 = self->_transactionCount - v7 + 32 * v7;
  unint64_t v9 = self->_secondaryGroupCount - v8 + 32 * v8;

  return v9;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"type: %ld; ", self->_type);
  objc_msgSend(v3, "appendFormat:", @"secondaryType: %ld; ", self->_secondaryType);
  objc_msgSend(v3, "appendFormat:", @"secondaryCount: '%ld'; ", self->_secondaryGroupCount);
  uint64_t v4 = [(NSDate *)self->_startDate description];
  [v3 appendFormat:@"startDate: '%@'; ", v4];

  int64_t v5 = [(NSDate *)self->_endDate description];
  [v3 appendFormat:@"endDate: '%@'; ", v5];

  unint64_t v6 = [(PKCurrencyAmount *)self->_totalAmount description];
  [v3 appendFormat:@"totalAmount: '%@'; ", v6];

  objc_msgSend(v3, "appendFormat:", @"count: '%ld'; ", self->_transactionCount);
  [v3 appendFormat:@"transactions: '%@'; ", self->_transactions];
  [v3 appendFormat:@"groups: '%@'; ", self->_groups];
  [v3 appendFormat:@"handles: '%@'; ", self->_handles];
  [v3 appendFormat:@"regions: '%@'; ", self->_regions];
  [v3 appendFormat:@"tag: '%@'; ", self->_tag];
  [v3 appendFormat:@"transactionTypes: %@; ", self->_transactionTypes];
  [v3 appendFormat:@"bankConnectSectionIdentifier: %@; ", self->_bankConnectSectionIdentifier];
  unint64_t v7 = PKMerchantCategoryToString(self->_merchantCategory);
  [v3 appendFormat:@"merchantCategory: %@;", v7];

  [v3 appendFormat:@"trend: %@;", self->_trend];
  [v3 appendFormat:@">"];
  return v3;
}

- (CNContact)userContact
{
  familyMember = self->_familyMember;
  id v3 = [(PKAccountUser *)self->_accountUser nameComponents];
  uint64_t v4 = +[PKContactResolver contactForFamilyMember:familyMember nameComponents:v3 imageData:0];

  return (CNContact *)v4;
}

- (NSString)userDisplayName
{
  v2 = (void *)MEMORY[0x1E4F1B910];
  id v3 = [(PKPaymentTransactionGroup *)self userContact];
  uint64_t v4 = [v2 stringFromContact:v3 style:0];

  return (NSString *)v4;
}

- (NSString)identifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_startDate];
  [v3 safelyAddObject:self->_endDate];
  [v3 safelyAddObject:self->_merchant];
  [v3 safelyAddObject:self->_handles];
  [v3 safelyAddObject:self->_accountUser];
  [v3 safelyAddObject:self->_familyMember];
  [v3 safelyAddObject:self->_regions];
  [v3 safelyAddObject:self->_searchQuery];
  [v3 safelyAddObject:self->_tag];
  [v3 safelyAddObject:self->_transactionTypes];
  [v3 safelyAddObject:self->_bankConnectSectionIdentifier];
  [v3 safelyAddObject:self->_trend];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_merchantCategory - v4 + 32 * v4;
  unint64_t v6 = self->_type - v5 + 32 * v5;
  unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_secondaryType - v6 + 32 * v6);

  return (NSString *)v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (int64_t)merchantCategory
{
  return self->_merchantCategory;
}

- (void)setMerchantCategory:(int64_t)a3
{
  self->_merchantCategory = a3;
}

- (PKSpendingInsightTrend)trend
{
  return self->_trend;
}

- (void)setTrend:(id)a3
{
  self->_trend = (PKSpendingInsightTrend *)a3;
}

- (PKPaymentTransactionTag)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
}

- (PKMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
}

- (NSSet)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
}

- (NSArray)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
}

- (PKSearchQuery)searchQuery
{
  return self->_searchQuery;
}

- (void)setSearchQuery:(id)a3
{
}

- (PKAccountUser)accountUser
{
  return self->_accountUser;
}

- (void)setAccountUser:(id)a3
{
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
}

- (unint64_t)transactionCount
{
  return self->_transactionCount;
}

- (void)setTransactionCount:(unint64_t)a3
{
  self->_transactionCount = a3;
}

- (PKCurrencyAmount)totalAmount
{
  return self->_totalAmount;
}

- (void)setTotalAmount:(id)a3
{
}

- (NSArray)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
}

- (NSArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
}

- (NSArray)transactionTypes
{
  return self->_transactionTypes;
}

- (void)setTransactionTypes:(id)a3
{
}

- (unint64_t)secondaryType
{
  return self->_secondaryType;
}

- (void)setSecondaryType:(unint64_t)a3
{
  self->_secondaryType = a3;
}

- (unint64_t)secondaryGroupCount
{
  return self->_secondaryGroupCount;
}

- (void)setSecondaryGroupCount:(unint64_t)a3
{
  self->_secondaryGroupCount = a3;
}

- (NSString)bankConnectSectionIdentifier
{
  return self->_bankConnectSectionIdentifier;
}

- (void)setBankConnectSectionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bankConnectSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_transactionTypes, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_totalAmount, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_accountUser, 0);
  objc_storeStrong((id *)&self->_searchQuery, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end