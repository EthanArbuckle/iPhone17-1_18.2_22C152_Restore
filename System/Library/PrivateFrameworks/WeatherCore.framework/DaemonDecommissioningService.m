@interface DaemonDecommissioningService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC11WeatherCore28DaemonDecommissioningService)init;
- (void)decommissionWith:(id)a3;
@end

@implementation DaemonDecommissioningService

- (_TtC11WeatherCore28DaemonDecommissioningService)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  Swift::Bool v9 = DaemonDecommissioningService.listener(_:shouldAcceptNewConnection:)((NSXPCListener)v8, (NSXPCConnection)v7);

  return v9;
}

- (void)decommissionWith:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  DaemonDecommissioningService.decommission(with:)((uint64_t)sub_1B49C356C, v5);

  swift_release();
}

@end