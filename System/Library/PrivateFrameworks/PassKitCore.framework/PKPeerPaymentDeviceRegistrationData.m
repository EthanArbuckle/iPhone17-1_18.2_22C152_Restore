@interface PKPeerPaymentDeviceRegistrationData
+ (BOOL)supportsSecureCoding;
- (BOOL)devSigned;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPeerPaymentDeviceRegistrationData:(id)a3;
- (NSData)signedEnrollmentDataSignature;
- (NSDictionary)enrollmentData;
- (NSString)authorizationHeader;
- (NSString)companionSerialNumber;
- (NSString)signedAuthToken;
- (PKPeerPaymentDeviceRegistrationData)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthorizationHeader:(id)a3;
- (void)setCompanionSerialNumber:(id)a3;
- (void)setDevSigned:(BOOL)a3;
- (void)setEnrollmentData:(id)a3;
- (void)setSignedAuthToken:(id)a3;
- (void)setSignedEnrollmentDataSignature:(id)a3;
@end

@implementation PKPeerPaymentDeviceRegistrationData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentDeviceRegistrationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPeerPaymentDeviceRegistrationData;
  v5 = [(PKPeerPaymentDeviceRegistrationData *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizationHeader"];
    authorizationHeader = v5->_authorizationHeader;
    v5->_authorizationHeader = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signedAuthToken"];
    signedAuthToken = v5->_signedAuthToken;
    v5->_signedAuthToken = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"enrollmentData"];
    enrollmentData = v5->_enrollmentData;
    v5->_enrollmentData = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signedEnrollmentDataSignature"];
    signedEnrollmentDataSignature = v5->_signedEnrollmentDataSignature;
    v5->_signedEnrollmentDataSignature = (NSData *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"devSigned"];
    v5->_devSigned = [v14 BOOLValue];

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companionSerialNumber"];
    companionSerialNumber = v5->_companionSerialNumber;
    v5->_companionSerialNumber = (NSString *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  authorizationHeader = self->_authorizationHeader;
  id v6 = a3;
  [v6 encodeObject:authorizationHeader forKey:@"authorizationHeader"];
  [v6 encodeObject:self->_signedAuthToken forKey:@"signedAuthToken"];
  [v6 encodeObject:self->_enrollmentData forKey:@"enrollmentData"];
  [v6 encodeObject:self->_signedEnrollmentDataSignature forKey:@"signedEnrollmentDataSignature"];
  v5 = [NSNumber numberWithBool:self->_devSigned];
  [v6 encodeObject:v5 forKey:@"devSigned"];

  [v6 encodeObject:self->_companionSerialNumber forKey:@"companionSerialNumber"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"authorizationHeader: '%@'; ", self->_authorizationHeader];
  [v6 appendFormat:@"signedAuthToken: '%@'; ", self->_signedAuthToken];
  [v6 appendFormat:@"enrollmentData: '%@'; ", self->_enrollmentData];
  objc_msgSend(v6, "appendFormat:", @"signedEnrollmentDataSignature : '%@'; ",
    self->_signedEnrollmentDataSignature);
  v7 = [NSNumber numberWithBool:self->_devSigned];
  [v6 appendFormat:@"devSigned: '%@'; ", v7];

  [v6 appendFormat:@"companionSerialNumber: '%@'; ", self->_companionSerialNumber];
  [v6 appendFormat:@">"];
  uint64_t v8 = [NSString stringWithString:v6];

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_authorizationHeader) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_signedAuthToken) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_enrollmentData) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_signedEnrollmentDataSignature) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_companionSerialNumber) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v5 = PKCombinedHash(17, v4);
  unint64_t v6 = self->_devSigned - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPeerPaymentDeviceRegistrationData *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPeerPaymentDeviceRegistrationData *)self isEqualToPeerPaymentDeviceRegistrationData:v5];

  return v6;
}

- (BOOL)isEqualToPeerPaymentDeviceRegistrationData:(id)a3
{
  id v4 = a3;
  signedAuthToken = self->_signedAuthToken;
  BOOL v6 = (NSString *)v4[3];
  if (signedAuthToken) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (signedAuthToken != v6) {
      goto LABEL_30;
    }
  }
  else
  {
    char v8 = -[NSString isEqual:](signedAuthToken, "isEqual:");
    if ((v8 & 1) == 0) {
      goto LABEL_30;
    }
  }
  v9 = (void *)v4[2];
  uint64_t v10 = self->_authorizationHeader;
  v11 = v9;
  if (v10 == v11)
  {
  }
  else
  {
    uint64_t v12 = v11;
    if (!v10 || !v11)
    {

      goto LABEL_30;
    }
    BOOL v13 = [(NSString *)v10 isEqualToString:v11];

    if (!v13) {
      goto LABEL_30;
    }
  }
  enrollmentData = self->_enrollmentData;
  uint64_t v15 = (NSDictionary *)v4[4];
  if (enrollmentData && v15)
  {
    if ((-[NSDictionary isEqual:](enrollmentData, "isEqual:") & 1) == 0) {
      goto LABEL_30;
    }
  }
  else if (enrollmentData != v15)
  {
    goto LABEL_30;
  }
  signedEnrollmentDataSignature = self->_signedEnrollmentDataSignature;
  v17 = (NSData *)v4[5];
  if (!signedEnrollmentDataSignature || !v17)
  {
    if (signedEnrollmentDataSignature == v17) {
      goto LABEL_26;
    }
LABEL_30:
    char v20 = 0;
    goto LABEL_31;
  }
  if ((-[NSData isEqual:](signedEnrollmentDataSignature, "isEqual:") & 1) == 0) {
    goto LABEL_30;
  }
LABEL_26:
  if (self->_devSigned != *((unsigned __int8 *)v4 + 8)) {
    goto LABEL_30;
  }
  companionSerialNumber = self->_companionSerialNumber;
  v19 = (NSString *)v4[6];
  if (companionSerialNumber && v19) {
    char v20 = -[NSString isEqual:](companionSerialNumber, "isEqual:");
  }
  else {
    char v20 = companionSerialNumber == v19;
  }
LABEL_31:

  return v20;
}

- (NSString)authorizationHeader
{
  return self->_authorizationHeader;
}

- (void)setAuthorizationHeader:(id)a3
{
}

- (NSString)signedAuthToken
{
  return self->_signedAuthToken;
}

- (void)setSignedAuthToken:(id)a3
{
}

- (NSDictionary)enrollmentData
{
  return self->_enrollmentData;
}

- (void)setEnrollmentData:(id)a3
{
}

- (NSData)signedEnrollmentDataSignature
{
  return self->_signedEnrollmentDataSignature;
}

- (void)setSignedEnrollmentDataSignature:(id)a3
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

- (void)setCompanionSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionSerialNumber, 0);
  objc_storeStrong((id *)&self->_signedEnrollmentDataSignature, 0);
  objc_storeStrong((id *)&self->_enrollmentData, 0);
  objc_storeStrong((id *)&self->_signedAuthToken, 0);
  objc_storeStrong((id *)&self->_authorizationHeader, 0);
}

@end