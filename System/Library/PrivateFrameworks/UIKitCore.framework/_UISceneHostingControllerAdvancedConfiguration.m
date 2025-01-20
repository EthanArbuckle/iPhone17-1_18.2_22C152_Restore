@interface _UISceneHostingControllerAdvancedConfiguration
- (FBSceneWorkspace)sceneWorkspace;
- (NSOrderedSet)additionalExtensions;
- (NSString)sceneIdentifier;
- (RBSProcessIdentity)processIdentity;
- (UIApplicationSceneSpecification)sceneSpecification;
- (_UISceneHostingControllerAdvancedConfiguration)initWithProcessIdentity:(id)a3;
- (id)initialClientSettingsUpdater;
- (id)initialSettingsUpdater;
- (id)sceneHostingSpecification;
- (void)setAdditionalExtensions:(id)a3;
- (void)setInitialClientSettingsUpdater:(id)a3;
- (void)setInitialSettingsUpdater:(id)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setSceneSpecification:(id)a3;
- (void)setSceneWorkspace:(id)a3;
@end

@implementation _UISceneHostingControllerAdvancedConfiguration

- (_UISceneHostingControllerAdvancedConfiguration)initWithProcessIdentity:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UISceneHostingControllerAdvancedConfiguration;
  v6 = [(_UISceneHostingControllerAdvancedConfiguration *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_processIdentity, a3);
    [(_UISceneHostingControllerAdvancedConfiguration *)v7 setSceneSpecification:0];
    [(_UISceneHostingControllerAdvancedConfiguration *)v7 setSceneWorkspace:0];
    [(_UISceneHostingControllerAdvancedConfiguration *)v7 setSceneIdentifier:0];
  }

  return v7;
}

- (void)setSceneSpecification:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    id v5 = (UIApplicationSceneSpecification *)v4;
  }
  else
  {
    id v5 = +[FBSSceneSpecification specification];
  }
  sceneSpecification = self->_sceneSpecification;
  self->_sceneSpecification = v5;
}

- (void)setSceneWorkspace:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    id v5 = (FBSceneWorkspace *)v4;
    sceneWorkspace = self->_sceneWorkspace;
    self->_sceneWorkspace = v5;
  }
  else
  {
    sceneWorkspace = [(id)UIApp _sceneHostingWorkspaceController];
    id v7 = [sceneWorkspace sceneWorkspace];
    v8 = self->_sceneWorkspace;
    self->_sceneWorkspace = v7;
  }
}

- (void)setSceneIdentifier:(id)a3
{
  id v4 = a3;
  id v14 = v4;
  if (v4)
  {
    id v5 = (NSString *)v4;
    sceneIdentifier = self->_sceneIdentifier;
    self->_sceneIdentifier = v5;
  }
  else
  {
    sceneIdentifier = [(RBSProcessIdentity *)self->_processIdentity embeddedApplicationIdentifier];
    if (sceneIdentifier
      || ([(RBSProcessIdentity *)self->_processIdentity xpcServiceIdentifier],
          (sceneIdentifier = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v7 = NSString;
      v8 = [MEMORY[0x1E4F29128] UUID];
      id v9 = [v8 UUIDString];
      v10 = [v7 stringWithFormat:@"UIHostedScene-%@-%@", sceneIdentifier, v9];
      v11 = self->_sceneIdentifier;
      self->_sceneIdentifier = v10;
    }
    else
    {
      v12 = NSString;
      sceneIdentifier = [MEMORY[0x1E4F29128] UUID];
      v8 = [sceneIdentifier UUIDString];
      v13 = [v12 stringWithFormat:@"UIHostedScene-%@", v8];
      id v9 = self->_sceneIdentifier;
      self->_sceneIdentifier = v13;
    }
  }
}

- (id)sceneHostingSpecification
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self->_sceneSpecification;
  }
  else {
    v3 = 0;
  }
  return v3;
}

- (UIApplicationSceneSpecification)sceneSpecification
{
  return self->_sceneSpecification;
}

- (NSOrderedSet)additionalExtensions
{
  return self->_additionalExtensions;
}

- (void)setAdditionalExtensions:(id)a3
{
}

- (RBSProcessIdentity)processIdentity
{
  return self->_processIdentity;
}

- (id)initialSettingsUpdater
{
  return self->_initialSettingsUpdater;
}

- (void)setInitialSettingsUpdater:(id)a3
{
}

- (id)initialClientSettingsUpdater
{
  return self->_initialClientSettingsUpdater;
}

- (void)setInitialClientSettingsUpdater:(id)a3
{
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (FBSceneWorkspace)sceneWorkspace
{
  return self->_sceneWorkspace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneWorkspace, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong(&self->_initialClientSettingsUpdater, 0);
  objc_storeStrong(&self->_initialSettingsUpdater, 0);
  objc_storeStrong((id *)&self->_processIdentity, 0);
  objc_storeStrong((id *)&self->_additionalExtensions, 0);
  objc_storeStrong((id *)&self->_sceneSpecification, 0);
}

@end