@interface CarouselBackgroundCollectionController
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (_TtC17PromotedContentUI38CarouselBackgroundCollectionController)init;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
@end

@implementation CarouselBackgroundCollectionController

- (_TtC17PromotedContentUI38CarouselBackgroundCollectionController)init
{
  result = (_TtC17PromotedContentUI38CarouselBackgroundCollectionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI38CarouselBackgroundCollectionController_elements))[2];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B5DB9AB8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9A88();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_1B5CF9134(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v6 = sub_1B5DB9AB8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9A88();
  double v10 = *(double *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17PromotedContentUI38CarouselBackgroundCollectionController_contentSize);
  double v11 = 0.0;
  double v12 = 0.0;
  if (v10 != 0.0)
  {
    double v11 = v10
        / (double)(*(uint64_t **)((char *)&self->super.isa
                               + OBJC_IVAR____TtC17PromotedContentUI38CarouselBackgroundCollectionController_elements))[2];
    double v12 = *(double *)&self->elements[OBJC_IVAR____TtC17PromotedContentUI38CarouselBackgroundCollectionController_contentSize];
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  double v13 = v11;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

@end