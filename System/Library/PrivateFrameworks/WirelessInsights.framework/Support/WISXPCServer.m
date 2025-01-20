@interface WISXPCServer
- (BOOL)startAndReturnError:(id *)a3;
- (WISXPCServer)init;
@end

@implementation WISXPCServer

- (BOOL)startAndReturnError:(id *)a3
{
  v3 = self;
  sub_100125F7C();

  return 1;
}

- (WISXPCServer)init
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___WISXPCServer_serviceName);
  void *v2 = 0xD00000000000001FLL;
  v2[1] = 0x8000000100186F20;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___WISXPCServer_listener) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for XPCServer();
  return [(WISXPCServer *)&v4 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end