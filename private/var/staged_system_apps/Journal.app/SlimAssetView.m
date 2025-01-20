@interface SlimAssetView
- (NSArray)accessibilityCustomActions;
- (_TtC7Journal13SlimAssetView)initWithCoder:(id)a3;
- (_TtC7Journal13SlimAssetView)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setAccessibilityCustomActions:(id)a3;
- (void)tapped;
- (void)userInterfaceStyleChanged;
@end

@implementation SlimAssetView

- (_TtC7Journal13SlimAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal13SlimAssetView *)sub_1005CBA00(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal13SlimAssetView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005D2B4C();
}

- (void)userInterfaceStyleChanged
{
  v2 = self;
  sub_1005CF314();
}

- (void)tapped
{
  v2 = self;
  sub_1005D06E0();
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  id v3 = sub_1005D16C8();

  if (v3)
  {
    sub_10001B284(0, (unint64_t *)&unk_10080C360);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityCustomActions:(id)a3
{
  isa = a3;
  if (a3)
  {
    sub_10001B284(0, (unint64_t *)&unk_10080C360);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SlimAssetView();
  [(SlimAssetView *)&v7 setAccessibilityCustomActions:isa];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_1005D1FA8((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  swift_release();
  swift_weakDestroy();
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal13SlimAssetView_slimAssetDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal13SlimAssetView_backgroundView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal13SlimAssetView_trailingLabelTrailingMarginConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal13SlimAssetView_fallbackIcon);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_1005D2E90();

  return v7;
}

@end