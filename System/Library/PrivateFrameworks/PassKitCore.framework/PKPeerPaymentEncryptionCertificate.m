@interface PKPeerPaymentEncryptionCertificate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)encryptionCertificates;
- (PKPeerPaymentEncryptionCertificate)initWithCoder:(id)a3;
- (PKPeerPaymentEncryptionCertificate)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)certificatesVersion;
- (unint64_t)destination;
- (unint64_t)encryptionScheme;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCertificatesVersion:(int64_t)a3;
- (void)setDestination:(unint64_t)a3;
- (void)setEncryptionCertificates:(id)a3;
- (void)setEncryptionScheme:(unint64_t)a3;
@end

@implementation PKPeerPaymentEncryptionCertificate

- (PKPeerPaymentEncryptionCertificate)initWithDictionary:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPeerPaymentEncryptionCertificate;
  v5 = [(PKPeerPaymentEncryptionCertificate *)&v17 init];
  if (v5)
  {
    v6 = [v4 PKStringForKey:@"destination"];
    v5->_destination = PKPeerPaymentEncryptionCertificateDestinationFromString(v6);

    v7 = [v4 PKStringForKey:@"encryptionVersion"];
    v5->_encryptionScheme = PKPrivacyEncryptionSchemeFromString(v7);

    v8 = [v4 PKNumberForKey:@"certificatesVersion"];
    v5->_certificatesVersion = [v8 integerValue];

    v9 = [v4 PKArrayContaining:objc_opt_class() forKey:@"encryptionCertificates"];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__PKPeerPaymentEncryptionCertificate_initWithDictionary___block_invoke;
    v15[3] = &unk_1E56DFFB0;
    id v16 = v10;
    id v11 = v10;
    [v9 enumerateObjectsUsingBlock:v15];
    uint64_t v12 = [v11 copy];
    encryptionCertificates = v5->_encryptionCertificates;
    v5->_encryptionCertificates = (NSArray *)v12;
  }
  return v5;
}

void __57__PKPeerPaymentEncryptionCertificate_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithBase64EncodedString:v4 options:0];

  [*(id *)(a1 + 32) safelyAddObject:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentEncryptionCertificate)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentEncryptionCertificate;
  id v5 = [(PKPeerPaymentEncryptionCertificate *)&v12 init];
  if (v5)
  {
    v5->_destination = [v4 decodeIntegerForKey:@"destination"];
    v5->_encryptionScheme = [v4 decodeIntegerForKey:@"encryptionVersion"];
    v5->_certificatesVersion = [v4 decodeIntegerForKey:@"certificatesVersion"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"encryptionCertificates"];
    encryptionCertificates = v5->_encryptionCertificates;
    v5->_encryptionCertificates = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t destination = self->_destination;
  id v5 = a3;
  [v5 encodeInteger:destination forKey:@"destination"];
  [v5 encodeInteger:self->_encryptionScheme forKey:@"encryptionVersion"];
  [v5 encodeInteger:self->_certificatesVersion forKey:@"certificatesVersion"];
  [v5 encodeObject:self->_encryptionCertificates forKey:@"encryptionCertificates"];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_encryptionCertificates];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_destination - v4 + 32 * v4;
  unint64_t v6 = self->_encryptionScheme - v5 + 32 * v5;
  unint64_t v7 = self->_certificatesVersion - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  encryptionCertificates = self->_encryptionCertificates;
  unint64_t v6 = (NSArray *)v4[4];
  if (encryptionCertificates && v6)
  {
    if ((-[NSArray isEqual:](encryptionCertificates, "isEqual:") & 1) == 0) {
      goto LABEL_10;
    }
  }
  else if (encryptionCertificates != v6)
  {
LABEL_10:
    BOOL v7 = 0;
    goto LABEL_11;
  }
  if (self->_destination != v4[1] || self->_encryptionScheme != v4[2]) {
    goto LABEL_10;
  }
  BOOL v7 = self->_certificatesVersion == v4[3];
LABEL_11:

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = v3;
  if (self->_destination == 1) {
    unint64_t v5 = @"recipientData";
  }
  else {
    unint64_t v5 = @"unknown";
  }
  [v3 appendFormat:@"destination: '%@'; ", v5];
  unint64_t v6 = PKPrivacyEncryptionSchemeToString(self->_encryptionScheme);
  [v4 appendFormat:@"encryptionScheme: '%@'; ", v6];

  objc_msgSend(v4, "appendFormat:", @"certificatesVersion: '%ld'; ", self->_certificatesVersion);
  [v4 appendFormat:@"encryptionCertificates: '%@'; ", self->_encryptionCertificates];
  [v4 appendFormat:@">"];
  return v4;
}

- (id)debugDescription
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  uint64_t v4 = v3;
  if (self->_destination == 1) {
    unint64_t v5 = @"recipientData";
  }
  else {
    unint64_t v5 = @"unknown";
  }
  [v3 appendFormat:@"destination: '%@'; ", v5];
  unint64_t v6 = PKPrivacyEncryptionSchemeToString(self->_encryptionScheme);
  [v4 appendFormat:@"encryptionScheme: '%@'; ", v6];

  objc_msgSend(v4, "appendFormat:", @"certificatesVersion: '%ld'; ", self->_certificatesVersion);
  [v4 appendFormat:@"encryptionCertificates: [\n"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v7 = self->_encryptionCertificates;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_super v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) base64EncodedStringWithOptions:0];
        [v4 appendFormat:@"%@, \n", v12];
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  [v4 appendFormat:@"];>"];
  v13 = (void *)[v4 copy];

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [+[PKPeerPaymentEncryptionCertificate allocWithZone:](PKPeerPaymentEncryptionCertificate, "allocWithZone:") init];
  v5->_unint64_t destination = self->_destination;
  v5->_encryptionScheme = self->_encryptionScheme;
  v5->_certificatesVersion = self->_certificatesVersion;
  uint64_t v6 = [(NSArray *)self->_encryptionCertificates copyWithZone:a3];
  encryptionCertificates = v5->_encryptionCertificates;
  v5->_encryptionCertificates = (NSArray *)v6;

  return v5;
}

- (unint64_t)destination
{
  return self->_destination;
}

- (void)setDestination:(unint64_t)a3
{
  self->_unint64_t destination = a3;
}

- (unint64_t)encryptionScheme
{
  return self->_encryptionScheme;
}

- (void)setEncryptionScheme:(unint64_t)a3
{
  self->_encryptionScheme = a3;
}

- (int64_t)certificatesVersion
{
  return self->_certificatesVersion;
}

- (void)setCertificatesVersion:(int64_t)a3
{
  self->_certificatesVersion = a3;
}

- (NSArray)encryptionCertificates
{
  return self->_encryptionCertificates;
}

- (void)setEncryptionCertificates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end