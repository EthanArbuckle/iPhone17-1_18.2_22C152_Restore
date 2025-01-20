@interface LocationSearchViewModel
- (_TtC15SafetyMonitorUI23LocationSearchViewModel)init;
- (void)completerDidUpdateResults:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
@end

@implementation LocationSearchViewModel

- (_TtC15SafetyMonitorUI23LocationSearchViewModel)init
{
  result = (_TtC15SafetyMonitorUI23LocationSearchViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__locationSearchText;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A512690);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__searchedLocations;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A512688);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__selectedLocation;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A512730);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__selectedLocationValidity;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A512680);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__destinationType;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A512748);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__selectedFenceSize;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A512678);
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__annotations;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A512670);
  (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  v17 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__selectedLocationReverseGeocodeStatus;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A512668);
  (*(void (**)(char *, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel_safetyMonitorManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel_mkLocalSearchCompleter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel_locationManager));
  v19 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__endLocation;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A512770);
  v21 = *(void (**)(char *, uint64_t))(*(void *)(v20 - 8) + 8);
  v21(v19, v20);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_25B7D6FE4(0, (unint64_t *)&unk_26A5128C0);
  unint64_t v6 = sub_25B900038();
  id v7 = a3;
  uint64_t v8 = self;
  sub_25B84ED7C(v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_25B84F00C(v8);
}

- (void)completerDidUpdateResults:(id)a3
{
  id v4 = a3;
  v5 = self;
  LocationSearchViewModel.completerDidUpdateResults(_:)((MKLocalSearchCompleter)v4);
}

@end