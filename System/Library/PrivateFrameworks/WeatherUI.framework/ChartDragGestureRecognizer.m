@interface ChartDragGestureRecognizer
- (_TtC9WeatherUI26ChartDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation ChartDragGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1B4769F1C();
  sub_1B4769F5C();
  uint64_t v6 = sub_1B4839150();
  id v7 = a4;
  v8 = self;
  ChartDragGestureRecognizer.touchesBegan(_:with:)(v6, (uint64_t)v7);

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
  sub_1B4769F1C();
  sub_1B4769F5C();
  sub_1B4839150();
  id v6 = a4;
  id v7 = self;
  ChartDragGestureRecognizer.touchesCancelled(_:with:)();

  swift_bridgeObjectRelease();
}

- (void)reset
{
  v2 = self;
  ChartDragGestureRecognizer.reset()();
}

- (_TtC9WeatherUI26ChartDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1B4839690();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC9WeatherUI26ChartDragGestureRecognizer *)ChartDragGestureRecognizer.init(target:action:)((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC9WeatherUI26ChartDragGestureRecognizer_initialTouch));
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9WeatherUI26ChartDragGestureRecognizer_timer);
}

@end