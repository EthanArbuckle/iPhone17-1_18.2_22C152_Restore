@interface SharedFlowPluginXPCServer.Listener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtCC14SiriKitRuntime25SharedFlowPluginXPCServer8Listener)init;
@end

@implementation SharedFlowPluginXPCServer.Listener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = specialized SharedFlowPluginXPCServer.Listener.listener(_:shouldAcceptNewConnection:)(v7);

  return v9 & 1;
}

- (_TtCC14SiriKitRuntime25SharedFlowPluginXPCServer8Listener)init
{
  result = (_TtCC14SiriKitRuntime25SharedFlowPluginXPCServer8Listener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC14SiriKitRuntime25SharedFlowPluginXPCServer8Listener_listener);
}

@end