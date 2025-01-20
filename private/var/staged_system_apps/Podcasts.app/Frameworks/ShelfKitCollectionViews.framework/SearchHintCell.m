@interface SearchHintCell
- (_TtC23ShelfKitCollectionViews14SearchHintCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews14SearchHintCell)initWithFrame:(CGRect)a3;
@end

@implementation SearchHintCell

- (_TtC23ShelfKitCollectionViews14SearchHintCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews14SearchHintCell_objectGraph) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[SearchHintCell initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews14SearchHintCell)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews14SearchHintCell_objectGraph) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(SearchHintCell *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end