@interface SBSUIHandleDeviceLockSceneActionResponse
- (SBSUIHandleDeviceLockSceneActionResponse)initWithDeviceLockHandlingResult:(int64_t)a3 error:(id)a4;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (int64_t)deviceLockHandlingResult;
@end

@implementation SBSUIHandleDeviceLockSceneActionResponse

- (SBSUIHandleDeviceLockSceneActionResponse)initWithDeviceLockHandlingResult:(int64_t)a3 error:(id)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v7 = a4;
  id v8 = objc_alloc_init(v6);
  v9 = [NSNumber numberWithInteger:a3];
  [v8 setObject:v9 forSetting:2];

  v12.receiver = self;
  v12.super_class = (Class)SBSUIHandleDeviceLockSceneActionResponse;
  v10 = [(SBSUIHandleDeviceLockSceneActionResponse *)&v12 initWithInfo:v8 error:v7];

  return v10;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 2) {
    return @"deviceLockHandlingResult";
  }
  else {
    return 0;
  }
}

- (int64_t)deviceLockHandlingResult
{
  v2 = [(SBSUIHandleDeviceLockSceneActionResponse *)self info];
  v3 = [v2 objectForSetting:2];
  int64_t v4 = [v3 integerValue];

  return v4;
}

@end