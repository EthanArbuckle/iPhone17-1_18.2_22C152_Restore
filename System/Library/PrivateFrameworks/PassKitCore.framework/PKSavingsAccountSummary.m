@interface PKSavingsAccountSummary
+ (BOOL)supportsSecureCoding;
- (BOOL)hasWithdrawalLimit;
- (BOOL)isEqual:(id)a3;
- (NSDecimalNumber)apy;
- (NSDecimalNumber)availableBalance;
- (NSDecimalNumber)currentBalance;
- (NSDecimalNumber)interestTotal;
- (NSDecimalNumber)interestYTD;
- (NSDecimalNumber)pendingBalance;
- (NSNumberFormatter)apyFormatter;
- (NSString)formattedAPY;
- (PKSavingsAccountSummary)init;
- (PKSavingsAccountSummary)initWithCoder:(id)a3;
- (PKSavingsAccountSummary)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)withdrawalsRemaining;
- (void)encodeWithCoder:(id)a3;
- (void)setAPY:(id)a3;
- (void)setAvailableBalance:(id)a3;
- (void)setCurrentBalance:(id)a3;
- (void)setHasWithdrawalLimit:(BOOL)a3;
- (void)setInterestTotal:(id)a3;
- (void)setInterestYTD:(id)a3;
- (void)setPendingBalance:(id)a3;
- (void)setWithdrawalsRemaining:(unint64_t)a3;
@end

@implementation PKSavingsAccountSummary

- (PKSavingsAccountSummary)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKSavingsAccountSummary;
  v2 = [(PKSavingsAccountSummary *)&v6 init];
  if (v2)
  {
    v3 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    apyFormatter = v2->_apyFormatter;
    v2->_apyFormatter = v3;

    [(NSNumberFormatter *)v2->_apyFormatter setNumberStyle:3];
    [(NSNumberFormatter *)v2->_apyFormatter setMultiplier:&unk_1EE22B930];
    [(NSNumberFormatter *)v2->_apyFormatter setMinimumFractionDigits:2];
    [(NSNumberFormatter *)v2->_apyFormatter setMaximumFractionDigits:2];
  }
  return v2;
}

- (PKSavingsAccountSummary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(PKSavingsAccountSummary *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 PKDecimalNumberFromStringForKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 PKDecimalNumberFromStringForKey:@"availableBalance"];
    availableBalance = v5->_availableBalance;
    v5->_availableBalance = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 PKDecimalNumberFromStringForKey:@"pendingBalance"];
    pendingBalance = v5->_pendingBalance;
    v5->_pendingBalance = (NSDecimalNumber *)v10;

    uint64_t v12 = [v4 PKDecimalNumberFromStringForKey:@"interestYTD"];
    interestYTD = v5->_interestYTD;
    v5->_interestYTD = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 PKDecimalNumberFromStringForKey:@"interestTotal"];
    interestTotal = v5->_interestTotal;
    v5->_interestTotal = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 PKDecimalNumberFromStringForKey:@"apy"];
    apy = v5->_apy;
    v5->_apy = (NSDecimalNumber *)v16;

    v5->_hasWithdrawalLimit = [v4 PKBoolForKey:@"hasWithdrawalLimit"];
    v5->_withdrawalsRemaining = [v4 PKIntegerForKey:@"withdrawalsRemaining"];
  }

  return v5;
}

- (NSString)formattedAPY
{
  if (self->_apy)
  {
    v3 = [(PKSavingsAccountSummary *)self apyFormatter];
    id v4 = [v3 stringFromNumber:self->_apy];
  }
  else
  {
    id v4 = 0;
  }
  return (NSString *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSavingsAccountSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKSavingsAccountSummary *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentBalance"];
    currentBalance = v5->_currentBalance;
    v5->_currentBalance = (NSDecimalNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"availableBalance"];
    availableBalance = v5->_availableBalance;
    v5->_availableBalance = (NSDecimalNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pendingBalance"];
    pendingBalance = v5->_pendingBalance;
    v5->_pendingBalance = (NSDecimalNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interestYTD"];
    interestYTD = v5->_interestYTD;
    v5->_interestYTD = (NSDecimalNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interestTotal"];
    interestTotal = v5->_interestTotal;
    v5->_interestTotal = (NSDecimalNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"apy"];
    apy = v5->_apy;
    v5->_apy = (NSDecimalNumber *)v16;

    v5->_hasWithdrawalLimit = [v4 decodeBoolForKey:@"hasWithdrawalLimit"];
    v5->_withdrawalsRemaining = [v4 decodeIntegerForKey:@"withdrawalsRemaining"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  currentBalance = self->_currentBalance;
  id v5 = a3;
  [v5 encodeObject:currentBalance forKey:@"currentBalance"];
  [v5 encodeObject:self->_availableBalance forKey:@"availableBalance"];
  [v5 encodeObject:self->_pendingBalance forKey:@"pendingBalance"];
  [v5 encodeObject:self->_interestYTD forKey:@"interestYTD"];
  [v5 encodeObject:self->_interestTotal forKey:@"interestTotal"];
  [v5 encodeObject:self->_apy forKey:@"apy"];
  [v5 encodeBool:self->_hasWithdrawalLimit forKey:@"hasWithdrawalLimit"];
  [v5 encodeInteger:self->_withdrawalsRemaining forKey:@"withdrawalsRemaining"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_34;
  }
  currentBalance = self->_currentBalance;
  uint64_t v6 = (NSDecimalNumber *)v4[3];
  if (currentBalance && v6)
  {
    if ((-[NSDecimalNumber isEqual:](currentBalance, "isEqual:") & 1) == 0) {
      goto LABEL_34;
    }
  }
  else if (currentBalance != v6)
  {
    goto LABEL_34;
  }
  availableBalance = self->_availableBalance;
  uint64_t v8 = (NSDecimalNumber *)v4[4];
  if (availableBalance && v8)
  {
    if ((-[NSDecimalNumber isEqual:](availableBalance, "isEqual:") & 1) == 0) {
      goto LABEL_34;
    }
  }
  else if (availableBalance != v8)
  {
    goto LABEL_34;
  }
  pendingBalance = self->_pendingBalance;
  uint64_t v10 = (NSDecimalNumber *)v4[5];
  if (pendingBalance && v10)
  {
    if ((-[NSDecimalNumber isEqual:](pendingBalance, "isEqual:") & 1) == 0) {
      goto LABEL_34;
    }
  }
  else if (pendingBalance != v10)
  {
    goto LABEL_34;
  }
  interestYTD = self->_interestYTD;
  uint64_t v12 = (NSDecimalNumber *)v4[6];
  if (interestYTD && v12)
  {
    if ((-[NSDecimalNumber isEqual:](interestYTD, "isEqual:") & 1) == 0) {
      goto LABEL_34;
    }
  }
  else if (interestYTD != v12)
  {
    goto LABEL_34;
  }
  interestTotal = self->_interestTotal;
  uint64_t v14 = (NSDecimalNumber *)v4[7];
  if (interestTotal && v14)
  {
    if ((-[NSDecimalNumber isEqual:](interestTotal, "isEqual:") & 1) == 0) {
      goto LABEL_34;
    }
  }
  else if (interestTotal != v14)
  {
    goto LABEL_34;
  }
  apy = self->_apy;
  uint64_t v16 = (NSDecimalNumber *)v4[8];
  if (!apy || !v16)
  {
    if (apy == v16) {
      goto LABEL_32;
    }
LABEL_34:
    BOOL v17 = 0;
    goto LABEL_35;
  }
  if ((-[NSDecimalNumber isEqual:](apy, "isEqual:") & 1) == 0) {
    goto LABEL_34;
  }
LABEL_32:
  if (self->_hasWithdrawalLimit != *((unsigned __int8 *)v4 + 16)) {
    goto LABEL_34;
  }
  BOOL v17 = self->_withdrawalsRemaining == v4[9];
LABEL_35:

  return v17;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_currentBalance];
  [v3 safelyAddObject:self->_availableBalance];
  [v3 safelyAddObject:self->_pendingBalance];
  [v3 safelyAddObject:self->_interestYTD];
  [v3 safelyAddObject:self->_interestTotal];
  [v3 safelyAddObject:self->_apy];
  uint64_t v4 = PKCombinedHash(17, v3);
  uint64_t v5 = self->_hasWithdrawalLimit - v4 + 32 * v4;
  unint64_t v6 = self->_withdrawalsRemaining - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = [(NSDecimalNumber *)self->_currentBalance stringValue];
  [v3 appendFormat:@"currentBalance: '%@'; ", v4];

  uint64_t v5 = [(NSDecimalNumber *)self->_availableBalance stringValue];
  [v3 appendFormat:@"availableBalance: '%@'; ", v5];

  unint64_t v6 = [(NSDecimalNumber *)self->_pendingBalance stringValue];
  [v3 appendFormat:@"pendingBalance: '%@'; ", v6];

  v7 = [(NSDecimalNumber *)self->_interestYTD stringValue];
  [v3 appendFormat:@"interestYTD: '%@'; ", v7];

  uint64_t v8 = [(NSDecimalNumber *)self->_interestTotal stringValue];
  [v3 appendFormat:@"interestTotal: '%@'; ", v8];

  v9 = [(NSDecimalNumber *)self->_apy stringValue];
  [v3 appendFormat:@"apy: '%@'; ", v9];

  if (self->_hasWithdrawalLimit) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  [v3 appendFormat:@"hasWithdrawalLimit: '%@'; ", v10];
  objc_msgSend(v3, "appendFormat:", @"_withdrawalsRemaining: '%ld'; ", self->_withdrawalsRemaining);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[PKSavingsAccountSummary allocWithZone:](PKSavingsAccountSummary, "allocWithZone:") init];
  uint64_t v6 = [(NSDecimalNumber *)self->_currentBalance copyWithZone:a3];
  currentBalance = v5->_currentBalance;
  v5->_currentBalance = (NSDecimalNumber *)v6;

  uint64_t v8 = [(NSDecimalNumber *)self->_availableBalance copyWithZone:a3];
  availableBalance = v5->_availableBalance;
  v5->_availableBalance = (NSDecimalNumber *)v8;

  uint64_t v10 = [(NSDecimalNumber *)self->_pendingBalance copyWithZone:a3];
  pendingBalance = v5->_pendingBalance;
  v5->_pendingBalance = (NSDecimalNumber *)v10;

  uint64_t v12 = [(NSDecimalNumber *)self->_interestYTD copyWithZone:a3];
  interestYTD = v5->_interestYTD;
  v5->_interestYTD = (NSDecimalNumber *)v12;

  uint64_t v14 = [(NSDecimalNumber *)self->_interestTotal copyWithZone:a3];
  interestTotal = v5->_interestTotal;
  v5->_interestTotal = (NSDecimalNumber *)v14;

  uint64_t v16 = [(NSDecimalNumber *)self->_apy copyWithZone:a3];
  apy = v5->_apy;
  v5->_apy = (NSDecimalNumber *)v16;

  v5->_hasWithdrawalLimit = self->_hasWithdrawalLimit;
  v5->_withdrawalsRemaining = self->_withdrawalsRemaining;
  return v5;
}

- (NSDecimalNumber)currentBalance
{
  return self->_currentBalance;
}

- (void)setCurrentBalance:(id)a3
{
}

- (NSDecimalNumber)availableBalance
{
  return self->_availableBalance;
}

- (void)setAvailableBalance:(id)a3
{
}

- (NSDecimalNumber)pendingBalance
{
  return self->_pendingBalance;
}

- (void)setPendingBalance:(id)a3
{
}

- (NSDecimalNumber)interestYTD
{
  return self->_interestYTD;
}

- (void)setInterestYTD:(id)a3
{
}

- (NSDecimalNumber)interestTotal
{
  return self->_interestTotal;
}

- (void)setInterestTotal:(id)a3
{
}

- (NSDecimalNumber)apy
{
  return self->_apy;
}

- (void)setAPY:(id)a3
{
}

- (BOOL)hasWithdrawalLimit
{
  return self->_hasWithdrawalLimit;
}

- (void)setHasWithdrawalLimit:(BOOL)a3
{
  self->_hasWithdrawalLimit = a3;
}

- (unint64_t)withdrawalsRemaining
{
  return self->_withdrawalsRemaining;
}

- (void)setWithdrawalsRemaining:(unint64_t)a3
{
  self->_withdrawalsRemaining = a3;
}

- (NSNumberFormatter)apyFormatter
{
  return self->_apyFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apy, 0);
  objc_storeStrong((id *)&self->_interestTotal, 0);
  objc_storeStrong((id *)&self->_interestYTD, 0);
  objc_storeStrong((id *)&self->_pendingBalance, 0);
  objc_storeStrong((id *)&self->_availableBalance, 0);
  objc_storeStrong((id *)&self->_currentBalance, 0);
  objc_storeStrong((id *)&self->_apyFormatter, 0);
}

@end