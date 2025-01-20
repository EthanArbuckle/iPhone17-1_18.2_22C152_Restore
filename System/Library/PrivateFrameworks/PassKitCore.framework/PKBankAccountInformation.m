@interface PKBankAccountInformation
+ (BOOL)supportsSecureCoding;
+ (Class)_classForType:(int64_t)a3;
- (BOOL)isValid;
- (NSString)accountNumber;
- (NSString)bankName;
- (NSString)identifier;
- (NSString)routingNumber;
- (PKBankAccountInformation)init;
- (PKBankAccountInformation)initWithCoder:(id)a3;
- (PKBankAccountInformation)initWithType:(int64_t)a3;
- (id)accountSuffix;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)maskedAccountNumber;
- (int64_t)type;
- (unint64_t)status;
- (void)_commonDeleteAllBankInformation;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountNumber:(id)a3;
- (void)setBankName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRoutingNumber:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKBankAccountInformation

- (PKBankAccountInformation)init
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = [(PKBankAccountInformation *)self initWithType:0];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKBankAccountInformation;
    v4 = [(PKBankAccountInformation *)&v7 init];
  }
  v5 = v4;

  return v5;
}

- (PKBankAccountInformation)initWithType:(int64_t)a3
{
  v4 = (PKBankAccountInformation *)objc_alloc_init((Class)[(id)objc_opt_class() _classForType:a3]);

  return v4;
}

+ (Class)_classForType:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_opt_class();
  }
  return (Class)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKBankAccountInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if ([v4 containsValueForKey:@"type"]) {
      uint64_t v17 = [v4 decodeIntegerForKey:@"type"];
    }
    else {
      uint64_t v17 = 0;
    }
    v6 = (PKBankAccountInformation *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_classForType:", v17)), "initWithCoder:", v4);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)PKBankAccountInformation;
    v6 = [(PKBankAccountInformation *)&v19 init];
    if (v6)
    {
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bankName"];
      bankName = v6->_bankName;
      v6->_bankName = (NSString *)v7;

      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountNumber"];
      uint64_t v10 = objc_msgSend(v9, "pk_zString");
      accountNumber = v6->_accountNumber;
      v6->_accountNumber = (NSString *)v10;

      v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"routingNumber"];
      uint64_t v13 = objc_msgSend(v12, "pk_zString");
      routingNumber = v6->_routingNumber;
      v6->_routingNumber = (NSString *)v13;

      uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
      identifier = v6->_identifier;
      v6->_identifier = (NSString *)v15;

      v6->_status = [v4 decodeIntegerForKey:@"status"];
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  bankName = self->_bankName;
  id v6 = a3;
  [v6 encodeObject:bankName forKey:@"bankName"];
  [v6 encodeObject:self->_routingNumber forKey:@"routingNumber"];
  [v6 encodeObject:self->_accountNumber forKey:@"accountNumber"];
  [v6 encodeObject:self->_identifier forKey:@"identifier"];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[PKBankAccountInformation type](self, "type"));
  [v6 encodeObject:v5 forKey:@"type"];

  [v6 encodeInteger:self->_status forKey:@"status"];
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

- (void)_commonDeleteAllBankInformation
{
  bankName = self->_bankName;
  self->_bankName = 0;

  accountNumber = self->_accountNumber;
  self->_accountNumber = 0;

  routingNumber = self->_routingNumber;
  self->_routingNumber = 0;

  identifier = self->_identifier;
  self->_identifier = 0;

  self->_status = 0;
}

- (BOOL)isValid
{
  int64_t type = self->_type;
  if (type == 2)
  {
LABEL_4:
    if ([(NSString *)self->_bankName length] && [(NSString *)self->_accountNumber length])
    {
      uint64_t v5 = 16;
      return [*(id *)((char *)&self->super.isa + v5) length] != 0;
    }
    return 0;
  }
  if (type != 1)
  {
    if (type) {
      return v2;
    }
    goto LABEL_4;
  }
  if (![(NSString *)self->_bankName length]
    || ![(NSString *)self->_accountNumber length]
    || ![(NSString *)self->_routingNumber length])
  {
    uint64_t v5 = 32;
    return [*(id *)((char *)&self->super.isa + v5) length] != 0;
  }
  return 1;
}

- (id)accountSuffix
{
  uint64_t v3 = self->_accountNumber;
  id v4 = v3;
  if (v3 && [(NSString *)v3 length] >= 5)
  {
    [(NSString *)self->_accountNumber length];
    uint64_t v5 = objc_msgSend(v4, "substringWithRange:");

    id v4 = (void *)v5;
  }
  return v4;
}

- (id)maskedAccountNumber
{
  uint64_t v3 = NSString;
  id v4 = PKPANMask();
  uint64_t v5 = [(PKBankAccountInformation *)self accountSuffix];
  id v6 = [v3 stringWithFormat:@"(%@ %@)", v4, v5];

  return v6;
}

- (int64_t)type
{
  return 0;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@"bankName: '%@'; ", self->_bankName];
  [v3 appendFormat:@"accountNumber: '%@'; ", self->_accountNumber];
  [v3 appendFormat:@"routingNumber: '%@'; ", self->_routingNumber];
  id v4 = PKAccountPaymentFundingSourceStatusToString(self->_status);
  [v3 appendFormat:@"status: '%@'; ", v4];

  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_bankName copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_accountNumber copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  uint64_t v12 = [(NSString *)self->_routingNumber copyWithZone:a3];
  uint64_t v13 = (void *)v5[2];
  v5[2] = v12;

  v5[5] = self->_status;
  return v5;
}

- (NSString)accountNumber
{
  return self->_accountNumber;
}

- (NSString)routingNumber
{
  return self->_routingNumber;
}

- (NSString)bankName
{
  return self->_bankName;
}

- (void)setBankName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bankName, 0);
  objc_storeStrong((id *)&self->_routingNumber, 0);
  objc_storeStrong((id *)&self->_accountNumber, 0);
}

@end