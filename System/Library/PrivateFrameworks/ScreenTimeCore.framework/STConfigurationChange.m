@interface STConfigurationChange
+ (BOOL)supportsSecureCoding;
+ (int64_t)encodingVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfigurationChange:(id)a3;
- (NSCopying)configuration;
- (NSSet)targetDevices;
- (STConfigurationChange)initWithCoder:(id)a3;
- (STConfigurationChange)initWithTargetUser:(id)a3 targetDevices:(id)a4 configuration:(id)a5 configurationType:(int64_t)a6 author:(id)a7;
- (STUserID)author;
- (STUserID)targetUser;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)matchingAny:(id)a3;
- (int64_t)configurationType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STConfigurationChange

- (STConfigurationChange)initWithTargetUser:(id)a3 targetDevices:(id)a4 configuration:(id)a5 configurationType:(int64_t)a6 author:(id)a7
{
  v25.receiver = self;
  v25.super_class = (Class)STConfigurationChange;
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [(STConfigurationChange *)&v25 init];
  v16 = (STUserID *)objc_msgSend(v14, "copy", v25.receiver, v25.super_class);

  targetUser = v15->_targetUser;
  v15->_targetUser = v16;

  v18 = (NSSet *)[v13 copy];
  targetDevices = v15->_targetDevices;
  v15->_targetDevices = v18;

  v20 = (NSCopying *)[v12 copy];
  configuration = v15->_configuration;
  v15->_configuration = v20;

  v15->_configurationType = a6;
  v22 = (STUserID *)[v11 copy];

  author = v15->_author;
  v15->_author = v22;

  return v15;
}

+ (int64_t)encodingVersion
{
  return 1;
}

- (id)matchingAny:(id)a3
{
  id v4 = a3;
  v5 = +[NSNumber numberWithInteger:[(STConfigurationChange *)self configurationType]];
  unsigned int v6 = [v4 containsObject:v5];

  if (v6)
  {
    v7 = +[STResult success:self];
  }
  else
  {
    id v8 = objc_alloc((Class)NSError);
    uint64_t v9 = STErrorDomain;
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    id v14 = self;
    v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v11 = [v8 initWithDomain:v9 code:45 userInfo:v10];
    v7 = +[STResult failure:v11];
  }
  return v7;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(STConfigurationChange *)self targetUser];
  v5 = [(STConfigurationChange *)self targetDevices];
  unint64_t v6 = (unint64_t)[(STConfigurationChange *)self configurationType] - 1;
  if (v6 > 5) {
    CFStringRef v7 = @"Invalid";
  }
  else {
    CFStringRef v7 = off_1002FBD58[v6];
  }
  id v8 = [(STConfigurationChange *)self author];
  uint64_t v9 = +[NSString stringWithFormat:@"<%@ { TargetUser: %@, TargetDevices: %@, Type: %@, Author: %@ }>", v3, v4, v5, v7, v8];

  return v9;
}

- (STConfigurationChange)initWithCoder:(id)a3
{
  id v4 = a3;
  if ((uint64_t)[v4 decodeIntegerForKey:@"encodingVersion"] < 1)
  {
    v20 = 0;
  }
  else
  {
    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"targetUser"];
    uint64_t v5 = objc_opt_class();
    unint64_t v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
    CFStringRef v7 = [v4 decodeObjectOfClasses:v6 forKey:@"targetDevices"];
    v30 = +[NSSet setWithArray:v7];

    id v29 = objc_alloc((Class)NSSet);
    uint64_t v28 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    id v16 = objc_msgSend(v29, "initWithObjects:", v28, v27, v26, v25, v24, v23, v22, v8, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    v17 = [v4 decodeObjectOfClasses:v16 forKey:@"configuration"];
    id v18 = [v4 decodeIntegerForKey:@"configurationType"];
    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"author"];
    self = [(STConfigurationChange *)self initWithTargetUser:v31 targetDevices:v30 configuration:v17 configurationType:v18 author:v19];

    v20 = self;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", +[STConfigurationChange encodingVersion](STConfigurationChange, "encodingVersion"), @"encodingVersion");
  uint64_t v5 = [(STConfigurationChange *)self targetUser];
  [v4 encodeObject:v5 forKey:@"targetUser"];

  unint64_t v6 = [(STConfigurationChange *)self targetDevices];
  CFStringRef v7 = [v6 allObjects];
  [v4 encodeObject:v7 forKey:@"targetDevices"];

  uint64_t v8 = [(STConfigurationChange *)self configuration];
  [v4 encodeObject:v8 forKey:@"configuration"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[STConfigurationChange configurationType](self, "configurationType"), @"configurationType");
  id v9 = [(STConfigurationChange *)self author];
  [v4 encodeObject:v9 forKey:@"author"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  targetUser = self->_targetUser;
  targetDevices = self->_targetDevices;
  configuration = self->_configuration;
  int64_t configurationType = self->_configurationType;
  author = self->_author;
  return [v4 initWithTargetUser:targetUser targetDevices:targetDevices configuration:configuration configurationType:configurationType author:author];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STConfigurationChange *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STConfigurationChange *)self isEqualToConfigurationChange:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToConfigurationChange:(id)a3
{
  id v4 = (STConfigurationChange *)a3;
  if (v4 == self)
  {
    unsigned __int8 v14 = 1;
  }
  else
  {
    BOOL v5 = [(STConfigurationChange *)self targetUser];
    unint64_t v6 = [(STConfigurationChange *)v4 targetUser];
    if ([v5 isEqualToUserID:v6])
    {
      CFStringRef v7 = [(STConfigurationChange *)self targetDevices];
      uint64_t v8 = [(STConfigurationChange *)v4 targetDevices];
      if ([v7 isEqualToSet:v8])
      {
        id v9 = [(STConfigurationChange *)self configuration];
        uint64_t v10 = [(STConfigurationChange *)v4 configuration];
        if ([v9 isEqual:v10]
          && (uint64_t v11 = [(STConfigurationChange *)self configurationType],
              v11 == (void *)[(STConfigurationChange *)v4 configurationType]))
        {
          uint64_t v12 = [(STConfigurationChange *)self author];
          uint64_t v13 = [(STConfigurationChange *)v4 author];
          unsigned __int8 v14 = [v12 isEqualToUserID:v13];
        }
        else
        {
          unsigned __int8 v14 = 0;
        }
      }
      else
      {
        unsigned __int8 v14 = 0;
      }
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  return v14;
}

- (unint64_t)hash
{
  uint64_t v3 = [(STConfigurationChange *)self targetUser];
  unint64_t v4 = (unint64_t)[v3 hash];
  BOOL v5 = [(STConfigurationChange *)self configuration];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  int64_t v7 = [(STConfigurationChange *)self configurationType];
  uint64_t v8 = [(STConfigurationChange *)self author];
  unint64_t v9 = v6 ^ v7 ^ (unint64_t)[v8 hash];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [(STConfigurationChange *)self targetDevices];
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      unsigned __int8 v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v9 ^= (unint64_t)[*(id *)(*((void *)&v16 + 1) + 8 * (void)v14) hash];
        unsigned __int8 v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  return v9;
}

- (STUserID)targetUser
{
  return (STUserID *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)targetDevices
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSCopying)configuration
{
  return (NSCopying *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)configurationType
{
  return self->_configurationType;
}

- (STUserID)author
{
  return (STUserID *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_targetDevices, 0);
  objc_storeStrong((id *)&self->_targetUser, 0);
}

@end