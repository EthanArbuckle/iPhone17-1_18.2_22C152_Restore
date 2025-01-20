@interface LocationConfigurationCell
- (NSString)accessibilityLabel;
- (_TtC10MobileMail25LocationConfigurationCell)initWithCoder:(id)a3;
- (_TtC10MobileMail25LocationConfigurationCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation LocationConfigurationCell

- (_TtC10MobileMail25LocationConfigurationCell)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail25LocationConfigurationCell *)sub_10033ACEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail25LocationConfigurationCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10033BCF8();
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_10033C028();
  uint64_t v8 = v3;

  if (v8)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setAccessibilityLabel:(id)a3
{
  id v3 = a3;
  v4 = self;
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  sub_1002A6908();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10033C3E8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail25LocationConfigurationCell_mapImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail25LocationConfigurationCell_visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail25LocationConfigurationCell_dateLabel));
  sub_10024C328((id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail25LocationConfigurationCell____lazy_storage___avatarViewController));
  sub_10033AB5C((uint64_t)self + OBJC_IVAR____TtC10MobileMail25LocationConfigurationCell_searchItem);
}

@end