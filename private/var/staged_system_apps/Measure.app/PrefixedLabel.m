@interface PrefixedLabel
- (NSString)text;
- (_TtC7Measure13PrefixedLabel)init;
- (_TtC7Measure13PrefixedLabel)initWithCoder:(id)a3;
- (_TtC7Measure13PrefixedLabel)initWithFrame:(CGRect)a3;
- (void)setText:(id)a3;
@end

@implementation PrefixedLabel

- (NSString)text
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
  }
  v7 = self;
  sub_1000762DC(v4, v6);
}

- (_TtC7Measure13PrefixedLabel)init
{
  NSString v2 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure13PrefixedLabel_prefix);
  *NSString v2 = 0;
  v2[1] = 0xE000000000000000;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PrefixedLabel();
  return -[PrefixedLabel initWithFrame:](&v4, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
}

- (_TtC7Measure13PrefixedLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure13PrefixedLabel_prefix);
  void *v7 = 0;
  v7[1] = 0xE000000000000000;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PrefixedLabel();
  return -[PrefixedLabel initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC7Measure13PrefixedLabel)initWithCoder:(id)a3
{
  objc_super v4 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure13PrefixedLabel_prefix);
  *objc_super v4 = 0;
  v4[1] = 0xE000000000000000;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PrefixedLabel();
  return [(PrefixedLabel *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end