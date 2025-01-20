@interface PosterCollectionViewCell
- (BOOL)_descendantsShouldHighlight;
- (_TtC11PosterBoard24PosterCollectionViewCell)initWithCoder:(id)a3;
- (_TtC11PosterBoard24PosterCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation PosterCollectionViewCell

- (BOOL)_descendantsShouldHighlight
{
  return 0;
}

- (_TtC11PosterBoard24PosterCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard24PosterCollectionViewCell_posterCornerRadius) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC11PosterBoard24PosterCollectionViewCell_layoutMode;
  *(void *)v7 = 0;
  v7[8] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard24PosterCollectionViewCell_scaleInAlongsideLayoutMode) = (Class)0x3FF0000000000000;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for PosterCollectionViewCell();
  v8 = -[PosterCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v9 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v8->super.super.super.super.super.isa) + 0xC8);
  v10 = v8;
  v9();

  return v10;
}

- (_TtC11PosterBoard24PosterCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC11PosterBoard24PosterCollectionViewCell *)sub_1D330F38C(a3);
}

@end