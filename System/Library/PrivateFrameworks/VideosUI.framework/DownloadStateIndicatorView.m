@interface DownloadStateIndicatorView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI26DownloadStateIndicatorView)init;
- (_TtC8VideosUI26DownloadStateIndicatorView)initWithCoder:(id)a3;
- (_TtC8VideosUI26DownloadStateIndicatorView)initWithFrame:(CGRect)a3;
- (void)dealloc;
@end

@implementation DownloadStateIndicatorView

- (_TtC8VideosUI26DownloadStateIndicatorView)init
{
  return (_TtC8VideosUI26DownloadStateIndicatorView *)sub_1E341CEE4();
}

- (_TtC8VideosUI26DownloadStateIndicatorView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E341D0CC();
}

- (void)dealloc
{
  v2 = self;
  sub_1E341D15C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26DownloadStateIndicatorView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26DownloadStateIndicatorView_progressView));
  swift_release();
  swift_release();
  swift_release();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v5 = self;
  OUTLINED_FUNCTION_11_2();
  sub_1E341D5C0(a4);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC8VideosUI26DownloadStateIndicatorView)initWithFrame:(CGRect)a3
{
}

@end