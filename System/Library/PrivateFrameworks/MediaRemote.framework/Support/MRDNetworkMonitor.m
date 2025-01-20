@interface MRDNetworkMonitor
- (BOOL)isUsingWifi;
- (BOOL)isUsingWiredEthernet;
- (MRDNetworkMonitor)init;
- (void)cancel;
- (void)startWithQueue:(id)a3;
@end

@implementation MRDNetworkMonitor

- (void)startWithQueue:(id)a3
{
  id v4 = a3;
  v5 = self;
  NWPathMonitor.start(queue:)();
}

- (void)cancel
{
  v2 = self;
  NWPathMonitor.cancel()();
}

- (BOOL)isUsingWifi
{
  return sub_100326894(self, (uint64_t)a2, &enum case for NWInterface.InterfaceType.wifi(_:));
}

- (BOOL)isUsingWiredEthernet
{
  return sub_100326894(self, (uint64_t)a2, &enum case for NWInterface.InterfaceType.wiredEthernet(_:));
}

- (MRDNetworkMonitor)init
{
  uint64_t v3 = OBJC_IVAR___MRDNetworkMonitor_monitor;
  type metadata accessor for NWPathMonitor();
  swift_allocObject();
  id v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)NWPathMonitor.init()();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for NetworkMonitor();
  return [(MRDNetworkMonitor *)&v6 init];
}

- (void).cxx_destruct
{
}

@end