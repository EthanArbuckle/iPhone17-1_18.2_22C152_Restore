@interface PKPaymentApplicationUsageSummary
+ (BOOL)supportsSecureCoding;
- (NSDate)lastUsed;
- (NSDate)lastUsedTransaction;
- (NSString)passUniqueIdentifier;
- (NSString)paymentApplicationIdentifier;
- (PKPaymentApplicationUsageSummary)init;
- (PKPaymentApplicationUsageSummary)initWithCoder:(id)a3;
- (PKPaymentApplicationUsageSummary)initWithPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4 lastUsed:(id)a5;
- (PKPaymentApplicationUsageSummary)initWithPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4 lastUsed:(id)a5 lastUsedTransaction:(id)a6;
- (PKPaymentApplicationUsageSummary)initWithPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4 lastUsedTransaction:(id)a5;
- (id)_databaseInit;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setLastUsed:(id)a3;
- (void)setLastUsedTransaction:(id)a3;
- (void)setPassUniqueIdentifier:(id)a3;
- (void)setPaymentApplicationIdentifier:(id)a3;
- (void)updateWithSummary:(id)a3;
@end

@implementation PKPaymentApplicationUsageSummary

- (PKPaymentApplicationUsageSummary)init
{
  return 0;
}

- (id)_databaseInit
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentApplicationUsageSummary;
  v2 = [(PKPaymentApplicationUsageSummary *)&v4 init];
  return v2;
}

- (PKPaymentApplicationUsageSummary)initWithPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4 lastUsed:(id)a5
{
  return [(PKPaymentApplicationUsageSummary *)self initWithPassUniqueIdentifier:a3 paymentApplicationIdentifier:a4 lastUsed:a5 lastUsedTransaction:0];
}

- (PKPaymentApplicationUsageSummary)initWithPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4 lastUsedTransaction:(id)a5
{
  return [(PKPaymentApplicationUsageSummary *)self initWithPassUniqueIdentifier:a3 paymentApplicationIdentifier:a4 lastUsed:0 lastUsedTransaction:a5];
}

- (PKPaymentApplicationUsageSummary)initWithPassUniqueIdentifier:(id)a3 paymentApplicationIdentifier:(id)a4 lastUsed:(id)a5 lastUsedTransaction:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PKPaymentApplicationUsageSummary;
  v15 = [(PKPaymentApplicationUsageSummary *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_passUniqueIdentifier, a3);
    objc_storeStrong((id *)&v16->_paymentApplicationIdentifier, a4);
    objc_storeStrong((id *)&v16->_lastUsed, a5);
    objc_storeStrong((id *)&v16->_lastUsedTransaction, a6);
  }

  return v16;
}

- (void)updateWithSummary:(id)a3
{
  id v10 = a3;
  objc_super v4 = [v10 lastUsed];
  if (v4)
  {
    lastUsed = self->_lastUsed;
    if (lastUsed)
    {
      v6 = [(NSDate *)lastUsed laterDate:v4];
      [(PKPaymentApplicationUsageSummary *)self setLastUsed:v6];
    }
    else
    {
      [(PKPaymentApplicationUsageSummary *)self setLastUsed:v4];
    }
  }
  v7 = [v10 lastUsedTransaction];
  if (v7)
  {
    lastUsedTransaction = self->_lastUsedTransaction;
    if (lastUsedTransaction)
    {
      v9 = [(NSDate *)lastUsedTransaction laterDate:v7];
      [(PKPaymentApplicationUsageSummary *)self setLastUsedTransaction:v9];
    }
    else
    {
      [(PKPaymentApplicationUsageSummary *)self setLastUsedTransaction:v7];
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  passUniqueIdentifier = self->_passUniqueIdentifier;
  id v5 = a3;
  [v5 encodeObject:passUniqueIdentifier forKey:@"passUniqueIdentifier"];
  [v5 encodeObject:self->_paymentApplicationIdentifier forKey:@"paymentApplicationIdentifier"];
  [v5 encodeObject:self->_lastUsed forKey:@"lastUsed"];
  [v5 encodeObject:self->_lastUsedTransaction forKey:@"lastUsedTransaction"];
}

- (PKPaymentApplicationUsageSummary)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentApplicationUsageSummary;
  id v5 = [(PKPaymentApplicationUsageSummary *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueIdentifier"];
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentApplicationIdentifier"];
    paymentApplicationIdentifier = v5->_paymentApplicationIdentifier;
    v5->_paymentApplicationIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUsed"];
    lastUsed = v5->_lastUsed;
    v5->_lastUsed = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUsedTransaction"];
    lastUsedTransaction = v5->_lastUsedTransaction;
    v5->_lastUsedTransaction = (NSDate *)v12;
  }
  return v5;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"passUniqueIdentifier: '%@'; ", self->_passUniqueIdentifier];
  [v6 appendFormat:@"paymentApplicationIdentifier: '%@'; ", self->_paymentApplicationIdentifier];
  [v6 appendFormat:@"lastUsed: '%@'; ", self->_lastUsed];
  [v6 appendFormat:@"lastUsedTransaction: '%@'; ", self->_lastUsedTransaction];
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
}

- (NSString)paymentApplicationIdentifier
{
  return self->_paymentApplicationIdentifier;
}

- (void)setPaymentApplicationIdentifier:(id)a3
{
}

- (NSDate)lastUsed
{
  return self->_lastUsed;
}

- (void)setLastUsed:(id)a3
{
}

- (NSDate)lastUsedTransaction
{
  return self->_lastUsedTransaction;
}

- (void)setLastUsedTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedTransaction, 0);
  objc_storeStrong((id *)&self->_lastUsed, 0);
  objc_storeStrong((id *)&self->_paymentApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end