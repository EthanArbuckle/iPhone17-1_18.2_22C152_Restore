@interface CanonicalFooterSectionView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (VUILabel)accessibilityHeaderView;
- (_TtC8VideosUI26CanonicalFooterSectionView)init;
- (_TtC8VideosUI26CanonicalFooterSectionView)initWithCoder:(id)a3;
- (_TtC8VideosUI26CanonicalFooterSectionView)initWithFrame:(CGRect)a3;
@end

@implementation CanonicalFooterSectionView

- (_TtC8VideosUI26CanonicalFooterSectionView)init
{
  return (_TtC8VideosUI26CanonicalFooterSectionView *)sub_1E358739C();
}

- (_TtC8VideosUI26CanonicalFooterSectionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3587498();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat width = a3.width;
  v6 = self;
  CGFloat v7 = sub_1E3587594(v4, width);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.CGFloat width = v10;
  return result;
}

- (VUILabel)accessibilityHeaderView
{
  v2 = self;
  id v3 = (void *)sub_1E35883B4();

  return (VUILabel *)v3;
}

- (_TtC8VideosUI26CanonicalFooterSectionView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26CanonicalFooterSectionView_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26CanonicalFooterSectionView_footerView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26CanonicalFooterSectionView_prototypeItemHeaderLabel));
  swift_bridgeObjectRelease();
}

@end