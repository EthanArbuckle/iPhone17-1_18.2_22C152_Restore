@interface DataSharingWelcomeController
- (_TtC9SiriSetup28DataSharingWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC9SiriSetup28DataSharingWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)aboutDataSharingTapped;
- (void)notNowTapped;
- (void)shareTapped;
@end

@implementation DataSharingWelcomeController

- (void)aboutDataSharingTapped
{
  v2 = self;
  v3 = (void *)sub_235A68AF0();
  id v4 = objc_msgSend(self, sel_presenterForPrivacySplashWithIdentifier_, v3);

  if (v4) {
    objc_msgSend(v4, sel_setPresentingViewController_, v2);
  }
  objc_msgSend(v4, sel_present);
}

- (void)shareTapped
{
}

- (void)notNowTapped
{
}

- (_TtC9SiriSetup28DataSharingWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC9SiriSetup28DataSharingWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SiriSetup28DataSharingWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC9SiriSetup28DataSharingWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_235A3492C((uint64_t)self + OBJC_IVAR____TtC9SiriSetup28DataSharingWelcomeController_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SiriSetup28DataSharingWelcomeController_orbView);
}

@end