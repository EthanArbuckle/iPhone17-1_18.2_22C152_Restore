@interface _JSAWindowManagerKeyWindowHosting
- (CGSize)windowHostingWindowSize;
@end

@implementation _JSAWindowManagerKeyWindowHosting

- (CGSize)windowHostingWindowSize
{
  v2 = +[JSABridge sharedInstance];
  v3 = [v2 windowManager];
  [v3 keyWindowSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

@end