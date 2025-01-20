@interface TapDragGestureRecognizer
- (_TtC9TeaCharts24TapDragGestureRecognizer)initWithCoder:(id)a3;
- (_TtC9TeaCharts24TapDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TapDragGestureRecognizer

- (_TtC9TeaCharts24TapDragGestureRecognizer)initWithCoder:(id)a3
{
  id v3 = a3;
  TapDragGestureRecognizer.init(coder:)();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1BD5FAC34();
  sub_1BD5FAC74();
  uint64_t v6 = sub_1BD60A660();
  id v7 = a4;
  v8 = self;
  TapDragGestureRecognizer.touchesBegan(_:with:)(v6, v7);

  swift_bridgeObjectRelease();
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1BD5FAC34();
  sub_1BD5FAC74();
  sub_1BD60A660();
  id v6 = a4;
  id v7 = self;
  TapDragGestureRecognizer.touchesCancelled(_:with:)();

  swift_bridgeObjectRelease();
}

- (void)reset
{
  v2 = self;
  TapDragGestureRecognizer.reset()();
}

- (_TtC9TeaCharts24TapDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1BD60A7E0();
    swift_unknownObjectRelease();
  }
  TapDragGestureRecognizer.init(target:action:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9TeaCharts24TapDragGestureRecognizer_timer);
}

@end