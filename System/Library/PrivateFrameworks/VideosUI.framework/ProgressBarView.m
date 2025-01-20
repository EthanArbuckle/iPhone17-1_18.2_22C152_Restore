@interface ProgressBarView
- (_TtC8VideosUI15ProgressBarView)initWithCoder:(id)a3;
- (_TtC8VideosUI15ProgressBarView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation ProgressBarView

- (_TtC8VideosUI15ProgressBarView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI15ProgressBarView *)sub_1E374CF24();
}

- (_TtC8VideosUI15ProgressBarView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E374D100();
}

- (void)drawRect:(CGRect)a3
{
  OUTLINED_FUNCTION_1_0();
  id v4 = v3;
  OUTLINED_FUNCTION_3();
  sub_1E374D890();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15ProgressBarView_progressTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15ProgressBarView_gradientStartColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15ProgressBarView_gradientEndColor));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI15ProgressBarView_completeTintColor);
}

@end