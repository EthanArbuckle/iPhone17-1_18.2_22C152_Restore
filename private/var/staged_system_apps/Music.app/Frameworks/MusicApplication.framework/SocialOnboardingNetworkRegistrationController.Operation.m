@interface SocialOnboardingNetworkRegistrationController.Operation
- (_TtCC16MusicApplication45SocialOnboardingNetworkRegistrationControllerP33_A38BE87C3BD3A87290E3ECE22270D9819Operation)init;
- (void)execute;
- (void)finishWithError:(id)a3;
@end

@implementation SocialOnboardingNetworkRegistrationController.Operation

- (void)execute
{
  v2 = self;
  sub_FF224();
}

- (void)finishWithError:(id)a3
{
  BOOL v4 = a3 == 0;
  v5 = *(void (**)(BOOL, id))&self->responseHandler[OBJC_IVAR____TtCC16MusicApplication45SocialOnboardingNetworkRegistrationControllerP33_A38BE87C3BD3A87290E3ECE22270D9819Operation_responseHandler];
  v6 = self;
  id v7 = a3;
  v5(v4, a3);
  if (a3) {
    v8 = (void *)sub_AB07B0();
  }
  else {
    v8 = 0;
  }
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for SocialOnboardingNetworkRegistrationController.Operation(0);
  [(SocialOnboardingNetworkRegistrationController.Operation *)&v9 finishWithError:v8];
}

- (_TtCC16MusicApplication45SocialOnboardingNetworkRegistrationControllerP33_A38BE87C3BD3A87290E3ECE22270D9819Operation)init
{
  result = (_TtCC16MusicApplication45SocialOnboardingNetworkRegistrationControllerP33_A38BE87C3BD3A87290E3ECE22270D9819Operation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = &self->responseHandler[OBJC_IVAR____TtCC16MusicApplication45SocialOnboardingNetworkRegistrationControllerP33_A38BE87C3BD3A87290E3ECE22270D9819Operation_registrationURL];
  uint64_t v3 = sub_AB0930();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_release();
}

@end