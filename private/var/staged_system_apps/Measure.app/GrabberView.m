@interface GrabberView
- (CGSize)intrinsicContentSize;
- (_TtC7Measure11GrabberView)init;
- (_TtC7Measure11GrabberView)initWithCoder:(id)a3;
- (_TtC7Measure11GrabberView)initWithFrame:(CGRect)a3;
@end

@implementation GrabberView

- (_TtC7Measure11GrabberView)init
{
  return (_TtC7Measure11GrabberView *)sub_1001EFA28();
}

- (_TtC7Measure11GrabberView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7Measure11GrabberView_backgroundView;
  id v6 = objc_allocWithZone((Class)_UIGrabber);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC7Measure11GrabberView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v2 = qword_1004C27E0;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_1004F7DF8;
  if (qword_1004C2818 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_1004F7E30;

  double v6 = *(double *)&v4;
  double v7 = *(double *)&v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC7Measure11GrabberView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC7Measure11GrabberView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end