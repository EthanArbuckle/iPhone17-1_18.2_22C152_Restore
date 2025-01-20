@interface PXOverlayBadgeTileUserData
- (unint64_t)badgeOptions;
- (void)setBadgeOptions:(unint64_t)a3;
@end

@implementation PXOverlayBadgeTileUserData

- (void)setBadgeOptions:(unint64_t)a3
{
  self->_badgeOptions = a3;
}

- (unint64_t)badgeOptions
{
  return self->_badgeOptions;
}

@end