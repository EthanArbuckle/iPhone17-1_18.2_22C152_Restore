@interface FMRecipientsViewController
- (BOOL)recipientViewShouldIgnoreFirstResponderChanges:(id)a3;
- (NSArray)keyCommands;
- (_TtC6FindMy26FMRecipientsViewController)initWithCoder:(id)a3;
- (_TtC6FindMy26FMRecipientsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)actionWithSender:(id)a3;
- (void)cancelActionWithSender:(id)a3;
- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4;
- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4;
- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 textDidChange:(id)a4;
- (void)composeRecipientViewDidBecomeFirstResponder:(id)a3;
- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3;
- (void)composeRecipientViewRequestAddRecipient:(id)a3;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)showSelectedRecipientContactDetails;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMRecipientsViewController

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_recipientTextViewHeightConstraint);
  if (v4)
  {
    double height = a4.height;
    v8 = self;
    id v9 = a3;
    v10 = self;
    id v12 = v4;
    [v8 preferredHeight];
    if (height > v11) {
      double v11 = height;
    }
    [v12 setConstant:v11];
  }
  else
  {
    __break(1u);
  }
}

- (void)composeRecipientViewDidBecomeFirstResponder:(id)a3
{
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_recipientTextView);
  if (v3)
  {
    v8 = self;
    v5 = (_TtC6FindMy26FMRecipientsViewController *)a3;
    v6 = (_TtC6FindMy26FMRecipientsViewController *)[v3 addButton];
    if (v6)
    {
      v7 = v6;
      [(FMRecipientsViewController *)v6 setAlpha:1.0];

      v5 = v8;
      v8 = v7;
    }
  }
  else
  {
    __break(1u);
  }
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10018FFC0();
}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100151340();
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  if (a4)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a3;
  v10 = self;
  sub_1001508F8(a3, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_10018F7CC();
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  if (a4)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a3;
  v10 = self;
  if ((sub_100477CCC(v6, v8) & 1) != 0
    || (char v11 = sub_100477034(v6, (unint64_t)v8, 0), swift_bridgeObjectRelease(), (v11 & 1) != 0))
  {
    if (!v8)
    {
      __break(1u);
      return;
    }
    sub_10018F35C(v6, (unint64_t)v8, 0, 0);
  }

  swift_bridgeObjectRelease();
}

- (BOOL)recipientViewShouldIgnoreFirstResponderChanges:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  int64_t v7 = sub_10017DB18(v5);

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = (char *)a3;
  char v11 = self;
  id v12 = (void *)sub_10017D3F0(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  char v11 = self;
  sub_10017D6F8((unint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC6FindMy26FMRecipientsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100195018();
}

- (NSArray)keyCommands
{
  sub_10005D034(&qword_1006AF2D0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10055BD30;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v4 = self;
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v6 = [self keyCommandWithInput:v5 modifierFlags:0 action:"cancelActionWithSender:"];

  *(void *)(v3 + 32) = v6;
  specialized Array._endMutation()();

  sub_100006060(0, (unint64_t *)&unk_1006B4560);
  v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v7.super.isa;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100190388();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMRecipientsViewController();
  id v4 = v5.receiver;
  [(FMRecipientsViewController *)&v5 viewWillAppear:v3];
  sub_10018F5E4();
  sub_10018F7CC();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_recipientTextView);
  if (v3)
  {
    BOOL v4 = a3;
    objc_super v5 = self;
    id v6 = [v3 textView];
    if (v6)
    {
      NSArray v7 = v6;
      [v6 resignFirstResponder];

      v8.receiver = v5;
      v8.super_class = (Class)type metadata accessor for FMRecipientsViewController();
      [(FMRecipientsViewController *)&v8 viewWillDisappear:v4];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v4 = self;
  sub_10019058C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FMRecipientsViewController();
  BOOL v4 = (char *)v6.receiver;
  [(FMRecipientsViewController *)&v6 viewDidDisappear:v3];
  objc_super v5 = *(void **)&v4[OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_peopleSuggester];
  *(void *)&v4[OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_peopleSuggester] = 0;
}

- (void)showSelectedRecipientContactDetails
{
  v2 = self;
  sub_10018FA40();
}

- (void)cancelActionWithSender:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_100194F2C();
}

- (void)actionWithSender:(id)a3
{
  uint64_t v4 = qword_1006AE190;
  id v10 = a3;
  objc_super v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_1000606BC(v6, (uint64_t)qword_1006D1E98);
  NSArray v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "FMRecipientsViewController: Send button pressed - override in subclass", v9, 2u);
    swift_slowDealloc();
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = a3;
  objc_super v5 = self;
  sub_100193AD4((uint64_t)a3);
}

- (_TtC6FindMy26FMRecipientsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC6FindMy26FMRecipientsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_recipientTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_recipientTextViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_searchedContactsTableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_suggestedContactsTableView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_rightActionButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_horizontalRuleView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_contactStore));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_operationQueue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_peopleSuggester));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_reachabilityOperation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_searchOperation));
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy26FMRecipientsViewController_requiredCapability, &qword_1006B2D18);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_type_t v8 = self;
  sub_10031D708(v7);
}

@end