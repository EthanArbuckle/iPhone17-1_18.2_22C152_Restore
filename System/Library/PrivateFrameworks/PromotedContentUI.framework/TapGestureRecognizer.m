@interface TapGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtC17PromotedContentUI20TapGestureRecognizer)init;
- (_TtC17PromotedContentUI20TapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TapGestureRecognizer

- (_TtC17PromotedContentUI20TapGestureRecognizer)init
{
  return (_TtC17PromotedContentUI20TapGestureRecognizer *)sub_1B5D07530();
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
  v2 = self;
  sub_1B5D083D4();
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  swift_beginAccess();
  id v7 = a4;
  id v8 = a3;
  v9 = self;
  uint64_t v10 = swift_bridgeObjectRetain();
  sub_1B5D08FC8(v10, v7);
  LOBYTE(self) = v11;

  swift_bridgeObjectRelease();
  return (self & 1) == 0;
}

- (_TtC17PromotedContentUI20TapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1B5DBB088();
    swift_unknownObjectRelease();
  }
  result = (_TtC17PromotedContentUI20TapGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B5D09338(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC17PromotedContentUI20TapGestureRecognizer_touchDownHandler));
  sub_1B5D09338(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC17PromotedContentUI20TapGestureRecognizer_touchMovedHandler));
  sub_1B5D09338(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC17PromotedContentUI20TapGestureRecognizer_touchUpHandler));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC17PromotedContentUI20TapGestureRecognizer____lazy_storage___scrollableAncestor);
  sub_1B5D08894(v3);
}

@end