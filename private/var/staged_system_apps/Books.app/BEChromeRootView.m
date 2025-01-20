@interface BEChromeRootView
- (_TtC5Books16BEChromeRootView)initWithCoder:(id)a3;
- (_TtC5Books16BEChromeRootView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation BEChromeRootView

- (_TtC5Books16BEChromeRootView)initWithCoder:(id)a3
{
  result = (_TtC5Books16BEChromeRootView *)sub_1007FF260();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = BEChromeRootView.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (_TtC5Books16BEChromeRootView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Books16BEChromeRootView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end