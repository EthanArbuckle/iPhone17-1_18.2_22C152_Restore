@interface PASUISignInViewModel
- (NSAttributedString)attributedMessage;
- (NSAttributedString)attributedTitle;
- (UIImage)headerImage;
- (_TtC23ProximityAppleIDSetupUI20PASUISignInViewModel)init;
- (id)authenticationContext;
- (void)signInViewController:(id)a3 didCompleteWithAuthenticationResults:(id)a4;
- (void)willAuthenticateWithContext:(id)a3;
@end

@implementation PASUISignInViewModel

- (NSAttributedString)attributedTitle
{
  v2 = self;
  id v3 = sub_22E7DA330();

  return (NSAttributedString *)v3;
}

- (NSAttributedString)attributedMessage
{
  v2 = self;
  id v3 = sub_22E7DA640();

  return (NSAttributedString *)v3;
}

- (UIImage)headerImage
{
  id v2 = sub_22E7DBF30();
  return (UIImage *)v2;
}

- (_TtC23ProximityAppleIDSetupUI20PASUISignInViewModel)init
{
  result = (_TtC23ProximityAppleIDSetupUI20PASUISignInViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_contextProvider);
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC23ProximityAppleIDSetupUI20PASUISignInViewModel_continueSignInAction);
  sub_22E7A6ED4(v3);
}

- (void)signInViewController:(id)a3 didCompleteWithAuthenticationResults:(id)a4
{
  uint64_t v6 = sub_22E7F3E10();
  id v7 = a3;
  v8 = self;
  sub_22E7DC4A8(v6);

  swift_bridgeObjectRelease();
}

- (void)willAuthenticateWithContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s23ProximityAppleIDSetupUI20PASUISignInViewModelC27willAuthenticateWithContextyySo023AKAppleIDAuthenticationL0CF_0(v4);
}

- (id)authenticationContext
{
  id v2 = self;
  id v3 = PASUISignInViewModel.authenticationContext()();

  return v3;
}

@end