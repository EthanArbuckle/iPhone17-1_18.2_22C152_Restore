@interface CRLScenesNavigatorViewController.NoIntrinsicContentSizePlatformButton
- (CGSize)intrinsicContentSize;
- (_TtCC8Freeform32CRLScenesNavigatorViewControllerP33_05C0AAD711D75A114ED1933B2A36B55D36NoIntrinsicContentSizePlatformButton)initWithCoder:(id)a3;
- (_TtCC8Freeform32CRLScenesNavigatorViewControllerP33_05C0AAD711D75A114ED1933B2A36B55D36NoIntrinsicContentSizePlatformButton)initWithFrame:(CGRect)a3;
@end

@implementation CRLScenesNavigatorViewController.NoIntrinsicContentSizePlatformButton

- (CGSize)intrinsicContentSize
{
  double v2 = UIViewNoIntrinsicMetric;
  double v3 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtCC8Freeform32CRLScenesNavigatorViewControllerP33_05C0AAD711D75A114ED1933B2A36B55D36NoIntrinsicContentSizePlatformButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CRLScenesNavigatorViewController.NoIntrinsicContentSizePlatformButton();
  return -[CRLScenesNavigatorViewController.NoIntrinsicContentSizePlatformButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC8Freeform32CRLScenesNavigatorViewControllerP33_05C0AAD711D75A114ED1933B2A36B55D36NoIntrinsicContentSizePlatformButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLScenesNavigatorViewController.NoIntrinsicContentSizePlatformButton();
  return [(CRLScenesNavigatorViewController.NoIntrinsicContentSizePlatformButton *)&v5 initWithCoder:a3];
}

@end