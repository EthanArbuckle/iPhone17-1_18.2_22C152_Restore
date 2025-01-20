@interface FormatViewController
- (_TtC8NewsFeed20FormatViewController)initWithCoder:(id)a3;
- (_TtC8NewsFeed20FormatViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)startTraversingWithDirection:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation FormatViewController

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  swift_retain();
  sub_1C1519F6C();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(FormatViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_1C019B9B4((uint64_t)self + OBJC_IVAR____TtC8NewsFeed20FormatViewController_pluggableDelegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed20FormatViewController_blueprintViewController));
  swift_release();
  swift_unknownObjectRelease();
  sub_1C019B9B4((uint64_t)self + OBJC_IVAR____TtC8NewsFeed20FormatViewController_selectionProvider);
  swift_release();
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed20FormatViewController____lazy_storage___maskLayer);
}

- (_TtC8NewsFeed20FormatViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C1273724();
}

- (_TtC8NewsFeed20FormatViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8NewsFeed20FormatViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  FormatViewController.viewDidLoad()();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  FormatViewController.viewWillLayoutSubviews()();
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(FormatViewController *)&v4 viewDidLayoutSubviews];
  sub_1C151B8DC();
  id v3 = (void *)sub_1C151B41C();
  swift_release();
  objc_msgSend(v3, sel_layoutIfNeeded);

  sub_1C15180DC();
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4 = self;
  FormatViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(FormatViewController *)&v5 viewDidAppear:v3];
  sub_1C1519FAC();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(FormatViewController *)&v5 viewWillDisappear:v3];
  sub_1C151AACC();
  sub_1C1519F7C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  FormatViewController.traitCollectionDidChange(_:)(v9);
}

- (void)startTraversingWithDirection:(int64_t)a3
{
  BOOL v3 = self;
  sub_1C151B8EC();
}

@end