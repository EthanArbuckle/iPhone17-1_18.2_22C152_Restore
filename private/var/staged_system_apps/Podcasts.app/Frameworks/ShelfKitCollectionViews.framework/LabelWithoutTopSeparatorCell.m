@interface LabelWithoutTopSeparatorCell
- (_TtC23ShelfKitCollectionViews28LabelWithoutTopSeparatorCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews28LabelWithoutTopSeparatorCell)initWithFrame:(CGRect)a3;
@end

@implementation LabelWithoutTopSeparatorCell

- (_TtC23ShelfKitCollectionViews28LabelWithoutTopSeparatorCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LabelWithoutTopSeparatorCell();
  return -[LabelCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews28LabelWithoutTopSeparatorCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LabelWithoutTopSeparatorCell();
  return [(LabelCell *)&v5 initWithCoder:a3];
}

@end