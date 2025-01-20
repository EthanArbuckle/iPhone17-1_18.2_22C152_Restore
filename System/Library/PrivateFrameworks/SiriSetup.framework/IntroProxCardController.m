@interface IntroProxCardController
- (_TtC9SiriSetup23IntroProxCardController)initWithContentView:(id)a3;
- (void)tappedLink;
@end

@implementation IntroProxCardController

- (void)tappedLink
{
  v2 = self;
  v3 = (void *)sub_235A68AF0();
  id v4 = objc_msgSend(self, sel_presenterForPrivacySplashWithIdentifier_, v3);

  if (v4) {
    objc_msgSend(v4, sel_setPresentingViewController_, v2);
  }
  objc_msgSend(v4, sel_present);
}

- (_TtC9SiriSetup23IntroProxCardController)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC9SiriSetup23IntroProxCardController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SiriSetup23IntroProxCardController_orbView));
  id v3 = (char *)self + OBJC_IVAR____TtC9SiriSetup23IntroProxCardController_delegate;
  sub_235A3492C((uint64_t)v3);
}

@end