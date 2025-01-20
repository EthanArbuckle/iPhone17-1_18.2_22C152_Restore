@interface UITraitCollection
- (int64_t)be_contentSupportInterfaceLevel;
@end

@implementation UITraitCollection

- (int64_t)be_contentSupportInterfaceLevel
{
  UIUserInterfaceLevel v2 = [(UITraitCollection *)self userInterfaceLevel];

  return BEContentSupportInterfaceLevelForUIUserInterfaceLevel(v2);
}

@end