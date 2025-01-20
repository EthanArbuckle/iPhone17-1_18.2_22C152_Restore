@interface ShelfSolidBackgroundDecorationItem
- (_TtC9SeymourUI34ShelfSolidBackgroundDecorationItem)initWithCoder:(id)a3;
- (_TtC9SeymourUI34ShelfSolidBackgroundDecorationItem)initWithFrame:(CGRect)a3;
@end

@implementation ShelfSolidBackgroundDecorationItem

- (_TtC9SeymourUI34ShelfSolidBackgroundDecorationItem)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ShelfSolidBackgroundDecorationItem();
  v7 = -[ShelfSolidBackgroundDecorationItem initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  uint64_t v8 = qword_268A0CF60;
  v9 = v7;
  if (v8 != -1) {
    swift_once();
  }
  [(ShelfSolidBackgroundDecorationItem *)v9 setBackgroundColor:qword_268A49670];

  return v9;
}

- (_TtC9SeymourUI34ShelfSolidBackgroundDecorationItem)initWithCoder:(id)a3
{
  result = (_TtC9SeymourUI34ShelfSolidBackgroundDecorationItem *)sub_23A800DD8();
  __break(1u);
  return result;
}

@end