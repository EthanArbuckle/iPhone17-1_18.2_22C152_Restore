@interface TTRIListDetailViewController
- (_TtC9Reminders28TTRIListDetailViewController)initWithCoder:(id)a3;
- (_TtC9Reminders28TTRIListDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapCancel:(id)a3;
- (void)didTapDone:(id)a3;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TTRIListDetailViewController

- (_TtC9Reminders28TTRIListDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002AB660();
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)UITableView);
  v4 = self;
  id v5 = [v3 initWithFrame:2 style:0.0, 0.0, 0.0, 0.0];
  [(TTRIListDetailViewController *)v4 setView:v5];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1002A6570();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1002A6B7C(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1002A6CDC(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = v6.receiver;
  [(TTRIListDetailViewController *)&v6 viewWillDisappear:v3];
  if (qword_1007853E8 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100018BF8(v5, (uint64_t)qword_1007957D8);
  sub_1003AA294(0x746544207473694CLL, 0xEC000000736C6961);
  [v4 resignFirstResponder];
  TTRKeyboardAvoidance<>.stopAvoidingKeyboard()();
}

- (void)didTapCancel:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  UIViewController.endFirstResponderEditing()();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    objc_super v6 = (void *)Strong;
    uint64_t v7 = *(void *)&v4->presenter[OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_presenter];
    uint64_t ObjectType = swift_getObjectType();
    static TTRIPopoverAnchor.barButtonItem(_:permittedArrowDirections:)();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v7 + 56))(v10, ObjectType, v7);
    sub_1000C7C58((uint64_t)v10);
  }
  else
  {
  }
  sub_100038CD8((uint64_t)&v9);
}

- (void)didTapDone:(id)a3
{
  uint64_t v4 = sub_10003B754(&qword_10079AF90);
  __chkstk_darwin(v4 - 8);
  objc_super v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  UIViewController.endFirstResponderEditing()();
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  type metadata accessor for MainActor();
  uint64_t v9 = v7;
  uint64_t v10 = static MainActor.shared.getter();
  v11 = (void *)swift_allocObject();
  v11[2] = v10;
  v11[3] = &protocol witness table for MainActor;
  v11[4] = v9;
  sub_1000286A4((uint64_t)v6, (uint64_t)&unk_100795908, (uint64_t)v11);

  swift_release();
  sub_100038CD8((uint64_t)v12);
}

- (_TtC9Reminders28TTRIListDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders28TTRIListDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_tableDataController));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = *(void *)&self->autoBeginEditingPerformed[OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_cslHelpAnchor];
  uint64_t v4 = *(void *)&self->$__lazy_storage_$_badgeSection[OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_cslHelpAnchor
                                                      + 7];
  sub_100245D94(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_cslHelpAnchor), *(void *)&self->presenter[OBJC_IVAR____TtC9Reminders28TTRIListDetailViewController_cslHelpAnchor]);
  sub_1001D8FF8(v3, v4);
  swift_release();

  swift_release();
}

@end