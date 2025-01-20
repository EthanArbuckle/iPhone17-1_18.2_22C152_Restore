@interface SeparatorDecorationView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI23SeparatorDecorationView)initWithCoder:(id)a3;
- (_TtC8VideosUI23SeparatorDecorationView)initWithFrame:(CGRect)a3;
@end

@implementation SeparatorDecorationView

- (_TtC8VideosUI23SeparatorDecorationView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI23SeparatorDecorationView *)sub_1E34892A8(&OBJC_IVAR____TtC8VideosUI23SeparatorDecorationView_lineView, &OBJC_IVAR____TtC8VideosUI23SeparatorDecorationView_lineHeight, type metadata accessor for SeparatorDecorationView);
}

- (_TtC8VideosUI23SeparatorDecorationView)initWithCoder:(id)a3
{
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  OUTLINED_FUNCTION_4_145(self);
  char v5 = OUTLINED_FUNCTION_23_13();
  sub_1E3488F58(v5, v6, v7);

  double v8 = OUTLINED_FUNCTION_28_4();
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
}

@end