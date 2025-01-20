@interface MRRapportTransportConfiguration
+ (BOOL)supportsSecureCoding;
- (MRRapportTransportConfiguration)initWithCoder:(id)a3;
- (NSString)deviceUID;
- (NSString)name;
- (NSString)sessionUID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceUID:(id)a3;
- (void)setName:(id)a3;
- (void)setSessionUID:(id)a3;
@end

@implementation MRRapportTransportConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  deviceUID = self->_deviceUID;
  id v5 = a3;
  [v5 encodeObject:deviceUID forKey:@"device"];
  [v5 encodeObject:self->_sessionUID forKey:@"session"];
}

- (MRRapportTransportConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MRRapportTransportConfiguration);
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"device"];
  v7 = (void *)[v6 copy];
  [(MRRapportTransportConfiguration *)v5 setDeviceUID:v7];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"session"];

  v9 = (void *)[v8 copy];
  [(MRRapportTransportConfiguration *)v5 setSessionUID:v9];

  return v5;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"device=%@(%@), session=%@", self->_deviceUID, self->_name, self->_sessionUID];

  return v2;
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (void)setDeviceUID:(id)a3
{
}

- (NSString)sessionUID
{
  return self->_sessionUID;
}

- (void)setSessionUID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_sessionUID, 0);

  objc_storeStrong((id *)&self->_deviceUID, 0);
}

@end