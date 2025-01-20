@interface SDAuthenticationSession
- (_TtC16DaemoniOSLibrary23SDAuthenticationSession)init;
@end

@implementation SDAuthenticationSession

- (_TtC16DaemoniOSLibrary23SDAuthenticationSession)init
{
  result = (_TtC16DaemoniOSLibrary23SDAuthenticationSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationSession_delegate, &qword_100978040);
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationSession_peerDevice, &qword_10097BB50);

  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationSession_sessionID;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_unknownObjectRelease();
}

@end