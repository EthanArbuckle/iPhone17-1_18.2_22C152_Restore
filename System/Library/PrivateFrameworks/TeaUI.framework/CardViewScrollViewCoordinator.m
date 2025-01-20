@interface CardViewScrollViewCoordinator
- (_TtC5TeaUI29CardViewScrollViewCoordinator)init;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
@end

@implementation CardViewScrollViewCoordinator

- (_TtC5TeaUI29CardViewScrollViewCoordinator)init
{
}

- (void).cxx_destruct
{
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI29CardViewScrollViewCoordinator_delegate);

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5TeaUI29CardViewScrollViewCoordinator_scrollView);
}

- (void)scrollViewDidScroll:(id)a3
{
  v4 = (UIScrollView *)a3;
  v5 = self;
  CardViewScrollViewCoordinator.scrollViewDidScroll(_:)(v4);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  v5 = self;
  CardViewScrollViewCoordinator.scrollViewWillBeginDragging(_:)((UIScrollView *)v5);
}

@end