@interface PKTransactionReleasedDataApplication
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToReleasedDataApplication:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)usageDescription;
- (PKTransactionReleasedDataApplication)initWithCoder:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)client;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setClient:(unint64_t)a3;
- (void)setUsageDescription:(id)a3;
@end

@implementation PKTransactionReleasedDataApplication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t client = self->_client;
  id v5 = a3;
  [v5 encodeInteger:client forKey:@"client"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeObject:self->_usageDescription forKey:@"usageDescription"];
}

- (PKTransactionReleasedDataApplication)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTransactionReleasedDataApplication;
  id v5 = [(PKTransactionReleasedDataApplication *)&v11 init];
  if (v5)
  {
    v5->_unint64_t client = [v4 decodeIntegerForKey:@"client"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usageDescription"];
    usageDescription = v5->_usageDescription;
    v5->_usageDescription = (NSString *)v8;
  }
  return v5;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_bundleIdentifier];
  [v3 safelyAddObject:self->_usageDescription];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_client - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PKTransactionReleasedDataApplication *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKTransactionReleasedDataApplication *)self isEqualToReleasedDataApplication:v5];

  return v6;
}

- (BOOL)isEqualToReleasedDataApplication:(id)a3
{
  uint64_t v4 = a3;
  if (self->_client != v4[1]) {
    goto LABEL_8;
  }
  bundleIdentifier = self->_bundleIdentifier;
  BOOL v6 = (NSString *)v4[2];
  if (bundleIdentifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[NSString isEqual:](bundleIdentifier, "isEqual:")) {
      goto LABEL_11;
    }
LABEL_8:
    char v8 = 0;
    goto LABEL_9;
  }
  if (bundleIdentifier != v6) {
    goto LABEL_8;
  }
LABEL_11:
  usageDescription = self->_usageDescription;
  objc_super v11 = (NSString *)v4[3];
  if (usageDescription && v11) {
    char v8 = -[NSString isEqual:](usageDescription, "isEqual:");
  }
  else {
    char v8 = usageDescription == v11;
  }
LABEL_9:

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"client: '%lu'; ", self->_client);
  uint64_t v4 = [(NSString *)self->_bundleIdentifier description];
  [v3 appendFormat:@"bundleIdentifier: '%@'; ", v4];

  unint64_t v5 = [(NSString *)self->_usageDescription description];
  [v3 appendFormat:@"usageDescription: '%@'; ", v5];

  [v3 appendFormat:@">"];
  return v3;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:self->_client];
  unint64_t v5 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"client", self->_bundleIdentifier, @"bundleIdentifier", self->_usageDescription, @"usageDescription", 0);

  return v5;
}

- (unint64_t)client
{
  return self->_client;
}

- (void)setClient:(unint64_t)a3
{
  self->_unint64_t client = a3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)usageDescription
{
  return self->_usageDescription;
}

- (void)setUsageDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageDescription, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end