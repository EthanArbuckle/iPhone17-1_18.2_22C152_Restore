@interface CanvasReflectionPromptView
- (_TtC7Journal26CanvasReflectionPromptView)initWithCoder:(id)a3;
- (_TtC7Journal26CanvasReflectionPromptView)initWithFrame:(CGRect)a3;
@end

@implementation CanvasReflectionPromptView

- (_TtC7Journal26CanvasReflectionPromptView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal26CanvasReflectionPromptView *)sub_100262A80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal26CanvasReflectionPromptView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100264184();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal26CanvasReflectionPromptView_promptLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal26CanvasReflectionPromptView_promptLabelTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal26CanvasReflectionPromptView_xPlatterView));
  swift_release();

  swift_release();
}

@end