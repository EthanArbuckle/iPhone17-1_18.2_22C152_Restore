@interface SBSUIStarkNotificationsSceneClientSettings
- (BOOL)isDisplayingNotification;
- (BOOL)shouldBorrowScreen;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
@end

@implementation SBSUIStarkNotificationsSceneClientSettings

- (BOOL)isDisplayingNotification
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:2998744415];

  return v3;
}

- (BOOL)shouldBorrowScreen
{
  v2 = [(FBSSettings *)self otherSettings];
  char v3 = [v2 BOOLForSetting:2998744416];

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [SBSUIMutableStarkNotificationsSceneClientSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 2998744416) {
    v5 = @"shouldBorrowScreen";
  }
  else {
    v5 = 0;
  }
  if (a3 == 2998744415) {
    v6 = @"displayingNotification";
  }
  else {
    v6 = v5;
  }
  v7 = v6;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBSUIStarkNotificationsSceneClientSettings;
    v9 = [(FBSSettings *)&v12 keyDescriptionForSetting:a3];
  }
  v10 = v9;

  return v10;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8 = a4;
  v9 = SBSUIStarkNotificationsSceneClientSettingValueDescription(a5);
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SBSUIStarkNotificationsSceneClientSettings;
    id v11 = [(FBSSettings *)&v14 valueDescriptionForFlag:a3 object:v8 ofSetting:a5];
  }
  objc_super v12 = v11;

  return v12;
}

@end