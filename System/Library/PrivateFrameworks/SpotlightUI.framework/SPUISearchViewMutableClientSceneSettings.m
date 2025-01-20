@interface SPUISearchViewMutableClientSceneSettings
- (BOOL)isKeyboardPresented;
- (CGSize)dockedSearchBarSize;
- (CGSize)searchBarSize;
- (double)distanceToTopOfIcons;
- (double)keyboardHeight;
- (double)keyboardProtectorHeight;
- (double)searchBarCornerRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyDescriptionForSetting:(int64_t)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(int64_t)a5;
- (unint64_t)searchHeaderBackgroundLayerRenderID;
- (unint64_t)searchHeaderBlurLayerRenderID;
- (unint64_t)searchHeaderLayerRenderID;
- (unsigned)searchHeaderBackgroundContextID;
- (unsigned)searchHeaderBlurContextID;
- (unsigned)searchHeaderContextID;
- (void)setDistanceToTopOfIcons:(double)a3;
- (void)setDockedSearchBarSize:(CGSize)a3;
- (void)setKeyboardHeight:(double)a3;
- (void)setKeyboardPresented:(BOOL)a3;
- (void)setKeyboardProtectorHeight:(double)a3;
- (void)setSearchBarCornerRadius:(double)a3;
- (void)setSearchBarSize:(CGSize)a3;
- (void)setSearchHeaderBackgroundContextID:(unsigned int)a3;
- (void)setSearchHeaderBackgroundLayerRenderID:(unint64_t)a3;
- (void)setSearchHeaderBlurContextID:(unsigned int)a3;
- (void)setSearchHeaderBlurLayerRenderID:(unint64_t)a3;
- (void)setSearchHeaderContextID:(unsigned int)a3;
- (void)setSearchHeaderLayerRenderID:(unint64_t)a3;
@end

@implementation SPUISearchViewMutableClientSceneSettings

- (void)setDistanceToTopOfIcons:(double)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forSetting:1000];
}

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

- (void)setSearchHeaderLayerRenderID:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  double v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [v5 setObject:v4 forSetting:1001];
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

- (void)setSearchHeaderContextID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(FBSSettings *)self otherSettings];
  unint64_t v4 = [NSNumber numberWithUnsignedInt:v3];
  [v5 setObject:v4 forSetting:1002];
}

- (unsigned)searchHeaderContextID
{
  v2 = [(FBSSettings *)self otherSettings];
  uint64_t v3 = [v2 objectForSetting:1002];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v4 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (void)setSearchHeaderBackgroundContextID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(FBSSettings *)self otherSettings];
  unsigned int v4 = [NSNumber numberWithUnsignedInt:v3];
  [v5 setObject:v4 forSetting:1004];
}

- (void)setSearchHeaderBackgroundLayerRenderID:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  unsigned int v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [v5 setObject:v4 forSetting:1003];
}

- (unint64_t)searchHeaderBackgroundLayerRenderID
{
  v2 = [(FBSSettings *)self otherSettings];
  uint64_t v3 = [v2 objectForSetting:1003];

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
  uint64_t v3 = [v2 objectForSetting:1004];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v4 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (void)setKeyboardHeight:(double)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  unsigned int v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forSetting:1005];
}

- (double)keyboardHeight
{
  v2 = [(FBSSettings *)self otherSettings];
  uint64_t v3 = [v2 objectForSetting:1005];

  objc_opt_class();
  double v4 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
}

- (void)setKeyboardProtectorHeight:(double)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forSetting:1006];
}

- (double)keyboardProtectorHeight
{
  v2 = [(FBSSettings *)self otherSettings];
  uint64_t v3 = [v2 objectForSetting:1006];

  objc_opt_class();
  double v4 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v3 doubleValue];
    double v4 = v5;
  }

  return v4;
}

- (void)setKeyboardPresented:(BOOL)a3
{
  id v3 = [(FBSSettings *)self otherSettings];
  [v3 setFlag:BSSettingFlagForBool() forSetting:1007];
}

- (BOOL)isKeyboardPresented
{
  v2 = [(FBSSettings *)self otherSettings];
  [v2 flagForSetting:1007];
  char IsYes = BSSettingFlagIsYes();

  return IsYes;
}

- (void)setSearchBarSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v5 = [(FBSSettings *)self otherSettings];
  *(CGFloat *)v7 = width;
  *(CGFloat *)&v7[1] = height;
  v6 = [MEMORY[0x263F08D40] valueWithBytes:v7 objCType:"{CGSize=dd}"];
  [v5 setObject:v6 forSetting:1008];
}

- (CGSize)searchBarSize
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:1008];

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
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)setDockedSearchBarSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v5 = [(FBSSettings *)self otherSettings];
  *(CGFloat *)double v7 = width;
  *(CGFloat *)&v7[1] = height;
  double v6 = [MEMORY[0x263F08D40] valueWithBytes:v7 objCType:"{CGSize=dd}"];
  [v5 setObject:v6 forSetting:1009];
}

- (CGSize)dockedSearchBarSize
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:1009];

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
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)setSearchBarCornerRadius:(double)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  double v4 = [NSNumber numberWithDouble:a3];
  [v5 setObject:v4 forSetting:1010];
}

- (double)searchBarCornerRadius
{
  v2 = [(FBSSettings *)self otherSettings];
  id v3 = [v2 objectForSetting:1010];

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
  id v3 = [v2 objectForSetting:1011];

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
  id v3 = [v2 objectForSetting:1012];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v4 = [v3 unsignedIntValue];
  }
  else {
    unsigned int v4 = 0;
  }

  return v4;
}

- (void)setSearchHeaderBlurLayerRenderID:(unint64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  unsigned int v4 = [NSNumber numberWithUnsignedLongLong:a3];
  [v5 setObject:v4 forSetting:1011];
}

- (void)setSearchHeaderBlurContextID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(FBSSettings *)self otherSettings];
  unsigned int v4 = [NSNumber numberWithUnsignedInt:v3];
  [v5 setObject:v4 forSetting:1012];
}

- (id)copyWithZone:(_NSZone *)a3
{
  unsigned int v4 = [SPUISearchViewClientSceneSettings alloc];
  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(int64_t)a3
{
  if ((unint64_t)(a3 - 1000) > 0xC)
  {
    v5.receiver = self;
    v5.super_class = (Class)SPUISearchViewMutableClientSceneSettings;
    uint64_t v3 = -[FBSSettings keyDescriptionForSetting:](&v5, sel_keyDescriptionForSetting_);
  }
  else
  {
    uint64_t v3 = SPUISearchViewSceneClientSettingsKeyDescription(a3);
  }
  return v3;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(int64_t)a5
{
  if ((unint64_t)(a5 - 1000) > 0xC)
  {
    v7.receiver = self;
    v7.super_class = (Class)SPUISearchViewMutableClientSceneSettings;
    objc_super v5 = -[FBSSettings valueDescriptionForFlag:object:ofSetting:](&v7, sel_valueDescriptionForFlag_object_ofSetting_, a3, a4);
  }
  else
  {
    objc_super v5 = SPUISearchViewClientSceneSettingsValueDescription(a5, a3, a4);
  }
  return v5;
}

@end