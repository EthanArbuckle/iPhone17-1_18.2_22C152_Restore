@interface DynamicContextMenuButton
- (CGSize)intrinsicContentSize;
- (UIButton)accessibilityButton;
- (UIColor)tintColor;
- (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)setTintColor:(id)a3;
@end

@implementation DynamicContextMenuButton

- (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton *)sub_2C32F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)intrinsicContentSize
{
  [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews24DynamicContextMenuButton_button) intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2C3DB8();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v8 = self;
  v9 = (void *)sub_2C3EA8(x, y);

  return v9;
}

- (UIColor)tintColor
{
  id v2 = [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews24DynamicContextMenuButton_button) tintColor];

  return (UIColor *)v2;
}

- (void)setTintColor:(id)a3
{
}

- (UIButton)accessibilityButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC23ShelfKitCollectionViews24DynamicContextMenuButton_button));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews24DynamicContextMenuButton_button));
  sub_154940((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews24DynamicContextMenuButton_configProvider);
  sub_24F174((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews24DynamicContextMenuButton_glyph);

  swift_release();
}

@end