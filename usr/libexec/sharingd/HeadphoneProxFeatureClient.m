@interface HeadphoneProxFeatureClient
- (BOOL)shouldShowWhatsNewCardWithDeviceAddress:(id)a3;
- (_TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient)init;
- (_TtP16DaemoniOSLibrary37HPXHeadphoneProxFeatureDeviceProtocol_)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation HeadphoneProxFeatureClient

- (_TtP16DaemoniOSLibrary37HPXHeadphoneProxFeatureDeviceProtocol_)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP16DaemoniOSLibrary37HPXHeadphoneProxFeatureDeviceProtocol_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient)init
{
  return (_TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient *)sub_1002BEEEC();
}

- (BOOL)shouldShowWhatsNewCardWithDeviceAddress:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = HeadphoneProxFeatureClient.shouldShowWhatsNewCard(deviceAddress:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary26HeadphoneProxFeatureClient_delegate;

  sub_100261080((uint64_t)v3);
}

@end