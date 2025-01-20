@interface NIHomeDeviceConfiguration
+ (BOOL)supportsSecureCoding;
+ (NIHomeDeviceConfiguration)new;
- (BOOL)canUpdateToConfiguration:(id)a3;
- (BOOL)isAnchor;
- (BOOL)isEqual:(id)a3;
- (NIHomeDeviceConfiguration)init;
- (NIHomeDeviceConfiguration)initWithAllowedDevices:(unint64_t)a3 sessionKey:(id)a4 asAnchor:(BOOL)a5 regions:(id)a6;
- (NIHomeDeviceConfiguration)initWithCoder:(id)a3;
- (NIHomeDeviceConfiguration)initWithRegions:(id)a3;
- (NSArray)monitoredRegions;
- (NSData)sessionKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int64_t)antennaDiversityOverride;
- (int64_t)minimumPreferredUpdatedRate;
- (unint64_t)allowedDevices;
- (unint64_t)hash;
- (void)_updateRegionDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedDevices:(unint64_t)a3;
- (void)setAnchor:(BOOL)a3;
- (void)setAntennaDiversityOverride:(int64_t)a3;
- (void)setMinimumPreferredUpdatedRate:(int64_t)a3;
- (void)setMonitoredRegions:(id)a3;
- (void)setSessionKey:(id)a3;
@end

@implementation NIHomeDeviceConfiguration

- (NIHomeDeviceConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)NIHomeDeviceConfiguration;
  v2 = [(NIConfiguration *)&v6 initInternal];
  v3 = v2;
  if (v2)
  {
    v2->_allowedDevices = 4;
    sessionKey = v2->_sessionKey;
    v2->_sessionKey = 0;

    v3->_anchor = 0;
    v3->_minimumPreferredUpdatedRate = 3;
    v3->_antennaDiversityOverride = 0;
    [(NIHomeDeviceConfiguration *)v3 setMonitoredRegions:&__NSArray0__struct];
  }
  return v3;
}

+ (NIHomeDeviceConfiguration)new
{
  return objc_alloc_init(NIHomeDeviceConfiguration);
}

- (NIHomeDeviceConfiguration)initWithRegions:(id)a3
{
  id v4 = a3;
  v5 = (NIHomeDeviceConfiguration *)objc_alloc_init((Class)objc_opt_class());

  [(NIHomeDeviceConfiguration *)v5 setMonitoredRegions:v4];
  return v5;
}

- (NIHomeDeviceConfiguration)initWithAllowedDevices:(unint64_t)a3 sessionKey:(id)a4 asAnchor:(BOOL)a5 regions:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v13 = (NIHomeDeviceConfiguration *)objc_alloc_init((Class)objc_opt_class());

  if (v13)
  {
    v13->_allowedDevices = a3;
    objc_storeStrong((id *)&v13->_sessionKey, a4);
    v13->_anchor = a5;
    [(NIHomeDeviceConfiguration *)v13 setMonitoredRegions:v12];
  }

  return v13;
}

- (void)setMonitoredRegions:(id)a3
{
  objc_storeStrong((id *)&self->_monitoredRegions, a3);

  [(NIHomeDeviceConfiguration *)self _updateRegionDescription];
}

- (NSArray)monitoredRegions
{
  id v2 = [objc_alloc((Class)NSArray) initWithArray:self->_monitoredRegions copyItems:1];

  return (NSArray *)v2;
}

- (void)_updateRegionDescription
{
  if ([(NSArray *)self->_monitoredRegions count])
  {
    v3 = objc_opt_new();
    monitoredRegions = self->_monitoredRegions;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1002CD22C;
    v9[3] = &unk_10085E560;
    id v5 = v3;
    id v10 = v5;
    [(NSArray *)monitoredRegions enumerateObjectsUsingBlock:v9];
    regionDescription = self->_regionDescription;
    self->_regionDescription = (NSString *)v5;
    id v7 = v5;
  }
  else
  {
    v8 = self->_regionDescription;
    self->_regionDescription = (NSString *)@"[none]";
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NIHomeDeviceConfiguration;
  id v5 = -[NIConfiguration copyWithZone:](&v9, "copyWithZone:");
  [v5 setAllowedDevices:self->_allowedDevices];
  [v5 setSessionKey:self->_sessionKey];
  [v5 setAnchor:self->_anchor];
  [v5 setAntennaDiversityOverride:self->_antennaDiversityOverride];
  [v5 setMinimumPreferredUpdatedRate:self->_minimumPreferredUpdatedRate];
  if (self->_monitoredRegions)
  {
    objc_super v6 = [+[NSArray allocWithZone:a3] initWithArray:self->_monitoredRegions copyItems:1];
    id v7 = v5[4];
    v5[4] = v6;
  }
  objc_storeStrong(v5 + 5, self->_regionDescription);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NIHomeDeviceConfiguration;
  [(NIConfiguration *)&v5 encodeWithCoder:v4];
  [v4 encodeInteger:self->_allowedDevices forKey:@"allowedDevices"];
  [v4 encodeObject:self->_sessionKey forKey:@"sessionKey"];
  [v4 encodeBool:self->_anchor forKey:@"anchor"];
  [v4 encodeInteger:self->_antennaDiversityOverride forKey:@"antennaDiversityOverride"];
  [v4 encodeObject:self->_monitoredRegions forKey:@"monitoredRegions"];
  [v4 encodeInteger:self->_minimumPreferredUpdatedRate forKey:@"minimumPreferredUpdatedRate"];
}

- (NIHomeDeviceConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NIHomeDeviceConfiguration;
  objc_super v5 = [(NIConfiguration *)&v16 initWithCoder:v4];
  if (v5
    && (id v6 = [v4 decodeIntegerForKey:@"allowedDevices"],
        +[NIInternalUtils isIntValidRelationshipSpecifier:v6]))
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionKey"];
    unsigned __int8 v8 = [v4 decodeBoolForKey:@"anchor"];
    id v9 = [v4 decodeIntegerForKey:@"antennaDiversityOverride"];
    if (+[NIInternalUtils isIntValidAntennaDiversityOverride:v9])
    {
      v17[0] = objc_opt_class();
      v17[1] = objc_opt_class();
      id v10 = +[NSArray arrayWithObjects:v17 count:2];
      id v11 = +[NSSet setWithArray:v10];
      id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"monitoredRegions"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (id v13 = [v4 decodeIntegerForKey:@"minimumPreferredUpdatedRate"],
            +[NIInternalUtils isIntValidNearbyObjectUpdateRate:v13]))
      {
        v5->_allowedDevices = (unint64_t)v6;
        objc_storeStrong((id *)&v5->_sessionKey, v7);
        v5->_anchor = v8;
        v5->_antennaDiversityOverride = (int64_t)v9;
        objc_storeStrong((id *)&v5->_monitoredRegions, v12);
        [(NIHomeDeviceConfiguration *)v5 _updateRegionDescription];
        v5->_minimumPreferredUpdatedRate = (int64_t)v13;
        v14 = v5;
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)canUpdateToConfiguration:(id)a3
{
  id v4 = (NIHomeDeviceConfiguration *)a3;
  objc_super v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      char v14 = 1;
    }
    else
    {
      unint64_t v6 = [(NIHomeDeviceConfiguration *)v4 allowedDevices];
      unint64_t allowedDevices = self->_allowedDevices;
      unsigned int v8 = [(NIHomeDeviceConfiguration *)v5 isAnchor];
      int anchor = self->_anchor;
      id v10 = [(NIHomeDeviceConfiguration *)v5 antennaDiversityOverride];
      int64_t antennaDiversityOverride = self->_antennaDiversityOverride;
      id v12 = [(NIHomeDeviceConfiguration *)v5 minimumPreferredUpdatedRate];
      int64_t v29 = antennaDiversityOverride;
      int64_t minimumPreferredUpdatedRate = self->_minimumPreferredUpdatedRate;
      id v13 = [(NIHomeDeviceConfiguration *)v5 sessionKey];
      id v25 = v12;
      if (v13) {
        BOOL v27 = 0;
      }
      else {
        BOOL v27 = self->_sessionKey == 0;
      }
      id v28 = v10;

      v15 = [(NIHomeDeviceConfiguration *)v5 sessionKey];
      unsigned int v16 = v8;
      unsigned int v17 = [v15 isEqualToData:self->_sessionKey];
      unint64_t v18 = allowedDevices;
      unint64_t v19 = v6;

      v20 = [(NIHomeDeviceConfiguration *)v5 monitoredRegions];
      unsigned __int8 v21 = [v20 isEqualToArray:self->_monitoredRegions];

      v22 = [(NIHomeDeviceConfiguration *)v5 monitoredRegions];
      if (v22) {
        BOOL v23 = 0;
      }
      else {
        BOOL v23 = self->_monitoredRegions == 0;
      }

      char v14 = 0;
      if (v19 == v18 && anchor == v16 && v28 == (id)v29 && (((v27 | v17) ^ 1) & 1) == 0)
      {
        if (v25 == (id)minimumPreferredUpdatedRate) {
          char v14 = v21 | v23;
        }
        else {
          char v14 = 0;
        }
      }
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = (NIHomeDeviceConfiguration *)v4;
    if (v5 == self)
    {
      BOOL v7 = 1;
    }
    else if ([(NIHomeDeviceConfiguration *)self canUpdateToConfiguration:v5])
    {
      id v6 = [(NIConfiguration *)self enabledGestures];
      BOOL v7 = v6 == (id)[(NIConfiguration *)v5 enabledGestures];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_allowedDevices ^ self->_anchor ^ (unint64_t)[(NSData *)self->_sessionKey hash];
  int64_t antennaDiversityOverride = self->_antennaDiversityOverride;
  return v3 ^ antennaDiversityOverride ^ (unint64_t)[(NSArray *)self->_monitoredRegions hash] ^ self->_minimumPreferredUpdatedRate;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  id v6 = [(NIHomeDeviceConfiguration *)self descriptionInternal];
  id v7 = [v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  id v3 = +[NIInternalUtils NIRelationshipSpecifierToString:self->_allowedDevices];
  if (self->_anchor) {
    id v4 = "Yes";
  }
  else {
    id v4 = "No";
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<devices: [%s], ses-key: %@, anchor: %s, ant-div: %s, min-rate: %s, gestures: %d, regions: %@>", v3, self->_sessionKey, v4, +[NIInternalUtils AntennaDiversityOverrideToString:](NIInternalUtils, "AntennaDiversityOverrideToString:", self->_antennaDiversityOverride), +[NIInternalUtils NINearbyObjectUpdateRateToString:self->_minimumPreferredUpdatedRate], [(NIConfiguration *)self enabledGestures], self->_regionDescription);
}

- (unint64_t)allowedDevices
{
  return self->_allowedDevices;
}

- (void)setAllowedDevices:(unint64_t)a3
{
  self->_unint64_t allowedDevices = a3;
}

- (NSData)sessionKey
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSessionKey:(id)a3
{
}

- (BOOL)isAnchor
{
  return self->_anchor;
}

- (void)setAnchor:(BOOL)a3
{
  self->_int anchor = a3;
}

- (int64_t)minimumPreferredUpdatedRate
{
  return self->_minimumPreferredUpdatedRate;
}

- (void)setMinimumPreferredUpdatedRate:(int64_t)a3
{
  self->_int64_t minimumPreferredUpdatedRate = a3;
}

- (int64_t)antennaDiversityOverride
{
  return self->_antennaDiversityOverride;
}

- (void)setAntennaDiversityOverride:(int64_t)a3
{
  self->_int64_t antennaDiversityOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionKey, 0);
  objc_storeStrong((id *)&self->_regionDescription, 0);

  objc_storeStrong((id *)&self->_monitoredRegions, 0);
}

@end