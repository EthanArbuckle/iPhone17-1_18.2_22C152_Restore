@interface OneUpChromeViewController.View
- (_TtCC15PhotosUIPrivate25OneUpChromeViewControllerP33_92107D9432C5EAC5AA1271C2BCD7CC994View)initWithCoder:(id)a3;
- (_TtCC15PhotosUIPrivate25OneUpChromeViewControllerP33_92107D9432C5EAC5AA1271C2BCD7CC994View)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation OneUpChromeViewController.View

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1AEA3FE98((uint64_t)a4, x, y);

  return v10;
}

- (_TtCC15PhotosUIPrivate25OneUpChromeViewControllerP33_92107D9432C5EAC5AA1271C2BCD7CC994View)initWithFrame:(CGRect)a3
{
  return (_TtCC15PhotosUIPrivate25OneUpChromeViewControllerP33_92107D9432C5EAC5AA1271C2BCD7CC994View *)sub_1AEA3FFE8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC15PhotosUIPrivate25OneUpChromeViewControllerP33_92107D9432C5EAC5AA1271C2BCD7CC994View)initWithCoder:(id)a3
{
  return (_TtCC15PhotosUIPrivate25OneUpChromeViewControllerP33_92107D9432C5EAC5AA1271C2BCD7CC994View *)sub_1AEA40074(a3);
}

@end