@interface MediaShowcasingGradientView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI27MediaShowcasingGradientView)initWithCoder:(id)a3;
- (_TtC8VideosUI27MediaShowcasingGradientView)initWithFrame:(CGRect)a3;
@end

@implementation MediaShowcasingGradientView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  sub_1E35194F8(a4, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (_TtC8VideosUI27MediaShowcasingGradientView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI27MediaShowcasingGradientView *)sub_1E351A5FC();
}

- (_TtC8VideosUI27MediaShowcasingGradientView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI27MediaShowcasingGradientView *)sub_1E351A694(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27MediaShowcasingGradientView_maskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27MediaShowcasingGradientView_backgroundBlurView));
  swift_release();
}

@end