@interface PKNearbyPeerPaymentEntryCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKNearbyPeerPaymentEntryCollectionViewCell)initWithCoder:(id)a3;
- (PKNearbyPeerPaymentEntryCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PKNearbyPeerPaymentEntryCollectionViewCell

- (PKNearbyPeerPaymentEntryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (PKNearbyPeerPaymentEntryCollectionViewCell *)NearbyPeerPaymentEntryCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKNearbyPeerPaymentEntryCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_19FCE62EC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_19FCE5F84();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___PKNearbyPeerPaymentEntryCollectionViewCell_titleLabel);
  v6 = self;
  id v7 = objc_msgSend(v5, sel_font);
  if (v7)
  {
    v10 = v7;
    objc_msgSend(v7, sel_lineHeight);
    double v12 = v11;

    double v9 = fmin(width + 6.0 + v12, height);
    double v8 = width;
  }
  else
  {
    __break(1u);
  }
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___PKNearbyPeerPaymentEntryCollectionViewCell_circleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___PKNearbyPeerPaymentEntryCollectionViewCell_nearbySymbolView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___PKNearbyPeerPaymentEntryCollectionViewCell_titleLabel);
}

@end