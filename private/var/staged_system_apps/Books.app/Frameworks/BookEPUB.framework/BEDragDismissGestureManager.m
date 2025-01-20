@interface BEDragDismissGestureManager
- (BEDragDismissGestureDelegate)delegate;
- (BEDragDismissGestureManager)init;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4;
- (UIPanGestureRecognizer)panGesture;
- (UISwipeGestureRecognizer)swipeGesture;
- (void)dragToDismiss:(id)a3;
- (void)setDelegate:(id)a3;
- (void)swipeToDismiss:(id)a3;
@end

@implementation BEDragDismissGestureManager

- (BEDragDismissGestureDelegate)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (BEDragDismissGestureDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (UISwipeGestureRecognizer)swipeGesture
{
  return (UISwipeGestureRecognizer *)sub_1AAC78(self, (uint64_t)a2, (SEL *)&selRef_enableSwipeToDismiss, (uint64_t (*)(void))sub_1AAAD4);
}

- (UIPanGestureRecognizer)panGesture
{
  return (UIPanGestureRecognizer *)sub_1AAC78(self, (uint64_t)a2, (SEL *)&selRef_enablePullToDismiss, (uint64_t (*)(void))sub_1AABAC);
}

- (BEDragDismissGestureManager)init
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BEDragDismissGestureManager____lazy_storage____swipeGesture) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BEDragDismissGestureManager____lazy_storage____panGesture) = 0;
  v3 = (char *)self + OBJC_IVAR___BEDragDismissGestureManager_closePanningTranslation;
  *(void *)v3 = 0;
  *((void *)v3 + 1) = 0;
  v3[16] = 1;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DragDismissGestureManager();
  return [(BEDragDismissGestureManager *)&v5 init];
}

- (void).cxx_destruct
{
  sub_4F924((uint64_t)self + OBJC_IVAR___BEDragDismissGestureManager_delegate);

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BEDragDismissGestureManager____lazy_storage____panGesture);
}

- (void)swipeToDismiss:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1AAF9C(v4);
}

- (void)dragToDismiss:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1AB0C8(v4);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = _s8BookEPUB25DragDismissGestureManagerC17gestureRecognizer_13shouldReceiveSbSo09UIGestureH0C_So7UIEventCtF_0(v6);

  return v9 & 1;
}

@end