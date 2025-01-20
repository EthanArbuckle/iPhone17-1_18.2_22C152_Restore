@interface MOSuggestionSheetOnboardingSettingsViewController
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)completeOnboardingTapped;
- (void)switchChanged:(id)a3 section:(int64_t)a4;
- (void)switchChanged_bottom:(id)a3;
- (void)switchChanged_middle:(id)a3;
- (void)switchChanged_top:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation MOSuggestionSheetOnboardingSettingsViewController

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  MOSuggestionSheetOnboardingSettingsViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for MOSuggestionSheetOnboardingSettingsViewController();
  [(OBTableWelcomeController *)&v2 viewDidLoad];
}

- (void)viewDidLayoutSubviews
{
  objc_super v2 = self;
  MOSuggestionSheetOnboardingSettingsViewController.viewDidLayoutSubviews()();
}

- (void)switchChanged_top:(id)a3
{
  id v4 = a3;
  v5 = self;
  MOSuggestionSheetOnboardingSettingsViewController.switchChanged(_:section:)(v4, 0);
}

- (void)switchChanged_middle:(id)a3
{
  id v4 = a3;
  v5 = self;
  MOSuggestionSheetOnboardingSettingsViewController.switchChanged(_:section:)(v4, 1);
}

- (void)switchChanged_bottom:(id)a3
{
  id v4 = a3;
  v5 = self;
  MOSuggestionSheetOnboardingSettingsViewController.switchChanged(_:section:)(v4, 2);
}

- (void)switchChanged:(id)a3 section:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  MOSuggestionSheetOnboardingSettingsViewController.switchChanged(_:section:)(v6, a4);
}

- (void)completeOnboardingTapped
{
  objc_super v2 = self;
  MOSuggestionSheetOnboardingSettingsViewController.completeOnboardingTapped()();
}

- (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  result = (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5 = a5;
  result = (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  result = (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6 = a5;
  result = (_TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_onboardingManager));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_turnOnSuggestionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_backButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_tableViewHeightConstraint));
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings))[2];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:heightForHeaderInSection:)(a4);
  double v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:viewForHeaderInSection:)(a4);

  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  id v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  objc_msgSend(a3, sel_estimatedRowHeight);
  double v10 = v9;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:heightForFooterInSection:)(a4);
  double v9 = v8;

  return v9;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:viewForFooterInSection:)(a4);

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 < 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v4 = *(void *)(self
                 + OBJC_IVAR____TtC28MomentsOnboardingAndSettings49MOSuggestionSheetOnboardingSettingsViewController_journalingSuggestionsSettings);
  if (*(void *)(v4 + 16) <= (unint64_t)a4)
  {
LABEL_7:
    __break(1u);
    return self;
  }
  uint64_t v5 = *(void *)(v4 + 24 * a4 + 32);
  if (v5) {
    return *(void *)(v5 + 16);
  }
  else {
    return 0;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  double v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  uint64_t v12 = specialized MOSuggestionSheetOnboardingSettingsViewController.tableView(_:cellForRowAt:)((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388]();
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  v13 = self;
  LOBYTE(self) = specialized MOSuggestionSheetOnboardingSettingsViewController.textView(_:shouldInteractWith:in:interaction:)();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return self & 1;
}

@end