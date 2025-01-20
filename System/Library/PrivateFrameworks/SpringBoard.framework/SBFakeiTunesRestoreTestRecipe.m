@interface SBFakeiTunesRestoreTestRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBFakeiTunesRestoreTestRecipe

- (id)title
{
  return @"Enter/Exit Fake iTunes Restore State";
}

- (void)handleVolumeIncrease
{
  id v2 = +[SBSyncController sharedInstance];
  [v2 beginRestoring];
}

- (void)handleVolumeDecrease
{
  id v2 = +[SBSyncController sharedInstance];
  [v2 cancelRestoring];
}

@end