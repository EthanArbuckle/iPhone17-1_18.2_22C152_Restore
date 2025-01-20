@interface FMPredefinedMessageViewController
- (_TtC6FindMy33FMPredefinedMessageViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC6FindMy33FMPredefinedMessageViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLoad;
@end

@implementation FMPredefinedMessageViewController

- (void)updateViewConstraints
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMPredefinedMessageViewController();
  v2 = (char *)v6.receiver;
  [(FMPredefinedMessageViewController *)&v6 updateViewConstraints];
  v3 = *(void **)&v2[OBJC_IVAR____TtC6FindMy33FMPredefinedMessageViewController_tableView];
  id v4 = *(id *)&v2[OBJC_IVAR____TtC6FindMy33FMPredefinedMessageViewController_tableViewheightConstraint];
  [v3 intrinsicContentSize];
  [v4 setConstant:v5];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMPredefinedMessageViewController();
  id v2 = v3.receiver;
  [(FMPredefinedMessageViewController *)&v3 viewDidLoad];
  sub_1004869B0();
  sub_100486C1C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_100487EF4();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return *(void *)(*(void *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy33FMPredefinedMessageViewController_messages]
                   + 16);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_10048709C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10005D034(&qword_1006AF770);
  __chkstk_darwin(v10 - 8);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = a3;
  uint64_t v14 = self;
  sub_1004873A0(v13, (uint64_t)v9, (uint64_t)v12);

  v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v9, v6);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) != 1)
  {
    Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v15(v12, v6);
  }

  return isa;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_100487A28(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC6FindMy33FMPredefinedMessageViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC6FindMy33FMPredefinedMessageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC6FindMy33FMPredefinedMessageViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC6FindMy33FMPredefinedMessageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end