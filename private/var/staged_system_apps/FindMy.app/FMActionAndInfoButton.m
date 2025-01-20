@interface FMActionAndInfoButton
- (_TtC6FindMy21FMActionAndInfoButton)init;
- (_TtC6FindMy21FMActionAndInfoButton)initWithCoder:(id)a3;
- (_TtC6FindMy21FMActionAndInfoButton)initWithFrame:(CGRect)a3;
- (void)updateConstraints;
@end

@implementation FMActionAndInfoButton

- (_TtC6FindMy21FMActionAndInfoButton)init
{
  return (_TtC6FindMy21FMActionAndInfoButton *)sub_1002FDA74();
}

- (_TtC6FindMy21FMActionAndInfoButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002FE1AC();
}

- (void)updateConstraints
{
  v2 = self;
  sub_1002FDD38();
}

- (_TtC6FindMy21FMActionAndInfoButton)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy21FMActionAndInfoButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMActionAndInfoButton_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMActionAndInfoButton_detailLabel));

  swift_bridgeObjectRelease();
}

@end