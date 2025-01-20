@interface PanGestureRecognizer
- (_TtC12NowPlayingUIP33_FA232F067623283ED0BBB5857CB78B8620PanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation PanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_E67C(0, &qword_19EA50);
  sub_50348();
  sub_129C90();
  id v6 = a4;
  v7 = self;
  Class isa = sub_129C80().super.isa;
  v9.receiver = v7;
  v9.super_class = (Class)type metadata accessor for PanGestureRecognizer();
  [(PanGestureRecognizer *)&v9 touchesBegan:isa withEvent:v6];

  [(PanGestureRecognizer *)v7 setState:1];
  swift_bridgeObjectRelease();
}

- (_TtC12NowPlayingUIP33_FA232F067623283ED0BBB5857CB78B8620PanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_12A280();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC12NowPlayingUIP33_FA232F067623283ED0BBB5857CB78B8620PanGestureRecognizer *)sub_47C88((uint64_t)v6, (uint64_t)a4);
}

@end