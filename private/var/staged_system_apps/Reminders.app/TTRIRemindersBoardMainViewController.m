@interface TTRIRemindersBoardMainViewController
- (NSArray)preferredFocusEnvironments;
- (_TtC9Reminders36TTRIRemindersBoardMainViewController)initWithCoder:(id)a3;
- (_TtC9Reminders36TTRIRemindersBoardMainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)loadView;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TTRIRemindersBoardMainViewController

- (_TtC9Reminders36TTRIRemindersBoardMainViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100449348();
}

- (void)loadView
{
  v2 = self;
  sub_100435388();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1004354BC();
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(TTRIRemindersBoardMainViewController *)&v3 viewWillLayoutSubviews];
  if (*(void *)&v2[OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_deferredViewActionProvider])
  {
    swift_retain();
    TTRDeferredViewActionProvider.viewWillLayoutSubviews()();

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_100437564(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_100437830(a3, a4);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v6 = a3;
  id v7 = a4;
  v8 = (char *)v9.receiver;
  [(TTRIRemindersBoardMainViewController *)&v9 didUpdateFocusInContext:v6 withAnimationCoordinator:v7];
  if (!objc_msgSend(v8, "isViewLoaded", v9.receiver, v9.super_class))
  {

    goto LABEL_5;
  }
  if (*(void *)&v8[OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_focusController])
  {
    swift_retain();
    sub_1004212A4(v6);

    swift_release();
LABEL_5:

    return;
  }
  __break(1u);
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  result = (NSArray *)[(TTRIRemindersBoardMainViewController *)v2 isViewLoaded];
  if (result)
  {
    if (!*(Class *)((char *)&v2->super.super.super.isa
                   + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_focusController))
    {
      __break(1u);
      return result;
    }
    swift_retain();
    sub_10041CBD4();

    swift_release();
  }
  else
  {
  }
  sub_10003B754((uint64_t *)&unk_10079A080);
  v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (_TtC9Reminders36TTRIRemindersBoardMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9Reminders36TTRIRemindersBoardMainViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_mainDataSource));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_rootViewDragInteractionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_columnReorderingController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_mainScrollingController));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_dummyContentScrollView));
  swift_release();
  sub_1001D9764(*(void **)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_completedHeaderViewState));
  objc_release(*(id *)&self->initialFrameForLoadingView[OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_completedRemindersState
                                                      + 8]);
  sub_10003B6F8((uint64_t)self + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_listInfo, &qword_100786EF0);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  swift_retain();
  PassthroughSubject.send(_:)();

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  swift_retain();
  PassthroughSubject.send(_:)();

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v28 = a3;
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v13 = (char *)&v27 - v12;
  __chkstk_darwin(v14);
  v16 = (char *)&v27 - v15;
  __chkstk_darwin(v17);
  v19 = (char *)&v27 - v18;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id result = (id)static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v21 = *(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_columnReorderingController);
  if (v21)
  {
    id v22 = v28;
    v23 = self;
    id v24 = v21;
    sub_1002E2314((uint64_t)v16, (uint64_t)v13, (uint64_t)v10, (uint64_t)v19);

    v25 = *(void (**)(char *, uint64_t))(v8 + 8);
    v25(v10, v7);
    v25(v13, v7);
    v25(v16, v7);
    v26.super.isa = IndexPath._bridgeToObjectiveC()().super.isa;
    v25(v19, v7);
    return v26.super.isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = sub_10003B754((uint64_t *)&unk_100788DC0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for IndexPath();
  if (*(void *)(static Array._unconditionallyBridgeFromObjectiveC(_:)() + 16))
  {
    swift_bridgeObjectRelease();
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = *(void *)&self->initialFrameForLoadingView[OBJC_IVAR____TtC9Reminders36TTRIRemindersBoardMainViewController_presenter];
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v12 = type metadata accessor for TTRRemindersListViewModel.Item();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
    uint64_t v13 = *(void *)(v11 + 8);
    uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 752);
    id v15 = a3;
    v16 = self;
    uint64_t v10 = (void *)v14(v9, ObjectType, v13);
    sub_10003B6F8((uint64_t)v9, (uint64_t *)&unk_100788DC0);

    swift_bridgeObjectRelease();
  }

  return v10;
}

@end