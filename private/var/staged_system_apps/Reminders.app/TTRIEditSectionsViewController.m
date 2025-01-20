@interface TTRIEditSectionsViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSUndoManager)undoManager;
- (_TtC9Reminders30TTRIEditSectionsViewController)initWithCoder:(id)a3;
- (_TtC9Reminders30TTRIEditSectionsViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC9Reminders30TTRIEditSectionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapCancel:(id)a3;
- (void)didTapDone:(id)a3;
- (void)didToggleHideEmptySections:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TTRIEditSectionsViewController

- (_TtC9Reminders30TTRIEditSectionsViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController_dataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController_lastConsumedViewModel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController____lazy_storage___cancelButton) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController____lazy_storage___doneButton) = 0;
  id v4 = a3;

  result = (_TtC9Reminders30TTRIEditSectionsViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                  + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController_localUndoManager));
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1002D4EA8();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  [(TTRIEditSectionsViewController *)&v8 viewDidAppear:v3];
  id v5 = [v4 view];
  if (v5)
  {
    v6 = v5;
    v7 = (void *)UIView.firstResponderDescendant.getter();

    if (!v7) {
      [v4 becomeFirstResponder];
    }
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(TTRIEditSectionsViewController *)&v5 viewWillDisappear:v3];
  UIViewController.endFirstResponderEditing()();
  [v4 resignFirstResponder];
}

- (void)didTapCancel:(id)a3
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
    memset(v7, 0, sizeof(v7));
    objc_super v5 = self;
  }
  UIViewController.endFirstResponderEditing()();
  id v6 = sub_1002D5AA4(&OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController____lazy_storage___cancelButton, &selRef_didTapCancel_, 1);
  sub_10020CE5C((uint64_t)v6);

  sub_10003B6F8((uint64_t)v7, &qword_100788D60);
}

- (void)didTapDone:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  UIViewController.endFirstResponderEditing()();
  sub_10020D418();

  sub_100038CD8((uint64_t)&v5);
}

- (void)didToggleHideEmptySections:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10020CA68((char)[v4 isOn]);
}

- (_TtC9Reminders30TTRIEditSectionsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC9Reminders30TTRIEditSectionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9Reminders30TTRIEditSectionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders30TTRIEditSectionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController_localUndoManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController_dataSource));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController____lazy_storage___cancelButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders30TTRIEditSectionsViewController____lazy_storage___doneButton);
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [v4 text];
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0xE000000000000000;
  }
  sub_10020C218(v8, v10, v4);

  swift_bridgeObjectRelease();
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  uint64_t v10 = self;
  id v5 = [v4 text];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;

    sub_10020C7E0(v7, v9, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
  }
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

@end