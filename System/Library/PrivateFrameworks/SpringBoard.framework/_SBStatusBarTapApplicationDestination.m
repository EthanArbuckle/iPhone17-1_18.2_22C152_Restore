@interface _SBStatusBarTapApplicationDestination
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)sceneIdentifier;
- (SBApplication)application;
- (SBWindowScene)windowScene;
- (_SBStatusBarTapApplicationDestination)initWithApplication:(id)a3 sceneIdentifier:(id)a4 windowScene:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation _SBStatusBarTapApplicationDestination

- (NSString)bundleIdentifier
{
  v2 = [(SBApplication *)self->_application bundleIdentifier];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (_SBStatusBarTapApplicationDestination)initWithApplication:(id)a3 sceneIdentifier:(id)a4 windowScene:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_SBStatusBarTapApplicationDestination;
  v12 = [(_SBStatusBarTapApplicationDestination *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_application, a3);
    uint64_t v14 = [v10 copy];
    sceneIdentifier = v13->_sceneIdentifier;
    v13->_sceneIdentifier = (NSString *)v14;

    objc_storeWeak((id *)&v13->_windowScene, v11);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  application = self->_application;
  sceneIdentifier = self->_sceneIdentifier;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v8 = (void *)[v4 initWithApplication:application sceneIdentifier:sceneIdentifier windowScene:WeakRetained];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    application = self->_application;
    v6 = [v4 application];
    if ([(SBApplication *)application isEqual:v6])
    {
      v7 = [v4 sceneIdentifier];
      if (BSEqualObjects())
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
        id v9 = [v4 windowScene];
        char v10 = [WeakRetained isEqual:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SBApplication *)self->_application hash];
  NSUInteger v4 = [(NSString *)self->_sceneIdentifier hash] ^ v3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  unint64_t v6 = v4 ^ [WeakRetained hash];

  return v6;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_SBStatusBarTapApplicationDestination *)self bundleIdentifier];
  sceneIdentifier = self->_sceneIdentifier;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v8 = [WeakRetained _sceneIdentifier];
  id v9 = [v3 stringWithFormat:@"<%@:%p application:%@, sceneID:%@, windowScene:%@>", v4, self, v5, sceneIdentifier, v8];

  return v9;
}

- (SBApplication)application
{
  return self->_application;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_application, 0);
}

@end