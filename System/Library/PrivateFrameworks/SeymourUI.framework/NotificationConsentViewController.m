@interface NotificationConsentViewController
- (_TtC9SeymourUI33NotificationConsentViewController)initWithCoder:(id)a3;
- (_TtC9SeymourUI33NotificationConsentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapContinueButton;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation NotificationConsentViewController

- (_TtC9SeymourUI33NotificationConsentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s9SeymourUI33NotificationConsentViewControllerC5coderACSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  v2 = self;
  NotificationConsentViewController.viewDidLoad()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  NotificationConsentViewController.traitCollectionDidChange(_:)(v9);
}

- (void)didTapContinueButton
{
  v2 = self;
  sub_23A685D58();
}

- (_TtC9SeymourUI33NotificationConsentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9SeymourUI33NotificationConsentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_continueButton));
  id v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_contentAvailability;
  uint64_t v4 = sub_23A7F8D58();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_fallbackLocalizationBundle));
  sub_23A686F68((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_storefrontLocalizer);
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController_continueButtonHandler));
  id v5 = (char *)self
     + OBJC_IVAR____TtC9SeymourUI33NotificationConsentViewController__fitnessPlusNotificationSettingsEnabled;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF5F7F0);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end