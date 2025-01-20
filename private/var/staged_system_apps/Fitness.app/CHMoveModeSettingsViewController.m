@interface CHMoveModeSettingsViewController
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (CHMoveModeSettingsViewController)initWithCoder:(id)a3;
- (CHMoveModeSettingsViewController)initWithHealthStore:(id)a3 formattingManager:(id)a4 isAppleMoveTime:(BOOL)a5;
- (CHMoveModeSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CHMoveModeSettingsViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
@end

@implementation CHMoveModeSettingsViewController

- (CHMoveModeSettingsViewController)initWithHealthStore:(id)a3 formattingManager:(id)a4 isAppleMoveTime:(BOOL)a5
{
  return (CHMoveModeSettingsViewController *)sub_10047C47C(a3, a4, a5);
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return UITableViewAutomaticDimension;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (CHMoveModeSettingsViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHMoveModeSettingsViewController_dataSource) = 0;
  id v4 = a3;

  result = (CHMoveModeSettingsViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CHMoveModeSettingsViewController)initWithStyle:(int64_t)a3
{
  result = (CHMoveModeSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CHMoveModeSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (CHMoveModeSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMoveModeSettingsViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMoveModeSettingsViewController_formattingManager));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHMoveModeSettingsViewController_dataSource);
}

@end