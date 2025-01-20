@interface TodayCardInfoLayerView
- (NSString)accessibilityLabel;
- (_TtC8AppStore22TodayCardInfoLayerView)initWithCoder:(id)a3;
- (_TtC8AppStore22TodayCardInfoLayerView)initWithFrame:(CGRect)a3;
- (double)_continuousCornerRadius;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
@end

@implementation TodayCardInfoLayerView

- (void)layoutSubviews
{
  v2 = self;
  sub_1000565D8();
}

- (_TtC8AppStore22TodayCardInfoLayerView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore22TodayCardInfoLayerView *)sub_100035A48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore22TodayCardInfoLayerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10011DB44();
}

- (double)_continuousCornerRadius
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  [(TodayCardInfoLayerView *)&v3 _continuousCornerRadius];
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(TodayCardInfoLayerView *)&v5 _setContinuousCornerRadius:a3];
  sub_10005C0E4();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_10011D25C((uint64_t)a4, x, y);

  return v10;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_100086324();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = self;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(TodayCardInfoLayerView *)&v8 setAccessibilityLabel:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22TodayCardInfoLayerView_labelsView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22TodayCardInfoLayerView_gradientBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22TodayCardInfoLayerView_overlayContainer));
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore22TodayCardInfoLayerView_protectionUpdateBlock));
  swift_unknownObjectRelease();
  swift_weakDestroy();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore22TodayCardInfoLayerView_preferredGradientType);
}

@end