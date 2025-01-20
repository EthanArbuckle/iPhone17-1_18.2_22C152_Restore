@interface AccountDetailCollectionViewCell
- (BOOL)accessibilityDisabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)accessibilityAccessoryView;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore31AccountDetailCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore31AccountDetailCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didTapWithAccessoryView:(id)a3;
- (void)layoutSubviews;
- (void)preferredContentSizeDidChangeWithView:(id)a3 previousTraitCollection:(id)a4;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)wasTapped;
@end

@implementation AccountDetailCollectionViewCell

- (BOOL)isSelected
{
  return sub_1006D45A8(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
}

- (BOOL)isHighlighted
{
  return sub_1006D45A8(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (_TtC8AppStore31AccountDetailCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31AccountDetailCollectionViewCell *)sub_1006D4814(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31AccountDetailCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006D7AE8();
}

- (void)wasTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_selectionHandler);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_100060050((uint64_t)v2);
    v2(v3);
    sub_10006012C((uint64_t)v2);
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006D53E0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1006D6874(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)preferredContentSizeDidChangeWithView:(id)a3 previousTraitCollection:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  double v7 = self;
  id v8 = [(AccountDetailCollectionViewCell *)v7 traitCollection];
  int v9 = UITraitCollection.prefersAccessibilityLayouts.getter() & 1;

  if (v9 != (UITraitCollection.prefersAccessibilityLayouts.getter() & 1)) {
    sub_1006D6B54();
  }
}

- (void)didTapWithAccessoryView:(id)a3
{
  uint64_t v3 = *(void (**)(void *))((char *)&self->super.super.super.super.super.isa
                                       + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_accessoryAction);
  if (v3)
  {
    v8[3] = sub_100084CF0(0, &qword_100990560);
    v8[0] = a3;
    id v6 = a3;
    double v7 = self;
    sub_100060050((uint64_t)v3);
    v3(v8);
    sub_10006012C((uint64_t)v3);
    sub_100082BCC((uint64_t)v8, (uint64_t *)&unk_100982B40);
  }
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1006D7370();
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_subtitleLabel));
}

- (UIView)accessibilityAccessoryView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_accessoryView));
}

- (BOOL)accessibilityDisabled
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_disabled);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_accessoryView));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_accessory, &qword_1009A2980);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_topSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_bottomSeparatorView));
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_accessoryAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_backgroundSelectionView));
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_selectionHandler));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore31AccountDetailCollectionViewCell_tapGestureRecognizer);
}

@end