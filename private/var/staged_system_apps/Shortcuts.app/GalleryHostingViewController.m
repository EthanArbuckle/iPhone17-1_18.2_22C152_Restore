@interface GalleryHostingViewController
- (_TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController)initWithCoder:(id)a3;
- (_TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GalleryHostingViewController

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  v4 = self;
  id v5 = sub_10000C24C(a3);

  return v5;
}

- (_TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10003D1B4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10003D2AC();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10003D48C(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10003D548(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10003D930((uint64_t)a3);
}

- (_TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_10003DA9C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController_searchController));
  id v3 = (char *)self
     + OBJC_IVAR____TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController_destination;
  uint64_t v4 = type metadata accessor for GalleryNavigationDestination();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController_hostingController));
  sub_10002D6C4((uint64_t)self+ OBJC_IVAR____TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController_rootNavigator);
  swift_unknownObjectRelease();
  swift_release();
  sub_100025E44((uint64_t)self+ OBJC_IVAR____TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController_pendingTest, &qword_1000F50B8);
  id v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9ShortcutsP33_5A6DD2238BCF5ED8887E2D852EDD3B1F28GalleryHostingViewController_pendingPresentation);
}

@end