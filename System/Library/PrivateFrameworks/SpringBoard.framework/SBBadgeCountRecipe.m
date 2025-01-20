@interface SBBadgeCountRecipe
- (id)title;
- (void)_changeBadge:(unint64_t)a3;
- (void)handleVolumeDecrease;
- (void)handleVolumeIncrease;
@end

@implementation SBBadgeCountRecipe

- (id)title
{
  return @"Badge count";
}

- (void)handleVolumeIncrease
{
}

- (void)handleVolumeDecrease
{
  unint64_t badgeCount = self->_badgeCount;
  if (badgeCount) {
    self->_unint64_t badgeCount = badgeCount - 1;
  }
  -[SBBadgeCountRecipe _changeBadge:](self, "_changeBadge:");
}

- (void)_changeBadge:(unint64_t)a3
{
  v4 = +[SBApplicationController sharedInstance];
  id v6 = [v4 applicationWithBundleIdentifier:@"com.apple.Test"];

  if (v6)
  {
    v5 = [NSNumber numberWithUnsignedInteger:a3];
    [v6 setBadgeValue:v5];
  }
}

@end