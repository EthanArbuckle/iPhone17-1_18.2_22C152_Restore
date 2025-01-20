@interface SafetyCacheMapView._Annotation
- (CLLocationCoordinate2D)coordinate;
- (_TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118611_Annotation)init;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation SafetyCacheMapView._Annotation

- (CLLocationCoordinate2D)coordinate
{
  double v2 = *(double *)&self->wrappedAnnotation[OBJC_IVAR____TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118611_Annotation_wrappedAnnotation];
  double v3 = *(double *)&self->wrappedAnnotation[OBJC_IVAR____TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118611_Annotation_wrappedAnnotation
                                         + 8];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  *(CLLocationCoordinate2D *)&self->wrappedAnnotation[OBJC_IVAR____TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118611_Annotation_wrappedAnnotation] = a3;
}

- (_TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118611_Annotation)init
{
  CLLocationCoordinate2D result = (_TtCV15SafetyMonitorUI18SafetyCacheMapViewP33_0136281DCC3F5D58BE1F34FEE765118611_Annotation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end