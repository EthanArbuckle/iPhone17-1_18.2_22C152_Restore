@interface NICarKeyConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)_labTestModeConfigurationWithOptions:(id)a3;
+ (id)_vehicleSimConfigurationWithOptions:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NICarKeyConfiguration)initWithCoder:(id)a3;
- (NICarKeyConfiguration)initWithConfiguration:(id)a3;
- (NICarKeyConfiguration)initWithVehicleIdentifier:(id)a3;
- (NSDictionary)debugOptions;
- (NSString)vehicleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (id)initLabTestModeConfiguration:(id)a3;
- (id)initVehicleSimConfiguration:(id)a3;
- (int64_t)configurationType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDebugOptions:(id)a3;
- (void)setVehicleIdentifier:(id)a3;
@end

@implementation NICarKeyConfiguration

- (NICarKeyConfiguration)initWithVehicleIdentifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2, self, @"NICarKeyConfiguration.mm", 17, @"Invalid parameter not satisfying: %@", @"vehicleIdentifier" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)NICarKeyConfiguration;
  v7 = [(NIConfiguration *)&v11 initInternal];
  v8 = (NICarKeyConfiguration *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 5, a3);
    v8->_configurationTypeInternal = 1;
  }

  return v8;
}

- (id)initVehicleSimConfiguration:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    objc_super v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"NICarKeyConfiguration.mm", 27, @"Invalid parameter not satisfying: %@", @"debugOptions" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)NICarKeyConfiguration;
  v7 = [(NIConfiguration *)&v12 initInternal];
  v8 = (id *)v7;
  if (v7)
  {
    v9 = (void *)v7[5];
    v7[5] = @"VEHICLE SIMULATION CONFIGURATION";

    objc_storeStrong(v8 + 6, a3);
    v8[4] = (id)2;
  }

  return v8;
}

- (id)initLabTestModeConfiguration:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    objc_super v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"NICarKeyConfiguration.mm", 38, @"Invalid parameter not satisfying: %@", @"debugOptions" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)NICarKeyConfiguration;
  v7 = [(NIConfiguration *)&v12 initInternal];
  v8 = (id *)v7;
  if (v7)
  {
    v9 = (void *)v7[5];
    v7[5] = @"TEST MODE CONFIGURATION";

    objc_storeStrong(v8 + 6, a3);
    v8[4] = (id)3;
  }

  return v8;
}

+ (id)_vehicleSimConfigurationWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = [[NICarKeyConfiguration alloc] initVehicleSimConfiguration:v3];

  return v4;
}

+ (id)_labTestModeConfigurationWithOptions:(id)a3
{
  id v3 = a3;
  id v4 = [[NICarKeyConfiguration alloc] initLabTestModeConfiguration:v3];

  return v4;
}

- (NICarKeyConfiguration)initWithConfiguration:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"NICarKeyConfiguration.mm", 57, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)NICarKeyConfiguration;
  id v6 = [(NIConfiguration *)&v13 initInternal];
  if (v6)
  {
    uint64_t v7 = [v5 vehicleIdentifier];
    vehicleIdentifier = v6->_vehicleIdentifier;
    v6->_vehicleIdentifier = (NSString *)v7;

    uint64_t v9 = [v5 debugOptions];
    debugOptions = v6->_debugOptions;
    v6->_debugOptions = (NSDictionary *)v9;

    v6->_configurationTypeInternal = (int64_t)[v5 configurationType];
  }

  return v6;
}

- (int64_t)configurationType
{
  return self->_configurationTypeInternal;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NICarKeyConfiguration;
  id v5 = -[NIConfiguration copyWithZone:](&v9, "copyWithZone:");
  [v5 setVehicleIdentifier:self->_vehicleIdentifier];
  v5[4] = self->_configurationTypeInternal;
  if (self->_debugOptions)
  {
    id v6 = [+[NSDictionary allocWithZone:a3] initWithDictionary:self->_debugOptions copyItems:1];
    uint64_t v7 = (void *)v5[6];
    v5[6] = v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_vehicleIdentifier forKey:@"vehicleIdentifier"];
  [v4 encodeObject:self->_debugOptions forKey:@"debugOptions"];
  [v4 encodeInteger:self->_configurationTypeInternal forKey:@"configurationType"];
}

- (NICarKeyConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vehicleIdentifier"];
  if (v5)
  {
    uint64_t v16 = objc_opt_class();
    id v6 = +[NSArray arrayWithObjects:&v16 count:1];
    uint64_t v7 = +[NSSet setWithArray:v6];

    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v8 = +[NSArray arrayWithObjects:v15 count:3];
    objc_super v9 = +[NSSet setWithArray:v8];

    v10 = [v4 decodeDictionaryWithKeysOfClasses:v7 objectsOfClasses:v9 forKey:@"debugOptions"];
    id v11 = [v4 decodeIntegerForKey:@"configurationType"];
    if (v11 == (id)1)
    {
      objc_super v13 = [[NICarKeyConfiguration alloc] initWithVehicleIdentifier:v5];
      [(NICarKeyConfiguration *)v13 setDebugOptions:v10];
    }
    else
    {
      if (v11 == (id)2)
      {
        objc_super v12 = [[NICarKeyConfiguration alloc] initVehicleSimConfiguration:v10];
      }
      else
      {
        if (v11 != (id)3)
        {
          objc_super v13 = 0;
          goto LABEL_11;
        }
        objc_super v12 = [[NICarKeyConfiguration alloc] initLabTestModeConfiguration:v10];
      }
      objc_super v13 = v12;
    }
LABEL_11:

    goto LABEL_12;
  }
  objc_super v13 = 0;
LABEL_12:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (NICarKeyConfiguration *)v4;
    id v6 = v5;
    if (v5 == self)
    {
      char v12 = 1;
    }
    else
    {
      vehicleIdentifier = self->_vehicleIdentifier;
      v8 = [(NICarKeyConfiguration *)v5 vehicleIdentifier];
      unsigned __int8 v9 = [(NSString *)vehicleIdentifier isEqualToString:v8];

      debugOptions = self->_debugOptions;
      if (debugOptions)
      {
        BOOL v11 = 0;
      }
      else
      {
        objc_super v13 = [(NICarKeyConfiguration *)v6 debugOptions];
        BOOL v11 = v13 == 0;

        debugOptions = self->_debugOptions;
      }
      v14 = [(NICarKeyConfiguration *)v6 debugOptions];
      unsigned __int8 v15 = [(NSDictionary *)debugOptions isEqualToDictionary:v14];

      char v12 = v9 & (v15 | v11);
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_vehicleIdentifier hash];
  return (unint64_t)[(NSDictionary *)self->_debugOptions hash] ^ v3 ^ self->_configurationTypeInternal;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(NICarKeyConfiguration *)self descriptionInternal];
  id v7 = [v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  return +[NSString stringWithFormat:@"<vehicle identifier: %@, debug options: <%@>>", self->_vehicleIdentifier, self->_debugOptions];
}

- (NSString)vehicleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVehicleIdentifier:(id)a3
{
}

- (NSDictionary)debugOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDebugOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugOptions, 0);

  objc_storeStrong((id *)&self->_vehicleIdentifier, 0);
}

@end