@interface MOOnboardingViewController
- (_TtC28MomentsOnboardingAndSettings26MOOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC28MomentsOnboardingAndSettings26MOOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)customizeButtonTapped;
- (void)notNowCloseSheet;
- (void)privacyAboutTapped;
- (void)turnOnSuggestionsButtonTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MOOnboardingViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for MOOnboardingViewController();
  [(OBBaseWelcomeController *)&v2 viewDidLoad];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  MOOnboardingViewController.viewDidAppear(_:)(a3);
}

- (void)privacyAboutTapped
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier);
  uint64_t v3 = *(void *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_journalBundleAboutIdentifier);
  v7 = self;
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x25A2AF5D0](v2, v3);
  swift_bridgeObjectRelease();
  v5 = (_TtC28MomentsOnboardingAndSettings26MOOnboardingViewController *)objc_msgSend(self, sel_presenterForPrivacySplashWithIdentifier_, v4);

  if (v5)
  {
    [(MOOnboardingViewController *)v5 setPresentingViewController:v7];
    [(MOOnboardingViewController *)v5 present];

    v6 = v5;
  }
  else
  {
    v6 = v7;
  }
}

- (void)notNowCloseSheet
{
  uint64_t v2 = self;
  MOOnboardingViewController.notNowCloseSheet()();
}

- (void)turnOnSuggestionsButtonTapped
{
  uint64_t v2 = self;
  MOOnboardingViewController.turnOnSuggestionsButtonTapped()();
}

- (void)customizeButtonTapped
{
  uint64_t v2 = self;
  MOOnboardingViewController.customizeButtonTapped()();
}

- (_TtC28MomentsOnboardingAndSettings26MOOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC28MomentsOnboardingAndSettings26MOOnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28MomentsOnboardingAndSettings26MOOnboardingViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC28MomentsOnboardingAndSettings26MOOnboardingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_onboardingManager));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_turnOnSuggestionsButton));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC28MomentsOnboardingAndSettings26MOOnboardingViewController_notNowButton);
}

@end