@interface PKPayLaterLastUsedFundingSource
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPayLaterLastUsedFundingSource:(id)a3;
- (NSString)identifier;
- (PKPayLaterLastUsedFundingSource)initWithCoder:(id)a3;
- (PKPayLaterLastUsedFundingSource)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPayLaterLastUsedFundingSource

- (PKPayLaterLastUsedFundingSource)initWithDictionary:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterLastUsedFundingSource;
  v5 = [(PKPayLaterLastUsedFundingSource *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"type"];
    v9 = (void *)v8;
    if (v8)
    {
      v13[0] = v8;
      v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      v5->_type = PKPayLaterFundingSourcePaymentTypeFromStrings(v10);
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPayLaterLastUsedFundingSource *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPayLaterLastUsedFundingSource *)self isEqualToPayLaterLastUsedFundingSource:v5];

  return v6;
}

- (BOOL)isEqualToPayLaterLastUsedFundingSource:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  BOOL v6 = (void *)v4[2];
  v7 = self->_identifier;
  uint64_t v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
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
  return SipHash();
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  id v4 = PKPayLaterFundingSourcePaymentTypeToStrings(self->_type);
  [v3 appendFormat:@"type: '%@'; ", v4];

  [v3 appendFormat:@">"];
  return v3;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKeyedSubscript:@"identifier"];
  }
  BOOL v6 = PKPayLaterFundingSourcePaymentTypeToStrings(self->_type);
  [v4 setObject:v6 forKeyedSubscript:@"type"];

  v7 = (void *)[v4 copy];
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterLastUsedFundingSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterLastUsedFundingSource;
  v5 = [(PKPayLaterLastUsedFundingSource *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_type forKey:@"type"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPayLaterLastUsedFundingSource allocWithZone:](PKPayLaterLastUsedFundingSource, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_type = self->_type;
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end