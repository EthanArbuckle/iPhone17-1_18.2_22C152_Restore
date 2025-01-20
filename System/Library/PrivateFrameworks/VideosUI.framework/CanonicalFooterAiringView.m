@interface CanonicalFooterAiringView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI25CanonicalFooterAiringView)initWithCoder:(id)a3;
- (_TtC8VideosUI25CanonicalFooterAiringView)initWithFrame:(CGRect)a3;
@end

@implementation CanonicalFooterAiringView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width = a3.width;
  v6 = self;
  double v7 = sub_1E353A64C(a4, width);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (_TtC8VideosUI25CanonicalFooterAiringView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI25CanonicalFooterAiringView *)sub_1E353ADC0();
}

- (_TtC8VideosUI25CanonicalFooterAiringView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI25CanonicalFooterAiringView *)sub_1E353AE78(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25CanonicalFooterAiringView_label));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI25CanonicalFooterAiringView_imageView);
}

@end