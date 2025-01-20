@interface WebAccessAuthenticator
- (_TtC16NewsSubscription22WebAccessAuthenticator)init;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
@end

@implementation WebAccessAuthenticator

- (_TtC16NewsSubscription22WebAccessAuthenticator)init
{
  result = (_TtC16NewsSubscription22WebAccessAuthenticator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription22WebAccessAuthenticator_purchaseController));
  sub_1BFA9D07C((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription22WebAccessAuthenticator_authenticationURL);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16NewsSubscription22WebAccessAuthenticator_webSession);
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1F48]), sel_init);
  return v3;
}

@end