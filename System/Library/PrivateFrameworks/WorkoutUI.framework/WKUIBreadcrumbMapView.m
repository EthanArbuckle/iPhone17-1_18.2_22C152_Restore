@interface WKUIBreadcrumbMapView
- (_TtC9WorkoutUI21WKUIBreadcrumbMapView)initWithCoder:(id)a3;
- (_TtC9WorkoutUI21WKUIBreadcrumbMapView)initWithFrame:(CGRect)a3;
- (_TtC9WorkoutUI21WKUIBreadcrumbMapView)initWithFrame:(CGRect)a3 locationManager:(id)a4;
- (id)mapView:(id)a3 rendererForOverlay:(id)a4;
@end

@implementation WKUIBreadcrumbMapView

- (_TtC9WorkoutUI21WKUIBreadcrumbMapView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_breadcrumbPath) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_breadcrumbPathRenderer) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_cancellable) = (Class)MEMORY[0x263F8EE88];
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_routePolyline) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_didReceiveInitialUpdate) = 0;
  id v4 = a3;

  result = (_TtC9WorkoutUI21WKUIBreadcrumbMapView *)sub_261B8F9C8();
  __break(1u);
  return result;
}

- (_TtC9WorkoutUI21WKUIBreadcrumbMapView)initWithFrame:(CGRect)a3
{
  result = (_TtC9WorkoutUI21WKUIBreadcrumbMapView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9WorkoutUI21WKUIBreadcrumbMapView)initWithFrame:(CGRect)a3 locationManager:(id)a4
{
  id v4 = a4;
  result = (_TtC9WorkoutUI21WKUIBreadcrumbMapView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_breadcrumbPath));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_breadcrumbPathRenderer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_routePolyline));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_inUseAssertion);
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  id v7 = sub_261AFAA78();

  swift_unknownObjectRelease();
  return v7;
}

@end