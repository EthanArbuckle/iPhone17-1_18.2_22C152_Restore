@interface MiniPlayerAddCell
- (_TtC5Music17MiniPlayerAddCell)initWithCoder:(id)a3;
- (_TtC5Music17MiniPlayerAddCell)initWithFrame:(CGRect)a3;
@end

@implementation MiniPlayerAddCell

- (_TtC5Music17MiniPlayerAddCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Music17MiniPlayerAddCell_trailingConstraint) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Music17MiniPlayerAddCell_tapAction);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC5Music17MiniPlayerAddCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC5Music17MiniPlayerAddCell)initWithFrame:(CGRect)a3
{
  sub_1004A3474(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Music17MiniPlayerAddCell_trailingConstraint));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC5Music17MiniPlayerAddCell_tapAction);

  sub_10006ADFC(v3);
}

@end