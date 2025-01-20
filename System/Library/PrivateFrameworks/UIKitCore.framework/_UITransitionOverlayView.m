@interface _UITransitionOverlayView
- (_UITransitionOverlayView)initWithCoder:(id)a3;
- (_UITransitionOverlayView)initWithFrame:(CGRect)a3;
- (_UITransitionOverlayView)initWithSnapshot:(id)a3;
- (id)transitionCompletionBlock;
- (void)finishTransitionImmediately;
- (void)layoutSubviews;
- (void)setTransitionCompletionBlock:(id)a3;
- (void)startTransition;
@end

@implementation _UITransitionOverlayView

- (id)transitionCompletionBlock
{
  v2 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UITransitionOverlayView_transitionCompletionBlock);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_185A28FD4;
    aBlock[3] = &block_descriptor_19_3;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setTransitionCompletionBlock:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1858F3968;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____UITransitionOverlayView_transitionCompletionBlock);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1854AFD40(v7);
}

- (_UITransitionOverlayView)initWithSnapshot:(id)a3
{
  return (_UITransitionOverlayView *)_UITransitionOverlayView.init(snapshot:)(a3);
}

- (void)startTransition
{
  v2 = self;
  _UITransitionOverlayView.startTransition()();
}

- (void)finishTransitionImmediately
{
  v2 = self;
  _sSo24_UITransitionOverlayViewC5UIKitE27finishTransitionImmediatelyyyF_0();
}

- (_UITransitionOverlayView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UITransitionOverlayView_state) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UITransitionOverlayView_transitionCompletionBlock);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_UITransitionOverlayView *)sub_186A1F60C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_UITransitionOverlayView;
  v2 = self;
  [(UIView *)&v5 layoutSubviews];
  uint64_t v3 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____UITransitionOverlayView_snapshot);
  [(UIView *)v2 bounds];
  objc_msgSend(v3, sel_setFrame_);
  v4 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____UITransitionOverlayView_backdrop);
  [(UIView *)v2 bounds];
  objc_msgSend(v4, sel_setFrame_);
}

- (_UITransitionOverlayView)initWithFrame:(CGRect)a3
{
  result = (_UITransitionOverlayView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_185A29B50(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____UITransitionOverlayView_state));

  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____UITransitionOverlayView_transitionCompletionBlock);
  sub_1854AFD40(v3);
}

@end