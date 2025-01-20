@interface CRLDocumentSessionAnalyticsManager
- (_TtC8Freeform34CRLDocumentSessionAnalyticsManager)init;
- (_TtC8Freeform34CRLDocumentSessionAnalyticsManager)initWithScene:(id)a3 commandController:(id)a4 mode:(id)a5;
- (void)beginSession;
- (void)beginSession:(id)a3;
- (void)didSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5;
- (void)endSession:(id)a3;
- (void)endSessionClosingDocument:(BOOL)a3;
- (void)observeCommandController:(id)a3;
@end

@implementation CRLDocumentSessionAnalyticsManager

- (_TtC8Freeform34CRLDocumentSessionAnalyticsManager)initWithScene:(id)a3 commandController:(id)a4 mode:(id)a5
{
  return (_TtC8Freeform34CRLDocumentSessionAnalyticsManager *)sub_1009B27CC(a3, a4, a5);
}

- (void)observeCommandController:(id)a3
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform34CRLDocumentSessionAnalyticsManager_commandControllerNotificationSubscriber) = (Class)&_swiftEmptySetSingleton;
  swift_bridgeObjectRelease();
}

- (void)beginSession
{
  v2 = self;
  CRLDocumentSessionAnalyticsManager.beginSession()();
}

- (void)endSessionClosingDocument:(BOOL)a3
{
  v4 = self;
  CRLDocumentSessionAnalyticsManager.endSession(isClosingDocument:)(a3);
}

- (void)beginSession:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  CRLDocumentSessionAnalyticsManager.beginSession()();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)endSession:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  CRLDocumentSessionAnalyticsManager.endSession(isClosingDocument:)(0);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (_TtC8Freeform34CRLDocumentSessionAnalyticsManager)init
{
  result = (_TtC8Freeform34CRLDocumentSessionAnalyticsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100517604((uint64_t)self + OBJC_IVAR____TtC8Freeform34CRLDocumentSessionAnalyticsManager_sessionBeganDate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform34CRLDocumentSessionAnalyticsManager_currentMode));
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform34CRLDocumentSessionAnalyticsManager_modeBeganDate;

  sub_100517604((uint64_t)v3);
}

- (void)didSetDocumentToMode:(id)a3 fromMode:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  _s8Freeform34CRLDocumentSessionAnalyticsManagerC18didSetDocumentMode_4from8animatedySo014CRLiOSDocumentI0C_AHSbtF_0(v7, v8);
}

@end