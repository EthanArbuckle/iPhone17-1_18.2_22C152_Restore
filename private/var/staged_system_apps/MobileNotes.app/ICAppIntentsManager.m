@interface ICAppIntentsManager
+ (void)registerDependencies;
- (_TtC11MobileNotes19ICAppIntentsManager)init;
- (void)registerDependencies;
@end

@implementation ICAppIntentsManager

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

+ (void)registerDependencies
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  type metadata accessor for AppDependencyManager();
  uint64_t v3 = static AppDependencyManager.shared.getter();
  v4 = (char *)objc_allocWithZone(ObjCClassMetadata);
  *(void *)&v4[OBJC_IVAR____TtC11MobileNotes19ICAppIntentsManager_dependencyManager] = v3;
  v5 = &v4[OBJC_IVAR____TtC11MobileNotes19ICAppIntentsManager_loggingConfiguration];
  *(void *)v5 = 0x6C7070612E6D6F63;
  *((void *)v5 + 1) = 0xEF7365746F6E2E65;
  *((void *)v5 + 2) = 1802398028;
  *((void *)v5 + 3) = 0xE400000000000000;
  v7.receiver = v4;
  v7.super_class = ObjCClassMetadata;
  id v6 = [super init];
  ICAppIntentsManager.registerDependencies()();
}

- (void)registerDependencies
{
  v2 = self;
  ICAppIntentsManager.registerDependencies()();
}

- (_TtC11MobileNotes19ICAppIntentsManager)init
{
  result = (_TtC11MobileNotes19ICAppIntentsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end