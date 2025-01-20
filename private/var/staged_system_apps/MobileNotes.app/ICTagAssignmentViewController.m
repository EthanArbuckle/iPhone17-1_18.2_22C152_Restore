@interface ICTagAssignmentViewController
- (ICTagAssignmentViewController)initWithCoder:(id)a3;
- (ICTagAssignmentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ICTagAssignmentViewController)initWithSelectedNotes:(id)a3 managedObjectContext:(id)a4 completion:(id)a5;
- (void)dismissActionWithSender:(id)a3;
- (void)dismissAndSaveActionWithSender:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation ICTagAssignmentViewController

- (ICTagAssignmentViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___ICTagAssignmentViewController____lazy_storage___collectionView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___ICTagAssignmentViewController____lazy_storage___cancelBarButtonItem) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___ICTagAssignmentViewController____lazy_storage___doneBarButtonItem) = 0;

  result = (ICTagAssignmentViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (ICTagAssignmentViewController)initWithSelectedNotes:(id)a3 managedObjectContext:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  sub_100031418(0, (unint64_t *)&qword_10069FD10);
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  return (ICTagAssignmentViewController *)sub_10024373C(v7, a4, (uint64_t)sub_1001A36C4, v8);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100243A00();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(ICTagAssignmentViewController *)&v7 viewWillAppear:v3];
  v5 = sub_100243328();
  [v5 layoutIfNeeded];

  sub_100243C40();
  id v6 = sub_100243634(&OBJC_IVAR___ICTagAssignmentViewController____lazy_storage___doneBarButtonItem, &selRef_dismissAndSaveActionWithSender_, 0);
  [v6 setEnabled:0];
}

- (void)dismissActionWithSender:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  uint64_t v5 = *(void *)&v4->$__lazy_storage_$_collectionView[OBJC_IVAR___ICTagAssignmentViewController_completion];
  v7[4] = *(Class *)((char *)&v4->super.super.super.isa + OBJC_IVAR___ICTagAssignmentViewController_completion);
  v7[5] = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_100262E2C;
  v7[3] = &unk_100631280;
  id v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  [(ICTagAssignmentViewController *)v4 dismissViewControllerAnimated:1 completion:v6];
  _Block_release(v6);

  sub_100018FE8((uint64_t)v8);
}

- (void)dismissAndSaveActionWithSender:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1003D1A20(0, 0);
  uint64_t v5 = *(void *)&v4->$__lazy_storage_$_collectionView[OBJC_IVAR___ICTagAssignmentViewController_completion];
  v7[4] = *(Class *)((char *)&v4->super.super.super.isa + OBJC_IVAR___ICTagAssignmentViewController_completion);
  v7[5] = v5;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_100262E2C;
  v7[3] = &unk_100631258;
  id v6 = _Block_copy(v7);
  swift_retain();
  swift_release();
  [(ICTagAssignmentViewController *)v4 dismissViewControllerAnimated:1 completion:v6];
  _Block_release(v6);

  sub_100018FE8((uint64_t)v8);
}

- (ICTagAssignmentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (ICTagAssignmentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICTagAssignmentViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICTagAssignmentViewController____lazy_storage___cancelBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICTagAssignmentViewController____lazy_storage___doneBarButtonItem));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICTagAssignmentViewController_managedObjectContext));

  swift_release();
}

@end