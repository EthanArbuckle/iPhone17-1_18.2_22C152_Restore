@interface PRPosterConfigurableOptions
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfigurableOptions:(id)a3;
- (NSArray)preferredTimeFontConfigurations;
- (NSArray)preferredTitleColors;
- (NSString)description;
- (NSString)displayNameLocalizationKey;
- (NSString)role;
- (PRPosterConfigurableOptions)initWithBSXPCCoder:(id)a3;
- (PRPosterConfigurableOptions)initWithCoder:(id)a3;
- (PRPosterConfigurableOptions)initWithDisplayNameLocalizationKey:(id)a3 ambientSupportedDataLayout:(int64_t)a4 preferredTimeFontConfigurations:(id)a5 preferredTitleColors:(id)a6 luminance:(double)a7 preferredHomeScreenConfiguration:(id)a8;
- (PRPosterConfigurableOptions)initWithDisplayNameLocalizationKey:(id)a3 role:(id)a4 ambientSupportedDataLayout:(int64_t)a5 preferredTimeFontConfigurations:(id)a6 preferredTitleColors:(id)a7 preferredHomeScreenConfiguration:(id)a8;
- (PRPosterDescriptorHomeScreenConfiguration)preferredHomeScreenConfiguration;
- (double)luminance;
- (id)_initWithDisplayNameLocalizationKey:(id)a3 role:(id)a4 ambientSupportedDataLayout:(int64_t)a5 preferredTimeFontConfigurations:(id)a6 preferredTitleColors:(id)a7 luminance:(double)a8 preferredHomeScreenConfiguration:(id)a9;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)ambientSupportedDataLayout;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAmbientSupportedDataLayout:(int64_t)a3;
- (void)setDisplayNameLocalizationKey:(id)a3;
- (void)setLuminance:(double)a3;
- (void)setPreferredHomeScreenConfiguration:(id)a3;
- (void)setPreferredTimeFontConfigurations:(id)a3;
- (void)setPreferredTitleColors:(id)a3;
- (void)setRole:(id)a3;
@end

@implementation PRPosterConfigurableOptions

- (PRPosterConfigurableOptions)initWithDisplayNameLocalizationKey:(id)a3 role:(id)a4 ambientSupportedDataLayout:(int64_t)a5 preferredTimeFontConfigurations:(id)a6 preferredTitleColors:(id)a7 preferredHomeScreenConfiguration:(id)a8
{
  return (PRPosterConfigurableOptions *)[(PRPosterConfigurableOptions *)self _initWithDisplayNameLocalizationKey:a3 role:a4 ambientSupportedDataLayout:a5 preferredTimeFontConfigurations:a6 preferredTitleColors:a7 luminance:a8 preferredHomeScreenConfiguration:0.5];
}

- (id)_initWithDisplayNameLocalizationKey:(id)a3 role:(id)a4 ambientSupportedDataLayout:(int64_t)a5 preferredTimeFontConfigurations:(id)a6 preferredTitleColors:(id)a7 luminance:(double)a8 preferredHomeScreenConfiguration:(id)a9
{
  v16 = (__CFString *)a4;
  v17 = [(PRPosterConfigurableOptions *)self initWithDisplayNameLocalizationKey:a3 ambientSupportedDataLayout:a5 preferredTimeFontConfigurations:a6 preferredTitleColors:a7 luminance:a9 preferredHomeScreenConfiguration:a8];
  v18 = v17;
  if (v17)
  {
    if (v16) {
      v19 = v16;
    }
    else {
      v19 = @"PRPosterRoleLockScreen";
    }
    objc_storeStrong((id *)&v17->_role, v19);
  }

  return v18;
}

- (PRPosterConfigurableOptions)initWithDisplayNameLocalizationKey:(id)a3 ambientSupportedDataLayout:(int64_t)a4 preferredTimeFontConfigurations:(id)a5 preferredTitleColors:(id)a6 luminance:(double)a7 preferredHomeScreenConfiguration:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)PRPosterConfigurableOptions;
  v18 = [(PRPosterConfigurableOptions *)&v27 init];
  if (v18)
  {
    id v19 = v14;
    if (v19 && (NSClassFromString(&cfstr_Nsstring.isa), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSStringClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRPosterConfigurableOptions initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:].cold.4();
      }
    }
    else
    {

      id v20 = v15;
      if (v20)
      {
        NSClassFromString(&cfstr_Nsarray.isa);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v25 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[PRPosterConfigurableOptions initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:]();
          }
          [v25 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18C1E5D64);
        }
      }

      id v21 = v16;
      if (v21)
      {
        NSClassFromString(&cfstr_Nsarray.isa);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NSArrayClass]"];
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            -[PRPosterConfigurableOptions initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:]();
          }
          [v26 UTF8String];
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x18C1E5DC8);
        }
      }

      id v22 = v17;
      if (!v22 || (NSClassFromString(&cfstr_Prposterdescri_0.isa), (objc_opt_isKindOfClass() & 1) != 0))
      {

        [(PRPosterConfigurableOptions *)v18 setDisplayNameLocalizationKey:v19];
        [(PRPosterConfigurableOptions *)v18 setAmbientSupportedDataLayout:a4];
        [(PRPosterConfigurableOptions *)v18 setPreferredTimeFontConfigurations:v20];
        [(PRPosterConfigurableOptions *)v18 setPreferredTitleColors:v21];
        [(PRPosterConfigurableOptions *)v18 setLuminance:a7];
        [(PRPosterConfigurableOptions *)v18 setPreferredHomeScreenConfiguration:v22];
        goto LABEL_11;
      }
      v24 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:PRPosterDescriptorHomeScreenConfigurationClass]"];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[PRPosterConfigurableOptions initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:]();
      }
    }
    [v24 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18C1E5D00);
  }
LABEL_11:

  return v18;
}

- (PRPosterConfigurableOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayNameLocalizationKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"role"];
  uint64_t v7 = [v4 decodeInt64ForKey:@"ambientSupportedDataLayout"];
  v8 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v9 = [v4 decodeArrayOfObjectsOfClasses:v8 forKey:@"preferredTitleColors"];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  id v14 = [v4 decodeArrayOfObjectsOfClasses:v13 forKey:@"preferredTimeFontConfigurations"];

  id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"luminance"];
  id v16 = v15;
  if (v15)
  {
    [v15 doubleValue];
    double v18 = v17;
  }
  else
  {
    double v18 = 0.5;
  }
  id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredHomeScreenConfiguration"];
  id v20 = [(PRPosterConfigurableOptions *)self _initWithDisplayNameLocalizationKey:v5 role:v6 ambientSupportedDataLayout:v7 preferredTimeFontConfigurations:v14 preferredTitleColors:v9 luminance:v19 preferredHomeScreenConfiguration:v18];

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(PRPosterConfigurableOptions *)self displayNameLocalizationKey];
  [v12 encodeObject:v4 forKey:@"displayNameLocalizationKey"];

  v5 = [(PRPosterConfigurableOptions *)self role];

  if (v5)
  {
    v6 = [(PRPosterConfigurableOptions *)self role];
    [v12 encodeObject:v6 forKey:@"role"];
  }
  objc_msgSend(v12, "encodeInt64:forKey:", -[PRPosterConfigurableOptions ambientSupportedDataLayout](self, "ambientSupportedDataLayout"), @"ambientSupportedDataLayout");
  uint64_t v7 = [(PRPosterConfigurableOptions *)self preferredTimeFontConfigurations];
  [v12 encodeObject:v7 forKey:@"preferredTimeFontConfigurations"];

  v8 = [(PRPosterConfigurableOptions *)self preferredTitleColors];
  [v12 encodeObject:v8 forKey:@"preferredTitleColors"];

  v9 = NSNumber;
  [(PRPosterConfigurableOptions *)self luminance];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  [v12 encodeObject:v10 forKey:@"luminance"];

  uint64_t v11 = [(PRPosterConfigurableOptions *)self preferredHomeScreenConfiguration];
  [v12 encodeObject:v11 forKey:@"preferredHomeScreenConfiguration"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PRPosterConfigurableOptions alloc];
  v5 = [(PRPosterConfigurableOptions *)self displayNameLocalizationKey];
  v6 = [(PRPosterConfigurableOptions *)self role];
  int64_t v7 = [(PRPosterConfigurableOptions *)self ambientSupportedDataLayout];
  v8 = [(PRPosterConfigurableOptions *)self preferredTimeFontConfigurations];
  v9 = [(PRPosterConfigurableOptions *)self preferredTitleColors];
  [(PRPosterConfigurableOptions *)self luminance];
  double v11 = v10;
  id v12 = [(PRPosterConfigurableOptions *)self preferredHomeScreenConfiguration];
  id v13 = [(PRPosterConfigurableOptions *)v4 _initWithDisplayNameLocalizationKey:v5 role:v6 ambientSupportedDataLayout:v7 preferredTimeFontConfigurations:v8 preferredTitleColors:v9 luminance:v12 preferredHomeScreenConfiguration:v11];

  return v13;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [PRPosterMutableConfigurableOptions alloc];
  v5 = [(PRPosterConfigurableOptions *)self displayNameLocalizationKey];
  v6 = [(PRPosterConfigurableOptions *)self role];
  int64_t v7 = [(PRPosterConfigurableOptions *)self ambientSupportedDataLayout];
  v8 = [(PRPosterConfigurableOptions *)self preferredTimeFontConfigurations];
  v9 = [(PRPosterConfigurableOptions *)self preferredTitleColors];
  [(PRPosterConfigurableOptions *)self luminance];
  double v11 = v10;
  id v12 = [(PRPosterConfigurableOptions *)self preferredHomeScreenConfiguration];
  id v13 = [(PRPosterConfigurableOptions *)v4 _initWithDisplayNameLocalizationKey:v5 role:v6 ambientSupportedDataLayout:v7 preferredTimeFontConfigurations:v8 preferredTitleColors:v9 luminance:v12 preferredHomeScreenConfiguration:v11];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterConfigurableOptions *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PRPosterConfigurableOptions *)self isEqualToConfigurableOptions:v4];
  }

  return v5;
}

- (BOOL)isEqualToConfigurableOptions:(id)a3
{
  id v4 = (PRPosterConfigurableOptions *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    char v14 = 1;
  }
  else if (v4)
  {
    v6 = [(PRPosterConfigurableOptions *)self displayNameLocalizationKey];
    int64_t v7 = [(PRPosterConfigurableOptions *)v5 displayNameLocalizationKey];
    if (BSEqualObjects())
    {
      v8 = [(PRPosterConfigurableOptions *)self role];
      v9 = [(PRPosterConfigurableOptions *)v5 role];
      if (BSEqualObjects()
        && ([(PRPosterConfigurableOptions *)self ambientSupportedDataLayout],
            [(PRPosterConfigurableOptions *)v5 ambientSupportedDataLayout],
            BSEqualDoubles()))
      {
        double v10 = [(PRPosterConfigurableOptions *)self preferredTimeFontConfigurations];
        double v11 = [(PRPosterConfigurableOptions *)v5 preferredTimeFontConfigurations];
        if (BSEqualObjects())
        {
          id v12 = [(PRPosterConfigurableOptions *)self preferredTitleColors];
          id v13 = [(PRPosterConfigurableOptions *)v5 preferredTitleColors];
          if (BSEqualObjects()
            && ([(PRPosterConfigurableOptions *)self luminance],
                [(PRPosterConfigurableOptions *)v5 luminance],
                BSFloatEqualToFloat()))
          {
            double v17 = [(PRPosterConfigurableOptions *)self preferredHomeScreenConfiguration];
            id v16 = [(PRPosterConfigurableOptions *)v5 preferredHomeScreenConfiguration];
            char v14 = BSEqualObjects();
          }
          else
          {
            char v14 = 0;
          }
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = [(PRPosterConfigurableOptions *)self preferredTimeFontConfigurations];
  id v4 = [(PRPosterConfigurableOptions *)self preferredTitleColors];
  BOOL v5 = [MEMORY[0x1E4F4F758] builder];
  v6 = [(PRPosterConfigurableOptions *)self displayNameLocalizationKey];
  id v7 = (id)[v5 appendString:v6];

  v8 = [(PRPosterConfigurableOptions *)self role];

  if (v8)
  {
    v9 = [(PRPosterConfigurableOptions *)self role];
    id v10 = (id)[v5 appendString:v9];
  }
  id v11 = (id)objc_msgSend(v5, "appendInt64:", -[PRPosterConfigurableOptions ambientSupportedDataLayout](self, "ambientSupportedDataLayout"));
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __35__PRPosterConfigurableOptions_hash__block_invoke;
  v24[3] = &unk_1E54DAF68;
  id v12 = v5;
  id v25 = v12;
  [v3 enumerateObjectsUsingBlock:v24];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __35__PRPosterConfigurableOptions_hash__block_invoke_2;
  id v22 = &unk_1E54DAF90;
  id v23 = v12;
  id v13 = v12;
  [v4 enumerateObjectsUsingBlock:&v19];
  [(PRPosterConfigurableOptions *)self luminance];
  id v14 = (id)objc_msgSend(v13, "appendCGFloat:");
  id v15 = [(PRPosterConfigurableOptions *)self preferredHomeScreenConfiguration];
  id v16 = (id)[v13 appendObject:v15];

  unint64_t v17 = [v13 hash];
  return v17;
}

id __35__PRPosterConfigurableOptions_hash__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) appendObject:a2];
}

id __35__PRPosterConfigurableOptions_hash__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) appendObject:a2];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __42__PRPosterConfigurableOptions_description__block_invoke;
  id v10 = &unk_1E54DAA08;
  id v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  BOOL v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __42__PRPosterConfigurableOptions_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (PRPosterConfigurableOptions)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeStringForKey:@"displayNameLocalizationKey"];
  v6 = self;
  uint64_t v7 = self;
  uint64_t v8 = [v4 decodeCollectionOfClass:v6 containingClass:v7 forKey:@"preferredTimeFontConfigurations"];

  v9 = [v4 decodeStringForKey:@"role"];
  uint64_t v10 = [v4 decodeInt64ForKey:@"ambientSupportedDataLayout"];
  uint64_t v11 = objc_opt_class();
  id v12 = [v4 decodeCollectionOfClass:v11 containingClass:objc_opt_class() forKey:@"preferredTitleColors"];
  id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"luminance"];
  id v14 = v13;
  if (v13)
  {
    [v13 doubleValue];
    double v16 = v15;
  }
  else
  {
    double v16 = 0.5;
  }
  unint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredHomeScreenConfiguration"];
  double v18 = [(PRPosterConfigurableOptions *)self _initWithDisplayNameLocalizationKey:v5 role:v9 ambientSupportedDataLayout:v10 preferredTimeFontConfigurations:v8 preferredTitleColors:v12 luminance:v17 preferredHomeScreenConfiguration:v16];

  return v18;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(PRPosterConfigurableOptions *)self displayNameLocalizationKey];
  [v12 encodeObject:v4 forKey:@"displayNameLocalizationKey"];

  BOOL v5 = [(PRPosterConfigurableOptions *)self role];

  if (v5)
  {
    v6 = [(PRPosterConfigurableOptions *)self role];
    [v12 encodeObject:v6 forKey:@"role"];
  }
  objc_msgSend(v12, "encodeInt64:forKey:", -[PRPosterConfigurableOptions ambientSupportedDataLayout](self, "ambientSupportedDataLayout"), @"ambientSupportedDataLayout");
  uint64_t v7 = [(PRPosterConfigurableOptions *)self preferredTimeFontConfigurations];
  [v12 encodeObject:v7 forKey:@"preferredTimeFontConfigurations"];

  uint64_t v8 = [(PRPosterConfigurableOptions *)self preferredTitleColors];
  [v12 encodeObject:v8 forKey:@"preferredTitleColors"];

  v9 = NSNumber;
  [(PRPosterConfigurableOptions *)self luminance];
  uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
  [v12 encodeObject:v10 forKey:@"luminance"];

  uint64_t v11 = [(PRPosterConfigurableOptions *)self preferredHomeScreenConfiguration];
  [v12 encodeObject:v11 forKey:@"preferredHomeScreenConfiguration"];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v14 = a3;
  id v4 = [(PRPosterConfigurableOptions *)self displayNameLocalizationKey];
  [v14 appendString:v4 withName:@"displayNameLocalizationKey" skipIfEmpty:1];

  BOOL v5 = [(PRPosterConfigurableOptions *)self role];
  [v14 appendString:v5 withName:@"role" skipIfEmpty:1];

  id v6 = (id)objc_msgSend(v14, "appendInt64:withName:", -[PRPosterConfigurableOptions ambientSupportedDataLayout](self, "ambientSupportedDataLayout"), @"ambientSupportedDataLayout");
  uint64_t v7 = [(PRPosterConfigurableOptions *)self preferredTitleColors];
  id v8 = (id)[v14 appendObject:v7 withName:@"preferredTitleColors"];

  v9 = [(PRPosterConfigurableOptions *)self preferredTimeFontConfigurations];
  id v10 = (id)[v14 appendObject:v9 withName:@"preferredTimeFontConfigurations"];

  [(PRPosterConfigurableOptions *)self luminance];
  id v11 = (id)objc_msgSend(v14, "appendDouble:withName:decimalPrecision:", @"luminance", 4);
  id v12 = [(PRPosterConfigurableOptions *)self preferredHomeScreenConfiguration];
  id v13 = (id)[v14 appendObject:v12 withName:@"preferredHomeScreenConfiguration"];
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
}

- (int64_t)ambientSupportedDataLayout
{
  return self->_ambientSupportedDataLayout;
}

- (void)setAmbientSupportedDataLayout:(int64_t)a3
{
  self->_ambientSupportedDataLayout = a3;
}

- (NSArray)preferredTimeFontConfigurations
{
  return self->_preferredTimeFontConfigurations;
}

- (void)setPreferredTimeFontConfigurations:(id)a3
{
}

- (NSArray)preferredTitleColors
{
  return self->_preferredTitleColors;
}

- (void)setPreferredTitleColors:(id)a3
{
}

- (double)luminance
{
  return self->_luminance;
}

- (void)setLuminance:(double)a3
{
  self->_luminance = a3;
}

- (PRPosterDescriptorHomeScreenConfiguration)preferredHomeScreenConfiguration
{
  return self->_preferredHomeScreenConfiguration;
}

- (void)setPreferredHomeScreenConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredHomeScreenConfiguration, 0);
  objc_storeStrong((id *)&self->_preferredTitleColors, 0);
  objc_storeStrong((id *)&self->_preferredTimeFontConfigurations, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
}

- (void)initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithDisplayNameLocalizationKey:ambientSupportedDataLayout:preferredTimeFontConfigurations:preferredTitleColors:luminance:preferredHomeScreenConfiguration:.cold.4()
{
  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_18C1C4000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end