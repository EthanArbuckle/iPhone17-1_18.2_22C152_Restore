@interface SliderView.PanGestureRecognizer
- (_TtCC11MusicCoreUI10SliderViewP33_54515F1554A39BA10CF5FF24DBCB49D920PanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation SliderView.PanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_173E4(0, &qword_DFB010);
  sub_96140C();
  sub_AB6DA0();
  id v6 = a4;
  v7 = self;
  Class isa = sub_AB6D90().super.isa;
  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for SliderView.PanGestureRecognizer();
  [(SliderView.PanGestureRecognizer *)&v9 touchesBegan:isa withEvent:v6];

  [(SliderView.PanGestureRecognizer *)v7 setState:1];
  swift_bridgeObjectRelease();
}

- (_TtCC11MusicCoreUI10SliderViewP33_54515F1554A39BA10CF5FF24DBCB49D920PanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_AB7E30();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtCC11MusicCoreUI10SliderViewP33_54515F1554A39BA10CF5FF24DBCB49D920PanGestureRecognizer *)sub_95E16C((uint64_t)v6, (uint64_t)a4);
}

@end