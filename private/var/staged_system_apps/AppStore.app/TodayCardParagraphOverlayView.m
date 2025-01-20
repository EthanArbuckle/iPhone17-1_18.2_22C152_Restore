@interface TodayCardParagraphOverlayView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityLabel;
- (_TtC8AppStore29TodayCardParagraphOverlayView)initWithCoder:(id)a3;
- (_TtC8AppStore29TodayCardParagraphOverlayView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation TodayCardParagraphOverlayView

- (_TtC8AppStore29TodayCardParagraphOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29TodayCardParagraphOverlayView *)sub_1001881E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore29TodayCardParagraphOverlayView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore29TodayCardParagraphOverlayView_isExpanded) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore29TodayCardParagraphOverlayView_sizeCategory) = 7;
  id v4 = a3;

  result = (_TtC8AppStore29TodayCardParagraphOverlayView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v4 = self;
  double v5 = sub_100188688(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100188978();
}

- (NSString)accessibilityLabel
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore29TodayCardParagraphOverlayView_label);
  v3 = self;
  id v4 = [v2 accessibilityLabel];
  if (v4)
  {
    double v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setAccessibilityLabel:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v6 = self;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(TodayCardParagraphOverlayView *)&v8 setAccessibilityLabel:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29TodayCardParagraphOverlayView_label));
}

@end