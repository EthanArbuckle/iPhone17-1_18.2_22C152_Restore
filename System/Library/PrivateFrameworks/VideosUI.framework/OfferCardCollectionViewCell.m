@interface OfferCardCollectionViewCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI27OfferCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8VideosUI27OfferCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)rentalExpirationLabelNeedsRelayout:(id)a3;
- (void)vui_prepareForReuse;
@end

@implementation OfferCardCollectionViewCell

- (_TtC8VideosUI27OfferCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI27OfferCardCollectionViewCell *)sub_1E379E0F0();
}

- (_TtC8VideosUI27OfferCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E379E184();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E379E224(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)vui_prepareForReuse
{
  v2 = self;
  sub_1E379E360();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27OfferCardCollectionViewCell_offerView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI27OfferCardCollectionViewCell_belowCardTextLabel);
}

- (void)rentalExpirationLabelNeedsRelayout:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E34248CC();
}

@end