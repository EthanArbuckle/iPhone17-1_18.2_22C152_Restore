@interface FMCalloutView
- (_TtC6FindMy13FMCalloutView)initWithCoder:(id)a3;
- (_TtC6FindMy13FMCalloutView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation FMCalloutView

- (_TtC6FindMy13FMCalloutView)initWithFrame:(CGRect)a3
{
  return (_TtC6FindMy13FMCalloutView *)sub_10032B2D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC6FindMy13FMCalloutView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy13FMCalloutView_path;
  id v6 = objc_allocWithZone((Class)UIBezierPath);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy13FMCalloutView_triangleWidth) = (Class)0x4028000000000000;

  result = (_TtC6FindMy13FMCalloutView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  v3 = self;
  sub_10032B584();
}

- (void).cxx_destruct
{
}

@end