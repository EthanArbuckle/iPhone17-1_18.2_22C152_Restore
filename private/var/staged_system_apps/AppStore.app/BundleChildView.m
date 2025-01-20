@interface BundleChildView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore15BundleChildView)initWithCoder:(id)a3;
- (_TtC8AppStore15BundleChildView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BundleChildView

- (_TtC8AppStore15BundleChildView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore15BundleChildView *)sub_10075C690(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore15BundleChildView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10075CE98();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10075CA3C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  double v4 = sub_10075D100();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore15BundleChildView_titleLabel);
}

@end