@interface ArcadeLockupView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityIdentifier;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC8AppStore11OfferButton)accessibilityOfferButton;
- (_TtC8AppStore16ArcadeLockupView)initWithCoder:(id)a3;
- (_TtC8AppStore16ArcadeLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)offerButtonWasTapped;
- (void)setAccessibilityIdentifier:(id)a3;
@end

@implementation ArcadeLockupView

- (_TtC8AppStore16ArcadeLockupView)initWithFrame:(CGRect)a3
{
  uint64_t v4 = OBJC_IVAR____TtC8AppStore16ArcadeLockupView_offerButton;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)[objc_allocWithZone((Class)type metadata accessor for OfferButton()) initWithFrame:0.0, 0.0, 0.0, 0.0];
  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8AppStore16ArcadeLockupView_offerLabelPresenter);
  _OWORD *v5 = 0u;
  v5[1] = 0u;
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore16ArcadeLockupView_offerButtonTapHandler);
  void *v6 = 0;
  v6[1] = 0;

  result = (_TtC8AppStore16ArcadeLockupView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC8AppStore16ArcadeLockupView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore16ArcadeLockupView_offerButton;
  id v6 = objc_allocWithZone((Class)type metadata accessor for OfferButton());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 initWithFrame:0.0, 0.0, 0.0, 0.0];
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8AppStore16ArcadeLockupView_offerLabelPresenter);
  _OWORD *v8 = 0u;
  v8[1] = 0u;
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore16ArcadeLockupView_offerButtonTapHandler);
  void *v9 = 0;
  v9[1] = 0;

  result = (_TtC8AppStore16ArcadeLockupView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  sub_100234AE4();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100234DAC();
}

- (void)offerButtonWasTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore16ArcadeLockupView_offerButtonTapHandler);
  if (v2)
  {
    uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore16ArcadeLockupView_offerButton);
    double v4 = self;
    sub_100060050((uint64_t)v2);
    v2(v3);
    sub_10006012C((uint64_t)v2);
  }
}

- (NSString)accessibilityIdentifier
{
  swift_getObjectType();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  double v4 = self;
  double v5 = NSStringFromClass(ObjCClassFromMetadata);
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;

  sub_10076075C(v6, v8, 0, 0);
  swift_bridgeObjectRelease();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v9;
}

- (void)setAccessibilityIdentifier:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    double v4 = self;
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = self;
    NSString v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ArcadeLockupView();
  [(ArcadeLockupView *)&v7 setAccessibilityIdentifier:v5];
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore16ArcadeLockupView_subtitleLabel));
}

- (_TtC8AppStore11OfferButton)accessibilityOfferButton
{
  return (_TtC8AppStore11OfferButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                               + OBJC_IVAR____TtC8AppStore16ArcadeLockupView_offerButton));
}

- (void).cxx_destruct
{
  sub_100089384((uint64_t)self + OBJC_IVAR____TtC8AppStore16ArcadeLockupView_offerLabelPresenter);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8AppStore16ArcadeLockupView_metrics;
  uint64_t v4 = type metadata accessor for ArcadeLockupLayout.Metrics();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore16ArcadeLockupView_offerButtonTapHandler);

  sub_10006012C(v5);
}

@end