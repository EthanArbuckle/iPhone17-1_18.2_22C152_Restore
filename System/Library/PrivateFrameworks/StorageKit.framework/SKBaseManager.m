@interface SKBaseManager
+ (id)defaultVisibleRoles;
+ (id)sharedManager;
- (BOOL)supportsCocoa;
- (SKBaseManager)init;
- (id)allDisks;
- (id)formatableFileSystems;
- (id)knownDiskForDictionary:(id)a3;
- (id)wholeDiskForDisk:(id)a3;
- (void)logEvent:(id)a3 eventPayloadBuilder:(id)a4;
@end

@implementation SKBaseManager

+ (id)sharedManager
{
  Class v2 = NSClassFromString(&cfstr_Skdaemonmanage.isa);
  if (!v2) {
    Class v2 = (Class)SKManager;
  }
  v3 = [(objc_class *)v2 sharedManager];

  return v3;
}

- (SKBaseManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKBaseManager;
  Class v2 = [(SKBaseManager *)&v5 init];
  v3 = objc_opt_new();
  +[SKAnalyticsHub addSink:v3];

  return v2;
}

- (id)allDisks
{
  Class v2 = [MEMORY[0x263EFF940] exceptionWithName:@"com.apple.storagekit.notimplemented" reason:@"A required method is not implemented" userInfo:0];
  [v2 raise];

  return 0;
}

+ (id)defaultVisibleRoles
{
  Class v2 = [MEMORY[0x263EFF940] exceptionWithName:@"com.apple.storagekit.notimplemented" reason:@"A required method is not implemented" userInfo:0];
  [v2 raise];

  return 0;
}

- (id)knownDiskForDictionary:(id)a3
{
  v3 = [MEMORY[0x263EFF940] exceptionWithName:@"com.apple.storagekit.notimplemented" reason:@"A required method is not implemented" userInfo:0];
  [v3 raise];

  return 0;
}

- (id)wholeDiskForDisk:(id)a3
{
  v3 = [MEMORY[0x263EFF940] exceptionWithName:@"com.apple.storagekit.notimplemented" reason:@"A required method is not implemented" userInfo:0];
  [v3 raise];

  return 0;
}

- (id)formatableFileSystems
{
  Class v2 = [MEMORY[0x263EFF940] exceptionWithName:@"com.apple.storagekit.notimplemented" reason:@"A required method is not implemented" userInfo:0];
  [v2 raise];

  return 0;
}

- (void)logEvent:(id)a3 eventPayloadBuilder:(id)a4
{
}

- (BOOL)supportsCocoa
{
  return self->_supportsCocoa;
}

@end