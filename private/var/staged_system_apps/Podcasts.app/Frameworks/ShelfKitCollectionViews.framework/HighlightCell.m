@interface HighlightCell
- (_TtC23ShelfKitCollectionViews13HighlightCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews13HighlightCell)initWithFrame:(CGRect)a3;
@end

@implementation HighlightCell

- (_TtC23ShelfKitCollectionViews13HighlightCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC23ShelfKitCollectionViews13HighlightCell_highlightView;
  id v10 = objc_allocWithZone((Class)SLAttributionView);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v9) = (Class)[v10 init];
  *(Class *)((char *)&v11->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews13HighlightCell_objectGraph) = 0;

  v13.receiver = v11;
  v13.super_class = ObjectType;
  return -[HighlightCell initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews13HighlightCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_140FDC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13HighlightCell_highlightView));

  swift_release();
}

@end