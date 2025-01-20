@interface PKPaymentDeviceRegistrationData
+ (BOOL)supportsSecureCoding;
- (BOOL)devSigned;
- (BOOL)walletDeleted;
- (NSArray)additionalDeviceSerialNumbers;
- (NSArray)legacyStateInformation;
- (NSData)platformData;
- (NSData)platformDataSignature;
- (NSDictionary)secureElementStateInformation;
- (NSString)authorizationHeader;
- (NSString)companionSerialNumber;
- (NSString)deviceMLBSerialNumber;
- (NSString)deviceSerialNumber;
- (NSString)productType;
- (NSString)secureElementIdentifier;
- (NSString)signedAuthToken;
- (PKPaymentDeviceRegistrationData)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalDeviceSerialNumbers:(id)a3;
- (void)setAuthorizationHeader:(id)a3;
- (void)setCompanionSerialNumber:(id)a3;
- (void)setDevSigned:(BOOL)a3;
- (void)setDeviceMLBSerialNumber:(id)a3;
- (void)setDeviceSerialNumber:(id)a3;
- (void)setPlatformData:(id)a3;
- (void)setPlatformDataSignature:(id)a3;
- (void)setProductType:(id)a3;
- (void)setSecureElementIdentifier:(id)a3;
- (void)setSecureElementStateInformation:(id)a3;
- (void)setSignedAuthToken:(id)a3;
- (void)setWalletDeleted:(BOOL)a3;
@end

@implementation PKPaymentDeviceRegistrationData

- (PKPaymentDeviceRegistrationData)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKPaymentDeviceRegistrationData;
  v5 = [(PKPaymentDeviceRegistrationData *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizationHeader"];
    authorizationHeader = v5->_authorizationHeader;
    v5->_authorizationHeader = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signedAuthToken"];
    signedAuthToken = v5->_signedAuthToken;
    v5->_signedAuthToken = (NSString *)v8;

    uint64_t v10 = [v4 decodePropertyListForKey:@"secureElementStateInformation"];
    secureElementStateInformation = v5->_secureElementStateInformation;
    v5->_secureElementStateInformation = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secureElementIdentifier"];
    secureElementIdentifier = v5->_secureElementIdentifier;
    v5->_secureElementIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceSerialNumber"];
    deviceSerialNumber = v5->_deviceSerialNumber;
    v5->_deviceSerialNumber = (NSString *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"additionalDeviceSerialNumbers"];
    additionalDeviceSerialNumbers = v5->_additionalDeviceSerialNumbers;
    v5->_additionalDeviceSerialNumbers = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companionSerialNumber"];
    companionSerialNumber = v5->_companionSerialNumber;
    v5->_companionSerialNumber = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productType"];
    productType = v5->_productType;
    v5->_productType = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platformData"];
    platformData = v5->_platformData;
    v5->_platformData = (NSData *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platformDataSignature"];
    platformDataSignature = v5->_platformDataSignature;
    v5->_platformDataSignature = (NSData *)v27;

    v5->_devSigned = [v4 decodeBoolForKey:@"devSigned"];
    v5->_walletDeleted = [v4 decodeBoolForKey:@"walletDeleted"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  authorizationHeader = self->_authorizationHeader;
  id v5 = a3;
  [v5 encodeObject:authorizationHeader forKey:@"authorizationHeader"];
  [v5 encodeObject:self->_signedAuthToken forKey:@"signedAuthToken"];
  [v5 encodeObject:self->_secureElementStateInformation forKey:@"secureElementStateInformation"];
  [v5 encodeObject:self->_secureElementIdentifier forKey:@"secureElementIdentifier"];
  [v5 encodeObject:self->_deviceSerialNumber forKey:@"deviceSerialNumber"];
  [v5 encodeObject:self->_additionalDeviceSerialNumbers forKey:@"additionalDeviceSerialNumbers"];
  [v5 encodeObject:self->_companionSerialNumber forKey:@"companionSerialNumber"];
  [v5 encodeObject:self->_productType forKey:@"productType"];
  [v5 encodeObject:self->_platformData forKey:@"platformData"];
  [v5 encodeObject:self->_platformDataSignature forKey:@"platformDataSignature"];
  [v5 encodeBool:self->_devSigned forKey:@"devSigned"];
  [v5 encodeBool:self->_walletDeleted forKey:@"walletDeleted"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentDeviceRegistrationData allocWithZone:](PKPaymentDeviceRegistrationData, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_authorizationHeader copyWithZone:a3];
  authorizationHeader = v5->_authorizationHeader;
  v5->_authorizationHeader = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_signedAuthToken copyWithZone:a3];
  signedAuthToken = v5->_signedAuthToken;
  v5->_signedAuthToken = (NSString *)v8;

  uint64_t v10 = [(NSDictionary *)self->_secureElementStateInformation copyWithZone:a3];
  secureElementStateInformation = v5->_secureElementStateInformation;
  v5->_secureElementStateInformation = (NSDictionary *)v10;

  uint64_t v12 = [(NSString *)self->_secureElementIdentifier copyWithZone:a3];
  secureElementIdentifier = v5->_secureElementIdentifier;
  v5->_secureElementIdentifier = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_deviceSerialNumber copyWithZone:a3];
  deviceSerialNumber = v5->_deviceSerialNumber;
  v5->_deviceSerialNumber = (NSString *)v14;

  uint64_t v16 = [(NSArray *)self->_additionalDeviceSerialNumbers copyWithZone:a3];
  additionalDeviceSerialNumbers = v5->_additionalDeviceSerialNumbers;
  v5->_additionalDeviceSerialNumbers = (NSArray *)v16;

  uint64_t v18 = [(NSString *)self->_companionSerialNumber copyWithZone:a3];
  companionSerialNumber = v5->_companionSerialNumber;
  v5->_companionSerialNumber = (NSString *)v18;

  uint64_t v20 = [(NSString *)self->_productType copyWithZone:a3];
  productType = v5->_productType;
  v5->_productType = (NSString *)v20;

  uint64_t v22 = [(NSData *)self->_platformData copyWithZone:a3];
  platformData = v5->_platformData;
  v5->_platformData = (NSData *)v22;

  uint64_t v24 = [(NSData *)self->_platformDataSignature copyWithZone:a3];
  platformDataSignature = v5->_platformDataSignature;
  v5->_platformDataSignature = (NSData *)v24;

  v5->_devSigned = self->_devSigned;
  v5->_walletDeleted = self->_walletDeleted;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

- (NSDictionary)secureElementStateInformation
{
  return self->_secureElementStateInformation;
}

- (void)setSecureElementStateInformation:(id)a3
{
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (void)setSecureElementIdentifier:(id)a3
{
}

- (NSString)deviceSerialNumber
{
  return self->_deviceSerialNumber;
}

- (void)setDeviceSerialNumber:(id)a3
{
}

- (NSString)deviceMLBSerialNumber
{
  return self->_deviceMLBSerialNumber;
}

- (void)setDeviceMLBSerialNumber:(id)a3
{
}

- (NSArray)additionalDeviceSerialNumbers
{
  return self->_additionalDeviceSerialNumbers;
}

- (void)setAdditionalDeviceSerialNumbers:(id)a3
{
}

- (NSString)companionSerialNumber
{
  return self->_companionSerialNumber;
}

- (void)setCompanionSerialNumber:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSData)platformData
{
  return self->_platformData;
}

- (void)setPlatformData:(id)a3
{
}

- (NSData)platformDataSignature
{
  return self->_platformDataSignature;
}

- (void)setPlatformDataSignature:(id)a3
{
}

- (BOOL)walletDeleted
{
  return self->_walletDeleted;
}

- (void)setWalletDeleted:(BOOL)a3
{
  self->_walletDeleted = a3;
}

- (BOOL)devSigned
{
  return self->_devSigned;
}

- (void)setDevSigned:(BOOL)a3
{
  self->_devSigned = a3;
}

- (NSArray)legacyStateInformation
{
  return self->_legacyStateInformation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyStateInformation, 0);
  objc_storeStrong((id *)&self->_platformDataSignature, 0);
  objc_storeStrong((id *)&self->_platformData, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_companionSerialNumber, 0);
  objc_storeStrong((id *)&self->_additionalDeviceSerialNumbers, 0);
  objc_storeStrong((id *)&self->_deviceMLBSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_secureElementStateInformation, 0);
  objc_storeStrong((id *)&self->_signedAuthToken, 0);
  objc_storeStrong((id *)&self->_authorizationHeader, 0);
}

@end