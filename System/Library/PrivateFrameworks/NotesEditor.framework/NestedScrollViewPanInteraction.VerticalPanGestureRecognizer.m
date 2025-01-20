@interface NestedScrollViewPanInteraction.VerticalPanGestureRecognizer
- (_TtCC11NotesEditor30NestedScrollViewPanInteraction28VerticalPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)_scrollingChangedWithEvent:(id)a3;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation NestedScrollViewPanInteraction.VerticalPanGestureRecognizer

- (_TtCC11NotesEditor30NestedScrollViewPanInteraction28VerticalPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  return (_TtCC11NotesEditor30NestedScrollViewPanInteraction28VerticalPanGestureRecognizer *)sub_20C0EA170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(_OWORD *, uint64_t))sub_20C0E976C);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)reset
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NestedScrollViewPanInteraction.VerticalPanGestureRecognizer();
  v2 = (char *)v5.receiver;
  [(NestedScrollViewPanInteraction.VerticalPanGestureRecognizer *)&v5 reset];
  v3 = *(void **)&v2[OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction28VerticalPanGestureRecognizer_touch];
  *(void *)&v2[OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction28VerticalPanGestureRecognizer_touch] = 0;

  v4 = &v2[OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction28VerticalPanGestureRecognizer_startPoint];
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
}

- (void)_scrollingChangedWithEvent:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_20C0E9C54(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC11NotesEditor30NestedScrollViewPanInteraction28VerticalPanGestureRecognizer_touch));
}

@end