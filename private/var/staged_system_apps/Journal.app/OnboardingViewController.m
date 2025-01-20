@interface OnboardingViewController
- (_TtC7Journal24OnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC7Journal24OnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)continueButtonTapped;
@end

@implementation OnboardingViewController

- (void)continueButtonTapped
{
  v2 = self;
  sub_100189A10();
  v3 = *(void (**)(uint64_t))&v2->OBWelcomeController_opaque[OBJC_IVAR____TtC7Journal24OnboardingViewController_onComplete];
  uint64_t v4 = swift_retain();
  v3(v4);

  swift_release();
}

- (_TtC7Journal24OnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC7Journal24OnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7Journal24OnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC7Journal24OnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = &self->OBWelcomeController_opaque[OBJC_IVAR____TtC7Journal24OnboardingViewController_logger];
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC7Journal24OnboardingViewController____lazy_storage___onboardingAsset];
}

@end