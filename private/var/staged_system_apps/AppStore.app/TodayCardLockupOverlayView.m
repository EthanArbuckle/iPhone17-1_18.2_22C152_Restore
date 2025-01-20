@interface TodayCardLockupOverlayView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityElements;
- (_TtC8AppStore26TodayCardLockupOverlayView)initWithCoder:(id)a3;
- (_TtC8AppStore26TodayCardLockupOverlayView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)handleTapWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)setAccessibilityElements:(id)isa;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TodayCardLockupOverlayView

- (_TtC8AppStore26TodayCardLockupOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore26TodayCardLockupOverlayView *)sub_1001A261C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore26TodayCardLockupOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001A57A8();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore26TodayCardLockupOverlayView_tapGestureRecognizer);
  v5 = self;
  [v4 removeTarget:v5 action:0];
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(TodayCardLockupOverlayView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26TodayCardLockupOverlayView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26TodayCardLockupOverlayView_tapGestureRecognizer));
  swift_weakDestroy();
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore26TodayCardLockupOverlayView_impressionsUpdateBlock));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26TodayCardLockupOverlayView_separatorView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore26TodayCardLockupOverlayView_clickActionHandler);

  sub_10006012C(v3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  uint64_t v5 = type metadata accessor for SmallLockupLayout.Metrics();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore26TodayCardLockupOverlayView_lockupView);
  v10 = self;
  sub_1001AED8C((uint64_t)v8);
  [v9 layoutMargins];
  id v11 = [v9 traitCollection];
  sub_100709D3C((uint64_t)v8);
  double v13 = v12;

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  double v14 = fmax(v13, 79.0);
  double v15 = width;
  result.height = v14;
  result.CGFloat width = v15;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001A2FA8();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(TodayCardLockupOverlayView *)&v7 traitCollectionDidChange:v4];
  id v6 = [v5 traitCollection];
  sub_1001ADCA8(v6);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return swift_dynamicCastObjCClass() == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_1001A589C(v7);

  return v9;
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  uint64_t v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore26TodayCardLockupOverlayView_clickActionHandler);
  if (v3)
  {
    id v5 = a3;
    id v7 = self;
    uint64_t v6 = sub_100060050((uint64_t)v3);
    v3(v6);
    sub_10006012C((uint64_t)v3);
  }
}

- (NSArray)accessibilityElements
{
  sub_100082C28(&qword_100981AD0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1007BEDF0;
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore26TodayCardLockupOverlayView_lockupView);
  *(void *)(v3 + 56) = type metadata accessor for CrossLinkLockupView();
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
  [(TodayCardLockupOverlayView *)&v8 setAccessibilityElements:isa];
}

@end