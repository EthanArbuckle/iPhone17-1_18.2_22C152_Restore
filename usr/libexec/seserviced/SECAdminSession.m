@interface SECAdminSession
- (_TtC10seserviced15SECAdminSession)init;
@end

@implementation SECAdminSession

- (_TtC10seserviced15SECAdminSession)init
{
  result = (_TtC10seserviced15SECAdminSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10007594C((uint64_t)self + OBJC_IVAR____TtC10seserviced15SECAdminSession_networkController);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10008BECC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10seserviced15SECAdminSession_sessionManagementDelegate));
  v3 = (char *)self + OBJC_IVAR____TtC10seserviced15SECAdminSession_sessionIdentifier;
  uint64_t v4 = type metadata accessor for UUID();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end