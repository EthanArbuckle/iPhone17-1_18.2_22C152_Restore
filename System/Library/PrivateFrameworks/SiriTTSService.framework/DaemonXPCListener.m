@interface DaemonXPCListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC13SiriTTSDaemon17DaemonXPCListener)init;
- (void)dealloc;
@end

@implementation DaemonXPCListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000057F0(v7);

  return v9 & 1;
}

- (_TtC13SiriTTSDaemon17DaemonXPCListener)init
{
  return (_TtC13SiriTTSDaemon17DaemonXPCListener *)DaemonXPCListener.init()();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SiriTTSDaemon17DaemonXPCListener_listener);
  v3 = self;
  [v2 setDelegate:0];
  [v2 invalidate];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for DaemonXPCListener();
  [(DaemonXPCListener *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end