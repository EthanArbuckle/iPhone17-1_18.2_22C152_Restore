@interface SizeClassAutoMarginView
- (_TtC23ShelfKitCollectionViews23SizeClassAutoMarginView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews23SizeClassAutoMarginView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SizeClassAutoMarginView

- (void)layoutSubviews
{
  v2 = self;
  sub_EDF64();
}

- (_TtC23ShelfKitCollectionViews23SizeClassAutoMarginView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews23SizeClassAutoMarginView_totalWidth) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SizeClassAutoMarginView();
  return -[SizeClassAutoMarginView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews23SizeClassAutoMarginView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews23SizeClassAutoMarginView_totalWidth) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SizeClassAutoMarginView();
  return [(SizeClassAutoMarginView *)&v5 initWithCoder:a3];
}

@end