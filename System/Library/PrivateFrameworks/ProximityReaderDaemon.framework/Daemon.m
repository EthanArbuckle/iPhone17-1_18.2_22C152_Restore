@interface Daemon
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC21ProximityReaderDaemon6Daemon)init;
@end

@implementation Daemon

- (_TtC21ProximityReaderDaemon6Daemon)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21ProximityReaderDaemon6Daemon_temporaryListeners) = (Class)MEMORY[0x263F8EE78];
  sub_25AB93AD8();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(Daemon *)&v5 init];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  Swift::Bool v9 = Daemon.listener(_:shouldAcceptNewConnection:)((NSXPCListener)v6, (NSXPCConnection)v7);

  return v9;
}

- (void).cxx_destruct
{
}

@end