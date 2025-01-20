@interface CarouselAdView
- (CGRect)frame;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (uint64_t)collectionView:(void *)a3 willDisplayCell:(void *)a4 forItemAtIndexPath:;
- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)didMoveToWindow;
- (void)didSelectActionButtonWithSender:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setFrame:(CGRect)a3;
@end

@implementation CarouselAdView

- (uint64_t)collectionView:(void *)a3 willDisplayCell:(void *)a4 forItemAtIndexPath:
{
  uint64_t v7 = sub_1B5DB9AB8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9A88();
  id v11 = a3;
  id v12 = a4;
  id v13 = a1;
  _s17PromotedContentUI14CarouselAdViewC010collectionF0_11willDisplay9forItemAtySo012UICollectionF0C_So0mF4CellC10Foundation9IndexPathVtF_0();

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B5DB9AB8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9A88();
  id v10 = a3;
  id v11 = self;
  CarouselAdView.collectionView(_:didSelectItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)scrollViewDidScroll:(id)a3
{
  v4 = (UIScrollView *)a3;
  v5 = self;
  CarouselAdView.scrollViewDidScroll(_:)(v4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s17PromotedContentUI14CarouselAdViewC010collectionF0_11willDisplay9forItemAtySo012UICollectionF0C_So0mF4CellC10Foundation9IndexPathVtF_0();
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    id v6 = a3;
    uint64_t v7 = self;
    _s17PromotedContentUI14CarouselAdViewC010collectionF0_11willDisplay9forItemAtySo012UICollectionF0C_So0mF4CellC10Foundation9IndexPathVtF_0();
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  id v8 = a3;
  uint64_t v9 = self;
  CarouselAdView.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)(v8, &a5->x, x);
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
}

- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4
{
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1B5DB9AB8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9A88();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  double v15 = sub_1B5D4551C();
  double v17 = v16;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v18 = v15;
  double v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CarouselAdView();
  [(APPCPromotedContentView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  sub_1B5D9A204(x, y, width, height);
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CarouselAdView();
  id v2 = v3.receiver;
  [(CarouselAdView *)&v3 didMoveToWindow];
  _s17PromotedContentUI14CarouselAdViewC010collectionF0_11willDisplay9forItemAtySo012UICollectionF0C_So0mF4CellC10Foundation9IndexPathVtF_0();
}

- (void)didSelectActionButtonWithSender:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1B5DA06BC(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___backgroundCollectionController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___backgroundCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___headlineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___advertiserContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___advertiserLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___logoImageView));
  sub_1B5D08894(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___actionButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation));
  swift_bridgeObjectRelease();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(void **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements))[2];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1B5DB9AB8();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5DB9A88();
  id v10 = a3;
  id v11 = self;
  id v12 = CarouselAdView.collectionView(_:cellForItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

@end