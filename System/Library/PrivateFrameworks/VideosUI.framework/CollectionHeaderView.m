@interface CollectionHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (UIView)accessibilitySubtitleView;
- (UIView)accessibilityTitleView;
- (VUIButton)accessibilityButtonView;
- (VUIImageView)accessibilityImageView;
- (_TtC8VideosUI20CollectionHeaderView)initWithCoder:(id)a3;
- (_TtC8VideosUI20CollectionHeaderView)initWithFrame:(CGRect)a3;
- (void)headerTapped;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)tintColorDidChange;
@end

@implementation CollectionHeaderView

- (_TtC8VideosUI20CollectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI20CollectionHeaderView *)sub_1E35B1F8C();
}

- (_TtC8VideosUI20CollectionHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E35B2118();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  OUTLINED_FUNCTION_11_2();
  sub_1E35B2254();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E35B236C();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  double v7 = self;
  sub_1E35B22B0((char **)v4, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E35B3464();
}

- (void)tintColorDidChange
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E35B36A0();
}

- (UIView)accessibilityTitleView
{
  v2 = sub_1E35B388C();
  return (UIView *)v2;
}

- (UIView)accessibilitySubtitleView
{
  v2 = sub_1E35B3908();
  return (UIView *)v2;
}

- (VUIButton)accessibilityButtonView
{
  v2 = sub_1E35B3984();
  return (VUIButton *)v2;
}

- (VUIImageView)accessibilityImageView
{
  v2 = sub_1E35B3A00();
  return (VUIImageView *)v2;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20CollectionHeaderView_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20CollectionHeaderView_subtitleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20CollectionHeaderView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20CollectionHeaderView_accessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20CollectionHeaderView_buttonView));
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI20CollectionHeaderView_supplementaryViewModel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI20CollectionHeaderView_containerView);
}

- (void)headerTapped
{
  v2 = self;
  OUTLINED_FUNCTION_81();
  sub_1E35B4728();
}

@end