@interface SBSUIInCallSceneSettings
- (BOOL)isAttachedToWindowedAccessory;
- (BOOL)isBeingShownAboveCoverSheet;
- (BOOL)isScreenSharingPresentation;
- (BOOL)systemControlsShouldPresentAsEmbedded;
- (CGRect)windowedAccessoryCutoutFrameInScreen;
- (NSUUID)requestedPresentationConfigurationIdentifier;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)inCallPresentationMode;
@end

@implementation SBSUIInCallSceneSettings

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [SBSUIMutableInCallSceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (int64_t)inCallPresentationMode
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3001];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (BOOL)isAttachedToWindowedAccessory
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3002];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (CGRect)windowedAccessoryCutoutFrameInScreen
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3003];
  [v3 CGRectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)isScreenSharingPresentation
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3004];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)systemControlsShouldPresentAsEmbedded
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3005];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isBeingShownAboveCoverSheet
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3006];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSUUID)requestedPresentationConfigurationIdentifier
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3007];

  return (NSUUID *)v3;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 3001 > 6)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBSUIInCallSceneSettings;
    -[FBSSettings keyDescriptionForSetting:](&v5, sel_keyDescriptionForSetting_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5CCEC70[a3 - 3001];
  }
  return v3;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  if (a5 - 3001 > 6)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBSUIInCallSceneSettings;
    objc_super v5 = -[FBSSettings valueDescriptionForFlag:object:ofSetting:](&v7, sel_valueDescriptionForFlag_object_ofSetting_, a3, a4);
  }
  else
  {
    objc_super v5 = SBSUIInCallSceneClientSettingValueDescription_0(a5, a4);
  }
  return v5;
}

@end