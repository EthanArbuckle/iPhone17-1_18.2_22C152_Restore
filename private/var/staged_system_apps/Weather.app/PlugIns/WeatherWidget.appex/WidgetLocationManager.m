@interface WidgetLocationManager
- (_TtC13WeatherWidget21WidgetLocationManager)init;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation WidgetLocationManager

- (_TtC13WeatherWidget21WidgetLocationManager)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_defaultCityManager));
  sub_10000DB48((uint64_t)self + OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_savedLocationsReader);

  sub_10000DB48((uint64_t)self + OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_locationCacheManager);
  swift_bridgeObjectRelease();
  sub_10000DB48((uint64_t)self + OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_geocodeManager);
  sub_10000DB48((uint64_t)self + OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_localSearchManager);
  sub_10000DB48((uint64_t)self + OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_iCloudStatusProvider);
  sub_10000DB48((uint64_t)self + OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_ubiquitousKeyValueStoreProvider);
  sub_10000DB48((uint64_t)self + OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_locationsOfInterestDataSource);
  sub_10000DB48((uint64_t)self + OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_locationDisplayContextReader);
  sub_10000DB48((uint64_t)self + OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_weatherLocationCoalescenceManager);
  sub_10000DB48((uint64_t)self + OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_locationMatchHelper);
  v3 = (char *)self + OBJC_IVAR____TtC13WeatherWidget21WidgetLocationManager_savedLocationFinder;

  sub_10000DB48((uint64_t)v3);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  sub_100046928(0, &qword_10016C7A8);
  sub_10012CBA0();
  id v6 = a3;
  v7 = self;
  sub_10004426C();

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_1000449C8();
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100044C88();
}

@end