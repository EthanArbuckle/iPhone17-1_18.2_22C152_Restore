@interface PBUIBakedEffectSnapshotSource
- (BOOL)effectsAreBakedIn;
- (NSString)cacheIdentifier;
- (NSString)description;
- (PBUIBakedEffectSnapshotSource)initWithSnapshotSource:(id)a3;
- (PBUIWallpaperEffectConfiguration)effectConfiguration;
- (UIImage)snapshot;
- (_UILegibilitySettings)legibilitySettings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setCacheIdentifier:(id)a3;
- (void)setEffectConfiguration:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setSnapshot:(id)a3;
@end

@implementation PBUIBakedEffectSnapshotSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectConfiguration, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setEffectConfiguration:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(PBUIBakedEffectSnapshotSource *)self cacheIdentifier];
  [v4 setCacheIdentifier:v5];

  v6 = [(PBUIBakedEffectSnapshotSource *)self legibilitySettings];
  [v4 setLegibilitySettings:v6];

  v7 = [(PBUIBakedEffectSnapshotSource *)self snapshot];
  [v4 setSnapshot:v7];

  return v4;
}

- (UIImage)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
}

- (void)setLegibilitySettings:(id)a3
{
}

- (void)setCacheIdentifier:(id)a3
{
}

- (NSString)cacheIdentifier
{
  return self->_cacheIdentifier;
}

- (PBUIBakedEffectSnapshotSource)initWithSnapshotSource:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(PBUIBakedEffectSnapshotSource *)self init];
    if (v5)
    {
      v6 = [v4 cacheIdentifier];
      uint64_t v7 = [v6 copy];
      cacheIdentifier = v5->_cacheIdentifier;
      v5->_cacheIdentifier = (NSString *)v7;

      v9 = [v4 legibilitySettings];
      uint64_t v10 = [v9 copy];
      legibilitySettings = v5->_legibilitySettings;
      v5->_legibilitySettings = (_UILegibilitySettings *)v10;

      uint64_t v12 = [v4 snapshot];
      snapshot = v5->_snapshot;
      v5->_snapshot = (UIImage *)v12;

      uint64_t v14 = +[PBUIWallpaperEffectConfiguration normal]();
      effectConfiguration = v5->_effectConfiguration;
      v5->_effectConfiguration = (PBUIWallpaperEffectConfiguration *)v14;
    }
    self = v5;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)effectsAreBakedIn
{
  return 1;
}

- (NSString)description
{
  return (NSString *)[(PBUIBakedEffectSnapshotSource *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(PBUIBakedEffectSnapshotSource *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v5 = [(PBUIBakedEffectSnapshotSource *)self cacheIdentifier];
  [v4 appendString:v5 withName:@"cacheIdentifier"];

  v6 = [(PBUIBakedEffectSnapshotSource *)self snapshot];
  id v7 = (id)[v4 appendObject:v6 withName:@"snapshot"];

  v8 = [(PBUIBakedEffectSnapshotSource *)self effectConfiguration];
  id v9 = (id)[v4 appendObject:v8 withName:@"effectConfiguration"];

  return v4;
}

- (id)succinctDescription
{
  v2 = [(PBUIBakedEffectSnapshotSource *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (PBUIWallpaperEffectConfiguration)effectConfiguration
{
  return self->_effectConfiguration;
}

@end