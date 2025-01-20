@interface WebAuthenticationSession
- (_TtC8ShelfKit24WebAuthenticationSession)init;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
@end

@implementation WebAuthenticationSession

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (id)sub_984A0();

  return v6;
}

- (_TtC8ShelfKit24WebAuthenticationSession)init
{
  result = (_TtC8ShelfKit24WebAuthenticationSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8ShelfKit24WebAuthenticationSession_authorizationURL;
  uint64_t v4 = sub_3D2350();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8ShelfKit24WebAuthenticationSession_authenticationSession));

  sub_3D4C4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit24WebAuthenticationSession_startCompletion));

  swift_bridgeObjectRelease();
}

@end