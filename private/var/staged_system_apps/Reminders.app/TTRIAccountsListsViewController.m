@interface TTRIAccountsListsViewController
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (_TtC9Reminders31TTRIAccountsListsViewController)initWithCoder:(id)a3;
- (_TtC9Reminders31TTRIAccountsListsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)beginSearchAction:(id)a3;
- (void)dealloc;
- (void)didDismissSearchController:(id)a3;
- (void)didTapDone:(id)a3;
- (void)didTapEdit:(id)a3;
- (void)didTapNewGroup:(id)a3;
- (void)didTapNewList:(id)a3;
- (void)didTapNewReminder:(id)a3;
- (void)loadView;
- (void)newListAction:(id)a3;
- (void)presentSearchController:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)showListAction:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation TTRIAccountsListsViewController

- (void)loadView
{
  v3 = (char *)objc_allocWithZone((Class)type metadata accessor for TTRIAccountsListsTreeView(0));
  *(void *)&v3[qword_100795EB0 + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v3[qword_100795EB8] = &_swiftEmptyDictionarySingleton;
  *(void *)&v3[qword_100795EC0] = &_swiftEmptyDictionarySingleton;
  *(void *)&v3[qword_100795EC8] = &_swiftEmptySetSingleton;
  v4 = self;
  v5 = sub_100014068(2, 0.0, 0.0, 0.0, 0.0);
  [(TTRIAccountsListsViewController *)v4 setView:v5];
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10000D330();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1000187C0(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10000B0B8(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100020604();
}

- (_TtC9Reminders31TTRIAccountsListsViewController)initWithCoder:(id)a3
{
  return (_TtC9Reminders31TTRIAccountsListsViewController *)sub_10007CED0(a3);
}

- (void)dealloc
{
  v2 = self;
  sub_10007D130();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_searchController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_searchResultContainerViewController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController____lazy_storage___addListButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController____lazy_storage___addGroupButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController____lazy_storage___editButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController____lazy_storage___actionMenuButton));
  swift_bridgeObjectRelease();
  swift_release();
  sub_10003B6F8((uint64_t)self + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_lastAppliedSelection, (uint64_t *)&unk_10079CA90);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_10007D324(a3);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    v6 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  char v8 = sub_10007D4DC((uint64_t)a3, (uint64_t)v10);

  sub_10003B6F8((uint64_t)v10, &qword_100788D60);
  return v8 & 1;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_10007D8FC(a3, a4);
}

- (void)didTapNewReminder:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v5 = self;
  }
  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_presenter);
  if (qword_100785570 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_100018BF8(v7, (uint64_t)qword_10079DFC8);
  sub_10003D820((uint64_t)_swiftEmptyArrayStorage);
  sub_10001A078();
  swift_bridgeObjectRelease();
  sub_100038D28(v6 + 14, v6[17]);
  uint64_t v8 = v6[9];
  uint64_t ObjectType = swift_getObjectType();
  v10 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)(v8 + 8) + 8))(ObjectType);
  sub_1002637AC((uint64_t)v10, (uint64_t)v6, (uint64_t)&off_10074A4F0);

  sub_10003B6F8((uint64_t)v11, &qword_100788D60);
}

- (void)didTapNewList:(id)a3
{
}

- (void)didTapNewGroup:(id)a3
{
}

- (void)didTapEdit:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10007D8FC(1, 1);
}

- (void)didTapDone:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10007D8FC(0, 1);
}

- (void)newListAction:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_100080558();

  sub_10003B6F8((uint64_t)v6, &qword_100788D60);
}

- (void)beginSearchAction:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_searchController);
  if (v6)
  {
    id v7 = [v6 searchBar];
    [v7 becomeFirstResponder];

    sub_10003B6F8((uint64_t)v8, &qword_100788D60);
  }
  else
  {
    __break(1u);
  }
}

- (void)showListAction:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_100080848((uint64_t)v6);

  sub_10003B6F8((uint64_t)v6, &qword_100788D60);
}

- (_TtC9Reminders31TTRIAccountsListsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  JUMPOUT(0x1000810B0);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000856A0(v4);
}

- (void)willPresentSearchController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000859E0(v4);
}

- (void)presentSearchController:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (id)UIViewController.effectiveNavigationControllerForBars.getter();
  [v6 isToolbarHidden];
  [v6 setToolbarHidden:1 animated:1];
}

- (void)willDismissSearchController:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100085BD8();
}

- (void)didDismissSearchController:(id)a3
{
  type metadata accessor for TTRISearchController();
  uint64_t v5 = swift_dynamicCastClass();
  if (v5) {
    *(unsigned char *)(v5
  }
             + OBJC_IVAR____TtC9RemindersP33_6BFE23A799CB20D2DB7CA4EA96508B8A20TTRISearchController_ttri_isBeingDismissed) = 0;
  id v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders31TTRIAccountsListsViewController_searchResultContainerViewController);
  if (v6)
  {
    id v7 = a3;
    uint64_t v8 = self;
    id v9 = v6;
    sub_1005485E4();
  }
  else
  {
    __break(1u);
  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100085748(1);
}

@end