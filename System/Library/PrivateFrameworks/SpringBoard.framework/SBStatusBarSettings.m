@interface SBStatusBarSettings
- (BOOL)isEqual:(id)a3;
- (BSSettings)_BSSettings;
- (NSNumber)alpha;
- (NSSet)backgroundActivitiesToSuppress;
- (NSString)description;
- (SBStatusBarSettings)init;
- (_UILegibilitySettings)legibilitySettings;
- (id)_initWithBSSettings:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)style;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation SBStatusBarSettings

- (NSSet)backgroundActivitiesToSuppress
{
  v2 = [(BSMutableSettings *)self->_settings objectForSetting:4];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CAD0] set];
  }
  v5 = v4;

  return (NSSet *)v5;
}

- (void).cxx_destruct
{
}

uint64_t __31__SBStatusBarSettings_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) alpha];
}

uint64_t __31__SBStatusBarSettings_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) backgroundActivitiesToSuppress];
}

uint64_t __31__SBStatusBarSettings_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) legibilitySettings];
}

uint64_t __31__SBStatusBarSettings_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) style];
}

- (id)_initWithBSSettings:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBStatusBarSettings;
  v5 = [(SBStatusBarSettings *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    settings = v5->_settings;
    v5->_settings = (BSMutableSettings *)v6;

    [(BSMutableSettings *)v5->_settings setDescriptionProvider:v5];
  }

  return v5;
}

- (void)dealloc
{
  [(BSMutableSettings *)self->_settings setDescriptionProvider:0];
  v3.receiver = self;
  v3.super_class = (Class)SBStatusBarSettings;
  [(SBStatusBarSettings *)&v3 dealloc];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [SBMutableStatusBarSettings alloc];
  settings = self->_settings;
  return [(SBStatusBarSettings *)v4 _initWithBSSettings:settings];
}

- (NSNumber)alpha
{
  v2 = [(BSMutableSettings *)self->_settings objectForSetting:1];
  objc_super v3 = v2;
  if (!v2) {
    v2 = &unk_1F334B0D8;
  }
  id v4 = v2;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBStatusBarSettings *)a3;
  if (self == v4)
  {
    char v17 = 1;
  }
  else
  {
    v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    uint64_t v6 = [(SBStatusBarSettings *)self alpha];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __31__SBStatusBarSettings_isEqual___block_invoke;
    v28[3] = &unk_1E6AF5180;
    v7 = v4;
    v29 = v7;
    id v8 = (id)[v5 appendObject:v6 counterpart:v28];

    int64_t v9 = [(SBStatusBarSettings *)self style];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __31__SBStatusBarSettings_isEqual___block_invoke_2;
    v26[3] = &unk_1E6AF5470;
    v10 = v7;
    v27 = v10;
    id v11 = (id)[v5 appendUnsignedInteger:v9 counterpart:v26];
    v12 = [(SBStatusBarSettings *)self legibilitySettings];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __31__SBStatusBarSettings_isEqual___block_invoke_3;
    v24[3] = &unk_1E6AF5180;
    v13 = v10;
    v25 = v13;
    id v14 = (id)[v5 appendObject:v12 counterpart:v24];

    v15 = [(SBStatusBarSettings *)self backgroundActivitiesToSuppress];
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __31__SBStatusBarSettings_isEqual___block_invoke_4;
    v22 = &unk_1E6AF5180;
    v23 = v13;
    id v16 = (id)[v5 appendObject:v15 counterpart:&v19];

    char v17 = objc_msgSend(v5, "isEqual", v19, v20, v21, v22);
  }

  return v17;
}

- (int64_t)style
{
  v2 = [(BSMutableSettings *)self->_settings objectForSetting:2];
  objc_super v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = -1;
  }

  return v4;
}

- (_UILegibilitySettings)legibilitySettings
{
  return (_UILegibilitySettings *)[(BSMutableSettings *)self->_settings objectForSetting:3];
}

- (BSSettings)_BSSettings
{
  return self->_settings;
}

void __49__SBStatusBarSettings_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) alpha];
  id v2 = (id)[v1 appendObject:v3 withName:@"alpha" skipIfNil:1];
}

void __61__SBStatusBarSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = objc_msgSend(MEMORY[0x1E4F42738], "stringForStatusBarStyle:", objc_msgSend(*(id *)(a1 + 40), "style"));
  id v4 = (id)[v2 appendObject:v3 withName:@"style" skipIfNil:1];

  v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) legibilitySettings];
  id v7 = (id)[v5 appendObject:v6 withName:@"legibilitySettings" skipIfNil:1];

  id v8 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) backgroundActivitiesToSuppress];
  int64_t v9 = STBackgroundActivityIdentifiersDescription();
  [v8 appendString:v9 withName:@"backgroundActivitiesToSuppress" skipIfEmpty:1];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBStatusBarSettings *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(SBStatusBarSettings *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SBStatusBarSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__SBStatusBarSettings_succinctDescriptionBuilder__block_invoke;
  v8[3] = &unk_1E6AF5290;
  id v4 = v3;
  id v9 = v4;
  id v10 = self;
  id v5 = (id)[v4 modifyProem:v8];
  id v6 = v4;

  return v6;
}

- (SBStatusBarSettings)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F820]);
  id v4 = [(SBStatusBarSettings *)self _initWithBSSettings:v3];

  return v4;
}

- (unint64_t)hash
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(SBStatusBarSettings *)self alpha];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[SBStatusBarSettings style](self, "style"));
  id v7 = [(SBStatusBarSettings *)self legibilitySettings];
  id v8 = (id)[v3 appendObject:v7];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = [(SBStatusBarSettings *)self backgroundActivitiesToSuppress];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = (id)[v3 appendObject:*(void *)(*((void *)&v17 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  unint64_t v15 = [v3 hash];
  return v15;
}

- (NSString)description
{
  return (NSString *)[(SBStatusBarSettings *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(SBStatusBarSettings *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SBStatusBarSettings alloc];
  settings = self->_settings;
  return [(SBStatusBarSettings *)v4 _initWithBSSettings:settings];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 0;
  }
  else {
    return off_1E6B0A358[a3 - 1];
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v7 = a4;
  id v8 = v7;
  switch(a5)
  {
    case 1uLL:
      uint64_t v9 = [v7 description];
      goto LABEL_6;
    case 2uLL:
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F42738], "stringForStatusBarStyle:", objc_msgSend(v7, "integerValue"));
      goto LABEL_6;
    case 3uLL:
      uint64_t v9 = objc_msgSend(v7, "sb_description");
LABEL_6:
      uint64_t v10 = (void *)v9;
      break;
    case 4uLL:
      uint64_t v11 = [(SBStatusBarSettings *)self backgroundActivitiesToSuppress];
      uint64_t v10 = STBackgroundActivityIdentifiersDescription();

      break;
    default:
      uint64_t v10 = 0;
      break;
  }

  return v10;
}

@end