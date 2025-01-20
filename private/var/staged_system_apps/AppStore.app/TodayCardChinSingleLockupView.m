@interface TodayCardChinSingleLockupView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityElements;
- (_TtC8AppStore29TodayCardChinSingleLockupView)initWithCoder:(id)a3;
- (_TtC8AppStore29TodayCardChinSingleLockupView)initWithFrame:(CGRect)a3;
- (void)handleTap;
- (void)layoutSubviews;
- (void)setAccessibilityElements:(id)isa;
@end

@implementation TodayCardChinSingleLockupView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_100056D18(width);
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
  sub_10005FB44();
}

- (_TtC8AppStore29TodayCardChinSingleLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29TodayCardChinSingleLockupView *)sub_10002D178(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore29TodayCardChinSingleLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100711964();
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return swift_dynamicCastObjCClass() == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  BOOL v9 = sub_100711A2C(v7);

  return v9;
}

- (void)handleTap
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore29TodayCardChinSingleLockupView_clickActionHandler);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_100060050((uint64_t)v2);
    v2(v3);
    sub_10006012C((uint64_t)v2);
  }
}

- (NSArray)accessibilityElements
{
  sub_100082C28(&qword_100981AD0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1007BEDF0;
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore29TodayCardChinSingleLockupView_lockupView);
  *(void *)(v3 + 56) = type metadata accessor for TodayCardLockupView();
  *(void *)(v3 + 32) = v4;
  id v5 = v4;
  v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v6.super.isa;
}

- (void)setAccessibilityElements:(id)isa
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    NSArray v6 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(TodayCardChinSingleLockupView *)&v8 setAccessibilityElements:isa];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29TodayCardChinSingleLockupView_lockupView));
  swift_weakDestroy();
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore29TodayCardChinSingleLockupView_impressionsUpdateBlock));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29TodayCardChinSingleLockupView_tapGestureRecognizer));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore29TodayCardChinSingleLockupView_clickActionHandler);

  sub_10006012C(v3);
}

@end