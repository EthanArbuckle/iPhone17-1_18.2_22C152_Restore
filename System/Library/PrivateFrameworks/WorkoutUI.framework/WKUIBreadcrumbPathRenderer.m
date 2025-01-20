@interface WKUIBreadcrumbPathRenderer
- (BOOL)canDrawMapRect:(id)a3 zoomScale:(double)a4;
- (_TtC9WorkoutUI26WKUIBreadcrumbPathRenderer)initWithOverlay:(id)a3;
- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5;
@end

@implementation WKUIBreadcrumbPathRenderer

- (BOOL)canDrawMapRect:(id)a3 zoomScale:(double)a4
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v6 = a3.var0.var1;
  double v7 = a3.var0.var0;
  v8 = *(os_unfair_lock_s **)(*(char **)((char *)&self->super.super.isa
                                       + OBJC_IVAR____TtC9WorkoutUI26WKUIBreadcrumbPathRenderer_crumbs)
                            + OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_protectedBreadcrumbData);
  uint64_t v9 = (uint64_t)&v8[4];
  v10 = v8 + 14;
  v11 = self;
  os_unfair_lock_lock(v10);
  sub_261A38124(v9, (uint64_t)&v13);
  os_unfair_lock_unlock(v10);
  v14.origin.x = v7;
  v14.origin.y = v6;
  v14.size.width = var0;
  v14.size.height = var1;
  LOBYTE(v9) = MKMapRectIntersectsRect(v13, v14);

  return v9;
}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v8 = a3.var0.var1;
  double v9 = a3.var0.var0;
  v11 = a5;
  v12 = self;
  sub_261A34F34(v11, v9, v8, var0, var1, a4);
}

- (_TtC9WorkoutUI26WKUIBreadcrumbPathRenderer)initWithOverlay:(id)a3
{
  swift_unknownObjectRetain();
  result = (_TtC9WorkoutUI26WKUIBreadcrumbPathRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end