@interface SESAssetManager
+ (BOOL)kickOffAndReturnError:(id *)a3;
+ (void)registerDelegate:(id)a3;
+ (void)syncMobileAssetUserInitiated;
- (_TtC10seserviced15SESAssetManager)init;
- (unint64_t)currentCompatibilityVersion;
- (unint64_t)currentContentVersion;
- (void)handleDownloadedAsset:(id)a3;
- (void)setCurrentContentVersion:(unint64_t)a3;
@end

@implementation SESAssetManager

- (_TtC10seserviced15SESAssetManager)init
{
  return (_TtC10seserviced15SESAssetManager *)sub_1002687A4();
}

- (unint64_t)currentCompatibilityVersion
{
  return 4;
}

- (unint64_t)currentContentVersion
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC10seserviced15SESAssetManager_currentContentVersion);
}

- (void)setCurrentContentVersion:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced15SESAssetManager_currentContentVersion) = (Class)a3;
}

+ (BOOL)kickOffAndReturnError:(id *)a3
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  if (qword_100453890 != -1) {
    uint64_t ObjCClassMetadata = swift_once();
  }
  __chkstk_darwin(ObjCClassMetadata, v4);
  id v6 = v5;
  OS_dispatch_queue.sync<A>(execute:)();

  return 1;
}

+ (void)registerDelegate:(id)a3
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  uint64_t v4 = swift_unknownObjectRetain();
  sub_1001F2754(v4, ObjCClassMetadata);

  swift_unknownObjectRelease();
}

+ (void)syncMobileAssetUserInitiated
{
  if (qword_100453890 != -1) {
    swift_once();
  }
  v2 = *(void **)(qword_10045A040 + OBJC_IVAR____TtC10seserviced15SESAssetManager_mobileAssetClient);
  if (v2)
  {
    [v2 triggerUserInitiatedSync];
  }
}

- (void)handleDownloadedAsset:(id)a3
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  sub_10026FCB0((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC10seserviced15SESAssetManager_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced15SESAssetManager_caStatisticsActivity);
}

@end