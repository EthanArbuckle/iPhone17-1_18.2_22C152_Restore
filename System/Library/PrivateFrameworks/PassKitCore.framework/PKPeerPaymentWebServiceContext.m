@interface PKPeerPaymentWebServiceContext
+ (BOOL)supportsSecureCoding;
+ (PKPeerPaymentWebServiceContext)contextWithArchive:(id)a3;
- (BOOL)devSigned;
- (NSData)signedEnrollmentDataSignature;
- (NSString)companionSerialNumber;
- (NSString)deviceIdentifier;
- (NSString)pushToken;
- (NSString)pushTopic;
- (NSURL)serviceURL;
- (PKPeerPaymentWebServiceContext)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDevSigned:(BOOL)a3;
- (void)setPushToken:(id)a3;
- (void)setSignedEnrollmentDataSignature:(id)a3;
- (void)updateContextWithDeviceRegistrationData:(id)a3 registrationResponse:(id)a4;
@end

@implementation PKPeerPaymentWebServiceContext

- (NSURL)serviceURL
{
  return self->_serviceURL;
}

- (PKPeerPaymentWebServiceContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKPeerPaymentWebServiceContext;
  v5 = [(PKPeerPaymentWebServiceContext *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceURL"];
    serviceURL = v5->_serviceURL;
    v5->_serviceURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pushTopic"];
    pushTopic = v5->_pushTopic;
    v5->_pushTopic = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pushToken"];
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSString *)v12;

    v5->_devSigned = [v4 decodeBoolForKey:@"devSigned"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companionSerialNumber"];
    companionSerialNumber = v5->_companionSerialNumber;
    v5->_companionSerialNumber = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signedEnrollmentDataSignature"];
    signedEnrollmentDataSignature = v5->_signedEnrollmentDataSignature;
    v5->_signedEnrollmentDataSignature = (NSData *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  serviceURL = self->_serviceURL;
  id v5 = a3;
  [v5 encodeObject:serviceURL forKey:@"serviceURL"];
  [v5 encodeObject:self->_deviceIdentifier forKey:@"deviceIdentifier"];
  [v5 encodeObject:self->_pushTopic forKey:@"pushTopic"];
  [v5 encodeObject:self->_pushToken forKey:@"pushToken"];
  [v5 encodeBool:self->_devSigned forKey:@"devSigned"];
  [v5 encodeObject:self->_companionSerialNumber forKey:@"companionSerialNumber"];
  [v5 encodeObject:self->_signedEnrollmentDataSignature forKey:@"signedEnrollmentDataSignature"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (PKPeerPaymentWebServiceContext)contextWithArchive:(id)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PKPeerPaymentWebServiceContext;
  v3 = objc_msgSendSuper2(&v7, sel_contextWithArchive_, a3);
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = objc_alloc_init(PKPeerPaymentWebServiceContext);
  }
  id v5 = v4;

  return v5;
}

- (void)updateContextWithDeviceRegistrationData:(id)a3 registrationResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  self->_devSigned = [v7 devSigned];
  uint64_t v8 = [v7 signedEnrollmentDataSignature];
  v9 = (NSData *)[v8 copy];
  signedEnrollmentDataSignature = self->_signedEnrollmentDataSignature;
  self->_signedEnrollmentDataSignature = v9;

  v11 = [v7 companionSerialNumber];

  uint64_t v12 = (NSString *)[v11 copy];
  companionSerialNumber = self->_companionSerialNumber;
  self->_companionSerialNumber = v12;

  uint64_t v14 = [v6 peerPaymentServiceURL];
  v15 = (NSURL *)[v14 copy];
  serviceURL = self->_serviceURL;
  self->_serviceURL = v15;

  v17 = [v6 deviceIdentifier];
  v18 = (NSString *)[v17 copy];
  deviceIdentifier = self->_deviceIdentifier;
  self->_deviceIdentifier = v18;

  id v22 = [v6 peerPaymentServicesPushTopic];

  v20 = (NSString *)[v22 copy];
  pushTopic = self->_pushTopic;
  self->_pushTopic = v20;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (BOOL)devSigned
{
  return self->_devSigned;
}

- (void)setDevSigned:(BOOL)a3
{
  self->_devSigned = a3;
}

- (NSString)companionSerialNumber
{
  return self->_companionSerialNumber;
}

- (NSData)signedEnrollmentDataSignature
{
  return self->_signedEnrollmentDataSignature;
}

- (void)setSignedEnrollmentDataSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedEnrollmentDataSignature, 0);
  objc_storeStrong((id *)&self->_companionSerialNumber, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_pushTopic, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceURL, 0);
}

@end