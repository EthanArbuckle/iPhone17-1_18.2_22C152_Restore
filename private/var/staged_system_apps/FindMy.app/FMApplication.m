@interface FMApplication
- (BOOL)runTest:(id)a3 options:(id)a4;
- (BOOL)shouldRecordExtendedLaunchTime;
- (_TtC6FindMy13FMApplication)init;
- (id)_extendLaunchTest;
@end

@implementation FMApplication

- (id)_extendLaunchTest
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

- (_TtC6FindMy13FMApplication)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMApplication();
  return [(FMApplication *)&v3 init];
}

- (BOOL)shouldRecordExtendedLaunchTime
{
  return 1;
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  v4 = (objc_class *)a4;
  if (!a3)
  {
    uint64_t v6 = 0;
    unint64_t v8 = 0;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  if (v4) {
LABEL_3:
  }
    v4 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  v9 = self;
  char v10 = sub_10045A144(v6, v8, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

@end