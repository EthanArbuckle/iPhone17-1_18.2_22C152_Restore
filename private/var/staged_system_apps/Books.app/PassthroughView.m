@interface PassthroughView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC5Books15PassthroughView)initWithCoder:(id)a3;
- (_TtC5Books15PassthroughView)initWithFrame:(CGRect)a3;
@end

@implementation PassthroughView

- (_TtC5Books15PassthroughView)initWithFrame:(CGRect)a3
{
  return (_TtC5Books15PassthroughView *)sub_1007B7810(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Books15PassthroughView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC5Books15PassthroughView *)sub_1007FF260();
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return 1;
  }
  v9 = (void *)Strong;
  id v10 = a4;
  v11 = self;
  unsigned __int8 v12 = [v9 passThroughView:v11 shouldPassthroughHitAtPoint:x, y];

  swift_unknownObjectRelease();
  return v12 ^ 1;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC5Books15PassthroughView_delegate;

  sub_10023E454((uint64_t)v3);
}

@end