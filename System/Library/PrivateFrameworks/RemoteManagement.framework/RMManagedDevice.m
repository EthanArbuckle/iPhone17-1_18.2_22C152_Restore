@interface RMManagedDevice
+ (RMManagedDevice)currentManagedDevice;
- (BOOL)isMDMEnrolled;
- (BOOL)isSharediPad;
- (BOOL)isSupervised;
- (NSString)mdmProfileIdentifier;
- (id)getPropertyForKey:(id)a3 scope:(int64_t)a4;
- (void)refreshState;
- (void)setProperty:(id)a3 forKey:(id)a4 scope:(int64_t)a5;
@end

@implementation RMManagedDevice

+ (RMManagedDevice)currentManagedDevice
{
  if (currentManagedDevice_onceToken != -1) {
    dispatch_once(&currentManagedDevice_onceToken, &__block_literal_global_5_0);
  }
  v2 = (void *)currentManagedDevice_currentManagedDevice;

  return (RMManagedDevice *)v2;
}

uint64_t __39__RMManagedDevice_currentManagedDevice__block_invoke()
{
  currentManagedDevice_currentManagedDevice = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (BOOL)isSupervised
{
  v2 = [MEMORY[0x263F52808] sharedConfiguration];
  [v2 refreshDetailsFromDisk];
  char v3 = [v2 isSupervised];

  return v3;
}

- (BOOL)isMDMEnrolled
{
  v2 = [MEMORY[0x263F52810] sharedConfiguration];
  [v2 refreshDetailsFromDisk];
  char v3 = [v2 memberQueueManagingProfileIdentifier];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSString)mdmProfileIdentifier
{
  v2 = [MEMORY[0x263F52810] sharedConfiguration];
  [v2 refreshDetailsFromDisk];
  char v3 = [v2 memberQueueManagingProfileIdentifier];

  return (NSString *)v3;
}

- (BOOL)isSharediPad
{
  return [MEMORY[0x263F38BA0] isSharediPad];
}

- (void)refreshState
{
  id v2 = [MEMORY[0x263F52810] sharedConfiguration];
  [v2 refreshDetailsFromDisk];
}

- (void)setProperty:(id)a3 forKey:(id)a4 scope:(int64_t)a5
{
  id v10 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F52810] sharedConfiguration];
  id v9 = (id)[v8 setPropertyForKey:v7 value:v10 channelType:a5 != 1];
}

- (id)getPropertyForKey:(id)a3 scope:(int64_t)a4
{
  v5 = (void *)MEMORY[0x263F52810];
  id v6 = a3;
  id v7 = [v5 sharedConfiguration];
  v8 = [v7 getPropertyForKey:v6 channelType:a4 != 1];

  return v8;
}

@end