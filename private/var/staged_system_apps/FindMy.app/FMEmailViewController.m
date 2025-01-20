@interface FMEmailViewController
- (_TtC6FindMy21FMEmailViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC6FindMy21FMEmailViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMEmailViewController

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMEmailViewController();
  v2 = (char *)v3.receiver;
  [(FMEmailViewController *)&v3 viewDidLayoutSubviews];
  [*(id *)&v2[OBJC_IVAR____TtC6FindMy21FMEmailViewController_tableView] invalidateIntrinsicContentSize];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMEmailViewController();
  v2 = (char *)v5.receiver;
  [(FMEmailViewController *)&v5 viewDidLoad];
  sub_100352020();
  sub_100352828();
  id v3 = objc_allocWithZone((Class)UITapGestureRecognizer);
  id v4 = [v3 initWithTarget:v2 action:@"handleUsePhoneNumberAction"];
  [*(id *)&v2[OBJC_IVAR____TtC6FindMy21FMEmailViewController_usePhoneNumberLabel] addGestureRecognizer:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMEmailViewController();
  id v4 = v5.receiver;
  [(FMEmailViewController *)&v5 viewWillAppear:v3];
  sub_100353034();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMEmailViewController();
  id v4 = v7.receiver;
  [(FMEmailViewController *)&v7 viewWillDisappear:v3];
  id v5 = sub_100353818();
  if (v5)
  {
    v6 = v5;
    [v5 resignFirstResponder];
  }
  sub_1003532E0();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  sub_100354C3C();
  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.0;
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
  id v12 = sub_1003534E4(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (_TtC6FindMy21FMEmailViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    return (_TtC6FindMy21FMEmailViewController *)sub_100353E84(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  return (_TtC6FindMy21FMEmailViewController *)sub_100353E84(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC6FindMy21FMEmailViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = a5;
  return (_TtC6FindMy21FMEmailViewController *)sub_100354194(v9, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  swift_release();
  sub_10031D224(*(void *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy21FMEmailViewController_passcode], *(void *)&self->mediator[OBJC_IVAR____TtC6FindMy21FMEmailViewController_passcode]);
  BOOL v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy21FMEmailViewController_style];

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end