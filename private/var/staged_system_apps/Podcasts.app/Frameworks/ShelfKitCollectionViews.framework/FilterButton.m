@interface FilterButton
- (BOOL)_supportsMacIdiom;
- (_TtC23ShelfKitCollectionViews12FilterButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews12FilterButton)initWithFrame:(CGRect)a3;
- (void)didHover:(id)a3;
- (void)updateConfiguration;
@end

@implementation FilterButton

- (_TtC23ShelfKitCollectionViews12FilterButton)initWithFrame:(CGRect)a3
{
  sub_292580(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC23ShelfKitCollectionViews12FilterButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews12FilterButton_hoverRecognizer) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews12FilterButton_isHovering) = 0;
  id v4 = a3;

  result = (_TtC23ShelfKitCollectionViews12FilterButton *)sub_385890();
  __break(1u);
  return result;
}

- (void)updateConfiguration
{
  v2 = self;
  sub_292AE0();
}

- (BOOL)_supportsMacIdiom
{
  return 0;
}

- (void)didHover:(id)a3
{
  id v4 = a3;
  v6 = self;
  v5 = (char *)[v4 state];
  if ((unint64_t)(v5 - 1) <= 3) {
    *((unsigned char *)&v6->super.super.super.super.super.isa
  }
    + OBJC_IVAR____TtC23ShelfKitCollectionViews12FilterButton_isHovering) = 0x101u >> (8 * ((_BYTE)v5 - 1));
  sub_292AE0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews12FilterButton_hoverRecognizer));
}

@end