@interface WFMoveToFolderCoordinator
- (WFMoveToFolderCoordinator)init;
- (WFMoveToFolderCoordinator)initWithDatabase:(id)a3;
- (void)move:(id)a3 presentingViewController:(id)a4;
- (void)move:(id)a3 presentingViewController:(id)a4 source:(int)a5;
@end

@implementation WFMoveToFolderCoordinator

- (WFMoveToFolderCoordinator)initWithDatabase:(id)a3
{
  return (WFMoveToFolderCoordinator *)MoveToFolderCoordinator.init(database:)(a3);
}

- (void)move:(id)a3 presentingViewController:(id)a4
{
  sub_22D9A6F3C(0, &qword_26AEF9C00);
  uint64_t v6 = sub_22DC92B48();
  id v7 = a4;
  v8 = self;
  sub_22DBB30B0(v6, v7);

  swift_bridgeObjectRelease();
}

- (void)move:(id)a3 presentingViewController:(id)a4 source:(int)a5
{
  sub_22D9A6F3C(0, &qword_26AEF9C00);
  uint64_t v8 = sub_22DC92B48();
  id v9 = a4;
  v10 = self;
  sub_22DBB3260(v8, v9, a5);

  swift_bridgeObjectRelease();
}

- (WFMoveToFolderCoordinator)init
{
}

- (void).cxx_destruct
{
  swift_release();
  sub_22D9ADBA0((uint64_t)self + OBJC_IVAR___WFMoveToFolderCoordinator_delegate);
  swift_unknownObjectWeakDestroy();
}

@end