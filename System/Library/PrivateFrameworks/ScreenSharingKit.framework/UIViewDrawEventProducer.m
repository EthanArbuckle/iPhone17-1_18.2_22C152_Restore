@interface UIViewDrawEventProducer
- (_TtC16ScreenSharingKit23UIViewDrawEventProducer)init;
- (void)dealloc;
- (void)handlePan:(id)a3;
- (void)handleTap:(id)a3;
@end

@implementation UIViewDrawEventProducer

- (void)dealloc
{
  char v4 = 1;
  v2 = self;
  sub_25BC08098();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for UIViewDrawEventProducer();
  [(UIViewDrawEventProducer *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  sub_25BAC335C((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit23UIViewDrawEventProducer_previousTapEventDate, &qword_26A53ACD0);
  sub_25BAC335C((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit23UIViewDrawEventProducer_activeStrokeID, &qword_26A537E20);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit23UIViewDrawEventProducer_localDrawingView));
  swift_bridgeObjectRelease();
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit23UIViewDrawEventProducer____lazy_storage___tapGestureRecognizer));
  objc_super v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16ScreenSharingKit23UIViewDrawEventProducer____lazy_storage___panGestureRecognizer);
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25BBBB9B4(v4);
}

- (void)handlePan:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25BBBBDA0(v4);
}

- (_TtC16ScreenSharingKit23UIViewDrawEventProducer)init
{
  return (_TtC16ScreenSharingKit23UIViewDrawEventProducer *)sub_25BBBC7D0();
}

@end