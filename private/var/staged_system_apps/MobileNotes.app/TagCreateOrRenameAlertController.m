@interface TagCreateOrRenameAlertController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (UITextField)alertTextField;
- (_TtC11MobileNotes32TagCreateOrRenameAlertController)init;
- (_TtC11MobileNotes32TagCreateOrRenameAlertController)initWithTagObjectID:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5 renameMethod:(int64_t)a6;
- (id)makeAlertController;
- (void)setAlertTextField:(id)a3;
- (void)textChanged:(id)a3;
@end

@implementation TagCreateOrRenameAlertController

- (UITextField)alertTextField
{
  return (UITextField *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_alertTextField));
}

- (void)setAlertTextField:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_alertTextField);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_alertTextField) = (Class)a3;
  id v3 = a3;
}

- (_TtC11MobileNotes32TagCreateOrRenameAlertController)initWithTagObjectID:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5 renameMethod:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (_TtC11MobileNotes32TagCreateOrRenameAlertController *)sub_100387DE4(a3, a4, a5, a6);

  return v13;
}

- (id)makeAlertController
{
  v2 = self;
  id v3 = sub_100384D84(0, 0, 0, 0);

  return v3;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;
  id v10 = a3;
  id v11 = self;
  LOBYTE(v7) = sub_100387FC4(v7, v9);

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)textChanged:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_10038574C();

  sub_100015BE0((uint64_t)v6);
}

- (_TtC11MobileNotes32TagCreateOrRenameAlertController)init
{
  result = (_TtC11MobileNotes32TagCreateOrRenameAlertController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_accountObjectID));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_presentingViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_tagObjectID));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_eventReporter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_sizingCell));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_workerContext));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_viewContext));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_alertTextField));
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11MobileNotes32TagCreateOrRenameAlertController_tagAction);
}

@end