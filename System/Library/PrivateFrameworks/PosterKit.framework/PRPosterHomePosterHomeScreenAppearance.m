@interface PRPosterHomePosterHomeScreenAppearance
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsModifyingLegibilityBlur;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLegibilityBlurEnabled;
- (PRPosterHomePosterHomeScreenAppearance)init;
- (PRPosterHomePosterHomeScreenAppearance)initWithBSXPCCoder:(id)a3;
- (PRPosterHomePosterHomeScreenAppearance)initWithCoder:(id)a3;
- (PRPosterHomePosterHomeScreenAppearance)initWithLegibilityBlurEnabled:(BOOL)a3 allowsModifyingLegibilityBlur:(BOOL)a4;
- (id)copyByTogglingLegibilityBlurEnabled;
- (id)copyWithLegibilityBlurEnabled:(BOOL)a3;
- (id)description;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PRPosterHomePosterHomeScreenAppearance

- (PRPosterHomePosterHomeScreenAppearance)initWithLegibilityBlurEnabled:(BOOL)a3 allowsModifyingLegibilityBlur:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PRPosterHomePosterHomeScreenAppearance;
  result = [(PRPosterHomePosterHomeScreenAppearance *)&v7 init];
  if (result)
  {
    result->_legibilityBlurEnabled = a3;
    result->_allowsModifyingLegibilityBlur = a4;
  }
  return result;
}

- (PRPosterHomePosterHomeScreenAppearance)init
{
  return [(PRPosterHomePosterHomeScreenAppearance *)self initWithLegibilityBlurEnabled:0 allowsModifyingLegibilityBlur:1];
}

- (id)copyWithLegibilityBlurEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  BOOL v6 = [(PRPosterHomePosterHomeScreenAppearance *)self allowsModifyingLegibilityBlur];
  return (id)[v5 initWithLegibilityBlurEnabled:v3 allowsModifyingLegibilityBlur:v6];
}

- (id)copyByTogglingLegibilityBlurEnabled
{
  uint64_t v3 = [(PRPosterHomePosterHomeScreenAppearance *)self isLegibilityBlurEnabled] ^ 1;
  return [(PRPosterHomePosterHomeScreenAppearance *)self copyWithLegibilityBlurEnabled:v3];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PRPosterHomePosterHomeScreenAppearance *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0 && BSEqualBools()) {
      char v7 = BSEqualBools();
    }
    else {
      char v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v2 = 1;
  if (self->_legibilityBlurEnabled) {
    uint64_t v2 = 2;
  }
  uint64_t v3 = 20;
  if (!self->_allowsModifyingLegibilityBlur) {
    uint64_t v3 = 10;
  }
  return v3 ^ v2;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __53__PRPosterHomePosterHomeScreenAppearance_description__block_invoke;
  v10 = &unk_1E54DAA08;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return v5;
}

uint64_t __53__PRPosterHomePosterHomeScreenAppearance_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterHomePosterHomeScreenAppearance isLegibilityBlurEnabled](self, "isLegibilityBlurEnabled"), @"legibilityBlurEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterHomePosterHomeScreenAppearance allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur"), @"allowsModifyingLegibilityBlur");
}

- (PRPosterHomePosterHomeScreenAppearance)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"legibilityBlurEnabled"];
  if ([v4 containsValueForKey:@"allowsModifyingLegibilityBlur"]) {
    uint64_t v6 = [v4 decodeBoolForKey:@"allowsModifyingLegibilityBlur"];
  }
  else {
    uint64_t v6 = 1;
  }
  uint64_t v7 = [(PRPosterHomePosterHomeScreenAppearance *)self initWithLegibilityBlurEnabled:v5 allowsModifyingLegibilityBlur:v6];

  return v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterHomePosterHomeScreenAppearance isLegibilityBlurEnabled](self, "isLegibilityBlurEnabled"), @"legibilityBlurEnabled");
  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterHomePosterHomeScreenAppearance allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur"), @"allowsModifyingLegibilityBlur");
}

- (PRPosterHomePosterHomeScreenAppearance)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"legibilityBlurEnabled"];
  if ([v4 containsValueForKey:@"allowsModifyingLegibilityBlur"]) {
    uint64_t v6 = [v4 decodeBoolForKey:@"allowsModifyingLegibilityBlur"];
  }
  else {
    uint64_t v6 = 1;
  }
  uint64_t v7 = [(PRPosterHomePosterHomeScreenAppearance *)self initWithLegibilityBlurEnabled:v5 allowsModifyingLegibilityBlur:v6];

  return v7;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v6 = a3;
  id v4 = (id)objc_msgSend(v6, "appendBool:withName:", -[PRPosterHomePosterHomeScreenAppearance isLegibilityBlurEnabled](self, "isLegibilityBlurEnabled"), @"legibilityBlurEnabled");
  id v5 = (id)objc_msgSend(v6, "appendBool:withName:", -[PRPosterHomePosterHomeScreenAppearance allowsModifyingLegibilityBlur](self, "allowsModifyingLegibilityBlur"), @"allowsModifyingLegibilityBlur");
}

- (BOOL)isLegibilityBlurEnabled
{
  return self->_legibilityBlurEnabled;
}

- (BOOL)allowsModifyingLegibilityBlur
{
  return self->_allowsModifyingLegibilityBlur;
}

@end