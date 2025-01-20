@interface VerticalStackView.FooterView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtCC8VideosUI17VerticalStackView10FooterView)initWithCoder:(id)a3;
- (_TtCC8VideosUI17VerticalStackView10FooterView)initWithFrame:(CGRect)a3;
@end

@implementation VerticalStackView.FooterView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E36D1118(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (_TtCC8VideosUI17VerticalStackView10FooterView)initWithFrame:(CGRect)a3
{
  return (_TtCC8VideosUI17VerticalStackView10FooterView *)sub_1E36D16A4();
}

- (_TtCC8VideosUI17VerticalStackView10FooterView)initWithCoder:(id)a3
{
  return (_TtCC8VideosUI17VerticalStackView10FooterView *)sub_1E36D1730(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtCC8VideosUI17VerticalStackView10FooterView____lazy_storage___viewLayout);
  sub_1E2FA40F8(v3);
}

@end