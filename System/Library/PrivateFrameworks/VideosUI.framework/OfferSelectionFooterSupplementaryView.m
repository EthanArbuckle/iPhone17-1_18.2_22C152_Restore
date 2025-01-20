@interface OfferSelectionFooterSupplementaryView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI37OfferSelectionFooterSupplementaryView)initWithCoder:(id)a3;
- (_TtC8VideosUI37OfferSelectionFooterSupplementaryView)initWithFrame:(CGRect)a3;
@end

@implementation OfferSelectionFooterSupplementaryView

- (_TtC8VideosUI37OfferSelectionFooterSupplementaryView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI37OfferSelectionFooterSupplementaryView *)sub_1E3284124();
}

- (_TtC8VideosUI37OfferSelectionFooterSupplementaryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E32841F4();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E328429C(v4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI37OfferSelectionFooterSupplementaryView____lazy_storage___separatorView));
  swift_bridgeObjectRelease();
  swift_release();
}

@end