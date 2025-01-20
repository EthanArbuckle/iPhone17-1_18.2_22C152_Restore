@interface SafetyCacheMapView.SelectableMarkerAnnotationView
- (_TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118630SelectableMarkerAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4;
- (_TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118630SelectableMarkerAnnotationView)initWithCoder:(id)a3;
- (void)tapHandler:(id)a3;
@end

@implementation SafetyCacheMapView.SelectableMarkerAnnotationView

- (void)tapHandler:(id)a3
{
  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118630SelectableMarkerAnnotationView_onTapHandler);
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    uint64_t v6 = sub_25B793188((uint64_t)v3);
    v3(v6);
    sub_25B78FE58((uint64_t)v3);
  }
}

- (_TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118630SelectableMarkerAnnotationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_25B8789A0();
}

- (_TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118630SelectableMarkerAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  swift_unknownObjectRetain();
  result = (_TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118630SelectableMarkerAnnotationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_25B78FE58(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118630SelectableMarkerAnnotationView_onTapHandler));
}

@end