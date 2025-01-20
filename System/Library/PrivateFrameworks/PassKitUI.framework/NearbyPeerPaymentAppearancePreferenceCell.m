@interface NearbyPeerPaymentAppearancePreferenceCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell)initWithCoder:(id)a3;
- (_TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation NearbyPeerPaymentAppearancePreferenceCell

- (_TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1A03B4988();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell *)NearbyPeerPaymentAppearancePreferenceCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_19FC181A4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_19FC16F88();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = self;
  double v6 = sub_19FC174A4(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)prepareForReuse
{
  v2 = self;
  sub_19FC17C44();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell_enabledImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell_profileImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell_nameSettingLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI41NearbyPeerPaymentAppearancePreferenceCell_nameLabel);
}

@end