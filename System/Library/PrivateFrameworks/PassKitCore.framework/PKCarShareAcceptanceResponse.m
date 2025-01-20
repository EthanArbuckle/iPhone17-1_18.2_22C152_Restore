@interface PKCarShareAcceptanceResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCarShareAcceptanceResponse:(id)a3;
- (NSString)passUniqueIdentifier;
- (PKAppletSubcredential)subcredential;
- (PKCarShareAcceptanceResponse)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPassUniqueIdentifier:(id)a3;
- (void)setSubcredential:(id)a3;
@end

@implementation PKCarShareAcceptanceResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCarShareAcceptanceResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKCarShareAcceptanceResponse;
  v5 = [(PKCarShareAcceptanceResponse *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subcredential"];
    subcredential = v5->_subcredential;
    v5->_subcredential = (PKAppletSubcredential *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueIdentifier"];
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  subcredential = self->_subcredential;
  id v5 = a3;
  [v5 encodeObject:subcredential forKey:@"subcredential"];
  [v5 encodeObject:self->_passUniqueIdentifier forKey:@"passUniqueIdentifier"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"subcredential: '%@'; ", self->_subcredential];
  [v6 appendFormat:@"passUniqueIdentifier: '%@'; ", self->_passUniqueIdentifier];
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_subcredential];
  [v3 safelyAddObject:self->_passUniqueIdentifier];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKCarShareAcceptanceResponse *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKCarShareAcceptanceResponse *)self isEqualToCarShareAcceptanceResponse:v5];

  return v6;
}

- (BOOL)isEqualToCarShareAcceptanceResponse:(id)a3
{
  unint64_t v4 = a3;
  if (!v4) {
    goto LABEL_8;
  }
  subcredential = self->_subcredential;
  BOOL v6 = (PKAppletSubcredential *)v4[1];
  if (subcredential) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[PKAppletSubcredential isEqual:](subcredential, "isEqual:")) {
      goto LABEL_11;
    }
LABEL_8:
    char v8 = 0;
    goto LABEL_9;
  }
  if (subcredential != v6) {
    goto LABEL_8;
  }
LABEL_11:
  passUniqueIdentifier = self->_passUniqueIdentifier;
  objc_super v11 = (NSString *)v4[2];
  if (passUniqueIdentifier && v11) {
    char v8 = -[NSString isEqual:](passUniqueIdentifier, "isEqual:");
  }
  else {
    char v8 = passUniqueIdentifier == v11;
  }
LABEL_9:

  return v8;
}

- (PKAppletSubcredential)subcredential
{
  return self->_subcredential;
}

- (void)setSubcredential:(id)a3
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
  objc_storeStrong((id *)&self->_subcredential, 0);
}

@end