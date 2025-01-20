@interface RDBarebonesDaemon
- (_TtC7remindd17RDBarebonesDaemon)init;
@end

@implementation RDBarebonesDaemon

- (_TtC7remindd17RDBarebonesDaemon)init
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for RDXPCBarebonesDaemon());
  v4 = self;
  id v5 = [v3 init];
  v6 = (Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC7remindd17RDBarebonesDaemon_xpcDaemon);
  void *v6 = v5;
  v6[1] = &off_1008C8958;
  uint64_t v7 = qword_1009070B8;
  id v8 = v5;
  if (v7 != -1) {
    swift_once();
  }
  v9 = (void *)qword_100942058;
  v10 = (char *)objc_allocWithZone((Class)type metadata accessor for RDClientConnectionListener());
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC7remindd17RDBarebonesDaemon_xpcClientConnectionListener) = (Class)sub_1005C758C(v8, v9, v10);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for RDBarebonesDaemon();
  return [(RDBarebonesDaemon *)&v12 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd17RDBarebonesDaemon_xpcClientConnectionListener);
}

@end