@interface SyndicationCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI15SyndicationCell)initWithCoder:(id)a3;
- (_TtC8VideosUI15SyndicationCell)initWithFrame:(CGRect)a3;
- (void)vui_cellDidSelect;
- (void)vui_cellWillBeDisplayed;
- (void)vui_prepareForReuse;
@end

@implementation SyndicationCell

- (_TtC8VideosUI15SyndicationCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI15SyndicationCell *)sub_1E339D5AC();
}

- (_TtC8VideosUI15SyndicationCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E339D7FC();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E339D8DC(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)vui_cellWillBeDisplayed
{
  v2 = self;
  sub_1E339E7B8((SEL *)&selRef_vui_cellWillBeDisplayed, 1);
}

- (void)vui_cellDidSelect
{
  v2 = self;
  sub_1E339E7B8((SEL *)&selRef_vui_cellDidSelect, 0);
}

- (void)vui_prepareForReuse
{
  v2 = self;
  sub_1E339E8EC();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15SyndicationCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15SyndicationCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15SyndicationCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15SyndicationCell_attributionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15SyndicationCell_badgeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15SyndicationCell____lazy_storage___bottomSeparatorView));
  swift_bridgeObjectRelease();
}

@end