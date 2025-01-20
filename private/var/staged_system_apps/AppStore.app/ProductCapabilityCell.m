@interface ProductCapabilityCell
- (UILabel)accessibilityCaptionLabel;
- (UILabel)accessibilityTitleLabel;
- (_TtC8AppStore21ProductCapabilityCell)initWithCoder:(id)a3;
- (_TtC8AppStore21ProductCapabilityCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ProductCapabilityCell

- (_TtC8AppStore21ProductCapabilityCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore21ProductCapabilityCell *)sub_1005127E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore21ProductCapabilityCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10051412C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100512E88();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1005121B4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10051350C(a3);
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC8AppStore21ProductCapabilityCell_titleLabel));
}

- (UILabel)accessibilityCaptionLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC8AppStore21ProductCapabilityCell_captionLabel));
}

- (void).cxx_destruct
{
  sub_1000A1D30((uint64_t)self + OBJC_IVAR____TtC8AppStore21ProductCapabilityCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21ProductCapabilityCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21ProductCapabilityCell_iconPositioningView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21ProductCapabilityCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21ProductCapabilityCell_captionLabel));

  swift_release();
}

@end