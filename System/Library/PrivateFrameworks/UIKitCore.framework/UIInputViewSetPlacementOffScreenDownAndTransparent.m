@interface UIInputViewSetPlacementOffScreenDownAndTransparent
+ (BOOL)supportsSecureCoding;
- (double)alpha;
@end

@implementation UIInputViewSetPlacementOffScreenDownAndTransparent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)alpha
{
  return 0.0;
}

@end