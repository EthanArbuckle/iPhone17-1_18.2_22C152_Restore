@interface ModelPlayabilityController
+ (_TtC16MusicApplication26ModelPlayabilityController)shared;
+ (id)requiredPropertiesForModelClass:(Class)a3;
- (_TtC16MusicApplication26ModelPlayabilityController)init;
- (int64_t)calculatePlayabilityStatusWithModel:(id)a3;
- (void)dealloc;
- (void)environmentMonitorDidChangeNetworkType:(id)a3;
@end

@implementation ModelPlayabilityController

+ (_TtC16MusicApplication26ModelPlayabilityController)shared
{
  if (qword_DBD870 != -1) {
    swift_once();
  }
  v2 = (void *)qword_E49EB0;

  return (_TtC16MusicApplication26ModelPlayabilityController *)v2;
}

- (_TtC16MusicApplication26ModelPlayabilityController)init
{
  return (_TtC16MusicApplication26ModelPlayabilityController *)sub_1221F0();
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 sharedMonitor];
  [v5 unregisterObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ModelPlayabilityController();
  [(ModelPlayabilityController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

+ (id)requiredPropertiesForModelClass:(Class)a3
{
  swift_getObjCClassMetadata();
  id v3 = sub_127A0C();

  return v3;
}

- (int64_t)calculatePlayabilityStatusWithModel:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  int64_t v7 = sub_123134(a3);

  return v7;
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_DC1000);
  __chkstk_darwin(v5 - 8);
  int64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_AB6C00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_AB6BB0();
  v9 = self;
  id v10 = a3;
  uint64_t v11 = sub_AB6BA0();
  v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = &protocol witness table for MainActor;
  v12[4] = v9;
  sub_EECAC((uint64_t)v7, (uint64_t)&unk_DC7BE8, (uint64_t)v12);

  swift_release();
}

@end