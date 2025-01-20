@interface SidebarHeaderCell
- (_TtC23ShelfKitCollectionViews17SidebarHeaderCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews17SidebarHeaderCell)initWithFrame:(CGRect)a3;
@end

@implementation SidebarHeaderCell

- (_TtC23ShelfKitCollectionViews17SidebarHeaderCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SidebarHeaderCell();
  return -[SidebarHeaderCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews17SidebarHeaderCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SidebarHeaderCell();
  return [(SidebarHeaderCell *)&v5 initWithCoder:a3];
}

@end