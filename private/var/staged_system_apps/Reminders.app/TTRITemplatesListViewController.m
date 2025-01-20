@interface TTRITemplatesListViewController
- (BOOL)canBecomeFirstResponder;
- (NSUndoManager)undoManager;
- (_TtC9Reminders31TTRITemplatesListViewController)initWithCoder:(id)a3;
- (_TtC9Reminders31TTRITemplatesListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)didTapCancel:(id)a3;
- (void)didTapDone:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)ttr_updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TTRITemplatesListViewController

- (_TtC9Reminders31TTRITemplatesListViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10030630C();
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)*(id *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRITemplatesListViewController_localUndoManager];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10030171C();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (unsigned __int8 *)v7.receiver;
  [(TTRITemplatesListViewController *)&v7 viewWillAppear:v3];
  v5 = (unsigned __int8 *)UIViewController.effectiveNavigationControllerForBars.getter();
  if (v5)
  {
    v6 = v5;
    [v5 setToolbarHidden:v4[OBJC_IVAR____TtC9Reminders31TTRITemplatesListViewController_style] animated:v3];

    v4 = v6;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  [(TTRITemplatesListViewController *)&v8 viewDidAppear:v3];
  id v5 = [v4 view];
  if (v5)
  {
    v6 = v5;
    objc_super v7 = (void *)UIView.firstResponderDescendant.getter();

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
  [(TTRITemplatesListViewController *)&v5 viewWillDisappear:v3];
  UIViewController.endFirstResponderEditing()();
  [v4 resignFirstResponder];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_100304B88(a3, a4);
}

- (void)ttr_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_100306478();
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
  id v6 = sub_1002D5AA4(&OBJC_IVAR____TtC9Reminders31TTRITemplatesListViewController____lazy_storage___cancelButton, &selRef_didTapCancel_, 1);
  sub_100257270();

  sub_10003B6F8((uint64_t)v7, &qword_100788D60);
}

- (void)didTapDone:(id)a3
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
    objc_super v5 = self;
  }
  UIViewController.endFirstResponderEditing()();
  sub_100253844();

  sub_10003B6F8((uint64_t)v6, &qword_100788D60);
}

- (_TtC9Reminders31TTRITemplatesListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders31TTRITemplatesListViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  sub_100306030(*(void *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRITemplatesListViewController_lastConsumedViewModel]);
  BOOL v3 = *(void **)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRITemplatesListViewController____lazy_storage___doneButton];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_100305C5C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a3;
  uint64_t v12 = self;
  sub_100306920();
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v14;
}

@end