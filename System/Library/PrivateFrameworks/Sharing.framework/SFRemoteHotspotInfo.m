@interface SFRemoteHotspotInfo
+ (BOOL)supportsSecureCoding;
- (NSNumber)channel;
- (NSString)name;
- (NSString)password;
- (SFRemoteHotspotInfo)initWithCoder:(id)a3;
- (SFRemoteHotspotInfo)initWithName:(id)a3 password:(id)a4 channel:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChannel:(id)a3;
- (void)setName:(id)a3;
- (void)setPassword:(id)a3;
@end

@implementation SFRemoteHotspotInfo

- (SFRemoteHotspotInfo)initWithName:(id)a3 password:(id)a4 channel:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SFRemoteHotspotInfo;
  v11 = [(SFRemoteHotspotInfo *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    name = v11->_name;
    v11->_name = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    password = v11->_password;
    v11->_password = (NSString *)v14;

    objc_storeStrong((id *)&v11->_channel, a5);
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  if (self->_password) {
    v7 = "yes";
  }
  else {
    v7 = "no";
  }
  id v8 = [v3 stringWithFormat:@"<%@: %p, name: %@, channel: %@, hasPassword: %s>", v5, self, self->_name, self->_channel, v7];

  return v8;
}

- (SFRemoteHotspotInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFRemoteHotspotInfo;
  uint64_t v5 = [(SFRemoteHotspotInfo *)&v16 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkName"];
    uint64_t v7 = [v6 copy];
    name = v5->_name;
    v5->_name = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkPassword"];
    uint64_t v10 = [v9 copy];
    password = v5->_password;
    v5->_password = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkChannel"];
    uint64_t v13 = [v12 copy];
    channel = v5->_channel;
    v5->_channel = (NSNumber *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"networkName"];
  [v5 encodeObject:self->_password forKey:@"networkPassword"];
  [v5 encodeObject:self->_channel forKey:@"networkChannel"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPassword:(id)a3
{
}

- (NSNumber)channel
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setChannel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_password, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end