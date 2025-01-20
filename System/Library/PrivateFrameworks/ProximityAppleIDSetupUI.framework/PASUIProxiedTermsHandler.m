@interface PASUIProxiedTermsHandler
- (_TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler)init;
- (void)genericTermsRemoteUI:(id)a3 acceptedTermsInfo:(id)a4;
- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4;
@end

@implementation PASUIProxiedTermsHandler

- (_TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler)init
{
  result = (_TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_proxiedDevice));
  sub_22E7A6ED4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_acceptAction));
  sub_22E7A6ED4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC23ProximityAppleIDSetupUI24PASUIProxiedTermsHandler_declineAction));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  if (v4) {
    sub_22E7B6E00();
  }
  else {
    sub_22E7B7630();
  }
}

- (void)genericTermsRemoteUI:(id)a3 acceptedTermsInfo:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_22E7F3E10();
    id v7 = a3;
    v8 = self;
    sub_22E7B6C50(v6);

    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

@end