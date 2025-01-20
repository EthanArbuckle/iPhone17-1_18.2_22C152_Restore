@interface SMCloudKitFunctionSwift
- (_TtC13SafetyMonitor23SMCloudKitFunctionSwift)init;
- (_TtC13SafetyMonitor23SMCloudKitFunctionSwift)initWithServiceName:(id)a3;
- (void)requestSafetyCacheRecordFromZone:(id)a3 token:(id)a4 completion:(id)a5;
@end

@implementation SMCloudKitFunctionSwift

- (_TtC13SafetyMonitor23SMCloudKitFunctionSwift)initWithServiceName:(id)a3
{
  uint64_t v3 = sub_25B7582F0();
  return (_TtC13SafetyMonitor23SMCloudKitFunctionSwift *)SMCloudKitFunctionSwift.init(serviceName:)(v3, v4);
}

- (void)requestSafetyCacheRecordFromZone:(id)a3 token:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_25B7582F0();
  unint64_t v10 = v9;
  if (a4)
  {
    uint64_t v11 = sub_25B7582F0();
    a4 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v7;
  v14 = self;
  sub_25B6F2D80(v8, v10, v11, (unint64_t)a4, (uint64_t)sub_25B6F4A3C, v13);

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (_TtC13SafetyMonitor23SMCloudKitFunctionSwift)init
{
  result = (_TtC13SafetyMonitor23SMCloudKitFunctionSwift *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_logger;
  uint64_t v4 = sub_25B758230();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SafetyMonitor23SMCloudKitFunctionSwift_client);
}

@end