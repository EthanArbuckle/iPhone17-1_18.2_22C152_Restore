@interface SBSUIStarkNotificationsSceneSettings
- (BOOL)isConnectedWirelessly;
- (BOOL)isGeoSupported;
- (BSServiceConnectionEndpoint)openServiceEndpoint;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (unint64_t)suspensionReasons;
@end

@implementation SBSUIStarkNotificationsSceneSettings

- (BOOL)isConnectedWirelessly
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:2998744415];

  return v3;
}

- (BOOL)isGeoSupported
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:2998744418];

  return v3;
}

- (unint64_t)suspensionReasons
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:2998744416];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  unint64_t v8 = [v7 unsignedIntegerValue];
  return v8;
}

- (BSServiceConnectionEndpoint)openServiceEndpoint
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 objectForSetting:2998744417];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  return (BSServiceConnectionEndpoint *)v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [SBSUIMutableStarkNotificationsSceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 2998744415u > 3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBSUIStarkNotificationsSceneSettings;
    -[FBSSettings keyDescriptionForSetting:](&v5, sel_keyDescriptionForSetting_);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5CCE818[a3 - 2998744415u];
  }
  return v3;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8 = a4;
  v9 = SBSUIStarkNotificationsSceneSettingValueDescription(a5, a3, v8);
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBSUIStarkNotificationsSceneSettings;
    id v11 = [(FBSSettings *)&v14 valueDescriptionForFlag:a3 object:v8 ofSetting:a5];
  }
  v12 = v11;

  return v12;
}

@end