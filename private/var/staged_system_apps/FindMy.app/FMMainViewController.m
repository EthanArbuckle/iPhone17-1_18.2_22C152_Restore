@interface FMMainViewController
- (BOOL)shouldAutorotate;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC6FindMy20FMMainViewController)initWithCoder:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FMMainViewController

- (void)viewLayoutMarginsDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMMainViewController();
  id v2 = v7.receiver;
  [(FMMainViewController *)&v7 viewLayoutMarginsDidChange];
  if (qword_1006AE228 != -1) {
    swift_once();
  }
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    [v3 layoutMargins];
    uint64_t v6 = v5;

    qword_1006D20C8 = v6;
  }
  else
  {
    __break(1u);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  id v3 = self;
  v4 = self;
  id v5 = [v3 currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  if (v6 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                     + OBJC_IVAR____TtC6FindMy20FMMainViewController_initialCardContainer));
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100006F84(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10000A888(a3);
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_10001E824();
}

- (_TtC6FindMy20FMMainViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100369E18();
}

- (BOOL)shouldAutorotate
{
  id v3 = self;
  v4 = self;
  id v5 = [v3 currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  return v6 == (id)1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10036A060();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMMainViewController_noLocationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMMainViewController_mapController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMMainViewController_initialCardContainer));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end