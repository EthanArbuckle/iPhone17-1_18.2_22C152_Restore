@interface PKBillPaymentSelectedSuggestedAmountData
+ (BOOL)supportsSecureCoding;
+ (id)recordNamePrefix;
+ (id)recordType;
- (BOOL)isEqual:(id)a3;
- (NSDate)transactionDate;
- (NSDecimalNumber)transactionAmount;
- (NSString)description;
- (NSString)statementIdentifier;
- (PKBillPaymentSelectedSuggestedAmountData)initWithCoder:(id)a3;
- (PKBillPaymentSelectedSuggestedAmountData)initWithRecord:(id)a3;
- (PKBillPaymentSelectedSuggestedAmountData)initWithStatementIdentifier:(id)a3 transactionDate:(id)a4 transactionAmount:(id)a5 suggestedAmountCategory:(unint64_t)a6;
- (unint64_t)hash;
- (unint64_t)suggestedAmountCategory;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithRecord:(id)a3;
- (void)setStatementIdentifier:(id)a3;
- (void)setSuggestedAmountCategory:(unint64_t)a3;
- (void)setTransactionAmount:(id)a3;
- (void)setTransactionDate:(id)a3;
@end

@implementation PKBillPaymentSelectedSuggestedAmountData

- (PKBillPaymentSelectedSuggestedAmountData)initWithStatementIdentifier:(id)a3 transactionDate:(id)a4 transactionAmount:(id)a5 suggestedAmountCategory:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKBillPaymentSelectedSuggestedAmountData;
  v14 = [(PKBillPaymentSelectedSuggestedAmountData *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_statementIdentifier, a3);
    objc_storeStrong((id *)&v15->_transactionDate, a4);
    objc_storeStrong((id *)&v15->_transactionAmount, a5);
    v15->_suggestedAmountCategory = a6;
  }

  return v15;
}

- (PKBillPaymentSelectedSuggestedAmountData)initWithRecord:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKBillPaymentSelectedSuggestedAmountData;
  v5 = [(PKBillPaymentSelectedSuggestedAmountData *)&v14 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"statementIdentifier");
    statementIdentifier = v5->_statementIdentifier;
    v5->_statementIdentifier = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "pk_encryptedDateForKey:", @"transactionDate");
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v8;

    uint64_t v10 = objc_msgSend(v4, "pk_encryptedDecimalNumberForKey:", @"transactionAmount");
    transactionAmount = v5->_transactionAmount;
    v5->_transactionAmount = (NSDecimalNumber *)v10;

    id v12 = objc_msgSend(v4, "pk_encryptedStringForKey:", @"suggestedAmountCategory");
    v5->_suggestedAmountCategory = PKBillPaymentSuggestedAmountCategoryFromString(v12);
  }
  return v5;
}

- (void)encodeWithRecord:(id)a3
{
  id v5 = [a3 encryptedValues];
  [v5 setObject:self->_statementIdentifier forKey:@"statementIdentifier"];
  [v5 setObject:self->_transactionAmount forKey:@"transactionAmount"];
  id v4 = PKBillPaymentSuggestedAmountCategoryToString(self->_suggestedAmountCategory);
  [v5 setObject:v4 forKey:@"suggestedAmountCategory"];

  [v5 setObject:self->_transactionDate forKey:@"transactionDate"];
}

+ (id)recordType
{
  return @"BillPaymentSelectedSuggestedAmount";
}

+ (id)recordNamePrefix
{
  return @"billPaymentSelectedSuggestedAmountData-";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKBillPaymentSelectedSuggestedAmountData)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKBillPaymentSelectedSuggestedAmountData;
  id v5 = [(PKBillPaymentSelectedSuggestedAmountData *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statementIdentifier"];
    statementIdentifier = v5->_statementIdentifier;
    v5->_statementIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionDate"];
    transactionDate = v5->_transactionDate;
    v5->_transactionDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionAmount"];
    transactionAmount = v5->_transactionAmount;
    v5->_transactionAmount = (NSDecimalNumber *)v10;

    v5->_suggestedAmountCategory = [v4 decodeIntegerForKey:@"suggestedAmountCategory"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  statementIdentifier = self->_statementIdentifier;
  id v5 = a3;
  [v5 encodeObject:statementIdentifier forKey:@"statementIdentifier"];
  [v5 encodeObject:self->_transactionDate forKey:@"transactionDate"];
  [v5 encodeObject:self->_transactionAmount forKey:@"transactionAmount"];
  [v5 encodeInteger:self->_suggestedAmountCategory forKey:@"suggestedAmountCategory"];
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_transactionAmount];
  [v3 safelyAddObject:self->_transactionDate];
  [v3 safelyAddObject:self->_statementIdentifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_suggestedAmountCategory - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_17;
  }
  statementIdentifier = self->_statementIdentifier;
  uint64_t v6 = (NSString *)v4[1];
  if (statementIdentifier && v6)
  {
    if ((-[NSString isEqual:](statementIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_17;
    }
  }
  else if (statementIdentifier != v6)
  {
    goto LABEL_17;
  }
  transactionDate = self->_transactionDate;
  uint64_t v8 = (NSDate *)v4[2];
  if (transactionDate && v8)
  {
    if ((-[NSDate isEqual:](transactionDate, "isEqual:") & 1) == 0) {
      goto LABEL_17;
    }
  }
  else if (transactionDate != v8)
  {
    goto LABEL_17;
  }
  transactionAmount = self->_transactionAmount;
  uint64_t v10 = (NSDecimalNumber *)v4[4];
  if (!transactionAmount || !v10)
  {
    if (transactionAmount == v10) {
      goto LABEL_15;
    }
LABEL_17:
    BOOL v11 = 0;
    goto LABEL_18;
  }
  if ((-[NSDecimalNumber isEqual:](transactionAmount, "isEqual:") & 1) == 0) {
    goto LABEL_17;
  }
LABEL_15:
  BOOL v11 = self->_suggestedAmountCategory == v4[3];
LABEL_18:

  return v11;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"statementIdentifier: '%@'; ", self->_statementIdentifier];
  [v3 appendFormat:@"transactionDate: '%@'; ", self->_transactionDate];
  if (self->_transactionAmount) {
    uint64_t v4 = @"<redacted>";
  }
  else {
    uint64_t v4 = 0;
  }
  [v3 appendFormat:@"transactionAmount: '%@'; ", v4];
  unint64_t v5 = PKBillPaymentSuggestedAmountCategoryToString(self->_suggestedAmountCategory);
  [v3 appendFormat:@"suggestedAmountCategory: '%@'; ", v5];

  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (NSString)statementIdentifier
{
  return self->_statementIdentifier;
}

- (void)setStatementIdentifier:(id)a3
{
}

- (NSDate)transactionDate
{
  return self->_transactionDate;
}

- (void)setTransactionDate:(id)a3
{
}

- (unint64_t)suggestedAmountCategory
{
  return self->_suggestedAmountCategory;
}

- (void)setSuggestedAmountCategory:(unint64_t)a3
{
  self->_suggestedAmountCategory = a3;
}

- (NSDecimalNumber)transactionAmount
{
  return self->_transactionAmount;
}

- (void)setTransactionAmount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionAmount, 0);
  objc_storeStrong((id *)&self->_transactionDate, 0);
  objc_storeStrong((id *)&self->_statementIdentifier, 0);
}

@end