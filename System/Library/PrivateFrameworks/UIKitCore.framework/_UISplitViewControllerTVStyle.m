@interface _UISplitViewControllerTVStyle
- (double)defaultMaximumWidthForColumn:(int64_t)a3 withSize:(CGSize)a4 splitBehavior:(int64_t)a5;
- (double)maximumRubberbandingDistance;
- (id)primaryBackgroundColor;
@end

@implementation _UISplitViewControllerTVStyle

- (double)defaultMaximumWidthForColumn:(int64_t)a3 withSize:(CGSize)a4 splitBehavior:(int64_t)a5
{
  double width = a4.width;
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a5, a4.width, a4.height);
  [v8 handleFailureInMethod:a2 object:self file:@"UISplitViewControllerPanelImpl.m" lineNumber:10051 description:@"Only valid for tvOS"];

  return width;
}

- (id)primaryBackgroundColor
{
  return 0;
}

- (double)maximumRubberbandingDistance
{
  return 0.0;
}

@end