@interface ML3ProcessClient
+ (ML3ProcessClient)sharedProcessClient;
- (ML3ProcessClient)init;
- (id)bundleID;
- (id)name;
@end

@implementation ML3ProcessClient

- (id)name
{
  v2 = [MEMORY[0x1E4F28F80] processInfo];
  v3 = [v2 processName];

  return v3;
}

- (id)bundleID
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];

  return v3;
}

- (ML3ProcessClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)ML3ProcessClient;
  return [(ML3Client *)&v3 initWithConnection:0];
}

+ (ML3ProcessClient)sharedProcessClient
{
  if (sharedProcessClient___once != -1) {
    dispatch_once(&sharedProcessClient___once, &__block_literal_global_321);
  }
  v2 = (void *)sharedProcessClient___sharedProcessClient;

  return (ML3ProcessClient *)v2;
}

uint64_t __39__ML3ProcessClient_sharedProcessClient__block_invoke()
{
  sharedProcessClient___sharedProcessClient = objc_alloc_init(ML3ProcessClient);

  return MEMORY[0x1F41817F8]();
}

@end