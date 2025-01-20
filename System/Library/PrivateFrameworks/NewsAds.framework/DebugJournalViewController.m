@interface DebugJournalViewController
- (_TtC7NewsAds26DebugJournalViewController)initWithCoder:(id)a3;
- (_TtC7NewsAds26DebugJournalViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)handleDone;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation DebugJournalViewController

- (_TtC7NewsAds26DebugJournalViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_tableView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1D00]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_style_, 1, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7NewsAds26DebugJournalViewController *)sub_1BFA180C8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  DebugJournalViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  DebugJournalViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  [(DebugJournalViewController *)&v14 viewDidLayoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_tableView];
  id v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, sel_bounds);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
  }
  else
  {
    __break(1u);
  }
}

- (void)handleDone
{
}

- (_TtC7NewsAds26DebugJournalViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsAds26DebugJournalViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  long long v3 = *(_OWORD *)((char *)&self->super._childModalViewControllers
                 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v7[6] = *(_OWORD *)((char *)&self->super._nibBundle + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v7[7] = v3;
  v7[8] = *(_OWORD *)((char *)&self->super._previousRootViewController
                    + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  long long v4 = *(_OWORD *)((char *)&self->super._tab + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v7[2] = *(_OWORD *)((char *)&self->super._view + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v7[3] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super._title + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v7[4] = *(_OWORD *)((char *)&self->super._navigationItem + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v7[5] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v7[0] = *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_journal);
  v7[1] = v6;
  sub_1BF9728B4((uint64_t)v7);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds26DebugJournalViewController_tableView));
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1BFA16A58();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  double v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFA16A28();
  id v10 = a3;
  double v11 = self;
  DebugJournalViewController.tableView(_:didSelectRowAt:)((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  int64_t v6 = *(void *)(sub_1BFA15D80((uint64_t)&unk_1F1B149B0, (uint64_t)v5) + 16);

  swift_bridgeObjectRelease();
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  int64_t v8 = sub_1BFA16068(a4);

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1BFA1618C(a4);
  uint64_t v9 = v8;

  if (v9)
  {
    id v10 = (void *)sub_1BFA17B08();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1BFA16A58();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFA16A28();
  id v10 = a3;
  double v11 = self;
  id v12 = DebugJournalViewController.tableView(_:cellForRowAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

@end