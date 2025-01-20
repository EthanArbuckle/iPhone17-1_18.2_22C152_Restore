@interface PKCrossPlatformShareURL
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCrossPlatformShareURL:(id)a3;
- (NSString)expectedPairedReaderIdentifier;
- (NSString)expectedProvisioningCredentialHash;
- (NSURL)url;
- (PKCrossPlatformShareURL)initWithCoder:(id)a3;
- (PKCrossPlatformShareURL)initWithURL:(id)a3 expectedPairedReaderIdentifier:(id)a4 expectedProvisioningCredentialHash:(id)a5;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKCrossPlatformShareURL

- (PKCrossPlatformShareURL)initWithURL:(id)a3 expectedPairedReaderIdentifier:(id)a4 expectedProvisioningCredentialHash:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKCrossPlatformShareURL;
  v12 = [(PKCrossPlatformShareURL *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    if (!v10 || !v11)
    {
      objc_storeStrong((id *)&v13->_expectedPairedReaderIdentifier, a4);
      objc_storeStrong((id *)&v13->_expectedProvisioningCredentialHash, a5);
    }
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCrossPlatformShareURL)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKCrossPlatformShareURL;
  v5 = [(PKCrossPlatformShareURL *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expectedPairedReaderIdentifier"];
    expectedPairedReaderIdentifier = v5->_expectedPairedReaderIdentifier;
    v5->_expectedPairedReaderIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expectedProvisioningCredentialHash"];
    expectedProvisioningCredentialHash = v5->_expectedProvisioningCredentialHash;
    v5->_expectedProvisioningCredentialHash = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v5 = a3;
  [v5 encodeObject:url forKey:@"url"];
  [v5 encodeObject:self->_expectedPairedReaderIdentifier forKey:@"expectedPairedReaderIdentifier"];
  [v5 encodeObject:self->_expectedProvisioningCredentialHash forKey:@"expectedProvisioningCredentialHash"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"url: '%@'; ", self->_url];
  objc_msgSend(v6, "appendFormat:", @"expectedPairedReaderIdentifier: '%@'; ",
    self->_expectedPairedReaderIdentifier);
  objc_msgSend(v6, "appendFormat:", @"expectedProvisioningCredentialHash: '%@'; ",
    self->_expectedProvisioningCredentialHash);
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_url) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_expectedPairedReaderIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_expectedProvisioningCredentialHash) {
    objc_msgSend(v4, "addObject:");
  }
  unint64_t v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKCrossPlatformShareURL *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKCrossPlatformShareURL *)self isEqualToCrossPlatformShareURL:v5];

  return v6;
}

- (BOOL)isEqualToCrossPlatformShareURL:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_17;
  }
  url = self->_url;
  BOOL v6 = (NSURL *)v4[1];
  if (url) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (url != v6) {
      goto LABEL_17;
    }
  }
  else if ((-[NSURL isEqual:](url, "isEqual:") & 1) == 0)
  {
    goto LABEL_17;
  }
  expectedPairedReaderIdentifier = self->_expectedPairedReaderIdentifier;
  id v9 = (NSString *)v4[2];
  if (!expectedPairedReaderIdentifier || !v9)
  {
    if (expectedPairedReaderIdentifier == v9) {
      goto LABEL_13;
    }
LABEL_17:
    char v12 = 0;
    goto LABEL_18;
  }
  if ((-[NSString isEqual:](expectedPairedReaderIdentifier, "isEqual:") & 1) == 0) {
    goto LABEL_17;
  }
LABEL_13:
  expectedProvisioningCredentialHash = self->_expectedProvisioningCredentialHash;
  id v11 = (NSString *)v4[3];
  if (expectedProvisioningCredentialHash && v11) {
    char v12 = -[NSString isEqual:](expectedProvisioningCredentialHash, "isEqual:");
  }
  else {
    char v12 = expectedProvisioningCredentialHash == v11;
  }
LABEL_18:

  return v12;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)expectedPairedReaderIdentifier
{
  return self->_expectedPairedReaderIdentifier;
}

- (NSString)expectedProvisioningCredentialHash
{
  return self->_expectedProvisioningCredentialHash;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedProvisioningCredentialHash, 0);
  objc_storeStrong((id *)&self->_expectedPairedReaderIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end