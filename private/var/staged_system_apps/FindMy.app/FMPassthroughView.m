@interface FMPassthroughView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC6FindMy17FMPassthroughView)initWithCoder:(id)a3;
- (_TtC6FindMy17FMPassthroughView)initWithFrame:(CGRect)a3;
@end

@implementation FMPassthroughView

- (_TtC6FindMy17FMPassthroughView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy17FMPassthroughView_enabled) = 1;
  id v4 = a3;

  result = (_TtC6FindMy17FMPassthroughView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  LOBYTE(v4) = sub_100328A6C(v4, x, y);

  return v4 & 1;
}

- (_TtC6FindMy17FMPassthroughView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy17FMPassthroughView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end