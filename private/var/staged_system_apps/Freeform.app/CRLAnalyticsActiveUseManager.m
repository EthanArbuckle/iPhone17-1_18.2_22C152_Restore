@interface CRLAnalyticsActiveUseManager
+ (_TtC8Freeform28CRLAnalyticsActiveUseManager)sharedManager;
- (_TtC8Freeform28CRLAnalyticsActiveUseManager)init;
- (void)dealloc;
- (void)handleConflictOccurred:(id)a3;
- (void)handleQuotaViolationOccurred;
- (void)handleSupportsEndToEndEncryptionValueChanged;
@end

@implementation CRLAnalyticsActiveUseManager

+ (_TtC8Freeform28CRLAnalyticsActiveUseManager)sharedManager
{
  if (qword_10166EE08 != -1) {
    swift_once();
  }
  v2 = (void *)static CRLAnalyticsActiveUseManager.shared;

  return (_TtC8Freeform28CRLAnalyticsActiveUseManager *)v2;
}

- (_TtC8Freeform28CRLAnalyticsActiveUseManager)init
{
  return (_TtC8Freeform28CRLAnalyticsActiveUseManager *)sub_10068083C();
}

- (void)dealloc
{
  v2 = self;
  CRLAnalyticsActiveUseManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform28CRLAnalyticsActiveUseManager_dataStore);
}

- (void)handleConflictOccurred:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  sub_100681C0C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)handleQuotaViolationOccurred
{
  v2 = self;
  sub_100681FCC();
}

- (void)handleSupportsEndToEndEncryptionValueChanged
{
  v2 = self;
  sub_100681C08();
}

@end