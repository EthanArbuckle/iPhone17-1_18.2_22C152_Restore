@interface SPUILegibilitySceneSettings
- (_UILegibilitySettings)legibilitySettings;
- (id)keyDescriptionForSetting:(int64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(int64_t)a5;
@end

@implementation SPUILegibilitySceneSettings

- (_UILegibilitySettings)legibilitySettings
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2000];

  return (_UILegibilitySettings *)v3;
}

- (id)keyDescriptionForSetting:(int64_t)a3
{
  if (a3 == 2000)
  {
    v5 = @"legibilitySettings";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)SPUILegibilitySceneSettings;
    -[FBSSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(int64_t)a5
{
  if (a5 == 2000)
  {
    objc_super v7 = 0;
  }
  else
  {
    uint64_t v10 = v5;
    uint64_t v11 = v6;
    v9.receiver = self;
    v9.super_class = (Class)SPUILegibilitySceneSettings;
    objc_super v7 = -[FBSSettings valueDescriptionForFlag:object:ofSetting:](&v9, sel_valueDescriptionForFlag_object_ofSetting_, a3, a4);
  }
  return v7;
}

@end