@interface FindMyHandleWaypointRequest
- (BOOL)hasCachedResult;
- (BOOL)isCurrentLocation;
- (BOOL)isEquivalentToOtherRequest:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (CNContact)contact;
- (MKMapItem)mapItemForLocationComparison;
- (NSString)handleIdentifier;
- (NSString)waypointName;
- (NSString)waypointNameWhenEditing;
- (_TtC4Maps27FindMyHandleWaypointRequest)init;
- (_TtC4Maps27FindMyHandleWaypointRequest)initWithHandle:(id)a3 location:(id)a4;
- (id)copyWithZone:(void *)a3;
- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6;
- (id)waypointIconWithScale:(double)a3;
- (void)recordRAPInformation:(id)a3;
@end

@implementation FindMyHandleWaypointRequest

- (_TtC4Maps27FindMyHandleWaypointRequest)initWithHandle:(id)a3 location:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (_TtC4Maps27FindMyHandleWaypointRequest *)sub_100117C30(v5, a4);

  return v7;
}

- (CLLocationCoordinate2D)coordinate
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27FindMyHandleWaypointRequest_location);
  if (v2)
  {
    [v2 coordinate];
  }
  else
  {
    double latitude = kCLLocationCoordinate2DInvalid.latitude;
    double longitude = kCLLocationCoordinate2DInvalid.longitude;
  }
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (BOOL)isCurrentLocation
{
  return 0;
}

- (MKMapItem)mapItemForLocationComparison
{
  v2 = self;
  id v3 = sub_1001147D8();

  return (MKMapItem *)v3;
}

- (BOOL)hasCachedResult
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27FindMyHandleWaypointRequest_cachedLoadResult) != 0;
}

- (BOOL)isEquivalentToOtherRequest:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  char v6 = sub_100114A28(a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (id)loadComposedWaypointWithTraits:(id)a3 clientResolvedCompletionHandler:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  v10 = _Block_copy(a4);
  v11 = _Block_copy(a5);
  v12 = _Block_copy(a6);
  if (v10)
  {
    *(void *)(swift_allocObject() + 16) = v10;
    v10 = sub_100118770;
  }
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  if (v12)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v12;
    v12 = sub_100118784;
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = a3;
  v16 = self;
  id v17 = sub_100117CE8(a3, (uint64_t)sub_100118770, v13, (uint64_t)v12, v14);
  sub_10006C5D8((uint64_t)v12);
  swift_release();
  sub_10006C5D8((uint64_t)v10);

  return v17;
}

- (void)recordRAPInformation:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100115504(v4);
}

- (id)copyWithZone:(void *)a3
{
  id v3 = self;
  sub_100115928(v6);

  sub_1000FF380(v6, v6[3]);
  id v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_1000FF22C((uint64_t)v6);
  return v4;
}

- (id)waypointIconWithScale:(double)a3
{
  id v4 = self;
  id v5 = sub_100115AB8(a3);

  return v5;
}

- (NSString)waypointName
{
  v2 = self;
  sub_10023F13C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)waypointNameWhenEditing
{
  v2 = self;
  sub_10023F0C8();
  if (!v3) {
    sub_10023F13C();
  }

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (CNContact)contact
{
  v2 = self;
  id v3 = sub_10023F6AC();

  return (CNContact *)v3;
}

- (NSString)handleIdentifier
{
  uint64_t v3 = type metadata accessor for Handle();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27FindMyHandleWaypointRequest_handle)+ OBJC_IVAR____TtC4Maps16MapsFindMyHandle_handle, v3);
  v7 = self;
  Handle.identifier.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

- (_TtC4Maps27FindMyHandleWaypointRequest)init
{
  CLLocationCoordinate2D result = (_TtC4Maps27FindMyHandleWaypointRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps27FindMyHandleWaypointRequest_cachedLoadResult);
}

@end