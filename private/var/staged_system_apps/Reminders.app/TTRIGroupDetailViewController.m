@interface TTRIGroupDetailViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSUndoManager)undoManager;
- (UIBarButtonItem)doneBarButtonItem;
- (UITableViewCell)includeCell;
- (UITextField)nameTextField;
- (_TtC9Reminders29TTRIGroupDetailViewController)initWithCoder:(id)a3;
- (_TtC9Reminders29TTRIGroupDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9Reminders29TTRIGroupDetailViewController)initWithStyle:(int64_t)a3;
- (void)didTapCancel:(id)a3;
- (void)didTapCreate:(id)a3;
- (void)nameTextFieldDidChange:(id)a3;
- (void)setDoneBarButtonItem:(id)a3;
- (void)setIncludeCell:(id)a3;
- (void)setNameTextField:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TTRIGroupDetailViewController

- (_TtC9Reminders29TTRIGroupDetailViewController)initWithCoder:(id)a3
{
  return (_TtC9Reminders29TTRIGroupDetailViewController *)sub_1005685BC(a3);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                  + OBJC_IVAR____TtC9Reminders29TTRIGroupDetailViewController_localUndoManager));
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100568724();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(TTRIGroupDetailViewController *)&v5 viewWillAppear:v3];
  sub_100568B34();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_100568D80(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(TTRIGroupDetailViewController *)&v5 viewWillDisappear:v3];
  [v4 resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_100569608();
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v12 = (char *)&v20 - v11;
  __chkstk_darwin(v13);
  v15 = (char *)&v20 - v14;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v12, v15, v6);
  id v16 = a3;
  v17 = self;
  IndexPath.init(item:section:)();
  char v18 = static IndexPath.== infix(_:_:)();
  v19 = *(void (**)(char *, uint64_t))(v7 + 8);
  v19(v12, v6);
  v19(v9, v6);
  if (v18) {
    sub_1000D9C58();
  }

  v19(v15, v6);
}

- (UITextField)nameTextField
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITextField *)Strong;
}

- (void)setNameTextField:(id)a3
{
}

- (UIBarButtonItem)doneBarButtonItem
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIBarButtonItem *)Strong;
}

- (void)setDoneBarButtonItem:(id)a3
{
}

- (UITableViewCell)includeCell
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UITableViewCell *)Strong;
}

- (void)setIncludeCell:(id)a3
{
}

- (void)didTapCancel:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1000D9A24();

  sub_100038CD8((uint64_t)&v5);
}

- (void)didTapCreate:(id)a3
{
}

- (void)nameTextFieldDidChange:(id)a3
{
}

- (_TtC9Reminders29TTRIGroupDetailViewController)initWithStyle:(int64_t)a3
{
  result = (_TtC9Reminders29TTRIGroupDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9Reminders29TTRIGroupDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders29TTRIGroupDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders29TTRIGroupDetailViewController_localUndoManager);
}

@end