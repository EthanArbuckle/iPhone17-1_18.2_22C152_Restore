@interface TrendDetailViewController
- (_TtC10FitnessApp25TrendDetailViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp25TrendDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (uint64_t)tapToRadar;
- (void)contentSizeCategoryDidChangeWithNote:(id)a3;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TrendDetailViewController

- (void)contentSizeCategoryDidChangeWithNote:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_100338380();
  if ((v8->trendType[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_daysRingsClosed90] & 1) == 0
    && (v8->trendType[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_daysRingsClosed365] & 1) == 0
    && *(Class *)((char *)&v8->super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_ringClosureSummary))
  {
    sub_1002EEAE0(*((unsigned char *)&v8->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_trendType), *(uint64_t *)((char *)&v8->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_daysRingsClosed90), *(uint64_t *)((char *)&v8->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_daysRingsClosed365), *((unsigned __int8 *)&v8->super.super.super.isa+ OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_isWheelchairUser));
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)loadView
{
  v2 = self;
  sub_100337B70();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10033850C();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10033879C(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TrendDetailViewController();
  id v4 = v7.receiver;
  [(TrendDetailViewController *)&v7 viewDidAppear:v3];
  if (*((unsigned char *)v4 + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_direction) == 1)
  {
  }
  else
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    id v6 = v4;
    sub_1001FAB90((uint64_t)sub_100338D84, v5);

    swift_release();
  }
}

- (_TtC10FitnessApp25TrendDetailViewController)initWithCoder:(id)a3
{
  return 0;
}

- (_TtC10FitnessApp25TrendDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp25TrendDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_valueQuantity));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_differenceQuantity));
  long long v3 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 150];
  v15[10] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 134];
  v15[11] = v3;
  unsigned __int8 v16 = self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 166];
  long long v4 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 86];
  v15[6] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 70];
  v15[7] = v4;
  long long v5 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 118];
  v15[8] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 102];
  v15[9] = v5;
  long long v6 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 22];
  v15[2] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 6];
  v15[3] = v6;
  long long v7 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 54];
  v15[4] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 38];
  v15[5] = v7;
  long long v8 = *(_OWORD *)&self->valueQuantity[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90 + 6];
  v15[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics90);
  v15[1] = v8;
  sub_1000D7E40((uint64_t)v15);
  long long v9 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 150];
  v17[10] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 134];
  v17[11] = v9;
  unsigned __int8 v18 = self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 166];
  long long v10 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 86];
  v17[6] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 70];
  v17[7] = v10;
  long long v11 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 118];
  v17[8] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 102];
  v17[9] = v11;
  long long v12 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 22];
  v17[2] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 6];
  v17[3] = v12;
  long long v13 = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 54];
  v17[4] = *(_OWORD *)&self->statistics90[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 38];
  v17[5] = v13;
  long long v14 = *(_OWORD *)&self->valueQuantity[OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365 + 6];
  v17[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_statistics365);
  v17[1] = v14;
  sub_1000D7E40((uint64_t)v17);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_formattingManager));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_summaryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_chartView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_dailyChart));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_ringClosureSummary));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_vO2MaxChart));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp25TrendDetailViewController_explanationView));
}

- (uint64_t)tapToRadar
{
  uint64_t v0 = sub_1000AFA94((uint64_t *)&unk_10094B790);
  __chkstk_darwin(v0 - 8);
  v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  long long v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TrendsRadarHandler();
  sub_1001B60C0((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1) {
    return sub_1001C8AF0((uint64_t)v2);
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  id v8 = [self defaultWorkspace];
  if (v8)
  {
    long long v10 = v8;
    URL._bridgeToObjectiveC()(v9);
    long long v12 = v11;
    [v10 openURL:v11 configuration:0 completionHandler:0];
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

@end