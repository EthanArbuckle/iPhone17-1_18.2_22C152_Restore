@interface SBLaunchImageOverridesContext
- (BOOL)ignoreSnapshots;
- (NSString)launchImageName;
- (NSString)sceneID;
- (NSURL)url;
- (SBActivationSettings)activationSettings;
- (SBLaunchImageOverridesContext)initWithSceneID:(id)a3 activationSettings:(id)a4;
@end

@implementation SBLaunchImageOverridesContext

- (SBLaunchImageOverridesContext)initWithSceneID:(id)a3 activationSettings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBLaunchImageOverridesContext;
  v9 = [(SBLaunchImageOverridesContext *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sceneID, a3);
    objc_storeStrong((id *)&v10->_settings, a4);
    BOOL v11 = [(SBActivationSettings *)v10->_settings BOOLForActivationSetting:41];
    v10->_ignoreSnapshots = v11 | [(SBActivationSettings *)v10->_settings BOOLForActivationSetting:53];
    uint64_t v12 = [(SBActivationSettings *)v10->_settings objectForActivationSetting:17];
    launchImageName = v10->_launchImageName;
    v10->_launchImageName = (NSString *)v12;

    uint64_t v14 = [(SBActivationSettings *)v10->_settings objectForActivationSetting:5];
    url = v10->_url;
    v10->_url = (NSURL *)v14;
  }
  return v10;
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (SBActivationSettings)activationSettings
{
  return self->_settings;
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)ignoreSnapshots
{
  return self->_ignoreSnapshots;
}

- (NSString)launchImageName
{
  return self->_launchImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_launchImageName, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
}

@end