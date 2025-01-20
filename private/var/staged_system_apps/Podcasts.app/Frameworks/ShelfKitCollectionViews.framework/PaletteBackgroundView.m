@interface PaletteBackgroundView
- (_TtC23ShelfKitCollectionViews21PaletteBackgroundView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews21PaletteBackgroundView)initWithEffect:(id)a3;
- (void)layoutSubviews;
@end

@implementation PaletteBackgroundView

- (void)layoutSubviews
{
  v2 = self;
  sub_E22E0();
}

- (_TtC23ShelfKitCollectionViews21PaletteBackgroundView)initWithEffect:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews21PaletteBackgroundView_tintView) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(PaletteBackgroundView *)&v7 initWithEffect:a3];
}

- (_TtC23ShelfKitCollectionViews21PaletteBackgroundView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews21PaletteBackgroundView_tintView) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(PaletteBackgroundView *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21PaletteBackgroundView_tintView));
}

@end