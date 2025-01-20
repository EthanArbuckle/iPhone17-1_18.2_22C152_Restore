@interface InlinePlaybackView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (UIView)accessibilityImageView;
- (UIView)accessibilityPlaybackView;
- (_TtC8VideosUI18InlinePlaybackView)initWithCoder:(id)a3;
- (_TtC8VideosUI18InlinePlaybackView)initWithFrame:(CGRect)a3;
@end

@implementation InlinePlaybackView

- (_TtC8VideosUI18InlinePlaybackView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI18InlinePlaybackView *)sub_1E32EEA3C();
}

- (_TtC8VideosUI18InlinePlaybackView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E32EEB1C();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E32EEBE4(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (UIView)accessibilityImageView
{
  v2 = self;
  id v3 = (void *)sub_1E32EF0D8();

  return (UIView *)v3;
}

- (UIView)accessibilityPlaybackView
{
  v2 = self;
  id v3 = (void *)sub_1E32EF150();

  return (UIView *)v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18InlinePlaybackView_imageView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8VideosUI18InlinePlaybackView_playbackView);
}

@end