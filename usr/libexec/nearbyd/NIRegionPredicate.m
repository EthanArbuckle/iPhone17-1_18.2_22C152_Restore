@interface NIRegionPredicate
+ (BOOL)_isExecuteRegion:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)coarseEstimation;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresUserIntent;
- (NIRegionPredicate)initWithCoder:(id)a3;
- (NIRegionPredicate)initWithName:(id)a3 devicePresencePreset:(int64_t)a4;
- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4;
- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5;
- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5 requiresUserIntent:(BOOL)a6;
- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5 requiresUserIntent:(BOOL)a6 devicePresencePreset:(int64_t)a7;
- (NIRegionPredicate)initWithName:(id)a3 regionSizeCategory:(int64_t)a4 radius:(float)a5 preferredUpdateRate:(int64_t)a6 requiresUserIntent:(BOOL)a7;
- (NIRegionPredicate)initWithName:(id)a3 regionSizeCategory:(int64_t)a4 radius:(float)a5 preferredUpdateRate:(int64_t)a6 requiresUserIntent:(BOOL)a7 coarseEstimation:(BOOL)a8 devicePresencePreset:(int64_t)a9;
- (NIRegionPredicate)initWithName:(id)a3 regionSizeCategory:(int64_t)a4 radius:(float)a5 preferredUpdateRate:(int64_t)a6 requiresUserIntent:(BOOL)a7 devicePresencePreset:(int64_t)a8;
- (NSString)name;
- (float)radius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (id)shortDescription;
- (int64_t)devicePresencePreset;
- (int64_t)preferredUpdateRate;
- (int64_t)regionSizeCategory;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCoarseEstimation:(BOOL)a3;
- (void)setDevicePresencePreset:(int64_t)a3;
- (void)setPreferredUpdateRate:(int64_t)a3;
- (void)setRegionSizeCategory:(int64_t)a3;
- (void)setRequiresUserIntent:(BOOL)a3;
@end

@implementation NIRegionPredicate

- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5
{
  id v10 = a3;
  if (!v10)
  {
    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"NIRegionPredicate.mm", 22, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  if (a4 <= 0.0)
  {
    v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"NIRegionPredicate.mm" lineNumber:23 description:@"radius must be larger than 0"];
  }
  v16.receiver = self;
  v16.super_class = (Class)NIRegionPredicate;
  v11 = [(NIRegionPredicate *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_radius = a4;
    v12->_regionSizeCategory = 0;
    v12->_preferredUpdateRate = a5;
    *(_WORD *)&v12->_requiresUserIntent = 0;
    v12->_devicePresencePreset = 0;
  }

  return v12;
}

- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)objc_opt_class());
  *(float *)&double v8 = a4;
  v9 = (NIRegionPredicate *)[v7 initWithName:v6 radius:0 preferredUpdateRate:v8];

  return v9;
}

- (NIRegionPredicate)initWithName:(id)a3 devicePresencePreset:(int64_t)a4
{
  id v7 = a3;
  if (v7)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"NIRegionPredicate.mm", 42, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v12 = +[NSAssertionHandler currentHandler];
  [v12 handleFailureInMethod:a2 object:self file:@"NIRegionPredicate.mm" lineNumber:43 description:@"device presence preset cannot be unspecified"];

LABEL_3:
  id v8 = objc_alloc((Class)objc_opt_class());
  +[NIDevicePresenceConfiguration _radiusFromDevicePresencePreset:a4];
  v9 = (NIRegionPredicate *)[v8 initWithName:v7];

  if (v9) {
    v9->_devicePresencePreset = a4;
  }

  return v9;
}

- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5 requiresUserIntent:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v11 = [NIRegionPredicate alloc];
  *(float *)&double v12 = a4;
  v13 = [(NIRegionPredicate *)v11 initWithName:v10 radius:a5 preferredUpdateRate:v12];
  [(NIRegionPredicate *)v13 setRequiresUserIntent:v6];

  return v13;
}

- (NIRegionPredicate)initWithName:(id)a3 regionSizeCategory:(int64_t)a4 radius:(float)a5 preferredUpdateRate:(int64_t)a6 requiresUserIntent:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  v13 = [NIRegionPredicate alloc];
  *(float *)&double v14 = a5;
  v15 = [(NIRegionPredicate *)v13 initWithName:v12 radius:a6 preferredUpdateRate:v7 requiresUserIntent:v14];
  [(NIRegionPredicate *)v15 setRegionSizeCategory:a4];

  return v15;
}

- (NIRegionPredicate)initWithName:(id)a3 radius:(float)a4 preferredUpdateRate:(int64_t)a5 requiresUserIntent:(BOOL)a6 devicePresencePreset:(int64_t)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  v13 = [NIRegionPredicate alloc];
  *(float *)&double v14 = a4;
  v15 = [(NIRegionPredicate *)v13 initWithName:v12 radius:a5 preferredUpdateRate:v8 requiresUserIntent:v14];
  [(NIRegionPredicate *)v15 setDevicePresencePreset:a7];

  return v15;
}

- (NIRegionPredicate)initWithName:(id)a3 regionSizeCategory:(int64_t)a4 radius:(float)a5 preferredUpdateRate:(int64_t)a6 requiresUserIntent:(BOOL)a7 devicePresencePreset:(int64_t)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  v15 = [NIRegionPredicate alloc];
  *(float *)&double v16 = a5;
  v17 = [(NIRegionPredicate *)v15 initWithName:v14 regionSizeCategory:a4 radius:a6 preferredUpdateRate:v9 requiresUserIntent:0 coarseEstimation:a8 devicePresencePreset:v16];

  return v17;
}

- (NIRegionPredicate)initWithName:(id)a3 regionSizeCategory:(int64_t)a4 radius:(float)a5 preferredUpdateRate:(int64_t)a6 requiresUserIntent:(BOOL)a7 coarseEstimation:(BOOL)a8 devicePresencePreset:(int64_t)a9
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  id v16 = a3;
  v17 = [NIRegionPredicate alloc];
  *(float *)&double v18 = a5;
  v19 = [(NIRegionPredicate *)v17 initWithName:v16 radius:a6 preferredUpdateRate:v11 requiresUserIntent:a9 devicePresencePreset:v18];
  [(NIRegionPredicate *)v19 setRegionSizeCategory:a4];
  [(NIRegionPredicate *)v19 setCoarseEstimation:v10];

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)devicePresencePreset
{
  return self->_devicePresencePreset;
}

- (void)setDevicePresencePreset:(int64_t)a3
{
  self->_devicePresencePreset = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  name = self->_name;
  int64_t regionSizeCategory = self->_regionSizeCategory;
  *(float *)&double v7 = self->_radius;
  int64_t preferredUpdateRate = self->_preferredUpdateRate;
  BOOL requiresUserIntent = self->_requiresUserIntent;
  BOOL coarseEstimation = self->_coarseEstimation;
  int64_t devicePresencePreset = self->_devicePresencePreset;

  return [v4 initWithName:name regionSizeCategory:regionSizeCategory radius:preferredUpdateRate preferredUpdateRate:requiresUserIntent requiresUserIntent:coarseEstimation coarseEstimation:devicePresencePreset devicePresencePreset:v7];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeInteger:self->_regionSizeCategory forKey:@"regionSizeCategory"];
  *(float *)&double v4 = self->_radius;
  [v5 encodeFloat:@"radius" forKey:v4];
  [v5 encodeInteger:self->_preferredUpdateRate forKey:@"preferredUpdateRate"];
  [v5 encodeBool:self->_requiresUserIntent forKey:@"requiresUserIntent"];
  [v5 encodeInteger:self->_devicePresencePreset forKey:@"devicePresencePreset"];
  [v5 encodeBool:self->_coarseEstimation forKey:@"coarseEstimation"];
}

- (NIRegionPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v6 = [v4 decodeIntegerForKey:@"regionSizeCategory"];
  [v4 decodeFloatForKey:@"radius"];
  float v8 = v7;
  id v9 = [v4 decodeIntegerForKey:@"preferredUpdateRate"];
  id v10 = [v4 decodeIntegerForKey:@"devicePresencePreset"];
  if (v5 && ((int64_t v11 = (int64_t)v10, v8 >= 0.0) || v10))
  {
    unsigned __int8 v13 = [v4 decodeBoolForKey:@"requiresUserIntent"];
    unsigned __int8 v14 = [v4 decodeBoolForKey:@"coarseEstimation"];
    v18.receiver = self;
    v18.super_class = (Class)NIRegionPredicate;
    v15 = [(NIRegionPredicate *)&v18 init];
    id v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_name, v5);
      v16->_radius = v8;
      v16->_int64_t regionSizeCategory = (int64_t)v6;
      v16->_int64_t preferredUpdateRate = (int64_t)v9;
      v16->_BOOL requiresUserIntent = v13;
      v16->_int64_t devicePresencePreset = v11;
      v16->_BOOL coarseEstimation = v14;
    }
    self = v16;
    id v12 = self;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (NIRegionPredicate *)v4;
    id v6 = v5;
    if (v5 == self)
    {
      BOOL v9 = 1;
    }
    else
    {
      float v7 = [(NIRegionPredicate *)v5 name];
      BOOL v9 = [v7 isEqualToString:self->_name]
        && [(NIRegionPredicate *)v6 regionSizeCategory] == self->_regionSizeCategory
        && ([(NIRegionPredicate *)v6 radius], v8 == self->_radius)
        && [(NIRegionPredicate *)v6 preferredUpdateRate] == self->_preferredUpdateRate
        && self->_requiresUserIntent == [(NIRegionPredicate *)v6 requiresUserIntent]
        && self->_coarseEstimation == [(NIRegionPredicate *)v6 coarseEstimation];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_regionSizeCategory ^ self->_preferredUpdateRate ^ [(NSString *)self->_name hash] ^ self->_requiresUserIntent ^ self->_devicePresencePreset ^ self->_coarseEstimation ^ (int)self->_radius;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(NIRegionPredicate *)self descriptionInternal];
  id v7 = [v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  name = self->_name;
  int64_t regionSizeCategory = self->_regionSizeCategory;
  if (regionSizeCategory)
  {
    if (regionSizeCategory != 10) {
      sub_100428850();
    }
    CFStringRef v5 = @"Large";
  }
  else
  {
    CFStringRef v5 = @"Default";
  }
  float radius = self->_radius;
  id v7 = +[NIInternalUtils NINearbyObjectUpdateRateToString:self->_preferredUpdateRate];
  unint64_t devicePresencePreset = self->_devicePresencePreset;
  if (devicePresencePreset >= 7) {
    sub_10042887C();
  }
  BOOL v9 = +[NSString stringWithFormat:@"name: %@, cat: %@, radius: %0.2f m, rate: %s, intent: %d,  coarse: %d, presencePreset: %s", name, v5, radius, v7, self->_requiresUserIntent, self->_coarseEstimation, off_10085D208[devicePresencePreset]];

  return v9;
}

- (id)shortDescription
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: %0.2fm %s C:%d,I:%d,P:%d CE: %d", self->_name, self->_radius, +[NIInternalUtils NINearbyObjectUpdateRateToShortString:self->_preferredUpdateRate], self->_regionSizeCategory, self->_requiresUserIntent, self->_devicePresencePreset, self->_coarseEstimation);
}

+ (BOOL)_isExecuteRegion:(id)a3
{
  return [a3 devicePresencePreset] == (id)6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)regionSizeCategory
{
  return self->_regionSizeCategory;
}

- (void)setRegionSizeCategory:(int64_t)a3
{
  self->_int64_t regionSizeCategory = a3;
}

- (float)radius
{
  return self->_radius;
}

- (int64_t)preferredUpdateRate
{
  return self->_preferredUpdateRate;
}

- (void)setPreferredUpdateRate:(int64_t)a3
{
  self->_int64_t preferredUpdateRate = a3;
}

- (BOOL)requiresUserIntent
{
  return self->_requiresUserIntent;
}

- (void)setRequiresUserIntent:(BOOL)a3
{
  self->_BOOL requiresUserIntent = a3;
}

- (BOOL)coarseEstimation
{
  return self->_coarseEstimation;
}

- (void)setCoarseEstimation:(BOOL)a3
{
  self->_BOOL coarseEstimation = a3;
}

- (void).cxx_destruct
{
}

@end