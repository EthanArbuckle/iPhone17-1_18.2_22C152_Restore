@interface SliderView.SliderGestureRecognizer
- (_TtCC9SeymourUI10SliderViewP33_2440CD4F62170E63FB4B5B855592F14723SliderGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation SliderView.SliderGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_239C24FF0(0, &qword_268A15870);
  sub_23A0D7C50();
  sub_23A7FFF58();
  id v6 = a4;
  v7 = self;
  v8 = (void *)sub_23A7FFF48();
  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for SliderView.SliderGestureRecognizer();
  [(SliderView.SliderGestureRecognizer *)&v9 touchesBegan:v8 withEvent:v6];

  [(SliderView.SliderGestureRecognizer *)v7 setState:1];
  swift_bridgeObjectRelease();
}

- (_TtCC9SeymourUI10SliderViewP33_2440CD4F62170E63FB4B5B855592F14723SliderGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_23A8009F8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtCC9SeymourUI10SliderViewP33_2440CD4F62170E63FB4B5B855592F14723SliderGestureRecognizer *)sub_23A788028((uint64_t)v6, (uint64_t)a4);
}

@end