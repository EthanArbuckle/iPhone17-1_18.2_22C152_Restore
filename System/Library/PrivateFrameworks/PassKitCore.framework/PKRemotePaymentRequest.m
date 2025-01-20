@interface PKRemotePaymentRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRemoteRequest:(id)a3;
- (NSString)identifier;
- (NSString)selectedApplicationIdentifier;
- (PKPaymentRequest)paymentRequest;
- (PKRemoteDevice)device;
- (PKRemotePaymentRequest)initWithCoder:(id)a3;
- (PKRemotePaymentRequest)initWithDevice:(id)a3;
- (PKRemotePaymentRequest)initWithDevice:(id)a3 identifier:(id)a4;
- (id)description;
- (unint64_t)selectedPaymentMethodType;
- (void)encodeWithCoder:(id)a3;
- (void)setPaymentRequest:(id)a3;
- (void)setSelectedApplicationIdentifier:(id)a3;
- (void)setSelectedPaymentMethodType:(unint64_t)a3;
@end

@implementation PKRemotePaymentRequest

- (PKRemotePaymentRequest)initWithDevice:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  v6 = [v4 UUID];
  v7 = [v6 UUIDString];
  v8 = [(PKRemotePaymentRequest *)self initWithDevice:v5 identifier:v7];

  return v8;
}

- (PKRemotePaymentRequest)initWithDevice:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKRemotePaymentRequest;
  v9 = [(PKRemotePaymentRequest *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_device, a3);
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRemotePaymentRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKRemotePaymentRequest;
  id v5 = [(PKRemotePaymentRequest *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentRequest"];
    paymentRequest = v5->_paymentRequest;
    v5->_paymentRequest = (PKPaymentRequest *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"device"];
    device = v5->_device;
    v5->_device = (PKRemoteDevice *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedApplicationIdentifier"];
    selectedApplicationIdentifier = v5->_selectedApplicationIdentifier;
    v5->_selectedApplicationIdentifier = (NSString *)v10;

    v5->_selectedPaymentMethodType = [v4 decodeIntegerForKey:@"selectedPaymentMethodType"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  paymentRequest = self->_paymentRequest;
  id v5 = a3;
  [v5 encodeObject:paymentRequest forKey:@"paymentRequest"];
  [v5 encodeObject:self->_device forKey:@"device"];
  [v5 encodeObject:self->_selectedApplicationIdentifier forKey:@"selectedApplicationIdentifier"];
  [v5 encodeInteger:self->_selectedPaymentMethodType forKey:@"selectedPaymentMethodType"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKRemotePaymentRequest *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKRemotePaymentRequest *)self isEqualToRemoteRequest:v5];

  return v6;
}

- (BOOL)isEqualToRemoteRequest:(id)a3
{
  id v4 = a3;
  device = self->_device;
  BOOL v6 = (PKRemoteDevice *)v4[1];
  if (device) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[PKRemoteDevice isEqual:](device, "isEqual:")) {
      goto LABEL_9;
    }
LABEL_7:
    char v8 = 0;
    goto LABEL_13;
  }
  if (device != v6) {
    goto LABEL_7;
  }
LABEL_9:
  identifier = self->_identifier;
  uint64_t v10 = (NSString *)v4[4];
  if (identifier && v10) {
    char v8 = -[NSString isEqual:](identifier, "isEqual:");
  }
  else {
    char v8 = identifier == v10;
  }
LABEL_13:

  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = v3;
  if (self->_identifier) {
    [v3 appendFormat:@"identifier: %@; ", self->_identifier];
  }
  device = self->_device;
  if (device)
  {
    BOOL v6 = [(PKRemoteDevice *)device deviceName];
    [v4 appendFormat:@"device: %@; ", v6];
  }
  if (self->_selectedApplicationIdentifier) {
    objc_msgSend(v4, "appendFormat:", @"selectedApplicationIdentifier: %@; ",
  }
      self->_selectedApplicationIdentifier);
  unint64_t selectedPaymentMethodType = self->_selectedPaymentMethodType;
  if (selectedPaymentMethodType)
  {
    char v8 = PKPaymentMethodTypeToString(selectedPaymentMethodType);
    [v4 appendFormat:@"selectedPaymentMethodType: %@; ", v8];
  }
  if (self->_paymentRequest) {
    [v4 appendFormat:@"paymentRequest: %@", self->_paymentRequest];
  }
  [v4 appendString:@">"];
  v9 = (void *)[v4 copy];

  return v9;
}

- (PKRemoteDevice)device
{
  return self->_device;
}

- (PKPaymentRequest)paymentRequest
{
  return self->_paymentRequest;
}

- (void)setPaymentRequest:(id)a3
{
}

- (NSString)selectedApplicationIdentifier
{
  return self->_selectedApplicationIdentifier;
}

- (void)setSelectedApplicationIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)selectedPaymentMethodType
{
  return self->_selectedPaymentMethodType;
}

- (void)setSelectedPaymentMethodType:(unint64_t)a3
{
  self->_unint64_t selectedPaymentMethodType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_selectedApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end