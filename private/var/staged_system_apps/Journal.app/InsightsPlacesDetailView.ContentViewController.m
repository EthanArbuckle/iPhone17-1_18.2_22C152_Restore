@interface InsightsPlacesDetailView.ContentViewController
- (_TtCV7Journal24InsightsPlacesDetailViewP33_BC4CB8389BB89297FDB9E0EF07F5280A21ContentViewController)initWithCoder:(id)a3;
- (_TtCV7Journal24InsightsPlacesDetailViewP33_BC4CB8389BB89297FDB9E0EF07F5280A21ContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation InsightsPlacesDetailView.ContentViewController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for InsightsPlacesDetailView.ContentViewController();
  id v2 = v4.receiver;
  [(JournalEntryCollectionViewController *)&v4 viewDidLoad];
  uint64_t v3 = sub_10065743C();
  sub_1001C736C(v3, 1);

  swift_release();
}

- (_TtCV7Journal24InsightsPlacesDetailViewP33_BC4CB8389BB89297FDB9E0EF07F5280A21ContentViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtCV7Journal24InsightsPlacesDetailViewP33_BC4CB8389BB89297FDB9E0EF07F5280A21ContentViewController *)sub_100657E20(v5, v7, a4);
}

- (_TtCV7Journal24InsightsPlacesDetailViewP33_BC4CB8389BB89297FDB9E0EF07F5280A21ContentViewController)initWithCoder:(id)a3
{
  return (_TtCV7Journal24InsightsPlacesDetailViewP33_BC4CB8389BB89297FDB9E0EF07F5280A21ContentViewController *)sub_100657F64(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
}

@end