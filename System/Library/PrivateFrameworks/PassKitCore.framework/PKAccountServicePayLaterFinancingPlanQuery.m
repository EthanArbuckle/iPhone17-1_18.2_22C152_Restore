@interface PKAccountServicePayLaterFinancingPlanQuery
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForQueryItems:(unint64_t)a3;
- (BOOL)_isEqualToFinancingPlanQuery:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)countFinancingPlanStates;
- (NSArray)relevantFinancingPlanStates;
- (NSDate)installmentDueOrPaidDateEnd;
- (NSDate)installmentDueOrPaidDateStart;
- (NSDate)transactionEndDate;
- (NSDate)transactionStartDate;
- (NSString)accountIdentifier;
- (NSString)queryIdentifier;
- (PKAccountServicePayLaterFinancingPlanQuery)initWithAccountIdentifier:(id)a3 queryItems:(unint64_t)a4;
- (PKAccountServicePayLaterFinancingPlanQuery)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)upcomingInstallmentsLimit;
- (unint64_t)hash;
- (unint64_t)queryItems;
- (void)encodeWithCoder:(id)a3;
- (void)setCountFinancingPlanStates:(id)a3;
- (void)setInstallmentDueOrPaidDateEnd:(id)a3;
- (void)setInstallmentDueOrPaidDateStart:(id)a3;
- (void)setRelevantFinancingPlanStates:(id)a3;
- (void)setTransactionEndDate:(id)a3;
- (void)setTransactionStartDate:(id)a3;
- (void)setUpcomingInstallmentsLimit:(int64_t)a3;
@end

@implementation PKAccountServicePayLaterFinancingPlanQuery

- (PKAccountServicePayLaterFinancingPlanQuery)initWithAccountIdentifier:(id)a3 queryItems:(unint64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAccountServicePayLaterFinancingPlanQuery;
  v8 = [(PKAccountServicePayLaterFinancingPlanQuery *)&v13 init];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v10 = [v9 UUIDString];
    queryIdentifier = v8->_queryIdentifier;
    v8->_queryIdentifier = (NSString *)v10;

    objc_storeStrong((id *)&v8->_accountIdentifier, a3);
    v8->_queryItems = a4;
  }

  return v8;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_queryIdentifier forKeyedSubscript:@"queryIdentifier"];
  [v3 setObject:self->_accountIdentifier forKeyedSubscript:@"accountIdentifier"];
  v4 = [(id)objc_opt_class() descriptionForQueryItems:self->_queryItems];
  [v3 setObject:v4 forKeyedSubscript:@"queryItems"];

  transactionStartDate = self->_transactionStartDate;
  if (transactionStartDate)
  {
    v6 = PKMediumDateString(transactionStartDate);
    [v3 setObject:v6 forKeyedSubscript:@"transactionStartDate"];
  }
  transactionEndDate = self->_transactionEndDate;
  if (transactionEndDate)
  {
    v8 = PKMediumDateString(transactionEndDate);
    [v3 setObject:v8 forKeyedSubscript:@"transactionEndDate"];
  }
  installmentDueOrPaidDateStart = self->_installmentDueOrPaidDateStart;
  if (installmentDueOrPaidDateStart)
  {
    uint64_t v10 = PKMediumDateString(installmentDueOrPaidDateStart);
    [v3 setObject:v10 forKeyedSubscript:@"installmentDueOrPaidDateStart"];
  }
  installmentDueOrPaidDateEnd = self->_installmentDueOrPaidDateEnd;
  if (installmentDueOrPaidDateEnd)
  {
    v12 = PKMediumDateString(installmentDueOrPaidDateEnd);
    [v3 setObject:v12 forKeyedSubscript:@"installmentDueOrPaidDateEnd"];
  }
  if (self->_upcomingInstallmentsLimit >= 1)
  {
    objc_super v13 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 setObject:v13 forKeyedSubscript:@"upcomingInstallmentsLimit"];
  }
  if ([(NSArray *)self->_relevantFinancingPlanStates count]) {
    [v3 setObject:self->_relevantFinancingPlanStates forKeyedSubscript:@"relevantFinancingPlanStates"];
  }
  if ([(NSArray *)self->_countFinancingPlanStates count]) {
    [v3 setObject:self->_countFinancingPlanStates forKeyedSubscript:@"countFinancingPlanStates"];
  }
  v14 = (void *)[v3 copy];

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountServicePayLaterFinancingPlanQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKAccountServicePayLaterFinancingPlanQuery;
  v5 = [(PKAccountServicePayLaterFinancingPlanQuery *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queryIdentifier"];
    queryIdentifier = v5->_queryIdentifier;
    v5->_queryIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    v5->_queryItems = [v4 decodeIntegerForKey:@"queryItems"];
    v5->_upcomingInstallmentsLimit = [v4 decodeIntegerForKey:@"upcomingInstallmentsLimit"];
    uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"relevantFinancingPlanStates"];
    relevantFinancingPlanStates = v5->_relevantFinancingPlanStates;
    v5->_relevantFinancingPlanStates = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"countFinancingPlanStates"];
    countFinancingPlanStates = v5->_countFinancingPlanStates;
    v5->_countFinancingPlanStates = (NSArray *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionStartDate"];
    transactionStartDate = v5->_transactionStartDate;
    v5->_transactionStartDate = (NSDate *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionEndDate"];
    transactionEndDate = v5->_transactionEndDate;
    v5->_transactionEndDate = (NSDate *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentDueOrPaidDateStart"];
    installmentDueOrPaidDateStart = v5->_installmentDueOrPaidDateStart;
    v5->_installmentDueOrPaidDateStart = (NSDate *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installmentDueOrPaidDateEnd"];
    installmentDueOrPaidDateEnd = v5->_installmentDueOrPaidDateEnd;
    v5->_installmentDueOrPaidDateEnd = (NSDate *)v26;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  queryIdentifier = self->_queryIdentifier;
  id v5 = a3;
  [v5 encodeObject:queryIdentifier forKey:@"queryIdentifier"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v5 encodeInteger:self->_queryItems forKey:@"queryItems"];
  [v5 encodeInteger:self->_upcomingInstallmentsLimit forKey:@"upcomingInstallmentsLimit"];
  [v5 encodeObject:self->_relevantFinancingPlanStates forKey:@"relevantFinancingPlanStates"];
  [v5 encodeObject:self->_countFinancingPlanStates forKey:@"countFinancingPlanStates"];
  [v5 encodeObject:self->_transactionStartDate forKey:@"transactionStartDate"];
  [v5 encodeObject:self->_transactionEndDate forKey:@"transactionEndDate"];
  [v5 encodeObject:self->_installmentDueOrPaidDateStart forKey:@"installmentDueOrPaidDateStart"];
  [v5 encodeObject:self->_installmentDueOrPaidDateEnd forKey:@"installmentDueOrPaidDateEnd"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKAccountServicePayLaterFinancingPlanQuery allocWithZone:](PKAccountServicePayLaterFinancingPlanQuery, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_queryIdentifier copyWithZone:a3];
  queryIdentifier = v5->_queryIdentifier;
  v5->_queryIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v8;

  v5->_queryItems = self->_queryItems;
  v5->_upcomingInstallmentsLimit = self->_upcomingInstallmentsLimit;
  uint64_t v10 = [(NSArray *)self->_relevantFinancingPlanStates copyWithZone:a3];
  relevantFinancingPlanStates = v5->_relevantFinancingPlanStates;
  v5->_relevantFinancingPlanStates = (NSArray *)v10;

  uint64_t v12 = [(NSArray *)self->_countFinancingPlanStates copyWithZone:a3];
  countFinancingPlanStates = v5->_countFinancingPlanStates;
  v5->_countFinancingPlanStates = (NSArray *)v12;

  uint64_t v14 = [(NSDate *)self->_transactionStartDate copyWithZone:a3];
  transactionStartDate = v5->_transactionStartDate;
  v5->_transactionStartDate = (NSDate *)v14;

  uint64_t v16 = [(NSDate *)self->_transactionEndDate copyWithZone:a3];
  transactionEndDate = v5->_transactionEndDate;
  v5->_transactionEndDate = (NSDate *)v16;

  uint64_t v18 = [(NSDate *)self->_installmentDueOrPaidDateStart copyWithZone:a3];
  installmentDueOrPaidDateStart = v5->_installmentDueOrPaidDateStart;
  v5->_installmentDueOrPaidDateStart = (NSDate *)v18;

  uint64_t v20 = [(NSDate *)self->_installmentDueOrPaidDateEnd copyWithZone:a3];
  installmentDueOrPaidDateEnd = v5->_installmentDueOrPaidDateEnd;
  v5->_installmentDueOrPaidDateEnd = (NSDate *)v20;

  return v5;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"queryIdentifier: '%@'; ", self->_queryIdentifier];
  [v6 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  id v7 = [(id)objc_opt_class() descriptionForQueryItems:self->_queryItems];
  [v6 appendFormat:@"queryItems: '%@'; ", v7];

  objc_msgSend(v6, "appendFormat:", @"upcomingInstallmentsLimit: '%ld'; ", self->_upcomingInstallmentsLimit);
  [v6 appendFormat:@"relevantFinancingPlanStates: '%@'; ", self->_relevantFinancingPlanStates];
  [v6 appendFormat:@"countFinancingPlanStates: '%@'; ", self->_countFinancingPlanStates];
  [v6 appendFormat:@"transactionStartDate: '%@'; ", self->_transactionStartDate];
  [v6 appendFormat:@"transactionEndDate: '%@'; ", self->_transactionEndDate];
  objc_msgSend(v6, "appendFormat:", @"installmentDueOrPaidDateStart: '%@'; ",
    self->_installmentDueOrPaidDateStart);
  [v6 appendFormat:@"installmentDueOrPaidDateEnd: '%@'; ", self->_installmentDueOrPaidDateEnd];
  [v6 appendFormat:@">"];
  uint64_t v8 = [NSString stringWithString:v6];

  return v8;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_queryIdentifier];
  [v3 safelyAddObject:self->_accountIdentifier];
  [v3 safelyAddObject:self->_relevantFinancingPlanStates];
  [v3 safelyAddObject:self->_countFinancingPlanStates];
  [v3 safelyAddObject:self->_transactionStartDate];
  [v3 safelyAddObject:self->_transactionEndDate];
  [v3 safelyAddObject:self->_installmentDueOrPaidDateStart];
  [v3 safelyAddObject:self->_installmentDueOrPaidDateEnd];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_queryItems - v4 + 32 * v4;
  unint64_t v6 = self->_upcomingInstallmentsLimit - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKAccountServicePayLaterFinancingPlanQuery *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountServicePayLaterFinancingPlanQuery *)self _isEqualToFinancingPlanQuery:v5];

  return v6;
}

- (BOOL)_isEqualToFinancingPlanQuery:(id)a3
{
  uint64_t v4 = a3;
  unint64_t v5 = v4;
  if (!v4) {
    goto LABEL_14;
  }
  BOOL v6 = (void *)v4[1];
  id v7 = self->_queryIdentifier;
  uint64_t v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    if (!v7 || !v8) {
      goto LABEL_13;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_14;
    }
  }
  uint64_t v11 = (void *)v5[2];
  id v7 = self->_accountIdentifier;
  uint64_t v12 = v11;
  if (v7 != v12)
  {
    v9 = v12;
    if (v7 && v12)
    {
      BOOL v13 = [(NSString *)v7 isEqualToString:v12];

      if (!v13) {
        goto LABEL_14;
      }
      goto LABEL_17;
    }
LABEL_13:

    goto LABEL_14;
  }

LABEL_17:
  relevantFinancingPlanStates = self->_relevantFinancingPlanStates;
  v17 = (NSArray *)v5[5];
  if (relevantFinancingPlanStates && v17)
  {
    if ((-[NSArray isEqual:](relevantFinancingPlanStates, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (relevantFinancingPlanStates != v17)
  {
    goto LABEL_14;
  }
  countFinancingPlanStates = self->_countFinancingPlanStates;
  v19 = (NSArray *)v5[6];
  if (countFinancingPlanStates && v19)
  {
    if ((-[NSArray isEqual:](countFinancingPlanStates, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (countFinancingPlanStates != v19)
  {
    goto LABEL_14;
  }
  transactionStartDate = self->_transactionStartDate;
  v21 = (NSDate *)v5[7];
  if (transactionStartDate && v21)
  {
    if ((-[NSDate isEqual:](transactionStartDate, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (transactionStartDate != v21)
  {
    goto LABEL_14;
  }
  transactionEndDate = self->_transactionEndDate;
  v23 = (NSDate *)v5[8];
  if (transactionEndDate && v23)
  {
    if ((-[NSDate isEqual:](transactionEndDate, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (transactionEndDate != v23)
  {
    goto LABEL_14;
  }
  installmentDueOrPaidDateStart = self->_installmentDueOrPaidDateStart;
  v25 = (NSDate *)v5[9];
  if (installmentDueOrPaidDateStart && v25)
  {
    if ((-[NSDate isEqual:](installmentDueOrPaidDateStart, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (installmentDueOrPaidDateStart != v25)
  {
    goto LABEL_14;
  }
  installmentDueOrPaidDateEnd = self->_installmentDueOrPaidDateEnd;
  v27 = (NSDate *)v5[10];
  if (installmentDueOrPaidDateEnd && v27)
  {
    if ((-[NSDate isEqual:](installmentDueOrPaidDateEnd, "isEqual:") & 1) == 0) {
      goto LABEL_14;
    }
  }
  else if (installmentDueOrPaidDateEnd != v27)
  {
    goto LABEL_14;
  }
  if (self->_queryItems == v5[3])
  {
    BOOL v14 = self->_upcomingInstallmentsLimit == v5[4];
    goto LABEL_15;
  }
LABEL_14:
  BOOL v14 = 0;
LABEL_15:

  return v14;
}

+ (id)descriptionForQueryItems:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a3)
  {
    int v5 = 1;
    int64_t v6 = 1;
    do
    {
      if ((v6 & a3) != 0)
      {
        if (v6 <= 15)
        {
          id v7 = @"None";
          switch(v6)
          {
            case 0:
              goto LABEL_19;
            case 1:
              id v7 = @"DueNext30Days";
              goto LABEL_19;
            case 2:
              id v7 = @"TotalPendingAmount";
              goto LABEL_19;
            case 4:
              id v7 = @"UpcomingInstallments";
              goto LABEL_19;
            case 8:
              id v7 = @"CompletedFinancingPlans";
              goto LABEL_19;
            default:
              goto LABEL_20;
          }
          goto LABEL_20;
        }
        if (v6 > 63)
        {
          if (v6 == 64)
          {
            id v7 = @"FinancingPlanCount";
            goto LABEL_19;
          }
          if (v6 == 127)
          {
            id v7 = @"All";
            goto LABEL_19;
          }
        }
        else
        {
          if (v6 == 16)
          {
            id v7 = @"ActiveFinancingPlans";
            goto LABEL_19;
          }
          if (v6 == 32)
          {
            id v7 = @"RelevantFinancingPlans";
LABEL_19:
            [v4 addObject:v7];
          }
        }
      }
LABEL_20:
      int64_t v6 = 1 << v5++;
    }
    while (v6 <= a3);
  }
  uint64_t v8 = [v4 description];

  return v8;
}

- (NSString)queryIdentifier
{
  return self->_queryIdentifier;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (unint64_t)queryItems
{
  return self->_queryItems;
}

- (int64_t)upcomingInstallmentsLimit
{
  return self->_upcomingInstallmentsLimit;
}

- (void)setUpcomingInstallmentsLimit:(int64_t)a3
{
  self->_upcomingInstallmentsLimit = a3;
}

- (NSArray)relevantFinancingPlanStates
{
  return self->_relevantFinancingPlanStates;
}

- (void)setRelevantFinancingPlanStates:(id)a3
{
}

- (NSArray)countFinancingPlanStates
{
  return self->_countFinancingPlanStates;
}

- (void)setCountFinancingPlanStates:(id)a3
{
}

- (NSDate)transactionStartDate
{
  return self->_transactionStartDate;
}

- (void)setTransactionStartDate:(id)a3
{
}

- (NSDate)transactionEndDate
{
  return self->_transactionEndDate;
}

- (void)setTransactionEndDate:(id)a3
{
}

- (NSDate)installmentDueOrPaidDateStart
{
  return self->_installmentDueOrPaidDateStart;
}

- (void)setInstallmentDueOrPaidDateStart:(id)a3
{
}

- (NSDate)installmentDueOrPaidDateEnd
{
  return self->_installmentDueOrPaidDateEnd;
}

- (void)setInstallmentDueOrPaidDateEnd:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installmentDueOrPaidDateEnd, 0);
  objc_storeStrong((id *)&self->_installmentDueOrPaidDateStart, 0);
  objc_storeStrong((id *)&self->_transactionEndDate, 0);
  objc_storeStrong((id *)&self->_transactionStartDate, 0);
  objc_storeStrong((id *)&self->_countFinancingPlanStates, 0);
  objc_storeStrong((id *)&self->_relevantFinancingPlanStates, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_queryIdentifier, 0);
}

@end