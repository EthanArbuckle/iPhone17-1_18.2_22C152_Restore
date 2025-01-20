@interface BaseCollectionView
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (_TtC8VideosUI18BaseCollectionView)initWithCoder:(id)a3;
- (_TtC8VideosUI18BaseCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5;
- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation BaseCollectionView

- (_TtC8VideosUI18BaseCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  OUTLINED_FUNCTION_1_0();
  id v5 = v4;
  OUTLINED_FUNCTION_3();
  return (_TtC8VideosUI18BaseCollectionView *)sub_1E2F6A9EC(v6);
}

- (_TtC8VideosUI18BaseCollectionView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI18BaseCollectionView *)sub_1E2F6AAC4(a3);
}

- (void).cxx_destruct
{
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI18BaseCollectionView_vuiDelegate);
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI18BaseCollectionView_vuiScrollDelegate);
  v3 = (char *)self + OBJC_IVAR____TtC8VideosUI18BaseCollectionView_vuiContextMenuDelegate;
  sub_1E2F6ABF0((uint64_t)v3);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v10 = OUTLINED_FUNCTION_3_243();
  OUTLINED_FUNCTION_0_4();
  uint64_t v12 = v11;
  MEMORY[0x1F4188790](v13);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E387C928();
  sub_1E3876448();
  id v16 = v7;
  id v17 = v6;
  id v18 = v8;
  uint64_t v19 = OUTLINED_FUNCTION_8_191();
  sub_1E3789A40(v19, v20);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = OUTLINED_FUNCTION_8_44();
  OUTLINED_FUNCTION_0_4();
  uint64_t v8 = v7;
  MEMORY[0x1F4188790](v9);
  OUTLINED_FUNCTION_31();
  uint64_t v12 = v11 - v10;
  sub_1E3876448();
  id v13 = v4;
  id v14 = v5;
  sub_1E3789DBC((uint64_t)v13);

  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v12, v6);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E378A008((uint64_t)v4, (SEL *)&selRef_vuiScrollViewDidScroll_);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E378A008((uint64_t)v4, (SEL *)&selRef_vuiScrollViewDidEndScrollingAnimation_);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E378A008((uint64_t)v4, (SEL *)&selRef_vuiScrollViewDidEndDecelerating_);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1E378A10C((uint64_t)v6, a4);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  OUTLINED_FUNCTION_5_1();
  id v6 = v5;
  id v8 = v7;
  id v9 = v6;
  OUTLINED_FUNCTION_11_2();
  sub_1E378A218();
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1E378A34C((uint64_t)v4);

  return self & 1;
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 highlightPreviewForItemAtIndexPath:(id)a5
{
  return sub_1E378A4F4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (SEL *)&selRef_vuiCollectionView_previewForHighlightingContextMenuWithConfiguration_);
}

- (id)collectionView:(id)a3 contextMenuConfiguration:(id)a4 dismissalPreviewForItemAtIndexPath:(id)a5
{
  return sub_1E378A4F4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (SEL *)&selRef_vuiCollectionView_previewForDismissingContextMenuWithConfiguration_);
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_8_44();
  sub_1E387CC98();
  id v7 = v5;
  id v8 = v6;
  OUTLINED_FUNCTION_11_2();
  id v9 = sub_1E378A5BC();

  swift_bridgeObjectRelease();
  return v9;
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  id v9 = self;
  OUTLINED_FUNCTION_4_218();
  sub_1E378A9AC();

  swift_unknownObjectRelease();
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  id v9 = self;
  OUTLINED_FUNCTION_4_218();
  sub_1E378AAC4();

  swift_unknownObjectRelease();
}

- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  sub_1E378ABDC();

  swift_unknownObjectRelease();
}

@end