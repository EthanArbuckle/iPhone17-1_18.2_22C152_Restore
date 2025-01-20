@interface MRDMediaBundleManager
+ (MRDMediaBundleManager)shared;
- (BOOL)isSupported;
- (MRDMediaBundleManager)init;
- (NSDictionary)bundles;
- (id)cachedEligibilityOf:(id)a3;
- (void)queryEligibilityOf:(NSString *)a3 completionHandler:(id)a4;
- (void)queryEligibilityOfAll:(NSArray *)a3 completionHandler:(id)a4;
- (void)setBundles:(id)a3;
@end

@implementation MRDMediaBundleManager

- (void)queryEligibilityOfAll:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100013A80(&qword_100478720);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10047B590;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10047B598;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10000B340((uint64_t)v9, (uint64_t)&unk_10047B5A0, (uint64_t)v14);
  swift_release();
}

+ (MRDMediaBundleManager)shared
{
  if (qword_100481180 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1004862A0;

  return (MRDMediaBundleManager *)v2;
}

- (BOOL)isSupported
{
  return 1;
}

- (NSDictionary)bundles
{
  swift_beginAccess();
  sub_1000154D0();
  swift_bridgeObjectRetain();
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (void)setBundles:(id)a3
{
  sub_1000154D0();
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_100273998(v4);
}

- (MRDMediaBundleManager)init
{
  return (MRDMediaBundleManager *)sub_100273CBC();
}

- (id)cachedEligibilityOf:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  id v8 = sub_100273DA0(v4, v6);

  swift_bridgeObjectRelease();

  return v8;
}

- (void)queryEligibilityOf:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_100013A80(&qword_100478720);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10047B570;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10047B578;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_10000B340((uint64_t)v9, (uint64_t)&unk_10047B580, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

@end