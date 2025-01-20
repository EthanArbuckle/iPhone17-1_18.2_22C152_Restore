@interface TUCTCapabilityInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)canEnable;
- (BOOL)canEnableRoaming;
- (BOOL)isEnabled;
- (BOOL)isProvisioningURLInvalid;
- (BOOL)isRoamingEnabled;
- (NSData)provisioningPostData;
- (NSString)description;
- (NSURL)provisioningURL;
- (TUCTCapabilityInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)publiclyAccessibleCopy;
- (id)publiclyAccessibleCopyWithZone:(_NSZone *)a3;
- (int)provisioningStatus;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateProvisioningURL;
- (void)setCanEnable:(BOOL)a3;
- (void)setCanEnableRoaming:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setProvisioningPostData:(id)a3;
- (void)setProvisioningStatus:(int)a3;
- (void)setProvisioningURL:(id)a3;
- (void)setRoamingEnabled:(BOOL)a3;
@end

@implementation TUCTCapabilityInfo

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(TUCTCapabilityInfo *)self provisioningStatus];
  v6 = [(TUCTCapabilityInfo *)self provisioningURL];
  v7 = [(TUCTCapabilityInfo *)self provisioningPostData];
  v8 = [v3 stringWithFormat:@"<%@ %p provisioningStatus=%d provisioningURL=%@ provisioningPostData=%p canEnable=%d isEnabled=%d>", v4, self, v5, v6, v7, -[TUCTCapabilityInfo canEnable](self, "canEnable"), -[TUCTCapabilityInfo isEnabled](self, "isEnabled")];

  return (NSString *)v8;
}

- (BOOL)isProvisioningURLInvalid
{
  v2 = [(TUCTCapabilityInfo *)self provisioningURL];
  v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"__INVALID_PROVISIONING_URL__"];
  char v4 = [v2 isEqual:v3];

  return v4;
}

- (void)invalidateProvisioningURL
{
  id v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"__INVALID_PROVISIONING_URL__"];
  [(TUCTCapabilityInfo *)self setProvisioningURL:v3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUCTCapabilityInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUCTCapabilityInfo *)self init];
  if (v5)
  {
    v5->_provisioningStatus = [v4 decodeInt32ForKey:@"provisioningStatus"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningURL"];
    provisioningURL = v5->_provisioningURL;
    v5->_provisioningURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"provisioningPostData"];
    provisioningPostData = v5->_provisioningPostData;
    v5->_provisioningPostData = (NSData *)v8;

    v5->_canEnable = [v4 decodeBoolForKey:@"canEnable"];
    v5->_enabled = [v4 decodeBoolForKey:@"enabled"];
    v5->_roamingEnabled = [v4 decodeBoolForKey:@"roamingEnabled"];
    v5->_canEnableRoaming = [v4 decodeBoolForKey:@"canEnableRoaming"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeInt32:forKey:", -[TUCTCapabilityInfo provisioningStatus](self, "provisioningStatus"), @"provisioningStatus");
  id v4 = [(TUCTCapabilityInfo *)self provisioningURL];
  [v6 encodeObject:v4 forKey:@"provisioningURL"];

  uint64_t v5 = [(TUCTCapabilityInfo *)self provisioningPostData];
  [v6 encodeObject:v5 forKey:@"provisioningPostData"];

  objc_msgSend(v6, "encodeBool:forKey:", -[TUCTCapabilityInfo canEnable](self, "canEnable"), @"canEnable");
  objc_msgSend(v6, "encodeBool:forKey:", -[TUCTCapabilityInfo isEnabled](self, "isEnabled"), @"enabled");
  objc_msgSend(v6, "encodeBool:forKey:", -[TUCTCapabilityInfo isRoamingEnabled](self, "isRoamingEnabled"), @"roamingEnabled");
  objc_msgSend(v6, "encodeBool:forKey:", -[TUCTCapabilityInfo canEnableRoaming](self, "canEnableRoaming"), @"canEnableRoaming");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(TUCTCapabilityInfo *)self publiclyAccessibleCopyWithZone:a3];
  objc_msgSend(v4, "setProvisioningStatus:", -[TUCTCapabilityInfo provisioningStatus](self, "provisioningStatus"));
  uint64_t v5 = [(TUCTCapabilityInfo *)self provisioningURL];
  [v4 setProvisioningURL:v5];

  id v6 = [(TUCTCapabilityInfo *)self provisioningPostData];
  [v4 setProvisioningPostData:v6];

  objc_msgSend(v4, "setEnabled:", -[TUCTCapabilityInfo isEnabled](self, "isEnabled"));
  objc_msgSend(v4, "setCanEnable:", -[TUCTCapabilityInfo canEnable](self, "canEnable"));
  return v4;
}

- (id)publiclyAccessibleCopy
{
  return [(TUCTCapabilityInfo *)self publiclyAccessibleCopyWithZone:0];
}

- (id)publiclyAccessibleCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setCanEnable:", -[TUCTCapabilityInfo canEnable](self, "canEnable"));
  objc_msgSend(v4, "setEnabled:", -[TUCTCapabilityInfo isEnabled](self, "isEnabled"));
  objc_msgSend(v4, "setRoamingEnabled:", -[TUCTCapabilityInfo isRoamingEnabled](self, "isRoamingEnabled"));
  objc_msgSend(v4, "setCanEnableRoaming:", -[TUCTCapabilityInfo canEnableRoaming](self, "canEnableRoaming"));

  return v4;
}

- (int)provisioningStatus
{
  return self->_provisioningStatus;
}

- (void)setProvisioningStatus:(int)a3
{
  self->_provisioningStatus = a3;
}

- (NSURL)provisioningURL
{
  return self->_provisioningURL;
}

- (void)setProvisioningURL:(id)a3
{
}

- (NSData)provisioningPostData
{
  return self->_provisioningPostData;
}

- (void)setProvisioningPostData:(id)a3
{
}

- (BOOL)canEnable
{
  return self->_canEnable;
}

- (void)setCanEnable:(BOOL)a3
{
  self->_canEnable = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)canEnableRoaming
{
  return self->_canEnableRoaming;
}

- (void)setCanEnableRoaming:(BOOL)a3
{
  self->_canEnableRoaming = a3;
}

- (BOOL)isRoamingEnabled
{
  return self->_roamingEnabled;
}

- (void)setRoamingEnabled:(BOOL)a3
{
  self->_roamingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningPostData, 0);

  objc_storeStrong((id *)&self->_provisioningURL, 0);
}

@end