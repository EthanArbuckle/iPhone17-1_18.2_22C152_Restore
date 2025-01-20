@interface SafetyCacheDetailViewModel
- (_TtC15SafetyMonitorUI26SafetyCacheDetailViewModel)init;
@end

@implementation SafetyCacheDetailViewModel

- (_TtC15SafetyMonitorUI26SafetyCacheDetailViewModel)init
{
  result = (_TtC15SafetyMonitorUI26SafetyCacheDetailViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI26SafetyCacheDetailViewModel__safetyCache;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5107F8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI26SafetyCacheDetailViewModel__navigationPath;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A513438);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI26SafetyCacheDetailViewModel__startLocationInfoViewModel;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A513440);
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9((char *)self + OBJC_IVAR____TtC15SafetyMonitorUI26SafetyCacheDetailViewModel__destinationInfoViewModel, v8);
  v10 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI26SafetyCacheDetailViewModel__sessionStartTime;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5116B8);
  v12 = *(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8);
  v12(v10, v11);
  v12((char *)self + OBJC_IVAR____TtC15SafetyMonitorUI26SafetyCacheDetailViewModel__sessionEndTime, v11);
  sub_25B79070C((uint64_t)self + OBJC_IVAR____TtC15SafetyMonitorUI26SafetyCacheDetailViewModel_callFunctionProvider, &qword_26A510800);

  swift_bridgeObjectRelease();
}

@end