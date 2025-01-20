@interface SliderView.PanGestureRecognizer
- (_TtCC12NewsArticles10SliderViewP33_9E8B7C024EAF79BE20F276F3609F182920PanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation SliderView.PanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1BF4A7104(0, &qword_1EA1585E0);
  sub_1BF7D7FFC();
  sub_1BF7E3EE8();
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_1BF7E3ED8();
  v10.receiver = v8;
  v10.super_class = ObjectType;
  [(SliderView.PanGestureRecognizer *)&v10 touchesBegan:v9 withEvent:v7];

  [(SliderView.PanGestureRecognizer *)v8 setState:1];
  swift_bridgeObjectRelease();
}

- (_TtCC12NewsArticles10SliderViewP33_9E8B7C024EAF79BE20F276F3609F182920PanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1BF7E4728();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtCC12NewsArticles10SliderViewP33_9E8B7C024EAF79BE20F276F3609F182920PanGestureRecognizer *)sub_1BF7D8398((uint64_t)v6, (uint64_t)a4);
}

@end