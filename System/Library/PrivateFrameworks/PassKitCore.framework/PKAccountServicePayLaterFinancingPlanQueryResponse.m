@interface PKAccountServicePayLaterFinancingPlanQueryResponse
+ (BOOL)supportsSecureCoding;
+ (id)_financingPlanIdentifierFromList:(id)a3;
- (BOOL)_isEqualToFinancingPlanQueryResponse:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)activeFinancingPlans;
- (NSArray)completedFinancingPlans;
- (NSArray)relevantFinancingPlans;
- (PKAccountServicePayLaterFinancingPlanQueryInstallments)upcomingInstallments;
- (PKAccountServicePayLaterFinancingPlanQueryResponse)initWithCoder:(id)a3;
- (PKCurrencyAmount)dueNext30Days;
- (PKCurrencyAmount)totalPendingAmount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)financingPlanCount;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveFinancingPlans:(id)a3;
- (void)setCompletedFinancingPlans:(id)a3;
- (void)setDueNext30Days:(id)a3;
- (void)setFinancingPlanCount:(int64_t)a3;
- (void)setRelevantFinancingPlans:(id)a3;
- (void)setTotalPendingAmount:(id)a3;
- (void)setUpcomingInstallments:(id)a3;
@end

@implementation PKAccountServicePayLaterFinancingPlanQueryResponse

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(PKCurrencyAmount *)self->_dueNext30Days dictionaryRepresentation];
  [v3 setObject:v4 forKeyedSubscript:@"dueNext30Days"];

  v5 = [(PKCurrencyAmount *)self->_totalPendingAmount dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"totalPendingAmount"];

  if (self->_financingPlanCount >= 1)
  {
    v6 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v3 setObject:v6 forKeyedSubscript:@"financingPlanCount"];
  }
  v7 = [(PKAccountServicePayLaterFinancingPlanQueryInstallments *)self->_upcomingInstallments dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"upcomingInstallments"];

  if ([(NSArray *)self->_completedFinancingPlans count])
  {
    v8 = [(id)objc_opt_class() _financingPlanIdentifierFromList:self->_completedFinancingPlans];
    [v3 setObject:v8 forKeyedSubscript:@"completedFinancingPlans"];
  }
  if ([(NSArray *)self->_activeFinancingPlans count])
  {
    v9 = [(id)objc_opt_class() _financingPlanIdentifierFromList:self->_activeFinancingPlans];
    [v3 setObject:v9 forKeyedSubscript:@"activeFinancingPlans"];
  }
  if ([(NSArray *)self->_relevantFinancingPlans count])
  {
    v10 = [(id)objc_opt_class() _financingPlanIdentifierFromList:self->_relevantFinancingPlans];
    [v3 setObject:v10 forKeyedSubscript:@"relevantFinancingPlans"];
  }
  v11 = (void *)[v3 copy];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountServicePayLaterFinancingPlanQueryResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)PKAccountServicePayLaterFinancingPlanQueryResponse;
  v5 = [(PKAccountServicePayLaterFinancingPlanQueryResponse *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dueNext30Days"];
    dueNext30Days = v5->_dueNext30Days;
    v5->_dueNext30Days = (PKCurrencyAmount *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalPendingAmount"];
    totalPendingAmount = v5->_totalPendingAmount;
    v5->_totalPendingAmount = (PKCurrencyAmount *)v8;

    v5->_financingPlanCount = [v4 decodeIntegerForKey:@"financingPlanCount"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"upcomingInstallments"];
    upcomingInstallments = v5->_upcomingInstallments;
    v5->_upcomingInstallments = (PKAccountServicePayLaterFinancingPlanQueryInstallments *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"completedFinancingPlans"];
    completedFinancingPlans = v5->_completedFinancingPlans;
    v5->_completedFinancingPlans = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"activeFinancingPlans"];
    activeFinancingPlans = v5->_activeFinancingPlans;
    v5->_activeFinancingPlans = (NSArray *)v20;

    v22 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"relevantFinancingPlans"];
    relevantFinancingPlans = v5->_relevantFinancingPlans;
    v5->_relevantFinancingPlans = (NSArray *)v25;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  dueNext30Days = self->_dueNext30Days;
  id v5 = a3;
  [v5 encodeObject:dueNext30Days forKey:@"dueNext30Days"];
  [v5 encodeObject:self->_totalPendingAmount forKey:@"totalPendingAmount"];
  [v5 encodeObject:self->_upcomingInstallments forKey:@"upcomingInstallments"];
  [v5 encodeObject:self->_completedFinancingPlans forKey:@"completedFinancingPlans"];
  [v5 encodeObject:self->_activeFinancingPlans forKey:@"activeFinancingPlans"];
  [v5 encodeObject:self->_relevantFinancingPlans forKey:@"relevantFinancingPlans"];
  [v5 encodeInteger:self->_financingPlanCount forKey:@"financingPlanCount"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKAccountServicePayLaterFinancingPlanQueryResponse allocWithZone:](PKAccountServicePayLaterFinancingPlanQueryResponse, "allocWithZone:") init];
  uint64_t v6 = [(PKCurrencyAmount *)self->_dueNext30Days copyWithZone:a3];
  dueNext30Days = v5->_dueNext30Days;
  v5->_dueNext30Days = v6;

  uint64_t v8 = [(PKCurrencyAmount *)self->_totalPendingAmount copyWithZone:a3];
  totalPendingAmount = v5->_totalPendingAmount;
  v5->_totalPendingAmount = v8;

  v5->_financingPlanCount = self->_financingPlanCount;
  uint64_t v10 = [(PKAccountServicePayLaterFinancingPlanQueryInstallments *)self->_upcomingInstallments copyWithZone:a3];
  upcomingInstallments = v5->_upcomingInstallments;
  v5->_upcomingInstallments = v10;

  uint64_t v12 = [(NSArray *)self->_completedFinancingPlans copyWithZone:a3];
  completedFinancingPlans = v5->_completedFinancingPlans;
  v5->_completedFinancingPlans = (NSArray *)v12;

  uint64_t v14 = [(NSArray *)self->_activeFinancingPlans copyWithZone:a3];
  activeFinancingPlans = v5->_activeFinancingPlans;
  v5->_activeFinancingPlans = (NSArray *)v14;

  uint64_t v16 = [(NSArray *)self->_relevantFinancingPlans copyWithZone:a3];
  relevantFinancingPlans = v5->_relevantFinancingPlans;
  v5->_relevantFinancingPlans = (NSArray *)v16;

  return v5;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"dueNext30Days: '%@'; ", self->_dueNext30Days];
  [v6 appendFormat:@"totalPendingAmount: '%@'; ", self->_totalPendingAmount];
  objc_msgSend(v6, "appendFormat:", @"financingPlanCount: '%ld'; ", self->_financingPlanCount);
  [v6 appendFormat:@"upcomingInstallments: '%@'; ", self->_upcomingInstallments];
  [v6 appendFormat:@"completedFinancingPlans: '%@'; ", self->_completedFinancingPlans];
  [v6 appendFormat:@"activeFinancingPlans: '%@'; ", self->_activeFinancingPlans];
  [v6 appendFormat:@"relevantFinancingPlans: '%@'; ", self->_relevantFinancingPlans];
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_dueNext30Days];
  [v3 safelyAddObject:self->_totalPendingAmount];
  [v3 safelyAddObject:self->_upcomingInstallments];
  [v3 safelyAddObject:self->_completedFinancingPlans];
  [v3 safelyAddObject:self->_activeFinancingPlans];
  [v3 safelyAddObject:self->_relevantFinancingPlans];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_financingPlanCount - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKAccountServicePayLaterFinancingPlanQueryResponse *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKAccountServicePayLaterFinancingPlanQueryResponse *)self _isEqualToFinancingPlanQueryResponse:v5];

  return v6;
}

- (BOOL)_isEqualToFinancingPlanQueryResponse:(id)a3
{
  uint64_t v4 = a3;
  if (!v4) {
    goto LABEL_33;
  }
  dueNext30Days = self->_dueNext30Days;
  BOOL v6 = (PKCurrencyAmount *)v4[1];
  if (dueNext30Days) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (dueNext30Days != v6) {
      goto LABEL_33;
    }
  }
  else if (!-[PKCurrencyAmount isEqual:](dueNext30Days, "isEqual:"))
  {
    goto LABEL_33;
  }
  totalPendingAmount = self->_totalPendingAmount;
  v9 = (PKCurrencyAmount *)v4[2];
  if (totalPendingAmount && v9)
  {
    if (!-[PKCurrencyAmount isEqual:](totalPendingAmount, "isEqual:")) {
      goto LABEL_33;
    }
  }
  else if (totalPendingAmount != v9)
  {
    goto LABEL_33;
  }
  if (self->_financingPlanCount != v4[3]) {
    goto LABEL_33;
  }
  upcomingInstallments = self->_upcomingInstallments;
  v11 = (PKAccountServicePayLaterFinancingPlanQueryInstallments *)v4[4];
  if (upcomingInstallments && v11)
  {
    if (!-[PKAccountServicePayLaterFinancingPlanQueryInstallments isEqual:](upcomingInstallments, "isEqual:")) {
      goto LABEL_33;
    }
  }
  else if (upcomingInstallments != v11)
  {
    goto LABEL_33;
  }
  completedFinancingPlans = self->_completedFinancingPlans;
  uint64_t v13 = (NSArray *)v4[5];
  if (completedFinancingPlans && v13)
  {
    if ((-[NSArray isEqual:](completedFinancingPlans, "isEqual:") & 1) == 0) {
      goto LABEL_33;
    }
  }
  else if (completedFinancingPlans != v13)
  {
    goto LABEL_33;
  }
  activeFinancingPlans = self->_activeFinancingPlans;
  uint64_t v15 = (NSArray *)v4[6];
  if (!activeFinancingPlans || !v15)
  {
    if (activeFinancingPlans == v15) {
      goto LABEL_29;
    }
LABEL_33:
    char v18 = 0;
    goto LABEL_34;
  }
  if ((-[NSArray isEqual:](activeFinancingPlans, "isEqual:") & 1) == 0) {
    goto LABEL_33;
  }
LABEL_29:
  relevantFinancingPlans = self->_relevantFinancingPlans;
  v17 = (NSArray *)v4[7];
  if (relevantFinancingPlans && v17) {
    char v18 = -[NSArray isEqual:](relevantFinancingPlans, "isEqual:");
  }
  else {
    char v18 = relevantFinancingPlans == v17;
  }
LABEL_34:

  return v18;
}

+ (id)_financingPlanIdentifierFromList:(id)a3
{
  id v3 = objc_msgSend(a3, "pk_createOrderedSetByApplyingBlock:", &__block_literal_global_212);
  uint64_t v4 = [v3 array];

  return v4;
}

uint64_t __87__PKAccountServicePayLaterFinancingPlanQueryResponse__financingPlanIdentifierFromList___block_invoke(uint64_t a1, void *a2)
{
  return [a2 planIdentifier];
}

- (PKCurrencyAmount)dueNext30Days
{
  return self->_dueNext30Days;
}

- (void)setDueNext30Days:(id)a3
{
}

- (PKCurrencyAmount)totalPendingAmount
{
  return self->_totalPendingAmount;
}

- (void)setTotalPendingAmount:(id)a3
{
}

- (int64_t)financingPlanCount
{
  return self->_financingPlanCount;
}

- (void)setFinancingPlanCount:(int64_t)a3
{
  self->_financingPlanCount = a3;
}

- (PKAccountServicePayLaterFinancingPlanQueryInstallments)upcomingInstallments
{
  return self->_upcomingInstallments;
}

- (void)setUpcomingInstallments:(id)a3
{
}

- (NSArray)completedFinancingPlans
{
  return self->_completedFinancingPlans;
}

- (void)setCompletedFinancingPlans:(id)a3
{
}

- (NSArray)activeFinancingPlans
{
  return self->_activeFinancingPlans;
}

- (void)setActiveFinancingPlans:(id)a3
{
}

- (NSArray)relevantFinancingPlans
{
  return self->_relevantFinancingPlans;
}

- (void)setRelevantFinancingPlans:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantFinancingPlans, 0);
  objc_storeStrong((id *)&self->_activeFinancingPlans, 0);
  objc_storeStrong((id *)&self->_completedFinancingPlans, 0);
  objc_storeStrong((id *)&self->_upcomingInstallments, 0);
  objc_storeStrong((id *)&self->_totalPendingAmount, 0);
  objc_storeStrong((id *)&self->_dueNext30Days, 0);
}

@end