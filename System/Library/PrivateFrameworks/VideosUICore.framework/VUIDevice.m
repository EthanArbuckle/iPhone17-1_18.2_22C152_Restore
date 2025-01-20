@interface VUIDevice
+ (BOOL)isMac;
+ (BOOL)isPad;
+ (BOOL)isPhone;
+ (BOOL)isTV;
+ (BOOL)isVision;
+ (BOOL)supportsDeepColor;
+ (BOOL)supportsStageManager;
+ (NSString)guid;
+ (NSString)model;
+ (NSString)name;
+ (NSString)systemName;
+ (NSString)systemVersion;
+ (int64_t)userInterfaceIdiom;
+ (void)enablePortraitLock:(BOOL)a3;
@end

@implementation VUIDevice

+ (BOOL)isVision
{
  return 0;
}

+ (BOOL)isPad
{
  return [a1 userInterfaceIdiom] == 1;
}

+ (BOOL)isMac
{
  return [a1 userInterfaceIdiom] == 5;
}

+ (BOOL)isTV
{
  return [a1 userInterfaceIdiom] == 2;
}

+ (int64_t)userInterfaceIdiom
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  int64_t v3 = [v2 userInterfaceIdiom];

  return v3;
}

+ (BOOL)isPhone
{
  return [a1 userInterfaceIdiom] == 0;
}

+ (NSString)systemVersion
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  int64_t v3 = [v2 systemVersion];

  return (NSString *)v3;
}

+ (NSString)model
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  int64_t v3 = [v2 model];

  return (NSString *)v3;
}

+ (NSString)name
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  int64_t v3 = [v2 name];

  return (NSString *)v3;
}

+ (NSString)systemName
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  int64_t v3 = [v2 systemName];

  return (NSString *)v3;
}

+ (BOOL)supportsDeepColor
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  char v3 = [v2 _supportsDeepColor];

  return v3;
}

+ (BOOL)supportsStageManager
{
  if (supportsStageManager_onceToken != -1) {
    dispatch_once(&supportsStageManager_onceToken, &__block_literal_global_15);
  }
  return supportsStageManager_supportsStageManager;
}

uint64_t __33__VUIDevice_supportsStageManager__block_invoke()
{
  if (MGGetBoolAnswer()) {
    uint64_t result = 1;
  }
  else {
    uint64_t result = MGGetBoolAnswer();
  }
  supportsStageManager_supportsStageManager = result;
  return result;
}

+ (void)enablePortraitLock:(BOOL)a3
{
  if (a3)
  {
    char v3 = [MEMORY[0x1E4F42948] currentDevice];
    _orientationBeforePortraitLock = [v3 orientation];

    id v5 = [MEMORY[0x1E4F42948] currentDevice];
    [v5 setOrientation:1];
  }
  else if (_orientationBeforePortraitLock)
  {
    v4 = [MEMORY[0x1E4F42948] currentDevice];
    [v4 setOrientation:_orientationBeforePortraitLock];

    _orientationBeforePortraitLock = 0;
  }
}

+ (NSString)guid
{
  if (guid_sOnceToken != -1) {
    dispatch_once(&guid_sOnceToken, &__block_literal_global_9);
  }
  v2 = (void *)guid_vuiGuid;
  return (NSString *)v2;
}

uint64_t __17__VUIDevice_guid__block_invoke()
{
  uint64_t v0 = +[VUIMobileGestaltLookup stringValueForKey:@"UniqueDeviceID"];
  uint64_t v1 = guid_vuiGuid;
  guid_vuiGuid = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end