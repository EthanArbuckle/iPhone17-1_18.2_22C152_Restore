@interface PKSearchPassResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)passUniqueIdentifier;
- (PKSearchPassResult)initWithCoder:(id)a3;
- (unint64_t)hash;
- (unint64_t)tokenType;
- (void)encodeWithCoder:(id)a3;
- (void)setPassUniqueIdentifier:(id)a3;
@end

@implementation PKSearchPassResult

- (unint64_t)tokenType
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (PKSearchPassResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKSearchPassResult *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueIdentifier"];
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v6;
  }
  return v5;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)PKSearchPassResult;
  v3 = [(PKSearchPassResult *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@"passUniqueIdentifier: '%@'; ", self->_passUniqueIdentifier];
  [v4 appendFormat:@">"];
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    passUniqueIdentifier = self->_passUniqueIdentifier;
    objc_super v6 = (NSString *)v4[1];
    if (passUniqueIdentifier && v6) {
      char v7 = -[NSString isEqual:](passUniqueIdentifier, "isEqual:");
    }
    else {
      char v7 = passUniqueIdentifier == v6;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_passUniqueIdentifier];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
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
}

@end