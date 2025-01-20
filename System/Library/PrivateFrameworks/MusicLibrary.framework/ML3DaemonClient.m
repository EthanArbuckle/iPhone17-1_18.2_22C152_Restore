@interface ML3DaemonClient
+ (ML3DaemonClient)sharedDaemonClient;
- (ML3DaemonClient)init;
- (id)bundleID;
- (id)name;
@end

@implementation ML3DaemonClient

+ (ML3DaemonClient)sharedDaemonClient
{
  if (sharedDaemonClient___once != -1) {
    dispatch_once(&sharedDaemonClient___once, &__block_literal_global_12011);
  }
  v2 = (void *)sharedDaemonClient___sharedDaemonClient;

  return (ML3DaemonClient *)v2;
}

- (id)name
{
  return @"medialibraryd";
}

- (id)bundleID
{
  return @"com.apple.medialibraryd";
}

- (ML3DaemonClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)ML3DaemonClient;
  return [(ML3Client *)&v3 initWithConnection:0];
}

uint64_t __37__ML3DaemonClient_sharedDaemonClient__block_invoke()
{
  sharedDaemonClient___sharedDaemonClient = objc_alloc_init(ML3DaemonClient);

  return MEMORY[0x1F41817F8]();
}

@end