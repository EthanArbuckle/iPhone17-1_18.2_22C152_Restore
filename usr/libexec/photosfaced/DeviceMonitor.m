@interface DeviceMonitor
- (_TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor)init;
- (void)deviceIsAsleepDidChange:(id)a3 isAsleep:(BOOL)a4;
- (void)deviceIsClassCConnectedDidChange:(id)a3 isClassCConnected:(BOOL)a4;
- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4;
- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4;
- (void)devicePluggedInStateDidChange:(id)a3 pluggedIn:(BOOL)a4;
@end

@implementation DeviceMonitor

- (_TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor)init
{
  v2 = (char *)self + OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_nearby;
  *(void *)v2 = &_swiftEmptyArrayStorage;
  v2[8] = 1;
  v3 = (char *)self + OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_connected;
  *(void *)v3 = &_swiftEmptyArrayStorage;
  v3[8] = 1;
  v4 = (char *)self + OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_asleep;
  *(void *)v4 = &_swiftEmptyArrayStorage;
  v4[8] = 1;
  v5 = (char *)self + OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_classCConnected;
  *(void *)v5 = &_swiftEmptyArrayStorage;
  v5[8] = 1;
  v6 = (char *)self + OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_pluggedIn;
  *(void *)v6 = &_swiftEmptyArrayStorage;
  v6[8] = 1;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DeviceMonitor();
  return [(DeviceMonitor *)&v8 init];
}

- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_100080CBC(a4, 0xD000000000000024, 0x80000001000D6880);
}

- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_100080CBC(a4, 0xD00000000000002ALL, 0x80000001000D6850);
}

- (void)deviceIsAsleepDidChange:(id)a3 isAsleep:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_100080CBC(a4, 0xD000000000000024, 0x80000001000D6820);
}

- (void)deviceIsClassCConnectedDidChange:(id)a3 isClassCConnected:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_100080CBC(a4, 0xD000000000000036, 0x80000001000D67E0);
}

- (void)devicePluggedInStateDidChange:(id)a3 pluggedIn:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_100080CBC(a4, 0xD00000000000002ALL, 0x80000001000D6780);
}

- (void).cxx_destruct
{
  sub_100081030(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_nearby), self->nearby[OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_nearby]);
  sub_100081030(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_connected), self->nearby[OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_connected]);
  sub_100081030(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_asleep), self->nearby[OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_asleep]);
  sub_100081030(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_classCConnected), self->nearby[OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_classCConnected]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_pluggedIn);
  char v4 = self->nearby[OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_pluggedIn];

  sub_100081030(v3, v4);
}

@end