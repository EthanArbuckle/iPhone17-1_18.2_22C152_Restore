@interface PKSavingsAccountStatement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)closingDate;
- (NSDate)openingDate;
- (NSDecimalNumber)apy;
- (NSDecimalNumber)closingBalance;
- (NSDecimalNumber)interestEarned;
- (NSDecimalNumber)openingBalance;
- (NSDecimalNumber)totalDailyCashDeposits;
- (NSDecimalNumber)totalDeposits;
- (NSDecimalNumber)totalWithdrawn;
- (NSString)currencyCode;
- (NSString)identifier;
- (PKSavingsAccountStatement)initWithCoder:(id)a3;
- (PKSavingsAccountStatement)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)statementPeriodDays;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAPY:(id)a3;
- (void)setClosingBalance:(id)a3;
- (void)setClosingDate:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterestEarned:(id)a3;
- (void)setOpeningBalance:(id)a3;
- (void)setOpeningDate:(id)a3;
- (void)setStatementPeriodDays:(int64_t)a3;
- (void)setTotalDailyCashDeposits:(id)a3;
- (void)setTotalDeposits:(id)a3;
- (void)setTotalWithdrawn:(id)a3;
@end

@implementation PKSavingsAccountStatement

- (PKSavingsAccountStatement)initWithDictionary:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKSavingsAccountStatement;
  v5 = [(PKSavingsAccountStatement *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v8;

    uint64_t v10 = [v4 PKDateForKey:@"openingDate"];
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v10;

    uint64_t v12 = [v4 PKDateForKey:@"closingDate"];
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v12;

    uint64_t v14 = [v4 PKDecimalNumberFromStringForKey:@"openingBalance"];
    openingBalance = v5->_openingBalance;
    v5->_openingBalance = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 PKDecimalNumberFromStringForKey:@"closingBalance"];
    closingBalance = v5->_closingBalance;
    v5->_closingBalance = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 PKDecimalNumberFromStringForKey:@"interestEarned"];
    interestEarned = v5->_interestEarned;
    v5->_interestEarned = (NSDecimalNumber *)v18;

    uint64_t v20 = [v4 PKDecimalNumberFromStringForKey:@"totalDeposits"];
    totalDeposits = v5->_totalDeposits;
    v5->_totalDeposits = (NSDecimalNumber *)v20;

    uint64_t v22 = [v4 PKDecimalNumberFromStringForKey:@"totalDailyCashDeposits"];
    totalDailyCashDeposits = v5->_totalDailyCashDeposits;
    v5->_totalDailyCashDeposits = (NSDecimalNumber *)v22;

    uint64_t v24 = [v4 PKDecimalNumberFromStringForKey:@"totalWithdrawn"];
    totalWithdrawn = v5->_totalWithdrawn;
    v5->_totalWithdrawn = (NSDecimalNumber *)v24;

    uint64_t v26 = [v4 PKDecimalNumberFromStringForKey:@"apy"];
    apy = v5->_apy;
    v5->_apy = (NSDecimalNumber *)v26;

    v5->_statementPeriodDays = [v4 PKIntegerForKey:@"statementPeriodDays"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSavingsAccountStatement)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKSavingsAccountStatement;
  v5 = [(PKSavingsAccountStatement *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyCode"];
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"openingDate"];
    openingDate = v5->_openingDate;
    v5->_openingDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"closingDate"];
    closingDate = v5->_closingDate;
    v5->_closingDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"openingBalance"];
    openingBalance = v5->_openingBalance;
    v5->_openingBalance = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"closingBalance"];
    closingBalance = v5->_closingBalance;
    v5->_closingBalance = (NSDecimalNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interestEarned"];
    interestEarned = v5->_interestEarned;
    v5->_interestEarned = (NSDecimalNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalDeposits"];
    totalDeposits = v5->_totalDeposits;
    v5->_totalDeposits = (NSDecimalNumber *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalDailyCashDeposits"];
    totalDailyCashDeposits = v5->_totalDailyCashDeposits;
    v5->_totalDailyCashDeposits = (NSDecimalNumber *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalWithdrawn"];
    totalWithdrawn = v5->_totalWithdrawn;
    v5->_totalWithdrawn = (NSDecimalNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"apy"];
    apy = v5->_apy;
    v5->_apy = (NSDecimalNumber *)v26;

    v5->_statementPeriodDays = [v4 decodeIntegerForKey:@"statementPeriodDays"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_currencyCode forKey:@"currencyCode"];
  [v5 encodeObject:self->_openingDate forKey:@"openingDate"];
  [v5 encodeObject:self->_closingDate forKey:@"closingDate"];
  [v5 encodeObject:self->_openingBalance forKey:@"openingBalance"];
  [v5 encodeObject:self->_closingBalance forKey:@"closingBalance"];
  [v5 encodeObject:self->_interestEarned forKey:@"interestEarned"];
  [v5 encodeObject:self->_totalDeposits forKey:@"totalDeposits"];
  [v5 encodeObject:self->_totalDailyCashDeposits forKey:@"totalDailyCashDeposits"];
  [v5 encodeObject:self->_totalWithdrawn forKey:@"totalWithdrawn"];
  [v5 encodeObject:self->_apy forKey:@"apy"];
  [v5 encodeInteger:self->_statementPeriodDays forKey:@"statementPeriodDays"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_57;
  }
  identifier = self->_identifier;
  uint64_t v6 = (NSString *)v4[1];
  if (identifier && v6)
  {
    if ((-[NSString isEqual:](identifier, "isEqual:") & 1) == 0) {
      goto LABEL_57;
    }
  }
  else if (identifier != v6)
  {
    goto LABEL_57;
  }
  currencyCode = self->_currencyCode;
  uint64_t v8 = (NSString *)v4[2];
  if (currencyCode && v8)
  {
    if ((-[NSString isEqual:](currencyCode, "isEqual:") & 1) == 0) {
      goto LABEL_57;
    }
  }
  else if (currencyCode != v8)
  {
    goto LABEL_57;
  }
  openingDate = self->_openingDate;
  uint64_t v10 = (NSDate *)v4[3];
  if (openingDate && v10)
  {
    if ((-[NSDate isEqual:](openingDate, "isEqual:") & 1) == 0) {
      goto LABEL_57;
    }
  }
  else if (openingDate != v10)
  {
    goto LABEL_57;
  }
  closingDate = self->_closingDate;
  uint64_t v12 = (NSDate *)v4[4];
  if (closingDate && v12)
  {
    if ((-[NSDate isEqual:](closingDate, "isEqual:") & 1) == 0) {
      goto LABEL_57;
    }
  }
  else if (closingDate != v12)
  {
    goto LABEL_57;
  }
  openingBalance = self->_openingBalance;
  uint64_t v14 = (NSDecimalNumber *)v4[5];
  if (openingBalance && v14)
  {
    if ((-[NSDecimalNumber isEqual:](openingBalance, "isEqual:") & 1) == 0) {
      goto LABEL_57;
    }
  }
  else if (openingBalance != v14)
  {
    goto LABEL_57;
  }
  closingBalance = self->_closingBalance;
  uint64_t v16 = (NSDecimalNumber *)v4[6];
  if (closingBalance && v16)
  {
    if ((-[NSDecimalNumber isEqual:](closingBalance, "isEqual:") & 1) == 0) {
      goto LABEL_57;
    }
  }
  else if (closingBalance != v16)
  {
    goto LABEL_57;
  }
  interestEarned = self->_interestEarned;
  uint64_t v18 = (NSDecimalNumber *)v4[7];
  if (interestEarned && v18)
  {
    if ((-[NSDecimalNumber isEqual:](interestEarned, "isEqual:") & 1) == 0) {
      goto LABEL_57;
    }
  }
  else if (interestEarned != v18)
  {
    goto LABEL_57;
  }
  totalDeposits = self->_totalDeposits;
  uint64_t v20 = (NSDecimalNumber *)v4[8];
  if (totalDeposits && v20)
  {
    if ((-[NSDecimalNumber isEqual:](totalDeposits, "isEqual:") & 1) == 0) {
      goto LABEL_57;
    }
  }
  else if (totalDeposits != v20)
  {
    goto LABEL_57;
  }
  totalDailyCashDeposits = self->_totalDailyCashDeposits;
  uint64_t v22 = (NSDecimalNumber *)v4[9];
  if (totalDailyCashDeposits && v22)
  {
    if ((-[NSDecimalNumber isEqual:](totalDailyCashDeposits, "isEqual:") & 1) == 0) {
      goto LABEL_57;
    }
  }
  else if (totalDailyCashDeposits != v22)
  {
    goto LABEL_57;
  }
  totalWithdrawn = self->_totalWithdrawn;
  uint64_t v24 = (NSDecimalNumber *)v4[10];
  if (totalWithdrawn && v24)
  {
    if ((-[NSDecimalNumber isEqual:](totalWithdrawn, "isEqual:") & 1) == 0) {
      goto LABEL_57;
    }
  }
  else if (totalWithdrawn != v24)
  {
    goto LABEL_57;
  }
  apy = self->_apy;
  uint64_t v26 = (NSDecimalNumber *)v4[11];
  if (!apy || !v26)
  {
    if (apy == v26) {
      goto LABEL_55;
    }
LABEL_57:
    BOOL v27 = 0;
    goto LABEL_58;
  }
  if ((-[NSDecimalNumber isEqual:](apy, "isEqual:") & 1) == 0) {
    goto LABEL_57;
  }
LABEL_55:
  BOOL v27 = self->_statementPeriodDays == v4[12];
LABEL_58:

  return v27;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_currencyCode];
  [v3 safelyAddObject:self->_openingDate];
  [v3 safelyAddObject:self->_closingDate];
  [v3 safelyAddObject:self->_openingBalance];
  [v3 safelyAddObject:self->_closingBalance];
  [v3 safelyAddObject:self->_interestEarned];
  [v3 safelyAddObject:self->_totalDeposits];
  [v3 safelyAddObject:self->_totalDailyCashDeposits];
  [v3 safelyAddObject:self->_totalWithdrawn];
  [v3 safelyAddObject:self->_apy];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_statementPeriodDays - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"currencyCode: '%@'; ", self->_currencyCode];
  uint64_t v4 = [(NSDate *)self->_openingDate description];
  [v3 appendFormat:@"openingDate: '%@'; ", v4];

  unint64_t v5 = [(NSDate *)self->_closingDate description];
  [v3 appendFormat:@"closingDate: '%@'; ", v5];

  uint64_t v6 = [(NSDecimalNumber *)self->_openingBalance stringValue];
  [v3 appendFormat:@"openingBalance: '%@'; ", v6];

  v7 = [(NSDecimalNumber *)self->_closingBalance stringValue];
  [v3 appendFormat:@"closingBalance: '%@'; ", v7];

  uint64_t v8 = [(NSDecimalNumber *)self->_interestEarned stringValue];
  [v3 appendFormat:@"interestEarned: '%@'; ", v8];

  v9 = [(NSDecimalNumber *)self->_totalDeposits stringValue];
  [v3 appendFormat:@"totalDeposits: '%@'; ", v9];

  uint64_t v10 = [(NSDecimalNumber *)self->_totalDailyCashDeposits stringValue];
  [v3 appendFormat:@"totalDailyCashDeposits: '%@'; ", v10];

  v11 = [(NSDecimalNumber *)self->_totalWithdrawn stringValue];
  [v3 appendFormat:@"totalWithdrawn: '%@'; ", v11];

  uint64_t v12 = [(NSDecimalNumber *)self->_apy stringValue];
  [v3 appendFormat:@"apy: '%@'; ", v12];

  objc_msgSend(v3, "appendFormat:", @"statementPeriodDays: '%li'; ", self->_statementPeriodDays);
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKSavingsAccountStatement allocWithZone:](PKSavingsAccountStatement, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_currencyCode copyWithZone:a3];
  currencyCode = v5->_currencyCode;
  v5->_currencyCode = (NSString *)v8;

  uint64_t v10 = [(NSDate *)self->_openingDate copyWithZone:a3];
  openingDate = v5->_openingDate;
  v5->_openingDate = (NSDate *)v10;

  uint64_t v12 = [(NSDate *)self->_openingDate copyWithZone:a3];
  openingBalance = v5->_openingBalance;
  v5->_openingBalance = (NSDecimalNumber *)v12;

  uint64_t v14 = [(NSDecimalNumber *)self->_closingBalance copyWithZone:a3];
  closingBalance = v5->_closingBalance;
  v5->_closingBalance = (NSDecimalNumber *)v14;

  uint64_t v16 = [(NSDecimalNumber *)self->_interestEarned copyWithZone:a3];
  interestEarned = v5->_interestEarned;
  v5->_interestEarned = (NSDecimalNumber *)v16;

  uint64_t v18 = [(NSDecimalNumber *)self->_totalDeposits copyWithZone:a3];
  totalDeposits = v5->_totalDeposits;
  v5->_totalDeposits = (NSDecimalNumber *)v18;

  uint64_t v20 = [(NSDecimalNumber *)self->_totalDailyCashDeposits copyWithZone:a3];
  totalDailyCashDeposits = v5->_totalDailyCashDeposits;
  v5->_totalDailyCashDeposits = (NSDecimalNumber *)v20;

  uint64_t v22 = [(NSDecimalNumber *)self->_totalWithdrawn copyWithZone:a3];
  totalWithdrawn = v5->_totalWithdrawn;
  v5->_totalWithdrawn = (NSDecimalNumber *)v22;

  uint64_t v24 = [(NSDecimalNumber *)self->_apy copyWithZone:a3];
  apy = v5->_apy;
  v5->_apy = (NSDecimalNumber *)v24;

  v5->_statementPeriodDays = self->_statementPeriodDays;
  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSDate)openingDate
{
  return self->_openingDate;
}

- (void)setOpeningDate:(id)a3
{
}

- (NSDate)closingDate
{
  return self->_closingDate;
}

- (void)setClosingDate:(id)a3
{
}

- (NSDecimalNumber)openingBalance
{
  return self->_openingBalance;
}

- (void)setOpeningBalance:(id)a3
{
}

- (NSDecimalNumber)closingBalance
{
  return self->_closingBalance;
}

- (void)setClosingBalance:(id)a3
{
}

- (NSDecimalNumber)interestEarned
{
  return self->_interestEarned;
}

- (void)setInterestEarned:(id)a3
{
}

- (NSDecimalNumber)totalDeposits
{
  return self->_totalDeposits;
}

- (void)setTotalDeposits:(id)a3
{
}

- (NSDecimalNumber)totalDailyCashDeposits
{
  return self->_totalDailyCashDeposits;
}

- (void)setTotalDailyCashDeposits:(id)a3
{
}

- (NSDecimalNumber)totalWithdrawn
{
  return self->_totalWithdrawn;
}

- (void)setTotalWithdrawn:(id)a3
{
}

- (NSDecimalNumber)apy
{
  return self->_apy;
}

- (void)setAPY:(id)a3
{
}

- (int64_t)statementPeriodDays
{
  return self->_statementPeriodDays;
}

- (void)setStatementPeriodDays:(int64_t)a3
{
  self->_statementPeriodDays = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apy, 0);
  objc_storeStrong((id *)&self->_totalWithdrawn, 0);
  objc_storeStrong((id *)&self->_totalDailyCashDeposits, 0);
  objc_storeStrong((id *)&self->_totalDeposits, 0);
  objc_storeStrong((id *)&self->_interestEarned, 0);
  objc_storeStrong((id *)&self->_closingBalance, 0);
  objc_storeStrong((id *)&self->_openingBalance, 0);
  objc_storeStrong((id *)&self->_closingDate, 0);
  objc_storeStrong((id *)&self->_openingDate, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end