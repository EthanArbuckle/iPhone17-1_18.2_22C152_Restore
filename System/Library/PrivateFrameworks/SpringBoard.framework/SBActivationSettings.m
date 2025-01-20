@interface SBActivationSettings
- (BOOL)BOOLForActivationSetting:(unsigned int)a3;
- (BOOL)_settingsAreValidToMoveContentToNewScene;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SBActivationSettings)init;
- (id)copyActivationSettings;
- (id)copyActivationSettingsPassingFilter:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)objectForActivationSetting:(unsigned int)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)flagForActivationSetting:(unsigned int)a3;
- (unint64_t)hash;
- (void)applyActivationSettings:(id)a3;
- (void)clearActivationSettings;
- (void)dealloc;
- (void)setFlag:(int64_t)a3 forActivationSetting:(unsigned int)a4;
- (void)setObject:(id)a3 forActivationSetting:(unsigned int)a4;
@end

@implementation SBActivationSettings

- (BOOL)BOOLForActivationSetting:(unsigned int)a3
{
  return [(BSMutableSettings *)self->_settings BOOLForSetting:a3];
}

- (void).cxx_destruct
{
}

- (void)setObject:(id)a3 forActivationSetting:(unsigned int)a4
{
}

- (void)setFlag:(int64_t)a3 forActivationSetting:(unsigned int)a4
{
}

- (int64_t)flagForActivationSetting:(unsigned int)a3
{
  return [(BSMutableSettings *)self->_settings flagForSetting:a3];
}

- (SBActivationSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBActivationSettings;
  v2 = [(SBActivationSettings *)&v6 init];
  if (v2)
  {
    v3 = (BSMutableSettings *)objc_alloc_init(MEMORY[0x1E4F4F7A0]);
    settings = v2->_settings;
    v2->_settings = v3;

    [(BSMutableSettings *)v2->_settings setDescriptionProvider:v2];
  }
  return v2;
}

- (void)applyActivationSettings:(id)a3
{
  if (a3) {
    [(BSMutableSettings *)self->_settings applySettings:*((void *)a3 + 1)];
  }
}

- (id)objectForActivationSetting:(unsigned int)a3
{
  return (id)[(BSMutableSettings *)self->_settings objectForSetting:a3];
}

- (void)dealloc
{
  [(BSMutableSettings *)self->_settings setDescriptionProvider:0];
  v3.receiver = self;
  v3.super_class = (Class)SBActivationSettings;
  [(SBActivationSettings *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 applyActivationSettings:self];
  return v4;
}

- (BOOL)isEmpty
{
  return [(BSMutableSettings *)self->_settings isEmpty];
}

- (id)copyActivationSettings
{
  return [(SBActivationSettings *)self copyActivationSettingsPassingFilter:0];
}

- (id)copyActivationSettingsPassingFilter:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SBActivationSettings);
  settings = self->_settings;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__SBActivationSettings_copyActivationSettingsPassingFilter___block_invoke;
  v18[3] = &unk_1E6B07E88;
  id v7 = v4;
  id v20 = v7;
  v8 = v5;
  v19 = v8;
  [(BSMutableSettings *)settings enumerateFlagsWithBlock:v18];
  v9 = self->_settings;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__SBActivationSettings_copyActivationSettingsPassingFilter___block_invoke_2;
  v15[3] = &unk_1E6B07EB0;
  id v17 = v7;
  v10 = v8;
  v16 = v10;
  id v11 = v7;
  [(BSMutableSettings *)v9 enumerateObjectsWithBlock:v15];
  v12 = v16;
  v13 = v10;

  return v13;
}

uint64_t __60__SBActivationSettings_copyActivationSettingsPassingFilter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6 || (uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2), result))
  {
    v8 = *(void **)(a1 + 32);
    return [v8 setFlag:a3 forActivationSetting:a2];
  }
  return result;
}

uint64_t __60__SBActivationSettings_copyActivationSettingsPassingFilter___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  if (!v6 || (*(unsigned int (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2)) {
    [*(id *)(a1 + 32) setObject:v8 forActivationSetting:a2];
  }
  return MEMORY[0x1F4181820]();
}

- (void)clearActivationSettings
{
}

- (unint64_t)hash
{
  return 167 * [(BSMutableSettings *)self->_settings hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBActivationSettings *)a3;
  if (self == v4)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(BSMutableSettings *)self->_settings isEqual:v4->_settings];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)[(SBActivationSettings *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBActivationSettings *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBActivationSettings *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  char v5 = [(SBActivationSettings *)self succinctDescriptionBuilder];
  settings = self->_settings;
  if (settings && ([(BSMutableSettings *)settings isEmpty] & 1) == 0)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__SBActivationSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
    v9[3] = &unk_1E6AF5290;
    id v10 = v5;
    id v11 = self;
    [v10 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  }
  else
  {
    id v7 = (id)[v5 appendObject:@"(empty)" withName:0];
  }

  return v5;
}

id __62__SBActivationSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:0];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 > 0x4A) {
    return 0;
  }
  else {
    return off_1E6B07ED0[a3];
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  return 0;
}

- (BOOL)_settingsAreValidToMoveContentToNewScene
{
  BOOL v3 = [(SBActivationSettings *)self BOOLForActivationSetting:67];
  BOOL v4 = [(SBActivationSettings *)self BOOLForActivationSetting:68];
  return (v3 && v4) & [(SBActivationSettings *)self BOOLForActivationSetting:31];
}

@end