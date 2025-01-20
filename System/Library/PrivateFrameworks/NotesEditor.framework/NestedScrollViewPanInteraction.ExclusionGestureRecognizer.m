@interface NestedScrollViewPanInteraction.ExclusionGestureRecognizer
- (_TtCC11NotesEditor30NestedScrollViewPanInteraction26ExclusionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)_scrollingChangedWithEvent:(id)a3;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation NestedScrollViewPanInteraction.ExclusionGestureRecognizer

- (_TtCC11NotesEditor30NestedScrollViewPanInteraction26ExclusionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  return (_TtCC11NotesEditor30NestedScrollViewPanInteraction26ExclusionGestureRecognizer *)sub_20C0EA170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(_OWORD *, uint64_t))sub_20C0E9E78);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)reset
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction26ExclusionGestureRecognizer_touch) = 0;
  MEMORY[0x270F9A758]();
}

- (void)_scrollingChangedWithEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  if (![(NestedScrollViewPanInteraction.ExclusionGestureRecognizer *)v5 state]) {
    [(NestedScrollViewPanInteraction.ExclusionGestureRecognizer *)v5 setState:3];
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction26ExclusionGestureRecognizer_touch));
}

@end