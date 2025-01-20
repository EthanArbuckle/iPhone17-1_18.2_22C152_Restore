@interface SBSUIMutableInCallSceneSettings
- (BOOL)isAttachedToWindowedAccessory;
- (BOOL)isBeingShownAboveCoverSheet;
- (BOOL)isScreenSharingPresentation;
- (BOOL)systemControlsShouldPresentAsEmbedded;
- (CGRect)windowedAccessoryCutoutFrameInScreen;
- (NSUUID)requestedPresentationConfigurationIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)inCallPresentationMode;
- (void)setAttachedToWindowedAccessory:(BOOL)a3;
- (void)setBeingShownAboveCoverSheet:(BOOL)a3;
- (void)setDeactivationReasons:(unint64_t)a3;
- (void)setInCallPresentationMode:(int64_t)a3;
- (void)setRequestedPresentationConfigurationIdentifier:(id)a3;
- (void)setScreenSharingPresentation:(BOOL)a3;
- (void)setSystemControlsShouldPresentAsEmbedded:(BOOL)a3;
- (void)setWindowedAccessoryCutoutFrameInScreen:(CGRect)a3;
@end

@implementation SBSUIMutableInCallSceneSettings

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SBSUIInCallSceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (void)setInCallPresentationMode:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:3001];
}

- (BOOL)isAttachedToWindowedAccessory
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:3002];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setAttachedToWindowedAccessory:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  char v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:3002];
}

- (CGRect)windowedAccessoryCutoutFrameInScreen
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:3003];
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

- (void)setWindowedAccessoryCutoutFrameInScreen:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(FBSSettings *)self otherSettings];
  double v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
  [v8 setObject:v7 forSetting:3003];
}

- (void)setScreenSharingPresentation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:3004];
}

- (BOOL)systemControlsShouldPresentAsEmbedded
{
  v2 = [(FBSSettings *)self otherSettings];
  BOOL v3 = [v2 objectForSetting:3005];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setSystemControlsShouldPresentAsEmbedded:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  char v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forSetting:3005];
}

- (void)setBeingShownAboveCoverSheet:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  double v6 = [NSNumber numberWithBool:v3];
  [v5 setObject:v6 forSetting:3006];

  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBSUIMutableInCallSceneSettings;
    [(SBSUIMutableInCallSceneSettings *)&v7 setDeactivationReasons:[(SBSUIMutableInCallSceneSettings *)self deactivationReasons] & 0xFFFFFFFFFFFFFFFDLL];
  }
}

- (void)setDeactivationReasons:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  double v6 = [v5 objectForSetting:3006];
  int v7 = [v6 BOOLValue];

  if (v7) {
    unint64_t v8 = a3 & 0xFFFFFFFFFFFFFFFDLL;
  }
  else {
    unint64_t v8 = a3;
  }
  v9.receiver = self;
  v9.super_class = (Class)SBSUIMutableInCallSceneSettings;
  [(SBSUIMutableInCallSceneSettings *)&v9 setDeactivationReasons:v8];
}

- (void)setRequestedPresentationConfigurationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSSettings *)self otherSettings];
  [v5 setObject:v4 forSetting:3007];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 3001 > 6)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBSUIMutableInCallSceneSettings;
    -[FBSSettings keyDescriptionForSetting:](&v5, sel_keyDescriptionForSetting_);
    BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v3 = off_1E5CCEC70[a3 - 3001];
  }
  return v3;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  if (a5 - 3001 > 6)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBSUIMutableInCallSceneSettings;
    objc_super v5 = -[FBSSettings valueDescriptionForFlag:object:ofSetting:](&v7, sel_valueDescriptionForFlag_object_ofSetting_, a3, a4);
  }
  else
  {
    objc_super v5 = SBSUIInCallSceneClientSettingValueDescription_0(a5, a4);
  }
  return v5;
}

- (int64_t)inCallPresentationMode
{
  return self->_inCallPresentationMode;
}

- (BOOL)isScreenSharingPresentation
{
  return self->_screenSharingPresentation;
}

- (NSUUID)requestedPresentationConfigurationIdentifier
{
  return self->_requestedPresentationConfigurationIdentifier;
}

- (BOOL)isBeingShownAboveCoverSheet
{
  return self->_beingShownAboveCoverSheet;
}

- (void).cxx_destruct
{
}

@end