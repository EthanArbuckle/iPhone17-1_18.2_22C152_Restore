@interface PPLMutablePeopleEntitySceneSettings
- (NSURL)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (void)setUrl:(id)a3;
@end

@implementation PPLMutablePeopleEntitySceneSettings

- (NSURL)url
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:9000];

  return (NSURL *)v3;
}

- (void)setUrl:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:9000];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [PPLPeopleEntitySceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 9000)
  {
    id v5 = @"URL";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)PPLMutablePeopleEntitySceneSettings;
    -[FBSSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  if (a5 == 9000)
  {
    id v5 = PPLPeopleEntitySceneSettingValueDescription(9000, a4);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PPLMutablePeopleEntitySceneSettings;
    id v5 = -[FBSSettings valueDescriptionForFlag:object:ofSetting:](&v7, sel_valueDescriptionForFlag_object_ofSetting_, a3, a4);
  }
  return v5;
}

@end