@interface ShelfBackgroundView
- (_TtC23ShelfKitCollectionViews19ShelfBackgroundView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews19ShelfBackgroundView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
@end

@implementation ShelfBackgroundView

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1045F8(v4);
}

- (_TtC23ShelfKitCollectionViews19ShelfBackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews19ShelfBackgroundView_backgroundFill) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews19ShelfBackgroundView_background;
  *(_DWORD *)v7 = 0;
  *((_WORD *)v7 + 2) = 256;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ShelfBackgroundView();
  return -[ShelfBackgroundView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews19ShelfBackgroundView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews19ShelfBackgroundView_backgroundFill) = 0;
  id v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews19ShelfBackgroundView_background;
  *(_DWORD *)id v4 = 0;
  *((_WORD *)v4 + 2) = 256;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ShelfBackgroundView();
  return [(ShelfBackgroundView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews19ShelfBackgroundView_backgroundFill));
}

@end