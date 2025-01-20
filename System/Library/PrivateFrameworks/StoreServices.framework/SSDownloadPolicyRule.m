@interface SSDownloadPolicyRule
+ (BOOL)supportsSecureCoding;
- (BOOL)isCellularAllowed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWiFiAllowed;
- (NSSet)applicationStates;
- (NSSet)networkTypes;
- (NSSet)userDefaultStates;
- (SSDownloadPolicyRule)init;
- (SSDownloadPolicyRule)initWithCoder:(id)a3;
- (SSDownloadPolicyRule)initWithXPCEncoding:(id)a3;
- (float)batteryLevel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (int64_t)cellularDataStates;
- (int64_t)downloadSizeLimit;
- (int64_t)powerStates;
- (int64_t)registrationStates;
- (int64_t)timeLimitStates;
- (unint64_t)hash;
- (void)addApplicationState:(id)a3;
- (void)addNetworkType:(int64_t)a3;
- (void)addUserDefaultState:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationStates:(id)a3;
- (void)setBatteryLevel:(float)a3;
- (void)setCellularDataStates:(int64_t)a3;
- (void)setDownloadSizeLimit:(int64_t)a3;
- (void)setNetworkTypes:(id)a3;
- (void)setPowerStates:(int64_t)a3;
- (void)setRegistrationStates:(int64_t)a3;
- (void)setTimeLimitStates:(int64_t)a3;
- (void)setUserDefaultStates:(id)a3;
- (void)unionPolicyRule:(id)a3;
@end

@implementation SSDownloadPolicyRule

- (SSDownloadPolicyRule)init
{
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadPolicyRule;
  result = [(SSDownloadPolicyRule *)&v3 init];
  if (result)
  {
    result->_cellularDataStates = 3;
    *(int64x2_t *)&result->_powerStates = vdupq_n_s64(3uLL);
    result->_timeLimitStates = 3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSDownloadPolicyRule;
  [(SSDownloadPolicyRule *)&v3 dealloc];
}

- (void)addApplicationState:(id)a3
{
  id v6 = (id)[a3 copy];
  applicationStates = self->_applicationStates;
  if (applicationStates)
  {
    v5 = (void *)[(NSSet *)applicationStates mutableCopy];
    [v5 addObject:v6];

    self->_applicationStates = (NSSet *)[v5 copy];
  }
  else
  {
    self->_applicationStates = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v6, 0);
  }
}

- (void)addNetworkType:(int64_t)a3
{
  networkTypes = self->_networkTypes;
  if (networkTypes)
  {
    id v7 = (id)[(NSSet *)networkTypes mutableCopy];
    objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", a3));

    self->_networkTypes = (NSSet *)[v7 copy];
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    self->_networkTypes = (NSSet *)objc_msgSend(v6, "initWithObjects:", objc_msgSend(NSNumber, "numberWithInteger:", a3), 0);
  }
}

- (void)addUserDefaultState:(id)a3
{
  id v6 = (id)[a3 copy];
  userDefaultStates = self->_userDefaultStates;
  if (userDefaultStates)
  {
    v5 = (void *)[(NSSet *)userDefaultStates mutableCopy];
    [v5 addObject:v6];

    self->_userDefaultStates = (NSSet *)[v5 copy];
  }
  else
  {
    self->_userDefaultStates = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v6, 0);
  }
}

- (BOOL)isCellularAllowed
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  networkTypes = self->_networkTypes;
  if (!networkTypes)
  {
LABEL_11:
    LOBYTE(v3) = 1;
    return v3;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = [(NSSet *)networkTypes countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
LABEL_4:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v9 != v5) {
        objc_enumerationMutation(networkTypes);
      }
      if (SSNetworkTypeIsCellularType([*(id *)(*((void *)&v8 + 1) + 8 * v6) integerValue])) {
        goto LABEL_11;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [(NSSet *)networkTypes countByEnumeratingWithState:&v8 objects:v12 count:16];
        LOBYTE(v3) = 0;
        if (v4) {
          goto LABEL_4;
        }
        return v3;
      }
    }
  }
  return v3;
}

- (BOOL)isWiFiAllowed
{
  if (!self->_networkTypes) {
    return 1;
  }
  v2 = self;
  uint64_t v3 = (void *)[objc_alloc(NSNumber) initWithInteger:1000];
  LOBYTE(v2) = [(NSSet *)v2->_networkTypes containsObject:v3];

  return (char)v2;
}

- (void)unionPolicyRule:(id)a3
{
  int64_t cellularDataStates = self->_cellularDataStates;
  self->_int64_t cellularDataStates = [a3 cellularDataStates] | cellularDataStates;
  int64_t powerStates = self->_powerStates;
  self->_int64_t powerStates = [a3 powerStates] | powerStates;
  int64_t registrationStates = self->_registrationStates;
  self->_int64_t registrationStates = [a3 registrationStates] | registrationStates;
  float batteryLevel = self->_batteryLevel;
  [a3 batteryLevel];
  if (batteryLevel <= v9) {
    [a3 batteryLevel];
  }
  else {
    float v10 = self->_batteryLevel;
  }
  self->_float batteryLevel = v10;
  int64_t timeLimitStates = self->_timeLimitStates;
  self->_int64_t timeLimitStates = [a3 timeLimitStates] | timeLimitStates;
  v12 = (void *)[a3 applicationStates];
  if ([v12 count])
  {
    applicationStates = self->_applicationStates;
    if (applicationStates)
    {
      v14 = (void *)[(NSSet *)applicationStates mutableCopy];
      [v14 unionSet:v12];

      self->_applicationStates = (NSSet *)[v14 copy];
    }
    else
    {
      self->_applicationStates = (NSSet *)v12;
    }
  }
  v15 = (void *)[a3 networkTypes];
  if ([v15 count])
  {
    networkTypes = self->_networkTypes;
    if (networkTypes)
    {
      v17 = (void *)[(NSSet *)networkTypes mutableCopy];
      [v17 unionSet:v15];

      self->_networkTypes = (NSSet *)[v17 copy];
    }
    else
    {
      self->_networkTypes = (NSSet *)v15;
    }
  }
  v18 = (void *)[a3 userDefaultStates];
  if ([v18 count])
  {
    userDefaultStates = self->_userDefaultStates;
    if (userDefaultStates)
    {
      id v20 = (id)[(NSSet *)userDefaultStates mutableCopy];
      [v20 unionSet:v18];

      self->_userDefaultStates = (NSSet *)[v20 copy];
    }
    else
    {
      self->_userDefaultStates = (NSSet *)v18;
    }
  }
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSSet *)self->_networkTypes hash];
  return [(NSSet *)self->_userDefaultStates hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_16;
  }
  int64_t v6 = [(SSDownloadPolicyRule *)self downloadSizeLimit];
  if (v6 != [a3 downloadSizeLimit]) {
    goto LABEL_16;
  }
  id v7 = [(SSDownloadPolicyRule *)self applicationStates];
  if (v7 != (NSSet *)[a3 applicationStates])
  {
    BOOL v8 = -[NSSet isEqualToSet:](-[SSDownloadPolicyRule applicationStates](self, "applicationStates"), "isEqualToSet:", [a3 applicationStates]);
    if (!v8) {
      return v8;
    }
  }
  [(SSDownloadPolicyRule *)self batteryLevel];
  float v10 = v9;
  [a3 batteryLevel];
  if (v10 != v11) {
    goto LABEL_16;
  }
  v12 = [(SSDownloadPolicyRule *)self networkTypes];
  if (v12 != (NSSet *)[a3 networkTypes])
  {
    BOOL v8 = -[NSSet isEqualToSet:](-[SSDownloadPolicyRule networkTypes](self, "networkTypes"), "isEqualToSet:", [a3 networkTypes]);
    if (!v8) {
      return v8;
    }
  }
  int64_t v13 = [(SSDownloadPolicyRule *)self cellularDataStates];
  if (v13 != [a3 cellularDataStates]
    || (int64_t v14 = -[SSDownloadPolicyRule powerStates](self, "powerStates"), v14 != [a3 powerStates])
    || (int64_t v15 = [(SSDownloadPolicyRule *)self registrationStates],
        v15 != [a3 registrationStates])
    || (int64_t v16 = [(SSDownloadPolicyRule *)self timeLimitStates],
        v16 != [a3 timeLimitStates]))
  {
LABEL_16:
    LOBYTE(v8) = 0;
    return v8;
  }
  v17 = [(SSDownloadPolicyRule *)self userDefaultStates];
  if (v17 == (NSSet *)[a3 userDefaultStates])
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v18 = [(SSDownloadPolicyRule *)self userDefaultStates];
    uint64_t v19 = [a3 userDefaultStates];
    LOBYTE(v8) = [(NSSet *)v18 isEqualToSet:v19];
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSet allObjects](self->_applicationStates, "allObjects"), @"appsts");
  *(float *)&double v5 = self->_batteryLevel;
  [a3 encodeFloat:@"bttlvl" forKey:v5];
  [a3 encodeInt64:self->_cellularDataStates forKey:@"cellds"];
  [a3 encodeInt64:self->_downloadSizeLimit forKey:@"szlmt"];
  objc_msgSend(a3, "encodeObject:forKey:", -[NSSet allObjects](self->_networkTypes, "allObjects"), @"nwktps");
  [a3 encodeInt64:self->_powerStates forKey:@"powsts"];
  [a3 encodeInt64:self->_registrationStates forKey:@"regsts"];
  [a3 encodeInt64:self->_timeLimitStates forKey:@"tmlsts"];
  int64_t v6 = [(NSSet *)self->_userDefaultStates allObjects];
  [a3 encodeObject:v6 forKey:@"usdfts"];
}

- (SSDownloadPolicyRule)initWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)SSDownloadPolicyRule;
  uint64_t v4 = [(SSDownloadPolicyRule *)&v18 init];
  if (v4)
  {
    [a3 decodeFloatForKey:@"bttlvl"];
    v4->_float batteryLevel = v5;
    v4->_downloadSizeLimit = [a3 decodeInt64ForKey:@"szlmt"];
    v4->_int64_t powerStates = [a3 decodeInt64ForKey:@"powsts"];
    v4->_int64_t registrationStates = [a3 decodeInt64ForKey:@"regsts"];
    if ([a3 containsValueForKey:@"cellds"]) {
      uint64_t v6 = [a3 decodeInt64ForKey:@"cellds"];
    }
    else {
      uint64_t v6 = 3;
    }
    v4->_int64_t cellularDataStates = v6;
    if ([a3 containsValueForKey:@"tmlsts"]) {
      uint64_t v7 = [a3 decodeInt64ForKey:@"tmlsts"];
    }
    else {
      uint64_t v7 = 3;
    }
    v4->_int64_t timeLimitStates = v7;
    BOOL v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0), @"appsts");
    if (v10) {
      v4->_applicationStates = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v10];
    }
    float v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0), @"nwktps");
    if (v13) {
      v4->_networkTypes = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v13];
    }
    int64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0), @"usdfts");
    if (v16) {
      v4->_userDefaultStates = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v16];
    }
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 8) = [(NSSet *)self->_applicationStates copyWithZone:a3];
  *(float *)(v5 + 16) = self->_batteryLevel;
  *(_OWORD *)(v5 + 24) = *(_OWORD *)&self->_cellularDataStates;
  *(void *)(v5 + 40) = [(NSSet *)self->_networkTypes copyWithZone:a3];
  *(void *)(v5 + 48) = self->_powerStates;
  *(void *)(v5 + 56) = self->_registrationStates;
  *(void *)(v5 + 64) = self->_timeLimitStates;
  *(void *)(v5 + 72) = self->_userDefaultStates;
  return (id)v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)[(NSSet *)self->_applicationStates allObjects]);
  xpc_dictionary_set_double(v3, "1", self->_batteryLevel);
  xpc_dictionary_set_int64(v3, "2", self->_cellularDataStates);
  xpc_dictionary_set_int64(v3, "3", self->_downloadSizeLimit);
  SSXPCDictionarySetCFObject(v3, "4", (__CFString *)[(NSSet *)self->_networkTypes allObjects]);
  xpc_dictionary_set_int64(v3, "5", self->_powerStates);
  xpc_dictionary_set_int64(v3, "6", self->_registrationStates);
  xpc_dictionary_set_int64(v3, "7", self->_timeLimitStates);
  SSXPCDictionarySetCFObject(v3, "8", (__CFString *)[(NSSet *)self->_userDefaultStates allObjects]);
  return v3;
}

- (SSDownloadPolicyRule)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v18.receiver = self;
    v18.super_class = (Class)SSDownloadPolicyRule;
    uint64_t v5 = [(SSDownloadPolicyRule *)&v18 init];
    if (v5)
    {
      xpc_object_t value = xpc_dictionary_get_value(a3, "0");
      uint64_t v8 = objc_opt_class();
      id v9 = SSXPCCreateNSArrayFromXPCEncodedArray(value, v8);
      if (v9)
      {
        uint64_t v10 = v9;
        v5->_applicationStates = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v9];
      }
      float v11 = xpc_dictionary_get_double(a3, "1");
      v5->_float batteryLevel = v11;
      v5->_int64_t cellularDataStates = xpc_dictionary_get_int64(a3, "2");
      v5->_downloadSizeLimit = xpc_dictionary_get_int64(a3, "3");
      objc_opt_class();
      CFArrayRef v12 = SSXPCDictionaryCopyCFObjectWithClass(a3, "4");
      if (v12)
      {
        CFArrayRef v13 = v12;
        v5->_networkTypes = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v12];
      }
      v5->_int64_t powerStates = xpc_dictionary_get_int64(a3, "5");
      v5->_int64_t registrationStates = xpc_dictionary_get_int64(a3, "6");
      v5->_int64_t timeLimitStates = xpc_dictionary_get_int64(a3, "7");
      xpc_object_t v14 = xpc_dictionary_get_value(a3, "8");
      uint64_t v15 = objc_opt_class();
      id v16 = SSXPCCreateNSArrayFromXPCEncodedArray(v14, v15);
      if (v16)
      {
        v17 = v16;
        v5->_userDefaultStates = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v16];
      }
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (NSSet)applicationStates
{
  return self->_applicationStates;
}

- (void)setApplicationStates:(id)a3
{
}

- (float)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(float)a3
{
  self->_float batteryLevel = a3;
}

- (int64_t)cellularDataStates
{
  return self->_cellularDataStates;
}

- (void)setCellularDataStates:(int64_t)a3
{
  self->_int64_t cellularDataStates = a3;
}

- (int64_t)downloadSizeLimit
{
  return self->_downloadSizeLimit;
}

- (void)setDownloadSizeLimit:(int64_t)a3
{
  self->_downloadSizeLimit = a3;
}

- (NSSet)networkTypes
{
  return self->_networkTypes;
}

- (void)setNetworkTypes:(id)a3
{
}

- (int64_t)powerStates
{
  return self->_powerStates;
}

- (void)setPowerStates:(int64_t)a3
{
  self->_int64_t powerStates = a3;
}

- (int64_t)registrationStates
{
  return self->_registrationStates;
}

- (void)setRegistrationStates:(int64_t)a3
{
  self->_int64_t registrationStates = a3;
}

- (int64_t)timeLimitStates
{
  return self->_timeLimitStates;
}

- (void)setTimeLimitStates:(int64_t)a3
{
  self->_int64_t timeLimitStates = a3;
}

- (NSSet)userDefaultStates
{
  return self->_userDefaultStates;
}

- (void)setUserDefaultStates:(id)a3
{
}

@end