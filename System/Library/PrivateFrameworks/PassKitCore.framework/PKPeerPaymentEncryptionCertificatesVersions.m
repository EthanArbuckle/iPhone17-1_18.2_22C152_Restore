@interface PKPeerPaymentEncryptionCertificatesVersions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (PKPeerPaymentEncryptionCertificatesVersions)initWithCoder:(id)a3;
- (PKPeerPaymentEncryptionCertificatesVersions)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)certificatesVersionForDestination:(unint64_t)a3;
- (int64_t)recipientData;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setRecipientData:(int64_t)a3;
@end

@implementation PKPeerPaymentEncryptionCertificatesVersions

- (PKPeerPaymentEncryptionCertificatesVersions)initWithDictionary:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentEncryptionCertificatesVersions;
  v5 = [(PKPeerPaymentEncryptionCertificatesVersions *)&v7 init];
  if (v5) {
    v5->_recipientData = [v4 PKIntegerForKey:@"recipientData"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentEncryptionCertificatesVersions)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentEncryptionCertificatesVersions;
  v5 = [(PKPeerPaymentEncryptionCertificatesVersions *)&v7 init];
  if (v5) {
    v5->_recipientData = [v4 decodeIntegerForKey:@"recipientData"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)hash
{
  return self->_recipientData + 527;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_recipientData == v4[1];

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"recipientData: '%ld'; ", self->_recipientData);
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[PKPeerPaymentEncryptionCertificatesVersions allocWithZone:a3] init];
  *((void *)result + 1) = self->_recipientData;
  return result;
}

- (int64_t)certificatesVersionForDestination:(unint64_t)a3
{
  if (a3 == 1) {
    return self->_recipientData;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)recipientData
{
  return self->_recipientData;
}

- (void)setRecipientData:(int64_t)a3
{
  self->_recipientData = a3;
}

@end