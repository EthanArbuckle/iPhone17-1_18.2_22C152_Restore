@interface PKPayLaterFundingSourceAccountDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDetails:(id)a3;
- (NSString)accountIdentifier;
- (NSString)description;
- (PKPayLaterFundingSourceAccountDetails)initWithCoder:(id)a3;
- (PKPayLaterFundingSourceAccountDetails)initWithDictionary:(id)a3 type:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKPayLaterFundingSourceAccountDetails

- (PKPayLaterFundingSourceAccountDetails)initWithDictionary:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterFundingSourceAccountDetails;
  v7 = [(PKPayLaterFundingSourceAccountDetails *)&v12 init];
  v8 = v7;
  if (v7)
  {
    [(PKPayLaterFundingSourceAccountDetails *)v7 setType:a4];
    uint64_t v9 = [v6 PKStringForKey:@"accountIdentifier"];
    accountIdentifier = v8->_accountIdentifier;
    v8->_accountIdentifier = (NSString *)v9;
  }
  return v8;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_accountIdentifier forKeyedSubscript:@"accountIdentifier"];
  v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPayLaterFundingSourceAccountDetails *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPayLaterFundingSourceAccountDetails *)self isEqualToDetails:v5];

  return v6;
}

- (BOOL)isEqualToDetails:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  BOOL v6 = (void *)v4[2];
  v7 = self->_accountIdentifier;
  v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    uint64_t v9 = v8;
    if (!v7 || !v8)
    {

LABEL_10:
      BOOL v11 = 0;
      goto LABEL_11;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_10;
    }
  }
  BOOL v11 = self->_type == v5[1];
LABEL_11:

  return v11;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_accountIdentifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"accountIdentifier: '%@'; ", self->_accountIdentifier];
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterFundingSourceAccountDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterFundingSourceAccountDetails;
  unint64_t v5 = [(PKPayLaterFundingSourceAccountDetails *)&v9 init];
  if (v5)
  {
    -[PKPayLaterFundingSourceAccountDetails setType:](v5, "setType:", [v4 decodeIntegerForKey:@"type"]);
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterFundingSourceAccountDetails allocWithZone:](PKPayLaterFundingSourceAccountDetails, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_accountIdentifier copyWithZone:a3];
  accountIdentifier = v5->_accountIdentifier;
  v5->_accountIdentifier = (NSString *)v6;

  [(PKPayLaterFundingSourceAccountDetails *)v5 setType:self->_type];
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

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end