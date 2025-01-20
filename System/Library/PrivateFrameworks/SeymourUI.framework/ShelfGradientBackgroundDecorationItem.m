@interface ShelfGradientBackgroundDecorationItem
- (_TtC9SeymourUI37ShelfGradientBackgroundDecorationItem)initWithCoder:(id)a3;
- (_TtC9SeymourUI37ShelfGradientBackgroundDecorationItem)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ShelfGradientBackgroundDecorationItem

- (_TtC9SeymourUI37ShelfGradientBackgroundDecorationItem)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC9SeymourUI37ShelfGradientBackgroundDecorationItem_layout;
  *(void *)v8 = 0;
  v8[8] = 1;
  *((void *)v8 + 2) = 0;
  v8[24] = 1;
  uint64_t v9 = OBJC_IVAR____TtC9SeymourUI37ShelfGradientBackgroundDecorationItem_gradientLayer;
  id v10 = objc_allocWithZone(MEMORY[0x263F157D0]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_init);

  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for ShelfGradientBackgroundDecorationItem();
  v12 = -[ShelfGradientBackgroundDecorationItem initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  sub_239D10A18();

  return v12;
}

- (_TtC9SeymourUI37ShelfGradientBackgroundDecorationItem)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI37ShelfGradientBackgroundDecorationItem_layout;
  *(void *)v5 = 0;
  v5[8] = 1;
  *((void *)v5 + 2) = 0;
  v5[24] = 1;
  uint64_t v6 = OBJC_IVAR____TtC9SeymourUI37ShelfGradientBackgroundDecorationItem_gradientLayer;
  id v7 = objc_allocWithZone(MEMORY[0x263F157D0]);
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);

  result = (_TtC9SeymourUI37ShelfGradientBackgroundDecorationItem *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_239D108F0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI37ShelfGradientBackgroundDecorationItem_gradientLayer));
}

@end