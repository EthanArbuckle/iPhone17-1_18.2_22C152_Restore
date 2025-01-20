@interface SBUIContinuitySessionAppearanceSettings
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SBUIContinuitySessionAppearanceSettings)init;
- (SBUIContinuitySessionAppearanceSettings)initWithBSXPCCoder:(id)a3;
- (id)_initWithBSSettings:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)userInterfaceStyle;
- (unint64_t)hash;
- (void)appendDescriptionToStream:(id)a3;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
@end

@implementation SBUIContinuitySessionAppearanceSettings

- (SBUIContinuitySessionAppearanceSettings)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F820]);
  v4 = (SBUIContinuitySessionAppearanceSettings *)-[SBUIContinuitySessionAppearanceSettings _initWithBSSettings:]((id *)&self->super.isa, v3);

  return v4;
}

- (id)_initWithBSSettings:(id *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel__initWithBSSettings_, a1, @"SBUIContinuitySessionAppearanceSettings.m", 41, @"Invalid parameter not satisfying: %@", @"settings" object file lineNumber description];
    }
    v9.receiver = a1;
    v9.super_class = (Class)SBUIContinuitySessionAppearanceSettings;
    a1 = (id *)objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      uint64_t v5 = [v4 mutableCopy];
      id v6 = a1[1];
      a1[1] = (id)v5;

      [a1[1] setDescriptionProvider:a1];
    }
  }

  return a1;
}

- (void)dealloc
{
  [(BSMutableSettings *)self->_mutableSettings setDescriptionProvider:0];
  v3.receiver = self;
  v3.super_class = (Class)SBUIContinuitySessionAppearanceSettings;
  [(SBUIContinuitySessionAppearanceSettings *)&v3 dealloc];
}

- (int64_t)userInterfaceStyle
{
  v2 = [(BSMutableSettings *)self->_mutableSettings objectForSetting:1];
  objc_super v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (SBUIContinuitySessionAppearanceSettings *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    int64_t v6 = [(SBUIContinuitySessionAppearanceSettings *)self userInterfaceStyle];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__SBUIContinuitySessionAppearanceSettings_isEqual___block_invoke;
    v10[3] = &unk_1E5CCE458;
    v11 = v4;
    id v7 = (id)[v5 appendUnsignedInteger:v6 counterpart:v10];
    char v8 = [v5 isEqual];
  }
  return v8;
}

uint64_t __51__SBUIContinuitySessionAppearanceSettings_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) userInterfaceStyle];
}

- (unint64_t)hash
{
  objc_super v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[SBUIContinuitySessionAppearanceSettings userInterfaceStyle](self, "userInterfaceStyle"));
  unint64_t v5 = [v3 hash];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SBUIContinuitySessionAppearanceSettings alloc];
  mutableSettings = self->_mutableSettings;
  return -[SBUIContinuitySessionAppearanceSettings _initWithBSSettings:]((id *)&v4->super.isa, mutableSettings);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [SBUIMutableContinuitySessionAppearanceSettings alloc];
  mutableSettings = self->_mutableSettings;
  return -[SBUIContinuitySessionAppearanceSettings _initWithBSSettings:]((id *)&v4->super.super.isa, mutableSettings);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  mutableSettings = self->_mutableSettings;
  id v4 = a3;
  id v5 = (id)[(BSMutableSettings *)mutableSettings copy];
  [v4 encodeObject:v5 forKey:@"settings"];
}

- (SBUIContinuitySessionAppearanceSettings)initWithBSXPCCoder:(id)a3
{
  id v5 = a3;
  int64_t v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"settings"];

  if (!v6)
  {
    objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBUIContinuitySessionAppearanceSettings.m" lineNumber:113 description:@"Unable to decode settings"];
  }
  id v7 = (SBUIContinuitySessionAppearanceSettings *)-[SBUIContinuitySessionAppearanceSettings _initWithBSSettings:]((id *)&self->super.isa, v6);

  return v7;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)succinctDescription
{
  id v1 = a1;
  if (a1)
  {
    v2 = (void *)MEMORY[0x1E4F4F720];
    objc_super v3 = [MEMORY[0x1E4F4F728] succinctStyle];
    id v1 = [v2 descriptionForRootObject:v1 withStyle:v3];
  }
  return v1;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__SBUIContinuitySessionAppearanceSettings_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E5CCC878;
  id v7 = v4;
  char v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

void __69__SBUIContinuitySessionAppearanceSettings_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) userInterfaceStyle];
  SBFStringForUIUserInterfaceStyle();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 appendString:v2 withName:@"userInterfaceStyle"];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1) {
    return @"userInterfaceStyle";
  }
  else {
    return 0;
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  if (a5 == 1)
  {
    objc_msgSend(a4, "integerValue", a3, v5);
    id v7 = SBFStringForUIUserInterfaceStyle();
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void).cxx_destruct
{
}

@end