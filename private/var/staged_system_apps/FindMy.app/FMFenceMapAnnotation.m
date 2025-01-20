@interface FMFenceMapAnnotation
- ($F7A7D4D4E97128E8A8857CD8EA16B209)region;
- (BOOL)didReverseGeocode;
- (BOOL)didZoomOnSelection;
- (MKCircle)overlay;
- (NSString)displayAddress;
- (_TtC6FindMy20FMFenceMapAnnotation)init;
- (double)customRadius;
- (double)defaultRadius;
- (double)defaultRegionDimension;
- (void)coordinateUpdated;
- (void)setCustomRadius:(double)a3;
- (void)setDidZoomOnSelection:(BOOL)a3;
- (void)setOverlay:(id)a3;
@end

@implementation FMFenceMapAnnotation

- (BOOL)didZoomOnSelection
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_didZoomOnSelection);
}

- (void)setDidZoomOnSelection:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_didZoomOnSelection) = a3;
}

- (MKCircle)overlay
{
  return (MKCircle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_overlay));
}

- (void)setOverlay:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_overlay);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_overlay) = (Class)a3;
  id v3 = a3;
}

- (double)customRadius
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_customRadius);
}

- (void)setCustomRadius:(double)a3
{
  id v4 = self;
  sub_100485310(a3);
}

- (NSString)displayAddress
{
  v2 = self;
  sub_100485444();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- ($F7A7D4D4E97128E8A8857CD8EA16B209)region
{
  uint64_t v3 = self;
  [(FMFenceMapAnnotation *)v3 coordinate];
  MKCoordinateRegionMakeWithDistance(v5, *(double *)((char *)&v3->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_customRadius) * 3.5, *(double *)((char *)&v3->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_customRadius) * 3.5);

  return result;
}

- (double)defaultRegionDimension
{
  v2 = self;
  double v3 = sub_100485754();

  return v3;
}

- (double)defaultRadius
{
  v2 = self;
  double v3 = sub_100485C88();

  return v3;
}

- (BOOL)didReverseGeocode
{
  uint64_t v3 = sub_10005D034(&qword_1006AF730);
  __chkstk_darwin(v3 - 8);
  CLLocationCoordinate2D v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_fmfPlacemark;
  swift_beginAccess();
  sub_100434370((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = type metadata accessor for FMFAddress();
  LOBYTE(v6) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1;
  sub_1004343D8((uint64_t)v5);
  return (char)v6;
}

- (void)coordinateUpdated
{
  v2 = self;
  sub_10048626C();
}

- (_TtC6FindMy20FMFenceMapAnnotation)init
{
  result = (_TtC6FindMy20FMFenceMapAnnotation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_addressType;
  uint64_t v4 = type metadata accessor for FMFLocationAlertAddressType();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1004343D8((uint64_t)self + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_fmfPlacemark);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_didReverseGeocodeGroup));

  CLLocationCoordinate2D v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_overlay);
}

@end