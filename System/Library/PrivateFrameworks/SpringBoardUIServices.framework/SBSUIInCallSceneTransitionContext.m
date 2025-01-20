@interface SBSUIInCallSceneTransitionContext
- (NSString)analyticsSource;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (void)setAnalyticsSource:(id)a3;
@end

@implementation SBSUIInCallSceneTransitionContext

- (NSString)analyticsSource
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:2000];

  return (NSString *)v3;
}

- (void)setAnalyticsSource:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:2000];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 2000)
  {
    id v5 = @"analyticsSource";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)SBSUIInCallSceneTransitionContext;
    -[FBSSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8 = a4;
  uint64_t v9 = v8;
  if (a5 == 2000)
  {
    id v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBSUIInCallSceneTransitionContext;
    id v10 = [(FBSSettings *)&v13 valueDescriptionForFlag:a3 object:v8 ofSetting:a5];
  }
  v11 = v10;

  return v11;
}

@end