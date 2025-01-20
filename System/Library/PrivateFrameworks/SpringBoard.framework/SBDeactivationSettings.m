@interface SBDeactivationSettings
- (BOOL)BOOLForDeactivationSetting:(unsigned int)a3;
- (BOOL)isEmpty;
- (NSString)description;
- (SBDeactivationSettings)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)objectForDeactivationSetting:(unsigned int)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)flagForDeactivationSetting:(unsigned int)a3;
- (void)applyDeactivationSettings:(id)a3;
- (void)clearDeactivationSettings;
- (void)dealloc;
- (void)setFlag:(int64_t)a3 forDeactivationSetting:(unsigned int)a4;
- (void)setObject:(id)a3 forDeactivationSetting:(unsigned int)a4;
@end

@implementation SBDeactivationSettings

- (SBDeactivationSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBDeactivationSettings;
  v2 = [(SBDeactivationSettings *)&v6 init];
  if (v2)
  {
    v3 = (BSMutableSettings *)objc_alloc_init(MEMORY[0x1E4F4F7A0]);
    settings = v2->_settings;
    v2->_settings = v3;

    [(BSMutableSettings *)v2->_settings setDescriptionProvider:v2];
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 applyDeactivationSettings:self];
  return v4;
}

- (void)dealloc
{
  [(BSMutableSettings *)self->_settings setDescriptionProvider:0];
  v3.receiver = self;
  v3.super_class = (Class)SBDeactivationSettings;
  [(SBDeactivationSettings *)&v3 dealloc];
}

- (BOOL)isEmpty
{
  return [(BSMutableSettings *)self->_settings isEmpty];
}

- (void)setFlag:(int64_t)a3 forDeactivationSetting:(unsigned int)a4
{
}

- (int64_t)flagForDeactivationSetting:(unsigned int)a3
{
  return [(BSMutableSettings *)self->_settings flagForSetting:a3];
}

- (BOOL)BOOLForDeactivationSetting:(unsigned int)a3
{
  return [(BSMutableSettings *)self->_settings BOOLForSetting:a3];
}

- (void)setObject:(id)a3 forDeactivationSetting:(unsigned int)a4
{
}

- (id)objectForDeactivationSetting:(unsigned int)a3
{
  return (id)[(BSMutableSettings *)self->_settings objectForSetting:a3];
}

- (void)applyDeactivationSettings:(id)a3
{
  if (a3) {
    [(BSMutableSettings *)self->_settings applySettings:*((void *)a3 + 1)];
  }
}

- (void)clearDeactivationSettings
{
}

- (NSString)description
{
  return (NSString *)[(SBDeactivationSettings *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBDeactivationSettings *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBDeactivationSettings *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(SBDeactivationSettings *)self succinctDescriptionBuilder];
  settings = self->_settings;
  if (settings && ([(BSMutableSettings *)settings isEmpty] & 1) == 0)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__SBDeactivationSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
    v9[3] = &unk_1E6AF5290;
    id v10 = v5;
    v11 = self;
    [v10 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];
  }
  else
  {
    id v7 = (id)[v5 appendObject:@"(empty)" withName:0];
  }

  return v5;
}

id __64__SBDeactivationSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:0];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 > 9) {
    return 0;
  }
  else {
    return off_1E6B02CA8[a3];
  }
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  return 0;
}

- (void).cxx_destruct
{
}

@end