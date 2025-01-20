@interface UIInputViewSetPlacementOnScreenWithAccessory
+ (BOOL)supportsSecureCoding;
- (BOOL)accessoryViewWillAppear;
@end

@implementation UIInputViewSetPlacementOnScreenWithAccessory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)accessoryViewWillAppear
{
  return 1;
}

@end