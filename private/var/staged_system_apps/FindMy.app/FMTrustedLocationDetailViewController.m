@interface FMTrustedLocationDetailViewController
- (_TtC6FindMy37FMTrustedLocationDetailViewController)initWithCoder:(id)a3;
- (void)doneAction;
- (void)viewDidLoad;
@end

@implementation FMTrustedLocationDetailViewController

- (_TtC6FindMy37FMTrustedLocationDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004BFAD8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1004B8594();
}

- (void)doneAction
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_heightConstraint));
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_notifyWhenLeftBehindImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_notifyWhenLeftBehindDescription));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_trustedLocationsDescription));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_notifyWhenLeftBehindSwitchSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_notifyWhenLeftBehindSwitch));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_trustedLocationsSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_suggestionsSection));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy37FMTrustedLocationDetailViewController_nonMeDescriptionPadView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end