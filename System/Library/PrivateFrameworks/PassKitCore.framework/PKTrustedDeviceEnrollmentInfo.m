@interface PKTrustedDeviceEnrollmentInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)supportsAccessExpressMode;
- (NSString)deviceName;
- (NSString)deviceSerialNumber;
- (NSString)deviceUDID;
- (NSString)productType;
- (NSString)secureElementIdentifier;
- (PKTrustedDeviceEnrollmentInfo)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceSerialNumber:(id)a3;
- (void)setDeviceUDID:(id)a3;
- (void)setProductType:(id)a3;
- (void)setSecureElementIdentifier:(id)a3;
- (void)setSupportsAccessExpressMode:(BOOL)a3;
@end

@implementation PKTrustedDeviceEnrollmentInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKTrustedDeviceEnrollmentInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKTrustedDeviceEnrollmentInfo;
  v5 = [(PKTrustedDeviceEnrollmentInfo *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceSerialNumber"];
    deviceSerialNumber = v5->_deviceSerialNumber;
    v5->_deviceSerialNumber = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceUDID"];
    deviceUDID = v5->_deviceUDID;
    v5->_deviceUDID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productType"];
    productType = v5->_productType;
    v5->_productType = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secureElementIdentifier"];
    secureElementIdentifier = v5->_secureElementIdentifier;
    v5->_secureElementIdentifier = (NSString *)v14;

    v5->_supportsAccessExpressMode = [v4 decodeBoolForKey:@"supportsAccessExpressMode"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  deviceName = self->_deviceName;
  id v5 = a3;
  [v5 encodeObject:deviceName forKey:@"deviceName"];
  [v5 encodeObject:self->_deviceSerialNumber forKey:@"deviceSerialNumber"];
  [v5 encodeObject:self->_deviceUDID forKey:@"deviceUDID"];
  [v5 encodeObject:self->_productType forKey:@"productType"];
  [v5 encodeObject:self->_secureElementIdentifier forKey:@"secureElementIdentifier"];
  [v5 encodeBool:self->_supportsAccessExpressMode forKey:@"supportsAccessExpressMode"];
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)PKTrustedDeviceEnrollmentInfo;
  uint64_t v4 = [(PKTrustedDeviceEnrollmentInfo *)&v9 description];
  id v5 = (void *)v4;
  if (self->_supportsAccessExpressMode) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  v7 = [v3 stringWithFormat:@"[%@ Device Name: %@, Serial Number: %@, UDID: %@, Product Type: %@, Secure Element Idetifier: %@, Supports Access Express Mode: %@]", v4, *(_OWORD *)&self->_deviceName, *(_OWORD *)&self->_deviceUDID, self->_secureElementIdentifier, v6];

  return v7;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceSerialNumber
{
  return self->_deviceSerialNumber;
}

- (void)setDeviceSerialNumber:(id)a3
{
}

- (NSString)deviceUDID
{
  return self->_deviceUDID;
}

- (void)setDeviceUDID:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (void)setSecureElementIdentifier:(id)a3
{
}

- (BOOL)supportsAccessExpressMode
{
  return self->_supportsAccessExpressMode;
}

- (void)setSupportsAccessExpressMode:(BOOL)a3
{
  self->_supportsAccessExpressMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end