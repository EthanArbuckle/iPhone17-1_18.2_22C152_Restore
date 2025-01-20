@interface PRPosterHomeScreenConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (PRPosterHomeScreenConfiguration)allocWithZone:(_NSZone *)a3;
+ (id)decodeObjectWithJSON:(id)a3;
+ (id)defaultHomeScreenConfigurationForProvider:(id)a3 role:(id)a4;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (NSString)attributeType;
- (NSString)description;
- (PRPosterHomeScreenAppearance)selectedAppearance;
- (PRPosterHomeScreenConfiguration)init;
- (PRPosterHomeScreenConfiguration)initWithBSXPCCoder:(id)a3;
- (PRPosterHomeScreenConfiguration)initWithCoder:(id)a3;
- (PRPosterHomeScreenConfiguration)initWithHomeScreenConfiguration:(id)a3;
- (PRPosterHomeScreenConfiguration)initWithSelectedAppearanceType:(unint64_t)a3 lockPosterAppearance:(id)a4 solidColorAppearance:(id)a5 gradientAppearance:(id)a6 homePosterAppearance:(id)a7 customizationConfiguration:(id)a8;
- (id)configurationApplyingColorPickerConfigurationsFromConfiguration:(id)a3;
- (id)encodeJSON;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPosterHomeScreenConfiguration

+ (id)defaultHomeScreenConfigurationForProvider:(id)a3 role:(id)a4
{
  id v5 = a3;
  if (PFCurrentDeviceClass() == 1)
  {
    uint64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"com.apple.EmojiPoster.EmojiPosterExtension"])
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = [v5 isEqualToString:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"];
  }
  v7 = -[PRPosterLockPosterHomeScreenAppearance initWithLegibilityBlurEnabled:allowsModifyingLegibilityBlur:]([PRPosterLockPosterHomeScreenAppearance alloc], "initWithLegibilityBlurEnabled:allowsModifyingLegibilityBlur:", v6, [v5 isEqualToString:@"com.apple.GradientPoster.GradientPosterExtension"] ^ 1);
  id v8 = objc_alloc((Class)a1);
  v9 = objc_alloc_init(PRPosterSolidColorHomeScreenAppearance);
  v10 = objc_alloc_init(PRPosterGradientHomeScreenAppearance);
  v11 = objc_alloc_init(PRPosterHomePosterHomeScreenAppearance);
  v12 = objc_alloc_init(PRPosterHomeScreenCustomizationConfiguration);
  v13 = (void *)[v8 initWithSelectedAppearanceType:0 lockPosterAppearance:v7 solidColorAppearance:v9 gradientAppearance:v10 homePosterAppearance:v11 customizationConfiguration:v12];

  return v13;
}

+ (PRPosterHomeScreenConfiguration)allocWithZone:(_NSZone *)a3
{
  self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
  {
    return (PRPosterHomeScreenConfiguration *)+[PRPosterHomeScreenConfiguration allocWithZone:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___PRPosterHomeScreenConfiguration;
    return (PRPosterHomeScreenConfiguration *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

- (PRPosterHomeScreenConfiguration)init
{
  v3 = objc_alloc_init(PRPosterLockPosterHomeScreenAppearance);
  v4 = objc_alloc_init(PRPosterSolidColorHomeScreenAppearance);
  id v5 = objc_alloc_init(PRPosterGradientHomeScreenAppearance);
  uint64_t v6 = objc_alloc_init(PRPosterHomePosterHomeScreenAppearance);
  objc_super v7 = objc_alloc_init(PRPosterHomeScreenCustomizationConfiguration);
  id v8 = [(PRPosterHomeScreenConfiguration *)self initWithSelectedAppearanceType:0 lockPosterAppearance:v3 solidColorAppearance:v4 gradientAppearance:v5 homePosterAppearance:v6 customizationConfiguration:v7];

  return v8;
}

- (PRPosterHomeScreenConfiguration)initWithSelectedAppearanceType:(unint64_t)a3 lockPosterAppearance:(id)a4 solidColorAppearance:(id)a5 gradientAppearance:(id)a6 homePosterAppearance:(id)a7 customizationConfiguration:(id)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PRPosterHomeScreenConfiguration.m", 89, @"Invalid parameter not satisfying: %@", @"lockPosterAppearance != nil" object file lineNumber description];

    if (v16)
    {
LABEL_3:
      if (v17) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"PRPosterHomeScreenConfiguration.m", 90, @"Invalid parameter not satisfying: %@", @"solidColorAppearance != nil" object file lineNumber description];

  if (v17)
  {
LABEL_4:
    if (v18) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"PRPosterHomeScreenConfiguration.m", 91, @"Invalid parameter not satisfying: %@", @"gradientAppearance != nil" object file lineNumber description];

  if (v18)
  {
LABEL_5:
    if (v19) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_14:
  v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"PRPosterHomeScreenConfiguration.m", 92, @"Invalid parameter not satisfying: %@", @"homePosterAppearance != nil" object file lineNumber description];

  if (!v19) {
LABEL_6:
  }
    id v19 = (id)objc_opt_new();
LABEL_7:
  v20 = self;
  int v21 = [(PRPosterHomeScreenConfiguration *)self isMemberOfClass:v20];

  if (v21)
  {
    v22 = [[PRImmutableHomeScreenConfiguration alloc] initWithSelectedAppearanceType:a3 lockPosterAppearance:v15 solidColorAppearance:v16 gradientAppearance:v17 homePosterAppearance:v18 customizationConfiguration:v19];
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)PRPosterHomeScreenConfiguration;
    v22 = [(PRPosterHomeScreenConfiguration *)&v29 init];
    self = &v22->super;
  }
  p_super = &v22->super;

  return p_super;
}

- (PRPosterHomeScreenConfiguration)initWithHomeScreenConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 selectedAppearanceType];
  uint64_t v6 = [v4 lockPosterAppearance];
  objc_super v7 = [v4 solidColorAppearance];
  id v8 = [v4 gradientAppearance];
  v9 = [v4 homePosterAppearance];
  v10 = [v4 customizationConfiguration];

  v11 = [(PRPosterHomeScreenConfiguration *)self initWithSelectedAppearanceType:v5 lockPosterAppearance:v6 solidColorAppearance:v7 gradientAppearance:v8 homePosterAppearance:v9 customizationConfiguration:v10];
  return v11;
}

- (PRPosterHomeScreenAppearance)selectedAppearance
{
  switch([(PRPosterHomeScreenConfiguration *)self selectedAppearanceType])
  {
    case 0:
      v3 = [(PRPosterHomeScreenConfiguration *)self lockPosterAppearance];
      break;
    case 1:
      v3 = [(PRPosterHomeScreenConfiguration *)self solidColorAppearance];
      break;
    case 2:
      v3 = [(PRPosterHomeScreenConfiguration *)self gradientAppearance];
      break;
    case 3:
      v3 = [(PRPosterHomeScreenConfiguration *)self homePosterAppearance];
      break;
    default:
      v3 = 0;
      break;
  }
  return (PRPosterHomeScreenAppearance *)v3;
}

- (id)configurationApplyingColorPickerConfigurationsFromConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(PRPosterHomeScreenConfiguration *)self mutableCopy];
  uint64_t v6 = [v4 solidColorAppearance];
  objc_super v7 = [(PRPosterHomeScreenConfiguration *)self solidColorAppearance];
  id v8 = [PRPosterSolidColorHomeScreenAppearance alloc];
  v9 = [v7 color];
  v10 = [v6 colorPickerConfiguration];
  v11 = [(PRPosterSolidColorHomeScreenAppearance *)v8 initWithColor:v9 colorPickerConfiguration:v10];

  [v5 setSolidColorAppearance:v11];
  v12 = [v4 gradientAppearance];
  v13 = [(PRPosterHomeScreenConfiguration *)self gradientAppearance];
  v14 = [PRPosterGradientHomeScreenAppearance alloc];
  id v15 = [v13 color];
  id v16 = [v12 colorPickerConfiguration];
  id v17 = [(PRPosterGradientHomeScreenAppearance *)v14 initWithColor:v15 colorPickerConfiguration:v16];

  [v5 setGradientAppearance:v17];
  id v18 = [v4 customizationConfiguration];

  if (v18)
  {
    [v5 setCustomizationConfiguration:v18];
  }
  else
  {
    id v19 = objc_opt_new();
    [v5 setCustomizationConfiguration:v19];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterHomeScreenConfiguration *)a3;
  if (self == v4)
  {
    char v23 = 1;
  }
  else
  {
    uint64_t v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      objc_super v7 = v4;
      uint64_t v8 = [(PRPosterHomeScreenConfiguration *)self selectedAppearanceType];
      if (v8 != [(PRPosterHomeScreenConfiguration *)v7 selectedAppearanceType]) {
        goto LABEL_11;
      }
      v9 = [(PRPosterHomeScreenConfiguration *)self lockPosterAppearance];
      v10 = [(PRPosterHomeScreenConfiguration *)v7 lockPosterAppearance];
      int v11 = BSEqualObjects();

      if (!v11) {
        goto LABEL_11;
      }
      v12 = [(PRPosterHomeScreenConfiguration *)self solidColorAppearance];
      v13 = [(PRPosterHomeScreenConfiguration *)v7 solidColorAppearance];
      int v14 = BSEqualObjects();

      if (!v14) {
        goto LABEL_11;
      }
      id v15 = [(PRPosterHomeScreenConfiguration *)self gradientAppearance];
      id v16 = [(PRPosterHomeScreenConfiguration *)v7 gradientAppearance];
      int v17 = BSEqualObjects();

      if (!v17) {
        goto LABEL_11;
      }
      id v18 = [(PRPosterHomeScreenConfiguration *)self homePosterAppearance];
      id v19 = [(PRPosterHomeScreenConfiguration *)v7 homePosterAppearance];
      int v20 = BSEqualObjects();

      if (v20)
      {
        int v21 = [(PRPosterHomeScreenConfiguration *)self customizationConfiguration];
        v22 = [(PRPosterHomeScreenConfiguration *)v7 customizationConfiguration];
        char v23 = BSEqualObjects();
      }
      else
      {
LABEL_11:
        char v23 = 0;
      }
    }
    else
    {
      char v23 = 0;
    }
  }

  return v23;
}

- (unint64_t)hash
{
  uint64_t v3 = [(PRPosterHomeScreenConfiguration *)self selectedAppearanceType];
  id v4 = [(PRPosterHomeScreenConfiguration *)self lockPosterAppearance];
  uint64_t v5 = [v4 hash] ^ v3;
  uint64_t v6 = [(PRPosterHomeScreenConfiguration *)self solidColorAppearance];
  uint64_t v7 = [v6 hash];
  uint64_t v8 = [(PRPosterHomeScreenConfiguration *)self gradientAppearance];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  v10 = [(PRPosterHomeScreenConfiguration *)self homePosterAppearance];
  uint64_t v11 = [v10 hash];
  v12 = [(PRPosterHomeScreenConfiguration *)self customizationConfiguration];
  unint64_t v13 = v9 ^ v11 ^ [v12 hash];

  return v13;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __46__PRPosterHomeScreenConfiguration_description__block_invoke;
  v10 = &unk_1E54DAA08;
  uint64_t v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  uint64_t v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __46__PRPosterHomeScreenConfiguration_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[PRPosterHomeScreenConfiguration allocWithZone:a3];
  return [(PRPosterHomeScreenConfiguration *)v4 initWithHomeScreenConfiguration:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)self;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[PRPosterHomeScreenConfiguration selectedAppearanceType](self, "selectedAppearanceType"), @"selectedAppearanceType");
  uint64_t v5 = [(PRPosterHomeScreenConfiguration *)self lockPosterAppearance];
  [v4 encodeObject:v5 forKey:@"lockPosterAppearance"];

  uint64_t v6 = [(PRPosterHomeScreenConfiguration *)self solidColorAppearance];
  [v4 encodeObject:v6 forKey:@"solidColorAppearance"];

  uint64_t v7 = [(PRPosterHomeScreenConfiguration *)self gradientAppearance];
  [v4 encodeObject:v7 forKey:@"gradientAppearance"];

  uint64_t v8 = [(PRPosterHomeScreenConfiguration *)self homePosterAppearance];
  [v4 encodeObject:v8 forKey:@"homePosterAppearance"];

  id v9 = [(PRPosterHomeScreenConfiguration *)self customizationConfiguration];
  [v4 encodeObject:v9 forKey:@"customizationConfiguration"];
}

- (PRPosterHomeScreenConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 decodeIntegerForKey:@"selectedAppearanceType"];
  uint64_t v5 = self;
  uint64_t v6 = [v3 decodeObjectOfClass:v5 forKey:@"lockPosterAppearance"];

  uint64_t v7 = self;
  uint64_t v8 = [v3 decodeObjectOfClass:v7 forKey:@"solidColorAppearance"];

  id v9 = self;
  v10 = [v3 decodeObjectOfClass:v9 forKey:@"gradientAppearance"];

  uint64_t v11 = self;
  id v12 = [v3 decodeObjectOfClass:v11 forKey:@"homePosterAppearance"];

  unint64_t v13 = self;
  int v14 = [v3 decodeObjectOfClass:v13 forKey:@"customizationConfiguration"];

  if (v6)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = objc_alloc_init(PRPosterLockPosterHomeScreenAppearance);
    if (v8)
    {
LABEL_3:
      if (v10) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  uint64_t v8 = objc_alloc_init(PRPosterSolidColorHomeScreenAppearance);
  if (v10)
  {
LABEL_4:
    if (v12) {
      goto LABEL_5;
    }
LABEL_13:
    id v12 = objc_alloc_init(PRPosterHomePosterHomeScreenAppearance);
    if (v14) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_12:
  v10 = objc_alloc_init(PRPosterGradientHomeScreenAppearance);
  if (!v12) {
    goto LABEL_13;
  }
LABEL_5:
  if (v14) {
    goto LABEL_6;
  }
LABEL_14:
  int v14 = objc_alloc_init(PRPosterHomeScreenCustomizationConfiguration);
LABEL_6:
  if (v4 >= 4) {
    unint64_t v15 = 0;
  }
  else {
    unint64_t v15 = v4;
  }
  id v16 = [(PRPosterHomeScreenConfiguration *)self initWithSelectedAppearanceType:v15 lockPosterAppearance:v6 solidColorAppearance:v8 gradientAppearance:v10 homePosterAppearance:v12 customizationConfiguration:v14];

  return v16;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeUInt64:forKey:", -[PRPosterHomeScreenConfiguration selectedAppearanceType](self, "selectedAppearanceType"), @"selectedAppearanceType");
  uint64_t v5 = [(PRPosterHomeScreenConfiguration *)self lockPosterAppearance];
  [v4 encodeObject:v5 forKey:@"lockPosterAppearance"];

  uint64_t v6 = [(PRPosterHomeScreenConfiguration *)self solidColorAppearance];
  [v4 encodeObject:v6 forKey:@"solidColorAppearance"];

  uint64_t v7 = [(PRPosterHomeScreenConfiguration *)self gradientAppearance];
  [v4 encodeObject:v7 forKey:@"gradientAppearance"];

  uint64_t v8 = [(PRPosterHomeScreenConfiguration *)self homePosterAppearance];
  [v4 encodeObject:v8 forKey:@"homePosterAppearance"];

  id v9 = [(PRPosterHomeScreenConfiguration *)self customizationConfiguration];
  [v4 encodeObject:v9 forKey:@"customizationConfiguration"];
}

- (PRPosterHomeScreenConfiguration)initWithBSXPCCoder:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 decodeUInt64ForKey:@"selectedAppearanceType"];
  uint64_t v5 = self;
  uint64_t v6 = [v3 decodeObjectOfClass:v5 forKey:@"lockPosterAppearance"];

  uint64_t v7 = self;
  uint64_t v8 = [v3 decodeObjectOfClass:v7 forKey:@"solidColorAppearance"];

  id v9 = self;
  v10 = [v3 decodeObjectOfClass:v9 forKey:@"gradientAppearance"];

  uint64_t v11 = self;
  id v12 = [v3 decodeObjectOfClass:v11 forKey:@"homePosterAppearance"];

  unint64_t v13 = self;
  int v14 = [v3 decodeObjectOfClass:v13 forKey:@"customizationConfiguration"];

  if (v6)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v6 = objc_alloc_init(PRPosterLockPosterHomeScreenAppearance);
    if (v8)
    {
LABEL_3:
      if (v10) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  uint64_t v8 = objc_alloc_init(PRPosterSolidColorHomeScreenAppearance);
  if (v10)
  {
LABEL_4:
    if (v12) {
      goto LABEL_5;
    }
LABEL_13:
    id v12 = objc_alloc_init(PRPosterHomePosterHomeScreenAppearance);
    if (v14) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_12:
  v10 = objc_alloc_init(PRPosterGradientHomeScreenAppearance);
  if (!v12) {
    goto LABEL_13;
  }
LABEL_5:
  if (v14) {
    goto LABEL_6;
  }
LABEL_14:
  int v14 = objc_alloc_init(PRPosterHomeScreenCustomizationConfiguration);
LABEL_6:
  if (v4 >= 4) {
    unint64_t v15 = 0;
  }
  else {
    unint64_t v15 = v4;
  }
  id v16 = [(PRPosterHomeScreenConfiguration *)self initWithSelectedAppearanceType:v15 lockPosterAppearance:v6 solidColorAppearance:v8 gradientAppearance:v10 homePosterAppearance:v12 customizationConfiguration:v14];

  return v16;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v16 = a3;
  unint64_t v4 = [(PRPosterHomeScreenConfiguration *)self selectedAppearanceType];
  if (v4 > 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = off_1E54DCF50[v4];
  }
  [v16 appendString:v5 withName:@"selectedAppearanceType"];
  uint64_t v6 = [(PRPosterHomeScreenConfiguration *)self lockPosterAppearance];
  id v7 = (id)[v16 appendObject:v6 withName:@"lockPosterAppearance"];

  uint64_t v8 = [(PRPosterHomeScreenConfiguration *)self solidColorAppearance];
  id v9 = (id)[v16 appendObject:v8 withName:@"solidColorAppearance"];

  v10 = [(PRPosterHomeScreenConfiguration *)self gradientAppearance];
  id v11 = (id)[v16 appendObject:v10 withName:@"gradientAppearance"];

  id v12 = [(PRPosterHomeScreenConfiguration *)self homePosterAppearance];
  id v13 = (id)[v16 appendObject:v12 withName:@"homePosterAppearance"];

  int v14 = [(PRPosterHomeScreenConfiguration *)self customizationConfiguration];
  id v15 = (id)[v16 appendObject:v14 withName:@"customizationConfiguration" skipIfNil:1];
}

- (NSString)attributeType
{
  return (NSString *)@"PRPosterRoleAttributeTypeHomeScreenConfiguration";
}

- (id)encodeJSON
{
  return sub_18C2ABF40(self, (uint64_t)a2, PRPosterHomeScreenConfiguration.encodeJSON());
}

+ (id)decodeObjectWithJSON:(id)a3
{
  return sub_18C2ACD48((uint64_t)a1, (uint64_t)a2, a3, (uint64_t (*)(uint64_t, unint64_t))static PRPosterHomeScreenConfiguration.decodeObject(withJSON:));
}

@end