@interface PKIssuerBindingData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToIssuerBindingData:(id)a3;
- (NSData)createdKeyHash;
- (NSData)signedData;
- (NSString)sessionIdentifier;
- (NSURL)callbackURL;
- (PKIssuerBindingData)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCallbackURL:(id)a3;
- (void)setCreatedKeyHash:(id)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setSignedData:(id)a3;
@end

@implementation PKIssuerBindingData

- (PKIssuerBindingData)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKIssuerBindingData;
  v5 = [(PKIssuerBindingData *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionIdentifier"];
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"createdKeyHash"];
    createdKeyHash = v5->_createdKeyHash;
    v5->_createdKeyHash = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signedData"];
    signedData = v5->_signedData;
    v5->_signedData = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callbackURL"];
    callbackURL = v5->_callbackURL;
    v5->_callbackURL = (NSURL *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sessionIdentifier = self->_sessionIdentifier;
  id v5 = a3;
  [v5 encodeObject:sessionIdentifier forKey:@"sessionIdentifier"];
  [v5 encodeObject:self->_createdKeyHash forKey:@"createdKeyHash"];
  [v5 encodeObject:self->_signedData forKey:@"signedData"];
  [v5 encodeObject:self->_callbackURL forKey:@"callbackURL"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"sessionIdentifier: %@; ", self->_sessionIdentifier];
  [v3 appendFormat:@"createdKeyHash: %@; ", self->_createdKeyHash];
  [v3 appendFormat:@"signedData: %@; ", self->_signedData];
  id v4 = [(NSURL *)self->_callbackURL description];
  [v3 appendFormat:@"callbackURL: %@; ", v4];

  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKIssuerBindingData *)a3;
  id v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKIssuerBindingData *)self isEqualToIssuerBindingData:v5];

  return v6;
}

- (BOOL)isEqualToIssuerBindingData:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_21;
  }
  BOOL v6 = (void *)v4[1];
  v7 = self->_sessionIdentifier;
  uint64_t v8 = v6;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

      goto LABEL_21;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_21;
    }
  }
  createdKeyHash = self->_createdKeyHash;
  uint64_t v12 = (NSData *)v5[2];
  if (createdKeyHash && v12)
  {
    if ((-[NSData isEqual:](createdKeyHash, "isEqual:") & 1) == 0) {
      goto LABEL_21;
    }
  }
  else if (createdKeyHash != v12)
  {
    goto LABEL_21;
  }
  signedData = self->_signedData;
  v14 = (NSData *)v5[3];
  if (!signedData || !v14)
  {
    if (signedData == v14) {
      goto LABEL_17;
    }
LABEL_21:
    char v17 = 0;
    goto LABEL_22;
  }
  if ((-[NSData isEqual:](signedData, "isEqual:") & 1) == 0) {
    goto LABEL_21;
  }
LABEL_17:
  callbackURL = self->_callbackURL;
  v16 = (NSURL *)v5[4];
  if (callbackURL && v16) {
    char v17 = -[NSURL isEqual:](callbackURL, "isEqual:");
  }
  else {
    char v17 = callbackURL == v16;
  }
LABEL_22:

  return v17;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_sessionIdentifier];
  [v3 safelyAddObject:self->_createdKeyHash];
  [v3 safelyAddObject:self->_signedData];
  [v3 safelyAddObject:self->_callbackURL];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSData)createdKeyHash
{
  return self->_createdKeyHash;
}

- (void)setCreatedKeyHash:(id)a3
{
}

- (NSData)signedData
{
  return self->_signedData;
}

- (void)setSignedData:(id)a3
{
}

- (NSURL)callbackURL
{
  return self->_callbackURL;
}

- (void)setCallbackURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackURL, 0);
  objc_storeStrong((id *)&self->_signedData, 0);
  objc_storeStrong((id *)&self->_createdKeyHash, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end