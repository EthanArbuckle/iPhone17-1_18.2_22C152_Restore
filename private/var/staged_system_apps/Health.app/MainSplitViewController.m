@interface MainSplitViewController
- (_TtC6Health23MainSplitViewController)init;
- (_TtC6Health23MainSplitViewController)initWithCoder:(id)a3;
- (_TtC6Health23MainSplitViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC6Health23MainSplitViewController)initWithStyle:(int64_t)a3;
- (void)restoreUserActivityState:(id)a3;
- (void)setViewController:(id)a3 forColumn:(int64_t)a4;
- (void)showAndActivateSearchBar;
- (void)showDetailViewController:(id)a3 sender:(id)a4;
- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4;
- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4;
- (void)splitViewControllerDidCollapse:(id)a3;
- (void)splitViewControllerDidExpand:(id)a3;
- (void)traitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MainSplitViewController

- (_TtC6Health23MainSplitViewController)init
{
  return (_TtC6Health23MainSplitViewController *)sub_100060398();
}

- (_TtC6Health23MainSplitViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100064DF0();
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MainSplitViewController();
  id v4 = v7.receiver;
  [(MainSplitViewController *)&v7 viewIsAppearing:v3];
  id v5 = sub_100060308();
  id v6 = [v5 navigationBar];

  [v6 setPrefersLargeTitles:1];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100060750();
}

- (void)setViewController:(id)a3 forColumn:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MainSplitViewController();
  id v6 = (char *)a3;
  objc_super v7 = (char *)v9.receiver;
  [(MainSplitViewController *)&v9 setViewController:v6 forColumn:a4];
  if (a4 == 2)
  {
    v8 = sub_100060078();
    sub_1000C2F80(v6);

    id v6 = v7;
    objc_super v7 = v8;
  }
}

- (void)traitCollectionDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  objc_super v7 = self;
  sub_100064FE4(v6);
  swift_unknownObjectRelease();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MainSplitViewController();
  swift_unknownObjectRetain();
  id v7 = v8.receiver;
  -[MainSplitViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  if (qword_1001040A8 != -1) {
    swift_once();
  }
  sub_100006F78();
  dispatch thunk of HealthAppAnalyticsManager.submitResizeWindowInteraction(with:)();
  swift_unknownObjectRelease();

  swift_release();
}

- (void)showAndActivateSearchBar
{
  v2 = self;
  sub_100060C1C();
  sub_1000625CC();
  BOOL v3 = sub_100060078();
  id v4 = sub_1000C1AC8();

  id v5 = [v4 searchBar];
  [v5 becomeFirstResponder];
}

- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4
{
}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
}

- (void)showDetailViewController:(id)a3 sender:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    id v7 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a3;
    objc_super v9 = self;
  }
  sub_100061088(a3, (uint64_t)v10);

  sub_100011F6C((uint64_t)v10, (uint64_t)&qword_1001059F0, (uint64_t)&type metadata for Any + 8, (uint64_t (*)(void, uint64_t, uint64_t, void *))sub_10006579C);
}

- (void)splitViewControllerDidCollapse:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000612A8(v4);
}

- (void)splitViewControllerDidExpand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100061ABC(v4);
}

- (_TtC6Health23MainSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6Health23MainSplitViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC6Health23MainSplitViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC6Health23MainSplitViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s6Health23OpenSleepScheduleIntentVwxx_0((uint64_t)self + OBJC_IVAR____TtC6Health23MainSplitViewController_pinnedContentManager);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController_providedHealthStore));
  _s6Health23OpenSleepScheduleIntentVwxx_0((uint64_t)self + OBJC_IVAR____TtC6Health23MainSplitViewController_providedHealthExperienceStore);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___providedHealthToolbox));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController_ppt_selectedViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___summaryViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___summaryNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___sharingViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___sharingNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___browseViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___browseNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___mainTabBarController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___sidebarViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6Health23MainSplitViewController____lazy_storage___sidebarNavigationController));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6Health23MainSplitViewController_observerDelegates);
}

- (void)restoreUserActivityState:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100062C9C(v4);
}

@end