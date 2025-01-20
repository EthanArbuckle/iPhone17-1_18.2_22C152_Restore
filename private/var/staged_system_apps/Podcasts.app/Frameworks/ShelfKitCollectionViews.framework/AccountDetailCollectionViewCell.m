@interface AccountDetailCollectionViewCell
- (BOOL)accessibilityDisabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)accessibilityAccessoryView;
- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didTapWithAccessoryView:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)wasTapped;
@end

@implementation AccountDetailCollectionViewCell

- (BOOL)isSelected
{
  return sub_1A2678(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
}

- (BOOL)isHighlighted
{
  return sub_1A2678(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (_TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell *)sub_1A29E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1A57CC();
}

- (void)wasTapped
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_selectionHandler);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_3C800((uint64_t)v2);
    v2(v3);
    sub_27760((uint64_t)v2);
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1A33EC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1A46B4(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)didTapWithAccessoryView:(id)a3
{
  uint64_t v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_accessoryAction);
  if (v3)
  {
    id v5 = a3;
    double v7 = self;
    uint64_t v6 = sub_3C800((uint64_t)v3);
    v3(v6);
    sub_27760((uint64_t)v3);
  }
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1A4AE4();
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_titleLabel);
}

- (_TtC23ShelfKitCollectionViews16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC23ShelfKitCollectionViews16DynamicTypeLabel *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_subtitleLabel);
}

- (UIView)accessibilityAccessoryView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_accessoryView));
}

- (BOOL)accessibilityDisabled
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_disabled);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_accessoryView));
  sub_1A592C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_accessory), *(void *)&self->titleLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_accessory], self->subtitleLabel[OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_accessory]);
  sub_27760(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_accessoryAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_topDivider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_bottomDivider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_backgroundSelectionView));
  sub_27760(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_selectionHandler));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews31AccountDetailCollectionViewCell_tapGestureRecognizer);
}

@end