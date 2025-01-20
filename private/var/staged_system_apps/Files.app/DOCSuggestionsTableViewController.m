@interface DOCSuggestionsTableViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (NSArray)keyCommands;
- (_TtC5Files33DOCSuggestionsTableViewController)init;
- (_TtC5Files33DOCSuggestionsTableViewController)initWithCoder:(id)a3;
- (_TtC5Files33DOCSuggestionsTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5Files33DOCSuggestionsTableViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)keyCommandCancelSelection;
- (void)keyCommandConfirmSelection;
- (void)keyCommandMoveSelectionDown;
- (void)keyCommandMoveSelectionUp;
- (void)loadView;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation DOCSuggestionsTableViewController

- (_TtC5Files33DOCSuggestionsTableViewController)init
{
  return (_TtC5Files33DOCSuggestionsTableViewController *)sub_1004BE0F8();
}

- (_TtC5Files33DOCSuggestionsTableViewController)initWithCoder:(id)a3
{
  *(void *)&self->suggestionsTableViewDelegate[OBJC_IVAR____TtC5Files33DOCSuggestionsTableViewController_suggestionsTableViewDelegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Files33DOCSuggestionsTableViewController_suggestions) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC5Files33DOCSuggestionsTableViewController_sortedSuggestions) = (Class)_swiftEmptyArrayStorage;
  id v5 = a3;

  result = (_TtC5Files33DOCSuggestionsTableViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for DOCSuggestionsTableView());
  v4 = self;
  id v5 = [v3 initWithFrame:0, 0.0, 0.0, 0.0, 0.0];
  [(DOCSuggestionsTableViewController *)v4 setView:v5];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1004BE368();
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)resignFirstResponder
{
  v2 = self;
  unsigned __int8 v3 = sub_1004BE670();

  return v3 & 1;
}

- (NSArray)keyCommands
{
  if (sub_1004C06FC())
  {
    sub_10009E6C4(0, &qword_100708860);
    v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }

  return (NSArray *)v2.super.isa;
}

- (void)keyCommandMoveSelectionUp
{
  NSArray v2 = self;
  sub_1004BED50(-1, 1, 1);
}

- (void)keyCommandMoveSelectionDown
{
  NSArray v2 = self;
  sub_1004BED50(1, 1, 1);
}

- (void)keyCommandConfirmSelection
{
  NSArray v2 = self;
  sub_1004BEA74();
}

- (void)keyCommandCancelSelection
{
  NSArray v2 = self;
  sub_1004BED50(0, 2, 1);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1004BF958();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5Files33DOCSuggestionsTableViewController_suggestions);
  if (!(v4 >> 62)) {
    return *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v7 = a3;
  uint64_t v8 = self;
  swift_bridgeObjectRetain();
  int64_t v9 = _CocoaArrayWrapper.endIndex.getter();

  swift_bridgeObjectRelease();
  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1004BFC44(v10);
  v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (_TtC5Files33DOCSuggestionsTableViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC5Files33DOCSuggestionsTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Files33DOCSuggestionsTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Files33DOCSuggestionsTableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files33DOCSuggestionsTableViewController_suggestionsTableViewDelegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end