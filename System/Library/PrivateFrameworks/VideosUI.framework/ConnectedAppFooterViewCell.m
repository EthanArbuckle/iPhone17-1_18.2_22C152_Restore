@interface ConnectedAppFooterViewCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI26ConnectedAppFooterViewCell)initWithCoder:(id)a3;
- (_TtC8VideosUI26ConnectedAppFooterViewCell)initWithFrame:(CGRect)a3;
@end

@implementation ConnectedAppFooterViewCell

- (_TtC8VideosUI26ConnectedAppFooterViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI26ConnectedAppFooterViewCell *)sub_1E2FAAB60();
}

- (_TtC8VideosUI26ConnectedAppFooterViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E2FAAE40();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v5 = self;
  char v6 = OUTLINED_FUNCTION_23_13();
  sub_1E2FAAEE0(v6, v7);

  double v8 = OUTLINED_FUNCTION_28_4();
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26ConnectedAppFooterViewCell____lazy_storage___componentView));
  swift_release();
}

@end