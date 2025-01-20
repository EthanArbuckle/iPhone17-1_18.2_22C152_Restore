@interface SOSTrustedDeviceAttributes
+ (BOOL)supportsSecureCoding;
- (NSString)machineID;
- (NSString)serialNumber;
- (SOSTrustedDeviceAttributes)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setMachineID:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation SOSTrustedDeviceAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);

  objc_storeStrong((id *)&self->_machineID, 0);
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMachineID:(id)a3
{
}

- (NSString)machineID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  machineID = self->_machineID;
  id v5 = a3;
  [v5 encodeObject:machineID forKey:@"machineID"];
  [v5 encodeObject:self->_serialNumber forKey:@"serialNumber"];
}

- (SOSTrustedDeviceAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SOSTrustedDeviceAttributes;
  id v5 = [(SOSTrustedDeviceAttributes *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"machineID"];
    machineID = v5->_machineID;
    v5->_machineID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end