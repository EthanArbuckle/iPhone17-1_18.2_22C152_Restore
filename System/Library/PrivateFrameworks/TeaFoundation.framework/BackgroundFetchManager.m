@interface BackgroundFetchManager
- (_TtC13TeaFoundation22BackgroundFetchManager)init;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
@end

@implementation BackgroundFetchManager

- (_TtC13TeaFoundation22BackgroundFetchManager)init
{
  return (_TtC13TeaFoundation22BackgroundFetchManager *)BackgroundFetchManager.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13TeaFoundation22BackgroundFetchManager_backgroundTaskSchedulingQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13TeaFoundation22BackgroundFetchManager____lazy_storage___locationManager));

  swift_release();
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8.super.Class isa = (Class)self;
  Class isa = v8.super.isa;
  v8._internal = v7;
  BackgroundFetchManager.locationManager(_:didStartMonitoringFor:)(v8, v9);
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  v10 = self;
  BackgroundFetchManager.locationManager(_:monitoringDidFailFor:withError:)((uint64_t)v10, a4, v11);
}

@end