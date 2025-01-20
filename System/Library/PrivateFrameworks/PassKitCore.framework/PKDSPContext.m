@interface PKDSPContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)cardholderName;
- (NSString)peerPaymentRecipientAddress;
- (NSString)phoneNumber;
- (NSString)primaryAppleAccountFirstName;
- (NSString)primaryAppleAccountLastName;
- (NSString)secureElementID;
- (NSString)serverEndpointIdentifier;
- (PKDSPContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)eventFrequency;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCardholderName:(id)a3;
- (void)setEventFrequency:(unint64_t)a3;
- (void)setPeerPaymentRecipientAddress:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setPrimaryAppleAccount:(id)a3;
- (void)setPrimaryAppleAccountFirstName:(id)a3;
- (void)setPrimaryAppleAccountLastName:(id)a3;
- (void)setSecureElementID:(id)a3;
- (void)setServerEndpointIdentifier:(id)a3;
@end

@implementation PKDSPContext

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKDSPContext allocWithZone:](PKDSPContext, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_secureElementID copyWithZone:a3];
  secureElementID = v5->_secureElementID;
  v5->_secureElementID = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_phoneNumber copyWithZone:a3];
  phoneNumber = v5->_phoneNumber;
  v5->_phoneNumber = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_cardholderName copyWithZone:a3];
  cardholderName = v5->_cardholderName;
  v5->_cardholderName = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_primaryAppleAccountFirstName copyWithZone:a3];
  primaryAppleAccountFirstName = v5->_primaryAppleAccountFirstName;
  v5->_primaryAppleAccountFirstName = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_primaryAppleAccountLastName copyWithZone:a3];
  primaryAppleAccountLastName = v5->_primaryAppleAccountLastName;
  v5->_primaryAppleAccountLastName = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_serverEndpointIdentifier copyWithZone:a3];
  serverEndpointIdentifier = v5->_serverEndpointIdentifier;
  v5->_serverEndpointIdentifier = (NSString *)v16;

  uint64_t v18 = [(NSString *)self->_peerPaymentRecipientAddress copyWithZone:a3];
  peerPaymentRecipientAddress = v5->_peerPaymentRecipientAddress;
  v5->_peerPaymentRecipientAddress = (NSString *)v18;

  v5->_eventFrequency = self->_eventFrequency;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  uint64_t v6 = v5;
  if (!v6) {
    goto LABEL_40;
  }
  secureElementID = self->_secureElementID;
  uint64_t v8 = (NSString *)v6[1];
  if (secureElementID && v8)
  {
    if ((-[NSString isEqual:](secureElementID, "isEqual:") & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (secureElementID != v8)
  {
    goto LABEL_40;
  }
  cardholderName = self->_cardholderName;
  uint64_t v10 = (NSString *)v6[3];
  if (cardholderName && v10)
  {
    if ((-[NSString isEqual:](cardholderName, "isEqual:") & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (cardholderName != v10)
  {
    goto LABEL_40;
  }
  phoneNumber = self->_phoneNumber;
  uint64_t v12 = (NSString *)v6[4];
  if (phoneNumber && v12)
  {
    if ((-[NSString isEqual:](phoneNumber, "isEqual:") & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (phoneNumber != v12)
  {
    goto LABEL_40;
  }
  primaryAppleAccountFirstName = self->_primaryAppleAccountFirstName;
  uint64_t v14 = (NSString *)v6[7];
  if (primaryAppleAccountFirstName && v14)
  {
    if ((-[NSString isEqual:](primaryAppleAccountFirstName, "isEqual:") & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (primaryAppleAccountFirstName != v14)
  {
    goto LABEL_40;
  }
  primaryAppleAccountLastName = self->_primaryAppleAccountLastName;
  uint64_t v16 = (NSString *)v6[8];
  if (primaryAppleAccountLastName && v16)
  {
    if ((-[NSString isEqual:](primaryAppleAccountLastName, "isEqual:") & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (primaryAppleAccountLastName != v16)
  {
    goto LABEL_40;
  }
  serverEndpointIdentifier = self->_serverEndpointIdentifier;
  uint64_t v18 = (NSString *)v6[2];
  if (serverEndpointIdentifier && v18)
  {
    if ((-[NSString isEqual:](serverEndpointIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_40;
    }
  }
  else if (serverEndpointIdentifier != v18)
  {
    goto LABEL_40;
  }
  peerPaymentRecipientAddress = self->_peerPaymentRecipientAddress;
  v20 = (NSString *)v6[5];
  if (!peerPaymentRecipientAddress || !v20)
  {
    if (peerPaymentRecipientAddress == v20) {
      goto LABEL_38;
    }
LABEL_40:
    BOOL v21 = 0;
    goto LABEL_41;
  }
  if ((-[NSString isEqual:](peerPaymentRecipientAddress, "isEqual:") & 1) == 0) {
    goto LABEL_40;
  }
LABEL_38:
  BOOL v21 = self->_eventFrequency == v6[6];
LABEL_41:

  return v21;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_secureElementID];
  [v3 safelyAddObject:self->_cardholderName];
  [v3 safelyAddObject:self->_phoneNumber];
  [v3 safelyAddObject:self->_primaryAppleAccountLastName];
  [v3 safelyAddObject:self->_primaryAppleAccountFirstName];
  [v3 safelyAddObject:self->_serverEndpointIdentifier];
  [v3 safelyAddObject:self->_peerPaymentRecipientAddress];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_eventFrequency - v4 + 32 * v4;

  return v5;
}

- (void)setPrimaryAppleAccount:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 firstName];
  uint64_t v6 = (NSString *)[v5 copy];
  primaryAppleAccountFirstName = self->_primaryAppleAccountFirstName;
  self->_primaryAppleAccountFirstName = v6;

  id v10 = [v4 lastName];

  uint64_t v8 = (NSString *)[v10 copy];
  primaryAppleAccountLastName = self->_primaryAppleAccountLastName;
  self->_primaryAppleAccountLastName = v8;
}

- (PKDSPContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKDSPContext;
  unint64_t v5 = [(PKDSPContext *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secureElementID"];
    secureElementID = v5->_secureElementID;
    v5->_secureElementID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serverEndpointIdentifier"];
    serverEndpointIdentifier = v5->_serverEndpointIdentifier;
    v5->_serverEndpointIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cardholderName"];
    cardholderName = v5->_cardholderName;
    v5->_cardholderName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerPaymentRecipientAddress"];
    peerPaymentRecipientAddress = v5->_peerPaymentRecipientAddress;
    v5->_peerPaymentRecipientAddress = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventFrequency"];
    v5->_eventFrequency = [v16 unsignedIntegerValue];

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryAppleAccountFirstName"];
    primaryAppleAccountFirstName = v5->_primaryAppleAccountFirstName;
    v5->_primaryAppleAccountFirstName = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryAppleAccountLastName"];
    primaryAppleAccountLastName = v5->_primaryAppleAccountLastName;
    v5->_primaryAppleAccountLastName = (NSString *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  secureElementID = self->_secureElementID;
  id v6 = a3;
  [v6 encodeObject:secureElementID forKey:@"secureElementID"];
  [v6 encodeObject:self->_serverEndpointIdentifier forKey:@"serverEndpointIdentifier"];
  [v6 encodeObject:self->_cardholderName forKey:@"cardholderName"];
  [v6 encodeObject:self->_phoneNumber forKey:@"phoneNumber"];
  [v6 encodeObject:self->_peerPaymentRecipientAddress forKey:@"peerPaymentRecipientAddress"];
  unint64_t v5 = [NSNumber numberWithUnsignedInteger:self->_eventFrequency];
  [v6 encodeObject:v5 forKey:@"eventFrequency"];

  [v6 encodeObject:self->_primaryAppleAccountFirstName forKey:@"primaryAppleAccountFirstName"];
  [v6 encodeObject:self->_primaryAppleAccountLastName forKey:@"primaryAppleAccountLastName"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)secureElementID
{
  return self->_secureElementID;
}

- (void)setSecureElementID:(id)a3
{
}

- (NSString)serverEndpointIdentifier
{
  return self->_serverEndpointIdentifier;
}

- (void)setServerEndpointIdentifier:(id)a3
{
}

- (NSString)cardholderName
{
  return self->_cardholderName;
}

- (void)setCardholderName:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)peerPaymentRecipientAddress
{
  return self->_peerPaymentRecipientAddress;
}

- (void)setPeerPaymentRecipientAddress:(id)a3
{
}

- (unint64_t)eventFrequency
{
  return self->_eventFrequency;
}

- (void)setEventFrequency:(unint64_t)a3
{
  self->_eventFrequency = a3;
}

- (NSString)primaryAppleAccountFirstName
{
  return self->_primaryAppleAccountFirstName;
}

- (void)setPrimaryAppleAccountFirstName:(id)a3
{
}

- (NSString)primaryAppleAccountLastName
{
  return self->_primaryAppleAccountLastName;
}

- (void)setPrimaryAppleAccountLastName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAppleAccountLastName, 0);
  objc_storeStrong((id *)&self->_primaryAppleAccountFirstName, 0);
  objc_storeStrong((id *)&self->_peerPaymentRecipientAddress, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_cardholderName, 0);
  objc_storeStrong((id *)&self->_serverEndpointIdentifier, 0);
  objc_storeStrong((id *)&self->_secureElementID, 0);
}

@end