@interface MultiCollectionViewDelegate
- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5;
- (BOOL)collectionView:(id)a3 shouldUpdateFocusInContext:(id)a4;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4;
- (_TtC5TeaUI27MultiCollectionViewDelegate)init;
- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4;
- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6;
- (id)collectionView:(id)a3 transitionLayoutForOldLayout:(id)a4 newLayout:(id)a5;
- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3;
- (id)viewForZoomingInScrollView:(id)a3;
- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3;
- (void)scrollViewDidChangeAdjustedContentInset:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewDidZoom:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation MultiCollectionViewDelegate

- (BOOL)respondsToSelector:(SEL)a3
{
  v4 = self;
  LOBYTE(a3) = MultiCollectionViewDelegate.responds(to:)((uint64_t)a3);

  return a3 & 1;
}

- (_TtC5TeaUI27MultiCollectionViewDelegate)init
{
  return (_TtC5TeaUI27MultiCollectionViewDelegate *)MultiCollectionViewDelegate.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5TeaUI27MultiCollectionViewDelegate_delegates);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return sub_1B60DE718();
}

- (void)collectionViewDidEndMultipleSelectionInteraction:(id)a3
{
  v4 = (UICollectionView *)a3;
  v5 = self;
  MultiCollectionViewDelegate.collectionViewDidEndMultipleSelectionInteraction(_:)(v4);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
}

- (void)collectionView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
}

- (BOOL)collectionView:(id)a3 canEditItemAtIndexPath:(id)a4
{
  return sub_1B60DE718();
}

- (BOOL)collectionView:(id)a3 canFocusItemAtIndexPath:(id)a4
{
  return sub_1B60DE718();
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return sub_1B60DE718();
}

- (BOOL)collectionView:(id)a3 shouldDeselectItemAtIndexPath:(id)a4
{
  return sub_1B60DE718();
}

- (BOOL)collectionView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  return sub_1B60DE718();
}

- (BOOL)collectionView:(id)a3 shouldUpdateFocusInContext:(id)a4
{
  v6 = (UICollectionView *)a3;
  id v7 = a4;
  v8 = self;
  Swift::Bool v9 = MultiCollectionViewDelegate.collectionView(_:shouldUpdateFocusIn:)(v6, (UICollectionViewFocusUpdateContext)v7);

  return v9;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v7 = (UICollectionView *)a3;
  v8 = self;
  CGPoint v9 = MultiCollectionViewDelegate.collectionView(_:targetContentOffsetForProposedContentOffset:)(v7, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));

  double v10 = v9.x;
  double v11 = v9.y;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (void)collectionView:(id)a3 willDisplayContextMenuWithConfiguration:(id)a4 animator:(id)a5
{
}

- (void)collectionView:(id)a3 willEndContextMenuInteractionWithConfiguration:(id)a4 animator:(id)a5
{
}

- (id)collectionView:(id)a3 previewForDismissingContextMenuWithConfiguration:(id)a4
{
  v6 = (UICollectionView *)a3;
  id v7 = a4;
  v8 = self;
  CGPoint v9 = (void *)MultiCollectionViewDelegate.collectionView(_:previewForDismissingContextMenuWithConfiguration:)(v6, (UIContextMenuConfiguration)v7);

  return v9;
}

- (id)collectionView:(id)a3 previewForHighlightingContextMenuWithConfiguration:(id)a4
{
  v6 = (UICollectionView *)a3;
  id v7 = a4;
  v8 = self;
  CGPoint v9 = (void *)MultiCollectionViewDelegate.collectionView(_:previewForHighlightingContextMenuWithConfiguration:)(v6, (UIContextMenuConfiguration)v7);

  return v9;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  v8 = (UICollectionView *)a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = self;
  MultiCollectionViewDelegate.collectionView(_:didUpdateFocusIn:with:)(v8, (UICollectionViewFocusUpdateContext)v9, (UIFocusAnimationCoordinator)v10);
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  MultiCollectionViewDelegate.collectionView(_:willPerformPreviewActionForMenuWith:animator:)(v8, v9, (uint64_t)a5);

  swift_unknownObjectRelease();
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7 = sub_1B61AFCB0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B61AFC40();
  id v11 = a3;
  v12 = self;
  id v13 = MultiCollectionViewDelegate.collectionView(_:contextMenuConfigurationForItemAt:point:)();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (BOOL)collectionView:(id)a3 shouldSpringLoadItemAtIndexPath:(id)a4 withContext:(id)a5
{
  uint64_t v7 = sub_1B61AFCB0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B61AFC40();
  id v11 = a3;
  swift_unknownObjectRetain();
  v12 = self;
  LOBYTE(self) = MultiCollectionViewDelegate.collectionView(_:shouldSpringLoadItemAt:with:)((uint64_t)v11, (uint64_t)v10);

  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return self & 1;
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  v26 = self;
  uint64_t v7 = sub_1B61AFCB0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v11);
  id v13 = (char *)&v25 - v12;
  MEMORY[0x1F4188790](v14);
  v16 = (char *)&v25 - v15;
  MEMORY[0x1F4188790](v17);
  v19 = (char *)&v25 - v18;
  sub_1B61AFC40();
  sub_1B61AFC40();
  sub_1B61AFC40();
  id v20 = a3;
  v21 = v26;
  MultiCollectionViewDelegate.collectionView(_:targetIndexPathForMoveOfItemFromOriginalIndexPath:atCurrentIndexPath:toProposedIndexPath:)((uint64_t)v10, (uint64_t)v19);

  v22 = *(void (**)(char *, uint64_t))(v8 + 8);
  v22(v10, v7);
  v22(v13, v7);
  v22(v16, v7);
  v23 = (void *)sub_1B61AFC00();
  v22(v19, v7);
  return v23;
}

- (id)collectionView:(id)a3 transitionLayoutForOldLayout:(id)a4 newLayout:(id)a5
{
  uint64_t v8 = (UICollectionView *)a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = self;
  v12.super.super.isa = MultiCollectionViewDelegate.collectionView(_:transitionLayoutForOldLayout:newLayout:)(v8, (UICollectionViewLayout)v9, (UICollectionViewLayout)v10).super.super.isa;

  return v12.super.super.isa;
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  sub_1B5E81E54();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = a3;
  id v9 = self;
  MultiCollectionViewDelegate.indexPathForPreferredFocusedView(in:)(v8, (uint64_t)v7);

  uint64_t v10 = sub_1B61AFCB0();
  uint64_t v11 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v10) != 1)
  {
    uint64_t v11 = (void *)sub_1B61AFC00();
    (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v7, v10);
  }
  return v11;
}

- (id)viewForZoomingInScrollView:(id)a3
{
  v4 = (UIScrollView *)a3;
  uint64_t v5 = self;
  MultiCollectionViewDelegate.viewForZooming(in:)(v6, v4);
  id v8 = v7;

  return v8;
}

- (void)scrollViewDidZoom:(id)a3
{
  v4 = (UIScrollView *)a3;
  uint64_t v5 = self;
  MultiCollectionViewDelegate.scrollViewDidZoom(_:)(v4);
}

- (void)scrollViewDidScroll:(id)a3
{
  v4 = (UIScrollView *)a3;
  uint64_t v5 = self;
  MultiCollectionViewDelegate.scrollViewDidScroll(_:)(v4);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  v4 = (UIScrollView *)a3;
  uint64_t v5 = self;
  MultiCollectionViewDelegate.scrollViewWillBeginDragging(_:)(v4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  v4 = (UIScrollView *)a3;
  uint64_t v5 = self;
  MultiCollectionViewDelegate.scrollViewDidEndDecelerating(_:)(v4);
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  v4 = (UIScrollView *)a3;
  uint64_t v5 = self;
  MultiCollectionViewDelegate.scrollViewWillBeginDecelerating(_:)(v4);
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  v4 = (UIScrollView *)a3;
  uint64_t v5 = self;
  MultiCollectionViewDelegate.scrollViewDidScrollToTop(_:)(v4);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  v4 = (UIScrollView *)a3;
  uint64_t v5 = self;
  MultiCollectionViewDelegate.scrollViewDidEndScrollingAnimation(_:)(v4);
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  v4 = (UIScrollView *)a3;
  uint64_t v5 = self;
  MultiCollectionViewDelegate.scrollViewDidChangeAdjustedContentInset(_:)(v4);
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  v4 = (UIScrollView *)a3;
  uint64_t v5 = self;
  LOBYTE(self) = MultiCollectionViewDelegate.scrollViewShouldScrollToTop(_:)(v4);

  return self & 1;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  uint64_t v6 = (UIScrollView *)a3;
  id v7 = a4;
  id v8 = self;
  MultiCollectionViewDelegate.scrollViewWillBeginZooming(_:with:)(v6, (UIView_optional *)a4);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  uint64_t v6 = (UIScrollView *)a3;
  id v7 = self;
  MultiCollectionViewDelegate.scrollViewDidEndDragging(_:willDecelerate:)(v6, a4);
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  MultiCollectionViewDelegate.scrollViewDidEndZooming(_:with:atScale:)(v8, a4, a5);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  uint64_t v10 = self;
  MultiCollectionViewDelegate.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)(v9, (uint64_t)a5, x, y);
}

@end