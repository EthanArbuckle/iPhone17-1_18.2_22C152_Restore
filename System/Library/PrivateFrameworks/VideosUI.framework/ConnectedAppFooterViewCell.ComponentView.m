@interface ConnectedAppFooterViewCell.ComponentView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtCC8VideosUI26ConnectedAppFooterViewCellP33_73B8690E5814C49348BC559E5ECDA5A413ComponentView)initWithCoder:(id)a3;
- (_TtCC8VideosUI26ConnectedAppFooterViewCellP33_73B8690E5814C49348BC559E5ECDA5A413ComponentView)initWithFrame:(CGRect)a3;
@end

@implementation ConnectedAppFooterViewCell.ComponentView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v5 = self;
  int v6 = OUTLINED_FUNCTION_23_13();
  sub_1E2FAB330(v6, v7, v8);

  double v9 = OUTLINED_FUNCTION_28_4();
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtCC8VideosUI26ConnectedAppFooterViewCellP33_73B8690E5814C49348BC559E5ECDA5A413ComponentView)initWithFrame:(CGRect)a3
{
  return (_TtCC8VideosUI26ConnectedAppFooterViewCellP33_73B8690E5814C49348BC559E5ECDA5A413ComponentView *)sub_1E2FADA94();
}

- (_TtCC8VideosUI26ConnectedAppFooterViewCellP33_73B8690E5814C49348BC559E5ECDA5A413ComponentView)initWithCoder:(id)a3
{
  return (_TtCC8VideosUI26ConnectedAppFooterViewCellP33_73B8690E5814C49348BC559E5ECDA5A413ComponentView *)sub_1E2FADB04(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI26ConnectedAppFooterViewCellP33_73B8690E5814C49348BC559E5ECDA5A413ComponentView_titleView));
  swift_bridgeObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCC8VideosUI26ConnectedAppFooterViewCellP33_73B8690E5814C49348BC559E5ECDA5A413ComponentView_buttonSeparatorView);
}

@end