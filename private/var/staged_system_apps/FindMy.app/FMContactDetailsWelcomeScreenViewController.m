@interface FMContactDetailsWelcomeScreenViewController
- (_TtC6FindMy43FMContactDetailsWelcomeScreenViewController)initWithCoder:(id)a3;
- (void)cancelActionWithSender:(id)a3;
- (void)doneAction;
- (void)viewDidLoad;
@end

@implementation FMContactDetailsWelcomeScreenViewController

- (_TtC6FindMy43FMContactDetailsWelcomeScreenViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10022C36C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100229864();
}

- (void)doneAction
{
  v2 = self;
  sub_10022B1D4((uint64_t)v2);
}

- (void)cancelActionWithSender:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_contentStackView));
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_deviceImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_deviceNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_phoneNumberLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_showContactDetailsSwitchSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_showContactDetailsSwitch));
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC6FindMy43FMContactDetailsWelcomeScreenViewController_device;
  uint64_t v4 = type metadata accessor for FMIPDevice();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end