@interface InsightsEntriesViewController
- (_TtC7Journal29InsightsEntriesViewController)initWithCoder:(id)a3;
- (_TtC7Journal29InsightsEntriesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation InsightsEntriesViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10005F830();
}

- (_TtC7Journal29InsightsEntriesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC7Journal29InsightsEntriesViewController *)sub_100061B10(v5, v7, a4);
}

- (_TtC7Journal29InsightsEntriesViewController)initWithCoder:(id)a3
{
  *(void *)&self->super.coreDataContext[OBJC_IVAR____TtC7Journal29InsightsEntriesViewController_insightsEntriesDelegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal29InsightsEntriesViewController____lazy_storage___model) = 0;
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC7Journal29InsightsEntriesViewController_currentDate;
  uint64_t v6 = type metadata accessor for DateComponents();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for InsightsEntriesViewController();
  return [(JournalEntryCollectionViewController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end