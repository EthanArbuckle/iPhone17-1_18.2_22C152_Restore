@interface PKPayLaterFundingSourceBankDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDetails:(id)a3;
- (NSString)accountNumberSuffix;
- (NSString)bankName;
- (NSString)description;
- (NSString)identifier;
- (PKPayLaterFundingSourceBankDetails)initWithAccountFundingSource:(id)a3;
- (PKPayLaterFundingSourceBankDetails)initWithCoder:(id)a3;
- (PKPayLaterFundingSourceBankDetails)initWithDictionary:(id)a3 type:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountNumberSuffix:(id)a3;
- (void)setBankName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPayLaterFundingSourceBankDetails

- (PKPayLaterFundingSourceBankDetails)initWithAccountFundingSource:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPayLaterFundingSourceBankDetails;
  v5 = [(PKPayLaterFundingSourceBankDetails *)&v15 init];
  v6 = v5;
  if (v5)
  {
    v5->_type = 2;
    v7 = [v4 bankAccountRepresentation];
    uint64_t v8 = [v7 bankName];
    bankName = v6->_bankName;
    v6->_bankName = (NSString *)v8;

    uint64_t v10 = [v7 identifier];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v10;

    uint64_t v12 = [v7 accountSuffix];
    accountNumberSuffix = v6->_accountNumberSuffix;
    v6->_accountNumberSuffix = (NSString *)v12;
  }
  return v6;
}

- (PKPayLaterFundingSourceBankDetails)initWithDictionary:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterFundingSourceBankDetails;
  v7 = [(PKPayLaterFundingSourceBankDetails *)&v16 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_type = a4;
    uint64_t v9 = [v6 PKStringForKey:@"accountNumberSuffix"];
    accountNumberSuffix = v8->_accountNumberSuffix;
    v8->_accountNumberSuffix = (NSString *)v9;

    uint64_t v11 = [v6 PKStringForKey:@"bankName"];
    bankName = v8->_bankName;
    v8->_bankName = (NSString *)v11;

    uint64_t v13 = [v6 PKStringForKey:@"identifier"];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v13;
  }
  return v8;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_accountNumberSuffix forKeyedSubscript:@"accountNumberSuffix"];
  [v3 setObject:self->_bankName forKeyedSubscript:@"bankName"];
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterFundingSourceBankDetails *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPayLaterFundingSourceBankDetails *)self isEqualToDetails:v5];

  return v6;
}

- (BOOL)isEqualToDetails:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_20;
  }
  BOOL v6 = (void *)v4[2];
  v7 = self->_accountNumberSuffix;
  uint64_t v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    uint64_t v9 = v8;
    if (!v7 || !v8) {
      goto LABEL_19;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_20;
    }
  }
  uint64_t v11 = (void *)v5[3];
  v7 = self->_bankName;
  uint64_t v12 = v11;
  if (v7 == v12)
  {

    goto LABEL_14;
  }
  uint64_t v9 = v12;
  if (!v7 || !v12)
  {
LABEL_19:

    goto LABEL_20;
  }
  BOOL v13 = [(NSString *)v7 isEqualToString:v12];

  if (!v13) {
    goto LABEL_20;
  }
LABEL_14:
  v14 = (void *)v5[4];
  v7 = self->_identifier;
  objc_super v15 = v14;
  if (v7 == v15)
  {

LABEL_23:
    BOOL v17 = self->_type == v5[1];
    goto LABEL_21;
  }
  uint64_t v9 = v15;
  if (!v7 || !v15) {
    goto LABEL_19;
  }
  BOOL v16 = [(NSString *)v7 isEqualToString:v15];

  if (v16) {
    goto LABEL_23;
  }
LABEL_20:
  BOOL v17 = 0;
LABEL_21:

  return v17;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_accountNumberSuffix];
  [v3 safelyAddObject:self->_bankName];
  [v3 safelyAddObject:self->_identifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"accountNumberSuffix: '%@'; ", self->_accountNumberSuffix];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFundingSourceBankDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPayLaterFundingSourceBankDetails;
  unint64_t v5 = [(PKPayLaterFundingSourceBankDetails *)&v13 init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountNumberSuffix"];
    accountNumberSuffix = v5->_accountNumberSuffix;
    v5->_accountNumberSuffix = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bankName"];
    bankName = v5->_bankName;
    v5->_bankName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_accountNumberSuffix forKey:@"accountNumberSuffix"];
  [v5 encodeObject:self->_bankName forKey:@"bankName"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterFundingSourceBankDetails allocWithZone:](PKPayLaterFundingSourceBankDetails, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_accountNumberSuffix copyWithZone:a3];
  accountNumberSuffix = v5->_accountNumberSuffix;
  v5->_accountNumberSuffix = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_bankName copyWithZone:a3];
  bankName = v5->_bankName;
  v5->_bankName = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v10;

  v5->_unint64_t type = self->_type;
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSString)accountNumberSuffix
{
  return self->_accountNumberSuffix;
}

- (void)setAccountNumberSuffix:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_bankName, 0);
  objc_storeStrong((id *)&self->_accountNumberSuffix, 0);
}

@end