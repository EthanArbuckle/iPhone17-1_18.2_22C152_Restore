@interface SBSceneIdentityProvider
- (SBSceneIdentityProvider)initWithDisplayIdentity:(id)a3;
- (id)_sceneIdentifierForBundleIdentifier:(id)a3;
- (id)newSceneIdentityForApplication:(id)a3;
- (id)sceneIdentityForApplication:(id)a3;
- (id)sceneIdentityForApplication:(id)a3 createPrimaryIfRequired:(BOOL)a4 sceneSessionRole:(id)a5;
- (id)sceneIdentityForApplication:(id)a3 excludingIdentifiers:(id)a4;
- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4;
- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4;
@end

@implementation SBSceneIdentityProvider

- (SBSceneIdentityProvider)initWithDisplayIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSceneIdentityProvider;
  v6 = [(SBSceneIdentityProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_displayIdentity, a3);
  }

  return v7;
}

- (id)newSceneIdentityForApplication:(id)a3
{
  id v4 = a3;
  id v5 = [v4 bundleIdentifier];
  v6 = [(SBSceneIdentityProvider *)self _sceneIdentifierForBundleIdentifier:v5];

  v7 = [(SBSceneIdentityProvider *)self sceneIdentityForApplication:v4 uniqueIdentifier:v6];

  return v7;
}

- (id)sceneIdentityForApplication:(id)a3
{
  id v3 = [(SBSceneIdentityProvider *)self newSceneIdentityForApplication:a3];
  return v3;
}

- (id)sceneIdentityForApplication:(id)a3 uniqueIdentifier:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    objc_super v9 = [a3 bundleIdentifier];
    id v8 = [(SBSceneIdentityProvider *)self _sceneIdentifierForBundleIdentifier:v9];
  }
  v10 = [MEMORY[0x1E4F62A60] identityForIdentifier:v8];

  return v10;
}

- (id)sceneIdentityForApplication:(id)a3 targetContentIdentifier:(id)a4
{
  id v4 = -[SBSceneIdentityProvider newSceneIdentityForApplication:](self, "newSceneIdentityForApplication:", a3, a4);
  return v4;
}

- (id)sceneIdentityForApplication:(id)a3 excludingIdentifiers:(id)a4
{
  id v4 = -[SBSceneIdentityProvider newSceneIdentityForApplication:](self, "newSceneIdentityForApplication:", a3, a4);
  return v4;
}

- (id)sceneIdentityForApplication:(id)a3 createPrimaryIfRequired:(BOOL)a4 sceneSessionRole:(id)a5
{
  BOOL v5 = a4;
  id v7 = a3;
  id v8 = [(SBSceneIdentityProvider *)self sceneIdentityForApplication:v7];
  if (!v8 && v5) {
    id v8 = [(SBSceneIdentityProvider *)self newSceneIdentityForApplication:v7];
  }

  return v8;
}

- (id)_sceneIdentifierForBundleIdentifier:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@ - %@", a3, self->_displayIdentity];
}

- (void).cxx_destruct
{
}

@end