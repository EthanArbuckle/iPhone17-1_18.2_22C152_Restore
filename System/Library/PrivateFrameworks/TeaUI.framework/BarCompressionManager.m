@interface BarCompressionManager
- (BOOL)dynamicBarAnimator:(id)a3 canHideBarsByDraggingWithOffset:(double)a4;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (_TtC5TeaUI21BarCompressionManager)init;
- (void)dynamicBarAnimatorOutputsDidChange:(id)a3;
- (void)dynamicBarAnimatorWillEnterSteadyState:(id)a3;
- (void)dynamicBarAnimatorWillLeaveSteadyState:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)voiceOverStatusDidChange;
@end

@implementation BarCompressionManager

- (void)voiceOverStatusDidChange
{
  v2 = self;
  sub_1B5F0D200();
}

- (_TtC5TeaUI21BarCompressionManager)init
{
}

- (void).cxx_destruct
{
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI21BarCompressionManager_delegate);

  sub_1B5E15B34((uint64_t)self + OBJC_IVAR____TtC5TeaUI21BarCompressionManager_proxyMultiDelegate);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUI21BarCompressionManager_sceneStateManager);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  v4 = (UIScrollView *)a3;
  v5 = self;
  BarCompressionManager.scrollViewWillBeginDragging(_:)(v4);
}

- (void)scrollViewDidScroll:(id)a3
{
  v4 = (UIScrollView *)a3;
  v5 = self;
  BarCompressionManager.scrollViewDidScroll(_:)(v4);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  id v7 = a3;
  v9 = self;
  BarCompressionManager.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)(v8, y);
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v4 = a3;
  v5 = self;
  BarCompressionManager.scrollViewDidScrollToTop(_:)((UIScrollView *)v5);
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4 = (UIScrollView *)a3;
  v5 = self;
  LOBYTE(self) = BarCompressionManager.scrollViewShouldScrollToTop(_:)(v4);

  return self & 1;
}

- (void)dynamicBarAnimatorOutputsDidChange:(id)a3
{
  id v4 = (TUDynamicBarAnimator *)a3;
  v5 = self;
  BarCompressionManager.dynamicBarAnimatorOutputsDidChange(_:)(v4);
}

- (BOOL)dynamicBarAnimator:(id)a3 canHideBarsByDraggingWithOffset:(double)a4
{
  id v5 = a3;
  v6 = self;
  LOBYTE(self) = BarCompressionManager.dynamicBarAnimator(_:canHideBarsByDraggingWithOffset:)(v5);

  return self & 1;
}

- (void)dynamicBarAnimatorWillEnterSteadyState:(id)a3
{
  id v4 = (TUDynamicBarAnimator *)a3;
  id v5 = self;
  BarCompressionManager.dynamicBarAnimatorWillEnterSteadyState(_:)(v4);
}

- (void)dynamicBarAnimatorWillLeaveSteadyState:(id)a3
{
  id v4 = a3;
  id v5 = self;
  BarCompressionManager.dynamicBarAnimatorWillLeaveSteadyState(_:)((TUDynamicBarAnimator *)v5);
}

@end