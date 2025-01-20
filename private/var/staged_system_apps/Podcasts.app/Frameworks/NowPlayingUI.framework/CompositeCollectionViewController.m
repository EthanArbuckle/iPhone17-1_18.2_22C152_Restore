@interface CompositeCollectionViewController
- (BOOL)_collectionView:(id)a3 canEditItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (_TtC12NowPlayingUI33CompositeCollectionViewController)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI33CompositeCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CompositeCollectionViewController

- (void)dealloc
{
  v2 = self;
  sub_10748();
}

- (void).cxx_destruct
{
  sub_1A608((uint64_t)self + OBJC_IVAR____TtC12NowPlayingUI33CompositeCollectionViewController_scrollViewDelegate);
  swift_release();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI33CompositeCollectionViewController_collectionView);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_10B14(a3, a4);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_10CB8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_134AC();
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_13A94((uint64_t)v6, a4);

  swift_unknownObjectRelease();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_162E0();

  return (int64_t)v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = sub_13F34((uint64_t)v6, a4);

  return (int64_t)v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_126C50();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_126BD0();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_163B0((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = sub_126C50();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1299F0();
  uint64_t v13 = v12;
  sub_126BD0();
  id v14 = a3;
  v15 = self;
  v16 = (void *)sub_16904(v11, v13, (uint64_t)v10);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v16;
}

- (BOOL)collectionView:(id)a3 canMoveItemAtIndexPath:(id)a4
{
  return sub_144C8(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_16EC0);
}

- (void)collectionView:(id)a3 moveItemAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v7 = sub_126C50();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v17 - v12;
  sub_126BD0();
  sub_126BD0();
  id v14 = a3;
  v15 = self;
  sub_17298((uint64_t)v13, v11);

  v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v11, v7);
  v16(v13, v7);
}

- (BOOL)_collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  return sub_144C8(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_17904);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return sub_14710(self, (uint64_t)a2, a3, (uint64_t)a4, (SEL *)&selRef_collectionView_shouldHighlightItemAtIndexPath_);
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_144C8(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_17D10);
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  return sub_14710(self, (uint64_t)a2, a3, (uint64_t)a4, (SEL *)&selRef_collectionView_shouldDeselectItemAtIndexPath_);
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
}

- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4
{
}

- (id)collectionView:(id)a3 targetIndexPathForMoveFromItemAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v7 = sub_126C50();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  id v14 = (char *)&v22 - v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v22 - v15;
  sub_126BD0();
  sub_126BD0();
  id v17 = a3;
  uint64_t v18 = self;
  sub_14B18((uint64_t)v17, v14, (uint64_t)v11, (uint64_t)v16);

  v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v11, v7);
  v19(v14, v7);
  v20.super.isa = sub_126BC0().super.isa;
  v19(v16, v7);

  return v20.super.isa;
}

- (void)scrollViewDidScroll:(id)a3
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = Strong;
    if ([Strong respondsToSelector:"scrollViewDidScroll:"])
    {
      id v7 = a3;
      uint64_t v8 = self;
      [v6 scrollViewDidScroll:v7];
    }
    swift_unknownObjectRelease();
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v11 = Strong;
    if ([Strong respondsToSelector:"scrollViewWillEndDragging:withVelocity:targetContentOffset:"])
    {
      id v12 = a3;
      uint64_t v13 = self;
      [v11 scrollViewWillEndDragging:v12 withVelocity:a5 targetContentOffset:x, y];
    }
    swift_unknownObjectRelease();
  }
}

- (_TtC12NowPlayingUI33CompositeCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1299F0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC12NowPlayingUI33CompositeCollectionViewController *)sub_15A0C(v5, v7, a4);
}

- (_TtC12NowPlayingUI33CompositeCollectionViewController)initWithCoder:(id)a3
{
  return (_TtC12NowPlayingUI33CompositeCollectionViewController *)sub_15BA0(a3);
}

@end