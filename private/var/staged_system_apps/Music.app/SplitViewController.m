@interface SplitViewController
- (NSString)playActivityFeatureName;
- (_TtC5Music19SplitViewController)initWithCoder:(id)a3;
- (_TtC5Music19SplitViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5Music19SplitViewController)initWithStyle:(int64_t)a3;
- (void)setViewController:(id)a3 forColumn:(int64_t)a4;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SplitViewController

- (_TtC5Music19SplitViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100347E7C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10033D750();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SplitViewController(0);
  id v4 = v7.receiver;
  [(SplitViewController *)&v7 viewWillAppear:v3];
  static ApplicationCapabilities.shared.getter((uint64_t)v8);
  uint64_t v5 = v9;
  swift_bridgeObjectRetain();
  sub_10005E8DC((uint64_t)v8);
  char v6 = sub_10019AA28(0xAu, v5);
  swift_bridgeObjectRelease();
  if (v6)
  {
    if (qword_101097EE0 != -1) {
      swift_once();
    }
    if (*(unsigned char *)(qword_101129470 + OBJC_IVAR____TtCO5Music3MLI8Observer_didReceiveError) == 1) {
      sub_10030ACFC(0);
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10033DCA0();
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SplitViewController(0);
  id v2 = v3.receiver;
  [(SplitViewController *)&v3 viewLayoutMarginsDidChange];
  sub_10033F208();
  sub_10033F0A4();
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SplitViewController(0);
  id v4 = a3;
  id v5 = v8.receiver;
  [(SplitViewController *)&v8 traitCollectionDidChange:v4];
  id v6 = [v5 traitCollection];
  id v7 = [v6 horizontalSizeClass];

  sub_100781DC0(v7 == (id)2);
}

- (void)setViewController:(id)a3 forColumn:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SplitViewController(0);
  id v6 = a3;
  id v7 = v10.receiver;
  [(SplitViewController *)&v10 setViewController:v6 forColumn:a4];
  Swift::Int v8 = sub_1000C9058((uint64_t)&off_100FC6618);
  id v9 = v7;
  sub_100347918(v8, v9);

  swift_bridgeObjectRelease();
}

- (NSString)playActivityFeatureName
{
  id v2 = self;
  sub_10033E6C8();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC5Music19SplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (_TtC5Music19SplitViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC5Music19SplitViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC5Music19SplitViewController_libraryImportViewModel, &qword_1010BB850);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19SplitViewController_tabsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19SplitViewController_bottomPlayerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19SplitViewController_sidebarMenuViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19SplitViewController_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19SplitViewController_miniPlayerPaletteInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music19SplitViewController_sidebarViewController));
  swift_release();
  sub_100348BB0((uint64_t)self + OBJC_IVAR____TtC5Music19SplitViewController_navigationStacks, type metadata accessor for SplitViewController.NavigationStacks);
  sub_1003488D4(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5Music19SplitViewController_keyboardObserver));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC5Music19SplitViewController_ppt_onContentIsReady);

  sub_10006ADFC(v3);
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  sub_1003480F0();
}

@end