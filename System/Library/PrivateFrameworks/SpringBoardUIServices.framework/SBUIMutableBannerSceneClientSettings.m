@interface SBUIMutableBannerSceneClientSettings
- (NSString)transitionDismissalPreventionReason;
- (NSString)wantsDefaultGesturePriorityReason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (void)setTransitionDismissalPreventionReason:(id)a3;
- (void)setWantsDefaultGesturePriorityReason:(id)a3;
@end

@implementation SBUIMutableBannerSceneClientSettings

- (NSString)transitionDismissalPreventionReason
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1001];

  return (NSString *)v3;
}

- (void)setTransitionDismissalPreventionReason:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:1001];
}

- (NSString)wantsDefaultGesturePriorityReason
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1002];

  return (NSString *)v3;
}

- (void)setWantsDefaultGesturePriorityReason:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:1002];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SBUIBannerSceneClientSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBUIMutableBannerSceneClientSettings;
  id v4 = -[BNMutableSceneClientSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
  if (a3 - 1000 <= 2)
  {
    id v5 = off_1E5CCE528[a3 - 1000];

    id v4 = v5;
  }
  return v4;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBUIMutableBannerSceneClientSettings;
  v9 = [(BNMutableSceneClientSettings *)&v12 valueDescriptionForFlag:a3 object:v8 ofSetting:a5];
  if (a5 - 1000 <= 2)
  {
    id v10 = v8;

    v9 = v10;
  }

  return v9;
}

@end