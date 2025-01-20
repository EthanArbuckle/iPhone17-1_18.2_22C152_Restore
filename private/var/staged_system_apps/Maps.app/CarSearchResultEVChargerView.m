@interface CarSearchResultEVChargerView
- (UIImageView)leadingIcon;
- (_TtC4Maps28CarSearchResultEVChargerView)initWithCoder:(id)a3;
- (_TtC4Maps28CarSearchResultEVChargerView)initWithFrame:(CGRect)a3;
- (void)resetContents;
- (void)setLeadingIcon:(id)a3;
- (void)setTextAndIconColor:(id)a3 status:(int)a4;
- (void)updateContentsWithPlugStatus:(int)a3 displayString:(id)a4;
- (void)updateLabelColors:(id)a3;
@end

@implementation CarSearchResultEVChargerView

- (UIImageView)leadingIcon
{
  v2 = self;
  id v3 = sub_1001CD888();

  return (UIImageView *)v3;
}

- (void)setLeadingIcon:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Maps28CarSearchResultEVChargerView____lazy_storage___leadingIcon);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC4Maps28CarSearchResultEVChargerView____lazy_storage___leadingIcon) = (Class)a3;
  id v3 = a3;
}

- (_TtC4Maps28CarSearchResultEVChargerView)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps28CarSearchResultEVChargerView *)sub_1001CDC24(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC4Maps28CarSearchResultEVChargerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001CE9C0();
}

- (void)resetContents
{
  v2 = self;
  id v3 = sub_1001CDA6C();
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 setText:v4];

  id v5 = sub_1001CD888();
  [v5 setImage:0];

  id v6 = sub_1001CD9A8();
  [v6 setImage:0];
}

- (void)setTextAndIconColor:(id)a3 status:(int)a4
{
  id v6 = a3;
  v7 = self;
  sub_1001CE324((uint64_t)v6, a4);
}

- (void)updateContentsWithPlugStatus:(int)a3 displayString:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  v9 = self;
  sub_1001CE588(a3, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)updateLabelColors:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_1001CDA6C();
  [v6 setTextColor:v4];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps28CarSearchResultEVChargerView_horizontal));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps28CarSearchResultEVChargerView____lazy_storage___leadingIcon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps28CarSearchResultEVChargerView____lazy_storage___trailingIcon));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Maps28CarSearchResultEVChargerView____lazy_storage___chargerInfoLabel);
}

@end