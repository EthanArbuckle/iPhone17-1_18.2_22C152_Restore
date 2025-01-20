@interface PowerSwooshCell
- (_TtC23ShelfKitCollectionViews15PowerSwooshCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews15PowerSwooshCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PowerSwooshCell

- (_TtC23ShelfKitCollectionViews15PowerSwooshCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews15PowerSwooshCell *)sub_185D10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews15PowerSwooshCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1870F8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_186558();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15PowerSwooshCell_background));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15PowerSwooshCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15PowerSwooshCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15PowerSwooshCell_chinBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15PowerSwooshCell_textStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews15PowerSwooshCell_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews15PowerSwooshCell_subtitleLabel);
}

@end