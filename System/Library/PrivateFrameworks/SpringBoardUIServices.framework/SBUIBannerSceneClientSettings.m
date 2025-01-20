@interface SBUIBannerSceneClientSettings
- (NSString)transitionDismissalPreventionReason;
- (NSString)wantsDefaultGesturePriorityReason;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
@end

@implementation SBUIBannerSceneClientSettings

- (NSString)transitionDismissalPreventionReason
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1001];

  return (NSString *)v3;
}

- (NSString)wantsDefaultGesturePriorityReason
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1002];

  return (NSString *)v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [SBUIMutableBannerSceneClientSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBUIBannerSceneClientSettings;
  v4 = -[BNSceneClientSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
  if (a3 - 1000 <= 2)
  {
    v5 = off_1E5CCE528[a3 - 1000];

    v4 = v5;
  }
  return v4;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBUIBannerSceneClientSettings;
  v9 = [(BNSceneClientSettings *)&v12 valueDescriptionForFlag:a3 object:v8 ofSetting:a5];
  if (a5 - 1000 <= 2)
  {
    id v10 = v8;

    v9 = v10;
  }

  return v9;
}

@end