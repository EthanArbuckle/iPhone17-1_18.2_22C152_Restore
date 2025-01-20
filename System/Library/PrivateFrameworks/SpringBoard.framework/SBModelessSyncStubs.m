@interface SBModelessSyncStubs
+ (id)iconState;
@end

@implementation SBModelessSyncStubs

+ (id)iconState
{
  v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = (void *)MEMORY[0x1E4F1CB10];
  v4 = BSCurrentUserDirectory();
  v5 = [v4 stringByAppendingPathComponent:@"/newIconState.plist"];
  v6 = [v3 fileURLWithPath:v5 isDirectory:0];
  v7 = [v2 arrayWithContentsOfURL:v6];

  return v7;
}

@end