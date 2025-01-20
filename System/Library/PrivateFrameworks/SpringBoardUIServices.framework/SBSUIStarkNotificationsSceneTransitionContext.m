@interface SBSUIStarkNotificationsSceneTransitionContext
- (BOOL)dismissNotification;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (void)setDismissNotification:(BOOL)a3;
@end

@implementation SBSUIStarkNotificationsSceneTransitionContext

- (BOOL)dismissNotification
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:2998744415];

  return v3;
}

- (void)setDismissNotification:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:2998744415];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 2998744415)
  {
    v5 = @"dismissNotification";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)SBSUIStarkNotificationsSceneTransitionContext;
    -[FBSSettings keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  if (a5 == 2998744415)
  {
    v5 = BSSettingFlagDescription();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBSUIStarkNotificationsSceneTransitionContext;
    v5 = -[FBSSettings valueDescriptionForFlag:object:ofSetting:](&v7, sel_valueDescriptionForFlag_object_ofSetting_, a3, a4);
  }
  return v5;
}

@end