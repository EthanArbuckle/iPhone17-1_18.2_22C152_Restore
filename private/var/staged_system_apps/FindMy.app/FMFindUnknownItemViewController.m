@interface FMFindUnknownItemViewController
- (_TtC6FindMy31FMFindUnknownItemViewController)initWithCoder:(id)a3;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (void)handleCloseButtonWithSender:(id)a3;
- (void)handleContinueButton;
- (void)scrollViewDidScroll:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FMFindUnknownItemViewController

- (_TtC6FindMy31FMFindUnknownItemViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100534AAC();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMFindUnknownItemViewController();
  id v2 = v3.receiver;
  [(FMFindUnknownItemViewController *)&v3 viewDidLoad];
  sub_10052CA10();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10052C320(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_10052C7AC(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FMFindUnknownItemViewController();
  id v4 = v9.receiver;
  id v5 = a3;
  [(FMFindUnknownItemViewController *)&v9 traitCollectionDidChange:v5];
  id v6 = [v4 view];
  if (v6)
  {
    v7 = v6;
    id v8 = [self systemBackgroundColor];
    [v7 setBackgroundColor:v8];
  }
  else
  {
    __break(1u);
  }
}

- (void)handleCloseButtonWithSender:(id)a3
{
}

- (void)handleContinueButton
{
  id v2 = self;
  sub_10052EDB4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_dataSource));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_continueButton));
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_scrollHandler);

  sub_100036B90(v3);
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v3 = *(void (**)(id))((char *)&self->super.super.super.super.isa
                                 + OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_scrollHandler);
  if (v3)
  {
    id v5 = a3;
    id v6 = self;
    sub_1000B7838((uint64_t)v3);
    v3(v5);
    sub_100036B90((uint64_t)v3);
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  objc_super v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10005D034(&qword_1006AF770);
  __chkstk_darwin(v10 - 8);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = a3;
  v14 = self;
  sub_100530630((uint64_t)v9, (uint64_t)v12);

  v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v9, v6);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) != 1)
  {
    Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v15(v12, v6);
  }

  return isa;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  objc_super v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_100534E34();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC6FindMy31FMFindUnknownItemViewController_headerView));
}

@end