@interface SBDefaultAutomaticIconModelStore
+ (SBDefaultAutomaticIconModelStore)sharedInstance;
- (SBDefaultAutomaticIconModelStore)init;
@end

@implementation SBDefaultAutomaticIconModelStore

+ (SBDefaultAutomaticIconModelStore)sharedInstance
{
  if (sharedInstance___once_28 != -1) {
    dispatch_once(&sharedInstance___once_28, &__block_literal_global_30_2);
  }
  v2 = (void *)sharedInstance___instance_27;
  return (SBDefaultAutomaticIconModelStore *)v2;
}

void __50__SBDefaultAutomaticIconModelStore_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBDefaultAutomaticIconModelStore);
  v1 = (void *)sharedInstance___instance_27;
  sharedInstance___instance_27 = (uint64_t)v0;
}

- (SBDefaultAutomaticIconModelStore)init
{
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = [@"~/Library/SpringBoard/AutomaticIconState.plist" stringByExpandingTildeInPath];
  v5 = [v3 fileURLWithPath:v4];
  v6 = (void *)MEMORY[0x1E4F1CB10];
  v7 = [@"~/Library/SpringBoard/DesiredAutomaticIconState.plist" stringByExpandingTildeInPath];
  v8 = [v6 fileURLWithPath:v7];
  v9 = [(SBIconModelPropertyListFileStore *)self initWithIconStateURL:v5 desiredIconStateURL:v8];

  return v9;
}

@end