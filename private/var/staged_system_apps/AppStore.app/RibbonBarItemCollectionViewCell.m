@interface RibbonBarItemCollectionViewCell
- (BOOL)isAccessibilityElement;
- (_TtC8AppStore31RibbonBarItemCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore31RibbonBarItemCollectionViewCell)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
@end

@implementation RibbonBarItemCollectionViewCell

- (_TtC8AppStore31RibbonBarItemCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31RibbonBarItemCollectionViewCell *)sub_1006F74EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31RibbonBarItemCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006F9848();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006F7DB4();
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
  [(RibbonBarItemCollectionViewCell *)&v4 setIsAccessibilityElement:v3];
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(RibbonBarItemCollectionViewCell *)&v4 setAccessibilityTraits:a3];
}

- (void).cxx_destruct
{
  sub_1000A1D30((uint64_t)self + OBJC_IVAR____TtC8AppStore31RibbonBarItemCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31RibbonBarItemCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31RibbonBarItemCollectionViewCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31RibbonBarItemCollectionViewCell_roundedCornerView));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore31RibbonBarItemCollectionViewCell_artworkView);
}

@end