@interface FMBaseContentViewController
- (_TtC6FindMy27FMBaseContentViewController)initWithCoder:(id)a3;
- (_TtC6FindMy27FMBaseContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation FMBaseContentViewController

- (_TtC6FindMy27FMBaseContentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100289118();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100288630();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100288814();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100288434(v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1002889BC((uint64_t)a3);
}

- (_TtC6FindMy27FMBaseContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy27FMBaseContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_primaryBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_primarySeperator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_tertiaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_actionBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_tertiaryRowStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_headerBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_batteryIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_secondaryLabelTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_locatingIndicatorHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_batteryIndicatorHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_scrollViewBottomConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_locatingIndicator);
}

@end