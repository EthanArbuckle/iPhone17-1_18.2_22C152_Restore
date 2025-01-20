@interface PlusView
- (_TtC8AppStore8PlusView)initWithCoder:(id)a3;
- (_TtC8AppStore8PlusView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation PlusView

- (_TtC8AppStore8PlusView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore8PlusView_plusColor) = 0;
  id v4 = a3;

  result = (_TtC8AppStore8PlusView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  sub_1001FB0C0(x, y, width, height);
}

- (_TtC8AppStore8PlusView)initWithFrame:(CGRect)a3
{
  result = (_TtC8AppStore8PlusView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end