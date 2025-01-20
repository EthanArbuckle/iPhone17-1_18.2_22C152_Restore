@interface PDPassUpdateContext
+ (BOOL)supportsSecureCoding;
- (NSData)manifestHash;
- (NSDate)lastModifiedDate;
- (NSString)authenticationToken;
- (NSString)lastModifiedTag;
- (NSString)passUniqueIdentifier;
- (NSString)serialNumber;
- (PDPassUpdateContext)initWithCoder:(id)a3;
- (int64_t)lastModifiedSource;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationToken:(id)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setLastModifiedSource:(int64_t)a3;
- (void)setLastModifiedTag:(id)a3;
- (void)setManifestHash:(id)a3;
- (void)setPassUniqueIdentifier:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation PDPassUpdateContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDPassUpdateContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PDPassUpdateContext;
  v5 = [(PDPassUpdateContext *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueIdentifier"];
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationToken"];
    authenticationToken = v5->_authenticationToken;
    v5->_authenticationToken = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manifestHash"];
    manifestHash = v5->_manifestHash;
    v5->_manifestHash = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastModifiedTag"];
    lastModifiedTag = v5->_lastModifiedTag;
    v5->_lastModifiedTag = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastModifiedDate"];
    lastModifiedDate = v5->_lastModifiedDate;
    v5->_lastModifiedDate = (NSDate *)v16;

    v5->_lastModifiedSource = (int64_t)[v4 decodeIntegerForKey:@"lastModifiedSource"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  passUniqueIdentifier = self->_passUniqueIdentifier;
  id v5 = a3;
  [v5 encodeObject:passUniqueIdentifier forKey:@"passUniqueIdentifier"];
  [v5 encodeObject:self->_serialNumber forKey:@"serialNumber"];
  [v5 encodeObject:self->_authenticationToken forKey:@"authenticationToken"];
  [v5 encodeObject:self->_manifestHash forKey:@"manifestHash"];
  [v5 encodeObject:self->_lastModifiedTag forKey:@"lastModifiedTag"];
  [v5 encodeObject:self->_lastModifiedDate forKey:@"lastModifiedDate"];
  [v5 encodeInteger:self->_lastModifiedSource forKey:@"lastModifiedSource"];
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
}

- (NSString)lastModifiedTag
{
  return self->_lastModifiedTag;
}

- (void)setLastModifiedTag:(id)a3
{
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
}

- (int64_t)lastModifiedSource
{
  return self->_lastModifiedSource;
}

- (void)setLastModifiedSource:(int64_t)a3
{
  self->_lastModifiedSource = a3;
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (void)setManifestHash:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedTag, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end