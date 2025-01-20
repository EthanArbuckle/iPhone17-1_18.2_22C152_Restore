@interface ScrubberMarkerController
- (_TtC5Books24ScrubberMarkerController)init;
@end

@implementation ScrubberMarkerController

- (_TtC5Books24ScrubberMarkerController)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books24ScrubberMarkerController_pageCount) = (Class)1;
  *(int64x2_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books24ScrubberMarkerController_markerPageRange) = vdupq_n_s64(1uLL);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books24ScrubberMarkerController_markerCurrentPage) = (Class)1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ScrubberMarkerController();
  return [(ScrubberMarkerController *)&v3 init];
}

@end