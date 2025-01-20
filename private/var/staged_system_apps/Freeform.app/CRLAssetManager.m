@interface CRLAssetManager
+ (id)readonlyAssetFromData:(id)a3 filename:(id)a4;
+ (id)readonlyAssetFromURL:(id)a3;
+ (void)addCullingListener:(id)a3;
+ (void)removeCullingListener:(id)a3;
- (_TtC8Freeform15CRLAssetManager)init;
- (void)removeAllDownloadObserversWithIdentifier:(id)a3;
@end

@implementation CRLAssetManager

+ (id)readonlyAssetFromURL:(id)a3
{
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = sub_100AE7258((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return v8;
}

+ (id)readonlyAssetFromData:(id)a3 filename:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;

  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;

  uint64_t v13 = type metadata accessor for CRLDataAssetStorage();
  swift_allocObject();
  sub_100510D4C(v7, v9);
  swift_bridgeObjectRetain();
  v19[3] = v13;
  v19[4] = &off_1015160C0;
  v19[0] = sub_10080C5B4(v7, v9, v10, v12);
  v14 = (objc_class *)type metadata accessor for CRLAsset();
  id v15 = objc_allocWithZone(v14);
  sub_1005498A4((uint64_t)v19, (uint64_t)v15 + OBJC_IVAR____TtC8Freeform8CRLAsset_storage);
  v18.receiver = v15;
  v18.super_class = v14;
  swift_retain();
  [super init];
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)v19);
  swift_bridgeObjectRelease();
  swift_release();
  sub_100510084(v7, v9);

  return v16;
}

- (void)removeAllDownloadObserversWithIdentifier:(id)a3
{
  uint64_t v4 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8, v11);
  uint64_t v12 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13, v14);
  id v16 = (char *)&v23 - v15;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v18 = Strong;
    uint64_t v19 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v7, 1, 1, v19);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v16, v8);
    unint64_t v20 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v21 = (char *)swift_allocObject();
    *((void *)v21 + 2) = 0;
    *((void *)v21 + 3) = 0;
    *((void *)v21 + 4) = v18;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v21[v20], v12, v8);
    v22 = self;
    sub_1005912D0((uint64_t)v7, (uint64_t)&unk_101693C10, (uint64_t)v21);

    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
}

+ (void)addCullingListener:(id)a3
{
}

+ (void)removeCullingListener:(id)a3
{
}

- (_TtC8Freeform15CRLAssetManager)init
{
  result = (_TtC8Freeform15CRLAssetManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

@end