@interface PanEaterGestureRecognizer
- (_TtC11NotesEditor25PanEaterGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (uint64_t)touchesEnded:(uint64_t)a3 withEvent:(void *)a4;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation PanEaterGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (uint64_t)touchesEnded:(uint64_t)a3 withEvent:(void *)a4
{
  sub_20BFCEE58(0, &qword_2676BBC00);
  sub_20BFCA760((unint64_t *)&qword_2676BF2B0, &qword_2676BBC00);
  uint64_t v6 = sub_20C162E60();
  id v7 = a4;
  id v8 = a1;
  sub_20BFCB210(v6);

  return swift_bridgeObjectRelease();
}

- (void)reset
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PanEaterGestureRecognizer();
  v2 = (char *)v5.receiver;
  [(PanEaterGestureRecognizer *)&v5 reset];
  v3 = *(void **)&v2[OBJC_IVAR____TtC11NotesEditor25PanEaterGestureRecognizer_touch];
  *(void *)&v2[OBJC_IVAR____TtC11NotesEditor25PanEaterGestureRecognizer_touch] = 0;

  v4 = &v2[OBJC_IVAR____TtC11NotesEditor25PanEaterGestureRecognizer_startPoint];
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
}

- (_TtC11NotesEditor25PanEaterGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_20C1638F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC11NotesEditor25PanEaterGestureRecognizer *)sub_20BFC0AD0((uint64_t)v6, (uint64_t)a4);
}

- (void).cxx_destruct
{
}

@end