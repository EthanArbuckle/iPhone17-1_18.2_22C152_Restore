@interface UITabBarItem
- (BOOL)scalesLargeContentImage;
- (BOOL)showsLargeContentViewer;
- (NSString)largeContentTitle;
- (UIEdgeInsets)largeContentImageInsets;
- (UIImage)largeContentImage;
@end

@implementation UITabBarItem

- (NSString)largeContentTitle
{
  v2 = self;
  id v3 = [(UITabBarItem *)v2 title];
  if (v3)
  {
    v4 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (UIImage)largeContentImage
{
  id v2 = [(UITabBarItem *)self image];

  return (UIImage *)v2;
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (UIEdgeInsets)largeContentImageInsets
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

@end