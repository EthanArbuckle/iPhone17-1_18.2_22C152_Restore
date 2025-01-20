@interface SearchLandingCell
- (BOOL)isAccessibilityElement;
- (NSString)accessibilityLabel;
- (UILabel)accessibilityTitleLabel;
- (_TtC23ShelfKitCollectionViews17SearchLandingCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews17SearchLandingCell)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SearchLandingCell

- (_TtC23ShelfKitCollectionViews17SearchLandingCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews17SearchLandingCell *)sub_1646FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews17SearchLandingCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_166824();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_164DB4(a3);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(SearchLandingCell *)&v4 setIsAccessibilityElement:v3];
}

- (NSString)accessibilityLabel
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews17SearchLandingCell_label);
  BOOL v3 = self;
  id v4 = [v2 text];
  if (v4)
  {
    id v5 = v4;
    sub_3843C0();

    NSString v6 = sub_384380();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setAccessibilityLabel:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_3843C0();
    NSString v6 = self;
    a3 = sub_384380();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(SearchLandingCell *)&v8 setAccessibilityLabel:a3];
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(SearchLandingCell *)&v4 setAccessibilityTraits:a3];
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17SearchLandingCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17SearchLandingCell_label));
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews17SearchLandingCell_model, &qword_4784F8);

  swift_release();
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews17SearchLandingCell_label));
}

@end