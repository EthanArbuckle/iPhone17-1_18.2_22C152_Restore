@interface PKAccountPaymentFundingDetailsBankAccount
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)accountIdentifier;
- (NSString)accountNumber;
- (NSString)name;
- (NSString)routingNumber;
- (PKAccountFundingSourceVerification)verificationDetails;
- (PKAccountPaymentFundingDetailsBankAccount)initWithCoder:(id)a3;
- (PKAccountPaymentFundingDetailsBankAccount)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fundingDetailsUnencryptedDictionary;
- (unint64_t)hash;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountNumber:(id)a3;
- (void)setName:(id)a3;
- (void)setRoutingNumber:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setVerificationDetails:(id)a3;
@end

@implementation PKAccountPaymentFundingDetailsBankAccount

- (PKAccountPaymentFundingDetailsBankAccount)initWithDictionary:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKAccountPaymentFundingDetailsBankAccount;
  v5 = [(PKAccountPaymentFundingDetails *)&v21 initWithDictionary:v4];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"accountId"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    v8 = [v4 PKStringForKey:@"accountNumber"];
    uint64_t v9 = objc_msgSend(v8, "pk_zString");
    accountNumber = v5->_accountNumber;
    v5->_accountNumber = (NSString *)v9;

    v11 = [v4 PKStringForKey:@"routingNumber"];
    uint64_t v12 = objc_msgSend(v11, "pk_zString");
    routingNumber = v5->_routingNumber;
    v5->_routingNumber = (NSString *)v12;

    uint64_t v14 = [v4 PKStringForKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v14;

    v16 = [v4 PKStringForKey:@"status"];
    v5->_status = PKAccountPaymentFundingSourceStatusFromString(v16);

    v17 = [v4 PKDictionaryForKey:@"verification"];
    if ([v17 count])
    {
      v18 = [[PKAccountFundingSourceVerification alloc] initWithDictionary:v17];
      verificationDetails = v5->_verificationDetails;
      v5->_verificationDetails = v18;
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKAccountPaymentFundingDetailsBankAccount allocWithZone:](PKAccountPaymentFundingDetailsBankAccount, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_accountNumber copyWithZone:a3];
  accountNumber = v5->_accountNumber;
  v5->_accountNumber = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_routingNumber copyWithZone:a3];
  routingNumber = v5->_routingNumber;
  v5->_routingNumber = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_name copyWithZone:a3];
  name = v5->_name;
  v5->_name = (NSString *)v12;

  v5->_status = self->_status;
  uint64_t v14 = [(PKAccountFundingSourceVerification *)self->_verificationDetails copyWithZone:a3];
  verificationDetails = v5->_verificationDetails;
  v5->_verificationDetails = v14;

  return v5;
}

- (id)fundingDetailsUnencryptedDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_accountIdentifier forKeyedSubscript:@"accountId"];
  id v4 = [(NSString *)self->_accountNumber pk_zString];
  [v3 setObject:v4 forKeyedSubscript:@"accountNumber"];

  v5 = [(NSString *)self->_routingNumber pk_zString];
  [v3 setObject:v5 forKeyedSubscript:@"routingNumber"];

  [v3 setObject:self->_name forKeyedSubscript:@"name"];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_status];
  [v3 setObject:v6 forKeyedSubscript:@"status"];

  v7 = (void *)[v3 copy];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPaymentFundingDetailsBankAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKAccountPaymentFundingDetailsBankAccount;
  v5 = [(PKAccountPaymentFundingDetails *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountId"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountNumber"];
    uint64_t v9 = objc_msgSend(v8, "pk_zString");
    accountNumber = v5->_accountNumber;
    v5->_accountNumber = (NSString *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"routingNumber"];
    uint64_t v12 = objc_msgSend(v11, "pk_zString");
    routingNumber = v5->_routingNumber;
    v5->_routingNumber = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v14;

    v5->_status = [v4 decodeIntegerForKey:@"status"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"verification"];
    verificationDetails = v5->_verificationDetails;
    v5->_verificationDetails = (PKAccountFundingSourceVerification *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAccountPaymentFundingDetailsBankAccount;
  id v4 = a3;
  [(PKAccountPaymentFundingDetails *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_accountIdentifier, @"accountId", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_accountNumber forKey:@"accountNumber"];
  [v4 encodeObject:self->_routingNumber forKey:@"routingNumber"];
  [v4 encodeObject:self->_name forKey:@"name"];
  [v4 encodeInteger:self->_status forKey:@"status"];
  [v4 encodeObject:self->_verificationDetails forKey:@"verification"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_17;
  }
  v15.receiver = self;
  v15.super_class = (Class)PKAccountPaymentFundingDetailsBankAccount;
  if (![(PKAccountPaymentFundingDetails *)&v15 isEqual:v4]) {
    goto LABEL_17;
  }
  accountIdentifier = self->_accountIdentifier;
  uint64_t v6 = (NSString *)v4[3];
  if (accountIdentifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (accountIdentifier != v6) {
      goto LABEL_17;
    }
  }
  else if ((-[NSString isEqual:](accountIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_17;
  }
  verificationDetails = self->_verificationDetails;
  uint64_t v9 = (PKAccountFundingSourceVerification *)v4[8];
  if (verificationDetails) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    if (-[PKAccountFundingSourceVerification isEqual:](verificationDetails, "isEqual:")) {
      goto LABEL_20;
    }
LABEL_17:
    char v11 = 0;
    goto LABEL_18;
  }
  if (verificationDetails != v9) {
    goto LABEL_17;
  }
LABEL_20:
  name = self->_name;
  uint64_t v14 = (NSString *)v4[6];
  if (name && v14) {
    char v11 = -[NSString isEqual:](name, "isEqual:");
  }
  else {
    char v11 = name == v14;
  }
LABEL_18:

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_accountIdentifier];
  [v3 safelyAddObject:self->_name];
  v7.receiver = self;
  v7.super_class = (Class)PKAccountPaymentFundingDetailsBankAccount;
  id v4 = [(PKAccountPaymentFundingDetailsBankAccount *)&v7 hash];
  unint64_t v5 = PKCombinedHash((uint64_t)v4, v3);

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  if (self->_accountNumber) {
    [v3 appendFormat:@"accountNumber: %@; ", @"<redacted>"];
  }
  if (self->_routingNumber) {
    [v3 appendFormat:@"routingNumber: %@; ", @"<redacted>"];
  }
  [v3 appendFormat:@"name: '%@'; ", self->_name];
  unint64_t status = self->_status;
  if (status > 2) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = off_1E56F1260[status];
  }
  [v3 appendFormat:@"status: '%@'; ", v5];
  [v3 appendFormat:@"verificationDetails: %@; ", self->_verificationDetails];
  [v3 appendFormat:@">"];
  return v3;
}

- (void)setAccountNumber:(id)a3
{
  objc_msgSend(a3, "pk_zString");
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  accountNumber = self->_accountNumber;
  self->_accountNumber = v4;
}

- (void)setRoutingNumber:(id)a3
{
  objc_msgSend(a3, "pk_zString");
  id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  routingNumber = self->_routingNumber;
  self->_routingNumber = v4;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (NSString)routingNumber
{
  return self->_routingNumber;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_unint64_t status = a3;
}

- (PKAccountFundingSourceVerification)verificationDetails
{
  return self->_verificationDetails;
}

- (void)setVerificationDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationDetails, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_routingNumber, 0);
  objc_storeStrong((id *)&self->_accountNumber, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end