@interface LinkConfigurationCell
- (NSString)accessibilityLabel;
- (_TtC10MobileMail21LinkConfigurationCell)initWithCoder:(id)a3;
- (_TtC10MobileMail21LinkConfigurationCell)initWithFrame:(CGRect)a3;
- (void)_linkViewMetadataDidBecomeComplete:(id)a3;
- (void)layoutSubviews;
- (void)linkViewNeedsResize:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation LinkConfigurationCell

- (_TtC10MobileMail21LinkConfigurationCell)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail21LinkConfigurationCell *)sub_100337E34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail21LinkConfigurationCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003387B8();
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_100338A80();
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
  sub_100338C40();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail21LinkConfigurationCell_linkView));
  sub_10024C328((id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail21LinkConfigurationCell____lazy_storage___avatarViewController));
  sub_100337C3C((uint64_t)self + OBJC_IVAR____TtC10MobileMail21LinkConfigurationCell_searchItem);
  sub_100287934();
}

- (void)linkViewNeedsResize:(id)a3
{
  id v4 = a3;
  NSString v5 = self;
  sub_100339838();
}

- (void)_linkViewMetadataDidBecomeComplete:(id)a3
{
  id v4 = a3;
  NSString v5 = self;
  sub_100339838();
}

@end