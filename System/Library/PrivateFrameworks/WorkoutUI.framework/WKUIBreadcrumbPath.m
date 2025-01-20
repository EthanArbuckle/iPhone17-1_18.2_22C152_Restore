@interface WKUIBreadcrumbPath
- ($B5E4F2499D3E0A90C7E8AF059312C337)boundingMapRect;
- (CLLocationCoordinate2D)coordinate;
- (_TtC9WorkoutUI18WKUIBreadcrumbPath)init;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
@end

@implementation WKUIBreadcrumbPath

- ($B5E4F2499D3E0A90C7E8AF059312C337)boundingMapRect
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_boundingMapRect);
  double v3 = *(double *)&self->boundingMapRect[OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_boundingMapRect];
  double v4 = *(double *)&self->boundingMapRect[OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_boundingMapRect + 8];
  double v5 = *(double *)&self->boundingMapRect[OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_boundingMapRect + 16];
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- (CLLocationCoordinate2D)coordinate
{
  double v2 = (double *)((char *)self + OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_coordinate);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  result.longitude = v4;
  result.latitude = v3;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  double v5 = (CLLocationDegrees *)((char *)self + OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_coordinate);
  swift_beginAccess();
  *double v5 = latitude;
  v5[1] = longitude;
}

- (_TtC9WorkoutUI18WKUIBreadcrumbPath)init
{
  double v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_boundingMapRect);
  uint64_t v4 = *MEMORY[0x263F10860];
  uint64_t v5 = *(void *)(MEMORY[0x263F10860] + 8);
  uint64_t v6 = *(void *)(MEMORY[0x263F10860] + 16);
  uint64_t v7 = *(void *)(MEMORY[0x263F10860] + 24);
  *double v3 = *MEMORY[0x263F10860];
  v3[1] = v5;
  v3[2] = v6;
  v3[3] = v7;
  v8 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_coordinate);
  void *v8 = 0;
  v8[1] = 0;
  uint64_t v9 = OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_protectedBreadcrumbData;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26A944908);
  uint64_t v10 = swift_allocObject();
  *(_DWORD *)(v10 + 56) = 0;
  *(void *)(v10 + 16) = MEMORY[0x263F8EE78];
  *(void *)(v10 + 24) = v4;
  *(void *)(v10 + 32) = v5;
  *(void *)(v10 + 40) = v6;
  *(void *)(v10 + 48) = v7;
  *(Class *)((char *)&self->super.isa + v9) = (Class)v10;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for WKUIBreadcrumbPath();
  return [(WKUIBreadcrumbPath *)&v12 init];
}

- (void).cxx_destruct
{
}

@end