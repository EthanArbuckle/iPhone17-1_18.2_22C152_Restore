@interface PKFeatureFailure
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)errorCode;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (NSString)serverDescription;
- (PKFeatureFailure)initWithCoder:(id)a3;
- (PKFeatureFailure)initWithDictionary:(id)a3;
- (id)description;
- (id)errorRepresentation;
- (unint64_t)featureIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKFeatureFailure

- (PKFeatureFailure)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKFeatureFailure;
  v5 = [(PKFeatureFailure *)&v18 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"featureIdentifier"];
    v5->_featureIdentifier = PKFeatureIdentifierFromString(v6);

    v7 = [v4 PKStringForKey:@"errorCode"];
    v8 = v7;
    if (v7) {
      objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "integerValue"));
    }
    else {
    uint64_t v9 = [v4 PKNumberForKey:@"errorCode"];
    }
    errorCode = v5->_errorCode;
    v5->_errorCode = (NSNumber *)v9;

    uint64_t v11 = [v4 PKStringForKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v11;

    uint64_t v13 = [v4 PKStringForKey:@"localizedDescription"];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v13;

    uint64_t v15 = [v4 PKStringForKey:@"debugDescription"];
    serverDescription = v5->_serverDescription;
    v5->_serverDescription = (NSString *)v15;
  }
  return v5;
}

- (id)errorRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  localizedTitle = self->_localizedTitle;
  if (localizedTitle) {
    [v3 setObject:localizedTitle forKey:*MEMORY[0x1E4F28568]];
  }
  localizedDescription = self->_localizedDescription;
  if (localizedDescription) {
    [v4 setObject:localizedDescription forKey:*MEMORY[0x1E4F28588]];
  }
  id v7 = objc_alloc(MEMORY[0x1E4F28C58]);
  NSInteger v8 = [(NSNumber *)self->_errorCode integerValue];
  uint64_t v9 = (void *)[v4 copy];
  v10 = (void *)[v7 initWithDomain:@"PKAccountErrorDomain" code:v8 userInfo:v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFeatureFailure)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKFeatureFailure;
  v5 = [(PKFeatureFailure *)&v15 init];
  if (v5)
  {
    v5->_featureIdentifier = [v4 decodeIntegerForKey:@"featureIdentifier"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorCode"];
    errorCode = v5->_errorCode;
    v5->_errorCode = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverDescription"];
    serverDescription = v5->_serverDescription;
    v5->_serverDescription = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t featureIdentifier = self->_featureIdentifier;
  id v5 = a3;
  [v5 encodeInteger:featureIdentifier forKey:@"featureIdentifier"];
  [v5 encodeObject:self->_errorCode forKey:@"errorCode"];
  [v5 encodeObject:self->_localizedTitle forKey:@"localizedTitle"];
  [v5 encodeObject:self->_localizedDescription forKey:@"localizedDescription"];
  [v5 encodeObject:self->_serverDescription forKey:@"serverDescription"];
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_errorCode];
  [v3 safelyAddObject:self->_localizedTitle];
  [v3 safelyAddObject:self->_localizedDescription];
  [v3 safelyAddObject:self->_serverDescription];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_featureIdentifier - v4 + 32 * v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 0;
  }
  uint64_t v6 = v5;
  id v7 = v6;
  if (!v6 || self->_featureIdentifier != v6[1]) {
    goto LABEL_23;
  }
  errorCode = self->_errorCode;
  uint64_t v9 = (NSNumber *)v7[2];
  if (errorCode && v9)
  {
    if ((-[NSNumber isEqual:](errorCode, "isEqual:") & 1) == 0) {
      goto LABEL_23;
    }
  }
  else if (errorCode != v9)
  {
    goto LABEL_23;
  }
  localizedTitle = self->_localizedTitle;
  uint64_t v11 = (NSString *)v7[3];
  if (localizedTitle && v11)
  {
    if ((-[NSString isEqual:](localizedTitle, "isEqual:") & 1) == 0) {
      goto LABEL_23;
    }
  }
  else if (localizedTitle != v11)
  {
    goto LABEL_23;
  }
  localizedDescription = self->_localizedDescription;
  uint64_t v13 = (NSString *)v7[4];
  if (!localizedDescription || !v13)
  {
    if (localizedDescription == v13) {
      goto LABEL_19;
    }
LABEL_23:
    char v16 = 0;
    goto LABEL_24;
  }
  if ((-[NSString isEqual:](localizedDescription, "isEqual:") & 1) == 0) {
    goto LABEL_23;
  }
LABEL_19:
  serverDescription = self->_serverDescription;
  objc_super v15 = (NSString *)v7[5];
  if (serverDescription && v15) {
    char v16 = -[NSString isEqual:](serverDescription, "isEqual:");
  }
  else {
    char v16 = serverDescription == v15;
  }
LABEL_24:

  return v16;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = PKFeatureIdentifierToString(self->_featureIdentifier);
  [v3 appendFormat:@"featureIdentifier: '%@'; ", v4];

  [v3 appendFormat:@"errorCode: '%@'; ", self->_errorCode];
  [v3 appendFormat:@"localizedTitle: '%@'; ", self->_localizedTitle];
  [v3 appendFormat:@"localizedDescription: '%@'; ", self->_localizedDescription];
  [v3 appendFormat:@"serverDescription: '%@'; ", self->_serverDescription];
  [v3 appendFormat:@">"];
  unint64_t v5 = (void *)[v3 copy];

  return v5;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSString)serverDescription
{
  return self->_serverDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverDescription, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
}

@end