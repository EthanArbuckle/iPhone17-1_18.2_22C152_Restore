@interface TransparencyCloudDevice
+ (BOOL)supportsSecureCoding;
- (KTLoggableData)loggableData;
- (NSString)serialNumber;
- (NSString)state;
- (TransparencyCloudDevice)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLoggableData:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setState:(id)a3;
@end

@implementation TransparencyCloudDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TransparencyCloudDevice *)self loggableData];
  [v4 encodeObject:v5 forKey:@"loggableData"];

  v6 = [(TransparencyCloudDevice *)self state];
  [v4 encodeObject:v6 forKey:@"state"];

  id v7 = [(TransparencyCloudDevice *)self serialNumber];
  [v4 encodeObject:v7 forKey:@"sn"];
}

- (TransparencyCloudDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TransparencyCloudDevice;
  v5 = [(TransparencyCloudDevice *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loggableData"];
    [(TransparencyCloudDevice *)v5 setLoggableData:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"state"];
    [(TransparencyCloudDevice *)v5 setState:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sn"];
    [(TransparencyCloudDevice *)v5 setSerialNumber:v8];

    v9 = v5;
  }

  return v5;
}

- (KTLoggableData)loggableData
{
  return (KTLoggableData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLoggableData:(id)a3
{
}

- (NSString)state
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setState:(id)a3
{
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_loggableData, 0);
}

@end