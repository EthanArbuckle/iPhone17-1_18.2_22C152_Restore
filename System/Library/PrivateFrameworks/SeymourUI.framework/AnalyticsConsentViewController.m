@interface AnalyticsConsentViewController
- (_TtC9SeymourUI30AnalyticsConsentViewController)initWithTitle:(id)a3;
- (_TtC9SeymourUI30AnalyticsConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC9SeymourUI30AnalyticsConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapLearnMoreButton;
- (void)didTapOptInButton;
- (void)didTapOptOutButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AnalyticsConsentViewController

- (void)viewDidLoad
{
  v2 = self;
  AnalyticsConsentViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(OBBaseWelcomeController *)&v5 viewDidAppear:v3];
  sub_239E0FE98();
  sub_23A7FC148();
}

- (void)didTapLearnMoreButton
{
  v2 = self;
  sub_239E10088();
}

- (void)didTapOptInButton
{
}

- (void)didTapOptOutButton
{
}

- (_TtC9SeymourUI30AnalyticsConsentViewController)initWithTitle:(id)a3
{
  result = (_TtC9SeymourUI30AnalyticsConsentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI30AnalyticsConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC9SeymourUI30AnalyticsConsentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI30AnalyticsConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC9SeymourUI30AnalyticsConsentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30AnalyticsConsentViewController_privacyPreferenceClient);
  BOOL v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI30AnalyticsConsentViewController_metricPage;
  uint64_t v4 = sub_23A7F6C38();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI30AnalyticsConsentViewController_onConsent));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI30AnalyticsConsentViewController_onDismiss);

  sub_239C25118(v5);
}

@end