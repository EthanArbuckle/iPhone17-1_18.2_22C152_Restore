@interface CollectionRichHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI24CollectionRichHeaderView)initWithCoder:(id)a3;
- (_TtC8VideosUI24CollectionRichHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation CollectionRichHeaderView

- (_TtC8VideosUI24CollectionRichHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI24CollectionRichHeaderView *)sub_1E3021EE0();
}

- (_TtC8VideosUI24CollectionRichHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3021F70();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1E30225C0((SEL *)&selRef_prepareForReuse);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  OUTLINED_FUNCTION_11_2();
  sub_1E3022058();
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
  sub_1E30221B8();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v5 = self;
  OUTLINED_FUNCTION_11_2();
  sub_1E3022060(a4);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24CollectionRichHeaderView_hostingView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI24CollectionRichHeaderView____lazy_storage___hostingContainerView);
}

@end