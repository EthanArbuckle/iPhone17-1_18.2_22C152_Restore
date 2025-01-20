@interface KTDeviceStatus
+ (BOOL)supportsSecureCoding;
- (KTDeviceStatus)initWithCoder:(id)a3;
- (KTIDMSDevice)idms;
- (KTLoggableData)loggableData;
- (NSError)loggableDataError;
- (void)encodeWithCoder:(id)a3;
- (void)setIdms:(id)a3;
- (void)setLoggableData:(id)a3;
- (void)setLoggableDataError:(id)a3;
@end

@implementation KTDeviceStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  v4 = [(KTDeviceStatus *)self idms];

  if (v4)
  {
    v5 = [(KTDeviceStatus *)self idms];
    [v12 encodeObject:v5 forKey:@"idms"];
  }
  v6 = [(KTDeviceStatus *)self loggableData];

  if (v6)
  {
    v7 = [(KTDeviceStatus *)self loggableData];
    [v12 encodeObject:v7 forKey:@"loggableData"];
  }
  v8 = [(KTDeviceStatus *)self loggableDataError];

  if (v8)
  {
    v9 = (void *)MEMORY[0x263F16D80];
    v10 = [(KTDeviceStatus *)self loggableDataError];
    v11 = [v9 cleanseErrorForXPC:v10];
    [v12 encodeObject:v11 forKey:@"loggableDataError"];
  }
}

- (KTDeviceStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KTDeviceStatus;
  v5 = [(KTDeviceStatus *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idms"];
    [(KTDeviceStatus *)v5 setIdms:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loggableData"];
    [(KTDeviceStatus *)v5 setLoggableData:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"loggableDataError"];
    [(KTDeviceStatus *)v5 setLoggableDataError:v8];

    v9 = v5;
  }

  return v5;
}

- (KTIDMSDevice)idms
{
  return (KTIDMSDevice *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdms:(id)a3
{
}

- (KTLoggableData)loggableData
{
  return (KTLoggableData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLoggableData:(id)a3
{
}

- (NSError)loggableDataError
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLoggableDataError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggableDataError, 0);
  objc_storeStrong((id *)&self->_loggableData, 0);

  objc_storeStrong((id *)&self->_idms, 0);
}

@end