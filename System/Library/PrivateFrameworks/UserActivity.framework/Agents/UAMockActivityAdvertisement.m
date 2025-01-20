@interface UAMockActivityAdvertisement
+ (BOOL)supportsSecureCoding;
- (NSData)advertisementPayload;
- (NSDictionary)options;
- (SFPeerDevice)device;
- (UAMockActivityAdvertisement)init;
- (UAMockActivityAdvertisement)initWithCoder:(id)a3;
- (id)description;
- (int64_t)advertisementVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setAdvertisementPayload:(id)a3;
- (void)setAdvertisementVersion:(int64_t)a3;
- (void)setDevice:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation UAMockActivityAdvertisement

- (UAMockActivityAdvertisement)init
{
  v3.receiver = self;
  v3.super_class = (Class)UAMockActivityAdvertisement;
  return [(UAMockActivityAdvertisement *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[UAMockActivityAdvertisement advertisementVersion](self, "advertisementVersion"), @"version");
  v5 = [(UAMockActivityAdvertisement *)self advertisementPayload];
  [v4 encodeObject:v5 forKey:@"payload"];

  v6 = [(UAMockActivityAdvertisement *)self options];
  [v4 encodeObject:v6 forKey:@"options"];

  id v7 = [(UAMockActivityAdvertisement *)self device];
  [v4 encodeObject:v7 forKey:@"device"];
}

- (UAMockActivityAdvertisement)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UAMockActivityAdvertisement;
  v5 = [(UAMockActivityAdvertisement *)&v13 init];
  if (v5)
  {
    v5->_advertisementVersion = (int)[v4 decodeInt32ForKey:@"version"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
    advertisementPayload = v5->_advertisementPayload;
    v5->_advertisementPayload = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"options"];
    options = v5->_options;
    v5->_options = (NSDictionary *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"device"];
    device = v5->_device;
    v5->_device = (SFPeerDevice *)v10;
  }
  return v5;
}

- (id)description
{
  v5 = [(UAMockActivityAdvertisement *)self advertisementPayload];
  uint64_t v6 = sub_100003070(v5);
  id v7 = [(UAMockActivityAdvertisement *)self options];
  if (v7)
  {
    v2 = [(UAMockActivityAdvertisement *)self options];
    objc_super v3 = [v2 description];
    sub_100063FF0(v3);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = &stru_1000C6800;
  }
  v9 = [(UAMockActivityAdvertisement *)self device];
  uint64_t v10 = +[NSString stringWithFormat:@"MockAdvertisement($%@/%@ from %@)", v6, v8, v9];

  if (v7)
  {
  }

  return v10;
}

- (int64_t)advertisementVersion
{
  return self->_advertisementVersion;
}

- (void)setAdvertisementVersion:(int64_t)a3
{
  self->_advertisementVersion = a3;
}

- (NSData)advertisementPayload
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAdvertisementPayload:(id)a3
{
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOptions:(id)a3
{
}

- (SFPeerDevice)device
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_advertisementPayload, 0);
}

@end