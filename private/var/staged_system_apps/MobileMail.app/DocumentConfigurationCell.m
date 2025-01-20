@interface DocumentConfigurationCell
- (NSString)accessibilityLabel;
- (_TtC10MobileMail25DocumentConfigurationCell)initWithCoder:(id)a3;
- (_TtC10MobileMail25DocumentConfigurationCell)initWithFrame:(CGRect)a3;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation DocumentConfigurationCell

- (_TtC10MobileMail25DocumentConfigurationCell)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail25DocumentConfigurationCell *)sub_1002A499C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail25DocumentConfigurationCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002A6194();
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_1002A6544();
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

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail25DocumentConfigurationCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail25DocumentConfigurationCell_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail25DocumentConfigurationCell_dateLabel));
  sub_10024C328((id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail25DocumentConfigurationCell_imageHeightSizeConstraint));
  sub_10024C328((id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail25DocumentConfigurationCell_imageWidthSizeConstraint));
  sub_10024C328((id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail25DocumentConfigurationCell____lazy_storage___avatarViewController));
  sub_1002A47CC((uint64_t)self + OBJC_IVAR____TtC10MobileMail25DocumentConfigurationCell_searchItem);
}

@end