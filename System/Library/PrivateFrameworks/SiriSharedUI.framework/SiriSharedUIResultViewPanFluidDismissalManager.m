@interface SiriSharedUIResultViewPanFluidDismissalManager
- (_TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager)init;
- (void)_hyperInteractorApplyPresentationPoint:(id)a3;
@end

@implementation SiriSharedUIResultViewPanFluidDismissalManager

- (_TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager)init
{
  return (_TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager *)sub_20CA37A68();
}

- (void)_hyperInteractorApplyPresentationPoint:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager_delegate;
  if (MEMORY[0x210553300]((char *)self + OBJC_IVAR____TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 16);
    id v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager_fluidDismissalGesture));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager_resultViewStablePoint));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager_interactiveRegion));
  v3 = (char *)self + OBJC_IVAR____TtC12SiriSharedUI46SiriSharedUIResultViewPanFluidDismissalManager_delegate;
  sub_20CA202D4((uint64_t)v3);
}

@end