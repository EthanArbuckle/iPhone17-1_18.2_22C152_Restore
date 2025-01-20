@interface UVMutablePreviewSceneSettings
- (CGSize)previewMaximumSize;
- (id)copyWithZone:(_NSZone *)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (id)makeCopy;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5;
- (int64_t)previewSceneLayout;
- (void)setPreviewMaximumSize:(CGSize)a3;
- (void)setPreviewSceneLayout:(int64_t)a3;
@end

@implementation UVMutablePreviewSceneSettings

- (CGSize)previewMaximumSize
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1100101];
  [v3 CGSizeValue];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setPreviewMaximumSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v5 = [(FBSSettings *)self otherSettings];
  *(CGFloat *)double v7 = width;
  *(CGFloat *)&v7[1] = height;
  double v6 = [MEMORY[0x263F08D40] valueWithBytes:v7 objCType:"{CGSize=dd}"];
  [v5 setObject:v6 forSetting:1100101];
}

- (int64_t)previewSceneLayout
{
  v2 = [(FBSSettings *)self otherSettings];
  v3 = [v2 objectForSetting:1100102];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setPreviewSceneLayout:(int64_t)a3
{
  id v5 = [(FBSSettings *)self otherSettings];
  int64_t v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forSetting:1100102];
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = [UVPreviewSceneSettings alloc];

  return [(FBSSettings *)v4 initWithSettings:self];
}

- (id)makeCopy
{
  v2 = (void *)[(UVMutablePreviewSceneSettings *)self copy];

  return v2;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  int64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 initWithSettings:self];
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1100102) {
    id v5 = @"previewSceneLayout";
  }
  else {
    id v5 = 0;
  }
  if (a3 == 1100101) {
    double v6 = @"previewMaximumSize";
  }
  else {
    double v6 = v5;
  }
  double v7 = v6;
  double v8 = v7;
  if (v7)
  {
    double v9 = v7;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UVMutablePreviewSceneSettings;
    double v9 = [(FBSSettings *)&v12 keyDescriptionForSetting:a3];
  }
  v10 = v9;

  return v10;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8 = a4;
  double v9 = _PreviewSceneSettingValueDescription(a5, v8);
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)UVMutablePreviewSceneSettings;
    id v11 = [(FBSSettings *)&v14 valueDescriptionForFlag:a3 object:v8 ofSetting:a5];
  }
  objc_super v12 = v11;

  return v12;
}

@end