@interface WeatherDataServiceProxy
- (_TtC13WeatherDaemon23WeatherDataServiceProxy)init;
- (void)fetchAirQualityScaleWith:(id)a3 completion:(id)a4;
- (void)fetchAvailableDataSetsWith:(id)a3 completion:(id)a4;
- (void)performRequestsWith:(id)a3 completion:(id)a4;
@end

@implementation WeatherDataServiceProxy

- (_TtC13WeatherDaemon23WeatherDataServiceProxy)init
{
}

- (void).cxx_destruct
{
  sub_1A9459FB0((uint64_t)self + OBJC_IVAR____TtC13WeatherDaemon23WeatherDataServiceProxy_endpoint, (void (*)(void))type metadata accessor for WDSEndpoint);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13WeatherDaemon23WeatherDataServiceProxy_networkMonitor);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13WeatherDaemon23WeatherDataServiceProxy_authenticator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13WeatherDaemon23WeatherDataServiceProxy_appConfigurationSettingsProvider);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)performRequestsWith:(id)a3 completion:(id)a4
{
}

- (void)fetchAvailableDataSetsWith:(id)a3 completion:(id)a4
{
}

- (void)fetchAirQualityScaleWith:(id)a3 completion:(id)a4
{
}

@end