@interface CHIconParameters
- (BOOL)needsWatchIcon;
- (NSString)bundleID;
- (double)preferredAppStoreIconWidth;
- (void)setBundleID:(id)a3;
- (void)setNeedsWatchIcon:(BOOL)a3;
- (void)setPreferredAppStoreIconWidth:(double)a3;
@end

@implementation CHIconParameters

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (double)preferredAppStoreIconWidth
{
  return self->_preferredAppStoreIconWidth;
}

- (void)setPreferredAppStoreIconWidth:(double)a3
{
  self->_preferredAppStoreIconWidth = a3;
}

- (BOOL)needsWatchIcon
{
  return self->_needsWatchIcon;
}

- (void)setNeedsWatchIcon:(BOOL)a3
{
  self->_needsWatchIcon = a3;
}

- (void).cxx_destruct
{
}

@end