@interface SPUISearchViewClientSceneSettings
- (BOOL)isKeyboardPresented;
- (CGSize)dockedSearchBarSize;
- (CGSize)searchBarSize;
- (double)distanceToTopOfIcons;
- (double)keyboardHeight;
- (double)keyboardProtectorHeight;
- (double)searchBarCornerRadius;
- (id)keyDescriptionForSetting:(int64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(int64_t)a5;
- (unint64_t)searchHeaderBackgroundLayerRenderID;
- (unint64_t)searchHeaderBlurLayerRenderID;
- (unint64_t)searchHeaderLayerRenderID;
- (unsigned)searchHeaderBackgroundContextID;
- (unsigned)searchHeaderBlurContextID;
- (unsigned)searchHeaderContextID;
@end

@implementation SPUISearchViewClientSceneSettings

- (double)distanceToTopOfIcons
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1000];

  objc_opt_class();
  double v4 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
}

- (unint64_t)searchHeaderLayerRenderID
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1001];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = [v3 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unsigned)searchHeaderContextID
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1002];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v4 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (unint64_t)searchHeaderBackgroundLayerRenderID
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1003];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = [v3 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unsigned)searchHeaderBackgroundContextID
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1004];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v4 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (double)keyboardHeight
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1005];

  objc_opt_class();
  double v4 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
}

- (double)keyboardProtectorHeight
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1006];

  objc_opt_class();
  double v4 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
}

- (BOOL)isKeyboardPresented
{
  v2 = [(FBSSettings *)self otherSettings];
  [v2 flagForSetting:1007];
  char IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (CGSize)searchBarSize
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1008];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 CGSizeValue];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x263F001B0];
    double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)dockedSearchBarSize
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1009];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 CGSizeValue];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x263F001B0];
    double v7 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)searchBarCornerRadius
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1010];

  objc_opt_class();
  double v4 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
}

- (unint64_t)searchHeaderBlurLayerRenderID
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1011];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = [v3 unsignedLongLongValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (unsigned)searchHeaderBlurContextID
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1012];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v4 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unsigned int v4 = [SPUISearchViewMutableClientSceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(int64_t)a3
{
  if ((unint64_t)(a3 - 1000) > 0xC)
  {
    v5.receiver = self;
    v5.super_class = (Class)SPUISearchViewClientSceneSettings;
    v3 = -[FBSSettings keyDescriptionForSetting:](&v5, sel_keyDescriptionForSetting_);
  }
  else
  {
    v3 = SPUISearchViewSceneClientSettingsKeyDescription(a3);
  }
  return v3;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(int64_t)a5
{
  if ((unint64_t)(a5 - 1000) > 0xC)
  {
    v7.receiver = self;
    v7.super_class = (Class)SPUISearchViewClientSceneSettings;
    objc_super v5 = -[FBSSettings valueDescriptionForFlag:object:ofSetting:](&v7, sel_valueDescriptionForFlag_object_ofSetting_, a3, a4);
  }
  else
  {
    objc_super v5 = SPUISearchViewClientSceneSettingsValueDescription(a5, a3, a4);
  }
  return v5;
}

@end