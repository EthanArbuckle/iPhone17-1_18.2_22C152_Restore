@interface PKAuthorizedPeerPaymentQuote
+ (BOOL)supportsSecureCoding;
- (NSData)transactionData;
- (NSDictionary)certificates;
- (NSString)encryptedRecipientData;
- (NSString)ephemeralPublicKey;
- (NSString)publicKeyHash;
- (NSString)senderAddress;
- (PKAuthorizedPeerPaymentQuote)initWithCoder:(id)a3;
- (PKAuthorizedPeerPaymentQuote)initWithQuote:(id)a3 transactionData:(id)a4 certificates:(id)a5;
- (PKContact)contact;
- (PKPeerPaymentQuote)peerPaymentQuote;
- (id)description;
- (unint64_t)encryptionScheme;
- (unint64_t)hash;
- (unint64_t)paymentMethodType;
- (unint64_t)senderAddressType;
- (void)encodeWithCoder:(id)a3;
- (void)setContact:(id)a3;
- (void)setEncryptedRecipientData:(id)a3;
- (void)setEncryptionScheme:(unint64_t)a3;
- (void)setEphemeralPublicKey:(id)a3;
- (void)setPaymentMethodType:(unint64_t)a3;
- (void)setPublicKeyHash:(id)a3;
- (void)setSenderAddress:(id)a3;
- (void)setSenderAddressType:(unint64_t)a3;
@end

@implementation PKAuthorizedPeerPaymentQuote

- (PKAuthorizedPeerPaymentQuote)initWithQuote:(id)a3 transactionData:(id)a4 certificates:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKAuthorizedPeerPaymentQuote;
  v12 = [(PKAuthorizedPeerPaymentQuote *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_peerPaymentQuote, a3);
    uint64_t v14 = [v10 copy];
    transactionData = v13->_transactionData;
    v13->_transactionData = (NSData *)v14;

    uint64_t v16 = [v11 copy];
    certificates = v13->_certificates;
    v13->_certificates = (NSDictionary *)v16;
  }
  return v13;
}

- (PKAuthorizedPeerPaymentQuote)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKAuthorizedPeerPaymentQuote;
  v5 = [(PKAuthorizedPeerPaymentQuote *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerPaymentQuote"];
    peerPaymentQuote = v5->_peerPaymentQuote;
    v5->_peerPaymentQuote = (PKPeerPaymentQuote *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionData"];
    transactionData = v5->_transactionData;
    v5->_transactionData = (NSData *)v8;

    uint64_t v10 = [v4 decodePropertyListForKey:@"certificates"];
    certificates = v5->_certificates;
    v5->_certificates = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contact"];
    contact = v5->_contact;
    v5->_contact = (PKContact *)v12;

    v5->_paymentMethodType = [v4 decodeIntegerForKey:@"paymentMethodType"];
    v5->_senderAddressType = [v4 decodeIntegerForKey:@"senderAddressType"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderAddress"];
    senderAddress = v5->_senderAddress;
    v5->_senderAddress = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"encryptedRecipientData"];
    encryptedRecipientData = v5->_encryptedRecipientData;
    v5->_encryptedRecipientData = (NSString *)v16;

    v5->_encryptionScheme = [v4 decodeIntegerForKey:@"encryptionScheme"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKeyHash"];
    publicKeyHash = v5->_publicKeyHash;
    v5->_publicKeyHash = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ephemeralPublicKey"];
    ephemeralPublicKey = v5->_ephemeralPublicKey;
    v5->_ephemeralPublicKey = (NSString *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  peerPaymentQuote = self->_peerPaymentQuote;
  id v5 = a3;
  [v5 encodeObject:peerPaymentQuote forKey:@"peerPaymentQuote"];
  [v5 encodeObject:self->_transactionData forKey:@"transactionData"];
  [v5 encodeObject:self->_certificates forKey:@"certificates"];
  [v5 encodeObject:self->_contact forKey:@"contact"];
  [v5 encodeInteger:self->_paymentMethodType forKey:@"paymentMethodType"];
  [v5 encodeInteger:self->_senderAddressType forKey:@"senderAddressType"];
  [v5 encodeObject:self->_senderAddress forKey:@"senderAddress"];
  [v5 encodeObject:self->_encryptedRecipientData forKey:@"encryptedRecipientData"];
  [v5 encodeInteger:self->_encryptionScheme forKey:@"encryptionScheme"];
  [v5 encodeObject:self->_publicKeyHash forKey:@"publicKeyHash"];
  [v5 encodeObject:self->_ephemeralPublicKey forKey:@"ephemeralPublicKey"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_peerPaymentQuote];
  [v3 safelyAddObject:self->_transactionData];
  [v3 safelyAddObject:self->_certificates];
  [v3 safelyAddObject:self->_contact];
  [v3 safelyAddObject:self->_senderAddress];
  [v3 safelyAddObject:self->_encryptedRecipientData];
  [v3 safelyAddObject:self->_publicKeyHash];
  [v3 safelyAddObject:self->_ephemeralPublicKey];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_paymentMethodType - v4 + 32 * v4;
  unint64_t v6 = self->_senderAddressType - v5 + 32 * v5;
  unint64_t v7 = self->_encryptionScheme - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"peerPaymentQuote: '%@'; ", self->_peerPaymentQuote];
  [v3 appendFormat:@"transactionData: '%@'; ", self->_transactionData];
  [v3 appendFormat:@"certificates: '%@'; ", self->_certificates];
  [v3 appendFormat:@"contact: '%@'; ", self->_contact];
  uint64_t v4 = PKPaymentMethodTypeToString(self->_paymentMethodType);
  [v3 appendFormat:@"paymentMethodType: '%@'; ", v4];

  unint64_t v5 = PKPeerPaymentContactAddressTypeToString(self->_senderAddressType);
  [v3 appendFormat:@"senderAddressType: '%@'; ", v5];

  [v3 appendFormat:@"senderAddress: '%@'; ", self->_senderAddress];
  [v3 appendFormat:@"encryptedRecipientData: '%@'; ", self->_encryptedRecipientData];
  unint64_t v6 = PKPrivacyEncryptionSchemeToString(self->_encryptionScheme);
  [v3 appendFormat:@"encryptionScheme: '%@'; ", v6];

  [v3 appendFormat:@"publicKeyHash: '%@'; ", self->_publicKeyHash];
  [v3 appendFormat:@"ephemeralPublicKey: '%@'; ", self->_ephemeralPublicKey];
  [v3 appendFormat:@">"];
  return v3;
}

- (PKPeerPaymentQuote)peerPaymentQuote
{
  return self->_peerPaymentQuote;
}

- (PKContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (NSData)transactionData
{
  return self->_transactionData;
}

- (NSDictionary)certificates
{
  return self->_certificates;
}

- (unint64_t)paymentMethodType
{
  return self->_paymentMethodType;
}

- (void)setPaymentMethodType:(unint64_t)a3
{
  self->_paymentMethodType = a3;
}

- (unint64_t)senderAddressType
{
  return self->_senderAddressType;
}

- (void)setSenderAddressType:(unint64_t)a3
{
  self->_senderAddressType = a3;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (void)setSenderAddress:(id)a3
{
}

- (NSString)encryptedRecipientData
{
  return self->_encryptedRecipientData;
}

- (void)setEncryptedRecipientData:(id)a3
{
}

- (unint64_t)encryptionScheme
{
  return self->_encryptionScheme;
}

- (void)setEncryptionScheme:(unint64_t)a3
{
  self->_encryptionScheme = a3;
}

- (NSString)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
}

- (NSString)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (void)setEphemeralPublicKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_encryptedRecipientData, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
  objc_storeStrong((id *)&self->_transactionData, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_peerPaymentQuote, 0);
}

@end