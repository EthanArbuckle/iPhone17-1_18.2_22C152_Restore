@interface FMUnknownItemsLandingViewController
- (_TtC6FindMy35FMUnknownItemsLandingViewController)initWithCoder:(id)a3;
- (void)handleButtonTap:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FMUnknownItemsLandingViewController

- (_TtC6FindMy35FMUnknownItemsLandingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10028D464();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMUnknownItemsLandingViewController();
  id v2 = v3.receiver;
  [(FMBaseContentViewController *)&v3 viewDidLoad];
  sub_10028AC00();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMUnknownItemsLandingViewController();
  id v4 = v5.receiver;
  [(FMUnknownItemsLandingViewController *)&v5 viewDidAppear:v3];
  sub_10028A840();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMUnknownItemsLandingViewController();
  [(FMUnknownItemsLandingViewController *)&v4 viewWillAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMUnknownItemsLandingViewController();
  id v4 = v6.receiver;
  [(FMUnknownItemsLandingViewController *)&v6 viewDidDisappear:v3];
  id v5 = [self defaultCenter];
  if (qword_1006AE480 != -1) {
    swift_once();
  }
  [v5 removeObserver:v4 name:qword_1006D2978 object:0];
}

- (void)viewLayoutMarginsDidChange
{
  id v2 = self;
  sub_10028A5DC();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMUnknownItemsLandingViewController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(FMBaseContentViewController *)&v6 traitCollectionDidChange:v4];
  sub_10028AC00();
}

- (void)handleButtonTap:(id)a3
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v5 = a3;
    objc_super v6 = self;
    sub_100436768();

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_contentContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_heroImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_primarySubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_secondarySubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_searchButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_spacerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_searchButtonTopConstraint));
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy35FMUnknownItemsLandingViewController_delegate);

  swift_unknownObjectRelease();
}

@end