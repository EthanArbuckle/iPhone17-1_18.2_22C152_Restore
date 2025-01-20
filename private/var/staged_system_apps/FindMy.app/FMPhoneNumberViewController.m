@interface FMPhoneNumberViewController
- (_TtC6FindMy27FMPhoneNumberViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC6FindMy27FMPhoneNumberViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
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

@implementation FMPhoneNumberViewController

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMPhoneNumberViewController();
  v2 = (char *)v3.receiver;
  [(FMPhoneNumberViewController *)&v3 viewDidLayoutSubviews];
  [*(id *)&v2[OBJC_IVAR____TtC6FindMy27FMPhoneNumberViewController_tableView] invalidateIntrinsicContentSize];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMPhoneNumberViewController();
  v2 = v6.receiver;
  id v3 = [(FMPhoneNumberViewController *)&v6 viewDidLoad];
  (*(void (**)(id))((swift_isaMask & *v2) + 0x178))(v3);
  sub_10041D564();
  id v4 = objc_allocWithZone((Class)UITapGestureRecognizer);
  id v5 = [v4 initWithTarget:v2 action:@"handleUseEmailAction"];
  [*(id *)((char *)v2 + OBJC_IVAR____TtC6FindMy27FMPhoneNumberViewController_useEmailLabel) addGestureRecognizer:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMPhoneNumberViewController();
  id v4 = v5.receiver;
  [(FMPhoneNumberViewController *)&v5 viewWillAppear:v3];
  sub_10041E4B4();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMPhoneNumberViewController();
  id v4 = v7.receiver;
  [(FMPhoneNumberViewController *)&v7 viewWillDisappear:v3];
  id v5 = sub_10041DC64();
  if (v5)
  {
    objc_super v6 = v5;
    [v5 resignFirstResponder];
  }
  sub_10041E760();
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
  sub_10041F934();
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
  id v12 = sub_10041D1CC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (_TtC6FindMy27FMPhoneNumberViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
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
    return (_TtC6FindMy27FMPhoneNumberViewController *)sub_10041EA80(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  return (_TtC6FindMy27FMPhoneNumberViewController *)sub_10041EA80(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC6FindMy27FMPhoneNumberViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
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
  return (_TtC6FindMy27FMPhoneNumberViewController *)sub_10041ED9C(v9, v11, (uint64_t)a4, v13, a5, a6);
}

- (void).cxx_destruct
{
  swift_release();
  sub_10031D224(*(void *)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy27FMPhoneNumberViewController_passcode], *(void *)&self->mediator[OBJC_IVAR____TtC6FindMy27FMPhoneNumberViewController_passcode]);
  BOOL v3 = *(void **)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC6FindMy27FMPhoneNumberViewController_style];

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end