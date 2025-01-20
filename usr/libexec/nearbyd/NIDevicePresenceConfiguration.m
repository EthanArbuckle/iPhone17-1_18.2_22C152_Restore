@interface NIDevicePresenceConfiguration
+ (BOOL)_validateRegionIsPreset:(id)a3;
+ (BOOL)_validateRegionPredicates:(id)a3 outer:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (const)_NIDevicePresenceMonitoringOptionToString:(unint64_t)a3;
+ (float)_radiusFromDevicePresencePreset:(int64_t)a3;
- (BOOL)_internalIsCameraAssistanceEnabled;
- (BOOL)isCameraAssistanceEnabled;
- (BOOL)isEqual:(id)a3;
- (NIDevicePresenceConfiguration)initWithCoder:(id)a3;
- (NIDevicePresenceConfiguration)initWithDiscoveryToken:(id)a3 regions:(id)a4 preferredUpdateRate:(int64_t)a5 error:(id *)a6;
- (NIDevicePresenceConfiguration)initWithInnerBoundary:(id)a3 outerBoundary:(id)a4 error:(id *)a5;
- (NIDevicePresenceConfiguration)initWithInnerBoundary:(id)a3 outerBoundary:(id)a4 monitoringOption:(unint64_t)a5 allowedDevices:(unint64_t)a6 error:(id *)a7;
- (NIDiscoveryToken)token;
- (NIRegionPredicate)innerBoundary;
- (NIRegionPredicate)outerBoundary;
- (NSArray)monitoredRegions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (unint64_t)allowedDevices;
- (unint64_t)hash;
- (unint64_t)monitoringOption;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedDevices:(unint64_t)a3;
- (void)setCameraAssistanceEnabled:(BOOL)a3;
- (void)setMonitoringOption:(unint64_t)a3;
@end

@implementation NIDevicePresenceConfiguration

- (NIDevicePresenceConfiguration)initWithInnerBoundary:(id)a3 outerBoundary:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v21.receiver = self;
  v21.super_class = (Class)NIDevicePresenceConfiguration;
  v10 = [(NIConfiguration *)&v21 initInternal];
  if (!v10) {
    goto LABEL_6;
  }
  id v11 = [v8 copy];
  v12 = (void *)v10[7];
  v10[7] = v11;

  id v13 = [v9 copy];
  v14 = (void *)v10[8];
  v10[8] = v13;

  v10[5] = 1;
  v10[6] = 2;
  if (!v9)
  {
    v15 = [[NIRegionPredicate alloc] initWithName:@"default-max-sensor-region" devicePresencePreset:5];
    v16 = (void *)v10[8];
    v10[8] = v15;
  }
  v22[0] = v10[7];
  v22[1] = v10[8];
  uint64_t v17 = +[NSArray arrayWithObjects:v22 count:2];
  v18 = (void *)v10[9];
  v10[9] = v17;

  if (+[NIDevicePresenceConfiguration _validateRegionPredicates:v10[7] outer:v10[8]])
  {
    *((unsigned char *)v10 + 32) = 0;
LABEL_6:
    v19 = v10;
    goto LABEL_10;
  }
  if (a5)
  {
    sub_1001DB420(-10013, 0);
    v19 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
LABEL_10:

  return v19;
}

- (NIDevicePresenceConfiguration)initWithInnerBoundary:(id)a3 outerBoundary:(id)a4 monitoringOption:(unint64_t)a5 allowedDevices:(unint64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  v14 = (NIDevicePresenceConfiguration *)[objc_alloc((Class)objc_opt_class()) initWithInnerBoundary:v12 outerBoundary:v13 error:a7];

  if (v14)
  {
    v14->_allowedDevices = a6;
    v14->_monitoringOption = a5;
  }

  return v14;
}

- (NIDevicePresenceConfiguration)initWithDiscoveryToken:(id)a3 regions:(id)a4 preferredUpdateRate:(int64_t)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = objc_alloc((Class)objc_opt_class());
  v14 = [v12 firstObject];
  v15 = [v12 lastObject];
  v16 = (NIDevicePresenceConfiguration *)[v13 initWithInnerBoundary:v14 outerBoundary:v15 error:a6];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_token, a3);
    v16->_allowedDevices = 2;
    v16->_monitoringOption = 1;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v17 = v12;
    id v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v25;
      do
      {
        v20 = 0;
        do
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * (void)v20) setPreferredUpdateRate:a5, (void)v24];
          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v18);
    }

    objc_super v21 = (NSArray *)[objc_alloc((Class)NSArray) initWithArray:v17 copyItems:1];
    monitoredRegions = v16->_monitoredRegions;
    v16->_monitoredRegions = v21;
  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)NIDevicePresenceConfiguration;
  v5 = -[NIConfiguration copyWithZone:](&v15, "copyWithZone:");
  [v5 setAllowedDevices:self->_allowedDevices];
  [v5 setMonitoringOption:self->_monitoringOption];
  [v5 setCameraAssistanceEnabled:self->_cameraAssistanceEnabled];
  id v6 = [(NIRegionPredicate *)self->_innerBoundary copyWithZone:a3];
  v7 = (void *)v5[7];
  v5[7] = v6;

  id v8 = [(NIRegionPredicate *)self->_outerBoundary copyWithZone:a3];
  id v9 = (void *)v5[8];
  v5[8] = v8;

  id v10 = [(NSArray *)self->_monitoredRegions copyWithZone:a3];
  id v11 = (void *)v5[9];
  v5[9] = v10;

  id v12 = [(NIDiscoveryToken *)self->_token copyWithZone:a3];
  id v13 = (void *)v5[10];
  v5[10] = v12;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NIDevicePresenceConfiguration;
  [(NIConfiguration *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_innerBoundary forKey:@"innerboundary"];
  [v4 encodeObject:self->_outerBoundary forKey:@"outerboundary"];
  [v4 encodeObject:self->_monitoredRegions forKey:@"monitoredRegions"];
  [v4 encodeObject:self->_token forKey:@"token"];
  [v4 encodeInteger:self->_allowedDevices forKey:@"allowedDevices"];
  [v4 encodeInteger:self->_monitoringOption forKey:@"monitoringOption"];
  [v4 encodeBool:self->_cameraAssistanceEnabled forKey:@"cameraAssistanceEnabled"];
}

- (NIDevicePresenceConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NIDevicePresenceConfiguration;
  objc_super v5 = [(NIConfiguration *)&v18 initWithCoder:v4];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"monitoredRegions"];
  monitoredRegions = v5->_monitoredRegions;
  v5->_monitoredRegions = (NSArray *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"innerboundary"];
  innerBoundary = v5->_innerBoundary;
  v5->_innerBoundary = (NIRegionPredicate *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outerboundary"];
  outerBoundary = v5->_outerBoundary;
  v5->_outerBoundary = (NIRegionPredicate *)v10;

  id v12 = [v4 decodeIntegerForKey:@"allowedDevices"];
  if (!+[NIInternalUtils isIntValidRelationshipSpecifier:v12])goto LABEL_5; {
  v5->_allowedDevices = (unint64_t)v12;
  }
  id v13 = (char *)[v4 decodeIntegerForKey:@"monitoringOption"];
  if ((unint64_t)(v13 - 1) < 3)
  {
    v5->_monitoringOption = (unint64_t)v13;
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
    token = v5->_token;
    v5->_token = (NIDiscoveryToken *)v14;

    v5->_cameraAssistanceEnabled = [v4 decodeBoolForKey:@"cameraAssistanceEnabled"];
    v16 = v5;
  }
  else
  {
LABEL_5:
    v16 = 0;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = (NIDevicePresenceConfiguration *)v4;
    uint64_t v6 = v5;
    if (v5 == self)
    {
      BOOL v13 = 1;
    }
    else
    {
      v7 = [(NIDevicePresenceConfiguration *)v5 innerBoundary];
      unsigned int v8 = [v7 isEqual:self->_innerBoundary];

      id v9 = [(NIDevicePresenceConfiguration *)v6 outerBoundary];
      unsigned int v10 = [v9 isEqual:self->_outerBoundary];

      id v11 = [(NIDevicePresenceConfiguration *)v6 outerBoundary];
      if (v11) {
        BOOL v12 = 0;
      }
      else {
        BOOL v12 = self->_outerBoundary == 0;
      }

      uint64_t v14 = [(NIDevicePresenceConfiguration *)v6 monitoredRegions];
      unsigned int v15 = [v14 isEqualToArray:self->_monitoredRegions];

      id v16 = [(NIDevicePresenceConfiguration *)v6 allowedDevices];
      unsigned int v23 = v15;
      unint64_t allowedDevices = self->_allowedDevices;
      id v24 = [(NIDevicePresenceConfiguration *)v6 monitoringOption];
      unint64_t monitoringOption = self->_monitoringOption;
      objc_super v18 = [(NIDevicePresenceConfiguration *)v6 token];
      LODWORD(v14) = v8;
      token = self->_token;

      unsigned int v19 = [(NIDevicePresenceConfiguration *)v6 isCameraAssistanceEnabled];
      BOOL v13 = 0;
      if ((v14 & (v10 | v12)) == 1
        && v16 == (id)allowedDevices
        && v24 == (id)monitoringOption
        && ((v23 ^ 1) & 1) == 0)
      {
        BOOL v13 = v18 == token && self->_cameraAssistanceEnabled == v19;
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NIRegionPredicate *)self->_innerBoundary hash];
  unint64_t v4 = [(NIRegionPredicate *)self->_outerBoundary hash] ^ v3;
  unint64_t v5 = self->_allowedDevices ^ self->_monitoringOption;
  unint64_t v6 = v4 ^ v5 ^ [(NIDiscoveryToken *)self->_token hash];
  return v6 ^ (unint64_t)[(NSArray *)self->_monitoredRegions hash] ^ self->_cameraAssistanceEnabled;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  unint64_t v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  unint64_t v6 = [(NIDevicePresenceConfiguration *)self descriptionInternal];
  id v7 = [v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  innerBoundary = self->_innerBoundary;
  outerBoundary = self->_outerBoundary;
  unint64_t v5 = +[NIInternalUtils NIRelationshipSpecifierToString:self->_allowedDevices];
  unint64_t v6 = +[NIDevicePresenceConfiguration _NIDevicePresenceMonitoringOptionToString:self->_monitoringOption];
  if (self->_cameraAssistanceEnabled) {
    id v7 = "Yes";
  }
  else {
    id v7 = "No";
  }
  return +[NSString stringWithFormat:@"<innerboundary: %@, outerboundary: %@, allowedDevices: %s, monitoringOption: %s>, isCameraAssistanceEnabled: %s", innerBoundary, outerBoundary, v5, v6, v7];
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

+ (BOOL)_validateRegionPredicates:(id)a3 outer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[NIDevicePresenceConfiguration _validateRegionIsPreset:](NIDevicePresenceConfiguration, "_validateRegionIsPreset:", v5)&& +[NIDevicePresenceConfiguration _validateRegionIsPreset:v6])
  {
    +[NIDevicePresenceConfiguration _radiusFromDevicePresencePreset:](NIDevicePresenceConfiguration, "_radiusFromDevicePresencePreset:", [v6 devicePresencePreset]);
    float v8 = v7;
    +[NIDevicePresenceConfiguration _radiusFromDevicePresencePreset:](NIDevicePresenceConfiguration, "_radiusFromDevicePresencePreset:", [v5 devicePresencePreset]);
    BOOL v10 = v8 >= v9;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (BOOL)_validateRegionIsPreset:(id)a3
{
  return [a3 devicePresencePreset] != 0;
}

+ (float)_radiusFromDevicePresencePreset:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 3.4028e38;
  }
  else {
    return flt_1004BC340[a3 - 1];
  }
}

+ (const)_NIDevicePresenceMonitoringOptionToString:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return "N/A";
  }
  else {
    return (&off_10085B808)[a3 - 1];
  }
}

- (unint64_t)monitoringOption
{
  return self->_monitoringOption;
}

- (void)setMonitoringOption:(unint64_t)a3
{
  self->_unint64_t monitoringOption = a3;
}

- (unint64_t)allowedDevices
{
  return self->_allowedDevices;
}

- (void)setAllowedDevices:(unint64_t)a3
{
  self->_unint64_t allowedDevices = a3;
}

- (NIRegionPredicate)innerBoundary
{
  return (NIRegionPredicate *)objc_getProperty(self, a2, 56, 1);
}

- (NIRegionPredicate)outerBoundary
{
  return (NIRegionPredicate *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)monitoredRegions
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NIDiscoveryToken)token
{
  return (NIDiscoveryToken *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)a3
{
  self->_cameraAssistanceEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_monitoredRegions, 0);
  objc_storeStrong((id *)&self->_outerBoundary, 0);

  objc_storeStrong((id *)&self->_innerBoundary, 0);
}

@end