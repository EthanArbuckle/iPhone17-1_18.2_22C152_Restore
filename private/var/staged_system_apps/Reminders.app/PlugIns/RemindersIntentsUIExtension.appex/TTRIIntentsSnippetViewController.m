@interface TTRIIntentsSnippetViewController
- (UITableView)tableView;
- (_TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController)initWithCoder:(id)a3;
- (_TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)desiredHeightForWidth:(double)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)configureViewForParameters:(id)a3 ofInteraction:(id)a4 context:(unint64_t)a5 completion:(id)a6;
- (void)desiresInteractivity:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation TTRIIntentsSnippetViewController

- (UITableView)tableView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITableView *)Strong;
}

- (void)setTableView:(id)a3
{
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return *(void *)(*(void *)&self->SiriUISnippetViewController_opaque[OBJC_IVAR____TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController_viewModel]
                   + 16);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1000216B8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021678();
  id v10 = a3;
  v11 = self;
  id v12 = sub_10001FE28((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10001A8C4();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1000216B8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100021678();
  id v10 = a3;
  v11 = self;
  sub_100020274();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100021998();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController *)sub_10001BC6C(v5, v7, a4);
}

- (_TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController)initWithCoder:(id)a3
{
  return (_TtC27RemindersIntentsUIExtension32TTRIIntentsSnippetViewController *)sub_10001BE90(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
}

- (double)desiredHeightForWidth:(double)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return 0.0;
  }
  uint64_t v5 = (void *)Strong;
  uint64_t v6 = self;
  [v5 contentSize];
  sub_10001C984(0, v7, v8, v7, v8);
  double v10 = v9;

  return v10;
}

- (void)desiresInteractivity:(id)a3
{
  v4 = (void (**)(const void *, uint64_t))_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = v4[2];
    double v7 = self;
    v6(v5, 1);
    _Block_release(v5);
  }
  else
  {
    __break(1u);
  }
}

- (void)configureViewForParameters:(id)a3 ofInteraction:(id)a4 context:(unint64_t)a5 completion:(id)a6
{
  double v9 = (void (*)(uint64_t, uint64_t, __n128, __n128))_Block_copy(a6);
  if (a3)
  {
    sub_100011CC0(0, &qword_10002E6B8);
    sub_10002125C(&qword_10002E6C0, &qword_10002E6B8);
    a3 = (id)sub_100021A88();
  }
  if (v9)
  {
    *(void *)(swift_allocObject() + 16) = v9;
    double v9 = (void (*)(uint64_t, uint64_t, __n128, __n128))sub_1000210D0;
  }
  id v10 = a4;
  v11 = self;
  sub_100020E10((uint64_t)a3, a4, v9, v12, v13);
  sub_100011B98((uint64_t)v9);

  swift_bridgeObjectRelease();
}

@end