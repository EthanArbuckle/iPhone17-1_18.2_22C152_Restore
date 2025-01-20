@interface MindfulnessSessionListViewController
- (_TtC10FitnessApp36MindfulnessSessionListViewController)initWithAllMindfulnessSessionViewModels:(id)a3 dataProvider:(id)a4 fitnessAppContext:(id)a5 fiuiFormattingManager:(id)a6 healthStore:(id)a7 mindfulnessSessionFormattingManager:(id)a8;
- (_TtC10FitnessApp36MindfulnessSessionListViewController)initWithCoder:(id)a3;
- (_TtC10FitnessApp36MindfulnessSessionListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC10FitnessApp36MindfulnessSessionListViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)dealloc;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
@end

@implementation MindfulnessSessionListViewController

- (_TtC10FitnessApp36MindfulnessSessionListViewController)initWithAllMindfulnessSessionViewModels:(id)a3 dataProvider:(id)a4 fitnessAppContext:(id)a5 fiuiFormattingManager:(id)a6 healthStore:(id)a7 mindfulnessSessionFormattingManager:(id)a8
{
  type metadata accessor for MindfulnessSessionViewModel();
  uint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC10FitnessApp36MindfulnessSessionListViewController *)sub_1001D0CB8(v13, a4, a5, a6, a7, a8);
}

- (void)dealloc
{
  v2 = self;
  sub_1001D1318();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_dataProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_fiuiFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_fitnessAppContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_mindfulnessSessionFormattingManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_dataSource));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  if ((uint64_t)[v6 numberOfRowsInSection:a4] < 1)
  {
    double v9 = 0.0;
  }
  else
  {
    [self preferredHeight];
    double v9 = v8;
  }

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  double v8 = (void *)sub_1001D2878(v6, a4);

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  double v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  if (IndexPath.row.getter())
  {
    double v12 = UITableViewAutomaticDimension;
  }
  else
  {
    [self heightForMindfulnessSessions];
    double v12 = v13;
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  v5 = (char *)[a3 numberOfSections];
  if (__OFSUB__(v5, 1))
  {
    __break(1u);
  }
  else
  {
    double result = 11.0;
    if (v5 - 1 == (char *)a4) {
      return 0.0;
    }
  }
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4 = [objc_allocWithZone((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];

  return v4;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  double v12 = self;
  id v13 = sub_1001D728C();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (void)tableView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  sub_1001D7440(v9, a5);

  swift_unknownObjectRelease();
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  [v10 deselectRowAtIndexPath:isa animated:1];

  sub_1001D3904();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  id v12 = sub_1001D776C((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (_TtC10FitnessApp36MindfulnessSessionListViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_dataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_allMindfulnessSessionViewModels) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp36MindfulnessSessionListViewController_observers) = (Class)_swiftEmptyArrayStorage;
  id v4 = a3;

  double result = (_TtC10FitnessApp36MindfulnessSessionListViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp36MindfulnessSessionListViewController)initWithStyle:(int64_t)a3
{
  double result = (_TtC10FitnessApp36MindfulnessSessionListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp36MindfulnessSessionListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  double result = (_TtC10FitnessApp36MindfulnessSessionListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end