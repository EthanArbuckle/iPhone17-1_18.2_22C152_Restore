@interface UINavigationItem(PUAbstractNavigationBanner)
- (id)pu_banner;
- (void)pu_setBanner:()PUAbstractNavigationBanner;
@end

@implementation UINavigationItem(PUAbstractNavigationBanner)

- (void)pu_setBanner:()PUAbstractNavigationBanner
{
}

- (id)pu_banner
{
  return objc_getAssociatedObject(a1, "com.apple.photosui.banner");
}

@end