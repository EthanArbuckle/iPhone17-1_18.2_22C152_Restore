@interface LocationManager
- (_TtC11WeatherCore15LocationManager)init;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation LocationManager

- (_TtC11WeatherCore15LocationManager)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherCore15LocationManager_locationCacheManager);
  swift_release();
  swift_release();
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  v4 = (objc_class *)a3;
  v5._id internal = self;
  id internal = v5._internal;
  v5.super.isa = v4;
  LocationManager.locationManagerDidChangeAuthorization(_:)(v5);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  LocationManager.locationManager(_:didFailWithError:)();
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_1B4947424(0, (unint64_t *)&qword_1EB6BF3C0);
  id v6 = (void *)sub_1B4B395B8();
  v7 = (objc_class *)a3;
  id v8 = self;
  v9.super.isa = v7;
  v9._id internal = v6;
  LocationManager.locationManager(_:didUpdateLocations:)(v9, v10);

  swift_bridgeObjectRelease();
}

@end