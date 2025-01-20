@interface FMScrollView
- (_TtC6FindMy12FMScrollView)init;
- (_TtC6FindMy12FMScrollView)initWithCoder:(id)a3;
- (_TtC6FindMy12FMScrollView)initWithFrame:(CGRect)a3;
@end

@implementation FMScrollView

- (_TtC6FindMy12FMScrollView)init
{
  return (_TtC6FindMy12FMScrollView *)sub_100050FB0();
}

- (void).cxx_destruct
{
}

- (_TtC6FindMy12FMScrollView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy12FMScrollView_content;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC6FindMy12FMScrollView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC6FindMy12FMScrollView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy12FMScrollView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end