@interface CornerFadeView
- (_TtC23ShelfKitCollectionViews14CornerFadeView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews14CornerFadeView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation CornerFadeView

- (void)drawRect:(CGRect)a3
{
  v3 = self;
  sub_DAEA8();
}

- (_TtC23ShelfKitCollectionViews14CornerFadeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14CornerFadeView_alignment) = 1;
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews14CornerFadeView_safetyCutoutSize);
  void *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14CornerFadeView_fadeLength) = 0;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for CornerFadeView();
  v8 = -[CornerFadeView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  v9 = self;
  v10 = v8;
  id v11 = [v9 clearColor];
  [(CornerFadeView *)v10 setBackgroundColor:v11];

  return v10;
}

- (_TtC23ShelfKitCollectionViews14CornerFadeView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14CornerFadeView_alignment) = 1;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews14CornerFadeView_safetyCutoutSize);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14CornerFadeView_fadeLength) = 0;
  id v5 = a3;

  result = (_TtC23ShelfKitCollectionViews14CornerFadeView *)sub_385890();
  __break(1u);
  return result;
}

@end