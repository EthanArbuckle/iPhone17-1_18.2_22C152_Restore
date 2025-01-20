@interface PRSMigrationDescriptor
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BSColor)homeScreenTintColor;
- (NSNumber)isHomeScreenDim;
- (NSString)description;
- (NSString)homeScreenIconSize;
- (NSString)homeScreenIconStyle;
- (PRSMigrationDescriptor)initWithBSXPCCoder:(id)a3;
- (PRSMigrationDescriptor)initWithCoder:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setHomeScreenDim:(id)a3;
- (void)setHomeScreenIconSize:(id)a3;
- (void)setHomeScreenIconStyle:(id)a3;
- (void)setHomeScreenTintColor:(id)a3;
@end

@implementation PRSMigrationDescriptor

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [(PRSMigrationDescriptor *)self homeScreenTintColor];
  id v5 = (id)[v3 appendObject:v4 withName:@"homeScreenTintColor" skipIfNil:1];

  v6 = [(PRSMigrationDescriptor *)self isHomeScreenDim];
  id v7 = (id)[v3 appendObject:v6 withName:@"homeScreenDim" skipIfNil:1];

  v8 = [(PRSMigrationDescriptor *)self homeScreenIconStyle];
  id v9 = (id)[v3 appendObject:v8 withName:@"homeScreenIconStyle" skipIfNil:1];

  v10 = [(PRSMigrationDescriptor *)self homeScreenIconSize];
  id v11 = (id)[v3 appendObject:v10 withName:@"homeScreenIconSize" skipIfNil:1];

  v12 = [v3 build];

  return (NSString *)v12;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRSMigrationDescriptor)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PRSMigrationDescriptor;
  id v5 = [(PRSMigrationDescriptor *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_homeScreenDim"];
    homeScreenDim = v5->_homeScreenDim;
    v5->_homeScreenDim = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_homeScreenTintColor"];
    homeScreenTintColor = v5->_homeScreenTintColor;
    v5->_homeScreenTintColor = (BSColor *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_homeScreenIconSize"];
    homeScreenIconSize = v5->_homeScreenIconSize;
    v5->_homeScreenIconSize = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_homeScreenIconStyle"];
    homeScreenIconStyle = v5->_homeScreenIconStyle;
    v5->_homeScreenIconStyle = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  homeScreenDim = self->_homeScreenDim;
  id v5 = a3;
  [v5 encodeObject:homeScreenDim forKey:@"_homeScreenDim"];
  [v5 encodeObject:self->_homeScreenTintColor forKey:@"_homeScreenTintColor"];
  [v5 encodeObject:self->_homeScreenIconSize forKey:@"_homeScreenIconSize"];
  [v5 encodeObject:self->_homeScreenIconStyle forKey:@"_homeScreenIconStyle"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRSMigrationDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PRSMigrationDescriptor;
  id v5 = [(PRSMigrationDescriptor *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_homeScreenDim"];
    homeScreenDim = v5->_homeScreenDim;
    v5->_homeScreenDim = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_homeScreenTintColor"];
    homeScreenTintColor = v5->_homeScreenTintColor;
    v5->_homeScreenTintColor = (BSColor *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_homeScreenIconSize"];
    homeScreenIconSize = v5->_homeScreenIconSize;
    v5->_homeScreenIconSize = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_homeScreenIconStyle"];
    homeScreenIconStyle = v5->_homeScreenIconStyle;
    v5->_homeScreenIconStyle = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  homeScreenDim = self->_homeScreenDim;
  id v5 = a3;
  [v5 encodeObject:homeScreenDim forKey:@"_homeScreenDim"];
  [v5 encodeObject:self->_homeScreenTintColor forKey:@"_homeScreenTintColor"];
  [v5 encodeObject:self->_homeScreenIconSize forKey:@"_homeScreenIconSize"];
  [v5 encodeObject:self->_homeScreenIconStyle forKey:@"_homeScreenIconStyle"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PRSMutableMigrationDescriptor);
  id v5 = [(PRSMigrationDescriptor *)self homeScreenTintColor];
  [(PRSMigrationDescriptor *)v4 setHomeScreenTintColor:v5];

  uint64_t v6 = [(PRSMigrationDescriptor *)self isHomeScreenDim];
  [(PRSMigrationDescriptor *)v4 setHomeScreenDim:v6];

  id v7 = [(PRSMigrationDescriptor *)self homeScreenIconSize];
  [(PRSMigrationDescriptor *)v4 setHomeScreenIconSize:v7];

  uint64_t v8 = [(PRSMigrationDescriptor *)self homeScreenIconStyle];
  [(PRSMigrationDescriptor *)v4 setHomeScreenIconStyle:v8];

  return v4;
}

- (NSString)homeScreenIconSize
{
  return self->_homeScreenIconSize;
}

- (void)setHomeScreenIconSize:(id)a3
{
}

- (NSString)homeScreenIconStyle
{
  return self->_homeScreenIconStyle;
}

- (void)setHomeScreenIconStyle:(id)a3
{
}

- (BSColor)homeScreenTintColor
{
  return self->_homeScreenTintColor;
}

- (void)setHomeScreenTintColor:(id)a3
{
}

- (NSNumber)isHomeScreenDim
{
  return self->_homeScreenDim;
}

- (void)setHomeScreenDim:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenDim, 0);
  objc_storeStrong((id *)&self->_homeScreenTintColor, 0);
  objc_storeStrong((id *)&self->_homeScreenIconStyle, 0);
  objc_storeStrong((id *)&self->_homeScreenIconSize, 0);
}

@end