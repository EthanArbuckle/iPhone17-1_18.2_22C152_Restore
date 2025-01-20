@interface LabelCell
- (_TtC23ShelfKitCollectionViews9LabelCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews9LabelCell)initWithFrame:(CGRect)a3;
@end

@implementation LabelCell

- (_TtC23ShelfKitCollectionViews9LabelCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews9LabelCell_objectGraph) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LabelCell();
  return -[LabelCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews9LabelCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews9LabelCell_objectGraph) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LabelCell();
  return [(LabelCell *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end