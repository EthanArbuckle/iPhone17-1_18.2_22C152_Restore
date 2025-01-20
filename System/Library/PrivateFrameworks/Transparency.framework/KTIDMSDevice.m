@interface KTIDMSDevice
+ (BOOL)supportsSecureCoding;
- (KTIDMSDevice)initWithCoder:(id)a3;
- (NSString)build;
- (NSString)deviceID;
- (NSString)model;
- (NSString)name;
- (NSString)osVersion;
- (NSString)pushToken;
- (NSString)serial;
- (void)encodeWithCoder:(id)a3;
- (void)setBuild:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setSerial:(id)a3;
@end

@implementation KTIDMSDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v18 = a3;
  v4 = [(KTIDMSDevice *)self deviceID];

  if (v4)
  {
    v5 = [(KTIDMSDevice *)self deviceID];
    [v18 encodeObject:v5 forKey:@"deviceID"];
  }
  v6 = [(KTIDMSDevice *)self name];

  if (v6)
  {
    v7 = [(KTIDMSDevice *)self name];
    [v18 encodeObject:v7 forKey:@"name"];
  }
  v8 = [(KTIDMSDevice *)self model];

  if (v8)
  {
    v9 = [(KTIDMSDevice *)self model];
    [v18 encodeObject:v9 forKey:@"model"];
  }
  v10 = [(KTIDMSDevice *)self name];

  if (v10)
  {
    v11 = [(KTIDMSDevice *)self pushToken];
    [v18 encodeObject:v11 forKey:@"pushToken"];
  }
  v12 = [(KTIDMSDevice *)self osVersion];

  if (v12)
  {
    v13 = [(KTIDMSDevice *)self osVersion];
    [v18 encodeObject:v13 forKey:@"osVersion"];
  }
  v14 = [(KTIDMSDevice *)self build];

  if (v14)
  {
    v15 = [(KTIDMSDevice *)self build];
    [v18 encodeObject:v15 forKey:@"build"];
  }
  v16 = [(KTIDMSDevice *)self serial];

  if (v16)
  {
    v17 = [(KTIDMSDevice *)self serial];
    [v18 encodeObject:v17 forKey:@"serial"];
  }
}

- (KTIDMSDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)KTIDMSDevice;
  v5 = [(KTIDMSDevice *)&v15 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceID"];
    [(KTIDMSDevice *)v5 setDeviceID:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(KTIDMSDevice *)v5 setName:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"model"];
    [(KTIDMSDevice *)v5 setModel:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pushToken"];
    [(KTIDMSDevice *)v5 setPushToken:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"osVersion"];
    [(KTIDMSDevice *)v5 setOsVersion:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"build"];
    [(KTIDMSDevice *)v5 setBuild:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serial"];
    [(KTIDMSDevice *)v5 setSerial:v12];

    v13 = v5;
  }

  return v5;
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeviceID:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)pushToken
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPushToken:(id)a3
{
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setModel:(id)a3
{
}

- (NSString)osVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)build
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBuild:(id)a3
{
}

- (NSString)serial
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSerial:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serial, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end