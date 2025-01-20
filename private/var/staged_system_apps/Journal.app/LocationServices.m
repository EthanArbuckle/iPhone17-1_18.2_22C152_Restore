@interface LocationServices
- (_TtC7Journal16LocationServices)init;
- (void)appWillEnterForeground;
- (void)dealloc;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation LocationServices

- (_TtC7Journal16LocationServices)init
{
  return (_TtC7Journal16LocationServices *)sub_1001A1694();
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4 name:UIApplicationWillEnterForegroundNotification object:0];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for LocationServices();
  [(LocationServices *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_10001ABB8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal16LocationServices_authorizationChanged));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal16LocationServices_locationFindResult);

  sub_10001ABB8(v3);
}

- (void)appWillEnterForeground
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal16LocationServices_locationManager);
  uint64_t v3 = self;
  [v2 setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
  [v2 setDelegate:v3];
  [v2 requestWhenInUseAuthorization];
  [v2 startUpdatingLocation];
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Journal16LocationServices_locationManager);
  id v5 = a3;
  v9 = self;
  id v6 = [v4 authorizationStatus];
  if (v6)
  {
    id v7 = v6;
    v8 = *(void (**)(id))((char *)&v9->super.isa
                                   + OBJC_IVAR____TtC7Journal16LocationServices_authorizationChanged);
    if (v8)
    {
      swift_retain();
      v8(v7);
      sub_10001ABB8((uint64_t)v8);
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_1001A2510();
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_1001A1F8C(v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  id v7 = self;
  sub_1001A2124((uint64_t)v8);
}

@end