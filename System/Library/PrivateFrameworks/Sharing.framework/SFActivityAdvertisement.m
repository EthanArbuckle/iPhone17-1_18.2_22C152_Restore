@interface SFActivityAdvertisement
+ (BOOL)supportsSecureCoding;
- (NSData)advertisementPayload;
- (NSDictionary)options;
- (SFActivityAdvertisement)initWithAdvertisementVersion:(unint64_t)a3 advertisementPayload:(id)a4 options:(id)a5 device:(id)a6;
- (SFActivityAdvertisement)initWithCoder:(id)a3;
- (SFPeerDevice)device;
- (id)description;
- (int64_t)advertisementVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SFActivityAdvertisement

- (SFActivityAdvertisement)initWithAdvertisementVersion:(unint64_t)a3 advertisementPayload:(id)a4 options:(id)a5 device:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SFActivityAdvertisement;
  v13 = [(SFActivityAdvertisement *)&v20 init];
  v14 = v13;
  if (v13)
  {
    v13->_advertisementVersion = a3;
    uint64_t v15 = [v10 copy];
    advertisementPayload = v14->_advertisementPayload;
    v14->_advertisementPayload = (NSData *)v15;

    uint64_t v17 = [v11 copy];
    options = v14->_options;
    v14->_options = (NSDictionary *)v17;

    objc_storeStrong((id *)&v14->_device, a6);
  }

  return v14;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(SFPeerDevice *)self->_device uniqueID];
  v7 = SFHexStringForData(self->_advertisementPayload);
  v8 = SFCompactStringFromCollection(self->_options);
  v9 = [(SFPeerDevice *)self->_device name];
  id v10 = [(SFPeerDevice *)self->_device modelIdentifier];
  id v11 = [v3 stringWithFormat:@"<%@: %p, deviceIdentifier:%@, advertisementPayload:%@, options:%@, deviceName:%@, deviceModelIdentifier:%@>", v5, self, v6, v7, v8, v9, v10];

  return v11;
}

- (SFActivityAdvertisement)initWithCoder:(id)a3
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SFActivityAdvertisement;
  v5 = [(SFActivityAdvertisement *)&v18 init];
  if (v5)
  {
    v5->_advertisementVersion = [v4 decodeIntegerForKey:@"advertisementVersion"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"advertisementPayload"];
    uint64_t v7 = [v6 copy];
    advertisementPayload = v5->_advertisementPayload;
    v5->_advertisementPayload = (NSData *)v7;

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
    id v11 = [v9 setWithArray:v10];
    id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"options"];
    uint64_t v13 = [v12 copy];
    options = v5->_options;
    v5->_options = (NSDictionary *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"device"];
    device = v5->_device;
    v5->_device = (SFPeerDevice *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t advertisementVersion = self->_advertisementVersion;
  id v5 = a3;
  [v5 encodeInteger:advertisementVersion forKey:@"advertisementVersion"];
  [v5 encodeObject:self->_advertisementPayload forKey:@"advertisementPayload"];
  [v5 encodeObject:self->_options forKey:@"options"];
  [v5 encodeObject:self->_device forKey:@"device"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)advertisementVersion
{
  return self->_advertisementVersion;
}

- (NSData)advertisementPayload
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (SFPeerDevice)device
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_advertisementPayload, 0);
}

@end