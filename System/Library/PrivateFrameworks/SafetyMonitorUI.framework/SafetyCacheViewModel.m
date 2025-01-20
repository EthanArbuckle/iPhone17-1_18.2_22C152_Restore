@interface SafetyCacheViewModel
- (_TtC15SafetyMonitorUI20SafetyCacheViewModel)init;
- (void)dealloc;
@end

@implementation SafetyCacheViewModel

- (void)dealloc
{
  v2 = self;
  SafetyCacheViewModel.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI20SafetyCacheViewModel_sessionID;
  uint64_t v4 = sub_25B8FE5F8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  sub_25B78FE58(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15SafetyMonitorUI20SafetyCacheViewModel_containerVCHandler));
  v5 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI20SafetyCacheViewModel__safetyCache;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5107F8);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI20SafetyCacheViewModel__phoneCache;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A511698);
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9((char *)self + OBJC_IVAR____TtC15SafetyMonitorUI20SafetyCacheViewModel__watchCache, v8);
  v10 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI20SafetyCacheViewModel__cacheExpiryDate;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5116B8);
  v12 = *(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8);
  v12(v10, v11);
  v12((char *)self + OBJC_IVAR____TtC15SafetyMonitorUI20SafetyCacheViewModel__cacheReleaseDate, v11);
  v13 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI20SafetyCacheViewModel__receiverSessionStatus;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5116D8);
  v15 = *(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8);
  v15(v13, v14);
}

- (_TtC15SafetyMonitorUI20SafetyCacheViewModel)init
{
  result = (_TtC15SafetyMonitorUI20SafetyCacheViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end