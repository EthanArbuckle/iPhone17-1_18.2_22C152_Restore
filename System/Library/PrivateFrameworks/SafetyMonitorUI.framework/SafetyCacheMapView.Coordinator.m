@interface SafetyCacheMapView.Coordinator
- (_TtCV15SafetyMonitorUI18SafetyCacheMapView11Coordinator)init;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4;
- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
@end

@implementation SafetyCacheMapView.Coordinator

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_25B86D700(v6, (uint64_t)a4);

  swift_unknownObjectRelease();
  return v8;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  sub_25B877C78(v5);
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_25B877F1C(v7);
}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  uint64_t v6 = qword_26A510198;
  id v7 = a3;
  id v13 = a4;
  v8 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_25B8FE828();
  __swift_project_value_buffer(v9, (uint64_t)qword_26A513C38);
  v10 = sub_25B8FE808();
  os_log_type_t v11 = sub_25B900218();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_25B788000, v10, v11, "#SafetyCacheMapView, didDeselect is called.", v12, 2u);
    MEMORY[0x26116B480](v12, -1, -1);
  }
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  id v8 = sub_25B8786F0((uint64_t)a4);

  swift_unknownObjectRelease();
  return v8;
}

- (_TtCV15SafetyMonitorUI18SafetyCacheMapView11Coordinator)init
{
  result = (_TtCV15SafetyMonitorUI18SafetyCacheMapView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end