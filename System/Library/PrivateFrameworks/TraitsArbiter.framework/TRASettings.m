@interface TRASettings
- (TRASettings)init;
- (TRASettings)initWithSettings:(id)a3;
- (TRASettings)initWithZOrderLevelSettings:(id)a3 orientationSettings:(id)a4 ambientPresentationSettings:(id)a5 userInterfaceStyleSettings:(id)a6;
- (TRASettingsAmbientPresentation)ambientPresentationSettings;
- (TRASettingsOrientation)orientationSettings;
- (TRASettingsUserInterfaceStyle)userInterfaceStyleSettings;
- (TRASettingsZOrderLevel)zOrderLevelSettings;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setAmbientPresentationSettings:(id)a3;
- (void)setOrientationSettings:(id)a3;
- (void)setZOrderLevelSettings:(id)a3;
@end

@implementation TRASettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInterfaceStyleSettings, 0);
  objc_storeStrong((id *)&self->_ambientPresentationSettings, 0);
  objc_storeStrong((id *)&self->_orientationSettings, 0);
  objc_storeStrong((id *)&self->_zOrderLevelSettings, 0);
}

- (TRASettings)initWithSettings:(id)a3
{
  id v4 = a3;
  v5 = [v4 zOrderLevelSettings];
  v6 = [v4 orientationSettings];
  v7 = [v4 ambientPresentationSettings];
  v8 = [v4 userInterfaceStyleSettings];

  v9 = [(TRASettings *)self initWithZOrderLevelSettings:v5 orientationSettings:v6 ambientPresentationSettings:v7 userInterfaceStyleSettings:v8];
  return v9;
}

- (TRASettingsZOrderLevel)zOrderLevelSettings
{
  return self->_zOrderLevelSettings;
}

- (TRASettingsAmbientPresentation)ambientPresentationSettings
{
  return self->_ambientPresentationSettings;
}

- (TRASettingsOrientation)orientationSettings
{
  return self->_orientationSettings;
}

- (TRASettingsUserInterfaceStyle)userInterfaceStyleSettings
{
  return self->_userInterfaceStyleSettings;
}

- (TRASettings)initWithZOrderLevelSettings:(id)a3 orientationSettings:(id)a4 ambientPresentationSettings:(id)a5 userInterfaceStyleSettings:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TRASettings;
  v14 = [(TRASettings *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    zOrderLevelSettings = v14->_zOrderLevelSettings;
    v14->_zOrderLevelSettings = (TRASettingsZOrderLevel *)v15;

    uint64_t v17 = [v11 copy];
    orientationSettings = v14->_orientationSettings;
    v14->_orientationSettings = (TRASettingsOrientation *)v17;

    uint64_t v19 = [v12 copy];
    ambientPresentationSettings = v14->_ambientPresentationSettings;
    v14->_ambientPresentationSettings = (TRASettingsAmbientPresentation *)v19;

    uint64_t v21 = [v13 copy];
    userInterfaceStyleSettings = v14->_userInterfaceStyleSettings;
    v14->_userInterfaceStyleSettings = (TRASettingsUserInterfaceStyle *)v21;
  }
  return v14;
}

- (TRASettings)init
{
  return [(TRASettings *)self initWithZOrderLevelSettings:0 orientationSettings:0 ambientPresentationSettings:0 userInterfaceStyleSettings:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[TRAMutableSettings allocWithZone:a3];
  return [(TRASettings *)v4 initWithSettings:self];
}

- (id)succinctDescription
{
  v2 = [(TRASettings *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_zOrderLevelSettings withName:0 skipIfNil:1];
  id v5 = (id)[v3 appendObject:self->_orientationSettings withName:0 skipIfNil:1];
  id v6 = (id)[v3 appendObject:self->_ambientPresentationSettings withName:0 skipIfNil:1];
  id v7 = (id)[v3 appendObject:self->_userInterfaceStyleSettings withName:0 skipIfNil:1];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(TRASettings *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (void)setZOrderLevelSettings:(id)a3
{
}

- (void)setOrientationSettings:(id)a3
{
}

- (void)setAmbientPresentationSettings:(id)a3
{
}

@end