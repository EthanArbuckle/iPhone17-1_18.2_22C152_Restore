@interface CRLiOSZoomHelper
+ (id)zoomLevels:(double)a3 maxRange:(double)a4 zoomScale:(double)a5;
- (_TtC8Freeform16CRLiOSZoomHelper)init;
- (_TtC8Freeform16CRLiOSZoomHelper)initWithInteractiveCanvasController:(id)a3 zoomTrackerDelegate:(id)a4;
- (void)decrementZoomLevel;
- (void)incrementZoomLevel;
@end

@implementation CRLiOSZoomHelper

- (_TtC8Freeform16CRLiOSZoomHelper)initWithInteractiveCanvasController:(id)a3 zoomTrackerDelegate:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  v5 = (_TtC8Freeform16CRLiOSZoomHelper *)sub_100F90928(v4);

  swift_unknownObjectRelease();
  return v5;
}

- (void)incrementZoomLevel
{
  v2 = self;
  sub_100F8FDC8();
}

- (void)decrementZoomLevel
{
  v2 = self;
  sub_100F8FEE4();
}

+ (id)zoomLevels:(double)a3 maxRange:(double)a4 zoomScale:(double)a5
{
  sub_100F90790(a3, a4, a5);
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (_TtC8Freeform16CRLiOSZoomHelper)init
{
  result = (_TtC8Freeform16CRLiOSZoomHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform16CRLiOSZoomHelper_delegate);

  swift_bridgeObjectRelease();
}

@end