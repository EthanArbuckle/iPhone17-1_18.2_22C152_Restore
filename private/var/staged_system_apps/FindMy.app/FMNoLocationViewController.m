@interface FMNoLocationViewController
- (_TtC6FindMy26FMNoLocationViewController)initWithCoder:(id)a3;
- (_TtC6FindMy26FMNoLocationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)previousSelection;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation FMNoLocationViewController

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10000B624();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100014BD0();
}

- (_TtC6FindMy26FMNoLocationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001426D0();
}

- (void)previousSelection
{
  v2 = self;
  sub_10013C3D0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100143058();
}

- (_TtC6FindMy26FMNoLocationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy26FMNoLocationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_visualEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_darkenerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_markerImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_iconImageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMNoLocationViewController_markerImageViewTopConstraint));
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end