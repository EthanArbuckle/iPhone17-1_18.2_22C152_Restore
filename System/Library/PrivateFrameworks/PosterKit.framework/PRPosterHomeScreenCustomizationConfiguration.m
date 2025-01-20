@interface PRPosterHomeScreenCustomizationConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isDimmed;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)iconUserInterfaceSize;
- (NSString)iconUserInterfaceStyleType;
- (PRPosterHomeScreenCustomizationConfiguration)init;
- (PRPosterHomeScreenCustomizationConfiguration)initWithBSXPCCoder:(id)a3;
- (PRPosterHomeScreenCustomizationConfiguration)initWithCoder:(id)a3;
- (PRPosterHomeScreenCustomizationConfiguration)initWithTintColorStyle:(id)a3 suggestedTintColor:(id)a4 isDimmed:(BOOL)a5 iconUserInterfaceSize:(id)a6 iconUserInterfaceStyleType:(id)a7;
- (PUIDiscreteGradientVariatedCustomStyle)tintColorStyle;
- (UIColor)suggestedTintColor;
- (id)configurationUpdatingDimmed:(BOOL)a3;
- (id)configurationUpdatingIconUserInterfaceSize:(id)a3;
- (id)configurationUpdatingIconUserInterfaceStyle:(id)a3;
- (id)configurationUpdatingSuggestedTintColor:(id)a3;
- (id)configurationUpdatingTintColorStyle:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPosterHomeScreenCustomizationConfiguration

- (PRPosterHomeScreenCustomizationConfiguration)initWithTintColorStyle:(id)a3 suggestedTintColor:(id)a4 isDimmed:(BOOL)a5 iconUserInterfaceSize:(id)a6 iconUserInterfaceStyleType:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  v14 = (__CFString *)a6;
  v15 = (__CFString *)a7;
  v26.receiver = self;
  v26.super_class = (Class)PRPosterHomeScreenCustomizationConfiguration;
  v16 = [(PRPosterHomeScreenCustomizationConfiguration *)&v26 init];
  if (v16)
  {
    v17 = (void *)[v12 copy];
    v18 = v17;
    if (v17) {
      v19 = v17;
    }
    else {
      v19 = (PUIDiscreteGradientVariatedCustomStyle *)objc_alloc_init(MEMORY[0x1E4F927C8]);
    }
    tintColorStyle = v16->_tintColorStyle;
    v16->_tintColorStyle = v19;

    uint64_t v21 = [v13 copy];
    suggestedTintColor = v16->_suggestedTintColor;
    v16->_suggestedTintColor = (UIColor *)v21;

    v16->_dimmed = a5;
    if (v14) {
      v23 = v14;
    }
    else {
      v23 = @"SMALL";
    }
    objc_storeStrong((id *)&v16->_iconUserInterfaceSize, v23);
    if (v15) {
      v24 = v15;
    }
    else {
      v24 = @"light";
    }
    objc_storeStrong((id *)&v16->_iconUserInterfaceStyleType, v24);
    v16->_hash = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v16;
}

- (PRPosterHomeScreenCustomizationConfiguration)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F927C8]);
  v4 = [(PRPosterHomeScreenCustomizationConfiguration *)self initWithTintColorStyle:v3 suggestedTintColor:0 isDimmed:kPRPosterHomeScreenCustomizationConfigurationDefaultDimmed iconUserInterfaceSize:@"SMALL" iconUserInterfaceStyleType:@"light"];

  return v4;
}

- (id)configurationUpdatingIconUserInterfaceSize:(id)a3
{
  v4 = (__CFString *)a3;
  if (([(__CFString *)v4 isEqualToString:@"LARGE"] & 1) == 0
    && ([(__CFString *)v4 isEqualToString:@"SMALL"] & 1) == 0)
  {

    v4 = @"SMALL";
  }
  v5 = (id *)[(PRPosterHomeScreenCustomizationConfiguration *)self copy];
  uint64_t v6 = [(__CFString *)v4 copy];
  v7 = (void *)v6;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = @"SMALL";
  }
  objc_storeStrong(v5 + 3, v8);

  return v5;
}

- (id)configurationUpdatingIconUserInterfaceStyle:(id)a3
{
  v4 = (__CFString *)a3;
  if (([(__CFString *)v4 isEqualToString:@"auto"] & 1) == 0
    && ([(__CFString *)v4 isEqualToString:@"dark"] & 1) == 0
    && ([(__CFString *)v4 isEqualToString:@"light"] & 1) == 0
    && ([(__CFString *)v4 isEqualToString:@"accent"] & 1) == 0)
  {

    v4 = @"light";
  }
  v5 = (id *)[(PRPosterHomeScreenCustomizationConfiguration *)self copy];
  uint64_t v6 = [(__CFString *)v4 copy];
  v7 = (void *)v6;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  else {
    v8 = @"light";
  }
  objc_storeStrong(v5 + 4, v8);

  return v5;
}

- (id)configurationUpdatingDimmed:(BOOL)a3
{
  v4 = (unsigned char *)[(PRPosterHomeScreenCustomizationConfiguration *)self copy];
  v4[16] = a3;
  return v4;
}

- (id)configurationUpdatingTintColorStyle:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(PRPosterHomeScreenCustomizationConfiguration *)self copy];
  uint64_t v6 = (void *)[v4 copy];

  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x1E4F927C8]);
  }
  v8 = (void *)v5[5];
  v5[5] = v7;

  return v5;
}

- (id)configurationUpdatingSuggestedTintColor:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(PRPosterHomeScreenCustomizationConfiguration *)self copy];
  uint64_t v6 = [v4 copy];

  id v7 = (void *)v5[6];
  v5[6] = v6;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PRPosterHomeScreenCustomizationConfiguration alloc];
  v5 = [(PRPosterHomeScreenCustomizationConfiguration *)self tintColorStyle];
  uint64_t v6 = [(PRPosterHomeScreenCustomizationConfiguration *)self suggestedTintColor];
  BOOL v7 = [(PRPosterHomeScreenCustomizationConfiguration *)self isDimmed];
  v8 = [(PRPosterHomeScreenCustomizationConfiguration *)self iconUserInterfaceSize];
  v9 = [(PRPosterHomeScreenCustomizationConfiguration *)self iconUserInterfaceStyleType];
  v10 = [(PRPosterHomeScreenCustomizationConfiguration *)v4 initWithTintColorStyle:v5 suggestedTintColor:v6 isDimmed:v7 iconUserInterfaceSize:v8 iconUserInterfaceStyleType:v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterHomeScreenCustomizationConfiguration *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0
      && BSEqualBools()
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects())
    {
      char v7 = BSEqualObjects();
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t hash = self->_hash;
  if (hash == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = [MEMORY[0x1E4F4F758] builder];
    id v5 = (id)[v4 appendObject:self->_tintColorStyle];
    id v6 = (id)[v4 appendObject:self->_suggestedTintColor];
    id v7 = (id)[v4 appendBool:self->_dimmed];
    id v8 = (id)[v4 appendObject:self->_iconUserInterfaceSize];
    id v9 = (id)[v4 appendObject:self->_iconUserInterfaceStyleType];
    uint64_t hash = [v4 hash];
    self->_uint64_t hash = hash;
  }
  return hash;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __59__PRPosterHomeScreenCustomizationConfiguration_description__block_invoke;
  v10 = &unk_1E54DAA08;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __59__PRPosterHomeScreenCustomizationConfiguration_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  tintColorStyle = self->_tintColorStyle;
  id v5 = a3;
  [v5 encodeObject:tintColorStyle forKey:@"_tintColorStyle"];
  [v5 encodeObject:self->_suggestedTintColor forKey:@"_suggestedTintColor"];
  [v5 encodeBool:self->_dimmed forKey:@"_dimmed"];
  [v5 encodeObject:self->_iconUserInterfaceSize forKey:@"_iconUserInterfaceSize"];
  [v5 encodeObject:self->_iconUserInterfaceStyleType forKey:@"_iconUserInterfaceStyleType"];
}

- (PRPosterHomeScreenCustomizationConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"_tintColorStyle"];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F927C8]);
  }
  id v9 = v8;

  v10 = self;
  v11 = [v4 decodeObjectOfClass:v10 forKey:@"_suggestedTintColor"];

  uint64_t v12 = [v4 decodeBoolForKey:@"_dimmed"];
  id v13 = self;
  uint64_t v14 = [v4 decodeObjectOfClass:v13 forKey:@"_iconUserInterfaceSize"];
  v15 = (void *)v14;
  v16 = @"SMALL";
  if (v14) {
    v16 = (__CFString *)v14;
  }
  v17 = v16;

  v18 = self;
  uint64_t v19 = [v4 decodeObjectOfClass:v18 forKey:@"_iconUserInterfaceStyleType"];
  v20 = (void *)v19;
  uint64_t v21 = @"light";
  if (v19) {
    uint64_t v21 = (__CFString *)v19;
  }
  v22 = v21;

  v23 = [(PRPosterHomeScreenCustomizationConfiguration *)self initWithTintColorStyle:v9 suggestedTintColor:v11 isDimmed:v12 iconUserInterfaceSize:v17 iconUserInterfaceStyleType:v22];
  return v23;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  tintColorStyle = self->_tintColorStyle;
  id v5 = a3;
  [v5 encodeObject:tintColorStyle forKey:@"_tintColorStyle"];
  [v5 encodeObject:self->_suggestedTintColor forKey:@"_suggestedTintColor"];
  [v5 encodeBool:self->_dimmed forKey:@"_dimmed"];
  [v5 encodeObject:self->_iconUserInterfaceSize forKey:@"_iconUserInterfaceSize"];
  [v5 encodeObject:self->_iconUserInterfaceStyleType forKey:@"_iconUserInterfaceStyleType"];
}

- (PRPosterHomeScreenCustomizationConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"_tintColorStyle"];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F927C8]);
  }
  id v9 = v8;

  v10 = self;
  v11 = [v4 decodeObjectOfClass:v10 forKey:@"_suggestedTintColor"];

  uint64_t v12 = [v4 decodeBoolForKey:@"_dimmed"];
  id v13 = self;
  uint64_t v14 = [v4 decodeObjectOfClass:v13 forKey:@"_iconUserInterfaceSize"];
  v15 = (void *)v14;
  v16 = @"SMALL";
  if (v14) {
    v16 = (__CFString *)v14;
  }
  v17 = v16;

  v18 = self;
  uint64_t v19 = [v4 decodeObjectOfClass:v18 forKey:@"_iconUserInterfaceStyleType"];
  v20 = (void *)v19;
  uint64_t v21 = @"light";
  if (v19) {
    uint64_t v21 = (__CFString *)v19;
  }
  v22 = v21;

  v23 = [(PRPosterHomeScreenCustomizationConfiguration *)self initWithTintColorStyle:v9 suggestedTintColor:v11 isDimmed:v12 iconUserInterfaceSize:v17 iconUserInterfaceStyleType:v22];
  return v23;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v9 = a3;
  id v4 = (id)[v9 appendObject:self->_tintColorStyle withName:@"_tintColorStyle"];
  id v5 = (id)[v9 appendObject:self->_suggestedTintColor withName:@"_suggestedTintColor"];
  id v6 = (id)[v9 appendBool:self->_dimmed withName:@"_dimmed"];
  id v7 = (id)[v9 appendObject:self->_iconUserInterfaceSize withName:@"_iconUserInterfaceSize"];
  id v8 = (id)[v9 appendObject:self->_iconUserInterfaceStyleType withName:@"_iconUserInterfaceStyleType"];
}

- (NSString)iconUserInterfaceSize
{
  return self->_iconUserInterfaceSize;
}

- (NSString)iconUserInterfaceStyleType
{
  return self->_iconUserInterfaceStyleType;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (PUIDiscreteGradientVariatedCustomStyle)tintColorStyle
{
  return self->_tintColorStyle;
}

- (UIColor)suggestedTintColor
{
  return self->_suggestedTintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedTintColor, 0);
  objc_storeStrong((id *)&self->_tintColorStyle, 0);
  objc_storeStrong((id *)&self->_iconUserInterfaceStyleType, 0);
  objc_storeStrong((id *)&self->_iconUserInterfaceSize, 0);
}

@end