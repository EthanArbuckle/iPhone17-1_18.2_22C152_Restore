@interface PRPosterSceneSettings
+ (BOOL)supportsSecureCoding;
- (FBSDisplayConfiguration)displayConfiguration;
- (NSString)provider;
- (PFServerPosterPath)path;
- (PRPosterAmbientConfiguration)ambientConfiguration;
- (PRPosterSceneSettings)initWithCoder:(id)a3;
- (PRPosterTitleStyleConfiguration)titleStyleConfiguration;
- (PRSceneSettings)stagedSceneSettings;
- (UITraitCollection)traitCollection;
- (_PRPosterStagedSceneSettings)sceneSettings;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)deviceOrientation;
- (int64_t)interfaceOrientation;
- (int64_t)snapshotOptions;
- (void)applyToMutableSceneSettings:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAmbientConfiguration:(id)a3;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setDisplayConfiguration:(id)a3;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setPath:(id)a3;
- (void)setProvider:(id)a3;
- (void)setSceneSettings:(id)a3;
- (void)setSnapshotOptions:(int64_t)a3;
- (void)setTitleStyleConfiguration:(id)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation PRPosterSceneSettings

- (void)applyToMutableSceneSettings:(id)a3
{
  id v15 = a3;
  v4 = [(PRPosterSceneSettings *)self sceneSettings];
  int64_t v5 = [(PRPosterSceneSettings *)self interfaceOrientation];
  int64_t v6 = [(PRPosterSceneSettings *)self deviceOrientation];
  v7 = [(PRPosterSceneSettings *)self displayConfiguration];
  v8 = [(PRPosterSceneSettings *)self traitCollection];
  v9 = [(PRPosterSceneSettings *)self titleStyleConfiguration];
  v10 = [(PRPosterSceneSettings *)self ambientConfiguration];
  v11 = [(PRPosterSceneSettings *)self path];
  [v15 setDisplayConfiguration:v7];
  [v7 bounds];
  objc_msgSend(v15, "setFrame:");
  if (v9) {
    objc_msgSend(v15, "pr_setPosterTitleStyleConfiguration:", v9);
  }
  if (v10) {
    objc_msgSend(v15, "pr_setPosterAmbientConfiguration:", v10);
  }
  v12 = v15;
  if (v11)
  {
    objc_msgSend(v15, "pui_setPosterContents:", v11);
    v12 = v15;
  }
  if ([v12 isUISubclass] && v8) {
    objc_msgSend(v15, "setAccessibilityContrast:", objc_msgSend(v8, "accessibilityContrast"));
  }
  v13 = [v11 role];
  [v4 applyToMutableSceneSettings:v15 role:v13];

  v14 = [v11 role];
  if ([v14 isEqualToString:@"PRPosterRoleLockScreen"]
    && !PUIDynamicRotationIsActive())
  {
    int64_t v6 = 1;
  }

  objc_msgSend(v15, "pui_setDeviceOrientation:", v6);
  [v15 setInterfaceOrientation:v5];
  if (v8) {
    objc_msgSend(v15, "pui_setUserInterfaceStyle:", objc_msgSend(v8, "userInterfaceStyle"));
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterSceneSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PRPosterSceneSettings;
  int64_t v5 = [(PRPosterSceneSettings *)&v21 init];
  if (v5)
  {
    int64_t v6 = self;
    v7 = [v4 decodeObjectOfClass:v6 forKey:@"displayConfiguration"];
    [(PRPosterSceneSettings *)v5 setDisplayConfiguration:v7];

    -[PRPosterSceneSettings setInterfaceOrientation:](v5, "setInterfaceOrientation:", [v4 decodeIntegerForKey:@"interfaceOrientation"]);
    v8 = self;
    v9 = [v4 decodeObjectOfClass:v8 forKey:@"sceneSettings"];
    [(PRPosterSceneSettings *)v5 setSceneSettings:v9];

    v10 = self;
    v11 = [v4 decodeObjectOfClass:v10 forKey:@"serverPosterPath"];
    if (v11)
    {
      [(PRPosterSceneSettings *)v5 setPath:v11];
    }
    else
    {
      v12 = self;
      v13 = [v4 decodeObjectOfClass:v12 forKey:@"path"];
      [(PRPosterSceneSettings *)v5 setPath:v13];
    }
    v14 = self;
    id v15 = [v4 decodeObjectOfClass:v14 forKey:@"titleStyleConfiguration"];
    [(PRPosterSceneSettings *)v5 setTitleStyleConfiguration:v15];

    v16 = self;
    v17 = [v4 decodeObjectOfClass:v16 forKey:@"ambientConfiguration"];
    [(PRPosterSceneSettings *)v5 setAmbientConfiguration:v17];

    v18 = self;
    v19 = [v4 decodeObjectOfClass:v18 forKey:@"traitCollection"];
    [(PRPosterSceneSettings *)v5 setTraitCollection:v19];

    -[PRPosterSceneSettings setSnapshotOptions:](v5, "setSnapshotOptions:", [v4 decodeIntegerForKey:@"snapshotOptions"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(PRPosterSceneSettings *)self displayConfiguration];
  [v12 encodeObject:v4 forKey:@"displayConfiguration"];

  objc_msgSend(v12, "encodeInteger:forKey:", -[PRPosterSceneSettings interfaceOrientation](self, "interfaceOrientation"), @"interfaceOrientation");
  int64_t v5 = [(PRPosterSceneSettings *)self sceneSettings];
  [v12 encodeObject:v5 forKey:@"sceneSettings"];

  int64_t v6 = [(PRPosterSceneSettings *)self path];
  v7 = [(PRPosterSceneSettings *)self path];
  if ([v7 isServerPosterPath]) {
    v8 = @"serverPosterPath";
  }
  else {
    v8 = @"path";
  }
  [v12 encodeObject:v6 forKey:v8];

  v9 = [(PRPosterSceneSettings *)self traitCollection];
  [v12 encodeObject:v9 forKey:@"traitCollection"];

  v10 = [(PRPosterSceneSettings *)self titleStyleConfiguration];
  [v12 encodeObject:v10 forKey:@"titleStyleConfiguration"];

  v11 = [(PRPosterSceneSettings *)self ambientConfiguration];
  [v12 encodeObject:v11 forKey:@"ambientConfiguration"];

  objc_msgSend(v12, "encodeInteger:forKey:", -[PRPosterSceneSettings snapshotOptions](self, "snapshotOptions"), @"snapshotOptions");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[PRPosterSceneSettings allocWithZone:a3] init];
  int64_t v5 = [(PRPosterSceneSettings *)self sceneSettings];
  [(PRPosterSceneSettings *)v4 setSceneSettings:v5];

  int64_t v6 = [(PRPosterSceneSettings *)self displayConfiguration];
  [(PRPosterSceneSettings *)v4 setDisplayConfiguration:v6];

  [(PRPosterSceneSettings *)v4 setInterfaceOrientation:[(PRPosterSceneSettings *)self interfaceOrientation]];
  [(PRPosterSceneSettings *)v4 setSnapshotOptions:[(PRPosterSceneSettings *)self snapshotOptions]];
  return v4;
}

- (PRSceneSettings)stagedSceneSettings
{
  return (PRSceneSettings *)self->_sceneSettings;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void)setDisplayConfiguration:(id)a3
{
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (NSString)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_deviceOrientation = a3;
}

- (int64_t)snapshotOptions
{
  return self->_snapshotOptions;
}

- (void)setSnapshotOptions:(int64_t)a3
{
  self->_snapshotOptions = a3;
}

- (PRPosterTitleStyleConfiguration)titleStyleConfiguration
{
  return self->_titleStyleConfiguration;
}

- (void)setTitleStyleConfiguration:(id)a3
{
}

- (PRPosterAmbientConfiguration)ambientConfiguration
{
  return self->_ambientConfiguration;
}

- (void)setAmbientConfiguration:(id)a3
{
}

- (PFServerPosterPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (_PRPosterStagedSceneSettings)sceneSettings
{
  return self->_sceneSettings;
}

- (void)setSceneSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneSettings, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_ambientConfiguration, 0);
  objc_storeStrong((id *)&self->_titleStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

@end