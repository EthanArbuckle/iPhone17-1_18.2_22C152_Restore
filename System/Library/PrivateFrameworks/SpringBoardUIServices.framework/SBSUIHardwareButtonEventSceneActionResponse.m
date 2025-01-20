@interface SBSUIHardwareButtonEventSceneActionResponse
- (SBSUIHardwareButtonEventSceneActionResponse)initWithButtonEventHandlingResult:(int64_t)a3 error:(id)a4;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (int64_t)buttonEventHandlingResult;
@end

@implementation SBSUIHardwareButtonEventSceneActionResponse

- (SBSUIHardwareButtonEventSceneActionResponse)initWithButtonEventHandlingResult:(int64_t)a3 error:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  v9 = [NSNumber numberWithInteger:a3];
  [v8 setObject:v9 forSetting:2];

  v12.receiver = self;
  v12.super_class = (Class)SBSUIHardwareButtonEventSceneActionResponse;
  v10 = [(SBSUIHardwareButtonEventSceneActionResponse *)&v12 initWithInfo:v8 error:v7];

  return v10;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 2) {
    return @"buttonEventHandlingResult";
  }
  else {
    return 0;
  }
}

- (int64_t)buttonEventHandlingResult
{
  v2 = [(SBSUIHardwareButtonEventSceneActionResponse *)self info];
  v3 = [v2 objectForSetting:2];
  int64_t v4 = [v3 integerValue];

  return v4;
}

@end