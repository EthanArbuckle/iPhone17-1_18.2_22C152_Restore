@interface WallpaperItemListManager
- (void)preferencesDidChange;
@end

@implementation WallpaperItemListManager

- (void)preferencesDidChange
{
  uint64_t v3 = sub_1AB22F8DC();
  int IsFeaturedContentAllowed = PXPreferencesIsFeaturedContentAllowed(v3);
  int v5 = self->isFeaturedContentAllowed[0];
  self->isFeaturedContentAllowed[0] = IsFeaturedContentAllowed;
  if (IsFeaturedContentAllowed != v5) {
    sub_1A9B3263C();
  }
  swift_release();
}

@end