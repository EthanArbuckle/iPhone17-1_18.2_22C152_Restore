@interface CanvasStackView
- (_TtC7Journal15CanvasStackView)initWithCoder:(id)a3;
- (_TtC7Journal15CanvasStackView)initWithFrame:(CGRect)a3;
@end

@implementation CanvasStackView

- (_TtC7Journal15CanvasStackView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal15CanvasStackView *)sub_1003985C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal15CanvasStackView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal15CanvasStackView_reflectionPromptView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Journal15CanvasStackView_journalEntry) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal15CanvasStackView_mindfulMinutesCanvasTipView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC7Journal15CanvasStackView_mindfulMinuteCanvasTipTask) = 0;
  id v4 = a3;

  result = (_TtC7Journal15CanvasStackView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal15CanvasStackView_reflectionPromptView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal15CanvasStackView_mindfulMinutesCanvasTipView));

  swift_release();
}

@end