@interface MapView.Coordinator
- (_TtCV15SafetyMonitorUI7MapView11Coordinator)init;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (void)longPressActionWithSender:(id)a3;
- (void)mapView:(id)a3 annotationView:(id)a4 didChangeDragState:(unint64_t)a5 fromOldState:(unint64_t)a6;
- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4;
- (void)mapViewDidChangeVisibleRegion:(id)a3;
@end

@implementation MapView.Coordinator

- (void)mapViewDidChangeVisibleRegion:(id)a3
{
  long long v4 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 128];
  v11[8] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 112];
  v11[9] = v4;
  uint64_t v12 = *(void *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 144];
  long long v5 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 64];
  v11[4] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 48];
  v11[5] = v5;
  long long v6 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 96];
  v11[6] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 80];
  v11[7] = v6;
  long long v7 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent];
  v11[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent);
  v11[1] = v7;
  long long v8 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 32];
  v11[2] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 16];
  v11[3] = v8;
  id v9 = a3;
  v10 = self;
  sub_25B803D1C((uint64_t)v11);
  objc_msgSend(v9, sel_region);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A5119C8);
  sub_25B8FFC88();
  sub_25B803F6C((uint64_t)v11);
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  long long v7 = self;
  id v8 = sub_25B80404C((uint64_t)a4);

  swift_unknownObjectRelease();
  return v8;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  long long v7 = self;
  id v8 = sub_25B80415C(v6, (uint64_t)a4);

  swift_unknownObjectRelease();
  return v8;
}

- (void)mapView:(id)a3 didAddAnnotationViews:(id)a4
{
  sub_25B7D6FE4(0, (unint64_t *)&unk_26A511AB0);
  unint64_t v6 = sub_25B900038();
  id v7 = a3;
  id v8 = self;
  sub_25B8042B4(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)mapView:(id)a3 annotationView:(id)a4 didChangeDragState:(unint64_t)a5 fromOldState:(unint64_t)a6
{
  id v11 = a3;
  id v9 = a4;
  v10 = self;
  sub_25B804424(v11, v9, a5);
}

- (void)longPressActionWithSender:(id)a3
{
  id v5 = a3;
  long long v4 = self;
  sub_25B801D1C(v5);
}

- (_TtCV15SafetyMonitorUI7MapView11Coordinator)init
{
  result = (_TtCV15SafetyMonitorUI7MapView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  long long v3 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 128];
  v8[8] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 112];
  v8[9] = v3;
  uint64_t v9 = *(void *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 144];
  long long v4 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 64];
  v8[4] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 48];
  v8[5] = v4;
  long long v5 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 96];
  v8[6] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 80];
  v8[7] = v5;
  long long v6 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent];
  v8[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent);
  v8[1] = v6;
  long long v7 = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 32];
  v8[2] = *(_OWORD *)&self->parent[OBJC_IVAR____TtCV15SafetyMonitorUI7MapView11Coordinator_parent + 16];
  v8[3] = v7;
  sub_25B803F6C((uint64_t)v8);
}

@end