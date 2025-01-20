@interface FTRecentsContainerViewController
- (BOOL)hasRecentsListViewController;
- (FTRecentsContainerViewController)initWithCoder:(id)a3;
- (FTRecentsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UICollectionView)collectionView;
- (id)presentScreenTimeShield;
- (void)hideContent;
- (void)presentRecentsDetailsViewFor:(id)a3;
- (void)setPresentScreenTimeShield:(id)a3;
- (void)showContent;
- (void)showLinkDetailViewControllerForPseudonym:(id)a3;
- (void)showVideoPlayerForMessageWithUUID:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation FTRecentsContainerViewController

- (FTRecentsContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v7;
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v8 = a4;
  v9 = (FTRecentsContainerViewController *)sub_1000070E8(v6, (uint64_t)a3, a4);
  swift_release();
  return v9;
}

- (BOOL)hasRecentsListViewController
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  BOOL v4 = sub_10000FCA8();
  swift_release();

  return v4;
}

- (void)showContent
{
}

- (void)viewWillLayoutSubviews
{
}

- (id)presentScreenTimeShield
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v4 = *(uint64_t *)((char *)&v3->super.super.super.isa
                  + OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield);
  uint64_t v5 = *(void *)&v3->presentScreenTimeShield[OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield];
  sub_10001ACD4(v4);

  swift_release();
  if (v4)
  {
    v8[4] = v4;
    v8[5] = v5;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    v8[2] = sub_100058308;
    v8[3] = &unk_1000A3008;
    uint64_t v6 = _Block_copy(v8);
    swift_release();
    swift_release();
  }
  else
  {
    swift_release();
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)setPresentScreenTimeShield:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = _Block_copy(a3);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    id v8 = sub_10005B830;
  }
  else
  {
    id v8 = 0;
    uint64_t v7 = 0;
  }
  v9 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v10 = (uint64_t (**)())((char *)v9 + OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield);
  uint64_t v11 = *(uint64_t *)((char *)&v9->super.super.super.isa
                   + OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield);
  *v10 = v8;
  v10[1] = (uint64_t (*)())v7;
  sub_10001ACD4((uint64_t)v8);
  sub_10000C128(v11);
  sub_10005A5F8();
  sub_10000C128((uint64_t)v8);
  swift_release();

  swift_release();
}

- (void)hideContent
{
}

- (void)showLinkDetailViewControllerForPseudonym:(id)a3
{
}

- (void)showVideoPlayerForMessageWithUUID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = self;
  sub_10005AADC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_release();
}

- (void)presentRecentsDetailsViewFor:(id)a3
{
}

- (UICollectionView)collectionView
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  uint64_t v4 = (void *)sub_10005B214();
  swift_release();

  return (UICollectionView *)v4;
}

- (FTRecentsContainerViewController)initWithCoder:(id)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield);
  *uint64_t v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___FTRecentsContainerViewController_recentsList) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___FTRecentsContainerViewController_content) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RecentsContainerViewController();
  uint64_t v6 = [(FTRecentsContainerViewController *)&v8 initWithCoder:a3];
  swift_release();
  return v6;
}

- (void).cxx_destruct
{
  sub_10000C128(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___FTRecentsContainerViewController_presentScreenTimeShield));

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___FTRecentsContainerViewController_content);
}

@end