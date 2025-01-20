@interface BottomPlayerCell
- (_TtC5Music16BottomPlayerCell)initWithCoder:(id)a3;
- (_TtC5Music16BottomPlayerCell)initWithFrame:(CGRect)a3;
@end

@implementation BottomPlayerCell

- (_TtC5Music16BottomPlayerCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC5Music16BottomPlayerCell_viewController;
  id v6 = objc_allocWithZone((Class)type metadata accessor for BottomPlayerViewController());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Music16BottomPlayerCell_queue) = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Music16BottomPlayerCell_handoffToAction);
  void *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Music16BottomPlayerCell_handoffFromAction);
  void *v9 = 0;
  v9[1] = 0;

  result = (_TtC5Music16BottomPlayerCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC5Music16BottomPlayerCell)initWithFrame:(CGRect)a3
{
  return (_TtC5Music16BottomPlayerCell *)sub_1003D9AE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music16BottomPlayerCell_viewController));

  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC5Music16BottomPlayerCell_handoffToAction));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC5Music16BottomPlayerCell_handoffFromAction);

  sub_10006ADFC(v3);
}

@end