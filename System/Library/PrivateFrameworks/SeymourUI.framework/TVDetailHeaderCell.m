@interface TVDetailHeaderCell
- (BOOL)canBecomeFocused;
- (NSArray)accessibilityMediaTags;
- (UILabel)accessibilityCaptionTagsLabel;
- (UITextView)accessibilityDescriptionLabel;
- (UITextView)accessibilityTraitsLabel;
- (_TtC9SeymourUI18TVDetailHeaderCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI18TVDetailHeaderCell)initWithFrame:(CGRect)a3;
- (void)handleTappedButton:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessibilityMediaTags:(id)a3;
@end

@implementation TVDetailHeaderCell

- (BOOL)canBecomeFocused
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_buttonStackView);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_arrangedSubviews);
  sub_239C24FF0(0, (unint64_t *)&qword_268A0EBE0);
  unint64_t v5 = sub_23A7FFC78();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_23A800DF8();

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v6 == 0;
}

- (_TtC9SeymourUI18TVDetailHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI18TVDetailHeaderCell *)sub_239FC01D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI18TVDetailHeaderCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239FC34A8();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_239FC11CC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_239FC1378();
}

- (void)handleTappedButton:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self;
  sub_239FC239C((uint64_t)v4);
}

- (UITextView)accessibilityDescriptionLabel
{
  return (UITextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                               + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_descriptionTextView));
}

- (UITextView)accessibilityTraitsLabel
{
  return (UITextView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                               + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_traitsTextView));
}

- (UILabel)accessibilityCaptionTagsLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_captionTagsLabel));
}

- (NSArray)accessibilityMediaTags
{
  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_accessibilityMediaTags))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_23A7FFC58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSArray *)v2;
}

- (void)setAccessibilityMediaTags:(id)a3
{
  if (a3) {
    id v4 = (objc_class *)sub_23A7FFC78();
  }
  else {
    id v4 = 0;
  }
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_accessibilityMediaTags) = v4;

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_delegate);
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_itemInfo, &qword_268A0E7E0);
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_onElementAppearance));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_onElementDisappearance));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_onVisibleBoundsChange));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_onImpressionableBoundsChange));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_buttonStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_descriptionStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_descriptionTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_traitsTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_captionTagsLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_focusContainerGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18TVDetailHeaderCell_traitsWidthConstraint));

  swift_bridgeObjectRelease();
}

@end