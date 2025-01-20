@interface SBWorkspaceEntity
+ (id)entity;
- (BOOL)BOOLForActivationSetting:(unsigned int)a3;
- (BOOL)BOOLForDeactivationSetting:(unsigned int)a3;
- (BOOL)_supportsLayoutRole:(int64_t)a3;
- (BOOL)hasLayoutAttributes:(unint64_t)a3;
- (BOOL)isAnalogousToEntity:(id)a3;
- (BOOL)isAppClipPlaceholderEntity;
- (BOOL)isApplicationSceneEntity;
- (BOOL)isCaptureExtensionEntity;
- (BOOL)isDeviceApplicationSceneEntity;
- (BOOL)isEmptyWorkspaceEntity;
- (BOOL)isHomeScreenEntity;
- (BOOL)isPreviousWorkspaceEntity;
- (BOOL)representsSameLayoutElementAsDescriptor:(id)a3;
- (BOOL)supportsLayoutRole:(int64_t)a3;
- (BOOL)supportsPresentationAtAnySize;
- (BOOL)supportsSplitView;
- (BOOL)wantsExclusiveForeground;
- (Class)viewControllerClass;
- (NSString)description;
- (NSString)uniqueIdentifier;
- (SBActivationSettings)activationSettings;
- (SBDeactivationSettings)deactivationSettings;
- (SBWorkspaceEntity)init;
- (SBWorkspaceEntity)initWithIdentifier:(id)a3 displayChangeSettings:(id)a4;
- (id)_generator;
- (id)appClipPlaceholderEntity;
- (id)applicationSceneEntity;
- (id)captureExtensionEntity;
- (id)copyActivationSettings;
- (id)copyDeactivationSettings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)deviceApplicationSceneEntity;
- (id)displayItemRepresentation;
- (id)objectForActivationSetting:(unsigned int)a3;
- (id)objectForDeactivationSetting:(unsigned int)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)flagForActivationSetting:(unsigned int)a3;
- (int64_t)flagForDeactivationSetting:(unsigned int)a3;
- (int64_t)layoutRole;
- (unint64_t)layoutAttributes;
- (unint64_t)supportedLayoutRoles;
- (void)applyActivationSettings:(id)a3;
- (void)applyDeactivationSettings:(id)a3;
- (void)clearActivationSettings;
- (void)clearDeactivationSettings;
- (void)setFlag:(int64_t)a3 forActivationSetting:(unsigned int)a4;
- (void)setFlag:(int64_t)a3 forDeactivationSetting:(unsigned int)a4;
- (void)setLayoutRole:(int64_t)a3;
- (void)setObject:(id)a3 forActivationSetting:(unsigned int)a4;
- (void)setObject:(id)a3 forDeactivationSetting:(unsigned int)a4;
@end

@implementation SBWorkspaceEntity

uint64_t __41__SBWorkspaceEntity_supportedLayoutRoles__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) _supportsLayoutRole:a2];
  if (result)
  {
    uint64_t result = SBLayoutRoleMaskForRole(a2);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= result;
  }
  return result;
}

- (BOOL)_supportsLayoutRole:(int64_t)a3
{
  return 0;
}

- (void)clearActivationSettings
{
}

- (void)setLayoutRole:(int64_t)a3
{
  self->_layoutRole = a3;
}

- (SBWorkspaceEntity)initWithIdentifier:(id)a3 displayChangeSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBWorkspaceEntity;
  v8 = [(SBWorkspaceEntity *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copyActivationSettings];
    activationSettings = v8->_activationSettings;
    v8->_activationSettings = (SBActivationSettings *)v11;

    uint64_t v13 = [v7 copyDeactivationSettings];
    deactivationSettings = v8->_deactivationSettings;
    v8->_deactivationSettings = (SBDeactivationSettings *)v13;

    v8->_layoutRole = 0;
  }

  return v8;
}

- (id)applicationSceneEntity
{
  return 0;
}

- (BOOL)isApplicationSceneEntity
{
  return 0;
}

- (BOOL)BOOLForActivationSetting:(unsigned int)a3
{
  return [(SBActivationSettings *)self->_activationSettings BOOLForActivationSetting:*(void *)&a3];
}

- (BOOL)isAnalogousToEntity:(id)a3
{
  v4 = (SBWorkspaceEntity *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      id v7 = [(SBWorkspaceEntity *)self uniqueIdentifier];
      v8 = [(SBWorkspaceEntity *)v4 uniqueIdentifier];
      char v6 = [v7 isEqualToString:v8];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (void)setObject:(id)a3 forActivationSetting:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v9 = v6;
  if (v6 && !self->_activationSettings)
  {
    id v7 = objc_alloc_init(SBActivationSettings);
    activationSettings = self->_activationSettings;
    self->_activationSettings = v7;

    id v6 = v9;
  }
  [(SBActivationSettings *)self->_activationSettings setObject:v6 forActivationSetting:v4];
}

- (void)setFlag:(int64_t)a3 forActivationSetting:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && !self->_activationSettings)
  {
    id v7 = objc_alloc_init(SBActivationSettings);
    activationSettings = self->_activationSettings;
    self->_activationSettings = v7;
  }
  id v9 = self->_activationSettings;
  [(SBActivationSettings *)v9 setFlag:a3 forActivationSetting:v4];
}

- (int64_t)flagForActivationSetting:(unsigned int)a3
{
  activationSettings = self->_activationSettings;
  if (activationSettings) {
    return [(SBActivationSettings *)activationSettings flagForActivationSetting:*(void *)&a3];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)succinctDescription
{
  v2 = [(SBWorkspaceEntity *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identifier withName:@"ID" skipIfNil:1];
  uint64_t v5 = SBLayoutRoleDescription(self->_layoutRole);
  id v6 = (id)[v3 appendObject:v5 withName:@"layoutRole"];

  return v3;
}

- (id)displayItemRepresentation
{
  if ([(SBWorkspaceEntity *)self isApplicationSceneEntity])
  {
    v3 = self;
    id v4 = [(SBWorkspaceEntity *)v3 application];
    if ([v4 isWebApplication])
    {
      uint64_t v5 = [(SBWorkspaceEntity *)v3 uniqueIdentifier];
      id v6 = +[SBDisplayItem webAppDisplayItemWithWebAppIdentifier:v5];
    }
    else
    {
      uint64_t v5 = [v4 bundleIdentifier];
      id v9 = [(SBWorkspaceEntity *)v3 uniqueIdentifier];
      id v6 = +[SBDisplayItem applicationDisplayItemWithBundleIdentifier:v5 sceneIdentifier:v9];
    }
    goto LABEL_8;
  }
  if ([(SBWorkspaceEntity *)self isAppClipPlaceholderEntity])
  {
    v3 = [(SBWorkspaceEntity *)self appClipPlaceholderEntity];
    id v7 = [(SBWorkspaceEntity *)v3 bundleIdentifier];
    v8 = [(SBWorkspaceEntity *)v3 futureSceneIdentifier];
    id v6 = +[SBDisplayItem applicationDisplayItemWithBundleIdentifier:v7 sceneIdentifier:v8];

LABEL_8:
    goto LABEL_9;
  }
  if ([(SBWorkspaceEntity *)self isHomeScreenEntity])
  {
    id v6 = +[SBDisplayItem homeScreenDisplayItem];
  }
  else
  {
    id v6 = 0;
  }
LABEL_9:
  return v6;
}

- (NSString)uniqueIdentifier
{
  return self->_identifier;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (unint64_t)supportedLayoutRoles
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__SBWorkspaceEntity_supportedLayoutRoles__block_invoke;
  v5[3] = &unk_1E6AFBD78;
  v5[4] = self;
  v5[5] = &v6;
  SBLayoutRoleEnumerateAppLayoutRoles(v5);
  if ([(SBWorkspaceEntity *)self _supportsLayoutRole:3])
  {
    unint64_t v3 = v7[3] | 8;
    v7[3] = v3;
  }
  else
  {
    unint64_t v3 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)layoutAttributes
{
  unint64_t v3 = [(SBWorkspaceEntity *)self supportsPresentationAtAnySize];
  if ([(SBWorkspaceEntity *)self wantsExclusiveForeground]) {
    return v3 | 2;
  }
  else {
    return v3;
  }
}

- (BOOL)wantsExclusiveForeground
{
  return 0;
}

- (BOOL)supportsPresentationAtAnySize
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(SBWorkspaceEntity *)self uniqueIdentifier];
  uint64_t v6 = (void *)[v4 initWithIdentifier:v5 displayChangeSettings:0];

  id v7 = [(SBWorkspaceEntity *)self activationSettings];
  [v6 applyActivationSettings:v7];

  uint64_t v8 = [(SBWorkspaceEntity *)self deactivationSettings];
  [v6 applyDeactivationSettings:v8];

  objc_msgSend(v6, "setLayoutRole:", -[SBWorkspaceEntity layoutRole](self, "layoutRole"));
  return v6;
}

- (SBActivationSettings)activationSettings
{
  return self->_activationSettings;
}

- (void)applyActivationSettings:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4 && !self->_activationSettings)
  {
    uint64_t v5 = objc_alloc_init(SBActivationSettings);
    activationSettings = self->_activationSettings;
    self->_activationSettings = v5;

    id v4 = v7;
  }
  [(SBActivationSettings *)self->_activationSettings applyActivationSettings:v4];
}

+ (id)entity
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SBDeactivationSettings)deactivationSettings
{
  return self->_deactivationSettings;
}

- (void)applyDeactivationSettings:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4 && !self->_deactivationSettings)
  {
    uint64_t v5 = objc_alloc_init(SBDeactivationSettings);
    deactivationSettings = self->_deactivationSettings;
    self->_deactivationSettings = v5;

    id v4 = v7;
  }
  [(SBDeactivationSettings *)self->_deactivationSettings applyDeactivationSettings:v4];
}

- (id)objectForActivationSetting:(unsigned int)a3
{
  return [(SBActivationSettings *)self->_activationSettings objectForActivationSetting:*(void *)&a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deactivationSettings, 0);
  objc_storeStrong((id *)&self->_activationSettings, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isAppClipPlaceholderEntity
{
  return 0;
}

- (BOOL)isEmptyWorkspaceEntity
{
  return 0;
}

- (BOOL)isHomeScreenEntity
{
  return 0;
}

uint64_t __59__SBWorkspaceEntity_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  unint64_t v3 = SBLayoutRoleMaskDescription([*(id *)(a1 + 40) supportedLayoutRoles]);
  id v4 = (id)[v2 appendObject:v3 withName:@"supportedRoles"];

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = SBLayoutAttributesDescription([*(id *)(a1 + 40) layoutAttributes]);
  id v7 = (id)[v5 appendObject:v6 withName:@"layoutAttributes"];

  if (([*(id *)(*(void *)(a1 + 40) + 24) isEmpty] & 1) == 0) {
    id v8 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"activation" skipIfNil:1];
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 40) + 32) isEmpty];
  if ((result & 1) == 0) {
    return (uint64_t)(id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"deactivation" skipIfNil:1];
  }
  return result;
}

- (BOOL)isPreviousWorkspaceEntity
{
  return 0;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  unint64_t v3 = [(SBWorkspaceEntity *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBWorkspaceEntity *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__SBWorkspaceEntity_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

- (id)appClipPlaceholderEntity
{
  return 0;
}

- (BOOL)isDeviceApplicationSceneEntity
{
  return 0;
}

- (id)deviceApplicationSceneEntity
{
  return 0;
}

- (SBWorkspaceEntity)init
{
  return [(SBWorkspaceEntity *)self initWithIdentifier:0 displayChangeSettings:0];
}

- (id)copyActivationSettings
{
  return (id)[(SBActivationSettings *)self->_activationSettings copy];
}

- (void)setFlag:(int64_t)a3 forDeactivationSetting:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && !self->_deactivationSettings)
  {
    id v7 = objc_alloc_init(SBDeactivationSettings);
    deactivationSettings = self->_deactivationSettings;
    self->_deactivationSettings = v7;
  }
  uint64_t v9 = self->_deactivationSettings;
  [(SBDeactivationSettings *)v9 setFlag:a3 forDeactivationSetting:v4];
}

- (int64_t)flagForDeactivationSetting:(unsigned int)a3
{
  deactivationSettings = self->_deactivationSettings;
  if (deactivationSettings) {
    return [(SBDeactivationSettings *)deactivationSettings flagForDeactivationSetting:*(void *)&a3];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (BOOL)BOOLForDeactivationSetting:(unsigned int)a3
{
  return [(SBDeactivationSettings *)self->_deactivationSettings BOOLForDeactivationSetting:*(void *)&a3];
}

- (void)setObject:(id)a3 forDeactivationSetting:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v9 = v6;
  if (v6 && !self->_deactivationSettings)
  {
    id v7 = objc_alloc_init(SBDeactivationSettings);
    deactivationSettings = self->_deactivationSettings;
    self->_deactivationSettings = v7;

    id v6 = v9;
  }
  [(SBDeactivationSettings *)self->_deactivationSettings setObject:v6 forDeactivationSetting:v4];
}

- (id)objectForDeactivationSetting:(unsigned int)a3
{
  return [(SBDeactivationSettings *)self->_deactivationSettings objectForDeactivationSetting:*(void *)&a3];
}

- (id)copyDeactivationSettings
{
  return (id)[(SBDeactivationSettings *)self->_deactivationSettings copy];
}

- (void)clearDeactivationSettings
{
}

- (BOOL)supportsSplitView
{
  return 0;
}

- (NSString)description
{
  return (NSString *)[(SBWorkspaceEntity *)self descriptionWithMultilinePrefix:0];
}

- (id)_generator
{
  uint64_t v2 = objc_opt_class();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__SBWorkspaceEntity__generator__block_invoke;
  v6[3] = &__block_descriptor_40_e5__8__0lu32l8;
  v6[4] = v2;
  unint64_t v3 = (void *)MEMORY[0x1D948C7A0](v6);
  uint64_t v4 = (void *)MEMORY[0x1D948C7A0]();

  return v4;
}

uint64_t __31__SBWorkspaceEntity__generator__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) entity];
}

- (Class)viewControllerClass
{
  return 0;
}

- (BOOL)supportsLayoutRole:(int64_t)a3
{
  uint64_t v4 = [(SBWorkspaceEntity *)self supportedLayoutRoles];
  return SBLayoutRoleMaskContainsRole(v4, a3);
}

- (BOOL)hasLayoutAttributes:(unint64_t)a3
{
  return (a3 & ~[(SBWorkspaceEntity *)self layoutAttributes]) == 0;
}

- (BOOL)representsSameLayoutElementAsDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBWorkspaceEntity *)self uniqueIdentifier];
  id v6 = [v4 uniqueIdentifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (BOOL)isCaptureExtensionEntity
{
  return 0;
}

- (id)captureExtensionEntity
{
  return 0;
}

@end