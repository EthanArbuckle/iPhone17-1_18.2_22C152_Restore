@interface TrendsListViewController
- (_TtC10FitnessApp24TrendsListViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp24TrendsListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (uint64_t)tapToRadar;
- (void)dealloc;
- (void)reloadForFontSizeChangeWithNote:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)wheelchairUseDidChangeWithNote:(id)a3;
@end

@implementation TrendsListViewController

- (_TtC10FitnessApp24TrendsListViewController)initWithCoder:(id)a3
{
  return 0;
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_dataProvider);
  v3 = self;
  id v4 = v2;
  sub_1002E0B20((uint64_t)v3);

  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for TrendsListViewController();
  [(TrendsListViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_dataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_formattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_trendsFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_activityDataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_pregnancyStateProvider));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_spinner));

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10041B9B4();
}

- (void)wheelchairUseDidChangeWithNote:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10041C124();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_10041C324();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10041C4CC(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10041C758(a3);
}

- (void)reloadForFontSizeChangeWithNote:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  if (*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_dataDidLoad) != 1) {
    goto LABEL_4;
  }
  v8 = self;
  sub_10041CED8();
  id v9 = [(TrendsListViewController *)v8 view];
  if (v9)
  {
    v10 = v9;
    [v9 setNeedsLayout];

    [*(id *)((char *)&v8->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp24TrendsListViewController_tableView) reloadData];
LABEL_4:
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return;
  }
  __break(1u);
}

- (_TtC10FitnessApp24TrendsListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp24TrendsListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  int64_t v8 = sub_100420DDC(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = sub_10041F1A0(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = sub_10041F518((uint64_t)v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  double v8 = 0.0;
  if ([(TrendsListViewController *)v7 tableView:v6 numberOfRowsInSection:a4] >= 1
    && (a4 | 4) != 4)
  {
    double v8 = UITableViewAutomaticDimension;
  }

  return v8;
}

- (uint64_t)tapToRadar
{
  uint64_t v0 = sub_1000AFA94((uint64_t *)&unk_10094B790);
  __chkstk_darwin(v0 - 8);
  v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TrendsRadarHandler();
  sub_1001B60C0((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1) {
    return sub_10008DB18((uint64_t)v2, (uint64_t *)&unk_10094B790);
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  id v8 = [self defaultWorkspace];
  if (v8)
  {
    id v10 = v8;
    URL._bridgeToObjectiveC()(v9);
    id v12 = v11;
    [v10 openURL:v11 configuration:0 completionHandler:0];
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end