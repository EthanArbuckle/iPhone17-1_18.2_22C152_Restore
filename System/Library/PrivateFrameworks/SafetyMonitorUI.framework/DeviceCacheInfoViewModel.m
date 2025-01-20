@interface DeviceCacheInfoViewModel
- (_TtC15SafetyMonitorUI24DeviceCacheInfoViewModel)init;
@end

@implementation DeviceCacheInfoViewModel

- (_TtC15SafetyMonitorUI24DeviceCacheInfoViewModel)init
{
  result = (_TtC15SafetyMonitorUI24DeviceCacheInfoViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI24DeviceCacheInfoViewModel_safetyCache;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15SafetyMonitorUI24DeviceCacheInfoViewModel_safetyCache);
  v5 = *(void **)&self->contact[OBJC_IVAR____TtC15SafetyMonitorUI24DeviceCacheInfoViewModel_safetyCache];
  v6 = *(void **)&self->safetyCache[OBJC_IVAR____TtC15SafetyMonitorUI24DeviceCacheInfoViewModel_safetyCache + 8];
  v7 = *(void **)&self->safetyCache[OBJC_IVAR____TtC15SafetyMonitorUI24DeviceCacheInfoViewModel_safetyCache + 16];
  v8 = *(void **)&self->safetyCache[OBJC_IVAR____TtC15SafetyMonitorUI24DeviceCacheInfoViewModel_safetyCache + 24];
  v9 = *(void **)&self->safetyCache[OBJC_IVAR____TtC15SafetyMonitorUI24DeviceCacheInfoViewModel_safetyCache + 32];
  v10 = *(void **)&self->safetyCache[OBJC_IVAR____TtC15SafetyMonitorUI24DeviceCacheInfoViewModel_safetyCache + 40];
  v12 = *(void **)&self->safetyCache[OBJC_IVAR____TtC15SafetyMonitorUI24DeviceCacheInfoViewModel_safetyCache + 48];
  uint64_t v11 = *(void *)&self->safetyCache[OBJC_IVAR____TtC15SafetyMonitorUI24DeviceCacheInfoViewModel_safetyCache + 56];
  unint64_t v13 = *((void *)v3 + 10);
  swift_bridgeObjectRelease();

  sub_25B7D3B44(v11, v13);
  swift_bridgeObjectRelease();
}

@end