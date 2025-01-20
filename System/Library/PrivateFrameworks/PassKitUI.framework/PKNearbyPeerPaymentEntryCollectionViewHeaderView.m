@interface PKNearbyPeerPaymentEntryCollectionViewHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKNearbyPeerPaymentEntryCollectionViewHeaderView)initWithCoder:(id)a3;
- (PKNearbyPeerPaymentEntryCollectionViewHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PKNearbyPeerPaymentEntryCollectionViewHeaderView

- (PKNearbyPeerPaymentEntryCollectionViewHeaderView)initWithFrame:(CGRect)a3
{
  return (PKNearbyPeerPaymentEntryCollectionViewHeaderView *)NearbyEntryCollectionViewHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKNearbyPeerPaymentEntryCollectionViewHeaderView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR___PKNearbyPeerPaymentEntryCollectionViewHeaderView_lineView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (PKNearbyPeerPaymentEntryCollectionViewHeaderView *)sub_1A03B5A98();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NearbyEntryCollectionViewHeaderView();
  v2 = (char *)v8.receiver;
  [(PKNearbyPeerPaymentEntryCollectionViewHeaderView *)&v8 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v8.receiver, v8.super_class);
  double v4 = v3;
  objc_msgSend(v2, sel_bounds);
  double v6 = v5;
  objc_msgSend(v2, sel_bounds);
  double Width = CGRectGetWidth(v9);
  objc_msgSend(*(id *)&v2[OBJC_IVAR___PKNearbyPeerPaymentEntryCollectionViewHeaderView_lineView], sel_setFrame_, v4, v6, Width, PKUIPixelLength());
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  double v4 = PKUIPixelLength();
  double v5 = width;
  result.height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PKNearbyPeerPaymentEntryCollectionViewHeaderView_lineView));
}

@end