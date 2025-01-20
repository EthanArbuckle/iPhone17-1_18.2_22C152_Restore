@interface PosterRackCollectionView
- (_TtC11PosterBoard24PosterRackCollectionView)initWithCoder:(id)a3;
- (_TtC11PosterBoard24PosterRackCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation PosterRackCollectionView

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1D331C8BC();
  sub_1D331C8FC();
  uint64_t v6 = sub_1D3372478();
  id v7 = a4;
  v8 = self;
  sub_1D331C434(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (_TtC11PosterBoard24PosterRackCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC11PosterBoard24PosterRackCollectionView_posterRackDelegate) = 0;
  swift_unknownObjectWeakInit();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PosterRackCollectionView();
  return -[PosterRackCollectionView initWithFrame:collectionViewLayout:](&v11, sel_initWithFrame_collectionViewLayout_, a4, x, y, width, height);
}

- (_TtC11PosterBoard24PosterRackCollectionView)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC11PosterBoard24PosterRackCollectionView_posterRackDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PosterRackCollectionView();
  return [(PosterRackCollectionView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end