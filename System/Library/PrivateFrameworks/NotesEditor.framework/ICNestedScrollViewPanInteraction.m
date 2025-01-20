@interface ICNestedScrollViewPanInteraction
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (ICNestedScrollViewPanInteraction)init;
- (UIView)view;
- (void)didMoveToView:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation ICNestedScrollViewPanInteraction

- (UIView)view
{
  v2 = (void *)MEMORY[0x210546B30]((char *)self + OBJC_IVAR___ICNestedScrollViewPanInteraction_view, a2);

  return (UIView *)v2;
}

- (void)setView:(id)a3
{
}

- (void)willMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_20C0E82D0((uint64_t)a3);
}

- (void)didMoveToView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_20C0E8474(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ICNestedScrollViewPanInteraction_nestedScrollVerticalPanBlocker));

  sub_20BFCEB78((uint64_t)self + OBJC_IVAR___ICNestedScrollViewPanInteraction_delegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (ICNestedScrollViewPanInteraction)init
{
  result = (ICNestedScrollViewPanInteraction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_20C0EA37C((uint64_t)v6, (uint64_t)v7);

  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  unsigned __int8 v9 = sub_20C0EA574((uint64_t)v6, v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_20C0EA8B4(v6, v7);

  return v9 & 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_20C0E873C();
  if (*(void *)(v7 + 56))
  {
    objc_msgSend(v4, sel_contentOffset);
    sub_20C0EAB84(v8);
  }
  ((void (*)(uint64_t *, void))v6)(&v9, 0);
  sub_20C0E9310();
}

@end