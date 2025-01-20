@interface DebugFormatUploadDiffStatusView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8NewsFeed31DebugFormatUploadDiffStatusView)initWithCoder:(id)a3;
- (_TtC8NewsFeed31DebugFormatUploadDiffStatusView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DebugFormatUploadDiffStatusView

- (_TtC8NewsFeed31DebugFormatUploadDiffStatusView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C009979C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C0097048();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = fmin(a3.width, 600.0);
  double v4 = fmin(a3.height, 32.0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC8NewsFeed31DebugFormatUploadDiffStatusView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC8NewsFeed31DebugFormatUploadDiffStatusView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadDiffStatusView_onTargetTap));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadDiffStatusView_targetButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadDiffStatusView_statusLabel));
  swift_release();
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadDiffStatusView_progressView);
}

@end