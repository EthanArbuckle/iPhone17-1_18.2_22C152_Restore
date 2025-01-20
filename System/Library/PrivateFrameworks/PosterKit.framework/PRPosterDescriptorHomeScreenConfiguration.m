@interface PRPosterDescriptorHomeScreenConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)defaultHomeScreenConfigurationForProvider:(id)a3 role:(id)a4;
- (BOOL)allowsModifyingLegibilityBlur;
- (BOOL)isEqual:(id)a3;
- (NSArray)preferredGradientColors;
- (NSArray)preferredSolidColors;
- (NSString)description;
- (PRPosterDescriptorHomeScreenConfiguration)initWithBSXPCCoder:(id)a3;
- (PRPosterDescriptorHomeScreenConfiguration)initWithCoder:(id)a3;
- (PRPosterDescriptorHomeScreenConfiguration)initWithPreferredSolidColors:(id)a3;
- (PRPosterDescriptorHomeScreenConfiguration)initWithPreferredSolidColors:(id)a3 preferredGradientColors:(id)a4;
- (PRPosterDescriptorHomeScreenConfiguration)initWithPreferredStyle:(unint64_t)a3;
- (PRPosterDescriptorHomeScreenConfiguration)initWithPreferredStyle:(unint64_t)a3 allowsModifyingLegibilityBlur:(BOOL)a4 preferredSolidColors:(id)a5 preferredGradientColors:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)preferredStyle;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsModifyingLegibilityBlur:(BOOL)a3;
- (void)setPreferredGradientColors:(id)a3;
- (void)setPreferredSolidColors:(id)a3;
- (void)setPreferredStyle:(unint64_t)a3;
@end

@implementation PRPosterDescriptorHomeScreenConfiguration

+ (id)defaultHomeScreenConfigurationForProvider:(id)a3 role:(id)a4
{
  id v4 = a3;
  if (PFCurrentDeviceClass() == 1)
  {
    uint64_t v5 = 0;
  }
  else if ([v4 isEqualToString:@"com.apple.EmojiPoster.EmojiPosterExtension"])
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = [v4 isEqualToString:@"com.apple.PhotosUIPrivate.PhotosPosterProvider"];
  }
  v6 = -[PRPosterDescriptorHomeScreenConfiguration initWithPreferredStyle:allowsModifyingLegibilityBlur:preferredSolidColors:preferredGradientColors:]([PRPosterDescriptorHomeScreenConfiguration alloc], "initWithPreferredStyle:allowsModifyingLegibilityBlur:preferredSolidColors:preferredGradientColors:", v5, [v4 isEqualToString:@"com.apple.GradientPoster.GradientPosterExtension"] ^ 1, 0, 0);

  return v6;
}

- (PRPosterDescriptorHomeScreenConfiguration)initWithPreferredSolidColors:(id)a3
{
  return [(PRPosterDescriptorHomeScreenConfiguration *)self initWithPreferredSolidColors:a3 preferredGradientColors:a3];
}

- (PRPosterDescriptorHomeScreenConfiguration)initWithPreferredSolidColors:(id)a3 preferredGradientColors:(id)a4
{
  return [(PRPosterDescriptorHomeScreenConfiguration *)self initWithPreferredStyle:0 allowsModifyingLegibilityBlur:1 preferredSolidColors:a3 preferredGradientColors:a4];
}

- (PRPosterDescriptorHomeScreenConfiguration)initWithPreferredStyle:(unint64_t)a3
{
  return [(PRPosterDescriptorHomeScreenConfiguration *)self initWithPreferredStyle:a3 allowsModifyingLegibilityBlur:1 preferredSolidColors:0 preferredGradientColors:0];
}

- (PRPosterDescriptorHomeScreenConfiguration)initWithPreferredStyle:(unint64_t)a3 allowsModifyingLegibilityBlur:(BOOL)a4 preferredSolidColors:(id)a5 preferredGradientColors:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PRPosterDescriptorHomeScreenConfiguration;
  v12 = [(PRPosterDescriptorHomeScreenConfiguration *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_preferredStyle = a3;
    v12->_allowsModifyingLegibilityBlur = a4;
    uint64_t v14 = [v10 copy];
    preferredSolidColors = v13->_preferredSolidColors;
    v13->_preferredSolidColors = (NSArray *)v14;

    uint64_t v16 = [v11 copy];
    preferredGradientColors = v13->_preferredGradientColors;
    v13->_preferredGradientColors = (NSArray *)v16;
  }
  return v13;
}

- (PRPosterDescriptorHomeScreenConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredStyle"];
  v6 = v5;
  if (v5) {
    uint64_t v7 = [v5 unsignedIntegerValue];
  }
  else {
    uint64_t v7 = 0;
  }
  if ([v4 containsValueForKey:@"allowsModifyingLegibilityBlur"]) {
    uint64_t v8 = [v4 decodeBoolForKey:@"allowsModifyingLegibilityBlur"];
  }
  else {
    uint64_t v8 = 1;
  }
  v9 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"preferredSolidColors"];
  id v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"preferredGradientColors"];
  id v11 = [(PRPosterDescriptorHomeScreenConfiguration *)self initWithPreferredStyle:v7 allowsModifyingLegibilityBlur:v8 preferredSolidColors:v9 preferredGradientColors:v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[PRPosterDescriptorHomeScreenConfiguration preferredStyle](self, "preferredStyle"));
  [v5 encodeObject:v6 forKey:@"preferredStyle"];

  objc_msgSend(v5, "encodeBool:forKey:", -[PRPosterDescriptorHomeScreenConfiguration allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur"), @"allowsModifyingLegibilityBlur");
  uint64_t v7 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredSolidColors];
  [v5 encodeObject:v7 forKey:@"preferredSolidColors"];

  id v8 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredGradientColors];
  [v5 encodeObject:v8 forKey:@"preferredGradientColors"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PRPosterDescriptorHomeScreenConfiguration alloc];
  unint64_t v5 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredStyle];
  BOOL v6 = [(PRPosterDescriptorHomeScreenConfiguration *)self allowsModifyingLegibilityBlur];
  uint64_t v7 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredSolidColors];
  id v8 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredGradientColors];
  v9 = [(PRPosterDescriptorHomeScreenConfiguration *)v4 initWithPreferredStyle:v5 allowsModifyingLegibilityBlur:v6 preferredSolidColors:v7 preferredGradientColors:v8];

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [PRMutablePosterDescriptorHomeScreenConfiguration alloc];
  unint64_t v5 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredStyle];
  BOOL v6 = [(PRPosterDescriptorHomeScreenConfiguration *)self allowsModifyingLegibilityBlur];
  uint64_t v7 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredSolidColors];
  id v8 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredGradientColors];
  v9 = [(PRPosterDescriptorHomeScreenConfiguration *)v4 initWithPreferredStyle:v5 allowsModifyingLegibilityBlur:v6 preferredSolidColors:v7 preferredGradientColors:v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRPosterDescriptorHomeScreenConfiguration *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    char v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = v5;
    unint64_t v7 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredStyle];
    if (v7 != [(PRPosterDescriptorHomeScreenConfiguration *)v6 preferredStyle]) {
      goto LABEL_10;
    }
    BOOL v8 = [(PRPosterDescriptorHomeScreenConfiguration *)self allowsModifyingLegibilityBlur];
    if (v8 != [(PRPosterDescriptorHomeScreenConfiguration *)v6 allowsModifyingLegibilityBlur])goto LABEL_10; {
    v9 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredSolidColors];
    }
    id v10 = [(PRPosterDescriptorHomeScreenConfiguration *)v6 preferredSolidColors];
    int v11 = BSEqualObjects();

    if (v11)
    {
      v12 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredGradientColors];
      v13 = [(PRPosterDescriptorHomeScreenConfiguration *)v6 preferredGradientColors];
      char v14 = BSEqualObjects();
    }
    else
    {
LABEL_10:
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
  v3 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredSolidColors];
  id v4 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredGradientColors];
  unint64_t v5 = [MEMORY[0x1E4F4F758] builder];
  id v6 = (id)objc_msgSend(v5, "appendUnsignedInteger:", -[PRPosterDescriptorHomeScreenConfiguration preferredStyle](self, "preferredStyle"));
  id v7 = (id)objc_msgSend(v5, "appendBool:", -[PRPosterDescriptorHomeScreenConfiguration allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur"));
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __49__PRPosterDescriptorHomeScreenConfiguration_hash__block_invoke;
  v17[3] = &unk_1E54DAF90;
  id v8 = v5;
  id v18 = v8;
  [v3 enumerateObjectsUsingBlock:v17];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  char v14 = __49__PRPosterDescriptorHomeScreenConfiguration_hash__block_invoke_2;
  v15 = &unk_1E54DAF90;
  id v16 = v8;
  id v9 = v8;
  [v4 enumerateObjectsUsingBlock:&v12];
  unint64_t v10 = objc_msgSend(v9, "hash", v12, v13, v14, v15);

  return v10;
}

id __49__PRPosterDescriptorHomeScreenConfiguration_hash__block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) appendObject:a2];
}

id __49__PRPosterDescriptorHomeScreenConfiguration_hash__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) appendObject:a2];
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __56__PRPosterDescriptorHomeScreenConfiguration_description__block_invoke;
  unint64_t v10 = &unk_1E54DAA08;
  int v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  unint64_t v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __56__PRPosterDescriptorHomeScreenConfiguration_description__block_invoke(uint64_t a1)
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

- (PRPosterDescriptorHomeScreenConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredStyle"];
  id v6 = v5;
  if (v5) {
    uint64_t v7 = [v5 unsignedIntegerValue];
  }
  else {
    uint64_t v7 = 0;
  }
  if ([v4 containsValueForKey:@"allowsModifyingLegibilityBlur"]) {
    uint64_t v8 = [v4 decodeBoolForKey:@"allowsModifyingLegibilityBlur"];
  }
  else {
    uint64_t v8 = 1;
  }
  uint64_t v9 = objc_opt_class();
  unint64_t v10 = [v4 decodeCollectionOfClass:v9 containingClass:objc_opt_class() forKey:@"preferredSolidColors"];
  uint64_t v11 = objc_opt_class();
  id v12 = [v4 decodeCollectionOfClass:v11 containingClass:objc_opt_class() forKey:@"preferredGradientColors"];
  uint64_t v13 = [(PRPosterDescriptorHomeScreenConfiguration *)self initWithPreferredStyle:v7 allowsModifyingLegibilityBlur:v8 preferredSolidColors:v10 preferredGradientColors:v12];

  return v13;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[PRPosterDescriptorHomeScreenConfiguration preferredStyle](self, "preferredStyle"));
  [v5 encodeObject:v6 forKey:@"preferredStyle"];

  objc_msgSend(v5, "encodeBool:forKey:", -[PRPosterDescriptorHomeScreenConfiguration allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur"), @"allowsModifyingLegibilityBlur");
  uint64_t v7 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredSolidColors];
  [v5 encodeObject:v7 forKey:@"preferredSolidColors"];

  id v8 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredGradientColors];
  [v5 encodeObject:v8 forKey:@"preferredGradientColors"];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v11 = a3;
  unint64_t v4 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredStyle];
  if (v4 > 3) {
    id v5 = 0;
  }
  else {
    id v5 = off_1E54DCE38[v4];
  }
  [v11 appendString:v5 withName:@"preferredStyle"];
  id v6 = (id)objc_msgSend(v11, "appendBool:withName:", -[PRPosterDescriptorHomeScreenConfiguration allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur"), @"allowsModifyingLegibilityBlur");
  uint64_t v7 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredSolidColors];
  id v8 = (id)[v11 appendObject:v7 withName:@"preferredSolidColors"];

  uint64_t v9 = [(PRPosterDescriptorHomeScreenConfiguration *)self preferredGradientColors];
  id v10 = (id)[v11 appendObject:v9 withName:@"preferredGradientColors"];
}

- (BOOL)allowsModifyingLegibilityBlur
{
  return self->_allowsModifyingLegibilityBlur;
}

- (void)setAllowsModifyingLegibilityBlur:(BOOL)a3
{
  self->_allowsModifyingLegibilityBlur = a3;
}

- (unint64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (void)setPreferredStyle:(unint64_t)a3
{
  self->_preferredStyle = a3;
}

- (NSArray)preferredSolidColors
{
  return self->_preferredSolidColors;
}

- (void)setPreferredSolidColors:(id)a3
{
}

- (NSArray)preferredGradientColors
{
  return self->_preferredGradientColors;
}

- (void)setPreferredGradientColors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredGradientColors, 0);
  objc_storeStrong((id *)&self->_preferredSolidColors, 0);
}

@end