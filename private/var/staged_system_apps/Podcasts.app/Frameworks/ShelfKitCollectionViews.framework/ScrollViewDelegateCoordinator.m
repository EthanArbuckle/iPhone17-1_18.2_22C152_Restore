@interface ScrollViewDelegateCoordinator
- (_TtC23ShelfKitCollectionViews29ScrollViewDelegateCoordinator)init;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation ScrollViewDelegateCoordinator

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1F60EC((uint64_t)v4);
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1F6230((uint64_t)v4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1F6374((uint64_t)v4);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1F64B8((uint64_t)v6, a4);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1F6610((uint64_t)v4);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  v10 = self;
  sub_1F6754((uint64_t)v9, (uint64_t)a5, x, y);
}

- (_TtC23ShelfKitCollectionViews29ScrollViewDelegateCoordinator)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews29ScrollViewDelegateCoordinator_scrollCoordinators) = (Class)_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ScrollViewDelegateCoordinator();
  return [(ScrollViewDelegateCoordinator *)&v3 init];
}

- (void).cxx_destruct
{
}

@end