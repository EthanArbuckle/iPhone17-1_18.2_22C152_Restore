@interface TTRIListSharingViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (NSUndoManager)undoManager;
- (UIBarButtonItem)doneButton;
- (_TtC9Reminders29TTRIListSharingViewController)initWithCoder:(id)a3;
- (_TtC9Reminders29TTRIListSharingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC9Reminders29TTRIListSharingViewController)initWithStyle:(int64_t)a3;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didTapDone:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TTRIListSharingViewController

- (_TtC9Reminders29TTRIListSharingViewController)initWithCoder:(id)a3
{
  return (_TtC9Reminders29TTRIListSharingViewController *)sub_100097258(a3);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (NSUndoManager)undoManager
{
  return (NSUndoManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                  + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_localUndoManager));
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000973A0();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(TTRIListSharingViewController *)&v7 viewWillAppear:v3];
  id v5 = [v4 tableView];
  if (v5)
  {
    v6 = v5;
    [v5 reloadData];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (UIBarButtonItem)doneButton
{
  return (UIBarButtonItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                    + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_doneButton));
}

- (void)setDoneButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_doneButton);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_doneButton) = (Class)a3;
  id v3 = a3;
}

- (void)didTapDone:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1003B52DC();

  sub_100038CD8((uint64_t)&v5);
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
  sub_1000979B0(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  if (*((unsigned char *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_allowsEditing) == 1)
  {
    id v10 = a3;
    v11 = self;
    unint64_t v12 = sub_100097854();
    if ((v13 & 0x100) != 0) {
      unsigned __int8 v14 = 0;
    }
    else {
      unsigned __int8 v14 = sub_10009792C(v12, v13 & 1);
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v14 & 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  __int16 v13 = self;
  sub_1000980EC(v12, a4, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = self;
  id v9 = [(TTRIListSharingViewController *)v8 navigationItem];
  if (v5) {
    id v10 = 0;
  }
  else {
    id v10 = objc_retain(*(id *)((char *)&v8->super.super.super.super.isa
  }
                            + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_doneButton));
  [v9 setLeftBarButtonItem:v10];

  v11.receiver = v8;
  v11.super_class = ObjectType;
  [(TTRIListSharingViewController *)&v11 setEditing:v5 animated:v4];
}

- (id)tableView:(id)a3 titleForDeleteConfirmationButtonForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  objc_super v11 = self;
  v12._object = (void *)0x80000001006A6460;
  v13._countAndFlagsBits = 0x61685320706F7453;
  v13._object = (void *)0xEC000000676E6972;
  v12._countAndFlagsBits = 0xD00000000000002ELL;
  TTRLocalizedString(_:comment:)(v13, v12);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v14;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = 2.0;
  if (a4 != 1)
  {
    uint64_t v10 = v4;
    uint64_t v11 = v5;
    v9.receiver = self;
    v9.super_class = (Class)swift_getObjectType();
    [(TTRIListSharingViewController *)&v9 tableView:a3 heightForHeaderInSection:a4];
  }
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = sub_1003B47B8()[2];
  swift_bridgeObjectRelease();
  if (v6)
  {
    int v7 = *((unsigned __int8 *)&v5->super.super.super.super.isa
         + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_style);

    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
  else
  {

    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 == 1) {
    return a4;
  }
  if (a4) {
    return 0;
  }
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = sub_1003B47B8()[2];
  swift_bridgeObjectRelease();
  uint64_t v8 = *((unsigned __int8 *)&v6->super.super.super.super.isa
       + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_allowsEditing);

  a4 = v7 + v8;
  if (!__OFADD__(v7, v8)) {
    return a4;
  }
  __break(1u);
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  objc_super v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  Swift::String v12 = (void *)sub_100098C0C((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (_TtC9Reminders29TTRIListSharingViewController)initWithStyle:(int64_t)a3
{
  int64_t result = (_TtC9Reminders29TTRIListSharingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9Reminders29TTRIListSharingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  int64_t result = (_TtC9Reminders29TTRIListSharingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_doneButton));
  swift_unknownObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders29TTRIListSharingViewController_localUndoManager);
}

@end