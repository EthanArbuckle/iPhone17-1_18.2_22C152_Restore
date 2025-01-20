@interface TUCTCapabilitiesState
+ (BOOL)supportsSecureCoding;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isCurrentlyAvailable;
- (BOOL)isEmergencyCurrentlyAvailable;
- (BOOL)isEmergencySupported;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCapabilitiesState:(id)a3;
- (BOOL)isProvisioningURLInvalid;
- (BOOL)isRoamingEnabled;
- (BOOL)isRoamingSupported;
- (BOOL)isSupported;
- (NSData)provisioningPostData;
- (NSString)description;
- (NSURL)provisioningURL;
- (TUCTCapabilitiesState)initWithCapabilityInfo:(id)a3;
- (TUCTCapabilitiesState)initWithCoder:(id)a3;
- (TUCTCapabilityInfo)ctCapabilityInfo;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)publiclyAccessibleCopy;
- (id)publiclyAccessibleCopyWithZone:(_NSZone *)a3;
- (int)provisioningStatus;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateProvisioningURL;
- (void)setCurrentlyAvailable:(BOOL)a3;
- (void)setEmergencyCurrentlyAvailable:(BOOL)a3;
- (void)setEmergencySupported:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setProvisioningPostData:(id)a3;
- (void)setProvisioningStatus:(int)a3;
- (void)setProvisioningURL:(id)a3;
- (void)setProvisioningURLInvalid:(BOOL)a3;
- (void)setRoamingEnabled:(BOOL)a3;
- (void)setRoamingSupported:(BOOL)a3;
- (void)setSupported:(BOOL)a3;
@end

@implementation TUCTCapabilitiesState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningPostData, 0);

  objc_storeStrong((id *)&self->_provisioningURL, 0);
}

- (TUCTCapabilitiesState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(TUCTCapabilitiesState *)self init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_provisioningStatus);
    v5->_provisioningStatus = [v4 decodeInt32ForKey:v6];

    uint64_t v7 = objc_opt_class();
    v8 = NSStringFromSelector(sel_provisioningURL);
    uint64_t v9 = [v4 decodeObjectOfClass:v7 forKey:v8];
    provisioningURL = v5->_provisioningURL;
    v5->_provisioningURL = (NSURL *)v9;

    uint64_t v11 = objc_opt_class();
    v12 = NSStringFromSelector(sel_provisioningPostData);
    uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
    provisioningPostData = v5->_provisioningPostData;
    v5->_provisioningPostData = (NSData *)v13;

    v15 = NSStringFromSelector(sel_isSupported);
    v5->_supported = [v4 decodeBoolForKey:v15];

    v16 = NSStringFromSelector(sel_isEnabled);
    v5->_enabled = [v4 decodeBoolForKey:v16];

    v17 = NSStringFromSelector(sel_isCurrentlyAvailable);
    v5->_currentlyAvailable = [v4 decodeBoolForKey:v17];

    v18 = NSStringFromSelector(sel_isRoamingEnabled);
    v5->_roamingEnabled = [v4 decodeBoolForKey:v18];

    v19 = NSStringFromSelector(sel_isRoamingSupported);
    v5->_roamingSupported = [v4 decodeBoolForKey:v19];

    v20 = NSStringFromSelector(sel_isEmergencySupported);
    v5->_emergencySupported = [v4 decodeBoolForKey:v20];

    v21 = NSStringFromSelector(sel_isEmergencyCurrentlyAvailable);
    v5->_emergencyCurrentlyAvailable = [v4 decodeBoolForKey:v21];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUCTCapabilitiesState *)self provisioningStatus];
  v6 = NSStringFromSelector(sel_provisioningStatus);
  [v4 encodeInt32:v5 forKey:v6];

  uint64_t v7 = [(TUCTCapabilitiesState *)self provisioningURL];
  v8 = NSStringFromSelector(sel_provisioningURL);
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(TUCTCapabilitiesState *)self provisioningPostData];
  v10 = NSStringFromSelector(sel_provisioningPostData);
  [v4 encodeObject:v9 forKey:v10];

  BOOL v11 = [(TUCTCapabilitiesState *)self isSupported];
  v12 = NSStringFromSelector(sel_isSupported);
  [v4 encodeBool:v11 forKey:v12];

  BOOL v13 = [(TUCTCapabilitiesState *)self isEnabled];
  v14 = NSStringFromSelector(sel_isEnabled);
  [v4 encodeBool:v13 forKey:v14];

  BOOL v15 = [(TUCTCapabilitiesState *)self isCurrentlyAvailable];
  v16 = NSStringFromSelector(sel_isCurrentlyAvailable);
  [v4 encodeBool:v15 forKey:v16];

  BOOL v17 = [(TUCTCapabilitiesState *)self isRoamingEnabled];
  v18 = NSStringFromSelector(sel_isRoamingEnabled);
  [v4 encodeBool:v17 forKey:v18];

  BOOL v19 = [(TUCTCapabilitiesState *)self isRoamingSupported];
  v20 = NSStringFromSelector(sel_isRoamingSupported);
  [v4 encodeBool:v19 forKey:v20];

  BOOL v21 = [(TUCTCapabilitiesState *)self isEmergencySupported];
  v22 = NSStringFromSelector(sel_isEmergencySupported);
  [v4 encodeBool:v21 forKey:v22];

  BOOL v23 = [(TUCTCapabilitiesState *)self isEmergencyCurrentlyAvailable];
  NSStringFromSelector(sel_isEmergencyCurrentlyAvailable);
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v23 forKey:v24];
}

- (NSURL)provisioningURL
{
  return self->_provisioningURL;
}

- (int)provisioningStatus
{
  return self->_provisioningStatus;
}

- (NSData)provisioningPostData
{
  return self->_provisioningPostData;
}

- (BOOL)isSupported
{
  return self->_supported;
}

- (BOOL)isRoamingSupported
{
  return self->_roamingSupported;
}

- (BOOL)isRoamingEnabled
{
  return self->_roamingEnabled;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isEmergencySupported
{
  return self->_emergencySupported;
}

- (BOOL)isEmergencyCurrentlyAvailable
{
  return self->_emergencyCurrentlyAvailable;
}

- (BOOL)isCurrentlyAvailable
{
  return self->_currentlyAvailable;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUCTCapabilityInfo)ctCapabilityInfo
{
  v3 = objc_alloc_init(TUCTCapabilityInfo);
  uint64_t v4 = [(TUCTCapabilitiesState *)self provisioningStatus];
  if (v4 <= 3) {
    [(TUCTCapabilityInfo *)v3 setProvisioningStatus:v4];
  }
  uint64_t v5 = [(TUCTCapabilitiesState *)self provisioningURL];
  [(TUCTCapabilityInfo *)v3 setProvisioningURL:v5];

  v6 = [(TUCTCapabilitiesState *)self provisioningPostData];
  [(TUCTCapabilityInfo *)v3 setProvisioningPostData:v6];

  [(TUCTCapabilityInfo *)v3 setCanEnable:[(TUCTCapabilitiesState *)self isSupported]];
  [(TUCTCapabilityInfo *)v3 setEnabled:[(TUCTCapabilitiesState *)self isEnabled]];
  [(TUCTCapabilityInfo *)v3 setCanEnableRoaming:[(TUCTCapabilitiesState *)self isRoamingSupported]];
  [(TUCTCapabilityInfo *)v3 setRoamingEnabled:[(TUCTCapabilitiesState *)self isRoamingEnabled]];

  return v3;
}

- (TUCTCapabilitiesState)initWithCapabilityInfo:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TUCTCapabilitiesState;
  uint64_t v5 = [(TUCTCapabilitiesState *)&v22 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F23EC0]];
    if ([v6 isEqualToString:*MEMORY[0x1E4F23ED0]])
    {
      int v7 = 0;
    }
    else if ([v6 isEqualToString:*MEMORY[0x1E4F23EC8]])
    {
      int v7 = 1;
    }
    else if ([v6 isEqualToString:*MEMORY[0x1E4F23ED8]])
    {
      int v7 = 2;
    }
    else
    {
      if (![v6 isEqualToString:*MEMORY[0x1E4F23EE0]])
      {
LABEL_11:
        v8 = (void *)MEMORY[0x1E4F1CB10];
        uint64_t v9 = *MEMORY[0x1E4F23EE8];
        v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F23EE8]];
        BOOL v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F242A8]];
        uint64_t v12 = [v8 URLWithString:v11];
        provisioningURL = v5->_provisioningURL;
        v5->_provisioningURL = (NSURL *)v12;

        v14 = [v4 objectForKeyedSubscript:v9];
        uint64_t v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F242A0]];
        provisioningPostData = v5->_provisioningPostData;
        v5->_provisioningPostData = (NSData *)v15;

        BOOL v17 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F23B78]];
        v5->_supported = [v17 BOOLValue];

        v18 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F23B80]];
        v5->_enabled = [v18 BOOLValue];

        BOOL v19 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F24310]];
        v5->_roamingSupported = [v19 BOOLValue];

        v20 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F24318]];
        v5->_roamingEnabled = [v20 BOOLValue];

        goto LABEL_12;
      }
      int v7 = 3;
    }
    v5->_provisioningStatus = v7;
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (BOOL)isProvisioningURLInvalid
{
  v2 = [(TUCTCapabilitiesState *)self provisioningURL];
  v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"__INVALID_PROVISIONING_URL__"];
  char v4 = [v2 isEqual:v3];

  return v4;
}

- (void)invalidateProvisioningURL
{
  id v3 = [MEMORY[0x1E4F1CB10] URLWithString:@"__INVALID_PROVISIONING_URL__"];
  [(TUCTCapabilitiesState *)self setProvisioningURL:v3];
}

- (BOOL)isEqualToCapabilitiesState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUCTCapabilitiesState *)self provisioningPostData];
  v6 = [v4 provisioningPostData];
  if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6)
    && (int v7 = [(TUCTCapabilitiesState *)self provisioningStatus],
        v7 == [v4 provisioningStatus]))
  {
    v8 = [(TUCTCapabilitiesState *)self provisioningURL];
    uint64_t v9 = [v4 provisioningURL];
    if (TUObjectsAreEqualOrNil((unint64_t)v8, (uint64_t)v9)
      && (int v10 = [(TUCTCapabilitiesState *)self isCurrentlyAvailable],
          v10 == [v4 isCurrentlyAvailable])
      && (int v11 = -[TUCTCapabilitiesState isEnabled](self, "isEnabled"), v11 == [v4 isEnabled])&& (v12 = -[TUCTCapabilitiesState isSupported](self, "isSupported"), v12 == objc_msgSend(v4, "isSupported"))&& (v13 = -[TUCTCapabilitiesState isEmergencyCurrentlyAvailable](self, "isEmergencyCurrentlyAvailable"), v13 == objc_msgSend(v4, "isEmergencyCurrentlyAvailable"))&& (v14 = -[TUCTCapabilitiesState isEmergencySupported](self, "isEmergencySupported"), v14 == objc_msgSend(v4, "isEmergencySupported"))&& (v15 = -[TUCTCapabilitiesState isRoamingEnabled](self, "isRoamingEnabled"), v15 == objc_msgSend(v4, "isRoamingEnabled")))
    {
      BOOL v18 = [(TUCTCapabilitiesState *)self isRoamingSupported];
      int v16 = v18 ^ [v4 isRoamingSupported] ^ 1;
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = -[TUCTCapabilitiesState publiclyAccessibleCopyWithZone:](self, "publiclyAccessibleCopyWithZone:");
  v6 = [(TUCTCapabilitiesState *)self provisioningPostData];
  uint64_t v7 = [v6 copyWithZone:a3];
  v8 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v7;

  *(_DWORD *)(v5 + 16) = [(TUCTCapabilitiesState *)self provisioningStatus];
  uint64_t v9 = [(TUCTCapabilitiesState *)self provisioningURL];
  uint64_t v10 = [v9 copyWithZone:a3];
  int v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  return (id)v5;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_provisioningStatus);
  [v3 appendFormat:@" %@=%d", v4, -[TUCTCapabilitiesState provisioningStatus](self, "provisioningStatus")];

  uint64_t v5 = NSStringFromSelector(sel_provisioningURL);
  v6 = [(TUCTCapabilitiesState *)self provisioningURL];
  [v3 appendFormat:@" %@=%@", v5, v6];

  uint64_t v7 = NSStringFromSelector(sel_provisioningPostData);
  v8 = [(TUCTCapabilitiesState *)self provisioningPostData];
  [v3 appendFormat:@" %@=%p", v7, v8];

  uint64_t v9 = NSStringFromSelector(sel_isSupported);
  [v3 appendFormat:@" %@=%d", v9, -[TUCTCapabilitiesState isSupported](self, "isSupported")];

  uint64_t v10 = NSStringFromSelector(sel_isEnabled);
  [v3 appendFormat:@" %@=%d", v10, -[TUCTCapabilitiesState isEnabled](self, "isEnabled")];

  int v11 = NSStringFromSelector(sel_isCurrentlyAvailable);
  [v3 appendFormat:@" %@=%d", v11, -[TUCTCapabilitiesState isCurrentlyAvailable](self, "isCurrentlyAvailable")];

  int v12 = NSStringFromSelector(sel_isRoamingSupported);
  [v3 appendFormat:@" %@=%d", v12, -[TUCTCapabilitiesState isRoamingSupported](self, "isRoamingSupported")];

  int v13 = NSStringFromSelector(sel_isRoamingEnabled);
  [v3 appendFormat:@" %@=%d", v13, -[TUCTCapabilitiesState isRoamingEnabled](self, "isRoamingEnabled")];

  int v14 = NSStringFromSelector(sel_isEmergencySupported);
  [v3 appendFormat:@" %@=%d", v14, -[TUCTCapabilitiesState isEmergencySupported](self, "isEmergencySupported")];

  int v15 = NSStringFromSelector(sel_isEmergencyCurrentlyAvailable);
  [v3 appendFormat:@" %@=%d", v15, -[TUCTCapabilitiesState isEmergencyCurrentlyAvailable](self, "isEmergencyCurrentlyAvailable")];

  [v3 appendString:@">"];

  return (NSString *)v3;
}

- (unint64_t)hash
{
  id v3 = [(TUCTCapabilitiesState *)self provisioningPostData];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = v4 ^ [(TUCTCapabilitiesState *)self provisioningStatus];
  v6 = [(TUCTCapabilitiesState *)self provisioningURL];
  uint64_t v7 = v5 ^ [v6 hash];
  if ([(TUCTCapabilitiesState *)self isCurrentlyAvailable]) {
    uint64_t v8 = 1231;
  }
  else {
    uint64_t v8 = 1237;
  }
  if ([(TUCTCapabilitiesState *)self isEnabled]) {
    uint64_t v9 = 1231;
  }
  else {
    uint64_t v9 = 1237;
  }
  uint64_t v10 = v7 ^ v8 ^ v9;
  if ([(TUCTCapabilitiesState *)self isSupported]) {
    uint64_t v11 = 1231;
  }
  else {
    uint64_t v11 = 1237;
  }
  if ([(TUCTCapabilitiesState *)self isEmergencyCurrentlyAvailable]) {
    uint64_t v12 = 1231;
  }
  else {
    uint64_t v12 = 1237;
  }
  uint64_t v13 = v11 ^ v12;
  if ([(TUCTCapabilitiesState *)self isEmergencySupported]) {
    uint64_t v14 = 1231;
  }
  else {
    uint64_t v14 = 1237;
  }
  uint64_t v15 = v10 ^ v13 ^ v14;
  if ([(TUCTCapabilitiesState *)self isRoamingEnabled]) {
    uint64_t v16 = 1231;
  }
  else {
    uint64_t v16 = 1237;
  }
  if ([(TUCTCapabilitiesState *)self isRoamingSupported]) {
    uint64_t v17 = 1231;
  }
  else {
    uint64_t v17 = 1237;
  }
  unint64_t v18 = v15 ^ v16 ^ v17;

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (TUCTCapabilitiesState *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUCTCapabilitiesState *)self isEqualToCapabilitiesState:v4];
  }

  return v5;
}

- (id)publiclyAccessibleCopy
{
  return [(TUCTCapabilitiesState *)self publiclyAccessibleCopyWithZone:0];
}

- (id)publiclyAccessibleCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSupported:", -[TUCTCapabilitiesState isSupported](self, "isSupported"));
  objc_msgSend(v4, "setEnabled:", -[TUCTCapabilitiesState isEnabled](self, "isEnabled"));
  objc_msgSend(v4, "setCurrentlyAvailable:", -[TUCTCapabilitiesState isCurrentlyAvailable](self, "isCurrentlyAvailable"));
  objc_msgSend(v4, "setRoamingSupported:", -[TUCTCapabilitiesState isRoamingSupported](self, "isRoamingSupported"));
  objc_msgSend(v4, "setRoamingEnabled:", -[TUCTCapabilitiesState isRoamingEnabled](self, "isRoamingEnabled"));
  objc_msgSend(v4, "setEmergencySupported:", -[TUCTCapabilitiesState isEmergencySupported](self, "isEmergencySupported"));
  objc_msgSend(v4, "setEmergencyCurrentlyAvailable:", -[TUCTCapabilitiesState isEmergencyCurrentlyAvailable](self, "isEmergencyCurrentlyAvailable"));

  return v4;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)unarchivedObjectClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  uint64_t v8 = [a1 unarchivedObjectClasses];
  uint64_t v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (void)setProvisioningStatus:(int)a3
{
  self->_provisioningStatus = a3;
}

- (void)setProvisioningURL:(id)a3
{
}

- (void)setProvisioningURLInvalid:(BOOL)a3
{
  self->_provisioningURLInvalid = a3;
}

- (void)setProvisioningPostData:(id)a3
{
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setCurrentlyAvailable:(BOOL)a3
{
  self->_currentlyAvailable = a3;
}

- (void)setRoamingSupported:(BOOL)a3
{
  self->_roamingSupported = a3;
}

- (void)setRoamingEnabled:(BOOL)a3
{
  self->_roamingEnabled = a3;
}

- (void)setEmergencySupported:(BOOL)a3
{
  self->_emergencySupported = a3;
}

- (void)setEmergencyCurrentlyAvailable:(BOOL)a3
{
  self->_emergencyCurrentlyAvailable = a3;
}

@end