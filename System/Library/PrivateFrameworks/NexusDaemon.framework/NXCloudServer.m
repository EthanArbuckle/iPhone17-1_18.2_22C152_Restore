@interface NXCloudServer
- (NSString)description;
- (_TtC11NexusDaemon13NXCloudServer)init;
- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6;
@end

@implementation NXCloudServer

- (NSString)description
{
  v2 = self;
  sub_257BCB230();

  v3 = (void *)sub_257C0A9F0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)service:(id)a3 account:(id)a4 inviteReceivedForSession:(id)a5 fromID:(id)a6
{
  if (a6)
  {
    uint64_t v10 = sub_257C0AA00();
    unint64_t v12 = v11;
  }
  else
  {
    uint64_t v10 = 0;
    unint64_t v12 = 0;
  }
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v16 = self;
  sub_257BCE288(a3, a5, v10, v12);

  swift_bridgeObjectRelease();
}

- (_TtC11NexusDaemon13NXCloudServer)init
{
  result = (_TtC11NexusDaemon13NXCloudServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC11NexusDaemon13NXCloudServer__environment);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end