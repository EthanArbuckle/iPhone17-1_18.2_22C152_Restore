@interface PKSearchTransactionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)passUniqueIdentifier;
- (PKPaymentTransaction)transaction;
- (PKSearchTransactionResult)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPassUniqueIdentifier:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation PKSearchTransactionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  transaction = self->_transaction;
  id v5 = a3;
  [v5 encodeObject:transaction forKey:@"transaction"];
  [v5 encodeObject:self->_passUniqueIdentifier forKey:@"passUniqueIdentifier"];
}

- (PKSearchTransactionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSearchTransactionResult *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transaction"];
    transaction = v5->_transaction;
    v5->_transaction = (PKPaymentTransaction *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueIdentifier"];
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v8;
  }
  return v5;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PKSearchTransactionResult;
  v3 = [(PKSearchTransactionResult *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@"transaction: '%@'; ", self->_transaction];
  [v4 appendFormat:@"passUniqueIdentifier: '%@'; ", self->_passUniqueIdentifier];
  [v4 appendFormat:@">"];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  transaction = self->_transaction;
  objc_super v6 = (PKPaymentTransaction *)v4[1];
  if (!transaction || !v6)
  {
    if (transaction == v6) {
      goto LABEL_5;
    }
LABEL_9:
    char v9 = 0;
    goto LABEL_10;
  }
  if (!-[PKPaymentTransaction isEqual:](transaction, "isEqual:")) {
    goto LABEL_9;
  }
LABEL_5:
  passUniqueIdentifier = self->_passUniqueIdentifier;
  uint64_t v8 = (NSString *)v4[2];
  if (passUniqueIdentifier && v8) {
    char v9 = -[NSString isEqual:](passUniqueIdentifier, "isEqual:");
  }
  else {
    char v9 = passUniqueIdentifier == v8;
  }
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_transaction];
  [v3 safelyAddObject:self->_passUniqueIdentifier];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (PKPaymentTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

@end