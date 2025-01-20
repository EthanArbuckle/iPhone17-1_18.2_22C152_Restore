@interface FadingDescriptionLabel
- (CGSize)intrinsicContentSize;
- (UIView)viewForLastBaselineLayout;
- (_TtC23ShelfKitCollectionViews22FadingDescriptionLabel)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews22FadingDescriptionLabel)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FadingDescriptionLabel

- (_TtC23ShelfKitCollectionViews22FadingDescriptionLabel)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews22FadingDescriptionLabel *)sub_1DEE4C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC23ShelfKitCollectionViews22FadingDescriptionLabel_descriptionLabel));
}

- (CGSize)intrinsicContentSize
{
  [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews22FadingDescriptionLabel_descriptionLabel) intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC23ShelfKitCollectionViews22FadingDescriptionLabel)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DFA8C();
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_1DF3A0();
}

- (void)traitCollectionDidChange:(id)a3
{
  v4 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews22FadingDescriptionLabel_descriptionMask);
  id v5 = a3;
  v6 = self;
  id v7 = [(FadingDescriptionLabel *)v6 traitCollection];
  char v8 = sub_384BF0();

  v9 = (BOOL *)&v4[OBJC_IVAR____TtC23ShelfKitCollectionViews14CornerFadeView_alignment];
  swift_beginAccess();
  BOOL *v9 = (v8 & 1) == 0;
  [v4 setNeedsDisplay];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews22FadingDescriptionLabel_moreButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews22FadingDescriptionLabel_descriptionLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews22FadingDescriptionLabel_descriptionMask);
}

@end