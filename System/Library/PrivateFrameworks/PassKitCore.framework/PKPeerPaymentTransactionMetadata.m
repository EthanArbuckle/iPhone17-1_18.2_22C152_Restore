@interface PKPeerPaymentTransactionMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeerPaymentTransactionMetadata:(id)a3;
- (NSString)dpanIdentifier;
- (NSString)serviceIdentifier;
- (NSUUID)requestDeviceScoreIdentifier;
- (NSUUID)sendDeviceScoreIdentifier;
- (PKPeerPaymentTransactionMetadata)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDPANIdentifier:(id)a3;
- (void)setRequestDeviceScoreIdentifier:(id)a3;
- (void)setSendDeviceScoreIdentifier:(id)a3;
- (void)setServiceIdentifier:(id)a3;
@end

@implementation PKPeerPaymentTransactionMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentTransactionMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentTransactionMetadata;
  v5 = [(PKPeerPaymentTransactionMetadata *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dpanIdentifier"];
    dpanIdentifier = v5->_dpanIdentifier;
    v5->_dpanIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceIdentifier"];
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestDeviceScoreIdentifier"];
    requestDeviceScoreIdentifier = v5->_requestDeviceScoreIdentifier;
    v5->_requestDeviceScoreIdentifier = (NSUUID *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sendDeviceScoreIdentifier"];
    sendDeviceScoreIdentifier = v5->_sendDeviceScoreIdentifier;
    v5->_sendDeviceScoreIdentifier = (NSUUID *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  dpanIdentifier = self->_dpanIdentifier;
  id v5 = a3;
  [v5 encodeObject:dpanIdentifier forKey:@"dpanIdentifier"];
  [v5 encodeObject:self->_serviceIdentifier forKey:@"serviceIdentifier"];
  [v5 encodeObject:self->_requestDeviceScoreIdentifier forKey:@"requestDeviceScoreIdentifier"];
  [v5 encodeObject:self->_sendDeviceScoreIdentifier forKey:@"sendDeviceScoreIdentifier"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"dpanIdentifier: '%@'; ", self->_dpanIdentifier];
  [v6 appendFormat:@"serviceIdentifier: '%@'; ", self->_serviceIdentifier];
  [v6 appendFormat:@"requestDeviceScoreIdentifier: '%@'; ", self->_requestDeviceScoreIdentifier];
  [v6 appendFormat:@"sendDeviceScoreIdentifier: '%@'; ", self->_sendDeviceScoreIdentifier];
  [v6 appendFormat:@">"];
  v7 = [NSString stringWithString:v6];

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_dpanIdentifier) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_serviceIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_requestDeviceScoreIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_sendDeviceScoreIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  unint64_t v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPeerPaymentTransactionMetadata *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPeerPaymentTransactionMetadata *)self isEqualToPeerPaymentTransactionMetadata:v5];

  return v6;
}

- (BOOL)isEqualToPeerPaymentTransactionMetadata:(id)a3
{
  id v4 = a3;
  dpanIdentifier = self->_dpanIdentifier;
  BOOL v6 = (NSString *)v4[1];
  if (dpanIdentifier) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (dpanIdentifier != v6) {
      goto LABEL_21;
    }
  }
  else if ((-[NSString isEqual:](dpanIdentifier, "isEqual:") & 1) == 0)
  {
    goto LABEL_21;
  }
  serviceIdentifier = self->_serviceIdentifier;
  v9 = (NSString *)v4[2];
  if (serviceIdentifier && v9)
  {
    if ((-[NSString isEqual:](serviceIdentifier, "isEqual:") & 1) == 0) {
      goto LABEL_21;
    }
  }
  else if (serviceIdentifier != v9)
  {
    goto LABEL_21;
  }
  requestDeviceScoreIdentifier = self->_requestDeviceScoreIdentifier;
  v11 = (NSUUID *)v4[3];
  if (!requestDeviceScoreIdentifier || !v11)
  {
    if (requestDeviceScoreIdentifier == v11) {
      goto LABEL_17;
    }
LABEL_21:
    char v14 = 0;
    goto LABEL_22;
  }
  if ((-[NSUUID isEqual:](requestDeviceScoreIdentifier, "isEqual:") & 1) == 0) {
    goto LABEL_21;
  }
LABEL_17:
  sendDeviceScoreIdentifier = self->_sendDeviceScoreIdentifier;
  v13 = (NSUUID *)v4[4];
  if (sendDeviceScoreIdentifier && v13) {
    char v14 = -[NSUUID isEqual:](sendDeviceScoreIdentifier, "isEqual:");
  }
  else {
    char v14 = sendDeviceScoreIdentifier == v13;
  }
LABEL_22:

  return v14;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (void)setDPANIdentifier:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (NSUUID)requestDeviceScoreIdentifier
{
  return self->_requestDeviceScoreIdentifier;
}

- (void)setRequestDeviceScoreIdentifier:(id)a3
{
}

- (NSUUID)sendDeviceScoreIdentifier
{
  return self->_sendDeviceScoreIdentifier;
}

- (void)setSendDeviceScoreIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendDeviceScoreIdentifier, 0);
  objc_storeStrong((id *)&self->_requestDeviceScoreIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end