@interface LineDivisionsNumbers
- (_TtC7Measure20LineDivisionsNumbers)init;
- (_TtC7Measure20LineDivisionsNumbers)initWithCoder:(id)a3;
@end

@implementation LineDivisionsNumbers

- (_TtC7Measure20LineDivisionsNumbers)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000810EC();
}

- (_TtC7Measure20LineDivisionsNumbers)init
{
  result = (_TtC7Measure20LineDivisionsNumbers *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7Measure20LineDivisionsNumbers_divisionNumbersMaterial));
  swift_bridgeObjectRelease();

  swift_release();
}

@end