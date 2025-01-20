@interface PKPayLaterFinancingPlanDispute
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPayLaterFinancingPlanDispute:(id)a3;
- (BOOL)isTerminal;
- (NSArray)appliedPayments;
- (NSDate)deadlineDate;
- (NSDate)lastUpdated;
- (NSDate)openDate;
- (NSString)emailAddress;
- (NSString)identifier;
- (PKPayLaterFinancingPlanDispute)initWithCoder:(id)a3;
- (PKPayLaterFinancingPlanDispute)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)requiredDocuments;
- (unint64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setAppliedPayments:(id)a3;
- (void)setDeadlineDate:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastUpdated:(id)a3;
- (void)setOpenDate:(id)a3;
- (void)setRequiredDocuments:(unint64_t)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation PKPayLaterFinancingPlanDispute

- (PKPayLaterFinancingPlanDispute)initWithDictionary:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)PKPayLaterFinancingPlanDispute;
  v5 = [(PKPayLaterFinancingPlanDispute *)&v56 init];
  if (!v5) {
    goto LABEL_32;
  }
  uint64_t v6 = [v4 PKStringForKey:@"identifier"];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v8 = [v4 PKStringForKey:@"state"];
  v9 = v8;
  if (v8 == @"review") {
    goto LABEL_5;
  }
  if (!v8)
  {
LABEL_21:
    uint64_t v11 = 0;
    goto LABEL_22;
  }
  char v10 = [(__CFString *)v8 isEqualToString:@"review"];

  if ((v10 & 1) == 0)
  {
    v12 = v9;
    if (v12 == @"evidenceRequired"
      || (v13 = v12,
          char v14 = [(__CFString *)v12 isEqualToString:@"evidenceRequired"],
          v13,
          (v14 & 1) != 0))
    {
      uint64_t v11 = 2;
      goto LABEL_22;
    }
    v15 = v13;
    if (v15 == @"approved"
      || (v16 = v15,
          char v17 = [(__CFString *)v15 isEqualToString:@"approved"],
          v16,
          (v17 & 1) != 0))
    {
      uint64_t v11 = 3;
      goto LABEL_22;
    }
    v18 = v16;
    if (v18 == @"rejected"
      || (v19 = v18,
          char v20 = [(__CFString *)v18 isEqualToString:@"rejected"],
          v19,
          (v20 & 1) != 0))
    {
      uint64_t v11 = 4;
      goto LABEL_22;
    }
    v21 = v19;
    if (v21 == @"split"
      || (v22 = v21,
          char v23 = [(__CFString *)v21 isEqualToString:@"split"],
          v22,
          (v23 & 1) != 0))
    {
      uint64_t v11 = 5;
      goto LABEL_22;
    }
    v24 = v22;
    if (v24 == @"withdrawn"
      || (v25 = v24,
          int v26 = [(__CFString *)v24 isEqualToString:@"withdrawn"],
          v25,
          v26))
    {
      uint64_t v11 = 6;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v11 = 1;
LABEL_22:

  v5->_state = v11;
  uint64_t v27 = [v4 PKDateForKey:@"openDate"];
  openDate = v5->_openDate;
  v5->_openDate = (NSDate *)v27;

  uint64_t v29 = [v4 PKDateForKey:@"lastUpdated"];
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v29;

  uint64_t v31 = [v4 PKDateForKey:@"deadlineDate"];
  deadlineDate = v5->_deadlineDate;
  v5->_deadlineDate = (NSDate *)v31;

  uint64_t v33 = [v4 PKStringForKey:@"emailAddress"];
  emailAddress = v5->_emailAddress;
  v5->_emailAddress = (NSString *)v33;

  v35 = [v4 PKArrayContaining:objc_opt_class() forKey:@"requiredDocuments"];
  uint64_t v36 = [v35 containsObject:@"receipt"];
  int v37 = [v35 containsObject:@"itemPhoto"];
  uint64_t v38 = v36 | 2;
  if (!v37) {
    uint64_t v38 = v36;
  }
  v5->_requiredDocuments = v38;

  v39 = [v4 PKArrayContaining:objc_opt_class() forKey:@"appliedPayments"];
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v41 = v39;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v53;
    do
    {
      uint64_t v45 = 0;
      do
      {
        if (*(void *)v53 != v44) {
          objc_enumerationMutation(v41);
        }
        uint64_t v46 = *(void *)(*((void *)&v52 + 1) + 8 * v45);
        v47 = [PKPayLaterAppliedPayment alloc];
        v48 = -[PKPayLaterAppliedPayment initWithDictionary:](v47, "initWithDictionary:", v46, (void)v52);
        [v40 safelyAddObject:v48];

        ++v45;
      }
      while (v43 != v45);
      uint64_t v43 = [v41 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v43);
  }

  uint64_t v49 = [v40 copy];
  appliedPayments = v5->_appliedPayments;
  v5->_appliedPayments = (NSArray *)v49;

LABEL_32:
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterFinancingPlanDispute *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPayLaterFinancingPlanDispute *)self isEqualToPayLaterFinancingPlanDispute:v5];

  return v6;
}

- (BOOL)isEqualToPayLaterFinancingPlanDispute:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_31;
  }
  BOOL v6 = (void *)v4[1];
  v7 = self->_identifier;
  v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    if (!v7 || !v8) {
      goto LABEL_30;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_31;
    }
  }
  if (self->_state != v5[2] || self->_requiredDocuments != v5[7]) {
    goto LABEL_31;
  }
  openDate = self->_openDate;
  v12 = (NSDate *)v5[3];
  if (openDate && v12)
  {
    if ((-[NSDate isEqual:](openDate, "isEqual:") & 1) == 0) {
      goto LABEL_31;
    }
  }
  else if (openDate != v12)
  {
    goto LABEL_31;
  }
  lastUpdated = self->_lastUpdated;
  char v14 = (NSDate *)v5[4];
  if (lastUpdated && v14)
  {
    if ((-[NSDate isEqual:](lastUpdated, "isEqual:") & 1) == 0) {
      goto LABEL_31;
    }
  }
  else if (lastUpdated != v14)
  {
    goto LABEL_31;
  }
  deadlineDate = self->_deadlineDate;
  v16 = (NSDate *)v5[5];
  if (deadlineDate && v16)
  {
    if ((-[NSDate isEqual:](deadlineDate, "isEqual:") & 1) == 0) {
      goto LABEL_31;
    }
  }
  else if (deadlineDate != v16)
  {
    goto LABEL_31;
  }
  char v17 = (void *)v5[6];
  v7 = self->_emailAddress;
  v18 = v17;
  if (v7 != v18)
  {
    v9 = v18;
    if (v7 && v18)
    {
      BOOL v19 = [(NSString *)v7 isEqualToString:v18];

      if (v19) {
        goto LABEL_34;
      }
LABEL_31:
      char v20 = 0;
      goto LABEL_32;
    }
LABEL_30:

    goto LABEL_31;
  }

LABEL_34:
  appliedPayments = self->_appliedPayments;
  char v23 = (NSArray *)v5[8];
  if (appliedPayments && v23) {
    char v20 = -[NSArray isEqual:](appliedPayments, "isEqual:");
  }
  else {
    char v20 = appliedPayments == v23;
  }
LABEL_32:

  return v20;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_openDate];
  [v3 safelyAddObject:self->_lastUpdated];
  [v3 safelyAddObject:self->_deadlineDate];
  [v3 safelyAddObject:self->_emailAddress];
  [v3 safelyAddObject:self->_appliedPayments];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_state - v4 + 32 * v4;
  unint64_t v6 = self->_requiredDocuments - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  unint64_t state = self->_state;
  if (state > 6) {
    unint64_t v5 = @"unknown";
  }
  else {
    unint64_t v5 = off_1E56EC370[state];
  }
  [v3 appendFormat:@"state: '%@'; ", v5];
  [v3 appendFormat:@"openDate: '%@'; ", self->_openDate];
  [v3 appendFormat:@"lastUpdated: '%@'; ", self->_lastUpdated];
  [v3 appendFormat:@"deadlineDate: '%@'; ", self->_deadlineDate];
  [v3 appendFormat:@"emailAddress: '%@'; ", self->_emailAddress];
  unint64_t v6 = PKPayLaterFinancingPlanDisputeDocumentToStrings(self->_requiredDocuments);
  [v3 appendFormat:@"requiredDocuments: '%@'; ", v6];

  [v3 appendFormat:@"appliedPayments: '%@'; ", self->_appliedPayments];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  unint64_t state = self->_state;
  if (state > 6) {
    unint64_t v5 = @"unknown";
  }
  else {
    unint64_t v5 = off_1E56EC370[state];
  }
  [v3 setObject:v5 forKeyedSubscript:@"state"];
  openDate = self->_openDate;
  if (openDate)
  {
    v7 = PKISO8601DateStringFromDate(openDate);
    [v3 setObject:v7 forKeyedSubscript:@"openDate"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"openDate"];
  }
  lastUpdated = self->_lastUpdated;
  if (lastUpdated)
  {
    v9 = PKISO8601DateStringFromDate(lastUpdated);
    [v3 setObject:v9 forKeyedSubscript:@"lastUpdated"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"lastUpdated"];
  }
  deadlineDate = self->_deadlineDate;
  if (deadlineDate)
  {
    uint64_t v11 = PKISO8601DateStringFromDate(deadlineDate);
    [v3 setObject:v11 forKeyedSubscript:@"deadlineDate"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"deadlineDate"];
  }
  [v3 setObject:self->_emailAddress forKeyedSubscript:@"emailAddress"];
  v12 = PKPayLaterFinancingPlanDisputeDocumentToStrings(self->_requiredDocuments);
  [v3 setObject:v12 forKeyedSubscript:@"requiredDocuments"];

  v13 = [(NSArray *)self->_appliedPayments pk_arrayBySafelyApplyingBlock:&__block_literal_global_136];
  [v3 setObject:v13 forKeyedSubscript:@"appliedPayments"];

  char v14 = (void *)[v3 copy];
  return v14;
}

uint64_t __58__PKPayLaterFinancingPlanDispute_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (BOOL)isTerminal
{
  return self->_state - 3 < 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFinancingPlanDispute)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPayLaterFinancingPlanDispute;
  unint64_t v5 = [(PKPayLaterFinancingPlanDispute *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_unint64_t state = [v4 decodeIntegerForKey:@"state"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"openDate"];
    openDate = v5->_openDate;
    v5->_openDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdated"];
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deadlineDate"];
    deadlineDate = v5->_deadlineDate;
    v5->_deadlineDate = (NSDate *)v12;

    char v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"appliedPayments"];
    appliedPayments = v5->_appliedPayments;
    v5->_appliedPayments = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"emailAddress"];
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v19;

    v5->_requiredDocuments = [v4 decodeIntegerForKey:@"requiredDocuments"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  [v5 encodeInteger:self->_requiredDocuments forKey:@"requiredDocuments"];
  [v5 encodeObject:self->_openDate forKey:@"openDate"];
  [v5 encodeObject:self->_lastUpdated forKey:@"lastUpdated"];
  [v5 encodeObject:self->_deadlineDate forKey:@"deadlineDate"];
  [v5 encodeObject:self->_emailAddress forKey:@"emailAddress"];
  [v5 encodeObject:self->_appliedPayments forKey:@"appliedPayments"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterFinancingPlanDispute allocWithZone:](PKPayLaterFinancingPlanDispute, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_unint64_t state = self->_state;
  v5->_requiredDocuments = self->_requiredDocuments;
  uint64_t v8 = [(NSDate *)self->_openDate copyWithZone:a3];
  openDate = v5->_openDate;
  v5->_openDate = (NSDate *)v8;

  uint64_t v10 = [(NSDate *)self->_lastUpdated copyWithZone:a3];
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v10;

  uint64_t v12 = [(NSDate *)self->_deadlineDate copyWithZone:a3];
  deadlineDate = v5->_deadlineDate;
  v5->_deadlineDate = (NSDate *)v12;

  uint64_t v14 = [(NSString *)self->_emailAddress copyWithZone:a3];
  emailAddress = v5->_emailAddress;
  v5->_emailAddress = (NSString *)v14;

  uint64_t v16 = [(NSArray *)self->_appliedPayments copyWithZone:a3];
  appliedPayments = v5->_appliedPayments;
  v5->_appliedPayments = (NSArray *)v16;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (NSDate)openDate
{
  return self->_openDate;
}

- (void)setOpenDate:(id)a3
{
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (NSDate)deadlineDate
{
  return self->_deadlineDate;
}

- (void)setDeadlineDate:(id)a3
{
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
}

- (unint64_t)requiredDocuments
{
  return self->_requiredDocuments;
}

- (void)setRequiredDocuments:(unint64_t)a3
{
  self->_requiredDocuments = a3;
}

- (NSArray)appliedPayments
{
  return self->_appliedPayments;
}

- (void)setAppliedPayments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appliedPayments, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_deadlineDate, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_openDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end