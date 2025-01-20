@interface ProgressView
- (CGSize)sizeThatFits:(CGSize)result;
- (_TtC16MusicApplication12ProgressView)initWithCoder:(id)a3;
- (_TtC16MusicApplication12ProgressView)initWithFrame:(CGRect)a3;
- (double)progress;
- (void)layoutSubviews;
- (void)setProgress:(double)a3;
@end

@implementation ProgressView

- (_TtC16MusicApplication12ProgressView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication12ProgressView *)sub_416584(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication12ProgressView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_416E74();
}

- (double)progress
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication12ProgressView_progress);
}

- (void)setProgress:(double)a3
{
  v4 = self;
  sub_4168F4(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_416B18();
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = fmin(result.height, 5.0);
  result.height = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication12ProgressView_progressFillView));
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication12ProgressView_backgroundView);
}

@end