@interface TodayCardLockupListItemView
- (BOOL)isAccessibilityElement;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityLabel;
- (_TtC8AppStore27TodayCardLockupListItemView)initWithCoder:(id)a3;
- (_TtC8AppStore27TodayCardLockupListItemView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
@end

@implementation TodayCardLockupListItemView

- (_TtC8AppStore27TodayCardLockupListItemView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore27TodayCardLockupListItemView *)sub_100572390(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore27TodayCardLockupListItemView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore27TodayCardLockupListItemView_displaysLabel) = 1;
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore27TodayCardLockupListItemView_clickAction;
  uint64_t v6 = sub_100082C28((uint64_t *)&unk_10098A9A0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8AppStore27TodayCardLockupListItemView_clickSender);
  _OWORD *v7 = 0u;
  v7[1] = 0u;
  id v8 = a3;

  result = (_TtC8AppStore27TodayCardLockupListItemView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_100575AEC();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100572940();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[TodayCardLockupListItemView hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (v9
    && (objc_msgSend(v7, "bounds", v13.receiver, v13.super_class), v15.x = x, v15.double y = y, CGRectContainsPoint(v16, v15))
    && (sub_10003A33C(), (static NSObject.== infix(_:_:)() & 1) == 0))
  {
    self;
    uint64_t v11 = swift_dynamicCastObjCClass();

    if (v11) {
      id v12 = v7;
    }
    else {
      id v12 = v9;
    }
    if (!v11) {
      id v9 = v7;
    }
    id v7 = v12;
  }
  else
  {
  }

  return v9;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(TodayCardLockupListItemView *)&v4 setIsAccessibilityElement:v3];
}

- (NSString)accessibilityLabel
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore27TodayCardLockupListItemView_label);
  BOOL v3 = self;
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
    id v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(TodayCardLockupListItemView *)&v8 setAccessibilityLabel:a3];
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(TodayCardLockupListItemView *)&v4 setAccessibilityTraits:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27TodayCardLockupListItemView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27TodayCardLockupListItemView_label));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore27TodayCardLockupListItemView_clickAction, &qword_10098D120);
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore27TodayCardLockupListItemView_clickSender, (uint64_t *)&unk_100982B40);
}

@end