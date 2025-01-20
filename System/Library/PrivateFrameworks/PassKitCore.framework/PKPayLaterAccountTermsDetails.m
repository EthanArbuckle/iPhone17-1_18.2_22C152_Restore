@interface PKPayLaterAccountTermsDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)termsAcceptanceRequired;
- (NSString)termsIdentifier;
- (PKPayLaterAccountTermsDetails)initWithCoder:(id)a3;
- (PKPayLaterAccountTermsDetails)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setTermsAcceptanceRequired:(BOOL)a3;
- (void)setTermsIdentifier:(id)a3;
@end

@implementation PKPayLaterAccountTermsDetails

- (PKPayLaterAccountTermsDetails)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterAccountTermsDetails;
  v5 = [(PKPayLaterAccountTermsDetails *)&v9 init];
  if (v5)
  {
    v5->_termsAcceptanceRequired = [v4 PKBoolForKey:@"termsAcceptanceRequired"];
    uint64_t v6 = [v4 PKStringForKey:@"termsIdentifier"];
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPayLaterAccountTermsDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterAccountTermsDetails;
  v5 = [(PKPayLaterAccountTermsDetails *)&v9 init];
  if (v5)
  {
    v5->_termsAcceptanceRequired = [v4 decodeBoolForKey:@"termsAcceptanceRequired"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsIdentifier"];
    termsIdentifier = v5->_termsIdentifier;
    v5->_termsIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL termsAcceptanceRequired = self->_termsAcceptanceRequired;
  id v5 = a3;
  [v5 encodeBool:termsAcceptanceRequired forKey:@"termsAcceptanceRequired"];
  [v5 encodeObject:self->_termsIdentifier forKey:@"termsIdentifier"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  id v5 = (void *)v4[2];
  uint64_t v6 = self->_termsIdentifier;
  v7 = v5;
  if (v6 == v7)
  {
  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

LABEL_10:
      BOOL v10 = 0;
      goto LABEL_11;
    }
    BOOL v9 = [(NSString *)v6 isEqualToString:v7];

    if (!v9) {
      goto LABEL_10;
    }
  }
  BOOL v10 = self->_termsAcceptanceRequired == *((unsigned __int8 *)v4 + 8);
LABEL_11:

  return v10;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_termsIdentifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_termsAcceptanceRequired - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"termsIdentifier: '%@'; ", self->_termsIdentifier];
  if (self->_termsAcceptanceRequired) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  [v3 appendFormat:@"termsAcceptanceRequired: '%@'; ", v4];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKPayLaterAccountTermsDetails allocWithZone:](PKPayLaterAccountTermsDetails, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_termsIdentifier copyWithZone:a3];
  termsIdentifier = v5->_termsIdentifier;
  v5->_termsIdentifier = (NSString *)v6;

  v5->_BOOL termsAcceptanceRequired = self->_termsAcceptanceRequired;
  return v5;
}

- (BOOL)termsAcceptanceRequired
{
  return self->_termsAcceptanceRequired;
}

- (void)setTermsAcceptanceRequired:(BOOL)a3
{
  self->_BOOL termsAcceptanceRequired = a3;
}

- (NSString)termsIdentifier
{
  return self->_termsIdentifier;
}

- (void)setTermsIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end