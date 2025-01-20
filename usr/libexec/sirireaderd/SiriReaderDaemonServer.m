@interface SiriReaderDaemonServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC11sirireaderd22SiriReaderDaemonServer)init;
@end

@implementation SiriReaderDaemonServer

- (_TtC11sirireaderd22SiriReaderDaemonServer)init
{
  return (_TtC11sirireaderd22SiriReaderDaemonServer *)sub_10000DCD0();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11sirireaderd22SiriReaderDaemonServer_interface);
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  [v8 setExportedInterface:v6];
  [v8 setExportedObject:*(Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC11sirireaderd22SiriReaderDaemonServer_server)];
  [v8 resume];

  return 1;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11sirireaderd22SiriReaderDaemonServer_interface);
}

@end