@interface PKOSVersionRequirement
+ (BOOL)supportsSecureCoding;
+ (id)fromDeviceVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOSVersionRequirement:(id)a3;
- (NSString)appletv;
- (NSString)ipad;
- (NSString)iphone;
- (NSString)ipod;
- (NSString)mac;
- (NSString)specifiediphone;
- (NSString)vision;
- (NSString)watch;
- (PKOSVersionRequirement)initWithCoder:(id)a3;
- (PKOSVersionRequirement)initWithDictionary:(id)a3;
- (id)asDictionary;
- (id)copyWithZone:(_NSZone *)a3;
- (id)versionForDeviceClass:(id)a3;
- (int64_t)compare:(id)a3 deviceClass:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKOSVersionRequirement

- (PKOSVersionRequirement)initWithDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKOSVersionRequirement;
  v5 = [(PKOSVersionRequirement *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"iPhone"];
    iphone = v5->_iphone;
    v5->_iphone = (NSString *)v6;

    objc_storeStrong((id *)&v5->_specifiediphone, v5->_iphone);
    uint64_t v8 = [v4 PKStringForKey:@"iPad"];
    ipad = v5->_ipad;
    v5->_ipad = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"iPod"];
    ipod = v5->_ipod;
    v5->_ipod = (NSString *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"AppleTV"];
    appletv = v5->_appletv;
    v5->_appletv = (NSString *)v12;

    uint64_t v14 = [v4 PKStringForKey:@"RealityDevice"];
    vision = v5->_vision;
    v5->_vision = (NSString *)v14;

    v16 = [v4 PKDictionaryForKey:@"WatchOS"];
    v17 = v16;
    if (v16)
    {
      uint64_t v18 = [v16 PKStringForKey:@"iPhone"];
      v19 = v5->_iphone;
      v5->_iphone = (NSString *)v18;

      uint64_t v20 = [v17 PKStringForKey:@"Watch"];
      watch = v5->_watch;
      v5->_watch = (NSString *)v20;
    }
    uint64_t v22 = [v4 PKStringForKey:@"Mac"];
    mac = v5->_mac;
    v5->_mac = (NSString *)v22;
  }
  return v5;
}

+ (id)fromDeviceVersion
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = PKDeviceClass();
  v7 = v2;
  v3 = PKOSVersion();
  v8[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  v5 = [[PKOSVersionRequirement alloc] initWithDictionary:v4];
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiediphone, 0);
  objc_storeStrong((id *)&self->_vision, 0);
  objc_storeStrong((id *)&self->_watch, 0);
  objc_storeStrong((id *)&self->_mac, 0);
  objc_storeStrong((id *)&self->_appletv, 0);
  objc_storeStrong((id *)&self->_ipod, 0);
  objc_storeStrong((id *)&self->_ipad, 0);
  objc_storeStrong((id *)&self->_iphone, 0);
}

- (id)asDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  specifiediphone = self->_specifiediphone;
  if (specifiediphone) {
    [v3 setObject:specifiediphone forKeyedSubscript:@"iPhone"];
  }
  ipad = self->_ipad;
  if (ipad) {
    [v4 setObject:ipad forKeyedSubscript:@"iPad"];
  }
  ipod = self->_ipod;
  if (ipod) {
    [v4 setObject:ipod forKeyedSubscript:@"iPod"];
  }
  appletv = self->_appletv;
  if (appletv) {
    [v4 setObject:appletv forKeyedSubscript:@"AppleTV"];
  }
  vision = self->_vision;
  if (vision) {
    [v4 setObject:vision forKeyedSubscript:@"RealityDevice"];
  }
  if (self->_watch)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v10 setObject:self->_watch forKeyedSubscript:@"Watch"];
    iphone = self->_iphone;
    if (iphone) {
      [v10 setObject:iphone forKeyedSubscript:@"iPhone"];
    }
    uint64_t v12 = (void *)[v10 copy];
    [v4 setObject:v12 forKeyedSubscript:@"WatchOS"];
  }
  mac = self->_mac;
  if (mac) {
    [v4 setObject:mac forKeyedSubscript:@"Mac"];
  }
  uint64_t v14 = (void *)[v4 copy];

  return v14;
}

- (int64_t)compare:(id)a3 deviceClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"Mac"])
  {
    mac = self->_mac;
    uint64_t v9 = [v6 mac];
  }
  else if ([v7 isEqualToString:@"iPhone"])
  {
    mac = self->_iphone;
    uint64_t v9 = [v6 iphone];
  }
  else if ([v7 isEqualToString:@"Watch"])
  {
    mac = self->_watch;
    uint64_t v9 = [v6 watch];
  }
  else if ([v7 isEqualToString:@"iPod"])
  {
    mac = self->_ipod;
    uint64_t v9 = [v6 ipod];
  }
  else if ([v7 isEqualToString:@"iPad"])
  {
    mac = self->_ipad;
    uint64_t v9 = [v6 ipad];
  }
  else if ([v7 isEqualToString:@"AppleTV"])
  {
    mac = self->_appletv;
    uint64_t v9 = [v6 appletv];
  }
  else
  {
    if (![v7 isEqualToString:@"RealityDevice"])
    {
      int64_t v11 = 0;
      goto LABEL_16;
    }
    mac = self->_vision;
    uint64_t v9 = [v6 vision];
  }
  id v10 = (void *)v9;
  int64_t v11 = [(NSString *)mac compare:v9 options:64];

LABEL_16:
  return v11;
}

- (id)versionForDeviceClass:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"Mac"])
  {
    uint64_t v5 = 40;
LABEL_15:
    id v6 = *(id *)((char *)&self->super.isa + v5);
    goto LABEL_16;
  }
  if ([v4 isEqualToString:@"iPhone"])
  {
    uint64_t v5 = 8;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"Watch"])
  {
    uint64_t v5 = 48;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"iPod"])
  {
    uint64_t v5 = 24;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"iPad"])
  {
    uint64_t v5 = 16;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"AppleTV"])
  {
    uint64_t v5 = 32;
    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"RealityDevice"])
  {
    uint64_t v5 = 56;
    goto LABEL_15;
  }
  id v6 = 0;
LABEL_16:

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKOSVersionRequirement)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKOSVersionRequirement;
  uint64_t v5 = [(PKOSVersionRequirement *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Mac"];
    mac = v5->_mac;
    v5->_mac = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iPhone"];
    iphone = v5->_iphone;
    v5->_iphone = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"specifiediPhone"];
    specifiediphone = v5->_specifiediphone;
    v5->_specifiediphone = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iPad"];
    ipad = v5->_ipad;
    v5->_ipad = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iPod"];
    ipod = v5->_ipod;
    v5->_ipod = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AppleTV"];
    appletv = v5->_appletv;
    v5->_appletv = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Watch"];
    watch = v5->_watch;
    v5->_watch = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RealityDevice"];
    vision = v5->_vision;
    v5->_vision = (NSString *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  mac = self->_mac;
  id v5 = a3;
  [v5 encodeObject:mac forKey:@"Mac"];
  [v5 encodeObject:self->_iphone forKey:@"iPhone"];
  [v5 encodeObject:self->_specifiediphone forKey:@"specifiediPhone"];
  [v5 encodeObject:self->_ipad forKey:@"iPad"];
  [v5 encodeObject:self->_ipod forKey:@"iPod"];
  [v5 encodeObject:self->_appletv forKey:@"AppleTV"];
  [v5 encodeObject:self->_watch forKey:@"Watch"];
  [v5 encodeObject:self->_vision forKey:@"RealityDevice"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKOSVersionRequirement allocWithZone:](PKOSVersionRequirement, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_iphone copyWithZone:a3];
  iphone = v5->_iphone;
  v5->_iphone = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_specifiediphone copyWithZone:a3];
  specifiediphone = v5->_specifiediphone;
  v5->_specifiediphone = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_ipad copyWithZone:a3];
  ipad = v5->_ipad;
  v5->_ipad = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_ipod copyWithZone:a3];
  ipod = v5->_ipod;
  v5->_ipod = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_appletv copyWithZone:a3];
  appletv = v5->_appletv;
  v5->_appletv = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_mac copyWithZone:a3];
  mac = v5->_mac;
  v5->_mac = (NSString *)v16;

  uint64_t v18 = [(NSString *)self->_watch copyWithZone:a3];
  watch = v5->_watch;
  v5->_watch = (NSString *)v18;

  uint64_t v20 = [(NSString *)self->_vision copyWithZone:a3];
  vision = v5->_vision;
  v5->_vision = (NSString *)v20;

  return v5;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_iphone];
  [v3 safelyAddObject:self->_specifiediphone];
  [v3 safelyAddObject:self->_ipad];
  [v3 safelyAddObject:self->_ipod];
  [v3 safelyAddObject:self->_appletv];
  [v3 safelyAddObject:self->_mac];
  [v3 safelyAddObject:self->_watch];
  [v3 safelyAddObject:self->_vision];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKOSVersionRequirement *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKOSVersionRequirement *)self isEqualToOSVersionRequirement:v5];

  return v6;
}

- (BOOL)isEqualToOSVersionRequirement:(id)a3
{
  unint64_t v4 = a3;
  iphone = self->_iphone;
  BOOL v6 = (NSString *)v4[1];
  if (iphone) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (iphone != v6) {
      goto LABEL_41;
    }
  }
  else if ((-[NSString isEqual:](iphone, "isEqual:") & 1) == 0)
  {
    goto LABEL_41;
  }
  specifiediphone = self->_specifiediphone;
  uint64_t v9 = (NSString *)v4[8];
  if (specifiediphone && v9)
  {
    if ((-[NSString isEqual:](specifiediphone, "isEqual:") & 1) == 0) {
      goto LABEL_41;
    }
  }
  else if (specifiediphone != v9)
  {
    goto LABEL_41;
  }
  ipad = self->_ipad;
  int64_t v11 = (NSString *)v4[2];
  if (ipad && v11)
  {
    if ((-[NSString isEqual:](ipad, "isEqual:") & 1) == 0) {
      goto LABEL_41;
    }
  }
  else if (ipad != v11)
  {
    goto LABEL_41;
  }
  ipod = self->_ipod;
  v13 = (NSString *)v4[3];
  if (ipod && v13)
  {
    if ((-[NSString isEqual:](ipod, "isEqual:") & 1) == 0) {
      goto LABEL_41;
    }
  }
  else if (ipod != v13)
  {
    goto LABEL_41;
  }
  appletv = self->_appletv;
  v15 = (NSString *)v4[4];
  if (appletv && v15)
  {
    if ((-[NSString isEqual:](appletv, "isEqual:") & 1) == 0) {
      goto LABEL_41;
    }
  }
  else if (appletv != v15)
  {
    goto LABEL_41;
  }
  mac = self->_mac;
  v17 = (NSString *)v4[5];
  if (mac && v17)
  {
    if ((-[NSString isEqual:](mac, "isEqual:") & 1) == 0) {
      goto LABEL_41;
    }
  }
  else if (mac != v17)
  {
    goto LABEL_41;
  }
  watch = self->_watch;
  v19 = (NSString *)v4[6];
  if (!watch || !v19)
  {
    if (watch == v19) {
      goto LABEL_37;
    }
LABEL_41:
    char v22 = 0;
    goto LABEL_42;
  }
  if ((-[NSString isEqual:](watch, "isEqual:") & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  vision = self->_vision;
  v21 = (NSString *)v4[7];
  if (vision && v21) {
    char v22 = -[NSString isEqual:](vision, "isEqual:");
  }
  else {
    char v22 = vision == v21;
  }
LABEL_42:

  return v22;
}

- (NSString)iphone
{
  return self->_iphone;
}

- (NSString)ipad
{
  return self->_ipad;
}

- (NSString)ipod
{
  return self->_ipod;
}

- (NSString)appletv
{
  return self->_appletv;
}

- (NSString)mac
{
  return self->_mac;
}

- (NSString)watch
{
  return self->_watch;
}

- (NSString)vision
{
  return self->_vision;
}

- (NSString)specifiediphone
{
  return self->_specifiediphone;
}

@end