@interface SBAlertItemTestRecipe
- (id)title;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBAlertItemTestRecipe

- (id)title
{
  return @"SBAlertItem Test";
}

- (void)handleVolumeIncrease
{
  ++handleVolumeIncrease_count;
  id v3 = +[SBTestAlertItem alertItemWithShowInLockScreen:1 forcesModal:1 superModal:0];
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"Modal %d", handleVolumeIncrease_count);
  [v3 setTitle:v2];

  [v3 setReappearsAfterLock:1];
  [v3 setReappearsAfterUnlock:1];
  [MEMORY[0x1E4FA7938] activateAlertItem:v3];
}

- (void)handleVolumeDecrease
{
  ++handleVolumeDecrease_count;
  id v3 = +[SBTestAlertItem alertItemWithShowInLockScreen:1 forcesModal:0 superModal:0];
  [v3 setReappearsAfterLock:1];
  [v3 setReappearsAfterUnlock:1];
  v2 = objc_msgSend(NSString, "stringWithFormat:", @"Normal %d", handleVolumeDecrease_count);
  [v3 setTitle:v2];

  [MEMORY[0x1E4FA7938] activateAlertItem:v3];
}

@end