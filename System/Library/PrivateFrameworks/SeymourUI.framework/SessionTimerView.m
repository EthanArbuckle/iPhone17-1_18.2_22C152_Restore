@interface SessionTimerView
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI16SessionTimerView)initWithCoder:(id)a3;
- (_TtC9SeymourUI16SessionTimerView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)updateDuration:(double)a3;
- (void)updateDuration:(double)a3 remainingDuration:(double)a4;
@end

@implementation SessionTimerView

- (void)updateDuration:(double)a3
{
  v4 = self;
  sub_23A4884F8(a3);
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_23A488654();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC9SeymourUI16SessionTimerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A48A470();
}

- (void)dealloc
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI16SessionTimerView_animator);
  double v4 = self;
  if (v3) {
    objc_msgSend(v3, sel_stopAnimation_, 1);
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SessionTimerView();
  [(SessionTimerView *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI16SessionTimerView_animator);
}

- (_TtC9SeymourUI16SessionTimerView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9SeymourUI16SessionTimerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)updateDuration:(double)a3 remainingDuration:(double)a4
{
}

@end